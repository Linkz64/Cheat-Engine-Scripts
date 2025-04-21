-- by Linkz64
-- Adds a right click menu option for copying the
-- current displayed address in the cheat table/list.

-- Adjust these if needed
local include_leading_zeros = true
local copy_as_decimal = false
local copy_current_address_shortcut = "Ctrl+Alt+C"


local pm=AddressList.PopupMenu
local pmCopyCurrentAddress=createMenuItem(pm)
pmCopyCurrentAddress.Caption=translate('Copy current address')
pmCopyCurrentAddress.ImageIndex=MainForm.Copy1.ImageIndex
pmCopyCurrentAddress.Shortcut=copy_current_address_shortcut
pm.Items.insert(MainForm.Copy1.MenuIndex, pmCopyCurrentAddress)

local oldOnPopup=AddressList.PopupMenu.OnPopup
AddressList.PopupMenu.OnPopup=function(s)
  if oldOnPopup then
    oldOnPopup(s)
  end
  pmCopyCurrentAddress.Visible=AddressList.SelCount>=1
end

pmCopyCurrentAddress.OnClick=function(s)
  local i
  local address_to_copy

  if AddressList.SelCount==0 then
    messageDialog('Select at least one entry first', mtError, mbOK)
    return
  end

  for i=0,AddressList.Count-1 do
    if AddressList[i].Selected then

      address_to_copy = AddressList[i].getCurrentAddress()
      if copy_as_decimal == false then
        if include_leading_zeros then
          address_to_copy = string.format("%08X", address_to_copy)
        else
          address_to_copy = string.format("%X", address_to_copy)
        end
      end
      writeToClipboard(address_to_copy)
      return

    end
  end

end