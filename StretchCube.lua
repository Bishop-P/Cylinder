local cube = dofile("include/cube.lua")

local M_PI = 3.14159265

local function chomp(view, percent, height)
    local oldp = percent
    if percent < 0 then percent = -percent end

    local i = 0
	local i2 = 0
    while true do
        i = i + 2 -- "i" is the icon affected. So, i+1= every icon (up to 20 icons) is affected
        i2 = i - 1
		local v = view[i]
        local q = view[i2]
		if v == nil then break end
		if q == nil then break end
		
		local swag = -1
        local mult = 1
        if i <= 20 then mult = -1 end
		if i2 <= 20 then swag = 1 end
        v:translate(0, 0, swag*percent*height/-.5)
		q:translate(0, 0, swag*percent*height/-.5)
    end 
end

return function(page, offset, width, height)
    local percent = offset/width
    chomp(page, percent, height)
    cube(page, width, percent, true)
end
