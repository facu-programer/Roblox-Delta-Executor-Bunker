local player = game.Players.LocalPlayer
local GUI = player.PlayerGui
local HttpService = game:GetService("HttpService")

char = player.Character
if not char then
	player.CharacterAdded:Wait()
	char = player.Character
end
if char then
	hum = char:WaitForChild("Humanoid")
end

local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

local root = char:WaitForChild("HumanoidRootPart")
char.PrimaryPart = char:FindFirstChild("HumanoidRootPart")

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
FWare.ResetOnSpawn = false
FWare.DisplayOrder = 5
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

local stop = Instance.new("TextButton")

stop.Text = "STOP"
stop.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
stop.Position = UDim2.new(0.5, 0, 0.5, 0)
stop.Size = UDim2.new(0, 100, 0, 50)
stop.AnchorPoint = Vector2.new(0.5, 0.5)
stop.TextScaled = true
stop.TextColor3 = Color3.new(1, 1, 1)
stop.TextStrokeTransparency = 1
stop.BorderSizePixel = 0
stop.Transparency = 1
stop.Parent = screen

local TPBunker = Instance.new("TextButton")

local humanoid = hum
local char = getCharacter()
local root = char:WaitForChild("HumanoidRootPart")
local pos = root.CFrame
TPBunker.Text = "Teletransportarse al bunker"
TPBunker.AnchorPoint = Vector2.new(0, 0)
TPBunker.Position = UDim2.new(0, 110, 0, 0)
TPBunker.Size = UDim2.new(0, 75, 0, 75)
TPBunker.BorderSizePixel = 0
TPBunker.BackgroundTransparency = 0
TPBunker.TextColor3 = Color3.fromRGB(255, 255, 255)
TPBunker.TextScaled = true
TPBunker.Parent = SFrame

local U = Instance.new("UICorner")

U.CornerRadius = UDim.new(1, 0)
U.Parent = stop

local Bunkers = game.Workspace:WaitForChild("Bunkers")

local function getBunker()
	return Bunkers[player.UserId .. "_Bunker"]
end

local bunker = getBunker()

local function collectTools()
	stop.Transparency = 0
	print("iniciando collectTools")
	

	for _, e in ipairs(workspace:GetDescendants()) do
		if e:IsA("Tool") and e:FindFirstChild("Handle") then
			print("Tool encontrado: " .. e.Name)
			local handle = e.Handle
			local proxy = handle:FindFirstChild("ProximityPrompt") :: ProximityPrompt
			if proxy then
				print("proxy encontrado")
				-- Guardamos la posición original

				-- Teletransportamos al jugador al handle
				char:SetPrimaryPartCFrame(handle.CFrame)

				-- Esperamos que la posición cambie de verdad antes de seguir
				repeat
					task.wait()
				until (char.PrimaryPart.Position - handle.Position).Magnitude < 0.1

				fireproximityprompt(proxy)
			end
		end
	end

end

task.spawn(function()
	while true do
		local originalPosition = root.CFrame
		if collecting then
			pcall(collectTools)
			char:SetPrimaryPartCFrame(originalPosition)
		end
		task.wait(0.05)
	end
end)

AutoCollectFood.MouseButton1Click:Connect(function()
	collecting = not collecting
end)

stop.MouseButton1Click:Connect(function()
	collecting = false
	stop.Transparency = 1
end)

TPBunker.MouseButton1Click:Connect(function()
	char:SetPrimaryPartCFrame(bunker["SpawnLocation"].CFrame)
end)

local RunService = game:GetService("RunService")


local MIN_Y = -13
local SAFE_Y = -13

RunService.Heartbeat:Connect(function()
	local pos = root.Position
	if pos.Y < MIN_Y then
		local newCFrame = CFrame.new(pos.X, SAFE_Y, pos.Z)
		root.CFrame = newCFrame
	end
end)

local CoreGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BackpackButtonGui"
screenGui.ResetOnSpawn = false
screenGui.Enabled = true
screenGui.DisplayOrder = 10
screenGui.Parent = CoreGui

local otherGui = Instance.new("ScreenGui")
otherGui.Name = "BackpackOtherGui"
otherGui.ResetOnSpawn = false
otherGui.Enabled = true
otherGui.IgnoreGuiInset = true
otherGui.DisplayOrder = -10
otherGui.Parent = CoreGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 120, 0, 50)
button.Position = UDim2.new(0, 20, 0, 20)
button.Text = "Abrir Mochila"
button.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = screenGui

local bgFrame = Instance.new("ImageButton")
bgFrame.Size = UDim2.new(1,0,1,0)
bgFrame.Position = UDim2.new(0,0,0,0)
bgFrame.BackgroundTransparency = 1
bgFrame.Visible = false
bgFrame.Parent = otherGui

local SFrame = Instance.new("ScrollingFrame")
SFrame.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
SFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
SFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
SFrame.BorderSizePixel = 0
SFrame.Visible = true
SFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
SFrame.Parent = bgFrame

local UIGrabLayout = Instance.new("UIGridLayout")
UIGrabLayout.CellSize = UDim2.new(0, 100, 0, 100)
UIGrabLayout.CellPadding = UDim2.new(0, 20, 0, 20)
UIGrabLayout.Parent = SFrame

button.MouseButton1Click:Connect(function()
	bgFrame.Visible = true
	SFrame.Visible = true
	button.Visible = false
end)

bgFrame.MouseButton1Click:Connect(function(input)
	if not (SFrame:IsAncestorOf(input) or SFrame == input) then
		bgFrame.Visible = false
		SFrame.Visible = false
		button.Visible = true
	end
end)

-- Diccionario para contar tools con la misma imagen
local toolIcons = {}

local function updateToolIcon(tool)
	local image = tool.TextureId
	if toolIcons[image] then
		-- Si ya existe, aumenta el contador
		toolIcons[image].count = toolIcons[image].count + 1
		toolIcons[image].label.Text = "x"..toolIcons[image].count
	else
		-- Crear nuevo ícono
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 100, 0, 100)
		frame.BackgroundTransparency = 1
		frame.Parent = SFrame

		local i = Instance.new("ImageLabel")
		i.Size = UDim2.new(1,0,1,0)
		i.BackgroundTransparency = 1
		i.Image = image
		i.Parent = frame

		local countLabel = Instance.new("TextLabel")
		countLabel.Size = UDim2.new(0, 40, 0, 20)
		countLabel.Position = UDim2.new(1, -45, 1, -25)
		countLabel.BackgroundTransparency = 0.5
		countLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
		countLabel.TextColor3 = Color3.new(1,1,1)
		countLabel.TextScaled = true
		countLabel.Text = "x1"
		countLabel.Parent = frame

		toolIcons[image] = {count = 1, label = countLabel, frame = frame, tools = {tool}}

		-- Click para equipar
		frame.MouseButton1Click:Connect(function()
			-- Equipar el primer tool de la lista
			local firstTool = toolIcons[image].tools[1]
			if firstTool.Parent == player.Backpack then
				player.Character.Humanoid:EquipTool(firstTool)
			end
		end)
	end
end

-- Inicializa con las herramientas actuales
for _, e in ipairs(player.Backpack:GetChildren()) do
	if e:IsA("Tool") then
		updateToolIcon(e)
	end
end

-- Detecta herramientas nuevas
player.Backpack.ChildAdded:Connect(function(e)
	if e:IsA("Tool") then
		updateToolIcon(e)
	end
end)