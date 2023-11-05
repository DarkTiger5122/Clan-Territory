local Players = game.Players

local Playerlist = Players:GetChildren()

local function create_Player_label(plr)
	local PlayerLabel = Instance.new("TextLabel")
	PlayerLabel.Name = plr
	PlayerLabel.Parent = script.Parent.Frame.PlayerList
	PlayerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	PlayerLabel.BorderColor3 = Color3.fromRGB(255, 255, 255)
	PlayerLabel.BorderSizePixel = 2
	PlayerLabel.Size = UDim2.new(1, 0, 0, 50)
	PlayerLabel.Font = Enum.Font.ArialBold
	PlayerLabel.Text = plr
	PlayerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	PlayerLabel.TextSize = 14
end

for i,v in pairs(Playerlist) do
	create_Player_label(v.Name)
end

Players.PlayerAdded:Connect(function(plr)
	create_Player_label(plr.Name)
end)

Players.PlayerRemoving:Connect(function(plr)
	local foundplayer = script.Parent.Frame.PlayerList:FindFirstChild(plr.Name)
	if foundplayer then
		foundplayer:Destroy()
	end
end)
