-- Logo URLs
local logos = {
	"rbxassetid://15238116614",
	"rbxassetid://15266850470"
}

-- List of clans
local clans = {}

-- Index trackers
local current_logo = 1
local current_clan = 0

-- Folder to store clan-related information
local clanfolder = Instance.new("Folder")
clanfolder.Parent = game.Players.LocalPlayer
clanfolder.Name = "clanfolder"

-- Indicator for being part of a clan
local clanpart = Instance.new("BoolValue")
clanpart.Parent = clanfolder
clanpart.Value = false
clanpart.Name = "Part_of_clan"

-- Placeholder for clan name
local clanname = ""

-- Get reference to the local player
local localplayer = game.Players.LocalPlayer

-- Reference to the main frame
local frame = script.Parent.Frame

-- References to ClanCreation and ClanVisible frames
local clancreation = frame.ClanCreation
local clanvisible = frame.ClanVisible

-- Buttons and input elements in ClanCreation frame
local createbutton = clancreation.Create
local clannamecreate = clancreation.Frame.TextBox
local logocreate = clancreation.Frame.Logo
local Nextcreate = logocreate.Next
local previouscreate = logocreate.Previous
local imagelabelcreate = logocreate.ImageLabel

-- Elements in ClanVisible frame
local clanvisibleframe = clanvisible.Frame
local clanvisiblename = clanvisibleframe.Frame.TextBox
local nextclanvis = clanvisibleframe.Frame.Next
local previousclanvis = clanvisibleframe.Frame.Previous
local members = clanvisibleframe.Members
local joinleave = clanvisible["Join/Leave"]

-- Check if the player is already in a clan
local function IsInClan()
	local found = localplayer:WaitForChild("clanfolder"):FindFirstChild("Part_of_clan")
	return found and found.Value == true
end

-- Get the name of the clan the player is in
local function WhatClan()
	local clanNameValue = localplayer:WaitForChild("clanfolder"):FindFirstChild("Clan_Name")
	return clanNameValue and clanNameValue.Value or ""
end

-- Change logo in ClanCreation frame to the next one
Nextcreate.MouseButton1Click:Connect(function()
	if current_logo < #logos then
		current_logo = current_logo + 1
	else
		current_logo = 1
	end
	imagelabelcreate.Image = logos[current_logo]
end)

-- Change logo in ClanCreation frame to the previous one
previouscreate.MouseButton1Click:Connect(function()
	if current_logo > 1 then
		current_logo = current_logo - 1
	else
		current_logo = #logos
	end
	imagelabelcreate.Image = logos[current_logo]
end)

-- Create a clan when the button is clicked
createbutton.MouseButton1Click:Connect(function()
	if clannamecreate.Text ~= "" and not IsInClan() then
		-- Fire server event for clan creation
		local clancreationevent = game.ReplicatedStorage:WaitForChild("Clancreation")
		clancreationevent:FireServer(clannamecreate.Text, logos[current_logo])

		-- Add clan to the local list
		table.insert(clans, clannamecreate.Text)

		-- Update clan-related information
		clanpart.Value = true
		clanname = Instance.new("StringValue")
		clanname.Parent = clanfolder
		clanname.Value = clannamecreate.Text
		clanname.Name = "Clan_Name"
	elseif clannamecreate.Text == "" then
		createbutton.Text = "Clan title may not be empty"
		wait(2)
		createbutton.Text = "Create"
	elseif IsInClan() then
		createbutton.Text = "You are already in a clan"
		wait(2)
		createbutton.Text = "Create"
	end
end)

-- Switch to the next clan in ClanVisible frame
nextclanvis.MouseButton1Click:Connect(function()
	if #clans > 0 and current_clan < #clans and clans[current_clan] ~= nil then
		current_clan = current_clan + 1
	else
		current_clan = 1
	end

	-- Update UI based on clan status
	if IsInClan() and WhatClan() == clans[current_clan] then
		joinleave.Text = "Leave"
	else
		joinleave.Text = "Join"
	end

	clanvisiblename.Text = clans[current_clan]
end)

-- Switch to the previous clan in ClanVisible frame
previousclanvis.MouseButton1Click:Connect(function()
	if #clans > 0 and current_clan > 1 and clans[current_clan] ~= nil then
		current_clan = current_clan - 1
	else
		current_clan = #clans
	end

	-- Update UI based on clan status
	if IsInClan() and clanname.Value == clans[current_clan] then
		joinleave.Text = "Leave"
	else
		joinleave.Text = "Join"
	end

	clanvisiblename.Text = clans[current_clan]
end)

-- Join or leave a clan
joinleave.MouseButton1Click:Connect(function()
	if joinleave.Text == "Join" and clanvisiblename ~= nil then
		clanpart.Value = true

		-- Update clan-related information
		clanname = Instance.new("StringValue")
		clanname.Parent = clanfolder
		clanname.Value = clans[current_clan]
		clanname.Name = "Clan_Name"
		joinleave.Text = "Leave"
	elseif joinleave.Text == "Leave" then
		clanpart.Value = false

		-- Remove clan-related information
		clanname:Destroy()
		joinleave.Text = "Join"
	end
end)
