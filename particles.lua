-- particles.lua
-- Implements the /trail command and the creation of particles around members.

ParticlePlayers = {}

local ParticleTypes = GetValue { "explode", "largeexplode", "fireworksspark", "bubble", "splash", "wake", "suspended", "depthsuspend", "crit", "magiccrit", "smoke", "largesmoke", "spell", "instantspell", "mobspell", "mobspellambient", "witchmagic", "dripwater", "driplava", "angryvillager", "happyvillager", "townaura", "note", "portal", "enchantmenttable", "flame", "lava", "footstep", "reddust", "snowballpoof", "slime", "heart", "barrier", "cloud", "snowshovel", "droplet", "endrod", "dragonbreath", "sweepattack", "spit", "totem" }

function HandleTrailCommand(Split, Player)
	if Split[2] == nil then
		Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <particle | air>")
	elseif Split[2] == "air" then
		ParticlePlayers[Player:GetUUID()] = nil
		Player:SendMessage(cChatColor.LightGray .. "Cleansed your player of any particulates.")
	else
		if ParticleTypes[Split[2]] then
			ParticlePlayers[Player:GetUUID()] = Split[2]
			Player:SendMessage(cChatColor.LightGray .. "Gave your player a particle trail.")
		else
			Player:SendMessage(cChatColor.LightGray .. "Couldn't find that particle.")
		end
		return true
	end
	return true
end

function HandleParticlesCommand(Split, Player)
	local ListParticles = ""
	for key, value in pairs(ParticleTypes) do
		ListParticles = ListParticles .. key .. ", "
	end
	Player:SendMessage(cChatColor.LightGray .. "Particles (" .. #ParticleTypes .. "): " .. ListParticles:sub(1, ListParticles:len() - 2))
end

function OnPlayerDestroyed(Player)
	ParticlePlayers[Player:GetUUID()] = nil
end

function OnWorldTick(World, TimeDelta)
	World:ForEachPlayer(
		function(Player)
			-- Creates particles around the member.
			if ParticlePlayers[Player:GetUUID()] == "note" then
				Player:GetWorld():BroadcastParticleEffect(
					"note",
					Vector3f(Player:GetPosition()),
					Vector3f(0.5, 1, 0.5),
					math.random(1, 16),
					10
				)
			elseif ParticlePlayers[Player:GetUUID()] ~= nil then
				Player:GetWorld():BroadcastParticleEffect(
					ParticlePlayers[Player:GetUUID()],
					Vector3f(Player:GetPosition()),
					Vector3f(0.5, 1, 0.5),
					0,
					10
				)
			end
		end
	)
end
