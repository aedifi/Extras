-- hat.lua
-- Implements the /hat command.

function HandleHatCommand(Split, Player)
	local Hat = cItem(Player:GetEquippedItem())
	Hat.m_ItemCount = 1
	local ArmorSlot = Player:GetInventory():GetArmorSlot(0)
	if not ArmorSlot:IsEmpty() then
		Player:GetInventory():AddItem(ArmorSlot)
    end
    
	-- Set the hat slot to the item being held.
	if not Player:GetEquippedItem():IsEmpty() then
		Player:GetInventory():SetArmorSlot(0, Hat)
		Player:GetInventory():RemoveOneEquippedItem()
		Player:SendMessage(cChatColor.LightGray .. "Placed that item on your head.")
	else
		Player:SendMessage(cChatColor.LightGray .. "Couldn't find any selected item to hat.")
	end
	return true
end
