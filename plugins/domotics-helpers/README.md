# Domotics Helpers

**[English](README.en.md) | 繁體中文**

給 Claude Code 使用的 Home Assistant 技能套件（plugin）。

## 安裝

```text
/plugin marketplace add hmj1026/home-assistant-helpers
/plugin install domotics-helpers@domotics-helpers
```

本機測試：在 repo 根目錄執行 `/plugin marketplace add ./`。

## 技能

### `ha-dashboard-studio`：儀表板設計工作室

用設計工作室的方式，為你的家設計並建立 Home Assistant（Lovelace）儀表板。

**流程**

```
盤點 ──► 提案 ──► 計畫書 ══ 你核准 ══► 逐頁建置 ──► 交付
```

1. **盤點**：只讀取，不寫入。找出房間、設備用途、寫入方式。
2. **提案**：依你家的狀況提出 2–3 個完整設計，每個附上用你家真實房間畫的草圖。
3. **計畫書**：把選定的提案寫成 `studio-plan.yaml`，列出每一頁、每個設備放哪裡、哪些動作要確認。核准前只會寫入計畫書草稿，你核准後才會寫入其他檔案，這是唯一一定要停下來的地方。
4. **建置**：依計畫逐頁建置，只有遇到問題才停下。
5. **交付**：告訴你怎麼設成預設、怎麼完全移除。

說「不用問，直接做」時，會自動選最合適的提案，直接給你計畫書核准。想保留現有儀表板的架構、只換外觀時，可以用「換裝（Restyle）」。

**四個可自由搭配的選項**

| 選項 | 可選值 |
|---|---|
| 風格 `style` | `native-minimal` 原生極簡、`frosted-glass` 毛玻璃、`soft-mushroom` 圓潤 App 風、`wall-kiosk` 壁掛平板、`control-room` 數據控制室 |
| 版面 `layout` | `rooms` 依房間、`moments` 依時段情境、`people` 依使用者、`single-screen` 單一畫面、`app` 手機 App |
| 配色 `palette` | `spectrum`、`one-tone`、`pastel`、`contrast`、`earth` |
| 密度 `density` | `airy`、`balanced`、`dense` |

**寫入邊界**：只會寫入新的儀表板、它需要的主題與 helper 檔案、計畫書與備份。其他任何修改都要先列在計畫書中讓你核准。不寫入 `.storage/`，不替你安裝任何東西，也不操作任何實體裝置。

使用方式範例：

```text
幫我設計一個新的 Home Assistant 儀表板，給我幾個方案看看
```

## 開發

見 [CONTRIBUTING.md](https://github.com/hmj1026/home-assistant-helpers/blob/master/CONTRIBUTING.md)。

## 授權

MIT，見 [LICENSE](LICENSE)。
