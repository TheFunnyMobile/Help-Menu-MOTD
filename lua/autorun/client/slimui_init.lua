surface.CreateFont("SlimTitle", {
	font 		= "Tahoma",
	size 		= 40,
	weight 		= 300,
	blursize 	= 0,
	antialias 	= true,
	shadow 		= false,
	outline 	= false
})
surface.CreateFont("SlimButtonText", {
    font = "Tahoma",
    size = 16,
    weight = 300,
    antialias = true,
    shadow 	= false,
	outline = false
})

include ('derma/DSlimFrame.lua')
include ('derma/DSlimPanelList.lua')
include ('derma/DSlimPropertySheet.lua')
include ('derma/DSlimPropertySheetTop.lua')
include ('derma/DSlimButton.lua')
include ('derma/DSlimPanel.lua')
