--// Instances
function gamepass()
    while true do
        for __,a in pairs(game.Players.LocalPlayer.ClassConfigurations.LocalGamepasses:GetChildren()) do
            a.HasGamepass.Value = true
        end
        for _, b in pairs(game.Players.LocalPlayer.ClassConfigurations.LocalBadges:GetChildren()) do
            b.HasBadge.Value = true
        end
        for _, c in pairs(game.Players.LocalPlayer.ClassConfigurations.LocalReputations:GetChildren()) do
            c.HasRepuable.Value = true
        end
        
        for _, e in pairs(game.Players.LocalPlayer.ClassConfigurations.LocalAttachments:GetChildren()) do
            e.HasAttachment.Value = true
        end
        wait()
    end
end
local box = { 
    ["MaxMedicHealAmount"] = 2500,
    ["MedicBoxThrowRange"] = 50,
    ["MedicHealRange"] = 10,
    ["MedicHealSpeed"] = 0.1,
    ["MedicHealSpeedAmount"] = 1,
    ["TimeTillMedicBoxRefill"] = 120
    }
local InfiniteJumpEnabled = true
local plr = game.Players.LocalPlayer.Character
local cf = Vector3.new(1, 1, 1)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Spawner", "Synapse")
local Tab = Window:NewTab("Item")
local Section = Tab:NewSection("DO NOT SPAM!!")
--// Setups
    Section:NewButton("Ammo Crate", "Nah", function()
        game:GetService("ReplicatedStorage").Miscs.Events.AmmoBoxThrowEvent:FireServer(cf, game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ammo Crate").Handle)
    end)
    Section:NewButton("Explosive Crate", "Nah", function()
        game:GetService("ReplicatedStorage").Miscs.Events.AmmoBoxThrowEvent:FireServer(cf, game:GetService("Players").LocalPlayer.Character:FindFirstChild("Explosive Crate").Handle)
    end)
    Section:NewButton("Medic Box", "Nah", function()
        game:GetService("ReplicatedStorage").Miscs.Events.MedicBoxThrowEvent:FireServer(cf, game:GetService("Players").LocalPlayer.Character:FindFirstChild("Medic Box").Handle, box)
    end)
local Tabs = Window:NewTab("Misc")
local Section = Tabs:NewSection("WHAT")
    Section:NewButton("Hitbox Extender", "Enlarge enemies' head.", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/IrishBaker/scripts/main/NvZ/Resource.lua'))()
    end)
    Section:NewButton("No Fog", "Removes fog.", function()
        while true do 
            game.Lighting.FogEnd = 1000000
            wait()
        end
    end)
    Section:NewButton("Unlocks Gamepasses", "Removes fog.", function()
        gamepass()
    end)
    Section:NewButton("Infinite Jump", "Allow you to jump mid-air.", function()
        game:GetService("UserInputService").JumpRequest:connect(function()
	        if InfiniteJumpEnabled then
		        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	        end
        end)
    end)
    
