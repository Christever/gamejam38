local Player = {}


function Player.init()
    Player.x        = 2
    Player.y        = 2
    Player.image    = "@"
    Player.strenght = 100
    Player.const    = 100
    Player.dext     = 100
    Player.int      = 100
    player.sag      = 100
    player.char     = 100
end

function Player.update(dt)

end

function Player.draw()
    love.graphics.setColor(Color.GOLD)
    love.graphics.print(Player.image, ((Player.x - 1) * TILE_SIZE) + DECAL_X, ((Player.y - 1) * TILE_SIZE) + DECAL_Y)
end

function Player.keypressed(key)

end

return Player
