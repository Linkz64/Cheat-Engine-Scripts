-- by Linkz64
-- Adds right click menu options for copying the
-- selection's start and stop address in the Memory Viewer.

-- Adjust these if needed
local include_leading_zeros = true
local copy_as_decimal = false
local copy_start_address_shortcut = "Ctrl+Alt+C"
local copy_stop_address_shortcut = "Ctrl+Alt+F"


local memView=getMemoryViewForm()
local hexView=memView.HexadecimalView
local m=hexView.PopupMenu

function copyAddressToClipboard(address_to_copy)
  if copy_as_decimal == false then
    if include_leading_zeros then
      address_to_copy = string.format("%08X", address_to_copy)
    else
      address_to_copy = string.format("%X", address_to_copy)
    end
  end
  writeToClipboard(address_to_copy)
end

local mCopyStartAddress=createMenuItem(m)
mCopyStartAddress.Caption="Copy selection start address"
mCopyStartAddress.ImageIndex=15
mCopyStartAddress.Shortcut=copy_start_address_shortcut
mCopyStartAddress.OnClick=function(sender)
  if hexView.HasSelection then
    copyAddressToClipboard(hexView.SelectionStart)
  end
end

local mCopyStopAddress=createMenuItem(m)
mCopyStopAddress.Caption="Copy selection stop address"
mCopyStopAddress.ImageIndex=15
mCopyStopAddress.Shortcut=copy_stop_address_shortcut
mCopyStopAddress.OnClick=function(sender)
  if hexView.HasSelection then
    copyAddressToClipboard(hexView.SelectionStop)
  end
end

m.items.insert(memView.Cut1.MenuIndex,mCopyStartAddress)
m.items.insert(memView.Cut1.MenuIndex,mCopyStopAddress)