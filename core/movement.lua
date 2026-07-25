--=====================================
-- QuarryOS Movement System v1
--=====================================

local path =
    require("core.path")


local move = {}


---------------------------------------
-- Vorwärts
---------------------------------------

function move.forward()

    if turtle.forward() then

        path.add("forward")
        path.save()

        return true

    end

    return false

end



---------------------------------------
-- Rückwärts
---------------------------------------

function move.back()

    if turtle.back() then

        path.add("back")
        path.save()

        return true

    end

    return false

end



---------------------------------------
-- Hoch
---------------------------------------

function move.up()

    if turtle.up() then

        path.add("up")
        path.save()

        return true

    end

    return false

end



---------------------------------------
-- Runter
---------------------------------------

function move.down()

    if turtle.down() then

        path.add("down")
        path.save()

        return true

    end

    return false

end



---------------------------------------
-- Links drehen
---------------------------------------

function move.turnLeft()

    turtle.turnLeft()

    path.add("turnLeft")
    path.save()

end



---------------------------------------
-- Rechts drehen
---------------------------------------

function move.turnRight()

    turtle.turnRight()

    path.add("turnRight")
    path.save()

end



return move
