local ESPEnabled = false

-- Função que cria o ESP
local function toggleESP()
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
			if ESPEnabled then
				if not player.Character.Head:FindFirstChild("ESPHighlight") then
					local highlight = Instance.new("BillboardGui")
					highlight.Name = "ESPHighlight"
					highlight.Size = UDim2.new(0, 100, 0, 20)
					highlight.AlwaysOnTop = true
					highlight.StudsOffset = Vector3.new(0, 3, 0)
					highlight.Adornee = player.Character.Head

					local label = Instance.new("TextLabel")
					label.Size = UDim2.new(1, 0, 1, 0)
					label.Text = player.Name
					label.BackgroundTransparency = 1
					label.TextColor3 = Color3.fromRGB(255, 0, 0)
					label.TextStrokeTransparency = 0
					label.TextScaled = true
					label.Parent = highlight

					highlight.Parent = player.Character.Head
				end
			else
				if player.Character.Head:FindFirstChild("ESPHighlight") then
					player.Character.Head.ESPHighlight:Destroy()
				end
			end
		end
	end
end

-- Atualiza o ESP quando jogadores entram
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		wait(1)
		toggleESP()
	end)
end)

-- Botão para ligar/desligar o ESP
local screenGui = Instance.new("ScreenGui", game.CoreGui)
local button = Instance.new("TextButton", screenGui)
button.Size = UDim2.new(0, 120, 0, 40)
button.Position = UDim2.new(0, 10, 0, 10)
button.Text = "Toggle ESP"
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.new(1, 1, 1)
button.BorderSizePixel = 0
button.AutoButtonColor = true
button.TextScaled = true
button.Visible = true

button.MouseButton1Click:Connect(function()
	ESPEnabled = not ESPEnabled
	toggleESP()
end)
