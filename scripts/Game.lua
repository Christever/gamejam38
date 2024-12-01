local Game = {}

local map

player = require("scripts.Player")
map = require("assets.maps.map_01")
city = require("scripts.City")
ui = require("scripts.UI")
local state = ""


function Game.load()
    love.graphics.setFont(font_xl)
    map.init()
    player.init()
end

function Game.update(dt)
    if state == "city" then
        player.const = player.const + dt
    end
    if love.keyboard.isDown("escape") and state=="city" then
        state = ""
    end
    player.update(dt)

end

function Game.draw()
    if state == "" then
        map.draw()
        player.draw()
    elseif state == "city" then
        city.draw()
    end
    ui.draw()
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
    if id == "." or id == "F" or id == "M" or id == "C" then
        if id == "." then     -- Degagé
            player.const = player.const - 1
        elseif id == "F" then -- Forêt
            player.const = player.const - 2
        elseif id == "M" then -- Montagne
            player.const = player.const - 5
        elseif id == "C" then
            state = "city"
        end
        if player.const > 0 then
            player.x, player.y = newX, newY
        else
            player.const = 0
        end
    end
end

function Game.mousepressed(x, y, btn)

end

return Game
