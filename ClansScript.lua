local clancreationevent = game.ReplicatedStorage:WaitForChild("Clancreation")

clancreationevent.OnServerEvent:Connect(function(plr,clan_name,clan_logo)
	print("ontvangen")
	local clan = Instance.new("StringValue")
	clan.Parent = script.Parent
	clan.Name = clan_name
	clan.Value = clan_logo
	
	
end)

