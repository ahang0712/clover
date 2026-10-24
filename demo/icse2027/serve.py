#!/usr/bin/env python3
"""Serve the review companion and execute Clover's unmodified highlighter fixture."""
import argparse
import contextlib
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
import importlib.util
import io
import json
from pathlib import Path
import tempfile

ROOT = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("clover_highlighter", ROOT / "vendor/pattern.py")
highlighter = importlib.util.module_from_spec(spec)
spec.loader.exec_module(highlighter)


def run_highlighter():
    with tempfile.TemporaryDirectory(prefix="clover-highlight-") as folder:
        target = Path(folder) / "result.json"
        # This is the repository's existing Python implementation, not a mock.
        with contextlib.redirect_stdout(io.StringIO()):
            result = highlighter.detect_defects(str(ROOT / "examples/highlight-input.json"), str(target))
        if not target.exists() or result.get("status") != "success":
            raise RuntimeError("The public highlighter did not produce a successful result.")
        data = json.loads(target.read_text())
    return {"execution": "live", "scope": "Defect Highlighter on stored operation records; no LLM call",
            "source_commit": "3addd87b41729d5f7d5466adf5b9383abe001db1",
            "verified_against_fixture": data == json.loads((ROOT / "examples/highlight-expected.json").read_text()),
            "result": data}


class Handler(SimpleHTTPRequestHandler):
    def do_POST(self):
        if self.path != "/api/run-highlight":
            self.send_error(404)
            return
        try:
            data = run_highlighter()
            body = json.dumps(data, indent=2).encode()
            self.send_response(200)
        except Exception as exc:
            body = json.dumps({"error": str(exc)}).encode()
            self.send_response(500)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Cache-Control", "no-store")
        self.end_headers()
        self.wfile.write(body)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--port", type=int, default=8765)
    parser.add_argument("--check", action="store_true", help="Execute the fixture and compare with the published expected result")
    args = parser.parse_args()
    if args.check:
        actual = run_highlighter()
        expected = json.loads((ROOT / "examples/highlight-expected.json").read_text())
        if actual["result"] != expected:
            raise SystemExit("FAIL: highlighter result differs from the repository fixture")
        print(json.dumps(actual, indent=2))
        print("PASS: live highlighter output matches the repository fixture")
        return
    server = ThreadingHTTPServer(("127.0.0.1", args.port), partial(Handler, directory=str(ROOT)))
    print(f"Clover review companion: http://127.0.0.1:{args.port}", flush=True)
    print("Walkthrough: documented replay. Highlighter tab: actual local execution. No API key needed.", flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
