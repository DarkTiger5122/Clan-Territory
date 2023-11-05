local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Item to be placed
local item = workspace.Blueprints.BP_Wall

-- Buttons/controls for rotation, placement, and initialization
local RotateLeftButton = Enum.KeyCode.Q
local RotateRightButton = Enum.KeyCode.E
local PlaceButton = Enum.KeyCode.T
local InitializeBuildingButton = Enum.KeyCode.P

-- Mouse object for user input
local mouse = game.Players.LocalPlayer:GetMouse()

-- RunService Function for continuous updates
local RunServiceFunction = nil

-- Flag to track whether placing is in progress
local placing = false

-- Coordinates for item placement
local x, y, z = 0, 0, 0

-- Y Rotation angle for the item
local yrot = 0

-- Function to place an item at specified coordinates and rotation
local function place(xpos, ypos, zpos, yrotation)
	-- Clone the built item and set its position and rotation
	local bpwall = workspace.Blueprints.BP_Wall_Built:Clone()
	bpwall.CFrame = CFrame.new(xpos, ypos, zpos) * CFrame.Angles(0, math.rad(yrotation), 0)
	bpwall.Parent = workspace
end

-- Input Began Event handler
UserInputService.InputBegan:Connect(function(input, processed)
	if processed then
		return
	end

	-- Initialization Button Handling
	if input.KeyCode == InitializeBuildingButton then
		handleInitializationButton()
		-- Place Button Handling
	elseif input.KeyCode == PlaceButton and placing then
		handlePlaceButton()
		-- Rotation Buttons Handling
	elseif placing then
		handleRotationButtons(input)
	end
end)

-- Function to handle Initialization Button click
function handleInitializationButton()
	if not placing then
		startPlacing()
	else
		stopPlacing()
	end
end

-- Function to start placing
function startPlacing()
	placing = true
	RunServiceFunction = RunService.RenderStepped:Connect(function()
		updatePreviewItemPosition()
	end)
end

-- Function to stop placing
function stopPlacing()
	RunServiceFunction:Disconnect()
	resetPreviewItemPosition()
	placing = false
end

-- Function to update the position of the preview item based on mouse position
function updatePreviewItemPosition()
	x, y, z = mouse.Hit.X, mouse.Hit.Y, mouse.Hit.Z
	if mouse.Target then
		item.CFrame = CFrame.new(x, y + item.Size.Y * 0.5, z) * CFrame.Angles(0, math.rad(yrot), 0)
	end
end

-- Function to reset the position of the preview item
function resetPreviewItemPosition()
	item.CFrame = CFrame.new(-4.8, 4, -52.25)
end

-- Function to handle Place Button click
function handlePlaceButton()
	local wood = game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Materials.Wood
	if wood.Ammount.Value >= 1 then
		placeItem()
	else
		print("Not enough wood to place")
	end
	stopPlacing()
end

-- Function to place the item
function placeItem()
	place(x, y + item.Size.Y * 0.5, z, yrot)
	local wood = game.Players.LocalPlayer.PlayerGui.Inventory.Frame.Materials.Wood
	wood.Ammount.Value -= 1
	wood.Text = "Wood: "..wood.Ammount.Value.."/20"
	print("Wood: "..wood.Ammount.Value.."/20")
end

-- Function to handle Rotation Buttons (Rotate Left/Right) click
function handleRotationButtons(input)
	if input.KeyCode == RotateRightButton then
		rotateItem(45)
	elseif input.KeyCode == RotateLeftButton then
		rotateItem(-45)
	end
end

-- Function to rotate the item
function rotateItem(angle)
	yrot = (yrot + angle) % 360
	item.CFrame = item.CFrame * CFrame.Angles(0, math.rad(angle), 0)
end
