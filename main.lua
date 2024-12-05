io.stdout:setvbuf("no")
love.graphics.setDefaultFilter("nearest", "nearest")
require("reg")
map                    = require("scripts.Map")

player                 = require("scripts.Player")
local visibilityRadius = 3
combat                 = false
monstre                = nil

dice                   = require("scripts.Dice")

state                  = "explore"

function love.load()
    love.window.setMode(1400, 900)
    map.init()
    player.init()
    dice.init()
end

function love.draw()
    --Affiche la carte
    map.draw()

    -- Affiche le joueur
    player.draw()
    drawUI()
end

function love.keypressed(key)
    if state == "explore" then
        local newConst = player.const
        local newX, newY = player.keypressed(key)
        local id = map.getTile(newX, newY)

        if id == " " or id == "C" or id == "M" or id == "F" then
            if id == "M" then
                newConst = newConst - 3
            elseif id == "F" then
                newConst = newConst - 2
            else
                newConst = newConst - 1
            end
            if newConst > 0 then
                player.x, player.y = newX, newY
                player.const = newConst
                local d = dice.lance(20)
                if d > 12 then
                    rencontre()
                end
            end
        end

        for y = 1, map.height do
            for x = 1, map.width do
                if isVisible(x, y, player.x, player.y, 3) then
                    map.explored[y][x] = true
                end
            end
        end
        -- Combat
    elseif key == "1" or key == "kp1" and state == "combat" then
        -- Fuite
    elseif key == "2" or key == "kp2" and state == "combat" then
        state = "fuite"
    end
end



function rencontre()
    monstre = monsterList[math.random(1, #monsterList)]
    combat = true
    state = "combat"
end

function drawUI()
    love.graphics.setColor(Color.GRAY)
    love.graphics.line(0, 500, 1400, 500)

    love.graphics.setColor(Color.WHITE)
    love.graphics.print("JOUEUR", 50, 520)
    love.graphics.setFont(font_medium)

    love.graphics.print("Force   : " .. player.force, 50, 560)
    love.graphics.print("Attaque : " .. player.attack, 50, 580)
    love.graphics.print("Armure  : " .. player.armure, 50, 600)
    love.graphics.print("Const   : " .. player.const, 50, 620)
    love.graphics.print("Or      : " .. player.gold, 50, 640)


    if state == "combat" then
        love.graphics.print(monstre.name, 500, 520)
        love.graphics.print("Force   : " .. monstre.force, 500, 560)
        love.graphics.print("Attaque : " .. monstre.attack, 500, 580)
        love.graphics.print("Armure  : " .. monstre.armure, 500, 600)
        goCombat()
    elseif state == "fuite" then
        love.graphics.print("Vous fuyez comme un lache...",50, 720)
        love.graphics.print("Cela vous coute 3 points d'endurance...",50, 750)
        state = "explore"
    end

    love.graphics.setColor(Color.GRAY)
    love.graphics.line(0, 680, 1400, 680)

    if player.const <= 1 then
        love.graphics.print("Vous êtes epuisé. Vous devez vous reposez...", 50, 700)
    end
end

function goCombat()
    love.graphics.setColor(Color.WHITE)
    love.graphics.print(monstre.genre .. monstre.name .. " est devant vous", 50, 700)
    love.graphics.print("Que faites-vous ?", 50, 730)
    love.graphics.print("1 - Combattre", 50, 760)
    love.graphics.print("2 - Fuir", 50, 790)
end
