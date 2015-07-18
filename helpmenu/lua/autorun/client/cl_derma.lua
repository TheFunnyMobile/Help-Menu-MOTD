Derma = {}

function Derma.ShowHelp()
	local frame = vgui.Create( "DSlimFrame" )
	frame:SetSize( 600, 450 )
	frame:Center()
	frame:SetCustomTitle( "Welcome To " .. Config.ServerName ) 
	frame:SetVisible( true ) 
	frame:SetDraggable( false ) 
	frame:ShowCloseButton( false ) 
	frame.btnMaxim:Hide()
	frame.btnMinim:Hide()
	frame:MakePopup()


	local PropertySheet = vgui.Create( "DSlimPropertySheet" )
	PropertySheet:SetParent( frame )
	PropertySheet:Dock(FILL)

	local tab1_panel = vgui.Create("DSlimPanelList")
	tab1_panel:SetPos( 5, 5 )
	tab1_panel:SetSize( 395, 240 )
	tab1_panel:EnableVerticalScrollbar( true )
	tab1_panel:SetPadding(5)

	local tab2_panel = vgui.Create("DSlimPanelList")
	tab2_panel:SetPos( 5, 5 )
	tab2_panel:SetSize( 395, 240 )
	tab2_panel:EnableVerticalScrollbar( true )
	tab2_panel:SetPadding(5)
	tab2_panel:SetSpacing(5)
	
	local tab3_panel = vgui.Create("DSlimPanelList")
	tab3_panel:SetPos( 5, 5 )
	tab3_panel:SetSize( 395, 240 )
	tab3_panel:EnableVerticalScrollbar( true )
	tab3_panel:SetPadding(5)
	--[[Want to add another tab?
	local tab4_panel = vgui.Create("DSlimPanelList")
	tab4_panel:SetPos( 5, 5 )
	tab4_panel:SetSize( 395, 240 )
	tab4_panel:EnableVerticalScrollbar( true )
	tab4_panel:SetPadding(5)
	]]

	local DermaPanelClose = vgui.Create( "DSlimButton", frame )
	DermaPanelClose:SetSize( 32, 32 )
	DermaPanelClose:SetPos( frame:GetWide() - 32, 1 )
	DermaPanelClose:SetText( "r" )
	DermaPanelClose:SetFont( "marlett" )
	DermaPanelClose:SetTextColor( Color( 166, 169, 172 ) )
	DermaPanelClose.Paint = function() end
	DermaPanelClose.DoClick = function()
		DermaPanelClose:GetParent():Remove()
	end
	if (Config.URL1) then
		local URL1 = vgui.Create("DSlimButton")
		URL1:SetText(Config.URL1ButtonText)
		URL1:SizeToContents()
		URL1:Center()
		URL1.DoClick = function()
			Derma.ShowURL1()
		end

		tab2_panel:AddItem(URL1)
	end

	if (Config.URL2) then
		local URL2 = vgui.Create("DSlimButton")
		URL2:SetText(Config.URL2ButtonText)
		URL2:SizeToContents()
		URL2:Center()
		URL2.DoClick = function()
			Derma.ShowURL2()
		end

		tab2_panel:AddItem(URL2)
	end
	if (Config.URL3) then
		local URL3 = vgui.Create("DSlimButton")
		URL3:SetText(Config.URL3ButtonText)
		URL3:SizeToContents()
		URL3:Center()
		URL3.DoClick = function()
			Derma.ShowURL3()
		end
		tab2_panel:AddItem(URL3)
	end

	if (Config.URL4) then
		local URL4 = vgui.Create("DSlimButton")
		URL4:SetText(Config.URL4ButtonText)
		URL4:SizeToContents()
		URL4:Center()
		URL4.DoClick = function()
			gui.OpenURL( Config.URL4 )
		end
		tab2_panel:AddItem(URL4)
	end

	local tab1_label = vgui.Create( "DLabel", tab1_panel)
	tab1_label:SetPos(5, 5)
	tab1_label:SetTextColor(Config.TEXTCOLOUR)
	tab1_label:SetText(Config.TAB1_LABEL)
	tab1_label:SizeToContents()

	local tab3_label = vgui.Create( "DLabel", tab2_panel)
	tab3_label:SetPos(5, 5)
	tab3_label:SetTextColor(Config.TEXTCOLOUR)
	tab3_label:SetText(Config.TAB3_LABEL)
	tab3_label:SizeToContents()
	--[[ Now add this outside of the commented area
	local tab4_label = vgui.Create( "DLabel", tab4_label)
	tab4_label:SetPos(5, 5)
	tab4_label:SetTextColor(Color(255, 255, 255, 255))
	tab4_label:SetText(Config.TAB3_LABEL)
	tab4_label:SizeToContents()

	tab4_panel:AddItem(tab4_label)
	PropertySheet:AddSheet( Config.TAB4, tab4_panel)
	]]

	tab1_panel:AddItem(tab1_label)
	tab3_panel:AddItem(tab3_label)

	
	PropertySheet:AddSheet( Config.TAB1, tab1_panel)
	PropertySheet:AddSheet( Config.TAB2, tab2_panel)
	PropertySheet:AddSheet( Config.TAB3, tab3_panel)
end
net.Receive( "ShowHelpMenu", Derma.ShowHelp )

function Derma.ShowURL1()
	local width = 1000
	local height = 500
	local URL1 = vgui.Create( "DSlimFrame" )
	URL1:SetTitle( "     "..Config.URL1TITLE )
	URL1:SetSize( width, height )
	URL1:Center()
	URL1:SetBackgroundBlur( true )
	URL1:MakePopup()
	URL1:ShowCloseButton( false ) 
	URL1.btnMaxim:Hide()
	URL1.btnMinim:Hide()

	local HTMLFrame = vgui.Create('HTML', URL1)
	HTMLFrame:SetPos(20, 20)
	HTMLFrame:SetSize(width - 40, height - 40)
	HTMLFrame:OpenURL(Config.URL1)

	local URL1Close = vgui.Create( "DButton", URL1 )
	URL1Close:SetSize( 32, 32 )
	URL1Close:SetPos( URL1:GetWide() - 25, 0.01 )
	URL1Close:SetText( "r" )
	URL1Close:SetFont( "marlett" )
	URL1Close:SetTextColor( Color( 166, 169, 172 ) )
	URL1Close.Paint = function() end
	URL1Close.DoClick = function()
		URL1Close:GetParent():Remove()
	end
end

function Derma.ShowURL2()
	local width = 1000
	local height = 500
	local URL2 = vgui.Create( "DSlimFrame" )
	URL2:SetTitle( "     "..Config.URL2TITLE )
	URL2:SetSize( width, height )
	URL2:Center()
	URL2:SetBackgroundBlur( true )
	URL2:MakePopup()
	URL2:ShowCloseButton( false ) 
	URL2.btnMaxim:Hide()
	URL2.btnMinim:Hide()

	local HTMLFrame = vgui.Create('HTML', URL2)
	HTMLFrame:SetPos(20, 20)
	HTMLFrame:SetSize(width - 40, height - 40)
	HTMLFrame:OpenURL(Config.URL2)

	local URL2Close = vgui.Create( "DButton", URL2 )
	URL2Close:SetSize( 32, 32 )
	URL2Close:SetPos( URL2:GetWide() - 25, 0.01 )
	URL2Close:SetText( "r" )
	URL2Close:SetFont( "marlett" )
	URL2Close:SetTextColor( Color( 166, 169, 172 ) )
	URL2Close.Paint = function() end
	URL2Close.DoClick = function()
		URL2Close:GetParent():Remove()
	end
end

function Derma.ShowURL3()
	local width = 1000
	local height = 500
	local URL3 = vgui.Create( "DSlimFrame" )
	URL3:SetTitle( "     "..Config.URL3TITLE )
	URL3:SetSize( width, height )
	URL3:Center()
	URL3:SetBackgroundBlur( true )
	URL3:MakePopup()
	URL3:ShowCloseButton( false ) 
	URL3.btnMaxim:Hide()
	URL3.btnMinim:Hide()

	local HTMLFrame = vgui.Create('HTML', URL3)
	HTMLFrame:SetPos(20, 20)
	HTMLFrame:SetSize(width - 40, height - 40)
	HTMLFrame:OpenURL(Config.URL3)

	local URL3Close = vgui.Create( "DButton", URL3 )
	URL3Close:SetSize( 32, 32 )
	URL3Close:SetPos( URL3:GetWide() - 25, 0.01 )
	URL3Close:SetText( "r" )
	URL3Close:SetFont( "marlett" )
	URL3Close:SetTextColor( Color( 166, 169, 172 ) )
	URL3Close.Paint = function() end
	URL3Close.DoClick = function()
		URL3Close:GetParent():Remove()
	end
end
