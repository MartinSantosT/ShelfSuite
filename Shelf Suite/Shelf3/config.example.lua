--[[
    Shelf3 Config — BOOKMARKS
    Theme: Terracotta (Red/Earth)

    INSTRUCTIONS:
    1. Copy this file to "config.lua" in the same folder
    2. Edit the URLs and paths to match YOUR favorites
    3. Refresh the skin in Rainmeter

    To add an item: just add a new line inside the items table.
    { label = "Name", action = "https://example.com or C:\\path\\to\\file", icon = "icon.png" }

    Available icons: calculator, calendar, chat, cloud, code, download,
    file, game, link, mail, music, news, office, photo, settings,
    storage, terminal, video, web (all .png)
]]

ShelfConfig = {
    defaultIcon = "link.png",
    tabs = {
        {
            name = "Social",
            items = {
                { label = "YouTube",   action = "https://youtube.com",     icon = "video.png" },
                { label = "Reddit",    action = "https://reddit.com",      icon = "chat.png" },
                { label = "Twitter",   action = "https://x.com",           icon = "chat.png" },
                { label = "Instagram", action = "https://instagram.com",   icon = "photo.png" },
            }
        },
        {
            name = "Work",
            items = {
                { label = "Gmail",     action = "https://mail.google.com",     icon = "mail.png" },
                { label = "Calendar",  action = "https://calendar.google.com", icon = "calendar.png" },
                { label = "GitHub",    action = "https://github.com",          icon = "code.png" },
                { label = "Notion",    action = "https://notion.so",           icon = "link.png" },
            }
        },
        {
            name = "News",
            items = {
                { label = "Google N.", action = "https://news.google.com",          icon = "news.png" },
                { label = "TechNews",  action = "https://arstechnica.com",          icon = "news.png" },
                { label = "Reddit T.", action = "https://reddit.com/r/technology",  icon = "news.png" },
            }
        },
    }
}
