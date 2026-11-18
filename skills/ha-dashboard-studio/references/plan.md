# The plan

`studio-plan.yaml` lives in the config folder root (or the working directory when there is none). It is written once the user has picked a concept, shown for review, and becomes binding when approved.

## Schema

```yaml
concept: {name: Evening calm, style: frosted-glass, layout: rooms, palette: earth, density: airy}
dashboard: {url_path: home-studio, title: Home, language: zh-TW}
screen: {main: wall-tablet, resolution: 1280x800, orientation: landscape}   # resolution only when it matters
look: {theme: null, background: null}   # e.g. theme name and /local/studio/wall.jpg for frosted-glass
write:
  method: yaml-file             # yaml-file | api | paste
  check: "ha core check"        # or ask-user
  restart_needed: true
  files:                        # every file Build may touch (SKILL.md write boundary)
    - configuration.yaml (dashboard registration, studio includes)
    - dashboards/home-studio.yaml
    - templates/studio_templates.yaml
installs:                       # what the user installs before Build
  - {name: Bubble Card, why: room pop-ups, source: "https://github.com/Clooos/Bubble-Card", confirmed: false, fallback: sub-views}
user_actions: []                # things only the user can do, e.g. "create a non-admin user for the hallway tablet"
changes_outside: []             # each: {file, change, why}
helpers:                        # entities Build adds (references/attention.md#files)
  - {id: sensor.studio_needs_you, why: count shown on the first view}
views:
  - id: now
    title: 現在
    status: planned             # planned | built | checked
    visible_to: all             # or a list of display names (people layout)
    sections:
      - title: Needs you
        show_when: needs-you        # always | active | needs-you | <entity> <state>
        items:
          - {entity: sensor.studio_needs_you, as: summary}
      - title: Living room
        items:
          - {entity: light.living_ceiling, as: owner}
          - {entity: lock.front_door, as: owner, confirm: true}
          - {entity: switch.fridge_plug, as: owner, keep_on: true}
needs_you:                      # what counts as "needs you" (references/attention.md)
  - {entity: sensor.front_door_battery, when: "below 20 %", uses: [sensor.front_door_battery]}
  - {entity: lock.front_door, when: "unlocked while nobody is home", uses: [lock.front_door, zone.home]}
approved: false
log:                            # one line per decision, newest last
  - "2026-11-18 user: concept B, palette earth instead of pastel"
```

Rules:

- `as:` is `owner` (the device's full controls, exactly once per device), `summary` (a compact read-out elsewhere), or `routine` (a scene or script button).
- `show_when` decides when a section is visible: `always` (default), `active` (when any of its items is on), `needs-you` (when the count is above zero), or an entity and state.
- Only items that can't be re-detected live here; the HA version, installed cards and similar are re-read each session.
- After approval, any change to `views`, `installs`, `changes_outside` or `write` is a plan change: show the diff, get approval, add a `log` line.

## Filling the plan

There is no questionnaire. Each device in the survey gets its plan entry from the chosen concept, and every entry is a proposal the user can change in the review:

- **Where it lives**: its owner view comes from the layout: its area (`rooms`), the moment it is used in (`moments`), the people who control it (`people`), on or off the main screen (`single-screen`), its pop-up (`app`).
- **Whether it shows in "On now"**: yes for things with an on state a person would notice (lights, climate, media, running appliances); no for background gear.
- **How it acts**: `confirm: true` for anything that moves or opens something in the physical world (locks, covers, valves); `keep_on: true` for keep-on plugs; HA defaults otherwise.
- **What makes it "need you"**: a `needs_you` line, per `references/attention.md`, only for devices that can actually go wrong.
- **First-view routines**: the scenes and scripts the survey found useful.
- **Layout-specific entries**: the list of moments (`moments`), the users per view (`people`), the screen resolution (`single-screen`).
- **Fixes outside the dashboard**: a sensor whose `device_class` produces misleading text gets a proposed `changes_outside` entry, never a silent change.

## Review

Show the plan as text, not as raw YAML:

1. The concept line (name and the four choices) and what must be installed.
2. One wireframe per view, sections in order, each listing its devices; mark `confirm` and `keep_on` items.
   Ask here for anything the chosen style needs from the user (a wallpaper image, the tablet resolution), so Build has no questions left.
3. The entries that are judgement calls (confirmations, keep-on, needs-you conditions, moments or users), as a short list the user can edit in a reply.
4. The write method, `write.files`, `changes_outside`, `user_actions`, and whether a restart is needed.
5. "Reply **approve**, or tell me what to change."

Set `approved: true` only on an explicit approval. An answer that changes something gets an updated review.

## Handover

The plan file is the record of what was built: every view carries its final status, and the `log` holds every decision, including proposals the user left as they were. The closing message only adds what the file can't say:

1. A table of views with their status, so anything still `built` (waiting on a check the user runs, or on a look at the real screen) stands out.
2. How to open the dashboard and make it the default if they like it.
3. How to undo: the files and include lines to remove, and the backup folder.
