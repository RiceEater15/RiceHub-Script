local replicationstorage = game.ReplicatedStorage

while wait(5) do
    for i, v in pairs(replicationstorage.Weapons:GetDescendants()) do
        if v.Name == "Auto" then
            v.Value = true
        end
        if v.Name == "FireRate" then
            v.Value = 0.02
        end
    end
end
