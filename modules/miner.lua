local quarry =
    require("modules.quarry")

local movement =
    require("core.movement")


local miner = {}


local function mineLine(length)

    for i = 1,length do

        quarry.clear()

        if i < length then
            quarry.forward()
        end

    end

end



local function nextLineRight()

    movement.turnRight()

    quarry.clear()
    quarry.forward()

    movement.turnRight()

end



local function nextLineLeft()

    movement.turnLeft()

    quarry.clear()
    quarry.forward()

    movement.turnLeft()

end



function miner.start(data)

    print("Quarry gestartet")

    print(
        data.width ..
        " x " ..
        data.length ..
        " x " ..
        data.depth
    )


    -- Startfeld verlassen

    quarry.clear()
    quarry.forward()



    for layer = 1,data.depth do


        print("Ebene "..layer)



        for row = 1,data.length do


            mineLine(data.width)



            if row < data.length then


                if row % 2 == 1 then

                    nextLineRight()

                else

                    nextLineLeft()

                end


            end


        end



        if layer < data.depth then

            print("Nächste Ebene")

            movement.down()

        end


    end


    print("Quarry fertig")

end



return miner
