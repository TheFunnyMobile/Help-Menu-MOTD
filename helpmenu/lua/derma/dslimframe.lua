local PANEL = {}

function PANEL:Init()
	self.CustomTitle = nil
	self.Color = Config.BACKMAIN
	self.TopBarColor = Config.TOPBAR
	self.FontColor = Config.SERVERNAME
	self.FontOutlineColor = Config.SERVERNAMEOUTLINE
end

function PANEL:Paint()
	draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), self.Color)
	
	if (self.CustomTitle) then
		draw.SimpleTextOutlined(self.CustomTitle, "SlimTitle", 26, 26, self.FontColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 1, self.FontOutlineColor)
	end
	
	surface.SetDrawColor(self.TopBarColor)
	draw.RoundedBoxEx(0, 0, 0, self:GetWide(), 30, self.TopBarColor, true, true, false, false)

end

function PANEL:SetCustomTitle(text)
	self:SetTitle(" ")
	self.CustomTitle = text
end

function PANEL:SetColor(newBodyColor, newTopBarColor)
	self.Color = newBodyColor
	self.TopBarColor = newTopBarColor
end

vgui.Register("DSlimFrame", PANEL, "DFrame")