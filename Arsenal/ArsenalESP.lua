_G.sizeof = 55
_G.AimOn = false
_G.TeamCheckOn = true
_G.Aimpart = "Head"
_G.Sensitivity = 0.03
_G.CircleSides = 64
_G.CircleColor = Color3.fromRGB(255, 255, 255)
_G.CircleVisible = true
_G.fovTransparency = 0

_G.EspEnabled = true
_G.TeamCheckOn = true

if _G.EspEnabled then
end

if _G.TeamCheckOn then
end

if _G.AimOn then
end

_G.CircleVisible = true

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local esp = Instance.new("BillboardGui")
local name = Instance.new("TextLabel")
local mainesp = Instance.new("BillboardGui")
local box = Instance.new("ImageLabel")
local LocalPlayer = Players.LocalPlayer

esp.Name = "esp"
esp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
esp.Active = true
esp.AlwaysOnTop = true
esp.LightInfluence = 1.000
esp.Size = UDim2.new(0, 300, 0, 30)
esp.StudsOffset = Vector3.new(0, 3, 0)

name.Name = "name"
name.Parent = esp
name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
name.BackgroundTransparency = 1.000
name.BorderColor3 = Color3.fromRGB(0, 0, 0)
name.BorderSizePixel = 0
name.Size = UDim2.new(1, 0, 1, 0)
name.Font = Enum.Font.Ubuntu
name.TextColor3 = Color3.fromRGB(255, 255, 255)
name.TextScaled = false
name.TextSize = 9.000
name.TextStrokeTransparency = 0.000
name.TextWrapped = true
name.TextTransparency = 1

mainesp.Name = "mainesp"
mainesp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
mainesp.Active = true
mainesp.AlwaysOnTop = true
mainesp.LightInfluence = 1.000
mainesp.MaxDistance = 999999.000
mainesp.Size = UDim2.new(4, 0, 6, 0)

box.Name = "box"
box.Parent = mainesp
box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
box.BackgroundTransparency = 1.000
box.BorderColor3 = Color3.fromRGB(0, 0, 0)
box.BorderSizePixel = 0
box.Size = UDim2.new(1, 0, 1, 0)
box.Image = "http://www.roblox.com/asset/?id=16946608585"
box.ImageTransparency = 1

RunService.RenderStepped:Connect(function()
    for i, v in pairs(Players:GetChildren()) do
        local sigma = Players.LocalPlayer
        if not v.Character.Head:FindFirstChild("esp") then
            if v ~= game.Players.LocalPlayer then
                local nameClone = esp:Clone()
                local espClone = mainesp:Clone()
                nameClone.Parent = v.Character:FindFirstChild("Head")
                nameClone:FindFirstChild("name").Text = nameClone.Parent.Parent.Name
                espClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            end
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    local sigma = Players.LocalPlayer
    if not player.Character.Head:FindFirstChild("esp") then
        if player ~= game.Players.LocalPlayer then
            local nameClone = esp:Clone()
            local espClone = mainesp:Clone()
            nameClone.Parent = player.Character:FindFirstChild("Head")
            nameClone:FindFirstChild("name").Text = nameClone.Parent.Parent.Name
            wait(1)
            espClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
        end
    end
end)

RunService.RenderStepped:Connect(function()
    for i, v in pairs(Players:GetChildren()) do
        local me = Players.LocalPlayer
        if _G.TeamCheckOn == true then
            if v.Team == me.Team then
                if v.Character.Head:FindFirstChild("esp") then
                    v.Character.Head:FindFirstChild("esp"):Destroy()
                    v.Character.HumanoidRootPart:FindFirstChild("mainesp"):Destroy()
                end
            end
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    local me = Players.LocalPlayer
    if player ~= me then
        if _G.TeamCheckOn == true then
            if player.Team == me.Team then
                if player.Character.Head:FindFirstChild("esp") then
                    player.Character.Head:FindFirstChild("esp"):Destroy()
                    player.Character.HumanoidRootPart:FindFirstChild("mainesp"):Destroy()
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    for i, v in pairs(Players:GetChildren()) do
        if _G.EspEnabled then
            if v.Character.Head:FindFirstChild("esp") then
                if v.Character.HumanoidRootPart:FindFirstChild("mainesp") then
                    v.Character.Head:FindFirstChild("esp").name.TextTransparency = 0
                    v.Character.HumanoidRootPart:FindFirstChild("mainesp").box.ImageTransparency = 0.43
                end
            end
        else
            if v.Character.Head:FindFirstChild("esp") then
                if v.Character.HumanoidRootPart:FindFirstChild("mainesp") then
                    v.Character.Head:FindFirstChild("esp").name.TextTransparency = 1
                    v.Character.HumanoidRootPart:FindFirstChild("mainesp").box.ImageTransparency = 1
                end
            end
        end
    end
end)

local Holding = false

local FovCircle = Drawing.new("Circle")
FovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FovCircle.Radius = _G.sizeof
FovCircle.Color = _G.CircleColor
FovCircle.Visible = _G.CircleVisible
FovCircle.NumSides = _G.CircleSides
FovCircle.Filled = false
FovCircle.Transparency = _G.fovTransparency
FovCircle.Thickness = 0

local function GetClosestPlayer()
    local Target = nil
    local MaxDistance = _G.sizeof

    for i, v in next, Players:GetChildren() do
        if v.Name ~= LocalPlayer.Name then
            if _G.TeamCheckOn == true then
                if v.Team ~= LocalPlayer.Team then
                    if v.Character ~= nil then
                        if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                            if v.Character:FindFirstChild("Humanoid") ~= nil then
                                if v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                    local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                    local VectorDistance = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

                                    if VectorDistance < MaxDistance then
                                        Target = v
                                    end
                                end
                            end
                        end
                    end
                end
            else
                if v.Character ~= nil then
                    if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                        if v.Character:FindFirstChild("Humanoid") ~= nil then
                            if v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                local VectorDistance = (Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

                                if VectorDistance < MaxDistance then
                                    Target = v
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return Target
end

uis.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

uis.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function ()
    FovCircle.Position = Vector2.new(uis:GetMouseLocation().X, uis:GetMouseLocation().Y)
    FovCircle.Radius = _G.sizeof
    FovCircle.Color = _G.CircleColor
    FovCircle.Visible = _G.CircleVisible
    FovCircle.NumSides = _G.CircleSides
    FovCircle.Filled = false
    FovCircle.Transparency = _G.fovTransparency
    FovCircle.Thickness = 0

    if Holding == true and AimOn == true then
        ts:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.Aimpart].Position)}):Play()
    end
end)
