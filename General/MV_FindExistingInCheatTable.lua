-- by Linkz64
-- Adds right click menu options in the Memory Viewer that
-- finds any records of the selected address or nearby ones.

-- Adjust these if needed
local nearby_distance = 0x40




local memView=getMemoryViewForm()
local hexView=memView.HexadecimalView
local m=hexView.PopupMenu

local function findExistingInCheatTable(address)
  GetLuaEngine().MenuItem5.doClick() 

  for i=0,AddressList.Count-1 do
    local mr = AddressList[i]
    local ct_address = mr.getCurrentAddress()
    
    if ct_address == address then
      print(mr.getDescription(), " | ", mr.getAddress())
    end
  end
end

local function findExistingInCheatTableNearby(address)
  GetLuaEngine().MenuItem5.doClick()

  for i=0,AddressList.Count-1 do
    local mr = AddressList[i]
    local ct_address = mr.getCurrentAddress()
    
    if ct_address >= address - nearby_distance and ct_address <= address + nearby_distance then
      if ct_address == address then
        print(mr.getDescription(), " | ", mr.getAddress(), "\t<------- Exact Match")
      else
        print(mr.getDescription(), " | ", mr.getAddress())
      end
    end
  end
end



local mCheckExistingInCT=createMenuItem(m)
mCheckExistingInCT.Caption="Find existing in Cheat Table"
mCheckExistingInCT.ImageIndex=69
mCheckExistingInCT.OnClick=function(sender)
  if hexView.HasSelection then
    findExistingInCheatTable(hexView.SelectionStart)
  end
end

local mCheckExistingInCTNearby=createMenuItem(m)
mCheckExistingInCTNearby.Caption="Find existing in Cheat Table (Nearby)"
mCheckExistingInCTNearby.ImageIndex=69
mCheckExistingInCTNearby.OnClick=function(sender)
  if hexView.HasSelection then
    findExistingInCheatTableNearby(hexView.SelectionStart)
  end
end

m.items.insert(memView.Cut1.MenuIndex,mCheckExistingInCT)
m.items.insert(memView.Cut1.MenuIndex,mCheckExistingInCTNearby)