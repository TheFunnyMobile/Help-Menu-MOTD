local PANEL = {}

function PANEL:Init()
	self.Color = Config.BLOCKLABEL
end

function PANEL:Paint()
	surface.SetDrawColor(self.Color)
	surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
end

vgui.Register("DSlimPanelList", PANEL, "DPanelList")