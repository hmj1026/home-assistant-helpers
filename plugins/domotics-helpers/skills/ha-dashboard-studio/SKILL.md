---
name: ha-dashboard-studio
description: Designs and builds Home Assistant (Lovelace) dashboards. Use to create a dashboard for a home, rebuild one from an existing dashboard, or restyle one with a different look (glass, Mushroom, wall-tablet kiosk, data-dense, native). Not for one-off card syntax questions.
---

# HA Dashboard Studio

You design a dashboard the way a studio does: survey the home, pitch a few complete **concepts**, turn the chosen one into a **plan** the user signs off, then build it view by view. The plan is the contract: nothing is written before it is approved, and the build follows it.

Entity IDs in this skill are examples; the user's live system is the source of truth.

## Flow

```
Survey ──► Concepts ──► Plan  ══ approval ══►  Build (view by view) ──► Handover
(read)     (pick one)   (studio-plan.yaml)      (stops only on a problem)
```

| Step | Does | Ends when |
|---|---|---|
| **Survey** | Reads the environment and builds the home profile (`references/survey.md`). Writes nothing. | The profile lists every device group present, the rooms, and how writing would work. |
| **Concepts** | Pitches 2–3 complete designs fitted to the profile (`references/concepts.md`). | The user picks one, possibly with tweaks. |
| **Plan** | Writes `studio-plan.yaml` and shows it as a readable review (`references/plan.md`). | The user approves the plan. This is the only required stop. |
| **Build** | Builds each view in plan order (`references/cards.md`, the style file, the palette). | Every view's status is `checked`, or a problem stopped the build. |
| **Handover** | Final report (`references/plan.md#handover`). | The user has everything they need to adopt or remove the dashboard. |

Variations:

- **Hands-off requests** ("just make one, no questions"): skip the Concepts conversation, take the fitting concept, and go straight to the plan review. The plan approval still happens, because it is the user's consent to write.
- **Named choices** ("frosted glass, by room"): every concept honours them; only the unnamed parts vary.
- **Restyle** (keep an existing dashboard's structure, change its look): Survey reads that dashboard into the plan's views as they are. Concepts vary the look only (style, palette, density). Build writes a copy; the original stays untouched.
- **Picking up later**: when `studio-plan.yaml` exists, read it first. With `approved: false`, resume at the plan review. With `approved: true`, re-run its config check for any `built` view, then continue at the first `planned` view. Re-run Survey quickly to catch changes; the plan keeps only what cannot be re-detected.

## Write boundary

Before approval, the only file written is the draft `studio-plan.yaml` (`approved: false`). Once the plan is approved, Build may write exactly the files the plan lists under `write.files`, drawn from:

- the new dashboard: `dashboards/<url_path>.yaml`, or its config through the API (Home Assistant stores it; no `.storage` file is edited by you),
- in `configuration.yaml`, only these lines: the dashboard's registration under `lovelace: dashboards:`, the `frontend:` themes include, and the includes for the studio helper files,
- the studio helper files from `references/attention.md#files`,
- `www/studio/` for images the plan names (e.g. a wallpaper the user provided),
- one `backups/` line in `.gitignore`, `backups/studio/`, and `studio-plan.yaml` updates (statuses, log).

Anything else (existing dashboards, automations, scripts, scenes, users, integration or device settings, `customize`) needs its own line under `changes_outside`, approved with the plan, or is listed as a user action. How to write, back up and check: `references/writing.md`.

## Hands-off list

- `.storage/` is Home Assistant's own database; read it, never write it.
- Devices are never operated, not even to test.
- Installing cards, themes and integrations, and creating user accounts, is the user's job; the plan names each one with why and where from.
- Restart only when the plan's `restart_needed` says so; the user does it, or you do it through a live connection if the plan says so.
- In files and reports, refer to people by display name only: no logins, tokens or passwords.

After every write: check it (`references/writing.md#checks`). If the check fails, undo that write (restore the backup, or delete a file that did not exist before and remove added lines), report, and stop.

## Build behaviour

1. **Prepare**: write the `configuration.yaml` lines and the helper files, reload, restart if `restart_needed` (then confirm the dashboard appears), and read each helper's state.
2. **Views** in plan order. After each view, set its status and post a two-line progress note, then continue.
3. Stop and ask only on a **problem**: a check fails; an entity in the plan does not exist; a helper stays `unknown`/`unavailable` after reload; an install the plan needs is not confirmed and the plan names no fallback for it; or the user asks for something that changes the plan. A plan change is shown as a diff and needs approval before the build resumes.

Statuses: `planned` → `built` (written, the YAML parses, every style check you can verify from the files passes) → `checked` (the config check passed). When only the user can run the config check, or the method is `paste`, give them the exact step, leave the view at `built`, and keep going; the handover's status table shows it.

## Choices a design is made of

| Choice | Options | Defined in |
|---|---|---|
| `style` | `native-minimal`, `frosted-glass`, `soft-mushroom`, `wall-kiosk`, `control-room` | `styles/<id>.yaml` |
| `layout` | `rooms`, `moments`, `people`, `single-screen`, `app` | `references/layouts.md` |
| `palette` | `spectrum`, `one-tone`, `pastel`, `contrast`, `earth` | `references/palettes.md` |
| `density` | `airy`, `balanced`, `dense` | `references/cards.md#density` |

Any combination is valid. `references/concepts.md` has a one-line card per style for pitching; open a style file only once its concept is chosen. A style file is a list of rules, each with the check that proves it, applied during Build and verified at handover.

## Done means

At handover, each item holds or is listed as an exception with the reason.

Verified by you from the files:

- [ ] Every view in the plan is `checked`, or `built` with the reason it is waiting.
- [ ] Each device has exactly one `owner` placement and appears elsewhere only as `summary`.
- [ ] Every colour is a value from the chosen palette (token or purpose table); no hex values.
- [ ] Every `confirm: true` item has a confirmation and no inline control that bypasses it.
- [ ] Every file-checkable `check` in the chosen style holds.
- [ ] Nothing outside `write.files` changed, apart from approved `changes_outside`.

Confirmed by the user on screen (listed in the handover for them):

- [ ] The first view answers "does anything need me, and what is on?" without scrolling on the main screen.
- [ ] Text is readable in the modes and on the devices they use; the style's on-screen checks hold.
