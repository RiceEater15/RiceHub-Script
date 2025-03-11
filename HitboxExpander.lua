_G.HeadSize = 7
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
