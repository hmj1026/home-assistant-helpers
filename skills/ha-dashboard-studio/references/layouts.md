# Layouts

A layout decides which views exist and where each device's owner card lives. All layouts use the Sections view (`type: sections`) and leave out anything the home does not have.

## The first view

Every layout's first view is built from **rows that appear only when they have content**, top to bottom:

1. **Needs you**: only when the attention count is above zero (`references/attention.md`). One line per reason, each tapping to the device. (A style may keep a permanent count instead, showing the "nothing to do" phrase at zero.)
2. **On now**: what is on or running right now (lights, climate, media, appliances); hidden when nothing is.
3. **Routines**: the plan's routine buttons.
4. The layout's own row (below).

So the first view is short on a quiet day and grows only when something deserves attention.

## rooms

For homes where most devices belong to a room.

- First view, own row: one button per room with a one-line summary (temperature, lights on). It opens the room's view.
- One view per room holding every device of that room as owner. Rooms with one or two devices join a shared "Other spaces" view.
- Things without a room (energy, upkeep) get a "Home" view, or join the first view when they fit in one section.

## moments

For households with a strong daily rhythm. Views follow the time of day or activity instead of the floor plan.

- Views like Morning, Evening, Away and Night; the user names and picks them in the plan.
- Each view holds the devices and routines that matter at that moment: Night has locks, the alarm, bedroom lights and climate; Away has presence, cameras, openings and energy.
- A device is owned by the moment where it is used most and summarised in others.
- Optional: the first view's own row shows a button to the moment that fits the current time (a `visibility` condition on time, using a `time` or `schedule` helper).

## people

For households where people need different things.

- One view per person or group (Parents, Kids, Guest), restricted with the view's `visible` list of users.
- Each view holds owner cards only for what that group should control; others see summaries or nothing.
- An "Everything" view for admins, made of `summary` cards that link to each owner view.
- Say clearly in the plan review that hiding a view is not access control: any logged-in user can still reach entities by other routes.

## single-screen

For a fixed tablet or a TV.

- One view designed to fit the screen's resolution without scrolling; the plan records the resolution.
- Large targets (cards at least 2 grid rows), tap only.
- Everything that does not fit goes to a second view reached by one button. In the plan review, the main view's wireframe is drawn to the screen's proportions and lists what was moved to the second view.

## app

For phone-first use with an app feel.

- First view plus room or topic **pop-ups** instead of views (a pop-up card such as Bubble Card), and bottom navigation (a navbar card) for 3–5 top destinations.
- Narrow sections (`max_columns: 2`), one idea per section.
- Without those cards: sub-views (`subview: true`, `back_path`) and the standard tab bar, listed in the plan as the fallback.
