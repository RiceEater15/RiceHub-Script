local ESPSystem = {}

ESPSystem.Config = {
    NameDisplay = {
        Enabled = true,
        StudsOffset = Vector3.new(0, 2, 0),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        ShowDistance = true,
        ShowHealth = true
    },
    
    Highlight = {
        Enabled = true,
        FillTransparency = 0.5,
        OutlineTransparency = 0,
        TeamColors = true,
        FriendColor = Color3.fromRGB(0, 255, 0),
        EnemyColor = Color3.fromRGB(255, 0, 0),
        NeutralColor = Color3.fromRGB(255, 255, 0)
    },
    
    UpdateRate = 0.1,
    MaxRenderDistance = 1000,
    
    IgnoreLocalPlayer = true,
    OnlyShowEnemies = false
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local activePlayerESP = {}
local updateConnections = {}
local lastUpdate = os.clock()

local function getDistanceFromCamera(position)
    return (Camera.CFrame.Position - position).Magnitude
end

local function isPlayerEnemy(player)
    if not LocalPlayer.Team then return true end
    return player.Team ~= LocalPlayer.Team
end

local function getColorForPlayer(player)
    if ESPSystem.Config.Highlight.TeamColors and player.Team and player.TeamColor then
        return player.TeamColor.Color
    elseif isPlayerEnemy(player) then
        return ESPSystem.Config.Highlight.EnemyColor
    elseif player:IsFriendsWith(LocalPlayer.UserId) then
        return ESPSystem.Config.Highlight.FriendColor
    else
        return ESPSystem.Config.Highlight.NeutralColor
    end
end

local function formatDistance(distance)
    return math.floor(distance + 0.5)
end

local function getPlayerHealth(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        return {
            Current = humanoid.Health,
            Max = humanoid.MaxHealth
        }
    end
    return nil
end

function ESPSystem.CreateESP(player)
    if player == LocalPlayer and ESPSystem.Config.IgnoreLocalPlayer then return end
    if ESPSystem.Config.OnlyShowEnemies and not isPlayerEnemy(player) then return end
    
    local character = player.Character
    if not character then return end
    
    local head = character:FindFirstChild("Head")
    if not head then return end
    
    activePlayerESP[player.Name] = {
        Player = player,
        Character = character,
        ESP = {
            Billboard = nil,
            TextLabel = nil,
            Highlight = nil
        },
        Data = {
            Distance = 0,
            Health = getPlayerHealth(character) or {Current = 0, Max = 100}
        }
    }
    
    local playerData = activePlayerESP[player.Name]
    
    if ESPSystem.Config.NameDisplay.Enabled then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESPBillboard_" .. player.Name
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = ESPSystem.Config.NameDisplay.StudsOffset
        billboard.AlwaysOnTop = true
        billboard.LightInfluence = 0
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "ESPText"
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextSize = ESPSystem.Config.NameDisplay.TextSize
        textLabel.Font = ESPSystem.Config.NameDisplay.Font
        textLabel.TextStrokeTransparency = 0.5
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        textLabel.TextColor3 = getColorForPlayer(player)
        textLabel.Parent = billboard
        
        billboard.Parent = head
        
        playerData.ESP.Billboard = billboard
        playerData.ESP.TextLabel = textLabel
    end
    
    if ESPSystem.Config.Highlight.Enabled then
        local highlight = Instance.new("Highlight")
        highlight.Name = "ESPHighlight_" .. player.Name
        highlight.FillTransparency = ESPSystem.Config.Highlight.FillTransparency
        highlight.OutlineTransparency = ESPSystem.Config.Highlight.OutlineTransparency
        highlight.FillColor = getColorForPlayer(player)
        highlight.OutlineColor = Color3.new(1, 1, 1)
        highlight.Parent = character
        
        playerData.ESP.Highlight = highlight
    end
    
    ESPSystem.UpdatePlayerESP(player)
    
    updateConnections[player.Name] = RunService.Heartbeat:Connect(function()
        local currentTime = os.clock()
        if currentTime - lastUpdate >= ESPSystem.Config.UpdateRate then
            lastUpdate = currentTime
            ESPSystem.UpdatePlayerESP(player)
        end
    end)
end

function ESPSystem.UpdatePlayerESP(player)
    local playerData = activePlayerESP[player.Name]
    if not playerData then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local distance = getDistanceFromCamera(humanoidRootPart.Position)
    playerData.Data.Distance = distance
    playerData.Data.Health = getPlayerHealth(character) or playerData.Data.Health
    
    local isVisible = distance <= ESPSystem.Config.MaxRenderDistance
    
    if playerData.ESP.TextLabel then
        local displayText = player.Name
        
        if ESPSystem.Config.NameDisplay.ShowDistance then
            displayText = displayText .. " [" .. formatDistance(distance) .. "m]"
        end
        
        if ESPSystem.Config.NameDisplay.ShowHealth and playerData.Data.Health then
            local healthPercentage = math.floor((playerData.Data.Health.Current / playerData.Data.Health.Max) * 100)
            displayText = displayText .. "\n❤️ " .. healthPercentage .. "%"
        end
        
        playerData.ESP.TextLabel.Text = displayText
        playerData.ESP.TextLabel.TextColor3 = getColorForPlayer(player)
        
        if playerData.ESP.Billboard then
            playerData.ESP.Billboard.Enabled = isVisible
        end
    end
    
    if playerData.ESP.Highlight then
        playerData.ESP.Highlight.FillColor = getColorForPlayer(player)
        playerData.ESP.Highlight.Enabled = isVisible
    end
end

function ESPSystem.RemoveESP(player)
    local playerData = activePlayerESP[player.Name]
    if not playerData then return end
    
    if updateConnections[player.Name] then
        updateConnections[player.Name]:Disconnect()
        updateConnections[player.Name] = nil
    end
    
    if playerData.ESP.Billboard then
        playerData.ESP.Billboard:Destroy()
    end
    
    if playerData.ESP.Highlight then
        playerData.ESP.Highlight:Destroy()
    end
    
    activePlayerESP[player.Name] = nil
end

function ESPSystem.TrackPlayer(player)
    player.CharacterAdded:Connect(function(character)
        ESPSystem.RemoveESP(player) 
        task.wait(0.5)
        ESPSystem.CreateESP(player)
    end)
    
    player.CharacterRemoving:Connect(function()
        ESPSystem.RemoveESP(player)
    end)
    
    if player.Character then
        task.spawn(function()
            ESPSystem.CreateESP(player)
        end)
    end
end

function ESPSystem.Initialize()
    Players.PlayerAdded:Connect(function(player)
        ESPSystem.TrackPlayer(player)
    end)
    
    Players.PlayerRemoving:Connect(function(player)
        ESPSystem.RemoveESP(player)
    end)
    
    for _, player in pairs(Players:GetPlayers()) do
        task.spawn(function()
            ESPSystem.TrackPlayer(player)
        end)
    end
    
    if game:GetService("Teams") then
        for _, player in pairs(Players:GetPlayers()) do
            player:GetPropertyChangedSignal("Team"):Connect(function()
                local playerData = activePlayerESP[player.Name]
                if playerData then
                    if playerData.ESP.TextLabel then
                        playerData.ESP.TextLabel.TextColor3 = getColorForPlayer(player)
                    end
                    
                    if playerData.ESP.Highlight then
                        playerData.ESP.Highlight.FillColor = getColorForPlayer(player)
                    end
                    
                    if ESPSystem.Config.OnlyShowEnemies then
                        if isPlayerEnemy(player) then
                            if not playerData.ESP.Billboard and not playerData.ESP.Highlight then
                                ESPSystem.CreateESP(player)
                            end
                        else
                            ESPSystem.RemoveESP(player)
                        end
                    end
                end
            end)
        end
    end
    
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightAlt then
            ESPSystem.Toggle()
        end
    end)
    
    print("ESP System v1.2 initialized")
end

function ESPSystem.Toggle(enabled)
    if enabled == nil then
        local anyActive = false
        for _, playerData in pairs(activePlayerESP) do
            if playerData.ESP.Billboard and playerData.ESP.Billboard.Enabled then
                anyActive = true
                break
            end
        end
        
        for _, playerData in pairs(activePlayerESP) do
            if playerData.ESP.Billboard then
                playerData.ESP.Billboard.Enabled = not anyActive
            end
            if playerData.ESP.Highlight then
                playerData.ESP.Highlight.Enabled = not anyActive
            end
        end
        
        print("ESP " .. (anyActive and "disabled" or "enabled"))
    else
        for _, playerData in pairs(activePlayerESP) do
            if playerData.ESP.Billboard then
                playerData.ESP.Billboard.Enabled = enabled
            end
            if playerData.ESP.Highlight then
                playerData.ESP.Highlight.Enabled = enabled
            end
        end
        
        print("ESP " .. (enabled and "enabled" or "disabled"))
    end
end

ESPSystem.Initialize()

return ESPSystem
