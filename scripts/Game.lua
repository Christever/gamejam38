local Game = {}
player = require("scripts.Player")
map = require("assets.maps.map_01")
city = require("scripts.City")
ui = require("scripts.UI")
repos = require("scripts.Repos")
state = "explore"


function Game.load()
    love.graphics.setFont(font_xl)
    map.init()
    player.init()
end

function Game.update(dt)
    player.update(dt)
end

function Game.draw()
    if state == "explore" then
        map.draw()
        player.draw()
    elseif state == "city" then
        city.draw()
    elseif state == "repos" then
        repos.draw()
    end
    ui.draw()
end

function Game.keypressed(key)
    if state == "explore" then
        player.keypressed(key)
    elseif state == "city" then
        city.keypressed(key)
    elseif state == "repos" then
        repos.keypressed(key)
    end
end

function Game.mousepressed(x, y, btn)

end

return Game
