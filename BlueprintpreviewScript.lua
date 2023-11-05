local BE = game.ReplicatedStorage.build

local runService = game:GetService("RunService")
local players = game:GetService("Players")
local player = players.LocalPlayer
local mouse = player:GetMouse()
local mousePart = workspace.Blueprints.BP_Wall
mouse.TargetFilter = mousePart

BE.Event:Connect(function(placing)
	print(tostring(placing))
	if placing == true then
		local RenderStepped = runService.RenderStepped:Connect(function()
			local x,y,z = mouse.Hit.X, mouse.Hit.Y, mouse.Hit.Z

			if mouse.Target then
				mousePart.CFrame = CFrame.new(x,y * mousePart.Size.Y*0.5,z)
			end
		end)
	end
end)