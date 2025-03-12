beta testing hitbox
_G.HeadSize = 7
_G.HeadDisabled = true
_G.HeadColor = Color3.fromRGB(255, 0, 0)  
_G.HeadTransparency = 0.5  


_G.HitboxSize = 5
_G.HitboxDisabled = true
_G.AggressiveExpansion = false  


local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer


local headConnection
local hitboxConnection

local function updatePlayerHeads()
    if not _G.HeadDisabled then return end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character then
                local head = character:FindFirstChild("Head")
                if head then
                    head.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                    head.Transparency = _G.HeadTransparency
                    head.Color = _G.HeadColor
                    head.Material = Enum.Material.Neon
                    head.CanCollide = false
                    head.Massless = true
                end
            end
        end
    end
end


local function updatePlayerHitboxes()
    if not _G.HitboxDisabled then return end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
            
            if _G.AggressiveExpansion then
                for _, part in ipairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        if _G.HitboxSize == 1 then
                            part.Size = part.Name == "HumanoidRootPart" and Vector3.new(2, 1, 1) or part.Size
                        else
                            part.Size = size
                        end
                        part.Transparency = 0.2
                        part.CanCollide = false
                    end
                end
            else
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root and root:IsA("BasePart") then
                    if _G.HitboxSize == 1 then
                        root.Size = Vector3.new(2, 1, 1)
                    else
                        root.Size = size
                    end
                    root.Transparency = 0.2
                    root.CanCollide = false
                end
            end
        end
    end
end


function toggleHeadMod(enabled)
    _G.HeadDisabled = enabled
    
    if headConnection then
        headConnection:Disconnect()
        headConnection = nil
    end
    
    if enabled then
        headConnection = RunService.RenderStepped:Connect(updatePlayerHeads)
    end
end


function toggleHitboxMod(enabled)
    _G.HitboxDisabled = enabled
    
    if hitboxConnection then
        hitboxConnection:Disconnect()
        hitboxConnection = nil
    end
    
    if enabled then
        hitboxConnection = RunService.Heartbeat:Connect(updatePlayerHitboxes)
    end
end


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PlayerEnhancer"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Position = UDim2.new(0.8, 0, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.BorderSizePixel = 0
Title.Text = "Player Enhancer"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Frame


local HeadSection = Instance.new("TextLabel")
HeadSection.Name = "HeadSection"
HeadSection.Size = UDim2.new(1, 0, 0, 25)
HeadSection.Position = UDim2.new(0, 0, 0.12, 0)
HeadSection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
HeadSection.BorderSizePixel = 0
HeadSection.Text = "Head Customization"
HeadSection.TextColor3 = Color3.fromRGB(255, 255, 255)
HeadSection.TextSize = 14
HeadSection.Font = Enum.Font.SourceSansBold
HeadSection.Parent = Frame


local SizeLabel = Instance.new("TextLabel")
SizeLabel.Name = "SizeLabel"
SizeLabel.Size = UDim2.new(0.4, 0, 0, 20)
SizeLabel.Position = UDim2.new(0.05, 0, 0.2, 0)
SizeLabel.BackgroundTransparency = 1
SizeLabel.Text = "Head Size:"
SizeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SizeLabel.TextSize = 14
SizeLabel.Font = Enum.Font.SourceSans
SizeLabel.TextXAlignment = Enum.TextXAlignment.Left
SizeLabel.Parent = Frame

local SizeSlider = Instance.new("Frame")
SizeSlider.Name = "SizeSlider"
SizeSlider.Size = UDim2.new(0.5, 0, 0, 6)
SizeSlider.Position = UDim2.new(0.45, 0, 0.2, 7)
SizeSlider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
SizeSlider.BorderSizePixel = 0
SizeSlider.Parent = Frame

local SizeKnob = Instance.new("Frame")
SizeKnob.Name = "SizeKnob"
SizeKnob.Size = UDim2.new(0, 12, 0, 12)
SizeKnob.Position = UDim2.new((_G.HeadSize - 1) / 19, -6, 0, -3)  -- Default position based on HeadSize
SizeKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SizeKnob.BorderSizePixel = 0
SizeKnob.Parent = SizeSlider

local SizeValue = Instance.new("TextLabel")
SizeValue.Name = "SizeValue"
SizeValue.Size = UDim2.new(0, 30, 0, 20)
SizeValue.Position = UDim2.new(0.92, 0, 0.2, 0)
SizeValue.BackgroundTransparency = 1
SizeValue.Text = tostring(_G.HeadSize)
SizeValue.TextColor3 = Color3.fromRGB(255, 255, 255)
SizeValue.TextSize = 14
SizeValue.Font = Enum.Font.SourceSans
SizeValue.Parent = Frame

local TransLabel = Instance.new("TextLabel")
TransLabel.Name = "TransLabel"
TransLabel.Size = UDim2.new(0.4, 0, 0, 20)
TransLabel.Position = UDim2.new(0.05, 0, 0.3, 0)
TransLabel.BackgroundTransparency = 1
TransLabel.Text = "Transparency:"
TransLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TransLabel.TextSize = 14
TransLabel.Font = Enum.Font.SourceSans
TransLabel.TextXAlignment = Enum.TextXAlignment.Left
TransLabel.Parent = Frame

local TransSlider = Instance.new("Frame")
TransSlider.Name = "TransSlider"
TransSlider.Size = UDim2.new(0.5, 0, 0, 6)
TransSlider.Position = UDim2.new(0.45, 0, 0.3, 7)
TransSlider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
TransSlider.BorderSizePixel = 0
TransSlider.Parent = Frame

local TransKnob = Instance.new("Frame")
TransKnob.Name = "TransKnob"
TransKnob.Size = UDim2.new(0, 12, 0, 12)
TransKnob.Position = UDim2.new(_G.HeadTransparency, -6, 0, -3)  -- Default position based on Transparency
TransKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TransKnob.BorderSizePixel = 0
TransKnob.Parent = TransSlider

local TransValue = Instance.new("TextLabel")
TransValue.Name = "TransValue"
TransValue.Size = UDim2.new(0, 30, 0, 20)
TransValue.Position = UDim2.new(0.92, 0, 0.3, 0)
TransValue.BackgroundTransparency = 1
TransValue.Text = string.format("%.1f", _G.HeadTransparency)
TransValue.TextColor3 = Color3.fromRGB(255, 255, 255)
TransValue.TextSize = 14
TransValue.Font = Enum.Font.SourceSans
TransValue.Parent = Frame


local ColorLabel = Instance.new("TextLabel")
ColorLabel.Name = "ColorLabel"
ColorLabel.Size = UDim2.new(0.4, 0, 0, 20)
ColorLabel.Position = UDim2.new(0.05, 0, 0.4, 0)
ColorLabel.BackgroundTransparency = 1
ColorLabel.Text = "Head Color:"
ColorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ColorLabel.TextSize = 14
ColorLabel.Font = Enum.Font.SourceSans
ColorLabel.TextXAlignment = Enum.TextXAlignment.Left
ColorLabel.Parent = Frame


local RedButton = Instance.new("TextButton")
RedButton.Name = "RedButton"
RedButton.Size = UDim2.new(0, 25, 0, 25)
RedButton.Position = UDim2.new(0.45, 0, 0.4, 0)
RedButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
RedButton.BorderSizePixel = 0
RedButton.Text = ""
RedButton.Parent = Frame


local GreenButton = Instance.new("TextButton")
GreenButton.Name = "GreenButton"
GreenButton.Size = UDim2.new(0, 25, 0, 25)
GreenButton.Position = UDim2.new(0.6, 0, 0.4, 0)
GreenButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
GreenButton.BorderSizePixel = 0
GreenButton.Text = ""
GreenButton.Parent = Frame


local BlueButton = Instance.new("TextButton")
BlueButton.Name = "BlueButton"
BlueButton.Size = UDim2.new(0, 25, 0, 25)
BlueButton.Position = UDim2.new(0.75, 0, 0.4, 0)
BlueButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
BlueButton.BorderSizePixel = 0
BlueButton.Text = ""
BlueButton.Parent = Frame


local HeadToggle = Instance.new("TextButton")
HeadToggle.Name = "HeadToggle"
HeadToggle.Size = UDim2.new(0.9, 0, 0, 25)
HeadToggle.Position = UDim2.new(0.05, 0, 0.5, 0)
HeadToggle.BackgroundColor3 = _G.HeadDisabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
HeadToggle.BorderSizePixel = 0
HeadToggle.Text = _G.HeadDisabled and "Head Mod: ON" or "Head Mod: OFF"
HeadToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
HeadToggle.TextSize = 14
HeadToggle.Font = Enum.Font.SourceSansBold
HeadToggle.Parent = Frame


local HitboxSection = Instance.new("TextLabel")
HitboxSection.Name = "HitboxSection"
HitboxSection.Size = UDim2.new(1, 0, 0, 25)
HitboxSection.Position = UDim2.new(0, 0, 0.58, 0)
HitboxSection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
HitboxSection.BorderSizePixel = 0
HitboxSection.Text = "Hitbox Customization"
HitboxSection.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxSection.TextSize = 14
HitboxSection.Font = Enum.Font.SourceSansBold
HitboxSection.Parent = Frame


local HitboxSizeLabel = Instance.new("TextLabel")
HitboxSizeLabel.Name = "HitboxSizeLabel"
HitboxSizeLabel.Size = UDim2.new(0.4, 0, 0, 20)
HitboxSizeLabel.Position = UDim2.new(0.05, 0, 0.65, 0)
HitboxSizeLabel.BackgroundTransparency = 1
HitboxSizeLabel.Text = "Hitbox Size:"
HitboxSizeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxSizeLabel.TextSize = 14
HitboxSizeLabel.Font = Enum.Font.SourceSans
HitboxSizeLabel.TextXAlignment = Enum.TextXAlignment.Left
HitboxSizeLabel.Parent = Frame

local HitboxSlider = Instance.new("Frame")
HitboxSlider.Name = "HitboxSlider"
HitboxSlider.Size = UDim2.new(0.5, 0, 0, 6)
HitboxSlider.Position = UDim2.new(0.45, 0, 0.65, 7)
HitboxSlider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
HitboxSlider.BorderSizePixel = 0
HitboxSlider.Parent = Frame

local HitboxKnob = Instance.new("Frame")
HitboxKnob.Name = "HitboxKnob"
HitboxKnob.Size = UDim2.new(0, 12, 0, 12)
HitboxKnob.Position = UDim2.new((_G.HitboxSize - 1) / 19, -6, 0, -3)
HitboxKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HitboxKnob.BorderSizePixel = 0
HitboxKnob.Parent = HitboxSlider

local HitboxValue = Instance.new("TextLabel")
HitboxValue.Name = "HitboxValue"
HitboxValue.Size = UDim2.new(0, 30, 0, 20)
HitboxValue.Position = UDim2.new(0.92, 0, 0.65, 0)
HitboxValue.BackgroundTransparency = 1
HitboxValue.Text = tostring(_G.HitboxSize)
HitboxValue.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxValue.TextSize = 14
HitboxValue.Font = Enum.Font.SourceSans
HitboxValue.Parent = Frame


local AggressiveLabel = Instance.new("TextLabel")
AggressiveLabel.Name = "AggressiveLabel"
AggressiveLabel.Size = UDim2.new(0.6, 0, 0, 20)
AggressiveLabel.Position = UDim2.new(0.05, 0, 0.75, 0)
AggressiveLabel.BackgroundTransparency = 1
AggressiveLabel.Text = "Expand All Parts:"
AggressiveLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AggressiveLabel.TextSize = 14
AggressiveLabel.Font = Enum.Font.SourceSans
AggressiveLabel.TextXAlignment = Enum.TextXAlignment.Left
AggressiveLabel.Parent = Frame

local AggressiveCheck = Instance.new("TextButton")
AggressiveCheck.Name = "AggressiveCheck"
AggressiveCheck.Size = UDim2.new(0, 20, 0, 20)
AggressiveCheck.Position = UDim2.new(0.65, 0, 0.75, 0)
AggressiveCheck.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AggressiveCheck.BorderColor3 = Color3.fromRGB(100, 100, 100)
AggressiveCheck.Text = _G.AggressiveExpansion and "✓" or ""
AggressiveCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
AggressiveCheck.TextSize = 14
AggressiveCheck.Font = Enum.Font.SourceSansBold
AggressiveCheck.Parent = Frame


local HitboxToggle = Instance.new("TextButton")
HitboxToggle.Name = "HitboxToggle"
HitboxToggle.Size = UDim2.new(0.9, 0, 0, 25)
HitboxToggle.Position = UDim2.new(0.05, 0, 0.85, 0)
HitboxToggle.BackgroundColor3 = _G.HitboxDisabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
HitboxToggle.BorderSizePixel = 0
HitboxToggle.Text = _G.HitboxDisabled and "Hitbox Mod: ON" or "Hitbox Mod: OFF"
HitboxToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
HitboxToggle.TextSize = 14
HitboxToggle.Font = Enum.Font.SourceSansBold
HitboxToggle.Parent = Frame


local function updateHeadSize(input)
    local sliderPosition = math.clamp((input.Position.X - SizeSlider.AbsolutePosition.X) / SizeSlider.AbsoluteSize.X, 0, 1)
    SizeKnob.Position = UDim2.new(sliderPosition, -6, 0, -3)
    _G.HeadSize = 1 + sliderPosition * 19  -- Range from 1 to 20
    SizeValue.Text = string.format("%.1f", _G.HeadSize)
end

SizeKnob.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local dragConnection
        local releaseConnection
        
        dragConnection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.Change then
                updateHeadSize(input)
            end
        end)
        
        releaseConnection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragConnection:Disconnect()
                releaseConnection:Disconnect()
            end
        end)
    end
end)

SizeSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        updateHeadSize(input)
    end
end)


local function updateTransparency(input)
    local sliderPosition = math.clamp((input.Position.X - TransSlider.AbsolutePosition.X) / TransSlider.AbsoluteSize.X, 0, 1)
    TransKnob.Position = UDim2.new(sliderPosition, -6, 0, -3)
    _G.HeadTransparency = sliderPosition
    TransValue.Text = string.format("%.1f", _G.HeadTransparency)
end

TransKnob.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local dragConnection
        local releaseConnection
        
        dragConnection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.Change then
                updateTransparency(input)
            end
        end)
        
        releaseConnection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragConnection:Disconnect()
                releaseConnection:Disconnect()
            end
        end)
    end
end)

TransSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        updateTransparency(input)
    end
end)


local function updateHitboxSize(input)
    local sliderPosition = math.clamp((input.Position.X - HitboxSlider.AbsolutePosition.X) / HitboxSlider.AbsoluteSize.X, 0, 1)
    HitboxKnob.Position = UDim2.new(sliderPosition, -6, 0, -3)
    _G.HitboxSize = 1 + sliderPosition * 19  -- Range from 1 to 20
    HitboxValue.Text = string.format("%.1f", _G.HitboxSize)
end

HitboxKnob.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local dragConnection
        local releaseConnection
        
        dragConnection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.Change then
                updateHitboxSize(input)
            end
        end)
        
        releaseConnection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragConnection:Disconnect()
                releaseConnection:Disconnect()
            end
        end)
    end
end)

HitboxSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        updateHitboxSize(input)
    end
end)

-- Color button functionality
RedButton.MouseButton1Click:Connect(function()
    _G.HeadColor = Color3.fromRGB(255, 0, 0)
end)

GreenButton.MouseButton1Click:Connect(function()
    _G.HeadColor = Color3.fromRGB(0, 255, 0)
end)

BlueButton.MouseButton1Click:Connect(function()
    _G.HeadColor = Color3.fromRGB(0, 0, 255)
end)


AggressiveCheck.MouseButton1Click:Connect(function()
    _G.AggressiveExpansion = not _G.AggressiveExpansion
    AggressiveCheck.Text = _G.AggressiveExpansion and "✓" or ""
end)


HeadToggle.MouseButton1Click:Connect(function()
    _G.HeadDisabled = not _G.HeadDisabled
    HeadToggle.Text = _G.HeadDisabled and "Head Mod: ON" or "Head Mod: OFF"
    HeadToggle.BackgroundColor3 = _G.HeadDisabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    toggleHeadMod(_G.HeadDisabled)
end)


HitboxToggle.MouseButton1Click:Connect(function()
    _G.HitboxDisabled = not _G.HitboxDisabled
    HitboxToggle.Text = _G.HitboxDisabled and "Hitbox Mod: ON" or "Hitbox Mod: OFF"
    HitboxToggle.BackgroundColor3 = _G.HitboxDisabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    toggleHitboxMod(_G.HitboxDisabled)
end)


toggleHeadMod(_G.HeadDisabled)
toggleHitboxMod(_G.HitboxDisabled)
