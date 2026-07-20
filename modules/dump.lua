--[[
    QuarryOS
    AutoDump System

    Leert nur definierte Müll-Items.

    Standard:
    Dump-Kiste hinten.

    Wertvolle Items bleiben sicher.
]]


local dump = {}

local config =
    require("core.config")



------------------------------------------------
-- Müll aus Inventar entfernen
------------------------------------------------

function dump.clean()

    print("Starte Inventarprüfung...")


    for slot = 1,16 do

        turtle.select(slot)


        local item =
            turtle.getItemDetail(slot)


        if item then


            if config.trash[item.name] then

                print(
                    "Entsorge: "
                    ..
                    item.name
                )


                turtle.drop()

            end

        end

    end


    turtle.select(1)

end



------------------------------------------------
-- Prüfen ob Müll vorhanden
------------------------------------------------

function dump.hasTrash()

    for slot = 1,16 do

        local item =
            turtle.getItemDetail(slot)


        if item then

            if config.trash[item.name] then

                return true

            end

        end

    end


    return false

end



return dump
