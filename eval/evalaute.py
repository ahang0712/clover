import os
import json
import sys
from metric import compute_metrics

def extract_tuples(json_path):
    """
    Extract set of (sharedVariable, lineNumber, accessType) tuples from a JSON report.
    """
    if not os.path.exists(json_path):
        return set()
    try:
        with open(json_path, "r", encoding="utf-8") as f:
            data = json.load(f)
    except Exception:
        return set()
    tuples = set()
    for v in data.get("violations", []):
        var = v.get("sharedVariable")
        for detail in v.get("details", []):
            line = detail.get("lineNumber")
            access = detail.get("accessType")
            if var and line and access:
                tuples.add((var, str(line), access))
    return tuples

def evaluate(result_dir, gold_dir, save_csv=None):
    files = sorted([f for f in os.listdir(result_dir) if f.endswith('.json')])
    total_tp, total_fp, total_fn = 0, 0, 0
    rows = []
    for fname in files:
        result_path = os.path.join(result_dir, fname)
        gold_path = os.path.join(gold_dir, fname)
        pred = extract_tuples(result_path)
        gold = extract_tuples(gold_path)
        tp, fp, fn, p, r, f1 = compute_metrics(pred, gold)
        total_tp += tp
        total_fp += fp
        total_fn += fn
        print(f"{fname}\tTP: {tp}\tFP: {fp}\tFN: {fn}\tP: {p:.2f}\tR: {r:.2f}\tF1: {f1:.2f}")
        rows.append([fname, tp, fp, fn, p, r, f1])
    # 全局统计
    global_p = total_tp / (total_tp + total_fp) if (total_tp + total_fp) > 0 else 0
    global_r = total_tp / (total_tp + total_fn) if (total_tp + total_fn) > 0 else 0
    global_f1 = 2 * global_p * global_r / (global_p + global_r) if (global_p + global_r) > 0 else 0
    print("\n======== Summary ========")
    print(f"Total TP: {total_tp}, FP: {total_fp}, FN: {total_fn}")
    print(f"Precision: {global_p:.3f}")
    print(f"Recall:    {global_r:.3f}")
    print(f"F1-score:  {global_f1:.3f}")
    if save_csv:
        import csv
        with open(save_csv, "w", encoding="utf-8", newline='') as f:
            writer = csv.writer(f)
            writer.writerow(['file', 'TP', 'FP', 'FN', 'Precision', 'Recall', 'F1'])
            writer.writerows(rows)
            writer.writerow(["Total", total_tp, total_fp, total_fn, global_p, global_r, global_f1])

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python evaluate.py <result_dir> <gold_dir> [output_csv]")
        print("e.g.: python evaluate.py ../results/ai/ ./gold/ eval.csv")
    else:
        out_csv = sys.argv[3] if len(sys.argv) > 3 else None
        evaluate(sys.argv[1], sys.argv[2], save_csv=out_csv)
