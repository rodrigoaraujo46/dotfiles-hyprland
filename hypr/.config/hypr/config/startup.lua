---@param cmd string
---@param rules? table<string, string|number|boolean>
local function uwsm_scope(cmd, rules)
	hl.exec_cmd("uwsm-app -- " .. cmd, rules)
end

local function uwsm_service(cmd, rules)
	hl.exec_cmd("uwsm-app -t service -- " .. cmd, rules)
end

local function spotify_tray()
	uwsm_scope("spotify-launcher", { workspace = "2 silent" })
	hl.timer(function()
		hl.dispatch(hl.dsp.window.close({ window = "class:Spotify" }))
	end, { timeout = 3000, type = "oneshot" })
end

hl.on("hyprland.start", function()
	uwsm_service("waybar")
	uwsm_service("walker --gapplication-service")
	uwsm_service("hyprpaper")
	uwsm_scope(TERMINAL, { workspace = "1 silent" })
	uwsm_scope("zen-browser", { workspace = "2 silent" })
	spotify_tray()
end)
