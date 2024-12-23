local defaultLangHandler = {}

-- Function to handle application activation
local function handleAppActivation(appName, appBundleID)
    local inputSources = hs.keycodes.currentSourceID()
    if inputSources ~= "com.apple.keylayout.ABC" then
        -- If the input method isn't "ABC", switch to it
        hs.keycodes.setLayout("ABC")
        -- Show an alert
        hs.alert.show(appName .. " : ABC")
        print("Changed input language for " .. appName .. " (" .. appBundleID .. ") to ABC")
    else
        print("Input language for " .. appName .. " (" .. appBundleID .. ") is already ABC")
    end
end

-- Map application bundle IDs to their respective handler functions
defaultLangHandler["com.microsoft.VSCode"] = handleAppActivation
defaultLangHandler["com.jetbrains.pycharm"] = handleAppActivation
defaultLangHandler["com.anytype.anytype"] = handleAppActivation  -- Correct bundle ID for AnyType
-- Add more applications and their handlers here

return defaultLangHandler