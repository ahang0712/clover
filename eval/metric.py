def compute_tp_fp_fn(pred_tuples, gold_tuples):
    """
    Args:
        pred_tuples: set or list of (sharedVariable, lineNumber, accessType)
        gold_tuples: set or list of (sharedVariable, lineNumber, accessType)
    Returns:
        (tp, fp, fn)
    """
    pred_set = set(pred_tuples)
    gold_set = set(gold_tuples)
    tp = len(pred_set & gold_set)
    fp = len(pred_set - gold_set)
    fn = len(gold_set - pred_set)
    return tp, fp, fn

def compute_metrics(pred_tuples, gold_tuples):
    """
    Returns:
        (tp, fp, fn, precision, recall, f1)
    """
    tp, fp, fn = compute_tp_fp_fn(pred_tuples, gold_tuples)
    precision = tp / (tp + fp) if (tp + fp) > 0 else 0.0
    recall = tp / (tp + fn) if (tp + fn) > 0 else 0.0
    f1 = 2 * precision * recall / (precision + recall) if (precision + recall) > 0 else 0.0
    return tp, fp, fn, precision, recall, f1
