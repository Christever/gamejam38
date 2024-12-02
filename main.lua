io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest", "nearest")
require("reg")
local map              = {
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

local player           = {
    x = 2,
    y = 2,
    force = 40,
    attack = 10,
    const = 80,
    gold = 0
}
local explored         = {}
local tileSize         = 32
local visibilityRadius = 3

local mapWidth         = #map[1]
local mapHeight        = #map

function love.load()
    font_small  = love.graphics.newFont("fonts/Monospace.ttf", 16)
    font_medium = love.graphics.newFont("fonts/Monospace.ttf", 24)
    font_xl     = love.graphics.newFont("fonts/Monospace.ttf", 32)
    love.window.setMode(1400, 900)
    for y = 1, mapHeight do
        explored[y] = {}
        for x = 1, mapWidth do
            explored[y][x] = false
        end
    end
end

function isVisible(x, y)
    local dx = player.x - x
    local dy = player.y - y
    return dx * dx + dy * dy <= visibilityRadius * visibilityRadius
end

function love.draw()
    --#region Affiche la carte
    love.graphics.setFont(font_xl)
    love.graphics.setColor(Color.WHITE)
    for y, line in ipairs(map) do
        for x = 1, #line do
            local char = line:sub(x, x)
            if char == "#" then love.graphics.setColor(Color.WHITE) end
            if char == "F" then love.graphics.setColor(Color.GREEN) end
            if char == "C" then love.graphics.setColor(Color.WHITE) end
            if char == "W" then love.graphics.setColor(Color.BLUE) end
            if char == "M" then love.graphics.setColor(Color.GRAY) end
            love.graphics.print(char, (x - 1) * tileSize, (y - 1) * tileSize)
        end
    end
    --#endregion

    -- Affiche le joueur
    love.graphics.setColor(Color.DARKGREEN)
    love.graphics.print("@", (player.x - 1) * tileSize, (player.y - 1) * tileSize)

    --#region Brouillard
    love.graphics.setColor(Color.DARKBLACK)
    for y = 1, mapHeight do
        for x = 1, mapWidth do
            if not isVisible(x, y) then
                if explored[y][x] then
                    love.graphics.setColor(Color.MEDIUMBLACK)
                else
                    love.graphics.setColor(Color.BLACK)
                end
                love.graphics.rectangle("fill", (x - 1) * tileSize, (y - 1) * tileSize, tileSize, tileSize)
            end
        end
    end
    --#endregion
    love.graphics.setColor(Color.WHITE)

    drawUI()
end

function love.keypressed(key)
    local newX, newY = player.x, player.y
    local newConst = player.const
    if key == "up" then
        newY = newY - 1
    elseif key == "down" then
        newY = newY + 1
    elseif key == "left" then
        newX = newX - 1
    elseif key == "right" then
        newX = newX + 1
    end

    local id = map[newY]:sub(newX, newX)
    if id == " " or id == "C" or id == "M" or id == "F" then
        if id == "M" then
            newConst = newConst - 3
        elseif id == "F" then
            newConst = newConst - 2
        else
            newConst = newConst - 1
        end
        if newConst > 0 then
            player.x, player.y = newX, newY
            player.const = newConst
        end
    end

    for y = 1, mapHeight do
        for x = 1, mapWidth do
            if isVisible(x, y) then
                explored[y][x] = true
            end
        end
    end
end

function popMonster()

end

function drawUI()
    love.graphics.line(0, 500, 1400, 500)
    love.graphics.print("JOUEUR", 50, 520)
    love.graphics.setFont(font_medium)
    love.graphics.print("Force   : " .. player.force, 50, 560)
    love.graphics.print("Attaque : " .. player.attack, 50, 580)
    love.graphics.print("Const   : " .. player.const, 50, 600)
    love.graphics.print("Or      : " .. player.gold, 50, 620)
    love.graphics.line(0, 680, 1400, 680)

    if player.const <= 1 then
        love.graphics.print("Vous êtes epuisé. Vous devez vous reposez...", 50, 700)
    end
end
