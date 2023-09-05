local seeking = false
local playing = false
local script_enabled = true

function toggle_script()
    script_enabled = not script_enabled
    if script_enabled then
        mp.osd_message("boss key enabled")
    else
        mp.osd_message("boss key disabled")
    end
end

mp.add_key_binding("Ctrl+m", "toggle_script", toggle_script)

mp.observe_property("seeking", "bool", function(name, value)
    if not script_enabled then return end
    seeking = value
end)

mp.observe_property("pause", "bool", function(name, value)
    if not script_enabled then return end
    if value then
        if playing then
            mp.set_property("window-minimized", "yes")
        end
    else
        mp.set_property("window-minimized", "no")
        playing = true
    end
end)

mp.add_key_binding("b", "pause_and_minimize", function()
    if not script_enabled then return end
    mp.set_property_bool("pause", true)
    mp.set_property("window-minimized", "yes")
end)

mp.observe_property("window-maximized", "bool", function(name, value)
    if not script_enabled then return end
    if value and not seeking then
        mp.set_property("fullscreen", "yes")
    end
end)
