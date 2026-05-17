-- by Linkz64
-- Removes lines containing the chosen strings from all cheat tables
-- in the chosen folder path.


-- Adjust these if needed
local folder_path = [[F:\Modding\Cheat Engine\Cheat Tables]]
local strings_to_find = {"<LastState"}
local search_sub_folders = false
-- Each these_files_only string must end with .ct
local these_files_only = {}






local function removeLines()
    local files = getFileList(folder_path, "*.ct", search_sub_folders)


    if #files < 1 then
        print("No .ct files found. Make sure you have the correct path in the lua script.")
        return
    end


    for i, filePath in ipairs(files) do

        for j, thisFileOnly in ipairs(these_files_only) do
            if not filePath:find(thisFileOnly) then
                goto continue
            end
        end


        print("Reading file: " .. filePath)

        local file = io.open(filePath, "r")

        if file then
            local lines = {}
            local lineIncrement = 1
            local notFound = 0

            for line in file:lines() do

                for j, stringToFind in ipairs(strings_to_find) do
                    if not line:find(stringToFind) then
                        table.insert(lines, line)
                        notFound = notFound + 1
                    end
                end
                -- print(string.format("[%d] %s", lineIncrement, line))
                lineIncrement = lineIncrement + 1
            end

            if notFound + 1 ~= lineIncrement then
                file:close()


                print("Writing")

                file = io.open(filePath, "w")

                for _, line in ipairs(lines) do
                    file:write(line .. "\n")
                end

                file:close()

                print("\nDone")
            else
                print("Done. No lines containing chosen strings.")
            end

        else
            print("Failed to open: " .. filePath)
        end

        ::continue::
    end
end

local function menuItemExists(parent, caption)
    for i = 0, parent.Items.Count - 1 do
        if parent.Items[i].Caption == caption then
            return i
        end
    end
    return -1
end




local mf = getMainForm()
local mi_index = menuItemExists(mf.Menu, "Essentials")

local mi = nil

if mi_index == -1 then
    mi = createMenuItem(mf.Menu)
    mi.Caption="Essentials"
    mf.Menu.Items.insert(mf.Menu.Items.Count-1, mi) --add it before the last entry (help)
else
    mi = mf.Menu.Items[mi_index]
end


local mi2=createMenuItem(mf.Menu)
mi2.Caption="Remove lines containing"
mi2.OnClick=function()
  removeLines()
end

mi.add(mi2)