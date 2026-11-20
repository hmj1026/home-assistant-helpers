# Wording

The dashboard speaks the household's language (`dashboard.language` in the plan: the language of their existing dashboards, else the HA user language).

- Home Assistant already translates states by `device_class`; keep those. Write your own text only where HA's is misleading or missing, and list each override in the plan.
- Names are what people say at home ("Kitchen light", not "Light kitchen ceiling 1"). Reuse names from existing dashboards when they are good.
- Headings are one or two words. Reasons in "Needs you" are a short phrase naming the thing and the issue ("Front door battery 12 %").
- Show a time only when someone would act on it: how long a window has been open, when the washing finished.

Phrases this skill uses, for languages other than these, translate in the same short tone:

| Use | en | zh-TW |
|---|---|---|
| First-view row: needs you | Needs you | 需要你處理 |
| First-view row: on now | On now | 開著的 |
| First-view row: routines | Routines | 情境 |
| Empty "on now" | All quiet | 都關好了 |
| "Needs you" count at zero (styles that keep the count visible) | Nothing to do | 沒事 |
| Appliance states | Off / Running / Finished | 關閉 / 運轉中 / 已完成 |
| Keep-on dialog hint | Keep this on | 請保持開啟 |
| Unlock confirmation | Unlock the front door? | 要開前門嗎？ |
| Cover confirmation | Move the garage door? | 要移動車庫門嗎？ |
