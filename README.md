# Cheat Engine Scripts and Cheat Tables


## How to Download and Install
- Click on one of the links below
- Right click the page
- Click `Save as` or `Save Page As`

Install Autorun Script:
- Put it in the Cheat Engine autorun folder<br>
  *Don't add .txt at the end!*

Install Cheat Table:
- In Cheat Engine click `File` > `Load`


## Contributing
Feel free to add scripts and tables for offline games, offline programs and general cheat engine stuff.

If you want to update an existing cheat table file (.ct) please use [CTFile_RemoveLinesContaining.lua](https://raw.githubusercontent.com/Linkz64/Cheat-Engine-Scripts/refs/heads/main/General/CTFile_RemoveLinesContaining.lua) to remove the lines with "LastState" in them. *Those lines update often and make the commits messy.*



## Autorun Scripts
**[EmuRPM** [emurpm.lua](https://raw.githubusercontent.com/Linkz64/Cheat-Engine-Scripts/refs/heads/main/Emulator/EmuRPM/emurpm.lua) + [emurpm.frm](https://raw.githubusercontent.com/Linkz64/Cheat-Engine-Scripts/refs/heads/main/Emulator/EmuRPM/emurpm.frm)]<br>
Allows setting the base address pointer so that address 0x00000000 becomes the start of the console memory.<br>
e.g [eemem] for QT versions of PCSX2 which have a dynamic address.<br>
*Requires both the .lua and .frm files!*

[[CTFile_RemoveLinesContaining.lua](https://raw.githubusercontent.com/Linkz64/Cheat-Engine-Scripts/refs/heads/main/General/CTFile_RemoveLinesContaining.lua)]<br>
Cheat Table File: Adds a top bar option (Inside Essentials) that removes lines that contain the chosen strings.<br>
*Configs must be done inside the lua file!*

[[CT_CopyCurrentAddress.lua](https://raw.githubusercontent.com/Linkz64/Cheat-Engine-Scripts/refs/heads/main/General/CT_CopyCurrentAddress.lua)]<br>
Cheat Table: Adds a right click menu button that copies the current displayed address.<br>
*Configs available inside the lua file.*

[[MV_CopyAddress.lua](https://raw.githubusercontent.com/Linkz64/Cheat-Engine-Scripts/refs/heads/main/General/MV_CopyAddress.lua)]<br>
Memory Viewer: Adds 2 right click menu buttons that copy the selection start address and stop/end address.<br>
*Configs available inside the lua file.*

[[MV_CopySelectionSize.lua](https://raw.githubusercontent.com/Linkz64/Cheat-Engine-Scripts/refs/heads/main/General/MV_CopySelectionSize.lua)]<br>
Memory Viewer: Adds a right click menu button that copies the size of the selection.<br>
*Configs available inside the lua file.*

[[MV_FindExistingInCheatTable.lua](https://raw.githubusercontent.com/Linkz64/Cheat-Engine-Scripts/refs/heads/main/General/MV_FindExistingInCheatTable.lua)]<br>
Memory Viewer: Adds right click menu buttons that find any CT records of the selected address or nearby ones.<br>
*Configs available inside the lua file.*
