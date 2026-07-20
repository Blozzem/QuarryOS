--[[
    QuarryOS
    Home Manager

    Verwaltet die Startstation.

    Aufgaben:
    - Rückkehr zur Basis
    - Dump ausführen
    - Fuel prüfen

    Später:
    - Rückkehr zum Arbeitsplatz
]]


local home = {}

local movement =
    require("core.movement")

local dump =
    require("modules.dump")

local fuel =
    require("core.fuel")



------------------------------------------------
-- Zur Basis zurückkehren
------------------------------------------------

function home.goHome()

    print("")

    print("Rückkehr zur Startstation...")


    movement.home()


    print("Basis erreicht")

end



------------------------------------------------
-- Station bearbeiten
------------------------------------------------

function home.service()

    print("")

    print("================")
    print(" Basis-Service ")
    print("================")


    -- Müll entfernen

    if dump.hasTrash() then

        print("Entleere Müll...")

        dump.clean()

    else

        print("Kein Müll")

    end



    -- Fuel prüfen

    print("")

    fuel.check()


    print("Service abgeschlossen")

end



------------------------------------------------
-- Komplettservice
------------------------------------------------

function home.returnAndService()

    home.goHome()

    home.service()

end



return home
