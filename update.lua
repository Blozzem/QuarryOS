--=====================================
-- QuarryOS Updater v2
--=====================================


local BASE =
"https://raw.githubusercontent.com/Blozzem/QuarryOS/main/"



print("==========================")
print("    QuarryOS Update v2")
print("==========================")
print("")



------------------------------------------------
-- Alte Manifest sichern
------------------------------------------------

if fs.exists("manifest.lua") then

    fs.delete("manifest_old.lua")

    fs.copy(
        "manifest.lua",
        "manifest_old.lua"
    )

    print("Alte Manifest gesichert")

end



------------------------------------------------
-- Neue Manifest laden
------------------------------------------------

print("Lade neue Manifest...")


shell.run(
    "wget "..BASE.."manifest.lua manifest.lua"
)



local newFiles =
    dofile("manifest.lua")



------------------------------------------------
-- Alte Dateien löschen
------------------------------------------------

if fs.exists("manifest_old.lua") then


    print("")
    print("Entferne alte Dateien...")


    local oldFiles =
        dofile("manifest_old.lua")


    for _,file in ipairs(oldFiles) do


        if fs.exists(file) then

            print("Loesche "..file)

            fs.delete(file)

        end


    end


end



------------------------------------------------
-- Neue Dateien installieren
------------------------------------------------


print("")
print("Installiere neue Dateien...")


for _,file in ipairs(newFiles) do


    local dir =
        fs.getDir(file)


    if dir ~= "" then

        fs.makeDir(dir)

    end


    print("Lade "..file)


    shell.run(
        "wget "..BASE..file.." "..file
    )


end



print("")
print("==========================")
print(" Update abgeschlossen!")
print("==========================")
