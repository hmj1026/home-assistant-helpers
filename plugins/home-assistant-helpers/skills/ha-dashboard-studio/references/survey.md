# Survey

Read-only. Use the best source available, in this order: a live connection (HA MCP server or API the user already set up), the config folder, what the user tells you. Note the source of each fact.

## Home profile

Produce this, in the chat (it goes into the plan later):

1. **How to write**: whether the agent can reach the config folder (`local`, `on-host`, `none`) and the HA API, the HA version, how custom cards get installed (HACS folders present or not), which custom cards and themes are already installed, how a config check can be run, the recorder's history length (`purge_keep_days`, default 10 days), and whether a weather entity exists. Then name the write method you would use (`references/writing.md`) and why.
2. **Rooms**: the areas and how many devices each has. Without area data, infer rooms from entity names and existing dashboards and say they are inferred.
3. **Device groups present**, by what the household uses them for:

| Purpose | What belongs there |
|---|---|
| Comfort | Climate entities, fans, heaters, humidifiers, purifiers, temperature/humidity/air-quality readings |
| Light | Lights and light-switches; note dimmable and colour-capable ones |
| Entry and safety | Locks, garage doors, gates, door/window contacts, smoke/leak/gas sensors, cameras, presence |
| Media | Media players, remotes, computers and screens |
| Chores | Appliances on smart plugs, robot vacuums and mowers, pet feeders and litter boxes |
| Energy | Whole-home meter, solar, per-plug power and energy |

Mark plugs that feed equipment which should stay powered (fridge, router, NAS, aquarium) as **keep-on**.

Batteries, consumables, updates and hub connectivity are not a group of their own: note them as possible "needs you" sources (`references/attention.md`).

4. **Routines**: scenes and scripts that make good one-tap buttons.
5. **Existing dashboards**: list them. A user-built one is a source of hints (what the user puts first, their naming, their language), and for a restyle it is the source of the structure. It is never edited.
6. **Signals for the concept pitch**: screens mentioned by the user or implied (a dashboard named "tablet", kiosk cards installed), number of people/accounts, how many rooms carry devices.

Anything that fits no group, or two, goes in an "unsure" list with your best guess; the plan review will settle it.

When the user's own description of their setup contradicts the files, go with the user and mention what you found.
