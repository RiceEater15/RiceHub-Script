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
      Enabled = false, 
      Invite = "noinvitelink",
      RememberJoins = true 
   },

   KeySystem = false, 
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key", 
      SaveKey = true,
      GrabKeyFromSite = false, 
      Key = {"Hello"} 
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
   loadstring(game:HttpGet("https://scriptblox.com/raw/Combat-Warriors-ranged-hitbox-expander-10430"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Zero Gravity",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"))()
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
   Range = {0, 150},
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
   Range = {0, 150},
   Increment = 1,
   Suffix = "JumpPower",
   CurrentValue = 15,
   Flag = "Slider1",
   Callback = function(Value)
   		game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

