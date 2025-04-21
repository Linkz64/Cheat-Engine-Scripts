-- by Linkz64
-- Adds right click menu option for copying
-- selection size in the Memory Viewer.

-- Adjust these if needed
local include_leading_zeros = false
local copy_as_decimal = false
local copy_selection_size_shortcut = "Shift+Ctrl+S"


local memView=getMemoryViewForm()
local hexView=memView.HexadecimalView
local m=hexView.PopupMenu

local mCopySelectionSize=createMenuItem(m)
mCopySelectionSize.Caption="Copy selection size"
mCopySelectionSize.ImageIndex=15
mCopySelectionSize.Shortcut=copy_selection_size_shortcut
mCopySelectionSize.OnClick=function(sender)
  local selection_size
  if hexView.HasSelection then

    selection_size = hexView.SelectionStop - hexView.SelectionStart + 1

    if copy_as_decimal == false then
      if include_leading_zeros then
        selection_size = string.format("%08X", selection_size)
      else
        selection_size = string.format("%X", selection_size)
      end
    end
    writeToClipboard(selection_size)

  end
end

m.items.insert(memView.Cut1.MenuIndex,mCopySelectionSize)