local job =
    require("core.job")

local miner =
    require("modules.miner")



local quarryJob =
    job.create(
        5,
        5,
        3
    )


miner.start(quarryJob)
