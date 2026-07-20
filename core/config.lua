--[[
    QuarryOS
    Konfigurationssystem

    Diese Datei enthält alle dauerhaften
    Einstellungen der Quarry-Turtle.

    Wird beim ersten Start vom
    Einrichtungsassistenten erstellt.
]]


local config = {}


------------------------------------------------
-- Allgemeine Einstellungen
------------------------------------------------

-- Name der Turtle
config.name = "Quarry01"


------------------------------------------------
-- Navigation
------------------------------------------------

-- GPS wird automatisch erkannt
-- aktuell: kein GPS vorhanden
config.useGPS = false


-- Startstation verwenden
config.homeStation = true


------------------------------------------------
-- AutoDump
------------------------------------------------

-- Möglichkeiten:
-- chest
-- ender
-- ae2

config.dumpMode = "chest"


-- Dump-Kiste befindet sich hinten
config.dumpSide = "back"


------------------------------------------------
-- Treibstoff
------------------------------------------------

-- Fuel-Kiste rechts
config.fuelSide = "right"


-- Mindestreserve
-- Wenn weniger vorhanden:
-- zurück zur Basis

config.minimumFuel = 500


------------------------------------------------
-- Mining
------------------------------------------------

-- Standardmodus:
-- all = alles abbauen
-- ore = nur Erze speichern

config.miningMode = "all"


-- Seitenerz-Erkennung
config.sideMining = true


------------------------------------------------
-- Inventar
------------------------------------------------

-- Blöcke, die entsorgt werden dürfen

config.trash = {

    ["minecraft:cobblestone"] = true,
    ["minecraft:dirt"] = true,
    ["minecraft:gravel"] = true,
    ["minecraft:andesite"] = true,
    ["minecraft:diorite"] = true,
    ["minecraft:granite"] = true,
    ["minecraft:tuff"] = true

}


------------------------------------------------
-- Debug
------------------------------------------------

config.debug = true


return config
