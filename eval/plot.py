import matplotlib.pyplot as plt
import csv

def plot_pr_curve(csv_path, save_path=None):
    recalls = []
    precisions = []
    f1s = []
    names = []
    with open(csv_path, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row['file'] == "Total":
                continue
            names.append(row['file'])
            precisions.append(float(row['Precision']))
            recalls.append(float(row['Recall']))
            f1s.append(float(row['F1']))

    plt.figure(figsize=(7,5))
    plt.plot(recalls, precisions, 'o-', label="PR")
    for i, txt in enumerate(names):
        plt.annotate(txt, (recalls[i], precisions[i]), fontsize=7, alpha=0.5)
    plt.xlabel('Recall')
    plt.ylabel('Precision')
    plt.title('Precision-Recall Curve (per file)')
    plt.grid(True)
    plt.legend()
    if save_path:
        plt.savefig(save_path, dpi=150)
        print(f"Saved PR curve to {save_path}")
    plt.show()

def plot_f1_bar(csv_path, save_path=None):
    names = []
    f1s = []
    with open(csv_path, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row['file'] == "Total":
                continue
            names.append(row['file'])
            f1s.append(float(row['F1']))
    plt.figure(figsize=(max(8, len(names)//2),5))
    plt.bar(names, f1s)
    plt.ylabel('F1-score')
    plt.title('F1-score per file')
    plt.xticks(rotation=45, ha="right")
    plt.tight_layout()
    if save_path:
        plt.savefig(save_path, dpi=150)
        print(f"Saved F1 bar to {save_path}")
    plt.show()

if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python plot.py <eval.csv>")
    else:
        csv_file = sys.argv[1]
        plot_pr_curve(csv_file)
        plot_f1_bar(csv_file)
