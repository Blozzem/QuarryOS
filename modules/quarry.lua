--[[
    QuarryOS
    Quarry Engine

    Teil 1:
    Grundlegende Abbau-Funktionen

    Verantwortlich für:
    - Blöcke abbauen
    - Hindernisse entfernen
    - sichere Bewegungen
]]


local quarry = {}

local movement =
    require("core.movement")



------------------------------------------------
-- Block vor der Turtle abbauen
------------------------------------------------

function quarry.dig()

    while turtle.detect() do

        turtle.dig()

        sleep(0.2)

    end

end



------------------------------------------------
-- Block über der Turtle abbauen
------------------------------------------------

function quarry.digUp()

    while turtle.detectUp() do

        turtle.digUp()

        sleep(0.2)

    end

end



------------------------------------------------
-- Block unter der Turtle abbauen
------------------------------------------------

function quarry.digDown()

    while turtle.detectDown() do

        turtle.digDown()

        sleep(0.2)

    end

end



------------------------------------------------
-- Sicher vorwärts fahren
------------------------------------------------

function quarry.forward()

    quarry.dig()


    return movement.forward()

end



------------------------------------------------
-- Sicher nach oben
------------------------------------------------

function quarry.up()

    quarry.digUp()


    return movement.up()

end



------------------------------------------------
-- Sicher nach unten
------------------------------------------------

function quarry.down()

    quarry.digDown()


    return movement.down()

end



------------------------------------------------
-- Einen Block abbauen
------------------------------------------------

function quarry.clear()

    quarry.dig()
    quarry.digUp()
    quarry.digDown()

end



return quarry
