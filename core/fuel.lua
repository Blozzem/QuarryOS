--[[
    QuarryOS
    Fuel-System

    Verwaltet den Treibstoff der Turtle.

    Die Position der Fuel-Kiste
    wird aus der config.lua geladen.

    Standard:
    Fuel-Kiste rechts

    Später:
    frei wählbar im Setup
]]


local fuel = {}

local config = require("core.config")


------------------------------------------------
-- Fuel-Seite aus Konfiguration
------------------------------------------------

local fuelSide = config.fuelSide or "right"



------------------------------------------------
-- Aktuellen Fuel-Stand zurückgeben
------------------------------------------------

function fuel.getLevel()

    return turtle.getFuelLevel()

end



------------------------------------------------
-- Prüfen ob genug Fuel vorhanden ist
------------------------------------------------

function fuel.hasEnough(amount)

    local level = fuel.getLevel()

    if level == "unlimited" then
        return true
    end

    return level >= amount

end



------------------------------------------------
-- Fuel nachladen
------------------------------------------------

function fuel.refill()

    if turtle.getFuelLevel() == "unlimited" then
        return true
    end


    print("Suche Fuel...")


    for slot = 1,16 do

        turtle.select(slot)

        local item = turtle.getItemDetail()


        if item then

            if turtle.refuel(0) then

                turtle.refuel()

                print("Fuel geladen")

            end

        end

    end


    turtle.select(1)


    return true

end



------------------------------------------------
-- Fuel prüfen
------------------------------------------------

function fuel.check()

    local level = fuel.getLevel()


    print("Fuel: "..level)


    if level == "unlimited" then
        return true
    end


    if level < config.minimumFuel then

        print("")
        print("Fuel niedrig!")

        fuel.refill()

    end


    if fuel.getLevel() < 100 then

        print("Kein ausreichender Fuel vorhanden")

        return false

    end


    return true

end



return fuel
