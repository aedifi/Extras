-- building.lua
-- Commands related to building on the server.

function HandleDepthCommand(Split, Player)
	local PosY = Player:GetPosY()
	if PosY > 50 then
		Player:SendMessage(cChatColor.LightGray .. "You are "..(PosY-50).." block(s) above sea level.")
	elseif PosY < 50 then
		Player:SendMessage(cChatColor.LightGray .. "You are "..(50-PosY).." block(s) below sea level.")
	else
		Player:SendMessage(cChatColor.LightGray .. "You are at sea level.")
	end
	return true
end

function HandleSkullCommand(Split, Player)
	local UpdateHead = function(Head)
		local Head = tolua.cast(Head, "cMobHeadEntity")
		local OwnerUUID = cMojangAPI:GetUUIDFromPlayerName(Split[2])
		local OwnerName = Split[2]
		if OwnerUUID ~= "" then
			cUrlClient:Get("https://sessionserver.mojang.com/session/minecraft/profile/" .. OwnerUUID,
				function(Body, Data)
					local OwnerTexture = Body:match('"value":"(.-)"')
					Head:SetType(3)
					Head:SetOwner(OwnerUUID, OwnerName, OwnerTexture, "")
					Player:SendMessageSuccess("Changed your skull to that player (" .. Head:GetOwnerName() .. ").")
				end
			)
		else
			Player:SendMessageFailure("Could not find that user, are they registered?")
		end
	end
	local LookPos = GetPlayerLookPos(Player)
	if Split[2] == nil then
		Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <username>")
	elseif not Player:GetWorld():DoWithMobHeadAt(LookPos.x, LookPos.y, LookPos.z, UpdateHead) then
		Player:SendMessageFailure("Could not find a skull in your direction.")
	end
	return true
end
