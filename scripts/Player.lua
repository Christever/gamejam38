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


return Player
