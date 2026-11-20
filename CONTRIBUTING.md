# Contributing

## Layout

- `plugins/domotics-helpers/` is the plugin that ships and is submitted to the plugin directory. Keep it to Markdown, JSON, YAML, plain text and PNG files, with no scripts.
- `evals/` holds the evaluation cases. It stays in the repository root so its scaffold scripts never ship. Each `case.yaml` loads the plugin through its `plugins:` path.
- `.claude-plugin/marketplace.json` lists the plugin from its subfolder.

## Checks

Before opening a pull request, run Claude Code's plugin validator on the plugin folder and on the repository root, then run Claude Code's plugin evaluation runner from the repository root with scaffold scripts enabled. The Claude Code plugin documentation describes both.

Each case in `evals/` seeds its working directory from `evals/fixtures/` and grades the response against the files in its `graders/` folder.
