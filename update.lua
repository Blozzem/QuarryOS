--==========================================
-- QuarryOS Updater
-- Version 0.1
--==========================================

local BASE = "https://raw.githubusercontent.com/Blozzem/QuarryOS/main/"

local files = {

    "version.lua",

    "core/config.lua",
    "core/save.lua",
    "core/job.lua",
    "core/movement.lua",
    "core/homepoint.lua",
    "core/fuel.lua",
    "core/inventory.lua",

    "modules/quarry.lua",
    "modules/miner.lua",

    "setup.lua"

}

print("=================================")
print("      QuarryOS Updater")
print("=================================")
print("")

for _,file in ipairs(files) do

    print("Update: "..file)

    shell.run("delete "..file)

    shell.run(
        "wget "..BASE..file.." "..file
    )

end

print("")
print("=================================")
print("Update abgeschlossen!")
print("=================================")
