local PANEL = {}

function PANEL:Init()
	self:ShowCloseButton(false)
	self:SetTitle(" ")
	self.Tabs = {}
	self.ButtonBar = self:Add("DSlimPanel")
	self.ButtonBar:Dock(LEFT)
	self.ButtonBar:DockMargin( 10, 10, 10, 10 ) --(l,u,r,d)
end

function PANEL:Paint()
	self.ButtonBar:SetSize(self:GetParent():GetWide()/4, 0)
end

function PANEL:AddSheet(name, newPanel)
	if (!self:GetParent()) then return end
	local newButton = vgui.Create("DSlimButton")
	newButton:SetParent(self.ButtonBar)
	newButton:SetText(name)
	newButton:DockMargin( 10, 10, 10, 0 ) --(l,u,r,d)
	newButton:Dock(TOP)
	newButton.DoClick = function(button)
		self:SetActiveTab(newPanel)
	end
	table.insert(self.Tabs, {name = name, button = newButton, panel = newPanel})
	newPanel:SetParent(self)
	newPanel:SetVisible(false)
	newPanel:DockMargin( 0, 10, 10, 10 ) --(l,u,r,d)
	newPanel:Dock(FILL)
	
	self.Tabs[1].panel:SetVisible(true)
	self.Tabs[1].button:SetActive(true)
end

function PANEL:SetActiveTab(panel)
	for _, v in pairs(self.Tabs) do
		if (v.panel == panel) then
			v.panel:SetVisible(true)
			v.button:SetActive(true)
		else
			v.panel:SetVisible(false)
			v.button:SetActive(false)
		end
	end
end

vgui.Register("DSlimPropertySheet", PANEL, "DSlimFrame")