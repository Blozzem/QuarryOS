--=====================================
-- QuarryOS Path Recorder v1
--=====================================

local path = {}

path.moves = {}


---------------------------------------
-- Bewegung speichern
---------------------------------------

function path.add(move)

    table.insert(path.moves, move)

end



---------------------------------------
-- Weg löschen
---------------------------------------

function path.clear()

    path.moves = {}

end



---------------------------------------
-- Weg speichern
---------------------------------------

function path.save()

    local file =
        fs.open("data/path.dat","w")

    file.write(
        textutils.serialize(path.moves)
    )

    file.close()

end



---------------------------------------
-- Weg laden
---------------------------------------

function path.load()

    if not fs.exists("data/path.dat") then

        return {}

    end


    local file =
        fs.open("data/path.dat","r")


    local data =
        textutils.unserialize(
            file.readAll()
        )


    file.close()


    path.moves = data

    return data

end



---------------------------------------
-- Rückweg berechnen
---------------------------------------

function path.returnHome()


    for i=#path.moves,1,-1 do


        local move =
            path.moves[i]


        if move == "forward" then

            turtle.back()


        elseif move == "back" then

            turtle.forward()


        elseif move == "up" then

            turtle.down()


        elseif move == "down" then

            turtle.up()


        elseif move == "turnLeft" then

            turtle.turnRight()


        elseif move == "turnRight" then

            turtle.turnLeft()

        end


    end

end

---------------------------------------
-- Weg wieder ablaufen
---------------------------------------

function path.resume()


    print("Setze Arbeit fort...")


    for i = 1,#path.moves do


        local move =
            path.moves[i]


        if move == "forward" then

            turtle.forward()


        elseif move == "back" then

            turtle.back()


        elseif move == "up" then

            turtle.up()


        elseif move == "down" then

            turtle.down()


        elseif move == "turnLeft" then

            turtle.turnLeft()


        elseif move == "turnRight" then

            turtle.turnRight()

        end


    end


    print("Position wieder erreicht")


end

return path
