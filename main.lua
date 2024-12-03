io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest", "nearest")
require("reg")
map                    = require("scripts.Map")

local player           = require("scripts.Player")
local visibilityRadius = 3


function love.load()
    
    love.window.setMode(1400, 900)
    map.init()
    player.init()
end

function isVisible(x, y)
    local dx = player.x - x
    local dy = player.y - y
    return dx * dx + dy * dy <= visibilityRadius * visibilityRadius
end

function love.draw()
    --Affiche la carte
    map.draw()

    -- Affiche le joueur
    player.draw()

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

    local id = map.level[newY]:sub(newX, newX)
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

    for y = 1, map.height do
        for x = 1, map.width do
            if isVisible(x, y) then
                map.explored[y][x] = true
            end
        end
    end
end


function drawUI()
    love.graphics.setColor(Color.GRAY)
    love.graphics.line(0, 500, 1400, 500)

    love.graphics.setColor(Color.WHITE)
    love.graphics.print("JOUEUR", 50, 520)
    love.graphics.setFont(font_medium)
    love.graphics.print("Force   : " .. player.force, 50, 560)
    love.graphics.print("Attaque : " .. player.attack, 50, 580)
    love.graphics.print("Const   : " .. player.const, 50, 600)
    love.graphics.print("Or      : " .. player.gold, 50, 620)

    love.graphics.setColor(Color.GRAY)
    love.graphics.line(0, 680, 1400, 680)

    if player.const <= 1 then
        love.graphics.print("Vous êtes epuisé. Vous devez vous reposez...", 50, 700)
    end
end

function movePlayer(key)
    
end