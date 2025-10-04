local player = game.Players.LocalPlayer
local GUI = player.PlayerGui
local HttpService = game:GetService("HttpService")

local function getHumanoid()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("Humanoid")
end

local function getCharacter()
	return player.Character or player.CharacterAdded:Wait()
end

local char = getCharacter()
local root = char.HumanoidRootPart

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

local collecting = false
local player = game.Players.LocalPlayer

-- Función principal de auto-collect
local function collectTools()
	stop.Transparency = 0
	local humanoid = getHumanoid()
	local char = getCharacter()
	local root = char:WaitForChild("HumanoidRootPart")
	local pos = root.CFrame

	-- Recorremos workspace en busca de Tools con ProximityPrompt
	for _, e in ipairs(workspace:GetDescendants()) do
		if not collecting then break end 
		if e:IsA("Tool") and e:FindFirstChild("Handle") then
			local proxy = e.Handle:FindFirstChild("ProximityPrompt") :: ProximityPrompt
			if proxy then
				-- Activar el ProximityPrompt
				char:SetPrimaryPartCFrame(pos)
				proxy:InputHoldBegin()
				--char:SetPrimaryPartCFrame(pos)
				proxy:InputHoldEnd()
				--char:SetPrimaryPartCFrame(pos)
				
				e.Handle.CFrame = root.CFrame
				--char:SetPrimaryPartCFrame(pos)
				-- Mover Tool al Backpack antes de equipar
				--char:SetPrimaryPartCFrame(pos)
				e.Parent = player.Backpack
				
				-- Equipar Tool
				--char:SetPrimaryPartCFrame(pos)
				humanoid:EquipTool(e)
				e.Equipped:Connect(function()
					local char = game.Players.LocalPlayer.Character
					local root = char:WaitForChild("HumanoidRootPart")
					local pos = root.CFrame
					local J = true

					-- Listener para des-equipear
					local connection
					connection = e.Unequipped:Connect(function()
						J = false
						connection:Disconnect() -- desconecta el listener al soltar la Tool
					end)

					-- Loop de congelamiento
					while J do
						task.wait() -- actualizamos cada 0.05s
						--char:SetPrimaryPartCFrame(pos)
					end
				end)

			end
		end
	end
end

-- Loop de auto-collect
spawn(function()
	while true do
		task.wait(0.1)
		if collecting then
			pcall(collectTools)
		else
			-- Descongelar si no estamos recolectando
			local humanoid = getHumanoid()
		end
	end
end)

-- Activar/desactivar con botón
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

-- Limite Y mínimo
local MIN_Y = -14
local SAFE_Y = -13

RunService.Heartbeat:Connect(function()
	local pos = root.Position
	if pos.Y < MIN_Y then
		-- Teletransporta suavemente arriba del vacío
		local newCFrame = CFrame.new(pos.X, SAFE_Y, pos.Z)
		root.CFrame = newCFrame
	end
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Crear ScreenGui en CoreGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BackpackButtonGui"
screenGui.ResetOnSpawn = false
screenGui.Enabled = true
screenGui.Parent = CoreGui

-- Crear botón
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 120, 0, 50)
button.Position = UDim2.new(0, 20, 0, 20)
button.Text = "Abrir Mochila"
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = screenGui

-- Frame de fondo transparente para detectar clics fuera del ScrollingFrame
local bgFrame = Instance.new("Frame")
bgFrame.Size = UDim2.new(1,0,1,0)
bgFrame.Position = UDim2.new(0,0,0,0)
bgFrame.BackgroundTransparency = 0.5 -- semi-transparente
bgFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
bgFrame.Visible = false
bgFrame.Parent = screenGui

-- Crear ScrollingFrame
local SFrame = Instance.new("ScrollingFrame")
SFrame.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
SFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
SFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
SFrame.BorderSizePixel = 0
SFrame.Visible = false
SFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
SFrame.Parent = bgFrame -- importante que esté dentro del fondo

-- UIGridLayout
local UIGrabLayout = Instance.new("UIGridLayout")
UIGrabLayout.CellSize = UDim2.new(0, 100, 0, 100)
UIGrabLayout.CellPadding = UDim2.new(0, 20, 0, 20)
UIGrabLayout.Parent = SFrame

-- Abrir mochila
button.MouseButton1Click:Connect(function()
	bgFrame.Visible = true
	SFrame.Visible = true
end)

-- Cerrar al hacer clic fuera del ScrollingFrame
bgFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		if not SFrame:IsAncestorOf(input.Target) then
			bgFrame.Visible = false
			SFrame.Visible = false
		end
	end
end)

