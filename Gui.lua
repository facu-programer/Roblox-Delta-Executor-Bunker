_G.gui = {}
local bola = Instance.new("ScreenGui")
bola.DisplayOrder = 0
bola.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
frame.Position = UDim2.new(0.5, 0, 0, 0)
frame.AnchorPoint = Vector2.new(0.5, 0)
frame.Size = UDim2.new(0, 125, 0, 25)
frame.Draggable = true
frame.Parent = bola

local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(1,0)
UICorner.Parent = frame

local TextButton = Instance.new("TextButton")
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.AnchorPoint = Vector2.new(0, 0)
TextButton.BackgroundTransparency = 1
TextButton.Size = UDim2.new(0, 125, 0, 25)
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Text = "FWare"
TextButton.TextScaled = true
TextButton.TextStrokeTransparency = 1
TextButton.Parent = frame

local PScreen = Instance.new("ScreenGui")

PScreen.Name = "PScreen"
PScreen.Enabled = false
PScreen.DisplayOrder = 1
PScreen.Parent = game.Players.LocalPlayer.PlayerGui

local PFrame = Instance.new("ScrollingFrame")

PFrame.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
PFrame.Position = UDim2.new(0, 0, 0, 0)
PFrame.Size	 = UDim2.new(1, 0, 1, 0)
PFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
PFrame.ScrollBarThickness = 8
PFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
PFrame.Parent = PScreen

_G.gui.EnterButton = TextButton

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 20)
padding.PaddingBottom = UDim.new(0, 20)
padding.PaddingLeft = UDim.new(0, 20)
padding.PaddingRight = UDim.new(0, 20)
padding.Parent = PFrame

local grid = Instance.new("UIGridLayout")

grid.CellPadding = UDim2.new(0, 20, 0, 20)
grid.CellSize = UDim2.new(0, 100, 0, 100)
grid.Parent = PFrame