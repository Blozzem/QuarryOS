--[[
    QuarryOS
    Inventarverwaltung

    Aufgaben:
    - Inventar prüfen
    - freie Slots erkennen
    - Müll erkennen
    - Erze/Rohstoffe schützen

    Aktuell:
    Nur Erkennung.
    Entsorgung kommt mit AutoDump.
]]


local inventory = {}

local config = require("core.config")


------------------------------------------------
-- Freie Slots zählen
------------------------------------------------

function inventory.getFreeSlots()

    local free = 0


    for slot = 1,16 do

        if turtle.getItemCount(slot) == 0 then
            free = free + 1
        end

    end


    return free

end



------------------------------------------------
-- Belegte Slots zählen
------------------------------------------------

function inventory.getUsedSlots()

    return 16 - inventory.getFreeSlots()

end



------------------------------------------------
-- Inventar voll?
------------------------------------------------

function inventory.isFull()

    return inventory.getFreeSlots() == 0

end



------------------------------------------------
-- Item prüfen
------------------------------------------------

function inventory.isTrash(item)

    if not item then
        return false
    end


    local name = item.name


    if config.trash[name] then
        return true
    end


    return false

end



------------------------------------------------
-- Erze erkennen
------------------------------------------------

function inventory.isOre(item)

    if not item then
        return false
    end


    local name = item.name


    if string.find(name,"ore") then
        return true
    end


    return false

end



------------------------------------------------
-- Inventar Übersicht
------------------------------------------------

function inventory.scan()

    local result = {

        trash = {},
        ores = {},
        other = {}

    }



    for slot = 1,16 do

        local item =
            turtle.getItemDetail(slot)


        if item then


            if inventory.isTrash(item) then

                table.insert(
                    result.trash,
                    item.name
                )


            elseif inventory.isOre(item) then

                table.insert(
                    result.ores,
                    item.name
                )


            else

                table.insert(
                    result.other,
                    item.name
                )

            end


        end

    end


    return result

end



return inventory
