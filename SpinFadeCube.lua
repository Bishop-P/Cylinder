local cube = dofile("include/cube.lua")

local M_PI = 3.14159265

local function spinfade(view, percent)
    local angle = percent*M_PI*2
	local x = percent
	if percent < 0 then x = -x end
	
    local i = 0
    while true do
        i = i + 1
        local v = view[i]
        if v == nil then break end
        v:rotate(angle)
		v.alpha = 1 - percent
    end
end

return function(page, offset, width, height)
    local percent = offset/width
    spinfade(page, percent)
    cube(page, width, percent, false)
end
