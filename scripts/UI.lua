local UI = {}

function UI.update(dt)
    
end

function UI.draw()
    love.graphics.print("PLAYER", 1100,50)
    love.graphics.print("CONST : "..player.const, 1050, 90)
    love.graphics.print("FORCE : "..player.strenght, 1050, 120)
    love.graphics.print("DEXT  : "..player.dext, 1050, 150)
    love.graphics.print("INT   : "..player.int, 1050, 180)
    love.graphics.print("SAG   : "..player.sag, 1050, 210)
    love.graphics.print("CHAR  : "..player.char, 1050, 240)

end

return UI