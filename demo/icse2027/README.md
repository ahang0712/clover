# Clover demonstration companion

This package accompanies the ICSE 2027 Tool Demonstration submission. It makes the documented example inspectable and runs one existing Clover component without an API key or a compiler build.

## Start in one command

Requires Python 3.9 or later. No pip packages are needed.

```sh
python3 serve.py
```

Open **http://127.0.0.1:8765**. The server binds only to the local machine. Press Ctrl+C to stop it. Choose another port with `python3 serve.py --port 8766` if needed.

You can also open `index.html` directly to explore the documented walkthrough. The **Live highlighter** button requires the Python server.

## What you can do

1. Inspect the example's shared variable, priorities, and interrupt switches.
2. Select a candidate to highlight its three source locations.
3. Follow the documented seven → five → two candidate refinement.
4. Export a JSON report with an explicit provenance label.
5. Run the public Defect Highlighter on its original operation-record fixture.

The first five walkthrough steps are a **manually transcribed illustration from the manuscript**, not captured output from a new LLM run. The live step invokes the unmodified `tool/Highlight/pattern.py` from the public repository on its existing `test_input.json`. It does not compile C, invoke a model, or validate interrupt feasibility.

## Verify the executable component

```sh
python3 serve.py --check
```

This executes the highlighter and compares the complete returned result against the repository's `test_output.json`. Expected result: one `WRW` candidate on `global_var`. This is a component check, not an end-to-end evaluation of Clover.

`ORIGIN.json` records the source commit and SHA-256 hashes. The vendored highlighter and fixtures come from [ahang0712/clover](https://github.com/ahang0712/clover), commit `3addd87b41729d5f7d5466adf5b9383abe001db1`. Their Apache 2.0 license is retained in `vendor/LICENSE`.

## Full Clover pipeline: configuration and remaining integration work

The full repository describes Python 3.10+, Clang/LLVM 10, and an online model or local-model installation. For the online path, configure `API_HOST`, `API_KEYS`, `API_MODEL`, `AGENT_MODELS`, and `RESPONSE_PATH` in `config.py`. Keep real keys local; do not commit them or include them in a recording.

The command-line parser in the inspected snapshot defines:

```sh
python main.py --single-file example.c --force-local-tools
python main.py --project-path path/to/project --force-local-tools
```

The README's `--input` and `--output` example does not match that parser. **The commands above identify the actual interface; they are not a claim that the current snapshot can complete a full analysis.** The following issues must be addressed before recording or distributing a complete fresh inference run:

- `main.py` imports `thinking_config`, which is absent from the snapshot.
- Several call sites pass `thinking_config=...` to `APIClient`, but its constructor does not accept this argument.
- Workflow allocation invokes `set_concurrency_profile`, which is absent from the inspected API client.
- Project analysis imports `preprocessing` modules absent from the snapshot.
- The operation-analyzer wrapper contains simulated-output fallback paths. A full-run recording must verify actual compiler/analyzer execution and must not represent fallback output as measured analysis.

No credentials were supplied and the complete model pipeline was not rerun in preparing this companion. The paper's experimental numbers are inherited from the existing manuscript. Completing the full runtime package remains necessary for a submission that promises analysis of arbitrary new programs without building the tool.

## Recording

Use the steps in order, explaining both the source-level effect and why candidates are removed. Keep the replay label visible. Run the live highlighter separately and describe its limited scope. The supplied English video is a narrated artifact walkthrough; it does not purport to be a recording of fresh agent inference.
