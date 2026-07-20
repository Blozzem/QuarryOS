local job =
    require("core.job")


print("Erstelle Test Quarry")


local j =
    job.create(10,10,5)


print("")

print("Breite:")
print(j.width)

print("Länge:")
print(j.length)

print("Tiefe:")
print(j.depth)


print("")
print("Speichere Fortschritt")


job.progress(j)


print("Fertig")
