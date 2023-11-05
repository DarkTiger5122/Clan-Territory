local UserInputService = game:GetService("UserInputService")

script.Parent.MouseEnter:Connect(function()
	script.Parent.BackgroundColor3 = Color3.new(0.513725, 0.513725, 0.513725)
end)

script.Parent.MouseLeave:Connect(function()
	script.Parent.BackgroundColor3 = Color3.new(0, 0, 0)
end)