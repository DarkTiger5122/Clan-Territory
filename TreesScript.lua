local trees = script.Parent

alltrees = trees:GetChildren()
treenames = {"LargeTree","MediumTree","SmallTree"}

local Inventory = game.ReplicatedStorage.Inventory

for i,v in pairs(alltrees) do
	if table.find(treenames,v.Name) then
		ClickDetector = Instance.new("ClickDetector")
		ClickDetector.Parent = v
		ClickDetector.MaxActivationDistance = 5
		
		ClickDetector.MouseClick:Connect(function(plr)
			v:Destroy()
			Inventory:FireClient(plr,"Wood")
			print("Fired at client")
		end)
	end
end
