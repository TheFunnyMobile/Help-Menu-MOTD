local PANEL = {}

function PANEL:Init()
	self.ActiveColor = Color(149, 165, 166, 100)
	self.DownColor = Color(149, 165, 166, 180)
	self.OverColor = Color(149, 165, 166, 20)
	self.TextColor = Color(255, 255, 255, 255)

	self:SetTextColor(self.TextColor)
	self:SetFont("SlimButtonText")
	self.IsMouseIn = false
	self.Active = false
	self.OnCursorEntered = function() self.IsMouseIn = true end
	self.OnCursorExited = function() self.IsMouseIn = false end
end

function PANEL:Paint()
	if (self.Active) then
		surface.SetDrawColor(self.ActiveColor)
	elseif (self.IsMouseIn) then
		if (self:IsDown()) then
			surface.SetDrawColor(self.DownColor)
		else
			surface.SetDrawColor(self.OverColor)
		end
	else
		return
	end
	draw.RoundedBox(0, 0, 0, self:GetWide(), self:GetTall(), Config.BUTTONS)
end

function PANEL:SetActive(active)
	self.Active = active
end

function PANEL:SizeToContents()
	surface.SetFont("SlimButtonText")
	local tw, th = surface.GetTextSize(self:GetText())
	self:SetSize(tw + 8, self:GetTall())
end

vgui.Register("DSlimButton", PANEL, "DButton")