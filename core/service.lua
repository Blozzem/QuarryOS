--=====================================
-- QuarryOS Service Manager
--=====================================

local station =
    require("modules.station")

local service = {}


function service.run()

    print("Service gestartet")


    station.deposit()

    station.refuel()


    print("Service beendet")


end


return service
