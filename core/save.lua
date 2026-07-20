--[[
    QuarryOS
    Speicherverwaltung

    Speichert:
    - Position
    - Auftrag
    - Fortschritt

    Damit kann die Turtle nach
    Serverabstürzen weitermachen.
]]


local save = {}

local file = "data/state.dat"


------------------------------------------------
-- Standardzustand
------------------------------------------------

local state = {

    x = 0,
    y = 0,
    z = 0,

    direction = 0,

    layer = 0,

    width = 0,
    length = 0,
    depth = 0,

    blocksMined = 0,

    running = false

}


------------------------------------------------
-- Speichern
------------------------------------------------

function save.write(data)

    local handle = fs.open(file,"w")

    handle.write(
        textutils.serialize(data)
    )

    handle.close()

end



------------------------------------------------
-- Laden
------------------------------------------------

function save.read()

    if not fs.exists(file) then

        save.write(state)

        return state
    end


    local handle = fs.open(file,"r")

    local data =
        textutils.unserialize(
            handle.readAll()
        )

    handle.close()


    return data

end



------------------------------------------------
-- Zustand ändern
------------------------------------------------

function save.update(key,value)

    local data = save.read()

    data[key] = value

    save.write(data)

end



return save
