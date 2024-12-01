local Game = {}

local map
local font
player = require("scripts.Player")
map = require("assets.maps.map_01")


function Game.load()
    love.graphics.setFont(font_xl)

    map.init()
    player.init()
end

function Game.update(dt)
    player.update(dt)
end

function Game.draw()
    map.draw()
    player.draw()
end

function Game.keypressed(key)
    local newX, newY = player.x, player.y
    if key == "up" then
        newY = player.y - 1
    end
    if key == "down" then
        newY = player.y + 1
    end
    if key == "left" then
        newX = player.x - 1
    end
    if key == "right" then
        newX = player.x + 1
    end

    local id = map.currentLevel[newY]:sub(newX, newX)

    if id == "."  or id =="F" then
        player.x, player.y = newX, newY
    end
end

function Game.mousepressed(x, y, btn)

end

return Game
