local Player = game.Players.LocalPlayer
local wS = game.Workspace
local cam = wS.CurrentCamera
local mouse = Player:GetMouse()
local ratio = game:GetService("Ratio")
local tab = ratio.tab

local section = tab.createSection({name = "TP Silent aim without fov", maxsize = 999})
local e = section.createElement({name = "TP Silent aim no fov Made by N2#0001 some go to shush ", type = button, callback = function()
    local ClosestPlr = function()
    local Closest = nil
    local Distance = 9e9;
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= Player then
            if wS[v.Name]:FindFirstChild("Humanoid") and wS[v.Name].Humanoid.Health ~= 0 then
                local pos = cam:WorldToViewportPoint(wS[v.Name].HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude;
                if magnitude < Distance then
                    Closest = wS[v.Name]
                    Distance = magnitude
                end
            end
        end
    end
    return Closest
end

game:GetService('RunService').RenderStepped:connect(function()
    for i,v in pairs(game.Workspace.KnifeHost:GetDescendants()) do
        if v:IsA"Part" then
            if v.Archivable == true then
                local plrpos  = ClosestPlr().baseHitbox.CFrame
                v.CFrame = plrpos
            end
        end
    end
end)
end})
