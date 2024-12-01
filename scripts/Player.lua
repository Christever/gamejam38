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
    player.gold     = 0
end

function Player.update(dt)
    if state == STATE.REPOS then
        Player.const = Player.const + dt
        if Player.const > 100 then
            Player.const = 100
        end
    end
end

function Player.draw()
    love.graphics.setColor(Color.GOLD)
    love.graphics.print(Player.image, ((Player.x - 1) * TILE_SIZE) + DECAL_X, ((Player.y - 1) * TILE_SIZE) + DECAL_Y)
end

function Player.keypressed(key)
    if state == STATE.EXPLORE then
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
                state = STATE.CITY
            end
            if player.const > 0 then
                player.x, player.y = newX, newY
            else
                player.const = 0
            end
        end
    end
end

return Player
