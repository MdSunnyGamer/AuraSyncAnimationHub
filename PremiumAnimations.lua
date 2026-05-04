-- // Ultimate Master Hub v4.0 // --
-- // Developer: MdSaniYT_507 //
-- // UI Framework: Rayfield | 17-Bundle Master Database //

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- ========================================================
-- // ORIGINAL ANIMATION BACKUP (RESET FEATURE) //
-- ========================================================
local originalAnims = {}
local function BackupDefaults()
    local animate = char:WaitForChild("Animate", 5)
    if animate then
        for _, folder in ipairs(animate:GetChildren()) do
            if folder:IsA("StringValue") or folder:IsA("Folder") then
                for _, anim in ipairs(folder:GetChildren()) do
                    if anim:IsA("Animation") then originalAnims[folder.Name] = anim.AnimationId end
                end
            end
        end
    end
end
BackupDefaults()

-- ========================================================
-- // MASTER ANIMATION DATABASE (ALL 17 BUNDLES) //
-- ========================================================
local AnimationDatabase = {
    ["Ninja"] = {
        idle = {"rbxassetid://10921155160", "rbxassetid://10921155867", "rbxassetid://10921156883"},
        walk = "rbxassetid://10921162768", run = "rbxassetid://10921157929", jump = "rbxassetid://10921160088",
        fall = "rbxassetid://10921159222", climb = "rbxassetid://10921154678", swim = "rbxassetid://10921161002", swimIdle = "rbxassetid://10922757002"
    },
    ["Vampire"] = {
        idle = {"rbxassetid://10921315373", "rbxassetid://10921316709", "rbxassetid://10921317792"},
        walk = "rbxassetid://10921326949", run = "rbxassetid://10921320299", jump = "rbxassetid://10921322186",
        fall = "rbxassetid://10921321317", climb = "rbxassetid://10921314188", swim = "rbxassetid://10921324408", swimIdle = "rbxassetid://10921325443"
    },
    ["Mage"] = {
        idle = {"rbxassetid://10921144709", "rbxassetid://10921145797", "rbxassetid://10921146941"},
        walk = "rbxassetid://10921152678", run = "rbxassetid://10921148209", jump = "rbxassetid://10921149743",
        fall = "rbxassetid://10921148939", climb = "rbxassetid://10921143404", swim = "rbxassetid://10921150788", swimIdle = "rbxassetid://10921151661"
    },
    ["Zombie"] = {
        idle = {"rbxassetid://10921344533", "rbxassetid://10921345304", "rbxassetid://10921347258"},
        walk = "rbxassetid://10921355261", run = "rbxassetid://616163682", jump = "rbxassetid://10921351278",
        fall = "rbxassetid://10921350320", climb = "rbxassetid://10921343576", swim = "rbxassetid://10921352344", swimIdle = "rbxassetid://10921353442"
    },
    ["Superhero"] = {
        idle = {"rbxassetid://10921288909", "rbxassetid://10921290167", "rbxassetid://10921290942"},
        walk = "rbxassetid://10921298616", run = "rbxassetid://10921291831", jump = "rbxassetid://10921294559",
        fall = "rbxassetid://10921293373", climb = "rbxassetid://10921286911", swim = "rbxassetid://10921295495", swimIdle = "rbxassetid://10921297391"
    },
    ["Levitation"] = {
        idle = {"rbxassetid://10921132962", "rbxassetid://10921133721", "rbxassetid://10921134514"},
        walk = "rbxassetid://10921140719", run = "rbxassetid://10921135644", jump = "rbxassetid://10921137402",
        fall = "rbxassetid://10921136539", climb = "rbxassetid://10921132092", swim = "rbxassetid://10921138209", swimIdle = "rbxassetid://10921139478"
    },
    ["Adidas Sports"] = {
        idle = {"rbxassetid://18537376492", "rbxassetid://18537371272", "rbxassetid://18537374150"},
        walk = "rbxassetid://18537392113", run = "rbxassetid://18537384940", jump = "rbxassetid://18537380791",
        fall = "rbxassetid://18537367238", climb = "rbxassetid://18537363391", swim = "rbxassetid://18537389531", swimIdle = "rbxassetid://18537387180"
    },
    ["Adidas Community"] = {
        idle = {"rbxassetid://122257458498464", "rbxassetid://102357151005774", "rbxassetid://89262795687364"},
        walk = "rbxassetid://122150855457006", run = "rbxassetid://82598234841035", jump = "rbxassetid://75290611992385",
        fall = "rbxassetid://98600215928904", climb = "rbxassetid://88763136693023", swim = "rbxassetid://133308483266208", swimIdle = "rbxassetid://109346520324160"
    },
    ["Adidas Aura"] = {
        idle = {"rbxassetid://110211186840347", "rbxassetid://114191137265065", "rbxassetid://99129837931148"},
        walk = "rbxassetid://83842218823011", run = "rbxassetid://118320322718866", jump = "rbxassetid://109996626521204",
        fall = "rbxassetid://95603166884636", climb = "rbxassetid://97824616490448", swim = "rbxassetid://134530128383903", swimIdle = "rbxassetid://94922130551805"
    },
    ["Toy"] = {
        idle = {"rbxassetid://10921301576", "rbxassetid://10921302207", "rbxassetid://10921303913"},
        walk = "rbxassetid://10921312010", run = "rbxassetid://10921306285", jump = "rbxassetid://10921308158",
        fall = "rbxassetid://10921307241", climb = "rbxassetid://10921300839", swim = "rbxassetid://10921309319", swimIdle = "rbxassetid://10921310341"
    },
    ["Old School"] = {
        idle = {"rbxassetid://10921230744", "rbxassetid://10921232093", "rbxassetid://10921233298"},
        walk = "rbxassetid://10921244891", run = "rbxassetid://10921240218", jump = "rbxassetid://10921242013",
        fall = "rbxassetid://10921241244", climb = "rbxassetid://10921229866", swim = "rbxassetid://10921243048", swimIdle = "rbxassetid://10921244018"
    },
    ["Robot"] = {
        idle = {"rbxassetid://10921248039", "rbxassetid://10921248831", "rbxassetid://10921249579"},
        walk = "rbxassetid://10921255446", run = "rbxassetid://10921250460", jump = "rbxassetid://10921252123",
        fall = "rbxassetid://10921251156", climb = "rbxassetid://10921247141", swim = "rbxassetid://10921253142", swimIdle = "rbxassetid://10921253767"
    },
    ["Cartoony"] = {
        idle = {"rbxassetid://10921071918", "rbxassetid://10921072875", "rbxassetid://10921074502"},
        walk = "rbxassetid://10921082452", run = "rbxassetid://10921076136", jump = "rbxassetid://10921078135",
        fall = "rbxassetid://10921077030", climb = "rbxassetid://10921070953", swim = "rbxassetid://10921079380", swimIdle = "rbxassetid://10921081059"
    },
    ["Stylish"] = {
        idle = {"rbxassetid://10921272275", "rbxassetid://10921273958", "rbxassetid://10921275151"},
        walk = "rbxassetid://10921283326", run = "rbxassetid://10921276116", jump = "rbxassetid://10921279832",
        fall = "rbxassetid://10921278648", climb = "rbxassetid://10921271391", swim = "rbxassetid://10921281000", swimIdle = "rbxassetid://10921281964"
    },
    ["Wicked Popular"] = {
        idle = {"rbxassetid://118832222982049", "rbxassetid://76049494037641", "rbxassetid://138255200176080"},
        walk = "rbxassetid://92072849924640", run = "rbxassetid://72301599441680", jump = "rbxassetid://104325245285198",
        fall = "rbxassetid://121152442762481", climb = "rbxassetid://131326830509784", swim = "rbxassetid://99384245425157", swimIdle = "rbxassetid://113199415118199"
    },
    ["Bold"] = {
        idle = {"rbxassetid://16738333868", "rbxassetid://16738334710", "rbxassetid://16738335517"},
        walk = "rbxassetid://16738340646", run = "rbxassetid://16738337225", jump = "rbxassetid://16738336650",
        fall = "rbxassetid://16738333171", climb = "rbxassetid://16738332169", swim = "rbxassetid://16738339158", swimIdle = "rbxassetid://16738339817"
    },
    ["Catwalk Glam"] = {
        idle = {"rbxassetid://133806214992291", "rbxassetid://94970088341563", "rbxassetid://87105332133518"},
        walk = "rbxassetid://109168724482748", run = "rbxassetid://81024476153754", jump = "rbxassetid://116936326516985",
        fall = "rbxassetid://92294537340807", climb = "rbxassetid://119377220967554", swim = "rbxassetid://134591743181628", swimIdle = "rbxassetid://98854111361360"
    }
}

local bundleNamesList = {}
for name, _ in pairs(AnimationDatabase) do table.insert(bundleNamesList, name) end
table.sort(bundleNamesList)

-- // SECURE INJECTION ENGINE (RACE CONDITION PATCHED) //
local function InjectAnimationTable(bundleTable)
    local animate = player.Character and player.Character:FindFirstChild("Animate")
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if not animate or not humanoid then return end

    for stateName, idData in pairs(bundleTable) do
        if idData then
            local folder = animate:FindFirstChild(stateName)
            if folder then
                for _, obj in ipairs(folder:GetChildren()) do if obj:IsA("Animation") then obj:Destroy() end end
                
                if type(idData) == "table" then
                    for i, id in ipairs(idData) do
                        local newAnim = Instance.new("Animation")
                        newAnim.Name = "Animation" .. i
                        newAnim.AnimationId = id
                        local weight = Instance.new("NumberValue", newAnim)
                        weight.Name = "Weight"; weight.Value = (i == 1) and 9 or 1 
                        newAnim.Parent = folder 
                    end
                else
                    local newAnim = Instance.new("Animation")
                    newAnim.Name = stateName:gsub("^%l", string.upper) .. "Anim" 
                    newAnim.AnimationId = idData
                    local weight = Instance.new("NumberValue", newAnim)
                    weight.Name = "Weight"; weight.Value = 10
                    newAnim.Parent = folder 
                end
            end
        end
    end
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do track:Stop() end
end

-- ========================================================
-- // RAYFIELD UI INITIALIZATION //
-- ========================================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Ultimate Master Hub | By: MdSaniYT_507",
   LoadingTitle = "Loading 17 Premium Bundles...",
   LoadingSubtitle = "by MdSaniYT_507",
   ConfigurationSaving = {Enabled = false},
   KeySystem = false
})

-- ========================================================
-- // TAB 1: MOVEMENT //
-- ========================================================
local MovementTab = Window:CreateTab("Movement", 4483345998) 

MovementTab:CreateSlider({
   Name = "WalkSpeed Override",
   Range = {16, 1000},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 16,
   Flag = "SpeedSlider", 
   Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
   end,
})

MovementTab:CreateSlider({
   Name = "JumpPower Override",
   Range = {50, 1000},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "JumpSlider", 
   Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.UseJumpPower = true
            player.Character.Humanoid.JumpPower = Value
        end
   end,
})

local infJumpEnabled = false
MovementTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJumpToggle", 
   Callback = function(Value)
        infJumpEnabled = Value
   end,
})

UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ========================================================
-- // TAB 2: FULL BUNDLES //
-- ========================================================
local BundleTab = Window:CreateTab("Bundles", 4483362458) 

BundleTab:CreateButton({
   Name = "🔁 RESET ANIMATIONS TO DEFAULT",
   Callback = function()
        InjectAnimationTable(originalAnims)
        Rayfield:Notify({
            Title = "Restored",
            Content = "Your default Roblox animations have been restored.",
            Duration = 3
        })
   end,
})

BundleTab:CreateDropdown({
   Name = "Select Master Bundle",
   Options = bundleNamesList,
   CurrentOption = {""},
   MultipleOptions = false,
   Flag = "MasterAnimDropdown", 
   Callback = function(Option)
       local selectedBundle = Option[1]
       if AnimationDatabase[selectedBundle] then
           InjectAnimationTable(AnimationDatabase[selectedBundle])
           Rayfield:Notify({
               Title = "Bundle Applied",
               Content = selectedBundle .. " successfully injected.",
               Duration = 3
           })
       end
   end,
})

-- ========================================================
-- // TAB 3: CUSTOM MIX & MATCH //
-- ========================================================
local CustomTab = Window:CreateTab("Custom Mix", 4483362458)

CustomTab:CreateButton({
   Name = "🔁 RESET ANIMATIONS TO DEFAULT",
   Callback = function()
        InjectAnimationTable(originalAnims)
        Rayfield:Notify({Title = "Restored", Content = "Default animations restored.", Duration = 3})
   end,
})

local currentCustomMix = {}
local statesToMap = {"idle", "walk", "run", "jump", "fall", "climb", "swim"}

for _, state in ipairs(statesToMap) do
    CustomTab:CreateDropdown({
       Name = "Select " .. string.upper(state),
       Options = bundleNamesList,
       CurrentOption = {""},
       MultipleOptions = false,
       Flag = "CustomDrop_" .. state,
       Callback = function(Option)
           local selectedBundle = Option[1]
           if AnimationDatabase[selectedBundle] then
               currentCustomMix[state] = AnimationDatabase[selectedBundle][state]
               if state == "swim" then currentCustomMix["swimIdle"] = AnimationDatabase[selectedBundle]["swimIdle"] end
           end
       end,
    })
end

CustomTab:CreateButton({
   Name = "⚡ INJECT CUSTOM MIX",
   Callback = function()
        InjectAnimationTable(currentCustomMix)
        Rayfield:Notify({Title = "Success", Content = "Custom Mix Applied!", Duration = 3})
   end,
})

-- ========================================================
-- // TAB 4: FUN & UTILITY //
-- ========================================================
local FunTab = Window:CreateTab("Fun", 4483345998)

FunTab:CreateButton({
   Name = "Get Quantum Teleporter (Click to TP)",
   Callback = function()
        local tpTool = Instance.new("Tool")
        tpTool.Name = "Quantum Teleporter"
        tpTool.RequiresHandle = false
        tpTool.ToolTip = "Click anywhere to teleport!"
        tpTool.Parent = player.Backpack

        tpTool.Activated:Connect(function()
            local mouse = player:GetMouse()
            local charRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if charRoot and mouse.Hit then
                charRoot.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
            end
        end)
        Rayfield:Notify({Title = "Tool Granted", Content = "Check your inventory.", Duration = 3})
   end,
})

FunTab:CreateSlider({
   Name = "World Gravity Modifier",
   Range = {0, 196},
   Increment = 1,
   Suffix = "Gravity",
   CurrentValue = 196,
   Flag = "GravitySlider", 
   Callback = function(Value) Workspace.Gravity = Value end,
})

local activeTrail, activeAttachment0, activeAttachment1
FunTab:CreateToggle({
   Name = "Enable Neon Aura Trail",
   CurrentValue = false,
   Flag = "TrailToggle", 
   Callback = function(Value)
        local charRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not charRoot then return end

        if Value then
            activeAttachment0 = Instance.new("Attachment", charRoot); activeAttachment0.Position = Vector3.new(0, 1, 0)
            activeAttachment1 = Instance.new("Attachment", charRoot); activeAttachment1.Position = Vector3.new(0, -1, 0)
            activeTrail = Instance.new("Trail", charRoot)
            activeTrail.Attachment0 = activeAttachment0; activeTrail.Attachment1 = activeAttachment1
            activeTrail.Color = ColorSequence.new(Color3.fromRGB(0, 255, 170), Color3.fromRGB(150, 50, 255))
            activeTrail.Lifetime = 0.5; activeTrail.LightEmission = 1
        else
            if activeTrail then activeTrail:Destroy() end
            if activeAttachment0 then activeAttachment0:Destroy() end
            if activeAttachment1 then activeAttachment1:Destroy() end
        end
   end,
})

-- ========================================================
-- // TAB 5: INFO //
-- ========================================================
local InfoTab = Window:CreateTab("Info", 4483362458)

InfoTab:CreateLabel("Script by MdSaniYT_507")

InfoTab:CreateParagraph({
    Title = "About The Ultimate Master Hub",
    Content = "Engineered entirely by MdSaniYT_507.\n\nThis premium utility features an integrated database of 17 exclusive animation bundles, a custom mix-and-match injection engine, and advanced environmental tools. Enjoy the experience!"
})
