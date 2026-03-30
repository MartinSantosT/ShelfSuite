--[[
    Shelf1 Config — FOLDERS
    Theme: Deep Ocean (Blue)

    INSTRUCTIONS:
    1. Copy this file to "config.lua" in the same folder
    2. Edit the paths to match YOUR system
    3. Refresh the skin in Rainmeter

    To add an item: just add a new line inside the items table.
    { label = "Name", action = "C:\\path\\to\\folder", icon = "icon.png" }

    Available icons: calculator, calendar, chat, cloud, code, download,
    file, game, link, mail, music, news, office, photo, settings,
    storage, terminal, video, web (all .png)
]]

ShelfConfig = {
    defaultIcon = "folder.png",
    tabs = {
        {
            name = "Personal",
            items = {
                { label = "Documents", action = "C:\\Users\\YourName\\Documents", icon = "file.png" },
                { label = "Pictures",  action = "C:\\Users\\YourName\\Pictures",  icon = "photo.png" },
                { label = "Music",     action = "C:\\Users\\YourName\\Music",     icon = "music.png" },
                { label = "Videos",    action = "C:\\Users\\YourName\\Videos",    icon = "video.png" },
                { label = "Downloads", action = "C:\\Users\\YourName\\Downloads", icon = "download.png" },
            }
        },
        {
            name = "Cloud",
            items = {
                { label = "OneDrive",  action = "C:\\Users\\YourName\\OneDrive",     icon = "cloud.png" },
                { label = "Google Dr", action = "https://drive.google.com",           icon = "cloud.png" },
                { label = "Dropbox",   action = "https://dropbox.com",                icon = "cloud.png" },
            }
        },
        {
            name = "Drives",
            items = {
                { label = "C: Drive",  action = "C:\\",  icon = "storage.png" },
                { label = "D: Drive",  action = "D:\\",  icon = "storage.png" },
            }
        },
    }
}
