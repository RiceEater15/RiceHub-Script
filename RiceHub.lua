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

local MainTab = Window:CreateTab("📜Universal Scripts📜", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

local Button = MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/M0N30XXG/raw"))();
   end,
})

local Button = MainTab:CreateButton({
   Name = "Hitbox Expander",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RiceEater15/RiceHub-Script/refs/heads/main/HitboxExpander.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Zero Gravity",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
  local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
local InfiniteJump = CreateButton("Infinite Jump: On", StuffFrame)
InfiniteJump.Position = UDim2.new(0,10,0,130)
InfiniteJump.Size = UDim2.new(0,150,0,30)
InfiniteJump.MouseButton1Click:connect(function()
	local state = InfiniteJump.Text:sub(string.len("Infinite Jump: ") + 1) --too lazy to count lol
	local new = state == "Off" and "On" or state == "On" and "Off"
	InfiniteJumpEnabled = new == "On"
	InfiniteJump.Text = "Infinite Jump: " .. new
end)
   end,
})

local Button = MainTab:CreateButton({
	Name = "Super Rings V4 (use in Natual DS)",
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Super-Rings-Parts-V4-By-Lukas-24409"))()
		end,
	})

local Button = MainTab:CreateButton({
	Name = "ESP",
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Esp-universal-28380"))()
		end,
	})



local MainSection = MainTab:CreateSection("Admin")

local Button = MainTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

local MainSection = MainTab:CreateSection("Sliders")

local Slider = MainTab:CreateSlider({
   Name = "Walkspeed Changer",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 15,
   Flag = "Slider1",
   Callback = function(Value)
   		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "JumpPower Changer",
   Range = {0, 500},
   Increment = 1,
   Suffix = "JumpPower",
   CurrentValue = 15,
   Flag = "Slider1",
   Callback = function(Value)
   		

local player = game.Players.LocalPlayer 
local humanoid = player.Character:WaitForChild("Humanoid") 
local jumpPower = (Value) 
humanoid.JumpPower = jumpPower 

   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Hitbox",
   Range = {0, 15},
   Increment = 1,
   Suffix = "Hitbox",
   CurrentValue = 2,
   Flag = "Slider1", 
   Callback = function(Value)
_G.HeadSize = (Value)
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
    if _G.Disabled then
        for _, player in next, game:GetService('Players'):GetPlayers() do
            if player.Name ~= game:GetService('Players').LocalPlayer.Name then
                pcall(function()
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        head.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        head.Transparency = 1
                        head.BrickColor = BrickColor.new("Red")
                        head.Material = "Neon"
                        head.CanCollide = false
                        head.Massless = true
                    end
                end, function(err)
                    print("Error: " .. err)
                end)
            end
        end
    end
end)


   end,
})

local HubsTab = Window:CreateTab("Hubs", 4483362458 ) -- Title, Image
local HubsSection = HubsTab:CreateSection("Fisch")

local Button = HubsTab:CreateButton({
   Name = "SpeedX Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/RiceEater15/RiceHub-Script/refs/heads/main/SpeedHubX5.23.lua"))()
   end,
})

local Button = HubsTab:CreateButton({
      Name = "Vixie Hub",
      Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjektEta/Vixie.lua/refs/heads/main/Loader.lua"))()
      end,
   })




         
