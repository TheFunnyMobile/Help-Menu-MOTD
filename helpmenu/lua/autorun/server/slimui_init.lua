AddCSLuaFile ('derma/DSlimFrame.lua')
AddCSLuaFile ('derma/DSlimPanelList.lua')
AddCSLuaFile ('derma/DSlimPropertySheet.lua')
AddCSLuaFile ('derma/DSlimPropertySheetTop.lua')
AddCSLuaFile ('derma/DSlimButton.lua')
AddCSLuaFile ('derma/DSlimPanel.lua')

util.AddNetworkString( "ShowHelpMenu" )
--[[A few things taken from pointshop because its simple]]
	local KeyToHook = {
		F1 = "ShowHelp",
		F2 = "ShowTeam",
		F3 = "ShowSpare1",
		F4 = "ShowSpare2",
	}

	hook.Add(KeyToHook[Config.OpenKey], "OpenKey", function(ply)
		net.Start("ShowHelpMenu")
		net.Send(ply)
	end)

if (Config.ShowOnSpawn) then
	hook.Add("PlayerInitialSpawn", "ShowOnSpawn", function( ply )
		timer.Simple(4, function()
			net.Start("ShowHelpMenu")
			net.Send(ply)	
		end)
	end)
end
	hook.Add('PlayerSay', 'ChatCommand', function(ply, text)
		if string.len(Config.ChatCommand) > 0 then
			if string.sub(text, 0, string.len(Config.ChatCommand)) == Config.ChatCommand then
				net.Start("ShowHelpMenu")
				net.Send(ply)	
				return ""
			end
		end
	end)