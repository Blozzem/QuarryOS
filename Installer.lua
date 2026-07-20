--[[
    QuarryOS Installer

    Dieser Installer richtet die Grundstruktur
    auf der Turtle ein.

    Aktuell:
    - Prüft Turtle
    - Erstellt Ordner
    - Erstellt Datenbereiche

    Später:
    - Lädt Module von GitHub
    - Startet Einrichtungsassistent
    - Prüft Mods
]]


local VERSION = "0.1.0"


------------------------------------------------
-- Hilfsfunktion
------------------------------------------------

local function info(text)
    print("[QuarryOS] " .. text)
end


------------------------------------------------
-- Start
------------------------------------------------

term.clear()
term.setCursorPos(1,1)


print("==============================")
print("       QuarryOS Installer")
print("==============================")
print("Version: "..VERSION)
print("")


------------------------------------------------
-- Turtle prüfen
------------------------------------------------

if not turtle then
    print("FEHLER:")
    print("Dieses Programm benötigt eine Turtle.")
    return
end


if turtle.getFuelLevel() == "unlimited" then
    info("Kreativmodus erkannt")
else
    info("Treibstoffsystem erkannt")
end


------------------------------------------------
-- Ordner erstellen
------------------------------------------------

local folders = {
    "core",
    "modules",
    "data",
    "logs"
}


for _, folder in ipairs(folders) do

    if not fs.exists(folder) then
        fs.makeDir(folder)
        info("Ordner erstellt: "..folder)
    end

end


------------------------------------------------
-- Installation abgeschlossen
------------------------------------------------

print("")
print("==============================")
print(" Installation vorbereitet")
print("==============================")

print("")
print("Nächster Schritt:")
print("Einrichtungsassistent folgt.")
