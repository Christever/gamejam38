local Game = {}

local map
local font
local player = require("scripts.Player")
local map = require("assets.maps.map_01")


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
    player.keypressed(key)
end

function Game.mousepressed(x, y, btn)

end

return Game
