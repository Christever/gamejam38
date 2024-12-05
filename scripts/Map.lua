local Map = {}




function Map.init()
    Map.level    = {
        "##############################",
        "#     FFFF    M       C      #",
        "#   C  FFF    M              #",
        "##   FFFFF  FFFF             #",
        "#   FFFFFF  FFFF             #",
        "#  FFFFFFFFFFFFF             #",
        "#                            #",
        "#        WWWWW               #",
        "#       WWWWWW          C    #",
        "#       WWWWWWWW             #",
        "#        WWWWWW              #",
        "#         WWW                #",
        "#                            #",
        "#   C                        #",
        "##############################"
    }

    Map.width    = #Map.level[1]
    Map.height   = #Map.level

    Map.explored = {}
    for y = 1, Map.height do
        Map.explored[y] = {}
        for x = 1, Map.width do
            Map.explored[y][x] = false
        end
    end
end

function Map.draw()
    local oldFont = love.graphics.getFont()
    local r, g, b, a = love.graphics.getColor()

    love.graphics.setFont(font_xl)
    love.graphics.setColor(Color.WHITE)
    for y, line in ipairs(Map.level) do
        for x = 1, #line do
            local char = line:sub(x, x)
            if char == "#" then love.graphics.setColor(Color.WHITE) end
            if char == "F" then love.graphics.setColor(Color.GREEN) end
            if char == "C" then love.graphics.setColor(Color.WHITE) end
            if char == "W" then love.graphics.setColor(Color.BLUE) end
            if char == "M" then love.graphics.setColor(Color.GRAY) end
            love.graphics.print(char, (x - 1) * TILESIZE, (y - 1) * TILESIZE)
        end
    end

    love.graphics.setColor(Color.DARKBLACK)
    for y = 1, Map.height do
        for x = 1, Map.width do
            if not isVisible(x, y, player.x, player.y, 3) then
                if Map.explored[y][x] then
                    love.graphics.setColor(Color.MEDIUMBLACK)
                else
                    love.graphics.setColor(Color.BLACK)
                end
                love.graphics.rectangle("fill", (x - 1) * TILESIZE, (y - 1) * TILESIZE, TILESIZE, TILESIZE)
            end
        end
    end
    love.graphics.setFont(oldFont)
    love.graphics.setColor(r, g, b, a)
end

function Map.getTile(pX, pY)
    return Map.level[pY]:sub(pX, pX)
end

function Map.setExplored()
    for y = 1, Map.height do
        for x = 1, Map.width do
            if isVisible(x, y) then
                Map.explored[y][x] = true
            end
        end
    end
end

return Map
