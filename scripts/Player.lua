local Player = {}


function Player.init()
    Player.x        = 2
    Player.y        = 2
    Player.image    = "@"
    Player.strenght = 100
    Player.const    = 100
    Player.dext     = 100
    Player.int      = 100
    Player.sag      = 100
    Player.char     = 100
end

function Player.update(dt)
    if Player.const > 100 then
        Player.const = 100
    end
end

function Player.draw()
    love.graphics.setColor(Color.GOLD)
    love.graphics.print(Player.image, ((Player.x - 1) * TILE_SIZE) + DECAL_X, ((Player.y - 1) * TILE_SIZE) + DECAL_Y)
end

function Player.keypressed(key)

end

return Player
