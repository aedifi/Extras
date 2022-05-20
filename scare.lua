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
	end
	cRoot:Get():ForEachPlayer(Jumpscare)
	Player:SendMessageSuccess("Created a jumpscare for every player.")
	return true
end
