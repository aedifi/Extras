-- name.lua
-- Implements the /name command and username changing.

NickList = {}

function HandleNameCommand(Split, Player)
	if Split[2] == nil then
		Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <name | default>")
	elseif Split[2] == "default" then
		NickList[Player:GetUUID()] = nil
		Player:SendMessageSuccess("Changed your nickname back to the default (" .. Player:GetName() .. ").")
    else
        -- We don't want usernames to use custom color codes.
		NickList[Player:GetUUID()] = table.concat(Split," ", 2)
		Player:SendMessageSuccess("Changed your nickname to " .. Split[2] .. ".")
	end
	return true
end
