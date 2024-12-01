io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest", "nearest")

require("reg")

game = require("scripts.Game")

function love.load()
    font_small = love.graphics.newFont("assets/fonts/Monospace.ttf", 16)
    font_xl    = love.graphics.newFont("assets/fonts/Monospace.ttf", 32)
    love.window.setMode(1400, 900)
    game.load()
end

function love.update(dt)
    game.update(dt)
end

function love.draw()
    game.draw()
end

function love.keypressed(key)
    game.keypressed(key)
end

function love.mousepressed(x, y, btn)

end
