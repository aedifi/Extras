-- main.lua
-- Implements the plugin's main entrypoint.

DisguiseFor = {}

-- Called on plugin start for initialization.
function Initialize(Plugin)
	Plugin:SetName("Extras")
    Plugin:SetVersion(tonumber(g_PluginInfo["Version"]))
    
    -- Register for all hooks needed.
	cPluginManager:AddHook(cPluginManager.HOOK_CHAT, Greentext)
	cPluginManager:AddHook(cPluginManager.HOOK_CHAT, Comment)
	cPluginManager:AddHook(cPluginManager.HOOK_CHAT, Blocktext)
	cPluginManager:AddHook(cPluginManager.HOOK_WORLD_TICK, OnWorldTick)
	cPluginManager:AddHook(cPluginManager.HOOK_CHAT, OnChat)
	cPluginManager:AddHook(cPluginManager.HOOK_ENTITY_CHANGING_WORLD, OnEntityChangingWorld)
	cPluginManager:AddHook(cPluginManager.HOOK_TAKE_DAMAGE, OnTakeDamage)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_RIGHT_CLICKING_ENTITY, OnPlayerRightClickingEntity)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_SPAWNED, OnPlayerSpawned)
	cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_DESTROYED, OnPlayerDestroyed)

    -- Bind in-game commands...
	-- Load the InfoReg shared library...
	dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")
	RegisterPluginInfoCommands()
	RegisterPluginInfoConsoleCommands()

	-- Set folders which will be used later on.
	HomesFolder = Plugin:GetLocalFolder().."/homes"

	-- If there's no home folder, let's create it.
	if not cFile:IsFolder(HomesFolder) then
		cFile:CreateFolder(HomesFolder)
	end

	--Read warps from the proper file.
	WarpsINI = cIniFile()
	if WarpsINI:ReadFile("warps.ini") then
		local WarpNum = WarpsINI:GetNumKeys() - 1
		for i=0, WarpNum do
			local Tag = WarpsINI:GetKeyName(i)
			Warps[Tag] = {}
			Warps[Tag]["w"] = WarpsINI:GetValue(Tag , "w")
			Warps[Tag]["x"] = WarpsINI:GetValueI(Tag , "x")
			Warps[Tag]["y"] = WarpsINI:GetValueI(Tag , "y")
			Warps[Tag]["z"] = WarpsINI:GetValueI(Tag , "z")
		end
	end

    return true
end

function DestroyDisguise(Player)
	Player:GetWorld():DoWithEntityByID(DisguiseFor[Player:GetUUID()], cEntity.Destroy)
	DisguiseFor[Player:GetUUID()] = nil
	Player:SetVisible(true)
end

function OnDisable()
	local RemoveMob = function(Player)
		if DisguiseFor[Player:GetUUID()] ~= nil then
			DestroyDisguise(Player)
			Player:SendMessage(cChatColor.LightGray .. "Revealed your true being because of a reload.")
		end
	end    
	cRoot:Get():ForEachPlayer(RemoveMob)
	-- LOG("Disabled " .. cPluginManager:GetCurrentPlugin():GetName() .. "!")
end

function OnWorldTick(World, TimeDelta)
	local Player = function(Player)
		local MoveEntity = function(Entity)
			if Entity:IsMob() and Entity:GetMobType() == 53 or Entity:IsMob() and Entity:GetMobType() == 56 then
				Entity:TeleportToCoords(Player:GetPosX() + 2.6, Player:GetPosY(), Player:GetPosZ() + 2.6)
			elseif Entity:GetEntityType() == 7 then
				Entity:TeleportToCoords(Player:GetPosX() + 1.2, Player:GetPosY(), Player:GetPosZ() + 1.2)
			else
				Entity:TeleportToCoords(Player:GetPosX() + 1.1, Player:GetPosY(), Player:GetPosZ() + 1.1)
			end
			Entity:SetSpeed(0,0,0)
			Entity:SetMaxHealth(99999)
			Entity:SetHealth(99999)
			Entity:SetHeadYaw(Player:GetHeadYaw())
			Entity:SetYaw(Player:GetYaw())
			Entity:SetPitch(Player:GetPitch())
			Player:SetVisible(false)
			Player:SetInvulnerableTicks(5)
			if Entity:GetPosY() < 0.1 then
					DisguiseFor[Player:GetUUID()] = nil
					Player:SetVisible(true)
					Player:SendMessage(cChatColor.LightGray .. "Revealed your true being.")
			end
		end
		if DisguiseFor[Player:GetUUID()] ~= nil then
			World:DoWithEntityByID(DisguiseFor[Player:GetUUID()], MoveEntity)
		end
	end
	World:ForEachPlayer(Player)
end

function OnEntityChangingWorld(Entity, World)
	local ChangeWorld = function(Disguise)
		Disguise:MoveToWorld(World)
	end
	if Entity:IsPlayer() and DisguiseFor[Entity:GetUUID()] ~= nil then
		Entity:GetWorld():DoWithEntityByID(DisguiseFor[Entity:GetUUID()], ChangeWorld)
	end
end

function OnTakeDamage(Receiver, TDI)
	if TDI.Attacker and TDI.Attacker:IsPlayer() and Receiver:GetUniqueID() == DisguiseFor[TDI.Attacker:GetUUID()] then
		return true
	end
end

function OnPlayerRightClickingEntity(Player, Entity)
	if Entity:GetUniqueID() == DisguiseFor[Player:GetUUID()] then
		return true
	end
end

function OnPlayerSpawned(Player)
	if DisguiseFor[Player:GetUUID()] ~= nil then
		DestroyDisguise(Player)
		Player:SendMessage(cChatColor.LightGray .. "Revealed your true being because you respawned.")
	end
end

function OnPlayerDestroyed(Player)
	if DisguiseFor[Player:GetUUID()] ~= nil then
		DestroyDisguise(Player)
	end
end

function GetValue(list)
	local value = {}
	for k, v in ipairs(list) do 
		value[v] = true
	end
	return value
end
