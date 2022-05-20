-- warp.lua
-- Implements the /gowarp command and warps.

Warps = {}

function HandleGoWarpCommand(Split, Player)
	if Split[2] == nil then
		--No warp given, list warps available.
		Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <warp>")
	elseif Warps[table.concat(Split, " ", 2)] == nil then 
		Player:SendMessageFailure("Could not find that warp, does it exist?")
	else
		if Player:GetWorld():GetName() ~= Warps[Split[2]]["w"] then
			Player:MoveToWorld(cRoot:Get():GetWorld(Warps[Split[2]]["w"]), true, Vector3d(Warps[Split[2]]["x"] + 0.5, Warps[Split[2]]["y"], Warps[Split[2]]["z"] + 0.5))
		else
			Player:TeleportToCoords(Warps[Split[2]]["x"] + 0.5 , Warps[Split[2]]["y"] , Warps[Split[2]]["z"] + 0.5)
		end
		Player:SendMessageSuccess("Took you to that warp (" .. Split[2] .. ").")
	end
	return true
end

function HandleSetWarpCommand(Split, Player)
	local World = Player:GetWorld():GetName()
	local PosX = math.floor(Player:GetPosX())
	local PosY = math.floor(Player:GetPosY())
	local PosZ = math.floor(Player:GetPosZ())
	if Split[2] == nil then
		Player:SendMessage(cChatColor.LightGray .. "Usage: " .. Split[1] .. " <warp>")
		return true
	end
	if Warps[Split[2]] == nil then 
		Warps[Split[2]] = {}
	end
	if WarpsINI:FindKey(Split[2])<0 then
		Warps[Split[2]]["w"] = World
		Warps[Split[2]]["x"] = PosX
		Warps[Split[2]]["y"] = PosY
		Warps[Split[2]]["z"] = PosZ
		WarpsINI:AddKeyName(Split[2])
		WarpsINI:SetValue(Split[2] , "w" , World)
		WarpsINI:SetValue(Split[2] , "x" , PosX)
		WarpsINI:SetValue(Split[2] , "y" , PosY)
		WarpsINI:SetValue(Split[2] , "z" , PosZ)
		WarpsINI:WriteFile("warps.ini");
		Player:SendMessageSuccess("Set your new warp at X: " .. PosX .. ", Y: " .. PosY .. ", Z: " .. PosZ .. ".")
	else
		Player:SendMessageFailure("Could not make a warp with that name (" .. Split[2] .. "); one already exists!")
	end
	return true
end

function HandleListWarpCommand(Split, Player)
	local WarpName = ""
	for k, v in pairs (Warps) do
		WarpName = WarpName .. k .. ", "
	end
	Player:SendMessage(cChatColor.LightGray .. "Warps (" .. #WarpName:sub(1, WarpName:len() / 10) .. "): " .. WarpName:sub(1, WarpName:len() - 2))
	return true
end
