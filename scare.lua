-- scare.lua
-- Implements the /scare command.

function HandleScareCommand(Split, Player)
	local Jumpscare = function(OtherPlayer)
		local X = OtherPlayer:GetPosX()
		local Y = OtherPlayer:GetPosY()
		local Z = OtherPlayer:GetPosZ()
		OtherPlayer:GetWorld():BroadcastParticleEffect("mobappearance", X, Y, Z, 0, 0, 0, 1, 4)
		for i=1,10 do
			if OtherPlayer:GetClientHandle():GetProtocolVersion() <= 47 then
				OtherPlayer:GetClientHandle():SendSoundEffect("mob.endermen.scream", Player:GetPosition(), 1, 0)
			else
				OtherPlayer:GetClientHandle():SendSoundEffect("entity.endermen.scream", Player:GetPosition(), 1, 0)
			end
		end
		if not Split[2] == "everyone" then
			Player:SendMessage(cChatColor.LightGray .. "Made quite the scare for that player.")
		end
	end
	if Split[2] == nil then
		Player:SendMessage(cChatColor.LightGray .. "Usage: ".. Split[1] .." <player | everyone>")
	elseif Split[2] == "everyone" then
		cRoot:Get():ForEachPlayer(Jumpscare)
		Player:SendMessage(cChatColor.LightGray .. "Made quite the scare for every player.")
	elseif not cRoot:Get():FindAndDoWithPlayer(table.concat(Split, " ", 2), Jumpscare) then
		Player:SendMessage(cChatColor.LightGray .. "Couldn't find that player.")
	end
	return true
end
