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
		Player:SendMessageSuccess("Enjoy your new hat (" .. Hat .. ").")
	else
		Player:SendMessageFailure("Could not find an item in your hand, is it wearable?")
	end
	return true
end
