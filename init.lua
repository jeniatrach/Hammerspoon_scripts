local defaultLangHandler = require("defaultLangHandler")

-- Monitor application activation events
local appWatcher = hs.application.watcher.new(function(appName, eventType, app)
    if eventType == hs.application.watcher.activated or eventType == hs.application.watcher.unhidden then
        local appBundleID = app:bundleID()
        print("Activated application: " .. appName .. " (" .. appBundleID .. ")")
        local handler = defaultLangHandler[appBundleID]
        if handler then
            handler(appName, appBundleID)
        else
            hs.logger.new("AppWatcher", "warning"):w("Unexpected application activated: " .. appName .. " (" .. appBundleID .. ")")
        end
    end
end)

-- Start the application watcher
appWatcher:start()

-- Show an alert that Hammerspoon has loaded the configuration
hs.alert.show("Hammerspoon : Configuration loaded")

-- Add a periodic timer to log that Hammerspoon is running
hs.timer.doEvery(60, function()
    print("Hammerspoon is running")
end)