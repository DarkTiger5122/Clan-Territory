game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)

local HPbar = script.Parent.Frame.Background.Frame.HP
local localplayer = game.Players.LocalPlayer
local char = localplayer.Character


print("Player spawned")
char:WaitForChild("Humanoid"):GetPropertyChangedSignal("Health"):Connect(function()
	local newhealth = char.Humanoid.Health
	newhealth = newhealth/100
	print(newhealth)
	HPbar.Size = UDim2.new(tonumber(newhealth),0,1,0)
	print("Health changed")
end)

