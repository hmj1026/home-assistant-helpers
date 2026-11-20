# Contributing

Before opening a pull request, check the plugin with Claude Code's plugin validator from the repository root, then run the evaluation cases in `evals/` with Claude Code's plugin evaluation runner. The Claude Code plugin documentation describes both.

Each case in `evals/` seeds its working directory from `evals/fixtures/` and grades the response against the files in its `graders/` folder.
