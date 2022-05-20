-- onchat.lua
-- Implements the OnChat hook.

function OnChat(Player, Message)
    if NickList[Player:GetUUID()] == nil then
		PlayerName = Player:GetName()
	else
		PlayerName = NickList[Player:GetUUID()]
    end
    
    local Rank = cRankManager:GetPlayerRankName(Player:GetUUID())
    local Message = Message

    if Rank == "" or Rank == "Visitor" then
		cRoot:Get():BroadcastChat(cChatColor.LightGray .. PlayerName .. cChatColor.LightGray .. ": " ..cChatColor.Plain .. Message)
	elseif Rank == "Architect" then
		cRoot:Get():BroadcastChat(cChatColor.Yellow .. PlayerName .. cChatColor.Yellow .. ": " ..cChatColor.Plain .. Message)
    elseif Rank == "Moderator" then
        cRoot:Get():BroadcastChat(cChatColor.Gold .. PlayerName .. cChatColor.Gold .. ": " ..cChatColor.Plain .. Message)
    elseif Rank == "Administrator" then
		cRoot:Get():BroadcastChat(cChatColor.Rose .. PlayerName .. cChatColor.Rose .. ": " ..cChatColor.Plain .. Message)
	end
	return true, Message
end
