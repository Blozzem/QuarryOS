--[[
    QuarryOS
    Job-System

    Speichert den aktuellen Quarry-Auftrag.

    Beispiel:
    32 x 32 x 64 Quarry
]]


local job = {}


local file = "data/job.dat"



------------------------------------------------
-- Neuen Auftrag erstellen
------------------------------------------------

function job.create(width,length,depth)

    local data = {

        width = width,
        length = length,
        depth = depth,

        layer = 0,

        row = 0,

        column = 0,

        direction = 1,

        running = true,

        finished = false

    }


    local f =
        fs.open(file,"w")


    f.write(
        textutils.serialize(data)
    )


    f.close()


    return data

end



------------------------------------------------
-- Auftrag laden
------------------------------------------------

function job.load()

    if not fs.exists(file) then
        return nil
    end


    local f =
        fs.open(file,"r")


    local data =
        textutils.unserialize(
            f.readAll()
        )


    f.close()


    return data

end



------------------------------------------------
-- Auftrag speichern
------------------------------------------------

function job.save(data)

    local f =
        fs.open(file,"w")


    f.write(
        textutils.serialize(data)
    )


    f.close()

end



------------------------------------------------
-- Fortschritt erhöhen
------------------------------------------------

function job.progress(data)

    data.column =
        data.column + 1


    if data.column >= data.width then

        data.column = 0

        data.row =
            data.row + 1

    end


    if data.row >= data.length then

        data.row = 0

        data.layer =
            data.layer + 1

    end


    if data.layer >= data.depth then

        data.finished = true
        data.running = false

    end



    job.save(data)

end



return job
