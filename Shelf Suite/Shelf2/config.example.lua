--[[
    Shelf2 Config — APPS
    Theme: Forest (Green)

    INSTRUCTIONS:
    1. Copy this file to "config.lua" in the same folder
    2. Edit the program paths to match YOUR installed apps
    3. Refresh the skin in Rainmeter

    To add an item: just add a new line inside the items table.
    { label = "Name", action = "program.exe or C:\\path\\to\\shortcut.lnk", icon = "icon.png" }

    Available icons: calculator, calendar, chat, cloud, code, download,
    file, game, link, mail, music, news, office, photo, settings,
    storage, terminal, video, web (all .png)
]]

ShelfConfig = {
    defaultIcon = "web.png",
    tabs = {
        {
            name = "Internet",
            items = {
                { label = "Browser",   action = "chrome.exe",    icon = "web.png" },
                { label = "Email",     action = "outlook.exe",   icon = "mail.png" },
                { label = "Chat",      action = "ms-chat:",      icon = "chat.png" },
            }
        },
        {
            name = "Work",
            items = {
                { label = "Word",       action = "winword.exe",   icon = "office.png" },
                { label = "Excel",      action = "excel.exe",     icon = "office.png" },
                { label = "PowerPoint", action = "powerpnt.exe",  icon = "office.png" },
                { label = "Notepad",    action = "notepad.exe",   icon = "file.png" },
            }
        },
        {
            name = "Entertain",
            items = {
                { label = "Music",     action = "spotify.exe",             icon = "music.png" },
                { label = "Videos",    action = "vlc.exe",                 icon = "video.png" },
                { label = "Games",     action = "steam.exe",               icon = "game.png" },
            }
        },
        {
            name = "Tools",
            items = {
                { label = "Settings",  action = "ms-settings:",            icon = "settings.png" },
                { label = "Terminal",  action = "wt.exe",                  icon = "terminal.png" },
                { label = "Explorer",  action = "explorer.exe",            icon = "file.png" },
                { label = "Calc",      action = "calc.exe",                icon = "calculator.png" },
            }
        },
    }
}
