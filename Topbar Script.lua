local StarterGui = game:GetService("StarterGui")

-- StarterGui-instellingen aanpassen om de standaard GUI-elementen uit te schakelen
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

-- Referenties naar GUI-elementen
local TopBar = script.Parent
local Frame = TopBar.Frame

local MenuButton = Frame.MenuButton
local Clans = Frame.GridFrameRight.Clans
local Playerlist = Frame.GridFrameLeft.PlayerList
local InventoryButton = Frame.GridFrameLeft.Inventory

-- Referenties naar externe GUI-elementen
local ClanMenu = script.Parent.Parent:WaitForChild("Clan menu")
local MainMenu = script.Parent.Parent.MainMenu
local Inventory = script.Parent.Parent.Inventory
local plrlist = script.Parent.Parent.Playerlist

-- MenuButton klikgebeurtenis
MenuButton.MouseButton1Click:Connect(function()
	print("MenuButton is geklikt")
	if MainMenu.Frame.Visible == true then
		MainMenu.Frame.Visible = false
	else
		MainMenu.Frame.Visible = true
	end
end)

-- Clans klikgebeurtenis
Clans.MouseButton1Click:Connect(function()
	print("Clans is geklikt")
	if ClanMenu.Frame.Visible == true then
		ClanMenu.Frame.Visible = false
	else
		ClanMenu.Frame.Visible = true
	end
end)

-- Playerlist klikgebeurtenis
Playerlist.MouseButton1Click:Connect(function()
	print("Playerlist is geklikt")
	if plrlist.Frame.Visible == true then
		plrlist.Frame.Visible = false
	else
		plrlist.Frame.Visible = true
	end
end)

-- InventoryButton klikgebeurtenis
InventoryButton.MouseButton1Click:Connect(function()
	print("Inventory is geklikt")
	print(tostring(Inventory.Frame.Visible))
	if Inventory.Frame.Visible == true then
		Inventory.Frame.Visible = false
	else
		Inventory.Frame.Visible = true
	end
end)