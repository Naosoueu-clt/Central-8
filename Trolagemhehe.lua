-- Interface de Trollagem Leve para Roblox 😈 -- GUI com campo para nome, seletor de trollagem e campo cômico de "pronome"

local Players = game:GetService("Players") local LocalPlayer = Players.LocalPlayer local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Criar ScreenGui local gui = Instance.new("ScreenGui") gui.Name = "TrollInterface" gui.ResetOnSpawn = false gui.Parent = PlayerGui

-- Janela principal local frame = Instance.new("Frame") frame.Size = UDim2.new(0, 300, 0, 230) frame.Position = UDim2.new(0, 100, 0, 100) frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) frame.BorderSizePixel = 0 frame.Parent = gui

-- Título local title = Instance.new("TextLabel") title.Size = UDim2.new(1, 0, 0, 30) title.BackgroundTransparency = 1 title.Text = "🎭 Trollagem Suprema" title.Font = Enum.Font.SourceSansBold title.TextSize = 20 title.TextColor3 = Color3.new(1, 1, 1) title.Parent = frame

-- Caixa de texto para nome local nameBox = Instance.new("TextBox") nameBox.Size = UDim2.new(1, -20, 0, 30) nameBox.Position = UDim2.new(0, 10, 0, 40) nameBox.PlaceholderText = "Nome do jogador" nameBox.Text = "" nameBox.Font = Enum.Font.SourceSans nameBox.TextSize = 16 nameBox.TextColor3 = Color3.new(1, 1, 1) nameBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50) nameBox.Parent = frame

-- DropDown falso para "Pronomes" local pronounBox = Instance.new("TextBox") pronounBox.Size = UDim2.new(1, -20, 0, 25) pronounBox.Position = UDim2.new(0, 10, 0, 80) pronounBox.PlaceholderText = "Pronome (só zoeira kkk)" pronounBox.Text = "" pronounBox.Font = Enum.Font.SourceSansItalic pronounBox.TextSize = 14 pronounBox.TextColor3 = Color3.new(1, 1, 1) pronounBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40) pronounBox.Parent = frame

-- DropDown de trollagens local trollType = Instance.new("TextButton") trollType.Size = UDim2.new(1, -20, 0, 30) trollType.Position = UDim2.new(0, 10, 0, 120) trollType.Text = "🔽 Escolher Trollagem" trollType.Font = Enum.Font.SourceSansBold trollType.TextSize = 16 trollType.TextColor3 = Color3.new(1, 1, 1) trollType.BackgroundColor3 = Color3.fromRGB(70, 70, 70) trollType.Parent = frame

-- Lista de opções (escondida até clicar) local dropFrame = Instance.new("Frame") dropFrame.Size = UDim2.new(1, -20, 0, 90) dropFrame.Position = UDim2.new(0, 10, 0, 155) dropFrame.Visible = false dropFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45) dropFrame.BorderSizePixel = 0 dropFrame.Parent = frame

local options = {"Prender no Chão", "Jogar pra Cima", "Cabeção"} local selected = nil

for i, optionText in ipairs(options) do local opt = Instance.new("TextButton") opt.Size = UDim2.new(1, 0, 0, 30) opt.Position = UDim2.new(0, 0, 0, (i-1)*30) opt.BackgroundColor3 = Color3.fromRGB(60, 60, 60) opt.TextColor3 = Color3.new(1, 1, 1) opt.Font = Enum.Font.SourceSans opt.TextSize = 14 opt.Text = optionText opt.Parent = dropFrame

opt.MouseButton1Click:Connect(function()
    selected = optionText
    trollType.Text = "✅ " .. optionText
    dropFrame.Visible = false
end)

end

trollType.MouseButton1Click:Connect(function() dropFrame.Visible = not dropFrame.Visible end)

-- Botão de executar local execute = Instance.new("TextButton") execute.Size = UDim2.new(1, -20, 0, 30) execute.Position = UDim2.new(0, 10, 0, 190) execute.Text = "🚀 Executar Trollagem" execute.Font = Enum.Font.SourceSansBold execute.TextSize = 16 execute.TextColor3 = Color3.new(1, 1, 1) execute.BackgroundColor3 = Color3.fromRGB(90, 50, 50) execute.Parent = frame

-- Lógica de execução execute.MouseButton1Click:Connect(function() local name = nameBox.Text local player = Players:FindFirstChild(name)

if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
    local hrp = player.Character.HumanoidRootPart

    if selected == "Prender no Chão" then
        local bp = Instance.new("BodyPosition")
        bp.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bp.Position = hrp.Position
        bp.Parent = hrp
        task.delay(5, function()
            if bp then bp:Destroy() end
        end)

    elseif selected == "Jogar pra Cima" then
        hrp.Velocity = Vector3.new(0, 200, 0)

    elseif selected == "Cabeção" then
        local head = player.Character:FindFirstChild("Head")
        if head then
            head.Size = Vector3.new(5, 5, 5)
            task.delay(5, function()
                head.Size = Vector3.new(2, 1, 1) -- tamanho normal
            end)
        end
    end
end

end)

