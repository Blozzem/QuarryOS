--[[
    QuarryOS
    Bewegungstest

    Fährt eine kleine Runde und
    kehrt zur Startposition zurück.
]]


local movement = require("core.movement")
local save = require("core.save")


print("========================")
print(" QuarryOS Bewegungstest ")
print("========================")

print("")


local pos = movement.getPosition()

print("Startposition:")
print("X: "..pos.x)
print("Y: "..pos.y)
print("Z: "..pos.z)

print("")

print("Fahre 5 Blöcke vor...")

for i = 1,5 do
    movement.forward()
end


print("")

print("Fahre 2 Blöcke hoch...")

for i = 1,2 do
    movement.up()
end


sleep(2)


print("")
print("Aktuelle Position:")

pos = movement.getPosition()

print("X: "..pos.x)
print("Y: "..pos.y)
print("Z: "..pos.z)


print("")
print("Kehre zur Startstation zurück...")


movement.home()


print("")
print("Fertig!")

pos = movement.getPosition()

print("Endposition:")
print("X: "..pos.x)
print("Y: "..pos.y)
print("Z: "..pos.z)
