local inventory = game.ReplicatedStorage.Inventory
local woodammount = script.Parent.Wood.Ammount

inventory.OnClientEvent:Connect(function(material)
	if material == "Wood" and woodammount.Value < 20 then
		woodammount.Value += 1
		script.Parent.Wood.Text = "Wood: "..woodammount.Value.."/20"
		print(script.Parent.Wood.Text)
	end
end)
