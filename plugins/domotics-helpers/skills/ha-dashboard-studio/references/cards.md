# Cards

How the plan's items become cards. Styles may swap the card family (Mushroom, Bubble); the behaviour below stays.

## Defaults

- Native Tile card for devices; HA's own tap and hold defaults (tap toggles or opens, hold opens the entity dialog) unless the plan says otherwise.
- `confirm: true` → add `confirmation` to the action that changes the device.
- `keep_on: true` → no toggle on the card: tap opens the entity dialog, and the card's secondary line carries the "keep this on" phrase from `references/wording.md`.
- Inline controls via Tile `features`, using only feature types documented for the installed HA version; with no version known, ask the user for it before Build.
- Colour via the palette's tokens (`references/palettes.md`): Tile colour names or theme variables, never hex.
- A card that only matters in some states gets a `visibility` condition (a light's card in "On now", a vacuum card only while it cleans).
- A row or section that can be empty gets a small Markdown card shown only when it is empty, with the wording from `references/wording.md`.
- Reach for a custom card only when the plan lists it as installed, and only for what native cards can't do (chips, pop-ups, bottom navigation, sorted dynamic lists). Note the native fallback in the plan.

## By purpose

| Purpose | Owner card | Summary card |
|---|---|---|
| Comfort | Climate Tile with mode and target features; readings with a trend feature when the density allows | Room temperature and humidity in one line |
| Light | Tile per light, brightness feature for dimmable ones; scenes for the room as buttons | Count of lights on, tapping to the room |
| Entry and safety | Lock Tile with lock commands feature; cover Tile with open/close; cameras as picture cards in a section of their own | Badge-style state for door, lock, garage |
| Media | Media control card | Now-playing line, hidden when idle |
| Chores | Appliance status from `references/attention.md#appliances`; vacuum Tile with commands | "Running" / "Done" line |
| Energy | Big current-power number, today's energy, a statistics graph; per-device list | Current power |

Example: a front door that confirms before locking or unlocking. Leave out inline lock features on a `confirm: true` lock, since they act without the confirmation.

```yaml
type: tile
entity: lock.front_door
tap_action:
  action: toggle
  confirmation:
    text: Lock or unlock the front door?
```

Example: a garage door with a confirmed toggle.

```yaml
type: tile
entity: cover.garage_door
tap_action:
  action: toggle
  confirmation:
    text: Move the garage door?
```

No `cover-open-close` feature here: it would move the door without the confirmation.

## Density

Density sets how big cards are and how much fits on a view, through the Sections grid (12 columns per section) and `max_columns`. When a layout or style sets its own `max_columns` or card size (`app`, `wall-kiosk`), that wins over density.

| | `airy` | `balanced` | `dense` |
|---|---|---|---|
| `max_columns` on the view | 2 | 3 | 4 |
| Device card size (`grid_options`) | 12 columns × 2 rows | 6 × 1 (Tile default) | 4 × 1 |
| Tile features | Only the one control the user will use most | As in "By purpose" | All useful ones, `features_position: inline` where it fits |
| Trends | None on the first view | Comfort readings | Comfort and energy readings |
