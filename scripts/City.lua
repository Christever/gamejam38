City = {}

function City.update(dt)

end

function City.draw()
    love.graphics.setColor(Color.SKYBLUE)
    love.graphics.print("Vous êtes à l'auberge", 10, 10)

    love.graphics.print("1 - Dormir", 10, 50)
    love.graphics.print("2 - Marchand", 10, 80)
end

function City.keypressed(key)
    if key == "1" then
        state = "repos"
    end
    if key == "escape"then
        state = "explore"
    end
end

return City
