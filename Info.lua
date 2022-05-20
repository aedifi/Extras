-- info.lua
-- Implements the g_PluginInfo standard plugin description.

g_PluginInfo = 
{
	Name = "Extras",
	Version = "1",
	Date = "2022-05-19",
	SourceLocation = "https://github.com/aedifi/extras",
	Description = [[Fun commands and extra features.]],
	
	Commands =
	{
		["/delhome"] = 
		{
			Alias = {"/dhome", "/deletehome"},
			Permission = "extras.visitor.delhome",
			Handler = HandleDelHomeCommand,
			HelpString = "Deletes a home or your main home.",
		},
		["/disguise"] = 
		{
			Alias = "/dis",
			Permission = "extras.architect.disguise",
			Handler = HandleDisguiseCommand,
			HelpString = "Turns you into an entity.",
		},
		["/gohome"] = 
		{
			Alias = "/home",
			Permission = "extras.visitor.gohome",
			Handler = HandleGoHomeCommand,
			HelpString = "Takes you to a personal home.",
        },
		["/gowarp"] = 
		{
			Alias = "/warp",
			Permission = "extras.visitor.gowarp",
			Handler = HandleGoWarpCommand,
			HelpString = "Takes you to an operable warp.",
        },
		["/hat"] = 
		{
			Alias = "/head",
			Permission = "extras.architect.hat",
			Handler = HandleHatCommand,
			HelpString = "Gives you a special hat.",
		},
		["/homes"] = 
		{
			Permission = "extras.visitor.homes",
			Handler = HandleListHomeCommand,
			HelpString = "Lists personal homes.",
        },
		["/name"] = 
		{
			Alias = {"/nick", "/nickname"},
			Permission = "extras.architect.name",
			Handler = HandleNameCommand,
			HelpString = "Changes your name.",
		},
		["/particles"] = 
		{
			Alias = "/effects",
			Permission = "extras.visitor.particles",
			Handler = HandleParticlesCommand,
			HelpString = "Lists configured particles.",
		},
		["/reveal"] = 
		{
			Alias = {"/undis", "/undisguise"},
			Permission = "extras.architect.reveal",
			Handler = HandleRevealCommand,
			HelpString = "Reveals you of any disguise.",
		},
		["/scare"] = 
		{
			Alias = "/jumpscare",
			Permission = "extras.architect.scare",
			Handler = HandleScareCommand,
			HelpString = "Scares a player.",
		},
		["/sethome"] = 
		{
			Permission = "extras.visitor.sethome",
			Handler = HandleSetHomeCommand,
			HelpString = "Sets a home at your coordinates.",
		},
		["/setwarp"] = 
		{
			Permission = "extras.architect.setwarp",
			Handler = HandleSetWarpCommand,
			HelpString = "Sets a warp at your coordinates.",
		},
		["/speed"] = 
		{
			Permission = "extras.architect.speed",
			Handler = HandleSpeedCommand,
			HelpString = "Sets your maximum speed.",
		},
		["/trail"] = 
		{
			Permission = "extras.architect.trail",
			Handler = HandleTrailCommand,
			HelpString = "Sets a particle trail.",
		},
		["/warps"] = 
		{
			Permission = "extras.visitor.warps",
			Handler = HandleListWarpCommand,
			HelpString = "Lists operable warps.",
        },
	},  -- Commands
}  -- g_PluginInfo
