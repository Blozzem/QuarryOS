--[[
    QuarryOS
    Versionsverwaltung

    Diese Datei enthält nur die aktuelle Version.
    Der Installer und Updater greifen darauf zu.
]]

local version = {}

-- Aktuelle QuarryOS Version
version.major = 0
version.minor = 1
version.patch = 0

-- Versionsname
version.name = "QuarryOS v0.1 Alpha"


-- Gibt die Versionsnummer als Text zurück
function version.getString()
    return string.format(
        "%d.%d.%d",
        version.major,
        version.minor,
        version.patch
    )
end


-- Gibt den kompletten Namen zurück
function version.getName()
    return version.name
end


return version
