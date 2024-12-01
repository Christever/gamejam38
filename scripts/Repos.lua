local Repos = {}

function Repos.draw()
    love.graphics.setColor(Color.SKYBLUE)
    love.graphics.print("Bonne nuit...", 10, 10)
end

function Repos.keypressed(key)
    if key == "escape" then
        state = "city"
    end
end

return Repos
