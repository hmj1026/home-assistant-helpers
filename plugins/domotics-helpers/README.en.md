# Domotics Helpers

**English | [繁體中文](README.md)**

A Claude Code plugin with skills for Home Assistant.

## Install

```text
/plugin marketplace add hmj1026/home-assistant-helpers
/plugin install domotics-helpers@domotics-helpers
```

Local testing: run `/plugin marketplace add ./` from this repo's root.

## Skills

### `ha-dashboard-studio`

Designs and builds a Home Assistant (Lovelace) dashboard for your home, the way a design studio would.

```
Survey ──► Concepts ──► Plan ══ you approve ══► Build view by view ──► Handover
```

1. **Survey**: read-only. Finds rooms, device purposes and how to write.
2. **Concepts**: 2–3 complete designs fitted to your home, each sketched with your real rooms.
3. **Plan**: the chosen concept becomes `studio-plan.yaml`: every view, where each device goes, which actions confirm. Until you approve, only the draft plan file is written; this is the only required stop.
4. **Build**: view by view, stopping only on a problem.
5. **Handover**: how to make it the default, and how to remove it completely.

Say "no questions, just make one" and it picks the fitting concept and goes straight to the plan. To keep an existing dashboard's structure and only change its look, ask for a restyle.

| Choice | Options |
|---|---|
| `style` | `native-minimal`, `frosted-glass`, `soft-mushroom`, `wall-kiosk`, `control-room` |
| `layout` | `rooms`, `moments`, `people`, `single-screen`, `app` |
| `palette` | `spectrum`, `one-tone`, `pastel`, `contrast`, `earth` |
| `density` | `airy`, `balanced`, `dense` |

**Write boundary**: only the new dashboard, its theme and helper files, the plan and backups. Anything else is listed in the plan for your approval. `.storage/` is never written, nothing is installed for you, and no device is operated.

## Development

See [CONTRIBUTING.md](https://github.com/hmj1026/home-assistant-helpers/blob/master/CONTRIBUTING.md).

## License

MIT, see [LICENSE](LICENSE).
