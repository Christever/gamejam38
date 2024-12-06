Color       = {
    LIGHTGRAY   = { 200, 200, 200, 255 },
    GRAY        = { 130, 130, 130, 255 },
    DARKGRAY    = { 80, 80, 80, 255 },
    YELLOW      = { 253, 249, 0, 255 },
    GOLD        = { 255, 203, 0, 255 },
    ORANGE      = { 255, 161, 0, 255 },
    PINK        = { 255, 109, 194, 255 },
    RED         = { 230, 41, 55, 255 },
    MAROON      = { 190, 33, 55, 255 },
    GREEN       = { 0, 228, 48, 255 },
    LIME        = { 0, 158, 47, 255 },
    DARKGREEN   = { 0, 117, 44, 255 },
    SKYBLUE     = { 102, 191, 255, 255 },
    BLUE        = { 0, 121, 241, 255 },
    DARKBLUE    = { 0, 82, 172, 255 },
    PURPLE      = { 200, 122, 255, 255 },
    VIOLET      = { 135, 60, 190, 255 },
    DARKPURPLE  = { 112, 31, 126, 255 },
    BEIGE       = { 211, 176, 131, 255 },
    BROWN       = { 127, 106, 79, 255 },
    DARKBROWN   = { 76, 63, 47, 255 },

    WHITE       = { 255, 255, 255, 255 },
    BLACK       = { 0, 0, 0, 255 },
    MEDIUMBLACK = { 0, 0, 0, 102 },
    DARKBLACK   = { 0, 0, 0, 179 },
    BLANK       = { 0, 0, 0, 102 },
    MAGENTA     = { 255, 0, 255, 255 },
    RAYWHITE    = { 245, 245, 245, 255 },
}

TILESIZE    = 32

font_small  = love.graphics.newFont("fonts/Monospace.ttf", 16)
font_medium = love.graphics.newFont("fonts/Monospace.ttf", 24)
font_xl     = love.graphics.newFont("fonts/Monospace.ttf", 32)


-- Monsters
monsterList = {
    {
        name = "Araignée Géante",
        genre = "Une ", 
        force = math.random(3,5),
        attack = math.random(2,4),
        armure = math.random(2,4)
    },
    {
        name = "Gobelin",
        genre = "Un ",
        force = math.random(4,8),
        attack = math.random(4,9),
        armure = math.random(2,6)
    }
}


-- Utils

require("utils")
