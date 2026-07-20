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
-- Zur gespeicherten Startstation zurückkehren
------------------------------------------------

function movement.home()

    local homepoint =
        require("core.homepoint")


    local home =
        homepoint.get()


    if not home then

        print("FEHLER:")
        print("Keine Startstation gespeichert!")

        return false

    end



    print("")

    print("Fahre zur Startstation...")


    ------------------------------------------------
    -- Höhe anpassen
    ------------------------------------------------

    while state.y > home.y do
        movement.down()
    end


    while state.y < home.y do
        movement.up()
    end



    ------------------------------------------------
    -- X Position korrigieren
    ------------------------------------------------

    while state.x > home.x do

        while state.direction ~= 3 do
            movement.turnRight()
        end

        movement.forward()

    end



    while state.x < home.x do

        while state.direction ~= 1 do
            movement.turnRight()
        end

        movement.forward()

    end



    ------------------------------------------------
    -- Z Position korrigieren
    ------------------------------------------------

    while state.z > home.z do

        while state.direction ~= 0 do
            movement.turnRight()
        end

        movement.forward()

    end



    while state.z < home.z do

        while state.direction ~= 2 do
            movement.turnRight()
        end

        movement.forward()

    end



    print("Startstation erreicht!")

    return true

end



return movement
