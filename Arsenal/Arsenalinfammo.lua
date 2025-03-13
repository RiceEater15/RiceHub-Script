local replicationstorage = game.ReplicatedStorage

while wait() do
    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
    game:GetService("Players").LocalPlayer.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
end

local MenuIsToggled = true

Basic.Visible = false
MenuIsToggled = false

local minimize = ts:Create(ping, TweenInfo.new(1), {TextTransparency = 0})
minimize:Play()

wait(3)

local unominimize = ts:Create(ping, TweenInfo.new(1), {TextTransparency = 1})
unominimize:Play()

