--[[
    QuarryOS
    Miner Engine v1.0

    Erste echte Quarry-Funktion

    Schlangenlinien-Abbau
]]


local quarry =
    require("modules.quarry")

local movement =
    require("core.movement")

local job =
    require("core.job")



local miner = {}



------------------------------------------------
-- Eine Reihe abbauen
------------------------------------------------

local function mineRow(width)

    for i = 1,width do

        quarry.clear()

        quarry.forward()

    end

end



------------------------------------------------
-- Wenden
------------------------------------------------

local function turnAround()

    movement.turnRight()
    movement.turnRight()

end



------------------------------------------------
-- Eine Ebene abbauen
------------------------------------------------

local function mineLayer(data)


    for row = 1,data.length do


        mineRow(data.width)



        if row < data.length then


            if row % 2 == 1 then

                movement.turnRight()

                quarry.clear()
                quarry.forward()

                movement.turnRight()


            else

                movement.turnLeft()

                quarry.clear()
                quarry.forward()

                movement.turnLeft()

            end


        end


    end

end



------------------------------------------------
-- Quarry starten
------------------------------------------------

function miner.start(data)


    print("")
    print("================")
    print(" QuarryOS Miner ")
    print("================")


    print(
        data.width
        ..
        " x "
        ..
        data.length
        ..
        " x "
        ..
        data.depth
    )


    print("")


    -- Startfeld verlassen

    quarry.clear()

    quarry.forward()



    for layer = 1,data.depth do


        print(
            "Ebene "
            ..
            layer
        )


        mineLayer(data)



        if layer < data.depth then

            -- nächste Ebene

            movement.down()

        end


    end


    print("")

    print("Quarry abgeschlossen!")

end



return miner
