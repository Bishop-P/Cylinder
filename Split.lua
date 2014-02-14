local cube = dofile("include/cube.lua")

local M_PI = 3.14159265

local function chomp(view, percent, height)
    local oldp = percent
    if percent < 0 then percent = -percent end

    local i = 0
    while true do
        i = i + 1 -- "i" is the icon affected. So, i+1= every icon up to 8 icons (see line 16) is affected!
        local v = view[i]
        if v == nil then break end

        local mult = 1
        if i <= 10 then mult = -1 end
        v:translate(0, mult*percent*height/1, 0) 
    end 
end

return function(page, offset, width, height)
    local percent = offset/width
    chomp(page, percent, height)
    cube(page, width, percent, true)
end
