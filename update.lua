--=================================
-- QuarryOS Updater
--=================================


local BASE =
"https://raw.githubusercontent.com/Blozzem/QuarryOS/main/"


print("==============================")
print("       QuarryOS Update")
print("==============================")
print("")


shell.run(
    "wget "..BASE.."manifest.lua manifest.lua"
)


local files =
    dofile("manifest.lua")



for _,file in ipairs(files) do


    print("Update:")
    print(file)


    local folder =
        fs.getDir(file)


    if folder ~= "" then

        fs.makeDir(folder)

    end


    shell.run(
        "wget "..BASE..file.." "..file
    )


end



print("")
print("==============================")
print(" Update fertig!")
print("==============================")
