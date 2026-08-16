local isMirror, primary, secondary = false, "HDMI-A-1", "eDP-1"

MONITORS = {
	{ output = primary, mode = "1920x1080@144", position = "0x0", scale = 1 },
	{ output = secondary, mode = "1920x1080@144", position = "1920x0", scale = 1 },
}

local function updateWorkspaces(isMove)
	for i = 1, 10 do
		local target = (not isMirror and i > 5) and secondary or primary
		local ws = tostring(i)

		if isMove then
			DSP(hl.dsp.workspace.move({ workspace = ws, monitor = target }))
		else
			hl.workspace_rule({ monitor = target, workspace = ws })
		end
	end
end

local function toggleMirroring()
	isMirror = not isMirror
	MONITORS[2].mirror = isMirror and primary or ""
	hl.monitor(MONITORS[2])

	updateWorkspaces(false)
	hl.timer(function()
		updateWorkspaces(true)
	end, { timeout = 50, type = "oneshot" })
end

MAIN_BIND("SHIFT + M", toggleMirroring)

for _, m in ipairs(MONITORS) do
	hl.monitor(m)
end

updateWorkspaces(false)
