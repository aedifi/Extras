-- speed.lua
-- Implements the /speed command.

function HandleSpeedCommand(Split, Player)
	local SpeedType = Split[1]:gsub("/", ""):gsub("speed", "")
	local Speed = Split[2]
	if Split[1] == "/speed" then
		SpeedType = Split[2]
		Speed = Split[3]
	end
	local SetSpeed = function(OtherPlayer)
		if tonumber(Speed) == nil then
			Player:SendMessage(cChatColor.LightGray .. "Couldn't quantify non-numeric data.")
		else
			--Set new speed
			if tonumber(Speed) > 100 then
				Speed = 100
			end
			if Split[1] == "/speed" and Split[2] == "air" then
				OtherPlayer:SetFlyingMaxSpeed(Speed)
			elseif Split[1] == "/speed" and Split[2] == "ground" then
				OtherPlayer:SetNormalMaxSpeed(Speed)
			elseif Split[1] == "/speed" and Split[2] == "sprint" then
				OtherPlayer:SetSprintingMaxSpeed(Speed)
			end
			OtherPlayer:SendMessage(cChatColor.LightGray .. "Changed your maximum " .. SpeedType .. " speed.")
		end
	end
	if Speed == nil then
		Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <air | ground | sprint> <speed>")	
	else
		SetSpeed(Player)
	end
	return true
end
