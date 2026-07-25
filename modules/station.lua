--=====================================
-- QuarryOS Station System v1
--
-- Kiste hinter der Turtle
--=====================================


local station = {}



------------------------------------------------
-- Items in die Kiste hinter der Turtle legen
------------------------------------------------

function station.deposit()

    print("Lade Inventar aus...")


    for slot = 1,16 do

        turtle.select(slot)

        turtle.drop()

    end


    turtle.select(1)

    print("Inventar ausgeladen")

end


------------------------------------------------
-- Fuel prüfen und auffüllen
------------------------------------------------

function station.refuel()

    print("Prüfe Fuel...")


    if turtle.getFuelLevel() > 100 then

        print("Fuel ausreichend")

        return true

    end


    print("Fuel niedrig")


    for slot = 1,16 do

        turtle.select(slot)

        if turtle.refuel(1) then

            print("Fuel aufgefüllt")

            return true

        end

    end


    print("Kein Fuel gefunden")


    return false

end



------------------------------------------------
-- Kompletter Stationsservice
------------------------------------------------

function station.service()


    print("Stationsservice")


    station.deposit()

    station.refuel()


    print("Service fertig")


end



return station
