-- speed.lua
-- Implements the /speed command.

function HandleSpeedCommand(Split, Player)
--	local SpeedType = Split[1]:gsub("/", ""):gsub("speed", "")
	local Speed = Split[3]
	if tonumber(Speed) == nil then
		Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <fly | walk | sprint> <speed>")
	else
		--Set new speed
		if tonumber(Speed) < 1 then
			Speed = 1
		end
		if tonumber(Speed) > 100 then
			Speed = 100
		end
		if Split[2] == "fly" then
			Player:SetFlyingMaxSpeed(Speed)
			Player:SendMessageSuccess("Set your flying speed to " .. Speed .. ".")
		elseif Split[2] == "walk" then
			Player:SetNormalMaxSpeed(Speed)
			Player:SendMessageSuccess("Set your walking speed to " .. Speed .. ".")
		elseif Split[2] == "sprint" then
			Player:SetSprintingMaxSpeed(Speed)
			Player:SendMessageSuccess("Set your sprinting speed to " .. Speed .. ".")
		else
			Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <fly | walk | sprint> <speed>")
		end
	end
	return true
end
