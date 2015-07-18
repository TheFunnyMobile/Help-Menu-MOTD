local PANEL = {}

function PANEL:Init()
	self:ShowCloseButton(false)
	self:SetTitle(" ")
	self.Tabs = {}
	self.ButtonBar = self:Add("DSlimPanel")
	self.ButtonBar:Dock(TOP)
	self.ButtonBar:DockMargin( 10, 0, 10, 5 ) --(l,u,r,d)
end

function PANEL:Paint()
	self.ButtonBar:SetSize(0, 20)
end

function PANEL:AddSheet(name, newPanel)
	if (!self:GetParent()) then return end
	local newButton = vgui.Create("DSlimButton")
	newButton:SetParent(self.ButtonBar)
	newButton:SetText(name)
	newButton:DockMargin( 0, 0, 5, 0 ) --(l,u,r,d)
	newButton:Dock(LEFT)
	newButton:SizeToContents()
	newButton.DoClick = function(button)
		self:SetActiveTab(newPanel)
	end
	table.insert(self.Tabs, {name = name, button = newButton, panel = newPanel})
	newPanel:SetParent(self)
	newPanel:SetVisible(false)
	newPanel:DockMargin( 10, 0, 10, 10 ) --(l,u,r,d)
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

vgui.Register("DSlimPropertySheetTop", PANEL, "DSlimFrame")