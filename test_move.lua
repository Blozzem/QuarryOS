local movement = require("core.movement")

print("Fahre 5 Blöcke vor...")

for i = 1,5 do
    movement.forward()
end

print("Fertig")
