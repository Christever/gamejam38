local Game = {}
player = require("scripts.Player")
map = require("assets.maps.map_01")
city = require("scripts.City")
ui = require("scripts.UI")
repos = require("scripts.Repos")
state = STATE.EXPLORE


function Game.load()
    love.graphics.setFont(font_xl)
    map.init()
    player.init()
end

function Game.update(dt)
    player.update(dt)
end

function Game.draw()
    if state == STATE.EXPLORE then
        map.draw()
        player.draw()
    elseif state == STATE.CITY then
        city.draw()
    elseif state == STATE.REPOS then
        repos.draw()
    end
    ui.draw()
end

function Game.keypressed(key)
    if state == STATE.EXPLORE then
        player.keypressed(key)
        monster = math.random(1, 6)
    elseif state == STATE.CITY then
        city.keypressed(key)
    elseif state == STATE.REPOS then
        repos.keypressed(key)
    end
end

function Game.mousepressed(x, y, btn)

end

return Game
