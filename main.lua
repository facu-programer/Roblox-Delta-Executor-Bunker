local player = game.Players.LocalPlayer
local GUI = player.PlayerGui

local bola = Instance.new("ScreenGui")

bola.Name = "Bola"
bola.IgnoreGuiInset = true
bola.ResetOnSpawn = false
bola.Parent = GUI

local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
frame.Position = UDim2.new(0.5, 0, 0, 0)
frame.AnchorPoint = Vector2.new(0.5, 0)
frame.Size = UDim2.new(0, 125, 0, 25)
frame.Parent = bola

local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(1,0)
UICorner.Parent = frame

local separation = Instance.new("Frame")

separation.Position = UDim2.new(0, 29, 0 , 0)
separation.Size = UDim2.new(0,1,0,25)
separation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
separation.BorderSizePixel = 0
separation.Parent = frame

local Move = Instance.new("ImageButton")

Move.Name = "Move"
Move.Image = "rbxassetid://114710650893836"
Move.Position = UDim2.new(0, 2, 0, 0)
Move.Size = UDim2.new(0, 25, 0, 25)
Move.BackgroundTransparency = 1
Move.Parent = frame

local Enter = Instance.new("TextButton")
Enter.Name = "Enter"
Enter.Text = "FWare"
Enter.Position = UDim2.new(0, 29, 0, 0)
Enter.Size = UDim2.new(0, 95, 0, 25)
Enter.BackgroundTransparency = 1
Enter.TextSize = 23
Enter.TextStrokeTransparency = 1
Enter.TextColor3 = Color3.fromRGB(255, 255, 255)
Enter.TextScaled = false
Enter.Font = Enum.Font.SourceSans
Enter.Parent = frame

local button = Move
local framePrincipal = frame
local screen = bola

local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragStart
local startPos

button.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = framePrincipal.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

button.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		if dragging then
			local delta = input.Position - dragStart
			framePrincipal.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end
end)

Enter.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.PlayerGui.FWare.Enabled = true
	game.Players.LocalPlayer.PlayerGui.Bola.Enabled = false
end)

local FWare = Instance.new("ScreenGui")

FWare.Name = "FWare"
FWare.IgnoreGuiInset = false
FWare.Enabled = false
FWare.Parent = GUI

local SFrame = Instance.new("Frame")

SFrame.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
SFrame.Position = UDim2.new(0, 10, 0, 10)
SFrame.Size = UDim2.new(1, -20, 1, -20)
SFrame.BorderSizePixel = 0
SFrame.BackgroundTransparency = 0
SFrame.Parent = FWare

local Equis = Instance.new("ImageButton")

Equis.Image = "rbxassetid://98939136188247"
Equis.AnchorPoint = Vector2.new(1, 0)
Equis.Position = UDim2.new(1, -10, 0, 10)
Equis.Size = UDim2.new(0, 75, 0, 75)
Equis.BorderSizePixel = 0
Equis.BackgroundTransparency = 1
Equis.Parent = FWare

Equis.MouseButton1Click:Connect(function()
	GUI.Bola.Enabled = true
	GUI.FWare.Enabled = false
end)

local AutoCollectFood = Instance.new("TextButton")

AutoCollectFood.Text = "Auto Recolectar Comida"
AutoCollectFood.AnchorPoint = Vector2.new(0, 0)
AutoCollectFood.Position = UDim2.new(0, 0, 0, 0)
AutoCollectFood.Size = UDim2.new(0, 75, 0, 75)
AutoCollectFood.BorderSizePixel = 0
AutoCollectFood.BackgroundTransparency = 0
AutoCollectFood.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoCollectFood.TextScaled = true
AutoCollectFood.Parent = SFrame

local collecting = false
local player = game.Players.LocalPlayer

local function getHumanoid()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end


AutoCollectFood.MouseButton1Click:Connect(function()
	collecting = not collecting
	if collecting then
		spawn(function()
			while collecting do
				task.wait(0.1)
				local humanoid = getHumanoid()
				if humanoid then
					for _, e in ipairs(workspace:GetDescendants()) do
						if e:IsA("Tool") and e:FindFirstChild("Handle") then
							local proxy = e:WaitForChild("Handle"):WaitForChild("ProximityPrompt") :: ProximityPrompt
							
							proxy:InputHoldBegin()
							task.wait(proxy.HoldDuration)
							proxy:InputHoldEnd()

							humanoid:EquipTool(e)
						end
					end
				end
			end
		end)
	end
end)


if not game:IsLoaded() then
	game.Loaded:Wait()
end
