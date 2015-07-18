local PANEL = {}

function PANEL:Init()
	self.Color = Color(255, 255, 255, 0)
end

function PANEL:Paint()
	surface.SetDrawColor(self.Color)
	surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
end

vgui.Register("DSlimPanel", PANEL, "DPanel")