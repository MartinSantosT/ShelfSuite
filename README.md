# ShelfSuite for Rainmeter

![Rainmeter](https://img.shields.io/badge/Rainmeter-4.5%2B-blue?style=for-the-badge&logo=rainmeter)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.0.0-orange?style=for-the-badge)

**ShelfSuite** is a clean, modular, and tabbed desktop organization suite inspired by "Fences", specifically designed for Rainmeter. It organizes your digital life into three distinct, color-coded functional zones.

## 📸 Preview

<img width="569" height="589" alt="image" src="https://github.com/user-attachments/assets/20bcbd26-4ecd-4d89-8432-030f80198b09" />


## ✨ Features

* **Modular Design:** Three independent skins that can be toggled separately.
* **Tabbed Interface:** Navigate between sub-categories with a single click.
* **Zero-Lag:** Extremely lightweight resource usage compared to standalone applications.
* **Cohesive Aesthetics:** Each module features a unique monochrome palette derived from natural tones.

## 🎨 Modules

| Module | Theme Color | Tabs / Function |
| :--- | :--- | :--- |
| **Folders** | 🌊 **Deep Ocean** | **User** (Docs, Pics), **System** (Progs), **Drives** (C:) |
| **Programs** | 🌲 **Forest Green** | **Web** (Browsers), **Media** (Spotify), **Office**, **System** |
| **Files** | 🍷 **Merlot / Terra** | **Docs**, **Work** (GitHub, Servers), **Cloud** (Drive) |

## 🚀 Installation

1.  **Requirement:** Ensure you have [Rainmeter](https://www.rainmeter.net/) installed (v4.5 or newer recommended).
2.  **Download:** Go to the [**Releases**](placeholder_link_to_releases) page on the right.
3.  **Install:** Download the `.rmskin` file and double-click it. Leave the default settings checked and click "Install".
4.  **Load:** Open Rainmeter Manage, find the `ShelfSuite` folder, and load `Folders.ini`, `Programs.ini`, and `Files.ini`.

## ⚙️ Configuration

ShelfSuite is designed to be easily customizable without complex coding.

1.  **Right-click** on any skin and select **"Edit Skin"**.
2.  Scroll down to the `[Variables]` section at the top of the file.
3.  **To change Icons:**
    * Place your `.png` icons in the `@Resources\Icons\` folder.
    * Update the `ImageName` path in the code if necessary.
4.  **To change Links:**
    * Find the `LeftMouseUpAction` line under each meter.
    * Example: change `["chrome.exe"]` to `["firefox.exe"]`.


; Example of Variables section you can edit
[Variables]
MainBackground=25,40,55,210   ; Change background color
ActiveTabColor=71,126,199,240 ; Change tab accent color

```ini
## 📂 Folder Structure
ShelfSuite/
├── @Resources/           # Shared images and scripts
│   └── Icons/            # Place your PNG icons here
├── Folders/              # Navigation Module
│   └── Folders.ini
├── Programs/             # Apps Launcher Module
│   └── Programs.ini
└── Files/                # Documents Module
    └── Files.ini

🎨 Credits & Assets
Icons: This suite uses open-source icons (Licensed under Apache 2.0/MIT). No proprietary assets or trademarked logos are included in the distribution package.

Font: Uses Segoe UI (Standard Windows System Font).

📝 License
This project is licensed under the MIT License - see the LICENSE file for details.

Created by Martin Santos

