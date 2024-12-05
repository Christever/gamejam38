local Dice = {}



function Dice.init()
   math.randomseed(os.time())
end

function Dice.lance(nbFace)
    return math.random(1, nbFace)
end

return Dice