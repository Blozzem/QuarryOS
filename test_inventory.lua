local inventory =
    require("core.inventory")


print("================")
print(" Inventar Test ")
print("================")


print("")

print(
"Freie Slots: "
..
inventory.getFreeSlots()
)


print(
"Belegte Slots: "
..
inventory.getUsedSlots()
)


local scan =
    inventory.scan()


print("")
print("Erkannt:")


print("Müll:")
for _,v in pairs(scan.trash) do
    print("- "..v)
end


print("Erze:")
for _,v in pairs(scan.ores) do
    print("- "..v)
end


print("Andere:")
for _,v in pairs(scan.other) do
    print("- "..v)
end
