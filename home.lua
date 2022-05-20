-- home.lua
-- Implements the /gohome command and homes.
  
function HandleGoHomeCommand(Split, Player)
	local UUID = Player:GetUUID()
	local World = Player:GetWorld():GetName()
	if Split[2] and file_exists(HomesFolder .. "/" .. UUID .. "." .. Split[2]) then
		local Coords = lines_from(HomesFolder .. "/" .. UUID .. "." .. Split[2])
		if World ~= Coords[4] then
			Player:MoveToWorld(cRoot:Get():GetWorld(Coords[4]), true, Vector3d(Coords[1], Coords[2], Coords[3]))
		else
			Player:TeleportToCoords(Coords[1], Coords[2], Coords[3])
		end
		Player:SendMessage(cChatColor.LightGray .. "Took you to that home.")
	elseif file_exists(HomesFolder .. "/" .. UUID .. ".home") then
		local Coords = lines_from(HomesFolder .. "/" .. UUID .. ".home")
		if World ~= Coords[4] then
			Player:MoveToWorld(cRoot:Get():GetWorld(Coords[4]), true, Vector3d(Coords[1], Coords[2], Coords[3]))
		else
			Player:TeleportToCoords(Coords[1], Coords[2], Coords[3])
		end
		Player:SendMessage(cChatColor.LightGray .. "Took you to that home.")
	else
		Player:SendMessageFailure("Could not find that home, does it exist?")
	end
	return true
end

function HandleSetHomeCommand(Split, Player)
	local UUID = Player:GetUUID()
	local World = Player:GetWorld():GetName()
	local PosX = math.floor(Player:GetPosX())
	local PosY = math.floor(Player:GetPosY())
	local PosZ = math.floor(Player:GetPosZ())
	if Split[2] then
		local file = io.open(HomesFolder .. "/" .. UUID .. "." .. Split[2], "w")
		file:write(PosX .. "\n" .. PosY .. "\n" .. PosZ .. "\n" .. World)
        file:close()
        Player:SendMessageSuccess("Set your new home at X: " .. PosX .. ", Y: " .. PosY .. ", Z: " .. PosZ .. ".")
	else
		local file = io.open(HomesFolder .. "/" .. UUID .. ".home", "w")
		file:write(PosX .. "\n" .. PosY .. "\n" .. PosZ .. "\n" .. World)
		file:close()
		Player:SendMessageSuccess("Set your main home at X: " .. PosX .. ", Y: " .. PosY .. ", Z: " .. PosZ .. ".")	
	end
	return true
end

function HandleDelHomeCommand(Split, Player)
	local UUID = Player:GetUUID()
	if Split[2] and file_exists(HomesFolder .. "/" .. UUID .. "." .. Split[2]) then
		os.remove(HomesFolder .. "/" .. UUID .. "." .. Split[2], "w")
		Player:SendMessage(cChatColor.LightGray .. "Removed that home.")	
	elseif file_exists(HomesFolder .. "/" .. UUID .. ".home") then
		os.remove(HomesFolder .. "/" .. UUID .. ".home", "w")
		Player:SendMessage(cChatColor.LightGray .. "Removed your main home.")	
	else
		Player:SendMessageFailure("Could not find that home, does it exist?")
	end
	return true
end

function HandleListHomeCommand(Split, Player)
	local WarpName = ""
	for k, v in pairs (Warps) do
		WarpName = WarpName .. k .. ", "
	end
	table.sort(WarpName,
		function(f1, f2)
			return (string.lower(f1) < string.lower(f2))
		end
	)
	Player:SendMessage(cChatColor.LightGray .. "Warps (" .. #WarpName .. "): " .. table.concat(WarpName, ", "))
	return true
end

function file_exists(file)
	local f = io.open(file, "rb")
	if f then
		f:close()
		return true
	end
	return f ~= nil
end

function lines_from(file)
	if not file_exists(file) then return {} end
	lines = {}
	for line in io.lines(file) do 
		lines[#lines + 1] = line
	end
	return lines
end
