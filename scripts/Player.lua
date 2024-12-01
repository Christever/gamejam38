local Player = {}

function Player.init()
    Player.x = 2
    Player.y = 2
    Player.image = "@"
end

function Player.update(dt)

end

function Player.draw()
    love.graphics.setColor(Color.GOLD)
    love.graphics.print("P", ((Player.x - 1) * TILE_SIZE) + DECAL_X, ((Player.y - 1) * TILE_SIZE) + DECAL_Y)
end

function Player.keypressed(key)

end

return Player
