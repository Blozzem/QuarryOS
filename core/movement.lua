--[[
    QuarryOS
    Bewegungssystem

    Verwaltet die Position der Turtle.

    GPS wird NICHT benötigt.
    Die Turtle zählt jede Bewegung mit.

    Koordinaten:
    X = links/rechts
    Y = Höhe
    Z = vor/zurück

    Richtung:
    0 = Norden
    1 = Osten
    2 = Süden
    3 = Westen
]]


local save = require("core.save")

local movement = {}


------------------------------------------------
-- Aktuellen Zustand laden
------------------------------------------------

local state = save.read()


------------------------------------------------
-- Richtungen
------------------------------------------------

local directions = {
    "Norden",
    "Osten",
    "Süden",
    "Westen"
}


------------------------------------------------
-- Status anzeigen
------------------------------------------------

function movement.getPosition()

    return {
        x = state.x,
        y = state.y,
        z = state.z,
        direction = state.direction
    }

end



------------------------------------------------
-- Speichern
------------------------------------------------

local function savePosition()

    save.write(state)

end



------------------------------------------------
-- Vorwärts bewegen
------------------------------------------------

function movement.forward()

    while not turtle.forward() do

        -- Block abbauen
        turtle.dig()

        sleep(0.2)

    end


    if state.direction == 0 then
        state.z = state.z - 1

    elseif state.direction == 1 then
        state.x = state.x + 1

    elseif state.direction == 2 then
        state.z = state.z + 1

    elseif state.direction == 3 then
        state.x = state.x - 1
    end


    savePosition()

    return true

end



------------------------------------------------
-- Rückwärts
------------------------------------------------

function movement.back()

    turtle.back()


    if state.direction == 0 then
        state.z = state.z + 1

    elseif state.direction == 1 then
        state.x = state.x - 1

    elseif state.direction == 2 then
        state.z = state.z - 1

    elseif state.direction == 3 then
        state.x = state.x + 1
    end


    savePosition()

end



------------------------------------------------
-- Nach oben
------------------------------------------------

function movement.up()

    while not turtle.up() do

        turtle.digUp()

        sleep(0.2)

    end


    state.y = state.y + 1

    savePosition()

end



------------------------------------------------
-- Nach unten
------------------------------------------------

function movement.down()

    while not turtle.down() do

        turtle.digDown()

        sleep(0.2)

    end


    state.y = state.y - 1

    savePosition()

end



------------------------------------------------
-- Drehen links
------------------------------------------------

function movement.turnLeft()

    turtle.turnLeft()

    state.direction =
        (state.direction - 1) % 4

    savePosition()

end



------------------------------------------------
-- Drehen rechts
------------------------------------------------

function movement.turnRight()

    turtle.turnRight()

    state.direction =
        (state.direction + 1) % 4

    savePosition()

end



------------------------------------------------
-- Zur Startposition zurück
------------------------------------------------

function movement.home()

    -- Höhe ausgleichen

    while state.y > 0 do
        movement.down()
    end


    while state.y < 0 do
        movement.up()
    end



    -- X korrigieren

    while state.x > 0 do

        while state.direction ~= 3 do
            movement.turnRight()
        end

        movement.forward()

    end


    while state.x < 0 do

        while state.direction ~= 1 do
            movement.turnRight()
        end

        movement.forward()

    end



    -- Z korrigieren

    while state.z > 0 do

        while state.direction ~= 0 do
            movement.turnRight()
        end

        movement.forward()

    end


    while state.z < 0 do

        while state.direction ~= 2 do
            movement.turnRight()
        end

        movement.forward()

    end

end



return movement
