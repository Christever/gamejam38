local Map = {}
Map.level01 = {}
Map.currentLevel = {}

function Map.init()
    Map.level01 = {
        "##############################",
        "#.....FFFF....M.......C......#",
        "#.....FFFF....M..............#",
        "##...FFFFF..FFFF.............#",
        "#...FFFFFF..FFFF.............#",
        "#..FFFFFFFFFFFFF.............#",
        "#............................#",
        "#........WWWWW...............#",
        "#.......WWWWWW..........C....#",
        "#.......WWWWWWWW.............#",
        "#........WWWWWW..............#",
        "#.........WWW................#",
        "#........................$...#",
        "#...C........................#",
        "##############################"
    }

    Map.currentLevel = Map.level01
end

function Map.draw()
    for y, line in ipairs(Map.currentLevel) do
        for x = 1, #line do
            local char = line:sub(x, x)
            if char == "#" or char == "." then
                love.graphics.setColor(Color.WHITE)
            elseif char == "$" then
                love.graphics.setColor(Color.YELLOW)
            elseif char == "M" then
                love.graphics.setColor(Color.GRAY)
            elseif char == "F" then
                love.graphics.setColor(Color.GREEN)
            elseif char =="W" then
                love.graphics.setColor(Color.BLUE)
            end
            love.graphics.print(char, ((x - 1) * TILE_SIZE) + DECAL_X, ((y - 1) * TILE_SIZE) + DECAL_Y)
        end
    end
end

return Map
