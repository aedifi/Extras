-- info.lua
-- Implements the g_PluginInfo standard plugin description.

g_PluginInfo = 
{
	Name = "Extras",
	Version = "1",
	Date = "2021-03-15",
	SourceLocation = "https://github.com/aedifi/extras",
	Description = [[Fun commands and extra features.]],
	
	Commands =
	{
		["/delhome"] = 
		{
			Permission = "extras.delhome",
			Handler = HandleDelHomeCommand,
			HelpString = "Deletes a home or your main home.",
		},
		["/disguise"] = 
		{
			Permission = "extras.disguise",
			Handler = HandleDisguiseCommand,
			HelpString = "Turns you into an entity.",
		},
		["/gohome"] = 
		{
			Permission = "extras.gohome",
			Handler = HandleGoHomeCommand,
			HelpString = "Takes you to a personal home.",
        },
		["/gowarp"] = 
		{
			Permission = "extras.gowarp",
			Handler = HandleGoWarpCommand,
			HelpString = "Takes you to an operable warp.",
        },
		["/hat"] = 
		{
			Permission = "extras.hat",
			Handler = HandleHatCommand,
			HelpString = "Gives you a special hat.",
		},
		["/homes"] = 
		{
			Permission = "extras.homes",
			Handler = HandleListHomeCommand,
			HelpString = "Lists personal homes.",
        },
		["/name"] = 
		{
			Permission = "extras.name",
			Handler = HandleNameCommand,
			HelpString = "Changes your name.",
		},
		["/particles"] = 
		{
			Permission = "extras.particles",
			Handler = HandleParticlesCommand,
			HelpString = "Lists configured particles.",
		},
		["/reveal"] = 
		{
			Permission = "extras.reveal",
			Handler = HandleRevealCommand,
			HelpString = "Reveals you of any disguise.",
		},
		["/scare"] = 
		{
			Permission = "extras.scare",
			Handler = HandleScareCommand,
			HelpString = "Scares a player.",
		},
		["/sethome"] = 
		{
			Permission = "extras.sethome",
			Handler = HandleSetHomeCommand,
			HelpString = "Sets a home at your coordinates.",
		},
		["/setwarp"] = 
		{
			Permission = "extras.setwarp",
			Handler = HandleSetWarpCommand,
			HelpString = "Sets a warp at your coordinates.",
		},
		["/speed"] = 
		{
			Permission = "extras.speed",
			Handler = HandleSpeedCommand,
			HelpString = "Sets your maximum speed.",
		},
		["/trail"] = 
		{
			Permission = "extras.trail",
			Handler = HandleTrailCommand,
			HelpString = "Sets a particle trail.",
		},
		["/warps"] = 
		{
			Permission = "extras.warps",
			Handler = HandleListWarpCommand,
			HelpString = "Lists operable warps.",
        },
	},  -- Commands
}  -- g_PluginInfo
