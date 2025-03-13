local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Ricehub Universal Scripts",
   Icon = 0, 
   LoadingTitle = "RiceHub Universal",
   LoadingSubtitle = "by RiceHub Team",

   Theme = "Default", 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true, 
      Invite = "xGHaPN5ssP",
      RememberJoins = false 
   },
   KeySystem = true, 
   KeySettings = {
      Title = "RiceHub Universal Scripts | Key System",
      Subtitle = "Key System",
      Note = "Discord Server", 
      FileName = "Key", 
      SaveKey = false,
      GrabKeyFromSite = false, 
      Key = {"MildIsSoHot"} 
   }
})

local MM2Tab = Window:CreateTab("MM2", nil)
local ESPSection = MM2Tab:CreateSection("ESP Features")

local localplayer = game:GetService("Players").LocalPlayer
local players = game:GetService("Players")
local phs = game:GetService("PathfindingService")
local ts = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local playerData = {}
local claimedCoins = {}
local espContainer = Instance.new("Folder")
espContainer.Name = "RiceHubESP"
espContainer.Parent = game.CoreGui

local espEnabled = false
local onTesting = game.GameId == 119460199

local function isGameMM2()
    if game.ReplicatedStorage:FindFirstChild("Remotes") and 
       game.ReplicatedStorage.Remotes:FindFirstChild("Gameplay") and 
       game.ReplicatedStorage.Remotes.Gameplay:FindFirstChild("PlayerDataChanged") then
        return true
    end
    return false
end

_G.RICEHUB = {
    FUNCTIONS = {
        dialog = function(title, content, options)
            return Rayfield:CreateDialog({
                Name = title,
                Content = content,
                Actions = {
                    for i, option in pairs(options) do
                        Rayfield:DialogAction({
                            Name = option,
                            Callback = function()
                                _G.DialogResult = option
                            end,
                        })
                    end
                }
            })
        end,
        waitfordialog = function()
            repeat task.wait() until _G.DialogResult
            local result = _G.DialogResult
            _G.DialogResult = nil
            return result
        end,
        closedialog = function()
            Rayfield:CloseDialog()
        end,
        notification = function(content, color, icon)
            color = color or Color3.fromRGB(255, 255, 255)
            icon = icon or "🔔"
            Rayfield:Notify({
                Title = "RiceHub",
                Content = content,
                Duration = 3,
                Image = nil,
            })
        end
    }
}

local fu = _G.RICEHUB.FUNCTIONS

if not isGameMM2() then
    fu.dialog("Not MM2", "Looks like this game isn't MM2. Do you want to load the module anyway?", {"Load", "No"})

    if fu.waitfordialog() == "No" then
        fu.closedialog()
        fu.notification("MM2 will not be loaded until you rejoin.", Color3.fromRGB(255, 0, 0), "x")
        return
    end
    fu.closedialog()
else
    game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay"):WaitForChild("PlayerDataChanged", 5).OnClientEvent:Connect(function(data)
        playerData = data
        if espEnabled then
            updateESP()
        end
    end)
end

local function findMurderer()
    for _, i in ipairs(players:GetPlayers()) do
        if i.Backpack:FindFirstChild("Knife") then
            return i
        end
    end
    for _, i in ipairs(players:GetPlayers()) do
        if not i.Character then continue end
        if i.Character:FindFirstChild("Knife") then
            return i
        end
    end
    if playerData then
        for player, data in pairs(playerData) do
            if data.Role == "Murderer" then
                if players:FindFirstChild(player) then
                    return players:FindFirstChild(player)
                end
            end
        end
    end
    return nil
end

local function findSheriff()
    for _, i in ipairs(players:GetPlayers()) do
        if i.Backpack:FindFirstChild("Gun") then
            return i
        end
    end
    for _, i in ipairs(players:GetPlayers()) do
        if not i.Character then continue end
        if i.Character:FindFirstChild("Gun") then
            return i
        end
    end
    if playerData then
        for player, data in pairs(playerData) do
            if data.Role == "Sheriff" then
                if players:FindFirstChild(player) then
                    return players:FindFirstChild(player)
                end
            end
        end
    end
    return nil
end

local function findSheriffThatsNotMe()
    for _, i in ipairs(players:GetPlayers()) do
        if i == localplayer then continue end
        if i.Backpack:FindFirstChild("Gun") then
            return i
        end
    end
    for _, i in ipairs(players:GetPlayers()) do
        if i == localplayer then continue end
        if not i.Character then continue end
        if i.Character:FindFirstChild("Gun") then
            return i
        end
    end
    if playerData then
        for player, data in pairs(playerData) do
            if data.Role == "Sheriff" then
                if players:FindFirstChild(player) then
                    if players:FindFirstChild(player) == localplayer then continue end
                    return players:FindFirstChild(player)
                end
            end
        end
    end
    return nil
end

local function findNearestPlayer()
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer

    local nearestPlayer = nil
    local shortestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local localRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            local otherRootPart = player.Character:FindFirstChild("HumanoidRootPart")

            if localRootPart and otherRootPart then
                local distance = (localRootPart.Position - otherRootPart.Position).Magnitude

                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestPlayer = player
                end
            end
        end
    end

    return nearestPlayer
end

function miniFling(playerToFling)
    local a=game.Players.LocalPlayer;local b=a:GetMouse()local c={playerToFling}local d=game:GetService("Players")local e=d.LocalPlayer;local f=false;local g=function(h)local i=e.Character;local j=i and i:FindFirstChildOfClass("Humanoid")local k=j and j.RootPart;local l=h.Character;local m;local n;local o;local p;local q;if l:FindFirstChildOfClass("Humanoid")then m=l:FindFirstChildOfClass("Humanoid")end;if m and m.RootPart then n=m.RootPart end;if l:FindFirstChild("Head")then o=l.Head end;if l:FindFirstChildOfClass("Accessory")then p=l:FindFirstChildOfClass("Accessory")end;if p and p:FindFirstChild("Handle")then q=p.Handle end;if i and j and k then if k.Velocity.Magnitude<50 then getgenv().OldPos=k.CFrame end;if m and m.Sit and not f then end;if o then if o.Velocity.Magnitude>500 then fu.dialog("Player flung","Player is already flung. Fling again?",{"Fling again","No"})if fu.waitfordialog()=="No"then return fu.closedialog()end;fu.closedialog()end elseif not o and q then if q.Velocity.Magnitude>500 then fu.dialog("Player flung","Player is already flung. Fling again?",{"Fling again","No"})if fu.waitfordialog()=="No"then return fu.closedialog()end;fu.closedialog()end end;if o then workspace.CurrentCamera.CameraSubject=o elseif not o and q then workspace.CurrentCamera.CameraSubject=q elseif m and n then workspace.CurrentCamera.CameraSubject=m end;if not l:FindFirstChildWhichIsA("BasePart")then return end;local r=function(s,t,u)k.CFrame=CFrame.new(s.Position)*t*u;i:SetPrimaryPartCFrame(CFrame.new(s.Position)*t*u)k.Velocity=Vector3.new(9e7,9e7*10,9e7)k.RotVelocity=Vector3.new(9e8,9e8,9e8)end;local v=function(s)local w=2;local x=tick()local y=0;repeat if k and m then if s.Velocity.Magnitude<50 then y=y+100;r(s,CFrame.new(0,1.5,0)+m.MoveDirection*s.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(0,-1.5,0)+m.MoveDirection*s.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(2.25,1.5,-2.25)+m.MoveDirection*s.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(-2.25,-1.5,2.25)+m.MoveDirection*s.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(0,1.5,0)+m.MoveDirection,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(0,-1.5,0)+m.MoveDirection,CFrame.Angles(math.rad(y),0,0))task.wait()else r(s,CFrame.new(0,1.5,m.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,-1.5,-m.WalkSpeed),CFrame.Angles(0,0,0))task.wait()r(s,CFrame.new(0,1.5,m.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,1.5,n.Velocity.Magnitude/1.25),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,-1.5,-n.Velocity.Magnitude/1.25),CFrame.Angles(0,0,0))task.wait()r(s,CFrame.new(0,1.5,n.Velocity.Magnitude/1.25),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))task.wait()r(s,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-90),0,0))task.wait()r(s,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))task.wait()end else break end until s.Velocity.Magnitude>500 or s.Parent~=h.Character or h.Parent~=d or h.Character~=l or m.Sit or j.Health<=0 or tick()>x+w end;workspace.FallenPartsDestroyHeight=0/0;local z=Instance.new("BodyVelocity")z.Name="EpixVel"z.Parent=k;z.Velocity=Vector3.new(9e8,9e8,9e8)z.MaxForce=Vector3.new(1/0,1/0,1/0)j:SetStateEnabled(Enum.HumanoidStateType.Seated,false)if n and o then if(n.CFrame.p-o.CFrame.p).Magnitude>5 then v(o)else v(n)end elseif n and not o then v(n)elseif not n and o then v(o)elseif not n and not o and p and q then v(q)else fu.notification("Can't find a proper part of target player to fling.")end;z:Destroy()j:SetStateEnabled(Enum.HumanoidStateType.Seated,true)workspace.CurrentCamera.CameraSubject=j;repeat k.CFrame=getgenv().OldPos*CFrame.new(0,.5,0)i:SetPrimaryPartCFrame(getgenv().OldPos*CFrame.new(0,.5,0))j:ChangeState("GettingUp")table.foreach(i:GetChildren(),function(A,B)if B:IsA("BasePart")then B.Velocity,B.RotVelocity=Vector3.new(),Vector3.new()end end)task.wait()until(k.Position-getgenv().OldPos.p).Magnitude<25;workspace.FallenPartsDestroyHeight=getgenv().FPDH else fu.notification("No valid character of said target player. May have died.")end end;g(c[1])
end

function clearESP()
    for _, v in ipairs(espContainer:GetChildren()) do
        if v.Name == "PlayerESP" then 
            v:Destroy() 
        end
    end
end

function updateESP()
    if not espEnabled then return end
    
    clearESP()
    
    for _, player in ipairs(players:GetPlayers()) do
        if player ~= localplayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local character = player.Character
            local highlight = Instance.new("Highlight")
            highlight.Name = "PlayerESP"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Adornee = character
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            
            if player == findMurderer() then
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            elseif player == findSheriff() then
                highlight.FillColor = Color3.fromRGB(0, 150, 255)
                highlight.OutlineColor = Color3.fromRGB(0, 150, 255)
            else
                highlight.FillColor = Color3.fromRGB(0, 255, 0)
                highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
            end
            
            highlight.Parent = espContainer
        end
    end
end

local ESPToggle = MM2Tab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "ESP_Enabled",
    Callback = function(Value)
        espEnabled = Value
        if Value then
            updateESP()
            espConnection = RunService.RenderStepped:Connect(updateESP)
        else
            if espConnection then
                espConnection:Disconnect()
            end
            clearESP()
        end
    end,
})

local GunESPToggle = MM2Tab:CreateToggle({
    Name = "Gun ESP",
    CurrentValue = false,
    Flag = "GunESP_Enabled",
    Callback = function(Value)
        gunEspEnabled = Value
        if Value then
            gunEspConnection = RunService.RenderStepped:Connect(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "GunDrop" then
                        if not v:FindFirstChild("GunESP") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "GunESP"
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            highlight.Adornee = v
                            highlight.FillColor = Color3.fromRGB(255, 255, 0)
                            highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
                            highlight.FillTransparency = 0.5
                            highlight.OutlineTransparency = 0
                            highlight.Parent = espContainer
                        end
                    end
                end
            end)
        else
            if gunEspConnection then
                gunEspConnection:Disconnect()
            end
            for _, v in pairs(espContainer:GetChildren()) do
                if v.Name == "GunESP" then
                    v:Destroy()
                end
            end
        end
    end,
})

local CoinESPToggle = MM2Tab:CreateToggle({
    Name = "Coin ESP",
    CurrentValue = false,
    Flag = "CoinESP_Enabled",
    Callback = function(Value)
        coinEspEnabled = Value
        if Value then
            coinEspConnection = RunService.RenderStepped:Connect(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Coin_Server" then
                        if not v:FindFirstChild("CoinESP") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "CoinESP"
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            highlight.Adornee = v
                            highlight.FillColor = Color3.fromRGB(255, 215, 0)
                            highlight.OutlineColor = Color3.fromRGB(255, 215, 0)
                            highlight.FillTransparency = 0.5
                            highlight.OutlineTransparency = 0
                            highlight.Parent = espContainer
                        end
                    end
                end
            end)
        else
            if coinEspConnection then
                coinEspConnection:Disconnect()
            end
            for _, v in pairs(espContainer:GetChildren()) do
                if v.Name == "CoinESP" then
                    v:Destroy()
                end
            end
        end
    end,
})

local AutoCoinToggle = MM2Tab:CreateToggle({
    Name = "Auto Collect Coins",
    CurrentValue = false,
    Flag = "AutoCoin_Enabled",
    Callback = function(Value)
        autoCollectCoins = Value
        if Value then
            coinCollectConnection = RunService.Heartbeat:Connect(function()
                if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v.Name == "Coin_Server" and not table.find(claimedCoins, v) then
                            table.insert(claimedCoins, v)
                            
                            local humanoidRootPart = localplayer.Character:FindFirstChild("HumanoidRootPart")
                            local coinPosition = v:FindFirstChild("Position") and v:FindFirstChild("Position").Value or v.Position
                            
                            local distance = (humanoidRootPart.Position - coinPosition).Magnitude
                            
                            if distance <= 20 then
                                firetouchinterest(humanoidRootPart, v, 0)
                                wait()
                                firetouchinterest(humanoidRootPart, v, 1)
                            end
                        end
                    end
                end
            end)
        else
            if coinCollectConnection then
                coinCollectConnection:Disconnect()
            end
            claimedCoins = {}
        end
    end,
})

local MiscSection = MM2Tab:CreateSection("Misc Features")

local SpeedSlider = MM2Tab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed_Value",
    Callback = function(Value)
        if localplayer.Character and localplayer.Character:FindFirstChild("Humanoid") then
            localplayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

local JumpSlider = MM2Tab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 200},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpPower_Value",
    Callback = function(Value)
        if localplayer.Character and localplayer.Character:FindFirstChild("Humanoid") then
            localplayer.Character.Humanoid.JumpPower = Value
        end
    end,
})

local GrabGunButton = MM2Tab:CreateButton({
    Name = "Grab Gun",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "GunDrop" then
                if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
                    local oldPosition = localplayer.Character.HumanoidRootPart.CFrame
                    localplayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    wait(0.5)
                    localplayer.Character.HumanoidRootPart.CFrame = oldPosition
                end
                break
            end
        end
    end,
})

local KillAllButton = MM2Tab:CreateButton({
    Name = "Kill All (Murderer Only)",
    Callback = function()
        if localplayer.Backpack:FindFirstChild("Knife") or (localplayer.Character and localplayer.Character:FindFirstChild("Knife")) then
            local knife = localplayer.Backpack:FindFirstChild("Knife") or localplayer.Character:FindFirstChild("Knife")
            
            for _, player in ipairs(players:GetPlayers()) do
                if player ~= localplayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local oldPosition = localplayer.Character.HumanoidRootPart.CFrame
                    localplayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                    
                    if knife.Parent == localplayer.Backpack then
                        localplayer.Character.Humanoid:EquipTool(knife)
                    end
                    
                    knife:Activate()
                    wait(0.2)
                    
                    localplayer.Character.HumanoidRootPart.CFrame = oldPosition
                end
            end
        else
            Rayfield:Notify({
                Title = "Not Murderer",
                Content = "You need to be the murderer to use this",
                Duration = 3,
            })
        end
    end,
})

local FlingSection = MM2Tab:CreateSection("Fling Features")

local FlingNearestButton = MM2Tab:CreateButton({
    Name = "Fling Nearest Player",
    Callback = function()
        local nearestPlayer = findNearestPlayer()
        if nearestPlayer then
            miniFling(nearestPlayer)
        else
            fu.notification("No players found nearby")
        end
    end,
})

local FlingMurdererButton = MM2Tab:CreateButton({
    Name = "Fling Murderer",
    Callback = function()
        local murderer = findMurderer()
        if murderer then
            miniFling(murderer)
        else
            fu.notification("Couldn't find murderer")
        end
    end,
})

local FlingSheriffButton = MM2Tab:CreateButton({
    Name = "Fling Sheriff",
    Callback = function()
        local sheriff = findSheriff()
        if sheriff then
            miniFling(sheriff)
        else
            fu.notification("Couldn't find sheriff")
        end
    end,
})

local TeleportSection = MM2Tab:CreateSection("Teleport Options")

local TeleportToMurderer = MM2Tab:CreateButton({
    Name = "Teleport to Murderer",
    Callback = function()
        local murderer = findMurderer()
        if murderer and murderer.Character and murderer.Character:FindFirstChild("HumanoidRootPart") and localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
            localplayer.Character.HumanoidRootPart.CFrame = murderer.Character.HumanoidRootPart.CFrame
        else
            Rayfield:Notify({
                Title = "Teleport Failed",
                Content = "Couldn't find murderer or they have no character",
                Duration = 3,
            })
        end
    end,
})

local TeleportToSheriff = MM2Tab:CreateButton({
    Name = "Teleport to Sheriff",
    Callback = function()
        local sheriff = findSheriff()
        if sheriff and sheriff.Character and sheriff.Character:FindFirstChild("HumanoidRootPart") and localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
            localplayer.Character.HumanoidRootPart.CFrame = sheriff.Character.HumanoidRootPart.CFrame
        else
            Rayfield:Notify({
                Title = "Teleport Failed",
                Content = "Couldn't find sheriff or they have no character",
                Duration = 3,
            })
        end
    end,
})

local TeleportToGun = MM2Tab:CreateButton({
    Name = "Teleport to Gun",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "GunDrop" then
                if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
                    localplayer.Character.HumanoidRootPart.CFrame = v.CFrame
                end
                break
            end
        end
    end,
})

-- Additional code from paste-2.txt
_G.YARHM = Instance.new("Folder", game:GetService("CoreGui"))
_G.YARHM.Name = "YARHM_ESP"

local playerESP = false
local gunDropESP = false
local trapESP = Instance.new("Highlight")
trapESP.Name = "TrapESP"
trapESP.FillColor = Color3.fromRGB(255, 0, 255)
trapESP.OutlineColor = Color3.fromRGB(255, 0, 255)
trapESP.FillTransparency = 0.5
trapESP.OutlineTransparency = 0
trapESP.Enabled = true
trapESP.Parent = espContainer

local trapDetection = false
local autoGetDroppedGun = false

local AdvancedESPSection = MM2Tab:CreateSection("Advanced ESP Features")

local function getMap()
    for _, v in ipairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Lobby") == nil and v:FindFirstChild("Map") then
            return v
        end
    end
    return nil
end

local PlayerESPToggle = MM2Tab:CreateToggle({
    Name = "Advanced Player ESP",
    CurrentValue = false,
    Flag = "AdvancedESP_Enabled",
    Callback = function(Value)
        playerESP = Value
        if Value then
            fu.notification("Advanced Player ESP Enabled")
            
            workspace.ChildAdded:Connect(function(ch)
                if ch == getMap() and playerESP then
                    fu.notification("Map has loaded, waiting for roles...")
                    repeat
                        task.wait(1)
                    until findMurderer()
                    
                    fu.notification("Player ESP reloaded.")
                end
            end)
            
            workspace.ChildRemoved:Connect(function(ch)
                if ch == getMap() and playerESP then
                    fu.notification("Game ended, removing Player ESPs.")
                    playerData = {}
                    if _G.YARHM:FindFirstChild("AppliedMurdererBGUI") then _G.YARHM:FindFirstChild("AppliedMurdererBGUI"):Destroy() end
                    if _G.YARHM:FindFirstChild("DGBGUIClone") then _G.YARHM:FindFirstChild("DGBGUIClone"):Destroy() end
                    for _, v in ipairs(espContainer:GetChildren()) do if v.Name == "PlayerESP" then v:Destroy() end end
                end
            end)
        else
            fu.notification("Advanced Player ESP Disabled")
        end
    end,
})

local MurdererBGUI = Instance.new("BillboardGui")
MurdererBGUI.Name = "MurdererBGUI"
MurdererBGUI.Size = UDim2.new(0, 100, 0, 50)
MurdererBGUI.StudsOffset = Vector3.new(0, 3, 0)
MurdererBGUI.AlwaysOnTop = true
MurdererBGUI.Enabled = false
MurdererBGUI.Parent = espContainer

local MurdererLabel = Instance.new("TextLabel")
MurdererLabel.Name = "Label"
MurdererLabel.Size = UDim2.new(1, 0, 1, 0)
MurdererLabel.BackgroundTransparency = 1
MurdererLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
MurdererLabel.Text = "MURDERER"
MurdererLabel.TextSize = 18
MurdererLabel.Font = Enum.Font.SourceSansBold
MurdererLabel.Parent = MurdererBGUI
local DroppedGunBGUI = Instance.new("BillboardGui")
DroppedGunBGUI.Name = "DroppedGunBGUI"
DroppedGunBGUI.Size = UDim2.new(0, 100, 0, 50)
DroppedGunBGUI.StudsOffset = Vector3.new(0, 1, 0)
DroppedGunBGUI.AlwaysOnTop = true
DroppedGunBGUI.Enabled = false
DroppedGunBGUI.Parent = espContainer
local DroppedGunLabel = Instance.new("TextLabel")
DroppedGunLabel.Name = "Label"
DroppedGunLabel.Size = UDim2.new(1, 0, 1, 0)
DroppedGunLabel.BackgroundTransparency = 1
DroppedGunLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
DroppedGunLabel.Text = "DROPPED GUN"
DroppedGunLabel.TextSize = 18
DroppedGunLabel.Font = Enum.Font.SourceSansBold
local DroppedGunLabel = Instance.new("TextLabel")
DroppedGunLabel.Name = "Label"
DroppedGunLabel.Size = UDim2.new(1, 0, 1, 0)
DroppedGunLabel.BackgroundTransparency = 1
DroppedGunLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
DroppedGunLabel.Text = "DROPPED GUN"
DroppedGunLabel.TextSize = 18
DroppedGunLabel.Font = Enum.Font.SourceSansBold
DroppedGunLabel.Parent = DroppedGunBGUI
local DropGunESPToggle = MM2Tab:CreateToggle({
    Name = "Dropped Gun ESP",
    CurrentValue = false,
    Flag = "DroppedGunESP_Enabled",
    Callback = function(Value)
        gunDropESP = Value
        if Value then
            fu.notification("Dropped Gun ESP Enabled")
            
            workspace.ChildAdded:Connect(function(ch)
                if ch.Name == "GunDrop" and gunDropESP then
                    local DGBGUIClone = DroppedGunBGUI:Clone()
                    DGBGUIClone.Name = "DGBGUIClone"
                    DGBGUIClone.Adornee = ch
                    DGBGUIClone.Enabled = true
                    DGBGUIClone.Parent = _G.YARHM
                    
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "GunESP"
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Adornee = ch
                    highlight.FillColor = Color3.fromRGB(0, 150, 255)
                    highlight.OutlineColor = Color3.fromRGB(0, 150, 255)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    highlight.Parent = espContainer
                end
            end)
            
            workspace.ChildRemoved:Connect(function(ch)
                if ch.Name == "GunDrop" and gunDropESP then
                    if _G.YARHM:FindFirstChild("DGBGUIClone") then
                        _G.YARHM:FindFirstChild("DGBGUIClone"):Destroy()
                    end
                    for _, v in ipairs(espContainer:GetChildren()) do
                        if v.Name == "GunESP" then
                            v:Destroy()
                        end
                    end
                end
            end)
        else
            fu.notification("Dropped Gun ESP Disabled")
            if _G.YARHM:FindFirstChild("DGBGUIClone") then
                _G.YARHM:FindFirstChild("DGBGUIClone"):Destroy()
            end
            for _, v in ipairs(espContainer:GetChildren()) do
                if v.Name == "GunESP" then
                    v:Destroy()
                end
            end
        end
    end,
})
local TrapESPToggle = MM2Tab:CreateToggle({
    Name = "Trap ESP",
    CurrentValue = false,
    Flag = "TrapESP_Enabled",
    Callback = function(Value)
        trapDetection = Value
        if Value then
            fu.notification("Trap ESP Enabled")
            
            trapESPConnection = RunService.RenderStepped:Connect(function()
                if trapDetection then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v.Name == "Trap" and v:IsA("BasePart") then
                            if not v:FindFirstChild("TrapESP") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "TrapESP"
                                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                highlight.Adornee = v
                                highlight.FillColor = Color3.fromRGB(255, 0, 255)
                                highlight.OutlineColor = Color3.fromRGB(255, 0, 255)
                                highlight.FillTransparency = 0.5
                                highlight.OutlineTransparency = 0
                                highlight.Parent = espContainer
                            end
                        end
                    end
                end
            end)
        else
            fu.notification("Trap ESP Disabled")
            if trapESPConnection then
                trapESPConnection:Disconnect()
            end
            for _, v in ipairs(espContainer:GetChildren()) do
                if v.Name == "TrapESP" then
                    v:Destroy()
                end
            end
        end
    end,
})
local AutoGrabToggle = MM2Tab:CreateToggle({
    Name = "Auto Grab Gun",
    CurrentValue = false,
    Flag = "AutoGrab_Enabled",
    Callback = function(Value)
        autoGetDroppedGun = Value
        if Value then
            fu.notification("Auto Grab Gun Enabled")
            
            gunDropConnection = workspace.ChildAdded:Connect(function(ch)
                if ch.Name == "GunDrop" and autoGetDroppedGun then
                    if localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
                        local oldPosition = localplayer.Character.HumanoidRootPart.CFrame
                        localplayer.Character.HumanoidRootPart.CFrame = ch.CFrame
                        wait(0.5)
                        localplayer.Character.HumanoidRootPart.CFrame = oldPosition
                    end
                end
            end)
        else
            fu.notification("Auto Grab Gun Disabled")
            if gunDropConnection then
                gunDropConnection:Disconnect()
            end
        end
    end,
})
local RoleSimSection = MM2Tab:CreateSection("Role Simulation")
local isSheriff = MM2Tab:CreateToggle({
    Name = "Fake Sheriff",
    CurrentValue = false,
    Flag = "FakeSheriff_Enabled",
    Callback = function(Value)
        if Value then
            if localplayer.Character and localplayer.Character:FindFirstChild("Knife") then
                fu.notification("Cannot be sheriff while being murderer", Color3.fromRGB(255, 0, 0))
                return
            end
            
            local gun = Instance.new("Tool")
            gun.Name = "Gun"
            gun.TextureId = "rbxassetid://11554626152"
            gun.ToolTip = "Sheriff's Gun"
            
            local handle = Instance.new("Part")
            handle.Name = "Handle"
            handle.Size = Vector3.new(0.2, 1, 0.2)
            handle.Transparency = 1
            handle.Parent = gun
            
            local gunModel = Instance.new("Model")
            gunModel.Name = "GunModel"
            gunModel.Parent = gun
            
            local pistol = Instance.new("Part")
            pistol.Name = "Pistol"
            pistol.Size = Vector3.new(0.25, 1, 2)
            pistol.CFrame = handle.CFrame * CFrame.new(0, 0, -1)
            pistol.BrickColor = BrickColor.new("Navy blue")
            pistol.Material = Enum.Material.Metal
            pistol.CanCollide = false
            pistol.Parent = gunModel
            
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = handle
            weld.Part1 = pistol
            weld.Parent = handle
            
            gun.Parent = localplayer.Backpack
            
            fu.notification("Fake sheriff enabled - gun added to backpack", Color3.fromRGB(0, 150, 255))
        else
            if localplayer.Backpack:FindFirstChild("Gun") then
                localplayer.Backpack:FindFirstChild("Gun"):Destroy()
            end
            if localplayer.Character and localplayer.Character:FindFirstChild("Gun") then
                localplayer.Character:FindFirstChild("Gun"):Destroy()
            end
            fu.notification("Fake sheriff disabled", Color3.fromRGB(0, 150, 255))
        end
    end,
})
local isMurderer = MM2Tab:CreateToggle({
    Name = "Fake Murderer",
    CurrentValue = false,
    Flag = "FakeMurderer_Enabled",
    Callback = function(Value)
        if Value then
            if localplayer.Character and localplayer.Character:FindFirstChild("Gun") then
                fu.notification("Cannot be murderer while being sheriff", Color3.fromRGB(255, 0, 0))
                return
            end
            
            local knife = Instance.new("Tool")
            knife.Name = "Knife"
            knife.TextureId = "rbxassetid://11554654141"
            knife.ToolTip = "Murderer's Knife"
            
            local handle = Instance.new("Part")
            handle.Name = "Handle"
            handle.Size = Vector3.new(0.2, 1, 0.2)
            handle.Transparency = 1
            handle.Parent = knife
            
            local knifeModel = Instance.new("Model")
            knifeModel.Name = "KnifeModel"
            knifeModel.Parent = knife
            
            local blade = Instance.new("Part")
            blade.Name = "Blade"
            blade.Size = Vector3.new(0.1, 1.5, 0.5)
            blade.CFrame = handle.CFrame * CFrame.new(0, 0.5, 0)
            blade.BrickColor = BrickColor.new("Bright red")
            blade.Material = Enum.Material.Metal
            blade.CanCollide = false
            blade.Parent = knifeModel
            
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = handle
            weld.Part1 = blade
            weld.Parent = handle
            
            knife.Parent = localplayer.Backpack
            
            fu.notification("Fake murderer enabled - knife added to backpack", Color3.fromRGB(255, 0, 0))
        else
            if localplayer.Backpack:FindFirstChild("Knife") then
                localplayer.Backpack:FindFirstChild("Knife"):Destroy()
            end
            if localplayer.Character and localplayer.Character:FindFirstChild("Knife") then
                localplayer.Character:FindFirstChild("Knife"):Destroy()
            end
            fu.notification("Fake murderer disabled", Color3.fromRGB(255, 0, 0))
        end
    end,
})
local GlitchSection = MM2Tab:CreateSection("Glitches & Map Exploits")
local NoClipToggle = MM2Tab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "NoClip_Enabled",
    Callback = function(Value)
        if Value then
            fu.notification("NoClip Enabled")
            
            noclipConnection = RunService.Stepped:Connect(function()
                if localplayer.Character then
                    for _, part in pairs(localplayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            fu.notification("NoClip Disabled")
            if noclipConnection then
                noclipConnection:Disconnect()
            end
            if localplayer.Character then
                for _, part in pairs(localplayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.CanCollide = true
                    end
                end
            end
        end
    end,
})
local MapVotingSection = MM2Tab:CreateSection("Map Voting")
local VoteForCurrentMapButton = MM2Tab:CreateButton({
    Name = "Vote For Current Map",
    Callback = function()
        local voting = workspace:FindFirstChild("MapVoting")
        if voting then
            local maps = voting:FindFirstChild("Maps")
            if maps then
                for _, map in pairs(maps:GetChildren()) do
                    if map:FindFirstChild("VoteButton") then
                        firetouchinterest(localplayer.Character.HumanoidRootPart, map.VoteButton, 0)
                        wait()
                        firetouchinterest(localplayer.Character.HumanoidRootPart, map.VoteButton, 1)
                        fu.notification("Voted for " .. map.Name)
                        break
                    end
                end
            else
                fu.notification("No maps found to vote for")
            end
        else
            fu.notification("Map voting is not active")
        end
    end,
})
local ServerHopSection = MM2Tab:CreateSection("Server")
local ServerHopButton = MM2Tab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local PlaceId = game.PlaceId
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local HttpService = game:GetService("HttpService")
        
        local function ServerHop()
            local function GetServers()
                local Servers = {}
                local CurrentCursor = ""
                repeat
                    local Response = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" .. (CurrentCursor ~= "" and "&cursor=" .. CurrentCursor or "")))
                    for _, Server in ipairs(Response.data) do
                        if Server.playing < Server.maxPlayers then
                            table.insert(Servers, Server)
                        end
                    end
                    CurrentCursor = Response.nextPageCursor
                until not CurrentCursor
                return Servers
            end
            
            local Servers = GetServers()
            if #Servers > 0 then
                local RandomServer = Servers[math.random(1, #Servers)]
                TeleportService:TeleportToPlaceInstance(PlaceId, RandomServer.id, Players.LocalPlayer)
            else
                fu.notification("No servers found")
            end
        end
        
        ServerHop()
    end,
})
local InfoTab = Window:CreateTab("Info", nil)
local InfoSection = InfoTab:CreateSection("Script Information")
InfoTab:CreateParagraph({
    Title = "RiceHub MM2 Universal",
    Content = "Created by RiceHub Team\nVersion: 1.0.0\nLast Updated: March 2025\n\nJoin our Discord server for updates, bug reports, and more scripts!"
})
InfoTab:CreateButton({
    Name = "Copy Discord Server Invite",
    Callback = function()
        setclipboard("https://discord.gg/xGHaPN5ssP")
        fu.notification("Discord invite copied to clipboard!")
    end,
})
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    if method == "FireServer" or method == "InvokeServer" then
        local callName = tostring(self)
        if callName:find("Security") or callName:find("Ban") or callName:find("Report") then
            return nil
        end
    end
    
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)
if isGameMM2() then
    fu.notification("MM2 Script loaded successfully!", Color3.fromRGB(0, 255, 0), "✓")
else
    fu.notification("Script loaded in compatibility mode", Color3.fromRGB(255, 150, 0), "!")
end
RunService.RenderStepped:Connect(function()
    for i, v in pairs(getconnections(game:GetService("ScriptContext").Error)) do
        v:Disable()
    end
end)
