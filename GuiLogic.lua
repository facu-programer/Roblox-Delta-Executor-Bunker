local function WaitForKey(tbl, key)
	while tbl[key] == nil do
		task.wait() -- espera un frame
	end
	return tbl[key]
end

WaitForKey(_G, "gui")
_G.gui.EnterButton.MouseButton1Click:Connect(function() 
	game.Players.LocalPlayer.PlayerGui.PScreen.Enabled = true
end)

local gui = game.Players.LocalPlayer.PlayerGui

local stop = Instance.new("ImageButton")
stop.Image = "rbxassetid://98939136188247"
stop.BackgroundColor3 = gui.PScreen.ScrollingFrame.BackgroundColor3
stop.BorderSizePixel = 0
stop.BorderColor3 = Color3.fromRGB(255, 255, 255)
stop.Parent = gui.PScreen.ScrollingFrame

stop.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.PlayerGui.PScreen.Enabled = false
end)

local autoCollectFood = Instance.new("TextButton")

autoCollectFood.Text = "Auto Collect Food"
autoCollectFood.BackgroundColor3 = gui.PScreen.ScrollingFrame.BackgroundColor3
autoCollectFood.TextScaled = true
autoCollectFood.TextColor3 = Color3.new(1, 1, 1)
autoCollectFood.BorderSizePixel = 4
autoCollectFood.BorderColor3 = Color3.fromRGB(255, 255, 255)
autoCollectFood.Parent = gui.PScreen.ScrollingFrame

local collect = false

autoCollectFood.MouseButton1Click:Connect(function() 
	collect = not collect
end)

task.spawn(function()
	if collect then
		for _, e in ipairs(game:GetDescendants()) do
			e = e :: Instance
			if e:IsA("Tool") then
				local e = e :: Tool
				local i = e:FindFirstChild("Handle")
				if i then
					local proxy = i:FindFirstChild("ProximityPrompt")
					if proxy then
						fireproximityprompt(proxy)
					end
				end
			end
		end
	end
	task.wait(1)
end)