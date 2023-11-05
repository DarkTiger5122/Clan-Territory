-- References to GUI elements
local clans = script.Parent.Frame1.Clans
local leave = script.Parent.Frame1.LeaveButton

-- Reference to external GUI element
local ClanMenu = script.Parent.Parent.Parent:WaitForChild("Clan menu")

-- Event handler for clicking the "Leave" button
leave.MouseButton1Click:Connect(function()
	-- Kick the local player from the game with a message
	game.Players.LocalPlayer:Kick("Left the game")
end)

-- Event handler for clicking the "Clans" button
clans.MouseButton1Click:Connect(function()
	-- Toggle visibility of the ClanMenu and hide the current frame
	if ClanMenu.Frame.Visible == true then
		ClanMenu.Frame.Visible = false
	else
		ClanMenu.Frame.Visible = true
		script.Parent.Visible = false
	end
end)
