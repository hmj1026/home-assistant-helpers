# Palettes

A palette fills four tokens. Cards use tokens, never colours directly, so a palette swap changes the whole dashboard consistently. Values are Tile colour names or theme variables.

| Token | Used for |
|---|---|
| `active` | A device that is on or running |
| `active-alt` | A second kind of activity that must look different from `active` (heating vs cooling, playing media) |
| `attention` | Every "needs you" reason and nothing else |
| `quiet` | Idle and normal states; usually no colour at all |

Some palettes also colour by purpose (Comfort, Light, …); those per-purpose values replace `active` for that purpose.

## spectrum

Colour tells you the purpose at a glance.

| Token / purpose | Value |
|---|---|
| Light | `yellow` |
| Comfort: cooling, air | `light-blue` |
| Comfort: heating (`active-alt`) | `deep-orange` |
| Media | `purple` |
| Chores | `teal` |
| Entry and safety, secured | `green` |
| `attention` | `red` |
| `quiet` | none |

## one-tone

Everything active shares the theme's primary colour; only trouble stands out.

| Token | Value |
|---|---|
| `active` | `var(--primary-color)` |
| `active-alt` | `var(--accent-color)` |
| `attention` | `red` |
| `quiet` | none |

## pastel

Soft tones for glass and Mushroom looks.

| Token / purpose | Value |
|---|---|
| Light | `amber` |
| Comfort | `light-blue`; heating `pink` |
| Media | `deep-purple` |
| Chores | `light-green` |
| `attention` | `red` |
| `quiet` | none |

## contrast

For wall tablets, bright rooms and low vision: two strong colours only.

| Token | Value |
|---|---|
| `active` | `yellow` when the plan's main screen uses a dark theme, else `blue` (decided once in the plan) |
| `active-alt` | `light-blue` with yellow, `indigo` with blue |
| `attention` | `red` |
| `quiet` | none |

## earth

Calm and warm, close to furniture tones.

| Token / purpose | Value |
|---|---|
| `active` | `amber` |
| `active-alt` | `brown` |
| Comfort | `blue-grey` |
| `attention` | `deep-orange` |
| `quiet` | none |

## Check for every palette

- The `attention` value appears only on "needs you" reasons.
- Text stays readable on each coloured card in dark and light mode (the user confirms on screen).
