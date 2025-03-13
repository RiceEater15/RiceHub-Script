wait(0.5)
local RiceAFK = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Container = Instance.new("Frame")
local Status = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")

RiceAFK.Name = "RiceAFK"
RiceAFK.Parent = game.CoreGui
RiceAFK.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = RiceAFK
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.7, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 370, 0, 52)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "RiceHub - Anti AFK"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22

Container.Name = "Container"
Container.Parent = MainFrame
Container.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Container.BorderSizePixel = 0
Container.Position = UDim2.new(0, 0, 1, 0)
Container.Size = UDim2.new(0, 370, 0, 107)

Status.Name = "Status"
Status.Parent = Container
Status.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Status.BorderSizePixel = 0
Status.Position = UDim2.new(0, 0, 0.158, 0)
Status.Size = UDim2.new(0, 370, 0, 44)
Status.Font = Enum.Font.GothamSemibold
Status.Text = "Status: Active"
Status.TextColor3 = Color3.fromRGB(0, 255, 128)
Status.TextSize = 20

Credit.Name = "Credit"
Credit.Parent = Container
Credit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Credit.BorderSizePixel = 0
Credit.Position = UDim2.new(0, 0, 0.8, 0)
Credit.Size = UDim2.new(0, 370, 0, 21)
Credit.Font = Enum.Font.Gotham
Credit.Text = "RiceHub v1.2"
Credit.TextColor3 = Color3.fromRGB(0, 255, 128)
Credit.TextSize = 16

local VU = game:GetService("VirtualUser")
local Player = game:GetService("Players").LocalPlayer

Player.Idled:Connect(function()
    VU:CaptureController()
    VU:ClickButton2(Vector2.new())
    Status.Text = "Prevented AFK Kick!"
    wait(2)
    Status.Text = "Status: Active"
end)
