--[[
    QuarryOS
    Homepoint Verwaltung

    Speichert die Startstation.
]]


local save = require("core.save")

local homepoint = {}


local file = "data/home.dat"


function homepoint.set()

    local pos = save.read()


    local home = {

        x = pos.x,
        y = pos.y,
        z = pos.z,
        direction = pos.direction

    }


    local f = fs.open(file,"w")

    f.write(
        textutils.serialize(home)
    )

    f.close()


    print("Startstation gespeichert!")

end



function homepoint.get()

    if not fs.exists(file) then
        return nil
    end


    local f = fs.open(file,"r")

    local data =
        textutils.unserialize(
            f.readAll()
        )

    f.close()


    return data

end


return homepoint
