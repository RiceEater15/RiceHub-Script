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
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RiceEater15/RiceHub-Script/refs/heads/main/ESP.lua"))()
		end,
	})

local Toggle = MainTab:CreateToggle({
   Name = "Hitbox Expander",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      if Value == true then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/RiceEater15/RiceHub-Script/refs/heads/main/HitboxExpander.lua"))()
      elseif Value == false then
         _G.HeadSize = 1.5
         _G.Disabled = true

         local originalHeadSize = Vector3.new(2, 2, 1)
         game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for _, player in next, game:GetService('Players'):GetPlayers() do
                    if player.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            local head = player.Character:FindFirstChild("Head")
                            if head then
                                head.Size = originalHeadSize
                                head.Transparency = 0
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
      end
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




local HubsTab = Window:CreateTab("Fisch", 4483362458 ) -- Title, Image
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


local ArsenalTab = Window:CreateTab("Arsenal", 448362458 )
local ArsenalSection = ArsenalTab:CreateSection("Arsenal")


local Button = ArsenalTab:CreateButton({
   Name = "Silent Aimbot",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/RiceEater15/RiceHub-Script/refs/heads/main/Arsenal/ArsenalAimBot.lua"))()
   end,
})

local Button = ArsenalTab:CreateButton({
   Name = "Inf Ammo",
   Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/RiceEater15/RiceHub-Script/refs/heads/main/Arsenal/Arsenalinfammo.lua"))()
		end,
	})

local Button = ArsenalTab:CreateButton({
   Name = "ESP+TEAMCHECK",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/RiceEater15/RiceHub-Script/refs/heads/main/Arsenal/ArsenalESP.lua"))()
		end,
	})

local Button = ArsenalTab:CreateButton({
	Name = "Firerate Mod",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/RiceEater15/RiceHub-Script/refs/heads/main/Arsenal/ArsenalFFRate.lua"))()
		end,
	})



         
