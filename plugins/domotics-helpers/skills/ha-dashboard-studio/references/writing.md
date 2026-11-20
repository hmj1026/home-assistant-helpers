# Writing to Home Assistant

## Methods

The survey proposes one; the plan records it in `write.method`.

| `write.method` | Needs | What Build does |
|---|---|---|
| `yaml-file` | Config folder access (`local` or `on-host`) | Registers the dashboard under `lovelace: dashboards:` with `mode: yaml` and writes `dashboards/<url_path>.yaml`. Registering it the first time takes one restart; the plan says so in `restart_needed`. |
| `api` | A live admin connection (HA MCP server or WebSocket API) | Creates a dashboard and saves its config through the API; Home Assistant writes its own storage, and no `.storage` file is edited by you. |
| `paste` | Nothing | Hands the user the full dashboard YAML to paste into a new dashboard's raw configuration editor, plus any theme or template files with where they go. |

Theme and template files are files on disk: with `api` from a remote machine, or with `paste`, hand them to the user with their target paths.

## Backups

Before writing any file, copy its current version to `backups/studio/<YYYYMMDD-HHMMSS>/<same relative path>`. With `api`, save the current dashboard config as JSON there before replacing it. In a git repository, also note the current commit in the handover as the way back. Make sure `backups/` is ignored by git.

## Checks

After each write, two checks:

1. **File check (you)**: the written YAML parses, and every style check that can be read from the files holds. This sets a view to `built`.
2. **Config check**: `write.check` from the plan (a project script, `ha core check` on the host, or "Developer tools → YAML → Check configuration" given to the user). This validates configuration such as includes and helpers; dashboard YAML is validated when HA loads the dashboard, so also open it through the live connection when there is one. A pass sets `checked`.

A failure means: undo the write (restore the backup, or delete a new file and remove the lines you added), report the error, stop.

## Restyle copies

For a restyle, read the source dashboard (its YAML file, or its config through the API), record its views and sections in the plan exactly as they are (a view that fits no layout keeps its own structure; the plan's `layout` is then `as-is`), and write the restyled result under the plan's new `url_path`. The source is never written.

## Applying changes

- Themes: `frontend.reload_themes`.
- Templates and helpers in YAML: `template.reload` (and the reload for each helper domain used).
- A YAML dashboard file: picked up on browser refresh.

Call these through the live connection when there is one; otherwise tell the user which action to run in Developer tools → Actions.
