if game.PlaceId == 6284583030 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()
    local Player = game.Players.LocalPlayer
    local Window = OrionLib:MakeWindow({
        Name = "Smink HUD V3",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "Smink HUD",
        IntroText = "Smink HUD"
    })

    _G.autoTap = false
    _G.autoRebirth = false
    _G.autoMatch = false
    _G.selectEgg = "Basic Egg"

    local function autoTap()
        while _G.autoTap do
            game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
            wait(0.0000000001)
        end
    end

    local function autoRebirth()
        while _G.autoRebirth do
            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(1)
            wait(0.0000000001)
        end
    end

    local function autoMatch()
        while _G.autoMatch do
            game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(_G.selectEgg)
            wait(0.0000000001)
        end
    end

    local FarmTab = Window:MakeTab({
        Name = "Auto Farm",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    FarmTab:AddSection({
        Name = "Auto Clicker"
    })

    FarmTab:AddToggle({
        Name = "Auto Clicker",
        Default = false,
        Callback = function(Value)
            _G.autoTap = Value
            if Value then
                spawn(autoTap)
            end
        end
    })

    FarmTab:AddSection({
        Name = "Auto Reset (Rebirth)"
    })

    FarmTab:AddToggle({
        Name = "Auto Rebirth",
        Default = false,
        Callback = function(Value)
            _G.autoRebirth = Value
            if Value then
                spawn(autoRebirth)
            end
        end
    })

    local EggTab = Window:MakeTab({
        Name = "Loja",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    EggTab:AddSection({
        Name = "Loja"
    })

    EggTab:AddDropdown({
        Name = "Select Egg",
        Default = "Basic Egg",
        Options = {"Basic Egg", "Rare Egg"},
        Callback = function(Value)
            _G.selectEgg = Value
        end
    })

    EggTab:AddToggle({
        Name = "Auto Match",
        Default = false,
        Callback = function(Value)
            _G.autoMatch = Value
            if Value then
                spawn(autoMatch)
            end
        end
    })

    OrionLib:Init()
end
