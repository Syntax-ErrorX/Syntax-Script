--[[
    SYNTAX HUB - AUTO PERFECT BLOCK & AUTO PARRY V4.4 [KEYPRESS FIXED]
    Grand Piece Online
]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local VIM = game:GetService("VirtualInputManager")

local Connections = {}
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = 'SYNTAX HUB - GPO AUTO PB',
    Center = true, AutoShow = true, TabPadding = 8, MenuFadeTime = 0.2
})

local folderName = "syntax auto pb"
local unknownAnimFile = folderName .. "/unknown_animations.txt"
local customAnimFile = folderName .. "/custom_animations.txt"
local remoteLogFile = folderName .. "/remotes.txt"
if not isfolder(folderName) then makefolder(folderName) end
if not isfile(unknownAnimFile) then writefile(unknownAnimFile, "-- Unknown Animations --\n") end
if not isfile(customAnimFile) then writefile(customAnimFile, "-- Custom Animations --\n") end
if not isfile(remoteLogFile) then writefile(remoteLogFile, "-- Remote Log --\n") end

-- Status GUI
local StatusGui = Instance.new("ScreenGui")
StatusGui.Name = "SyntaxHubStatus"
StatusGui.ResetOnSpawn = false
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = StatusGui
StatusLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
StatusLabel.BackgroundTransparency = 0.5
StatusLabel.BorderSizePixel = 0
StatusLabel.Position = UDim2.new(0.5, -150, 0, 60)
StatusLabel.Size = UDim2.new(0, 300, 0, 40)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Text = "Status: Disabled"
StatusLabel.TextColor3 = Color3.fromRGB(200,200,200)
StatusLabel.TextSize = 18
StatusLabel.TextStrokeTransparency = 0.5
Instance.new("UICorner", StatusLabel).CornerRadius = UDim.new(0, 8)
pcall(function() StatusGui.Parent = game:GetService("CoreGui") end)
if not StatusGui.Parent then StatusGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end
local function updateStatus(t, c)
    StatusLabel.Text = "Status: " .. t
    StatusLabel.TextColor3 = c or Color3.fromRGB(255,255,255)
end

local Tabs = {
    Main = Window:AddTab('Main'),
    Anims = Window:AddTab('Animations'),
    Debug = Window:AddTab('Debug'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Settings = {
    Enabled = false, BlockPlayers = true, MaxDistance = 150, BlockDelay = 0,
    ParryEnabled = false, ParryDistance = 12, Debug = false,
    BlockKey = Enum.KeyCode.F,
    HoldTime = 0.30,
    Method = 'Both',
    ConstantBlock = false,
    ConstantRange = 15,
    CombatKeys = {
        [Enum.UserInputType.MouseButton1]=false,[Enum.KeyCode.E]=false,[Enum.KeyCode.R]=false,
        [Enum.KeyCode.T]=false,[Enum.KeyCode.Q]=false,[Enum.KeyCode.Z]=false,
        [Enum.KeyCode.X]=false,[Enum.KeyCode.C]=false,[Enum.KeyCode.V]=false,
    },
    RecorderEnabled = true, RecorderRadius = 150, BlockUnknown = true, RecorderCustomName = "",
}

local CombatState = { ActiveKeys={}, LastActionTime=0, ComboCooldown=0.5, LastKeyAllowedBlocking=nil }
local Stats = { Total=0, Blocks=0, Parries=0, Last="None" }
local RecordedAnimations, ActiveCharacters, blockedAnims = {}, {}, {}

-- ===== VK CODE CONVERTER =====
local function getVK(keyCode)
    local n = keyCode.Name
    if #n == 1 then
        local b = n:upper():byte()
        if (b >= 65 and b <= 90) or (b >= 48 and b <= 57) then return b end
    end
    local map = { Space=0x20, LeftShift=0xA0, RightShift=0xA1, LeftControl=0xA2,
        RightControl=0xA3, Tab=0x09, LeftAlt=0x12, One=0x31, Two=0x32, Three=0x33 }
    return map[n] or 0x46
end

-- ===== THE BLOCK FUNCTION (FIXED) =====
local blocking = false
local function doBlock(isParry)
    if blocking then return end
    blocking = true
    task.spawn(function()
        if not isParry and Settings.BlockDelay > 0 then
            task.wait(Settings.BlockDelay)
        end

        local key = Settings.BlockKey
        local vk = getVK(key)
        local m = Settings.Method

        -- PRESS DOWN
        if m == 'VirtualInput' or m == 'Both' then
            pcall(function() VIM:SendKeyEvent(true, key, false, game) end)
        end
        if m == 'keypress' or m == 'Both' then
            pcall(function() if keypress then keypress(vk) end end)
        end

        -- HOLD (this is the important part)
        task.wait(Settings.HoldTime)

        -- RELEASE
        if m == 'VirtualInput' or m == 'Both' then
            pcall(function() VIM:SendKeyEvent(false, key, false, game) end)
        end
        if m == 'keypress' or m == 'Both' then
            pcall(function() if keyrelease then keyrelease(vk) end end)
        end

        task.wait(0.05)
        blocking = false
    end)
end

-- Notification queue
local NQ = { q={}, busy=false, cd=0.4, last=0 }
function NQ:Add(msg, dur)
    if #self.q >= 6 then return end
    table.insert(self.q, {msg=msg, dur=dur or 1})
    if not self.busy then self:Run() end
end
function NQ:Run()
    self.busy = true
    task.spawn(function()
        while #self.q > 0 do
            if Library.Unloaded then break end
            local now = tick()
            if now - self.last < self.cd then task.wait(self.cd - (now - self.last)) end
            local n = table.remove(self.q, 1)
            if n then Library:Notify(n.msg, n.dur) self.last = tick() end
        end
        self.busy = false
    end)
end

local function logHit(name, id, isParry)
    Stats.Total += 1
    if isParry then Stats.Parries += 1 else Stats.Blocks += 1 end
    Stats.Last = (name or "?") .. " (" .. (id or "?") .. ")"
    NQ:Add(string.format("%s %s | %s", isParry and "⚔️" or "🛡️", name or "?", id or "?"), 0.5)
end

local Ignored = {
    ['102847582739519']=true,['9710431811']=true,['9703995286']=true,['4910485611']=true,['9711831861']=true,['134877403213295']=true,['18841102170']=true,['18841081185']=true,['106763696159860']=true,['92811333533670']=true,['78584318919493']=true,['118247933649869']=true,['138848037207334']=true,['98963988224403']=true,['9712102429']=true,['98166532936064']=true,['7584947295']=true,['18841080472']=true,['2942644324']=true,['2942643830']=true,['2942641670']=true,['5392930263']=true,['5392869763']=true,['6032355961']=true,['6032356414']=true,['6028142920']=true,['6026084898']=true,['6026085284']=true,['6026082598']=true,['11838527249']=true,['11838531612']=true,['11838526480']=true,['4910406979']=true,['3044991033']=true,['13243427337']=true,['129305042300099']=true,['74744607717391']=true,['82497770045941']=true,['11838527981']=true,['119334509242358']=true,['11838529559']=true,['11838530329']=true,['11838528512']=true,['13243423773']=true,['4899959433']=true,['99564327193459']=true,['90004694910626']=true,['4907577925']=true,['14986407007']=true,['3027864591']=true,['3027717390']=true,['3027719314']=true,['15059163245']=true,['15374681990']=true,['15059161952']=true,['72729463849772']=true,['15382115992']=true,['15382065457']=true,['13630769186']=true,['17650838050']=true,['5517298834']=true,['11093531300']=true,['6043954920']=true,['7075728341']=true,['10001705684']=true,['507765644']=true,['4563261864']=true,['2095054253']=true,['9984793787']=true,['5796457289']=true,['4126956669']=true,['5796460384']=true,['10001707271']=true,['507766388']=true,['507766666']=true,['507766951']=true,['507767234']=true,['507767714']=true,['913376220']=true,['913402848']=true,['913403323']=true,['913403938']=true,['913384386']=true,['10921082554']=true,['10921083856']=true,['507784897']=true,['507785072']=true,['507765000']=true,['507767968']=true,['507768133']=true,['507768375']=true,['507768851']=true,['3333499508']=true,['3333497031']=true,['4841397952']=true,['3695333486']=true,['3695335779']=true,['3333136415']=true,['4049037604']=true,['3337966527']=true,['3360686498']=true,['3576686446']=true,['3576968026']=true,['10921127235']=true,['3541114300']=true,['3541111181']=true
}

local AnimTimings = {
    ['4087684389']=0,['4087685071']=0,['3993561070']=0,['3027112133']=0,['3993564465']=0,['3993593264']=0,['3993592261']=0,['4048678023']=0,['3993590202']=0,['4810797117']=0,['4563258318']=0,['10970023685']=0,['10970024047']=0,['10970024392']=0,['10970024769']=0,['10970025138']=0,['10970025632']=0,['10970026107']=0,['4610052185']=0,['4158016136']=0.1,['4158017967']=0.1,['10620309597']=0,['10620310103']=0,['10620310578']=0,['10620311262']=0,['10620311612']=0,['11315312194']=0,['11315312585']=0,['11315312964']=0,['11315313251']=0,['11315313647']=0,['11382679819']=0,['11382680257']=0,['11382680700']=0,['11382681299']=0,['11382681645']=0,['11382682075']=0,['11382682398']=0,['11838525488']=0,['11838524829']=0,['128995825208007']=0.2,['121388817190480']=0.1,['111488507714748']=0,['112308753483647']=0,['97426652978104']=0,['115904308263891']=0,['109907155268070']=0.1,['93998517237288']=0,['112862351309418']=0,['70683948961049']=0.1,['72539583003867']=0.2,['4862846183']=0.5,['4867467527']=0.1,['9711777437']=0.5,['11839454205']=0.2,['77208200591918']=0,['11838708179']=0.1,['108522752957198']=0.2,['139348436441539']=0.1,['11838519181']=0,['11838522300']=0,['11838521789']=0,['11838521234']=0,['11838520277']=0,['11838532486']=0,['6028142451']=0.2,['6026081621']=0,['6026081303']=0.1,['6026081955']=0,['6026082936']=0.2,['74939812314067']=0.1,['108685213656196']=0.1,['140420232174716']=0,['134100362364915']=0.3,['10970027277']=0.2,['87153817279767']=0,['86832118981204']=0,['92320977675828']=0,['137602132498103']=0,['136537815800828']=0.1,['11509753562']=0,['11509753722']=0,['11509754018']=0,['11509754281']=0,['11509754564']=0,['11509754904']=0,['15490770972']=0,['15490767452']=0,['10984727647']=0.2,['11094732558']=0.2,['11545972545']=0.2,['15635213147']=0.2,['10827636518']=0.2,['12378039588']=0.2,['11643324933']=0.2,['11643325301']=0.2,['120163859318804']=0.2,['87695031726881']=0.2,['5048955925']=0.2,['110432084683680']=0,['4563260213']=0,['4760375217']=0,['10519097075']=0,['98540572072150']=0.1,['87003860237022']=0.1,['120123207439754']=0.2,['4563257350']=0.3,['5798506723']=0.3,['5800509406']=0.3,['4563256454']=0.3,['4563257080']=0.3,['102869887710887']=0.3,['74395261231638']=0.3,['4760307723']=0.3,['11548109927']=0,['11548110975']=0,['12371016840']=0.2,['12446605660']=0,['88497352212383']=0,['111758607864066']=0,['5746701412']=0,['5930373942']=0.1,['5930374302']=0.1,['111860306703353']=0.2,['111411037243512']=0.2,['110371782727867']=0.2,['106700313119224']=0.2,['10492139931']=0.2,['4563261003']=0.2,['13243418555']=0,['13243419833']=0,['13243420683']=0,['13243421318']=0,['13243421985']=0,['13243424357']=0,['13243425294']=0,['13243426159']=0,['13243428011']=0
}

pcall(function()
    for line in readfile(customAnimFile):gmatch("[^\r\n]+") do
        local id, t = line:match("^(%d+)%s*|%s*([%d%.]+)")
        if id and t then AnimTimings[id] = tonumber(t) or 0 end
    end
end)
pcall(function()
    for line in readfile(unknownAnimFile):gmatch("[^\r\n]+") do
        local id = line:match("^(%d+)")
        if id then RecordedAnimations[id] = true end
    end
end)

local function getAnimName(a)
    if a and a:IsA("Animation") then
        if a.Name and a.Name ~= "" and a.Name ~= "Animation" then return a.Name end
        local p = a.Parent
        if p and p.Name ~= "Animator" and p.Name ~= "Humanoid" then return p.Name end
    end
    return "Unknown"
end

local function recordUnknown(id, target, inst)
    if not Settings.RecorderEnabled or RecordedAnimations[id] or Ignored[id] then return end
    RecordedAnimations[id] = true
    local n = getAnimName(inst)
    if n == "Unknown" and Settings.RecorderCustomName ~= "" then n = Settings.RecorderCustomName end
    appendfile(unknownAnimFile, string.format("%s | %s | %s | [%s]\n", id, os.date("%X"), target or "?", n))
    NQ:Add("📝 New: " .. n .. " (" .. id .. ")", 3)
end

local function isInCombat()
    for _, v in pairs(CombatState.ActiveKeys) do if not v then return true end end
    if (tick() - CombatState.LastActionTime) <= CombatState.ComboCooldown then
        if CombatState.LastKeyAllowedBlocking == false then return true end
    end
    return false
end

Connections.IB = UserInputService.InputBegan:Connect(function(i, gp)
    if gp then return end
    local allow, id
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        allow = Settings.CombatKeys[Enum.UserInputType.MouseButton1]; id = "M1"
    elseif Settings.CombatKeys[i.KeyCode] ~= nil then
        allow = Settings.CombatKeys[i.KeyCode]; id = i.KeyCode.Name
    end
    if id then
        CombatState.ActiveKeys[id] = allow
        CombatState.LastActionTime = tick()
        CombatState.LastKeyAllowedBlocking = allow
    end
end)

Connections.IE = UserInputService.InputEnded:Connect(function(i)
    local id = (i.UserInputType == Enum.UserInputType.MouseButton1) and "M1" or i.KeyCode.Name
    if CombatState.ActiveKeys[id] ~= nil then
        CombatState.ActiveKeys[id] = nil
        CombatState.LastActionTime = tick()
    end
end)

Connections.HB = RunService.Heartbeat:Connect(function()
    if Settings.Enabled or Settings.ParryEnabled then
        if isInCombat() then updateStatus("Player Combo", Color3.fromRGB(255,170,0))
        elseif Settings.ParryEnabled then updateStatus("Parry Ready", Color3.fromRGB(255,215,0))
        else updateStatus("Ready", Color3.fromRGB(255,255,255)) end
    else
        updateStatus("Disabled", Color3.fromRGB(200,200,200))
    end
end)

-- ===== CONSTANT BLOCK MODE (fallback test) =====
task.spawn(function()
    local held = false
    while task.wait(0.15) do
        if Library.Unloaded then break end
        if Settings.ConstantBlock then
            local myChar = LocalPlayer.Character
            local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
            local near = false
            if myHrp then
                for c in pairs(ActiveCharacters) do
                    if c and c.Parent and c ~= myChar then
                        local h = c:FindFirstChild("HumanoidRootPart")
                        local hum = c:FindFirstChildOfClass("Humanoid")
                        if h and hum and hum.Health > 0 then
                            if (h.Position - myHrp.Position).Magnitude <= Settings.ConstantRange then
                                near = true break
                            end
                        end
                    end
                end
            end
            if near and not held then
                held = true
                pcall(function() VIM:SendKeyEvent(true, Settings.BlockKey, false, game) end)
                pcall(function() if keypress then keypress(getVK(Settings.BlockKey)) end end)
            elseif not near and held then
                held = false
                pcall(function() VIM:SendKeyEvent(false, Settings.BlockKey, false, game) end)
                pcall(function() if keyrelease then keyrelease(getVK(Settings.BlockKey)) end end)
            end
        elseif held then
            held = false
            pcall(function() VIM:SendKeyEvent(false, Settings.BlockKey, false, game) end)
            pcall(function() if keyrelease then keyrelease(getVK(Settings.BlockKey)) end end)
        end
    end
end)

local function setupChar(char)
    if not char or not char:IsA("Model") or ActiveCharacters[char] then return end
    if char == LocalPlayer.Character then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local anim = hum:FindFirstChildOfClass("Animator")
    if not anim then
        hum.ChildAdded:Connect(function(c)
            if c:IsA("Animator") then task.wait(0.2) setupChar(char) end
        end)
        return
    end
    ActiveCharacters[char] = true

    local conn
    conn = anim.AnimationPlayed:Connect(function(track)
        if not char.Parent then conn:Disconnect() ActiveCharacters[char] = nil return end
        if Players:GetPlayerFromCharacter(char) and not Settings.BlockPlayers then return end

        local myChar = LocalPlayer.Character
        local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not myHrp or not hrp then return end

        local dist = (hrp.Position - myHrp.Position).Magnitude
        if dist > math.max(Settings.MaxDistance, Settings.ParryDistance) then return end

        local a = track and track.Animation
        if not a then return end
        local id = tostring(a.AnimationId):match("%d+")
        if not id or Ignored[id] then return end

        if Settings.Debug then
            NQ:Add(string.format("👀 %s | %s | %.0f studs", char.Name, id, dist), 1)
        end

        local k = tostring(char:GetDebugId()) .. "_" .. id
        if blockedAnims[k] then return end

        -- PARRY
        if Settings.ParryEnabled and dist <= Settings.ParryDistance then
            blockedAnims[k] = true
            task.delay(0.5, function() blockedAnims[k] = nil end)
            doBlock(true)
            logHit(char.Name, id, true)
            return
        end

        -- NORMAL BLOCK
        local t = AnimTimings[id]
        if not t and Settings.RecorderEnabled and dist <= Settings.RecorderRadius then
            recordUnknown(id, char.Name, a)
        end
        if not Settings.Enabled then return end
        if not t and not Settings.BlockUnknown then return end
        if isInCombat() then return end

        blockedAnims[k] = true
        task.delay(1, function() blockedAnims[k] = nil end)
        task.spawn(function()
            if t and t > 0 then task.wait(t) end
            doBlock(false)
            logHit(char.Name, id, false)
        end)
    end)
end

-- NPC scanner
local function scan(f)
    if not f then return end
    for _, m in ipairs(f:GetChildren()) do if m:IsA("Model") then task.spawn(setupChar, m) end end
    f.ChildAdded:Connect(function(c) if c:IsA("Model") then task.wait(0.4) setupChar(c) end end)
end
for _, n in ipairs({"NPCs","Enemies","Mobs","Living","Monsters","PlayerCharacters","Characters"}) do
    scan(Workspace:FindFirstChild(n))
end
for _, m in ipairs(Workspace:GetChildren()) do
    if m:IsA("Model") and m:FindFirstChildOfClass("Humanoid") then task.spawn(setupChar, m) end
end
Workspace.DescendantAdded:Connect(function(d)
    if d:IsA("Animator") then
        local c = d.Parent and d.Parent.Parent
        if c and c:IsA("Model") then task.wait(0.2) setupChar(c) end
    end
end)

-- ============ UI ============
local L = Tabs.Main:AddLeftGroupbox('Auto Perfect Block')
L:AddToggle('MainToggle', { Text='Enable Auto Block (P)', Default=false, Callback=function(v) Settings.Enabled=v end })
L:AddToggle('ParryToggle', { Text='Enable Auto Parry', Default=false, Callback=function(v) Settings.ParryEnabled=v end })
L:AddToggle('DebugToggle', { Text='Debug Mode', Default=false, Callback=function(v) Settings.Debug=v end })
L:AddToggle('BlockPlayers', { Text='Block Players', Default=true, Callback=function(v) Settings.BlockPlayers=v end })
L:AddDivider()
L:AddSlider('MaxDist', { Text='Block Distance', Default=150, Min=10, Max=300, Rounding=0, Suffix=' studs', Callback=function(v) Settings.MaxDistance=v end })
L:AddSlider('ParryDist', { Text='Parry Distance', Default=12, Min=5, Max=50, Rounding=0, Suffix=' studs', Callback=function(v) Settings.ParryDistance=v end })
L:AddSlider('BlockDelay', { Text='Block Delay', Default=0, Min=0, Max=0.4, Rounding=2, Suffix='s', Callback=function(v) Settings.BlockDelay=v end })

-- THE FIX SECTION
local KB = Tabs.Main:AddLeftGroupbox('⚙️ Key Settings [FIX HERE]')
KB:AddLabel('Block Key'):AddKeyPicker('BlockKeyPick', {
    Default = 'F', NoUI = false, Text = 'Block Key',
    Callback = function() end,
    ChangedCallback = function(new) Settings.BlockKey = new end
})
KB:AddSlider('HoldTime', {
    Text='Hold Duration', Default=0.30, Min=0.05, Max=1, Rounding=2, Suffix='s',
    Tooltip='How long F is held. Try 0.3 - 0.5 if not blocking',
    Callback=function(v) Settings.HoldTime=v end
})
KB:AddDropdown('MethodDrop', {
    Values = { 'Both', 'VirtualInput', 'keypress' },
    Default = 'Both', Text = 'Input Method',
    Tooltip = 'Try each one if block does not work',
    Callback = function(v) Settings.Method = v end
})
KB:AddDivider()
KB:AddButton({ Text='🔧 TEST BLOCK NOW', Func=function()
    doBlock(true)
    Library:Notify('Pressed ' .. Settings.BlockKey.Name .. ' for ' .. Settings.HoldTime .. 's', 2)
end })
KB:AddToggle('ConstantBlock', {
    Text='Constant Block (Test Mode)', Default=false,
    Tooltip='Holds block while any enemy is near. Use this to test if key works at all',
    Callback=function(v) Settings.ConstantBlock=v end
})
KB:AddSlider('ConstRange', { Text='Constant Range', Default=15, Min=5, Max=50, Rounding=0, Suffix=' studs', Callback=function(v) Settings.ConstantRange=v end })

local KG = Tabs.Main:AddRightGroupbox('Combat Keys (OFF = your combo)')
for _, it in ipairs({
    {k=Enum.UserInputType.MouseButton1, n='M1 (Left Click)', f='M1'},
    {k=Enum.KeyCode.E, n='E', f='E'}, {k=Enum.KeyCode.R, n='R', f='R'},
    {k=Enum.KeyCode.T, n='T', f='T'}, {k=Enum.KeyCode.Q, n='Q', f='Q'},
    {k=Enum.KeyCode.Z, n='Z', f='Z'}, {k=Enum.KeyCode.X, n='X', f='X'},
    {k=Enum.KeyCode.C, n='C', f='C'}, {k=Enum.KeyCode.V, n='V', f='V'},
}) do
    KG:AddToggle(it.f, { Text=it.n, Default=false, Callback=function(v) Settings.CombatKeys[it.k]=v end })
end
KG:AddSlider('ComboCD', { Text='Combo Cooldown', Default=0.5, Min=0.1, Max=2, Rounding=1, Suffix='s', Callback=function(v) CombatState.ComboCooldown=v end })

local SB = Tabs.Main:AddRightGroupbox('Statistics')
local l1 = SB:AddLabel('Total: 0')
local l2 = SB:AddLabel('Blocks: 0')
local l3 = SB:AddLabel('Parries: 0')
local l4 = SB:AddLabel('Last: None')
task.spawn(function()
    while task.wait(1) do
        if Library.Unloaded then break end
        l1:SetText('Total: ' .. Stats.Total)
        l2:SetText('Blocks: ' .. Stats.Blocks)
        l3:SetText('Parries: ' .. Stats.Parries)
        l4:SetText('Last: ' .. Stats.Last)
    end
end)

-- Debug Tab
local DB = Tabs.Debug:AddLeftGroupbox('Find Your Block Remote')
DB:AddLabel('If keys still fail, log the remote:')
DB:AddLabel('1. Press START below')
DB:AddLabel('2. Manually press F in-game')
DB:AddLabel('3. Check the printed output (F9)')
DB:AddDivider()
local logging = false
local seen = {}
pcall(function()
    if hookmetamethod and getnamecallmethod and newcclosure then
        local old
        old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local m = getnamecallmethod()
            if logging and (m == "FireServer" or m == "InvokeServer") then
                local ok, path = pcall(function() return self:GetFullName() end)
                if ok and not seen[path] then
                    seen[path] = true
                    local args = {...}
                    local s = ""
                    for i, v in ipairs(args) do s = s .. tostring(v) .. ", " end
                    print("[SYNTAX REMOTE] " .. path .. " | ARGS: " .. s)
                    pcall(function() appendfile(remoteLogFile, path .. " | " .. s .. "\n") end)
                end
            end
            return old(self, ...)
        end))
    end
end)
DB:AddToggle('LogRemotes', { Text='START Remote Logger', Default=false, Callback=function(v)
    logging = v
    if v then seen = {} Library:Notify('Logging ON - press F manually now', 3) end
end })
DB:AddButton({ Text='Clear Remote Log', Func=function() seen={} pcall(function() writefile(remoteLogFile, "-- Remote Log --\n") end) Library:Notify('Cleared', 2) end })

local DB2 = Tabs.Debug:AddRightGroupbox('Info')
local dlbl = DB2:AddLabel('Tracked NPCs: 0')
task.spawn(function()
    while task.wait(2) do
        if Library.Unloaded then break end
        local c = 0
        for _ in pairs(ActiveCharacters) do c += 1 end
        dlbl:SetText('Tracked NPCs: ' .. c)
    end
end)
DB2:AddLabel('keypress exists: ' .. tostring(keypress ~= nil))
DB2:AddLabel('hookmetamethod: ' .. tostring(hookmetamethod ~= nil))

-- Anims Tab
local CB = Tabs.Anims:AddLeftGroupbox('Add Custom Animation')
local cId, cT, cN = "", "0", ""
CB:AddInput('AnimID', { Default='', Numeric=true, Finished=true, Text='Animation ID', Callback=function(v) cId=v end })
CB:AddInput('AnimT', { Default='0', Numeric=true, Finished=true, Text='Timing (s)', Callback=function(v) cT=v end })
CB:AddInput('AnimN', { Default='', Text='Name', Callback=function(v) cN=v end })
CB:AddButton({ Text='Add', Func=function()
    if cId == "" or cId:match("%D") then Library:Notify('❌ Invalid ID', 3) return end
    local t = tonumber(cT) or 0
    AnimTimings[cId] = t
    appendfile(customAnimFile, string.format("%s | %s | %s\n", cId, t, cN))
    Library:Notify('✅ Added ' .. cId, 3)
end })

local RB = Tabs.Anims:AddRightGroupbox('Recorder')
RB:AddToggle('RecOn', { Text='Enable Recorder', Default=true, Callback=function(v) Settings.RecorderEnabled=v end })
RB:AddToggle('BlockUnk', { Text='Block Unknown', Default=true, Callback=function(v) Settings.BlockUnknown=v end })
RB:AddSlider('RecR', { Text='Radius', Default=150, Min=10, Max=300, Rounding=0, Suffix=' studs', Callback=function(v) Settings.RecorderRadius=v end })
RB:AddButton({ Text='Clear Recordings', Func=function() RecordedAnimations={} writefile(unknownAnimFile,"-- Unknown --\n") Library:Notify('Cleared',2) end })

-- UI Settings
local MG = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MG:AddButton({ Text='Unload', Func=function() Library:Unload() end })
MG:AddLabel('Menu bind'):AddKeyPicker('MenuKey', { Default='End', NoUI=true, Text='Menu keybind' })
Library.ToggleKeybind = Options.MenuKey
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKey','BlockKeyPick'})
ThemeManager:SetFolder('SyntaxHub')
SaveManager:SetFolder('SyntaxHub/AutoPB')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])

Library:OnUnload(function()
    for _, c in pairs(Connections) do if typeof(c)=="RBXScriptConnection" then c:Disconnect() end end
    pcall(function() VIM:SendKeyEvent(false, Settings.BlockKey, false, game) end)
    pcall(function() if keyrelease then keyrelease(getVK(Settings.BlockKey)) end end)
    table.clear(ActiveCharacters)
    StatusGui:Destroy()
    Library.Unloaded = true
end)

Connections.P = UserInputService.InputBegan:Connect(function(i, gp)
    if gp then return end
    if i.KeyCode == Enum.KeyCode.P then
        Toggles.MainToggle:SetValue(not Toggles.MainToggle.Value)
    end
end)

Library:Notify('SYNTAX HUB V4.4 ✅ | Go to Key Settings if block fails', 5)
updateStatus("Disabled", Color3.fromRGB(200,200,200))
