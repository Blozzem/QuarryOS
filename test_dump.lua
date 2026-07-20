local dump =
    require("modules.dump")


print("================")
print(" Dump Test ")
print("================")


if dump.hasTrash() then

    print("Müll gefunden")

    dump.clean()

    print("Fertig")

else

    print("Kein Müll vorhanden")

end
