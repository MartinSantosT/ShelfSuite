# ShelfSuite for Rainmeter

![Rainmeter](https://img.shields.io/badge/Rainmeter-4.5%2B-blue?style=for-the-badge&logo=rainmeter)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-2.1-orange?style=for-the-badge)

**Your desktop, organized. No cost, no bloat, no hassle.**

ShelfSuite is a free, open-source desktop organizer for Rainmeter. It groups your folders, apps, files, and links into independent tabbed widgets ("shelves") with one-click navigation and a visual HTML configurator. A lightweight alternative to Fences by Stardock.

## Preview

<!-- TODO: Replace with v2.0 screenshots -->
<img width="542" height="590" alt="ShelfSuite" src="https://github.com/user-attachments/assets/bd9a76ea-7147-40d4-a62b-b54dc0892a1a" />

## Features

- **Dynamic Lua Engine** — A single engine (ShelfEngine.lua) powers all shelves. Add tabs, items, and shelves by editing a simple config file or using the visual configurator.
- **Visual HTML Configurator** — Create shelves, add tabs, manage items, and switch themes from a browser-based UI. No code editing required.
- **4 Built-in Themes** — DeepOcean, Forest, Terracotta, and Obsidian. Switch themes per shelf with one click.
- **Fully Modular** — Each shelf is an independent skin. Load one, three, or ten. They don't depend on each other.
- **Tabbed Navigation** — Up to 5 tabs per shelf, each with up to 18 items (3 rows of 6). Click a tab to switch instantly.
- **Custom Icons** — Drop any 64x64 PNG into the Icons folder and reference it by name. 19 generic icons included (Google Material Icons, Apache 2.0).
- **Lightweight** — No external dependencies, no network calls, no background processes. Just Rainmeter + Lua.

## Installation

1. Download the `.rmskin` file from the [Releases](https://github.com/MartinSantosT/ShelfSuite/releases) page.
2. Double-click the file to install. ShelfSuite is installed into your Rainmeter Skins folder automatically.
3. Open **Rainmeter Manage**, find `Shelf Suite`, and load `Shelf1/Shelf.ini`, `Shelf2/Shelf.ini`, and `Shelf3/Shelf.ini`.
4. Right-click any shelf on your desktop and select **"Open Configurator"** to start customizing.

## Configuration

ShelfSuite offers two ways to configure your shelves:

**Visual Configurator (recommended):** Right-click any shelf on your desktop and select "Open Configurator". From there you can create shelves, add/rename/delete tabs, manage items, and change themes — all from a browser-based UI that saves directly to your Rainmeter files.

**Manual editing:** Each shelf has a `config.lua` file inside its folder (e.g. `Shelf1/config.lua`). This is a plain Lua table where you define your tabs and items. Copy `config.example.lua` to `config.lua` and edit it with any text editor.

Example `config.lua`:
```lua
return {
    name = "Folders",
    theme = "DeepOcean",
    currentTab = 0,
    tabs = {
        {
            name = "User",
            items = {
                { name = "Documents", action = "C:\\Users\\Martin\\Documents", icon = "file" },
                { name = "Downloads", action = "C:\\Users\\Martin\\Downloads", icon = "download" },
            }
        },
        {
            name = "System",
            items = {
                { name = "Program Files", action = "C:\\Program Files", icon = "settings" },
            }
        }
    }
}
```

After making changes (either through the configurator or manually), right-click each modified shelf on your desktop and select **"Refresh skin"** to apply.

## Themes

Switch themes per shelf from the configurator dropdown or via right-click context menu on the desktop widget.

| Theme | Style |
| :--- | :--- |
| **DeepOcean** | Cool blue tones |
| **Forest** | Natural green palette |
| **Terracotta** | Warm earth tones |
| **Obsidian** | Dark neutral palette |

## Custom Icons

Place any 64x64 PNG (white on transparent background) in `@Resources/Icons/` and use the filename (without extension) as the icon name in your config. ShelfSuite includes 19 generic icons: calculator, calendar, chat, cloud, code, download, file, game, link, mail, music, news, office, photo, settings, storage, terminal, video, web.

## Updating

When a new version is released, download and install the new `.rmskin` file. The installer merges automatically — your personal `config.lua` files are never overwritten since the package only includes `config.example.lua` templates.

If you've added custom icons to the `@Resources/Icons` folder, back them up before updating. Any icon with the same filename as one in the new version will be replaced. After installing, copy your custom icons back and refresh your skins.

## Folder Structure

```
Shelf Suite/
├── @Resources/
│   ├── Icons/              # Generic + custom icons (64x64 PNG)
│   ├── Themes/             # Theme files (.inc)
│   │   ├── DeepOcean.inc
│   │   ├── Forest.inc
│   │   ├── Obsidian.inc
│   │   └── Terracotta.inc
│   ├── ShelfEngine.lua     # Core dynamic engine
│   ├── Variables.inc       # Shared dimensions and fonts
│   └── configurator.html   # Visual configurator
├── Shelf1/
│   ├── Shelf.ini           # Rainmeter skin definition
│   ├── config.example.lua  # Template config (distributed)
│   └── config.lua          # Your personal config (not in repo)
├── Shelf2/
│   └── ...
└── Shelf3/
    └── ...
```

## Credits

Icons: [Google Material Icons](https://fonts.google.com/icons) (Apache 2.0 License).

Font: Segoe UI (standard Windows system font).

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

Created by Martin Santos
