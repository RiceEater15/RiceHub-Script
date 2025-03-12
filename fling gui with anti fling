local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local rs = game:GetService("RunService")
getgenv().FPDH = workspace.FallenPartsDestroyHeight


local fu = {}
fu.notification = function(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Fling Script",
        Text = text,
        Duration = 3
    })
end

fu.dialog = function(title, message, options)
    local response = "Fling again"
    fu.dialogResponse = response
    fu.notification(title..": "..message)
    return response
end

fu.waitfordialog = function()
    return fu.dialogResponse
end

fu.closedialog = function()

end


function miniFling(playerToFling)
    local a=game.Players.LocalPlayer;local b=a:GetMouse()local c={playerToFling}local d=game:GetService("Players")local e=d.LocalPlayer;local f=false;local g=function(h)local i=e.Character;local j=i and i:FindFirstChildOfClass("Humanoid")local k=j and j.RootPart;local l=h.Character;local m;local n;local o;local p;local q;if l:FindFirstChildOfClass("Humanoid")then m=l:FindFirstChildOfClass("Humanoid")end;if m and m.RootPart then n=m.RootPart end;if l:FindFirstChild("Head")then o=l.Head end;if l:FindFirstChildOfClass("Accessory")then p=l:FindFirstChildOfClass("Accessory")end;if p and p:FindFirstChild("Handle")then q=p.Handle end;if i and j and k then if k.Velocity.Magnitude<50 then getgenv().OldPos=k.CFrame end;if m and m.Sit and not f then end;if o then if o.Velocity.Magnitude>500 then fu.dialog("Player flung","Player is already flung. Fling again?",{"Fling again","No"})if fu.waitfordialog()=="No"then return fu.closedialog()end;fu.closedialog()end elseif not o and q then if q.Velocity.Magnitude>500 then fu.dialog("Player flung","Player is already flung. Fling again?",{"Fling again","No"})if fu.waitfordialog()=="No"then return fu.closedialog()end;fu.closedialog()end end;if o then workspace.CurrentCamera.CameraSubject=o elseif not o and q then workspace.CurrentCamera.CameraSubject=q elseif m and n then workspace.CurrentCamera.CameraSubject=m end;if not l:FindFirstChildWhichIsA("BasePart")then return end;local r=function(s,t,u)k.CFrame=CFrame.new(s.Position)*t*u;i:SetPrimaryPartCFrame(CFrame.new(s.Position)*t*u)k.Velocity=Vector3.new(9e7,9e7*10,9e7)k.RotVelocity=Vector3.new(9e8,9e8,9e8)end;local v=function(s)local w=2;local x=tick()local y=0;repeat if k and m then if s.Velocity.Magnitude<50 then y=y+100;r(s,CFrame.new(0,1.5,0)+m.MoveDirection*s.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(0,-1.5,0)+m.MoveDirection*s.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(2.25,1.5,-2.25)+m.MoveDirection*s.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(-2.25,-1.5,2.25)+m.MoveDirection*s.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(0,1.5,0)+m.MoveDirection,CFrame.Angles(math.rad(y),0,0))task.wait()r(s,CFrame.new(0,-1.5,0)+m.MoveDirection,CFrame.Angles(math.rad(y),0,0))task.wait()else r(s,CFrame.new(0,1.5,m.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,-1.5,-m.WalkSpeed),CFrame.Angles(0,0,0))task.wait()r(s,CFrame.new(0,1.5,m.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,1.5,n.Velocity.Magnitude/1.25),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,-1.5,-n.Velocity.Magnitude/1.25),CFrame.Angles(0,0,0))task.wait()r(s,CFrame.new(0,1.5,n.Velocity.Magnitude/1.25),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(90),0,0))task.wait()r(s,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))task.wait()r(s,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-90),0,0))task.wait()r(s,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))task.wait()end else break end until s.Velocity.Magnitude>500 or s.Parent~=h.Character or h.Parent~=d or h.Character~=l or m.Sit or j.Health<=0 or tick()>x+w end;workspace.FallenPartsDestroyHeight=0/0;local z=Instance.new("BodyVelocity")z.Name="EpixVel"z.Parent=k;z.Velocity=Vector3.new(9e8,9e8,9e8)z.MaxForce=Vector3.new(1/0,1/0,1/0)j:SetStateEnabled(Enum.HumanoidStateType.Seated,false)if n and o then if(n.CFrame.p-o.CFrame.p).Magnitude>5 then v(o)else v(n)end elseif n and not o then v(n)elseif not n and o then v(o)elseif not n and not o and p and q then v(q)else fu.notification("Can't find a proper part of target player to fling.")end;z:Destroy()j:SetStateEnabled(Enum.HumanoidStateType.Seated,true)workspace.CurrentCamera.CameraSubject=j;repeat k.CFrame=getgenv().OldPos*CFrame.new(0,.5,0)i:SetPrimaryPartCFrame(getgenv().OldPos*CFrame.new(0,.5,0))j:ChangeState("GettingUp")table.foreach(i:GetChildren(),function(A,B)if B:IsA("BasePart")then B.Velocity,B.RotVelocity=Vector3.new(),Vector3.new()end end)task.wait()until(k.Position-getgenv().OldPos.p).Magnitude<25;workspace.FallenPartsDestroyHeight=getgenv().FPDH else fu.notification("No valid character of said target player. May have died.")end end;g(c[1])
end


local FlingGui = Instance.new("ScreenGui")
FlingGui.Name = "FlingGui"
FlingGui.ResetOnSpawn = false
FlingGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0, 10, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = FlingGui

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.BorderSizePixel = 0
Title.Text = "MM2 Fling"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16
Title.Parent = MainFrame


local AntiFlingSetting = false
local AntiFlingSwitcher = Instance.new("TextButton")
AntiFlingSwitcher.Name = "AntiFlingSwitcher"
AntiFlingSwitcher.Size = UDim2.new(1, 0, 0, 30)
AntiFlingSwitcher.Position = UDim2.new(0, 0, 1, -30)
AntiFlingSwitcher.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AntiFlingSwitcher.BorderSizePixel = 0
AntiFlingSwitcher.Text = "Anti-Fling: OFF"
AntiFlingSwitcher.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiFlingSwitcher.Font = Enum.Font.SourceSansBold
AntiFlingSwitcher.TextSize = 14
AntiFlingSwitcher.Parent = MainFrame


local PlayerList = Instance.new("ScrollingFrame")
PlayerList.Name = "PlayerList"
PlayerList.Size = UDim2.new(1, -20, 1, -70)
PlayerList.Position = UDim2.new(0, 10, 0, 40)
PlayerList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PlayerList.BorderSizePixel = 0
PlayerList.ScrollBarThickness = 5
PlayerList.Parent = MainFrame

local ButtonTemplate = Instance.new("TextButton")
ButtonTemplate.Size = UDim2.new(1, -10, 0, 25)
ButtonTemplate.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ButtonTemplate.BorderSizePixel = 0
ButtonTemplate.Font = Enum.Font.SourceSans
ButtonTemplate.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonTemplate.TextSize = 14
ButtonTemplate.Text = "Player Name"
ButtonTemplate.Parent = nil


local antiFlingLastPos = Vector3.new(0, 0, 0)
local flingNeutralizerCon
local flingDetectionCon
local detectedPlayers = {}


local function toggleAntiFling(state)
    AntiFlingSetting = state
    if state then
        AntiFlingSwitcher.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        AntiFlingSwitcher.Text = "Anti-Fling: ON"
        fu.notification("Anti-fling activated.")
        
        flingDetectionCon = rs.Heartbeat:Connect(function()
            for _, pl in ipairs(game:GetService("Players"):GetPlayers()) do
                if pl.Character and pl.Character:FindFirstChild("PrimaryPart") and pl.Character:IsDescendantOf(workspace) then
                    if pl.Character.PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or pl.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                        if not detectedPlayers[pl.Name] then
                            fu.notification("A flinger has been detected with the name " .. pl.Name .. "!")
                            detectedPlayers[pl.Name] = true	
                        end

                        for _, p in ipairs(pl.Character:GetDescendants()) do
                            if p:IsA("BasePart") then
                                p.CanCollide = false
                                p.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                p.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                p.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                            end
                        end
                    end
                end
            end
        end)

        flingNeutralizerCon = rs.Heartbeat:Connect(function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("PrimaryPart") then
                if game.Players.LocalPlayer.Character.PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or game.Players.LocalPlayer.Character.PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
                    fu.notification("You were flung. Neutralizing velocity!")
                    game.Players.LocalPlayer.Character.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    game.Players.LocalPlayer.Character.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    if antiFlingLastPos ~= Vector3.new(0, 0, 0) then
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(antiFlingLastPos))
                    end
                else
                    antiFlingLastPos = game.Players.LocalPlayer.Character.PrimaryPart.Position
                end
            end
        end)
    else
        AntiFlingSwitcher.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        AntiFlingSwitcher.Text = "Anti-Fling: OFF"
        if flingDetectionCon then
            flingDetectionCon:Disconnect()
        end
        if flingNeutralizerCon then
            flingNeutralizerCon:Disconnect()
        end
        detectedPlayers = {}
        fu.notification("Anti-fling deactivated.")
    end
end


AntiFlingSwitcher.MouseButton1Click:Connect(function()
    toggleAntiFling(not AntiFlingSetting)
end)


local function UpdatePlayerList()
    for _, child in ipairs(PlayerList:GetChildren()) do
        child:Destroy()
    end
    
    local players = Players:GetPlayers()
    local yPos = 5
    
    for i, player in ipairs(players) do
        if player ~= LocalPlayer then
            local button = ButtonTemplate:Clone()
            button.Position = UDim2.new(0, 5, 0, yPos)
            button.Text = player.Name
            button.Name = player.Name.."Button"
            button.Parent = PlayerList
            
            button.MouseButton1Click:Connect(function()
                miniFling(player)
            end)
            
            yPos = yPos + 30
        end
    end
    
    PlayerList.CanvasSize = UDim2.new(0, 0, 0, yPos)
end


Players.PlayerAdded:Connect(UpdatePlayerList)
Players.PlayerRemoving:Connect(UpdatePlayerList)


UpdatePlayerList()


fu.notification("MM2 Fling GUI Loaded!")
