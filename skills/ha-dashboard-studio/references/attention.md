# Attention and helper entities

## "Needs you"

The dashboard has one idea of trouble: something **needs you**, or nothing does. There are no severity levels; urgency shows through the reason's text and the palette's `attention` token.

- Build `sensor.studio_needs_you`: its state is the number of reasons, and an attribute `reasons` lists them as short phrases in the dashboard language.
- The reasons come from the plan's `needs_you` list: one condition per entity, each written in plain words in the plan ("below 20 %", "open for 15 min while heating runs") so the user can change it in the review.
- Each entry names the entities it reads (`uses`); "nobody home" uses `zone.home` (its state is the number of people home). The plan review shows each entry as the condition Build will write.
- Keep each limit in an `input_number` named after the entity, so the user can tune it later without editing templates.
- Propose conditions only for devices the home has. Starting points to adapt: batteries and consumables below 20 %; hazard sensors whenever on; locks unlocked or garage doors open while nobody is home; a keep-on plug drawing no power; an update pending.

## Appliances

For an appliance on a power plug, a template sensor with `off`, `running` and `finished`:

- `running` when the power stays above a run threshold for one minute.
- `finished` when it drops back below after running; it returns to `off` when the appliance door opens (if there is a contact) or when the user presses a reset button.
- Take the thresholds from the plug's recorded history when available, else propose 3 W idle and 20 W running, labelled as guesses in the plan.

## Energy

- `utility_meter` with a daily cycle for "today".
- A template sensor summing the plug readings when there is no whole-home meter; label it "measured devices" rather than "home".
- Cost only when the plan has a tariff; keep the tariff in an `input_number`.

## Files

Each integration reads its own include, so studio entities go in one file per kind, all under `templates/`:

| File | Included from `configuration.yaml` as | Holds |
|---|---|---|
| `templates/studio_templates.yaml` | `template: !include templates/studio_templates.yaml` (or merged into an existing `template:` include list) | Template sensors and binary sensors |
| `templates/studio_numbers.yaml` | `input_number: !include templates/studio_numbers.yaml` | Limits and the tariff |
| `templates/studio_meters.yaml` | `utility_meter: !include templates/studio_meters.yaml` | Daily energy |

Write only the files the plan needs. If `configuration.yaml` already includes that integration from another file, add to the existing structure in the least invasive way and list it in `write.files`.

## Conventions

- Every entity has a `unique_id` and an object id starting `studio_`, so they can be found and removed together.
- Prefer a built-in helper (`utility_meter`, `input_number`) over a template when it does the job.
- After reloading, read each new entity; one that stays `unknown` or `unavailable` is a build problem (SKILL.md, Build behaviour).
