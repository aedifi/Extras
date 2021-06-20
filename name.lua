-- name.lua
-- Implements the /name command and username changing.

NickList = {}

function HandleNameCommand(Split, Player)
	if Split[2] == nil then
		Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <name | default>")
	elseif Split[2] == "default" then
		NickList[Player:GetUUID()] = nil
		Player:SendMessage(cChatColor.LightGray .. "Restored your name to the default.")
    else
        -- We don't want usernames to use custom color codes.
		NickList[Player:GetUUID()] = table.concat(Split," ", 2)
		Player:SendMessage(cChatColor.LightGray .. "Changed your name.")
	end
	return true
end
