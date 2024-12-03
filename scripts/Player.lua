local Player = {}


function Player.init()
    Player.x = 2
    Player.y = 2
    Player.force = 40
    Player.attack = 10
    Player.const = 80
    Player.gold = 0
end

function Player.draw()
    local oldFont = love.graphics.getFont()
    love.graphics.setFont(font_xl)
    love.graphics.setColor(Color.DARKGREEN)
    love.graphics.print("P", (Player.x - 1) * TILESIZE, (Player.y - 1) * TILESIZE)
    love.graphics.setFont(oldFont)
end

function Player.keypressed(key)
    local newX, newY = Player.x, Player.y
    if key == "up" then
        newY = newY - 1
    elseif key == "down" then
        newY = newY + 1
    elseif key == "left" then
        newX = newX - 1
    elseif key == "right" then
        newX = newX + 1
    end
    return newX, newY
end

return Player
