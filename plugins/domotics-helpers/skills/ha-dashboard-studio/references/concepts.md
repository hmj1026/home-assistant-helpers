# Concepts

A concept is a complete design pitch: one style, one layout, one palette, one density, a name, a one-sentence reason it fits this home, and a text sketch (box-drawing characters are fine) of its first view, drawn from the home's real rooms and devices. The style files' `sketch` shows the look to imitate; the concept's own sketch is what the user sees.

## Composing 2–3 concepts

Fit them to the home profile, and make them genuinely different from each other:

- **The fitting one**: the closest match to the signals. Wall tablet signals → `single-screen` with `wall-kiosk`. Phone-heavy family → `app` with `soft-mushroom`. Several accounts with different needs → `people`. Many rooms → `rooms`. Few rooms but strong daily rhythm (lots of scenes, presence sensors) → `moments`.
- **The zero-install one**: `native-minimal`, or another style whose needs are already installed.
- **The bold one** (optional): a style the user may not have thought of, such as `frosted-glass` or `control-room`, when the home has what makes it shine (a wallpaper-friendly tablet, lots of energy and climate data).

Style cards for pitching (the full rules live in `styles/<id>.yaml`):

| Style | Feel | Good with | Needs |
|---|---|---|---|
| `native-minimal` | Plain HA, Tile cards, whitespace | any layout; `spectrum` or `one-tone`; `balanced` | nothing |
| `frosted-glass` | Translucent cards over the user's own photo | `rooms`, `app`; `pastel`; `airy` | a glass/blur theme, a wallpaper image |
| `soft-mushroom` | Rounded chips, big icons, room pop-ups | `app`, `rooms`; `pastel`, `spectrum`; `balanced` | Mushroom, Bubble Card |
| `wall-kiosk` | Huge, readable from across the room | `single-screen`; `contrast`; `airy` | optionally Kiosk Mode |
| `control-room` | Compact and numeric, trends everywhere (best on a dark theme) | `rooms`, `moments`; `one-tone`, `contrast`; `dense` | optionally ApexCharts |

Take palette and density from the "Good with" column unless the signals argue otherwise. Honour anything the user already named in every concept. List what each concept needs installed.

Before the pitch, ask only what the survey could not tell and the concepts depend on: the main screen (phone, desktop, wall tablet with its resolution, TV) and who uses the dashboard. Skip both when the survey answered them or the user wants no questions.

## Presenting

- In Claude Code, one `AskUserQuestion` call: a single question "Which concept?" with each concept as an option and its sketch as the option's `preview`; the fitting concept first, marked recommended. The user can answer with a tweak in "Other" ("B, but with the earth palette").
- Elsewhere, a numbered list: name, sketch, reason, what it needs.

A tweak changes only the named choice; keep the rest of the concept.

## Hands-off requests

Use the fitting concept and its defaults without asking. Name the concept and its four choices at the top of the plan review so the user can still swap one.
