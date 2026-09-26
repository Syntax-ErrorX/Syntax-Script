-- Luraph runtime function (from the VM object, not part of the script: not lifted).
-- LPH_ENCFUNC decrypts a function this way: (key, encrypted buffer, ...) -> function.
local function luraph_runtime1(...)
	error("Luraph runtime function, not devirtualized")
end

local v = table.pack(...)

if not ce_like_loadstring_fn then
	if not l_fastload_enabled or not is_from_loader then
		game:GetService("Players").LocalPlayer:Kick("[Luarmor]: Use the loadstring, do not run this directly")
		wait(5)

		while true do
		end
	end
end

local str = "?"
loadstring = ce_like_loadstring_fn or loadstring
local flag = false

pcall(function()
	flag = true
	local UserGameSettings = UserSettings():GetService("UserGameSettings")

	if not UserGameSettings:GetTutorialState("nil  nil  ") then
		str = ""
		local n = ({ wait() })[1] * 1000000

		local function fn(arg)
			local n2 = 1103515245
			local n3 = 12345
			local n4 = 99999999
			local n5 = arg % 2147483648
			local n6 = 1

			return function(arg2, arg3)
				local v2 = n4
				local n7 = n2 * n5 + n3
				local n8 = n7 % v2 + n6
				n6 += 1
				n5 = n8
				n3 = n7 % 4858 * v2 % 5782
				return arg2 + n8 % arg3 - arg2 + 1
			end
		end

		local v2 = fn(n - n % 1)
		UserGameSettings:SetTutorialState("nil  nil  ", true)
		local n2 = 0

		for i = 1, 16 do
			local n3 = 0
			local n4 = 1

			for i2 = 1, 5 do
				local flag2 = v2(10, 20) > 15
				UserGameSettings:SetTutorialState("nil  nil  " .. n2, flag2)
				n3 += (flag2 and 1 or 0) * n4
				n4 *= 2
				n2 += 1
			end

			str ..= ("qwertyuiopasdfghjklzxcvbnm098765"):sub(n3 + 1, n3 + 1)
		end
	else
		str = ""
		local n = 0

		for i = 1, 16 do
			local n2 = 0
			local n3 = 1

			for i2 = 1, 5 do
				n2 += (UserGameSettings:GetTutorialState("nil  nil  " .. n) and 1 or 0) * n3
				n3 *= 2
				n += 1
			end

			str ..= ("qwertyuiopasdfghjklzxcvbnm098765"):sub(n2 + 1, n2 + 1)
		end
	end
end)

while not flag do
end

local now = os.clock()

if devsignature_sig then
	print([[        Luarmor - Lua whitelist service
        This is a signature - If you are seeing this, you know what not to do :3
        Have a good day!
        https://luarmor.net/
    ]])
end

local flag2 = nil
local flag3 = nil
local v2 = ({ table.unpack(v, 1, v.n) })[3]
local v3

if v2 and v2[1] then
	v3 = v2[1]
else
	v3 = nil
end

local floor = math.floor
local random = math.random
local remove = table.remove
local char = string.char
local n = 0
local n2 = 2
local tbl = {}
local tbl2 = {}

for i = 1, 256 do
	tbl2[i] = i
end

repeat
	local v4 = random(1, #tbl2)
	local v5 = remove(tbl2, v4)
	tbl[v5] = char(v5 - 1)
until #tbl2 == 0

local tbl3 = {}

local function fn()
	if #tbl3 == 0 then
		n = (n * 149 + 4033097371307) % 35184372088832

		repeat
			n2 = n2 * 37 % 257
		until n2 ~= 1

		local n3 = n2 % 32
		local n4 = floor(n / 2 ^ (13 - (n2 - n3) / 32)) % 4294967296 / 2 ^ n3
		local n5 = floor(n4 % 1 * 4294967296) + floor(n4)
		local n6 = n5 % 65536
		local n7 = (n5 - n6) / 65536
		local n8 = n6 % 256
		local n9 = n7 % 256
		tbl3 = { n8, (n6 - n8) / 256, n9, (n7 - n9) / 256 }
	end

	return table.remove(tbl3)
end

local tbl4 = {}
local v4 = tbl4

local function fn2(arg, arg2)
	local v5 = tbl4

	if not v5[arg2] then
		tbl3 = {}
		local v6 = tbl
		n = arg2 % 35184372088832
		n2 = arg2 % 255 + 2
		v5[arg2] = ""
		local n3 = 77

		for i = 1, #arg do
			n3 = (string.byte(arg, i) + fn() + n3) % 256
			v5[arg2] = v5[arg2] .. v6[n3 + 1]
		end
	end

	return arg2
end

local v5 = LUARMOR_SkipAntidebugDevMode
local v6 = LUARMOR_AllowKeyCheckSkip
local flag4 = ff97f23b97f93792992999 and ff97f23b97f93792992999() == v4[fn2("\172", 31126577901884)] or false
local v7 = v4[fn2("6\143K\188=\r\226\146\248&\176;\3\231Æ\133\143\248\204_\184\222\229\157\254\25", 2340828612740)]
local v8 = USE_NON_SSL_NODE
local v9 = l_fastload_enabled
local n3 = os[v4[fn2("(\204\6\168", 4882453074371)]](os[v4[fn2("UC\178}", 12971197083440)]](v4[fn2("\139L", 33012126087192)])) - os[v4[fn2("vܢ\204", 5436520764359)]](os[v4[fn2("f\150\187#", 4318721413046)]](v4[fn2("\209\6D", 24300592814183)]))
local n4

if n3 < 0 then
	n4 = (86400 + -(-n3 % 86400)) % 86400
else
	n4 = n3 % 86400
end

local n5 = n4 / 3600

if n5 >= 21 or n5 < 5 then
	local tbl5 = {}
	local v10 = v4[fn2("\226XO\140q\210K\180:%\205B\254\182.y\229\163\245\219v$\209Y\171\6f", 3448963992716)]
	local v11 = v4[fn2("N\235X\233G\12\243\241ˣ@s\250\190\137\214\t\2267j\174\247\195\241\237\1\160", 16047561292385)]
	tbl5[1] = v10
	tbl5[2] = v11
	v7 = tbl5[math[v4[fn2("\195K\\\173\155:", 14086848885567)]](1, 2)]
elseif n5 >= 5 and n5 < 15 then
	local tbl5 = {}
	local v10 = v4[fn2("\136M\165r\0017j\254\186\147Ds\224x\241\151\231]k\137\28\184\17f,\138\149", 25839311805952)]
	local v11 = v4[fn2("\211:<?S\222\17[!\164Yl\240F\230\"\193\251\128\220a\29\252\133\u{87}\163", 2297877629020)]
	local v12 = v4[fn2("s\146p: \167\177_\228\255\136kW\246\245\253e\146M\245\19T\169IP\21\187", 2572763924828)]
	local v13 = v4[fn2("'\26L\252\146.\25c\151\208\248ϕ\154\r\229I\243\26\149\181\139k`+\16\2", 19333311546965)]
	local v14 = v4[fn2("$\1C\213\234\205?\169\200\"\188@\0\188\128\27C\244\12\203l\224\3p\245\187\233", 21697763200751)]
	local v15 = v4[fn2("\30\197\216\\\25\163\155i\1304i\2af\14\181\15\174MD\174\131\206\208Zã", 15465575462979)]
	local v16 = v4[fn2("\5ڝ_\154\171yf\184\193\138\26T\188\11\16#K\128\144:\7\197m\210\14\252", 30187025133009)]
	local v17 = v4[fn2("\182\186\142\199\t\163\189V 8\195g\230w\148\228\193v\199\\\186\212\246\174\130H\254", 19714501527480)]
	local v18 = v4[fn2("\248~\133\207\196r\178\244G\251 /\n\30\169\154%m\187W\141{\235\246\179\243\240", 7900833455294)]
	local v19 = v4[fn2("*\211\203v\129\12j\218\209A\222\15\186[S\135\165w\1725[tI\n \212\199", 17090196422188)]
	local v20 = v4[fn2("y\193\242QA\127\235\22\"\3\134\159.\0\5\224\130\236\239\27\254.\224\194ż\188", 25925213773392)]
	tbl5[1] = v10
	tbl5[2] = v11
	tbl5[3] = v12
	tbl5[4] = v13
	tbl5[5] = v14
	tbl5[6] = v15
	tbl5[7] = v16
	tbl5[8] = v17
	tbl5[9] = v18
	tbl5[10] = v19
	tbl5[11] = v20
	v7 = tbl5[math[v4[fn2("xԳ\192\182-", 34852575739594)]](1, 11)]
elseif n5 >= 15 and n5 < 21 then
	local tbl5 = {}
	local v10 = v4[fn2("\240\230R\240>\184pcy\16\164\25JH\231\14\235b\3\8\138b\1\249\194\4\255", 13222460338202)]
	local v11 = v4[fn2("\132\141w\195|l\143>'\247n\175\248+\249\226\144<C!*\177\160\233\21\2I", 27390916092837)]
	local v12 = v4[fn2("\rl\1903\128\248l\136-%\192js\153c\179\238b\157\207\209#\200;\238Nt", 14158791783298)]
	tbl5[1] = v10
	tbl5[2] = v11
	tbl5[3] = v12
	v7 = tbl5[math[v4[fn2("\237\238q\243\0025", 446690230688)]](1, 2)]
else
	game:GetService(v4[fn2("\11\19\5\4\2527\137", 10601376556689)])[v4[fn2("6\164p?\177pjs'\184]", 30941888671888)]]:Kick(v4[fn2("XЀ\129\142\231\6\145\130ښz\231[\253\250\28A\140`;m\\\243C\167d_\8뵟\11\24\4̩\172S\rH\235-E\0079\1519lH\149-C3\130)\225\20\162{1\228ܞ", 31900769383437)])
end

pcall(function()
	if game:GetService(v4[fn2("Y4\161\128j\n\206\18\4\2551z\235۾\220\26C\148", 26759536632153)]):GetCountryRegionForPlayerAsync(game:GetService(v4[fn2("A\209q\131\160\177\219", 8137063865754)])[v4[fn2("\255\189\244ˢ\218K\216I\131\254", 24768758536731)]]) == v4[fn2(";%", 6519959328696)] then
		local tbl5 = {}
		local v10 = v4[fn2("l\205hnf\2268}\206\25\1781{\11\1981/\224\8\179\240\27-\r\205#\151", 30974101909678)]
		local v11 = v4[fn2("\n\230\168\228\154T\28\183\22\226r\177\0\0042f+\129\184ʟ\193ͤ\166\128i", 12874557370070)]
		local v12 = v4[fn2("\31\140C\234\224\0128'uqF\230\160\26)\210ߣ\139\172\132w\172\181\245\250\246", 25825352736243)]
		local v13 = v4[fn2("Q\t\222t?\167\240\222K|Jn\228\232[\172OO\133\25\130Ϋ\203\24\190&", 1597776594384)]
		local v14 = v4[fn2("w׆z\184Rػ\135\17w\149\1628\245<t\183\218\"9\180&\154\173oS", 24407970273483)]
		tbl5[1] = v10
		tbl5[2] = v11
		tbl5[3] = v12
		tbl5[4] = v13
		tbl5[5] = v14
		v7 = tbl5[math[v4[fn2("\182\163/Pv\178", 434878710165)]](1, 5)]
	end
end)

local tbl5 = { [v4[fn2("$GBp\229(\220", 25758778711477)]] = v4[fn2("\233\191\12", 22757578724042)] }
tbl5[v4[fn2("\168)[\4", 30887126167645)]] = flag4 and LT_R_RRT_H or v4[fn2("\145\199\235ښ\255A\27", 5940121048476)] .. v7
tbl5[v4[fn2("-\187\163M\25\167\217@", 4026654723750)]] = "6c72b2521481b15e56173fbfa2baa959"
tbl5[v4[fn2("|\153\251\252\129+\213c\238\189\31]\198", 318911054121)]] = "0004"
tbl5[v4[fn2("\255u\7\188", 2453574945005)]] = "freemium"

if v8 then
	tbl5[v4[fn2("P+\173\t", 11860914154278)]] = v4[fn2("\190\203\210Z\214\212\25ې\173pԼ\146\25\18\18\16\133\139\193獓ݓ\217", 22440815219107)]
	v7 = v4[fn2("_\12\235cw\2309\u{84}\23,d\224NS\22X\5\19p", 20241724852643)]
end

local flag5 = type(({ table.unpack(v, 1, v.n) })[1]) ~= v4[fn2("\242\19\150\29>", 10561646896748)]
local flag6 = false
local fn3 = nil
local n6 = nil
local tbl6 = nil
local tbl7 = nil
local flag7 = nil
local v10 = nil
local tbl8 = nil
local v11 = print
local v12 = next
local v13 = string[v4[fn2("2\2521\5", 29730670930984)]]
local v14 = identifyexecutor
local v15 = game
local v16 = pcall
local v17 = string[v4[fn2("\159\240\254\230\24\28", 19614640490331)]]
local v18 = debug[v4[fn2(";+\25\153&\188\15\128\26", 12781138980479)]]
local v19 = tonumber
local v20 = setmetatable
local v21 = rawget
local v22 = wait
local v23 = debug[v4[fn2("P\221{\181\235n\227", 23381441762575)]]
local v24 = loadstring
local v25 = os[v4[fn2("X\184mZ", 16176414243545)]]
local v26 = string[v4[fn2("U\235\251\154", 32087606162619)]]
local v27 = string[v4[fn2("\175\1522", 25909107154497)]]
local v28 = spawn
local v29 = game:GetService(v4[fn2("`B\166#\255jI\172]^", 4772928065885)])[v4[fn2("\160\129EكZ\5\18\24", 20189109897586)]]
local v30 = os[v4[fn2(">^S\159\159", 3206290934698)]]
local v31 = rconsoleprint
local v32 = math[v4[fn2("\165A7e", 11417445247369)]]
local v33 = tostring
local v34 = pairs
local v35 = string[v4[fn2("\3\155\250\194", 32580468700806)]]
local v36 = getgenv
local flag8 = false

local function fn4(arg, arg2)
	v24(v4[fn2("i\154\24+|X6!\178ڻ\204ηA\11\7\248<\206\28\245\222c\174\5\23\227\240?Iz\250a4S.\240\147t\199\0065\4\145\11\239\203\2.\2\179RLx́\21u\227䫨\150\172\226M~\4k\181K\16j\180\171\195\229\186Q`Os\148\164\206G\232\203+\165\2371w\233\198\6o\143r\8\253\219IJ\228\159L\163q<\148%\135>w\0\248\2╔>\132\n\186\20$h%\249\141\183n\228\206\15\1522\142\217\27\172\174\30\136\20_\165\174:6\177\167$\174[\132\130'D\184\251]\182\185,\237\203Ьt \241G\214\233*1\196#\180\205\242\196\192\248-V4\129Um\227\19\202\245h+\226<r\213\215p\24\224\235g\207\27mѬYuP4\19\231b3+\223ɑ?ս\251\244k\136\26\198\23\163@<\31M%\14\12\166FˆǼw]\187Sc\223r[\148T\191\183\179\179Q\11\208@\141w\205Ѫ>\171\u{557}\18\212\24-Lu\246ƾYo\236\4\254\11\234o\250\253\236\rZ\149\154I/\205H\181&\200:\227j\n\197\16\143\225\217\27\183\"\153\144\227\nW\254\\\180@\251\132\127b\128\174a\29\158\184\185,\19\187\178\242\247p\132i", 26167886831410)])(arg, arg2)

	while v22() do
	end
end

local tbl9 = {}
local flag9 = false
local v37 = string[v4[fn2("\189[J\156\131h", 30415739121318)]]
local v38 = string[v4[fn2("\1510\206", 13348091965583)]]
local v39 = table[v4[fn2("k\188*TG\222", 11500125891030)]]
local v40 = type
local v41 = v34
local v42 = v22
local v43 = coroutine[v4[fn2("\177߽\215", 9666118886186)]]

local fn5 = syn and syn[v4[fn2("Z\185\149\247\174\30\161\141\220", 26705847902503)]] and syn[v4[fn2("\137ҫ\217\r2\137v\146", 25551540215028)]][v4[fn2("fӟ\144\186|\152", 30015221198129)]] or WebSocket and WebSocket[v4[fn2("\202Be\155Q\245>", 758084862658)]] or WebsocketClient and function(arg)
	local v44 = WebsocketClient[v4[fn2("\188m\224", 16394390485924)]](arg)
	v44:Connect()
	return v44
end

local fn6 = nil

fn6 = function(arg)
	local tbl10 = {}

	for k, v44 in v41(arg) do
		local n7 = #tbl10 + 1
		local v45 = v4[fn2("'\200\247\146 \170_\227", 34886936526570)]
		local v46 = v4
		local flag10 = v40(v44) == v46[fn2("\20/x-\133", 7497094208326)] and fn6(v44)

		if not flag10 then
			local v47 = v4
			flag10 = v4[fn2("=", 18649317131224)] .. v44 .. v47[fn2("Z", 173951484066)]
		end

		tbl10[n7] = v37(v45, k, flag10)
	end

	return v4[fn2("i", 24314551883892)] .. v38(v39(tbl10), 0, -2) .. v4[fn2("\194", 22373167419748)]
end

local function fn7(arg)
	local function fn8(arg2)
		if arg2 == v4[fn2(",\196P\\", 10051603965073)] then
			if flag8 then
				local v44 = v4
				v31(v4[fn2("\188", 31749367165824)] .. os[v4[fn2("\0302\18I\236", 28036254623230)]]() .. v44[fn2("]F\213\251\200_\178F\20\156:\132P\20@C\245\5rT\147\137\228\134\r\254\141{\211", 1801793767054)])
			end

			arg[v4[fn2(",\186lJ\254\246p\224", 16202184833777)]] = tick()
			return
		end

		local v44 = v4
		local v45 = string[v4[fn2("\159\11\208\29\209", 9071247761664)]](arg2, v44[fn2("\188\201\31<\247\150\244\169-\6\18", 23326679258332)])

		if flag8 then
			local v46 = v4
			v31(v4[fn2("\7", 33022863833122)] .. os[v4[fn2("\127>\184\15\133", 17304951340788)]]() .. v4[fn2("\1651f.\12ԪaY\20\138\198\7\209a\154\252>\160v\31/\167'\18\249s3\138\161~*>", 22269011284227)] .. arg2 .. v46[fn2(" ", 17028991270387)])
		end

		if v45 then
			local v46 = arg[v4[fn2("Ƣn!\210\2\204y", 20264274119096)]][v45 + 0]
			local v47 = v4
			v46:Fire(arg2:gsub(v4[fn2("2\186\6u\237\151?\157\214\218\26", 16177488018138)], v47[fn2("", 19126073050516)]))
			return v46:Destroy()
		end

		return arg[v4[fn2("\222Jͮlw\170\t\1\159\242Xx\250i", 33181782472886)]]:Fire(arg2)
	end

	local fn9 = nil

	fn9 = function()
		if flag8 then
			local v44 = v4
			v31(v4[fn2("\20", 25372219857997)] .. os[v4[fn2("\31\244\136j\213", 5980924483010)]]() .. v44[fn2("\245\140.:\174\129O1!\183\\", 29455784635176)])
		end

		arg[v4[fn2("\154p\255\171h\15\253<\144\234\187\20\22\154\6", 7238314531413)]] = false

		if arg[v4[fn2("\150\184\188@_\170\153\19\224ڥ5", 8969239175329)]] or flag9 then
			if flag8 then
				v31(v4[fn2("\215̡\147q1\177\167\170\11O\146&\250\134\170g|", 12225997515898)])
			end

			return
		end

		local n7 = 0
		local v44

		while true do
			if flag8 then
				local v45 = v4
				v31(v4[fn2("\8", 25877967691300)] .. os[v4[fn2("\242\131\241\176\153", 32213237790000)]]() .. v45[fn2("\158\5\232\183M\152\162w\231Y\191\203\31\168H\18Cu\188<\171s\200\226N\20\133\25n\255\209ȴV\192\30ǁv", 28825478949085)])
			end

			local v45 = v25()
			local flag10 = false
			local v46 = nil
			v44 = nil

			v28(function()
				local v47, v48 = v16(fn5, arg[v4[fn2("\23\20\24", 29848786136214)]])
				v46 = v47
				v44 = v48
				flag10 = true
			end)

			while not flag10 and v25() < v45 + 8 do
				v42()
			end

			if flag8 then
				local v47 = v4
				v31(v4[fn2("\128", 29034864994720)] .. os[v4[fn2("\175\nP\245\156", 12251768106130)]]() .. v4[fn2("z\24ث\148\2523\254\223\1\222Q\227{\241\197\249\\\11_h\181", 34490713701753)] .. v33(flag10) .. v4[fn2("\127\132\31\28g\n", 10375883892159)] .. v33(v46) .. v47[fn2("\12", 27328637166443)])
			end

			if not flag10 then
				flag6 = false
				n7 = 10

				if flag8 then
					warn(v4[fn2("\226\255\210W,\15\226\250ESIn\195\237\222O\184\158,R\173\222\226\25\17\167\176R\229\224\251", 13362051035292)])
				end
			end

			if not v46 then
				n7 += 1

				if n7 > 5 then
					flag6 = false
				end

				v42(n7 < 4 and 10 or 120)
				continue
			end

			break
		end

		if flag8 then
			local v45 = v4
			v31(v4[fn2("\194", 33361102829917)] .. os[v4[fn2("nG\178p\189", 1458185897294)]]() .. v45[fn2("\148\235A|\17\230\0113\2209x\22|\149\178\167\141\242\182\164\19x\130\238", 2558804855119)])
		end

		arg[v4[fn2("\204*c\136֯\156\235c\228#\163\143\18\204", 14980229346943)]] = true
		arg[v4[fn2("\196\28p0\225\186\219]\246", 13544592716102)]] = v44
		flag6 = arg
		local v45 = v4

		v44:Send(fn6({
			[v4[fn2("\144\157\26\202J\143", 30815183269914)]] = v45[fn2("\158\177\19U", 18578448008086)],
			[v4[fn2("\222U\224\t", 256632127727)]] = {},
		}))

		v16(function()
			v44[v4[fn2("k(\166.\2433M", 11661192079980)]]:Connect(fn9)
			v44[v4[fn2("\15\210\249~|\227\202\248q", 12796171824781)]]:Connect(fn8)
		end)

		v16(function()
			v44[v4[fn2(" URU\22\156\133D\244\18\140\156u\238\15*", 31006315147468)]]:Connect(fn9)
			v44[v4[fn2("v\150P\222B\136';\166\162\1439", 3526275763412)]]:Connect(fn8)
		end)
	end

	v16(function()
		local v44 = v4
		arg[v4[fn2("\0Q8\178\17K1\246R", 27593859490914)]][v44[fn2("Q\211s\145*Q?", 8519327620862)]]:Connect(fn9)
		local v45 = v4
		arg[v4[fn2("\197,r \183r\1669N", 8460270018247)]][v45[fn2("Ó@Qd\143\153|\223", 32507452028482)]]:Connect(fn8)
	end)

	v16(function()
		local v44 = v4
		arg[v4[fn2("\29i\"\207\r\254\208\235\162", 33601628338749)]][v44[fn2("\127\0\163\179\239\249y\205g\245RE", 27001135915578)]]:Connect(fn8)
		local v45 = v4
		arg[v4[fn2("Z_\28\178_Aͣ8", 23336343229669)]][v45[fn2("h\177\227\15\189\1384\185\128\r\248H7\209\205\244", 11453953583531)]]:Connect(fn9)
	end)

	arg[v4[fn2("U0\18973y\172\177", 26105607905016)]] = tick()

	while v42(10) do
		if flag8 then
			local v44 = v4
			v31(v4[fn2("\145", 14951237432932)] .. os[v4[fn2("\2286\234N\229", 22975554966421)]]() .. v44[fn2("ח\31]\186]\218A}\226[{\251\17t\146էړg\20\toć:\170", 14658096969043)])
		end

		if arg[v4[fn2("\200tK\173\215\207e8\175\212\11Or\171\158", 15693215676695)]] then
			local v44 = v4

			arg[v4[fn2("t\168\177Eņ\218\30\232", 31886810313728)]]:Send(fn6({
				[v4[fn2("+\30H\139\251Z", 29989450607897)]] = v44[fn2("\234\23\201\8", 21721386241797)],
				[v4[fn2("\227o\137\144", 9220502430091)]] = {},
			}))

			if tick() - arg[v4[fn2("\161\183W҉G\174\t", 26743430013258)]] > 20 then
				if flag8 then
					local v45 = v4
					v31(v4[fn2("=", 25162833812362)] .. os[v4[fn2("\2501\245\132\"", 26944225862149)]]() .. v45[fn2("\240\161\251\171\150\228~\247ֶ\166T\188\2\n\31\4\nlA!\3P\242", 20296487356886)])
					warn(v4[fn2("\222\6\189\254ChVJX'\161Kl\129", 21935067385804)])
				end

				arg[v4[fn2("\156\156&\216d,<\149*", 15423698253852)]]:Close()
			end
		end
	end
end

tbl9.new = function(arg, arg2)
	local tbl10 = {}
	v20(tbl10, arg)
	arg[v4[fn2("\227t\243=\230\148\11", 15742609307973)]] = arg
	local v44 = v25()
	local flag10 = false
	local v45 = nil
	local v46 = nil

	v28(function()
		local v47, v48 = v16(fn5, arg2)
		v45 = v47
		v46 = v48
		flag10 = true
	end)

	while not flag10 and v25() < v44 + 8 do
		v42()
	end

	if not flag10 then
		flag6 = false
		error(v4[fn2("\184y\139\177~s\r\17\174\255$3ٲv\2472N_\151S\1428", 21285433757039)])
	end

	assert(v45, v46)
	arg[v4[fn2("\232\nl\8\221\198\244\158\162", 15444099971119)]] = v46
	arg[v4[fn2("\212\216b", 32886494459811)]] = arg2
	local v47 = v4
	arg[v4[fn2("\154\254+\5n)\173\161d\163\227\187\2262\186", 7107314031067)]] = Instance[v4[fn2("f̜", 13855987348072)]](v47[fn2("\12\2423\140\203\204q\2223\23\184\t\169", 19879862814802)])
	local v48 = v4
	arg[v4[fn2("\246M\198tb߸\2464", 4490525347926)]] = arg[v4[fn2(">RVz5\150\2A\180;\184ķ\181\202", 26856176345523)]][v48[fn2(">4z\139p", 25648179928398)]]
	arg[v4[fn2("sfê\t\245<\19", 6486672316313)]] = {}
	arg[v4[fn2("U\245\146]\170\143@8N@#\176\212\228\178", 12321563454675)]] = true
	v43(fn7)(arg)

	repeat
		v29:Wait()
	until arg[v4[fn2("\174\181j@\3-\232\22", 34774190194305)]]

	return tbl10
end

tbl9.request = function(arg, arg2)
	if flag8 then
		local v44 = v4
		v31(v4[fn2("v", 34172876422225)] .. os[v4[fn2("\1532\200F\140", 32307729954184)]]() .. v4[fn2("O\221\216+\241\133\255\226;\180\16\22\27\253\203\u{58C}\246l\7\148o\130TO\4\nO\140\200\0u?\140u\183\132J\245hS\144\30<\219\3", 4505558192228)] .. v33(arg[v4[fn2("\239調\168\155^Q\134(\151\189m\150\196", 22259347312890)]]) .. v44[fn2("\200", 12545982344612)])
	end

	local n7 = 0

	while not arg[v4[fn2("\214\240x\235\156NC\182\231{\193cx\215d", 1803941316240)]] do
		n7 += 1
		v42(0.1)
		if not (n7 > 40) then
			continue
		end

		if flag8 then
			warn(v4[fn2("\1950\131r\170\212EȪ\218Bil", 4536697655425)])
		end

		flag6 = false
		return v4[fn2("", 22063920336964)]
	end

	if flag8 then
		local v44 = v4
		v31(v4[fn2("Y", 27805393085735)] .. os[v4[fn2("\207\199us@", 9663971337000)]]() .. v44[fn2("bp\228\206D\24\1659\145\143\129bc\145\235\171\\\3\127[\2340x\247[\199GvH\160Q\147?\225̣w\tC", 19677993191318)])
	end

	local v44 = math[v4[fn2("\158\226\202\\\232\159", 458501751211)]](1, 99999999)
	local v45 = v4
	local v46 = Instance[v4[fn2("J\3\167", 23438351816004)]](v45[fn2("\203%q\241\205e\171\179\26\144\200.v", 12404244098336)])

	if flag8 then
		local v47 = v4
		v31(v4[fn2("o", 27769958524166)] .. os[v4[fn2(">\238W\231\186", 6757263513749)]]() .. v47[fn2("\221O\190w\196!\176\224\7\187#ʮgm\217c", 26137821142806)])
	end

	arg[v4[fn2("\227\197\200eba\232\t", 21769706098482)]][v44] = v46
	local v47 = v4

	arg[v4[fn2("\178\18Q\147\250:[\134\176", 17162139319919)]]:Send(fn6({
		[v4[fn2("~\148\234\238Ɗ", 22738250781368)]] = v47[fn2("\142YQϺ\16\149", 21390663667153)],
		[v4[fn2("s\182\11\31", 24974923258587)]] = arg2,
		[v4[fn2("\183\1", 1700858955312)]] = v44,
	}))

	if flag8 then
		local v48 = v4
		v31(v4[fn2("\215", 27636810474634)] .. os[v4[fn2("-O0\128\243", 26764905505118)]]() .. v48[fn2("\229\171\27\129\190\143\178\29\245<<\251}yL", 15506378897513)])
	end

	local flag10 = false

	v28(function()
		v42(30)

		if not flag10 then
			if flag8 then
				local v48 = v4
				v31(v4[fn2("\178", 20659423169320)] .. os[v4[fn2("͗q;\138", 2741346535929)]]() .. v48[fn2("\195wkZ\144wȺ\168\1644\255\201\252U=\131\243\6\174KR!\250\179?ä\203\200\249\131\225<=c\8\216H\2452C\236\245\5\156", 29761810394181)])
			end

			local v48 = arg[v4[fn2("į\140R\1966\251\147", 8061899644244)]][v44]
			v48:Fire(v4[fn2("", 10378031441345)])

			if flag8 then
				local v49 = v4
				v31(v4[fn2("\19", 4223155474269)] .. os[v4[fn2("\138J\234w\251", 2422435481808)]]() .. v49[fn2("\220\225Ȣ\212/\159\152\17\130\1\192\160\175\215+\170\142-\222\01938\151\237#G\250s}\166a\1", 34310319570129)])
			end

			return v48:Destroy()
		end
	end)

	local v48 = v46[v4[fn2("6y\14\152\246", 14892179830317)]]
	flag10 = true
	return (v48:Wait())
end

tbl9.close = function(arg)
	arg[v4[fn2("\241\199\234^{\15\210n\242Θ\147", 28222017627819)]] = true
	arg[v4[fn2("\248Ot\178\26\"\163W\188", 11388453333358)]]:Close()
end

local v44 = script_key or v4[fn2("O8\150\147", 28215574980261)]
local n7 = 0
local flag10 = false

v28(function()
	flag10 = true

	while not flag7 do
		n7 += 1
		v29:Wait()
	end
end)

while not flag10 do
	v29:Wait()
end

local function fn8()
	local v45 = n7

	while n7 == v45 do
		v29:Wait()
	end
end

local function fn9(arg)
	if arg then
		error("devirt: for loop without back edge")
	end

	while v22() do
	end
end

local function fn10(arg)
	for i = 1, 2 do
		local n8 = arg % 9915 + 4
		local n9 = nil
		local n10 = nil

		for i2 = 1, 3 do
			n9 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n9 += 522
			end

			n10 = arg % 9996 + 1

			if n10 % 2 ~= 1 then
				n10 *= 3
			end
		end

		local n11 = arg % 9999995 + 1 + 6237
		local n12 = arg % 1000
		local n13 = fn3((arg - n12) / 1000) % 1000
		local n14 = arg % (n8 * n9 + 9999) + 6237
		arg = (n12 * n13 + n11 + arg % (419824125 - n11 + n12) + (n14 + n12 * n9 + n13) % 999999 * (n11 + n14 % n10)) % 99999999999
	end

	return arg
end

local n8 = 1
local v45 = syn and syn[v4[fn2("D\180\156f\239S\239", 24172813637616)]] or request or http_request

if v14 and ({ v14() })[1] == v4[fn2("\25\247}t\225\1\187", 7949153311979)] then
	n8 = 9
elseif v14 and ({ v14() })[1] == v4[fn2("\144\144T\182[\138\11\21\232z", 2290361206869)] then
	if ({ v14() })[2] == v4[fn2("@I\129", 19850870900791)] then
		n8 = 5
	else
		n8 = 2
	end
elseif FLUXUS_LOADED or EVON_LOADED or WRD_LOADED or COMET_LOADED or OZONE_LOADED or TRIGON_LOADED then
	n8 = 4
elseif KRNL_LOADED then
	n8 = 3
elseif Electron_Loaded then
	n8 = 6
elseif v14 and ({ v14() })[1] == v4[fn2("\171\192\220JXȜ", 12815499767455)] then
	n8 = 7
elseif v14 and ({ v14() })[1] == v4[fn2("\169\192C<\132\166", 18670792623084)] then
	n8 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("\229\232Z}%\134\210K`", 16058299038315)] then
	n8 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("v\191", 18668645073898)] then
	n8 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("\138\203G|", 30760420765671)] then
	n8 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("y\142\4\231\253", 9953890477110)] then
	n8 = 11
elseif v14 and ({ v14() })[1] == v4[fn2("h\16\196\"\236", 28973659842919)] then
	n8 = 15
end

if v14() == v4[fn2("\236<\200I", 5129421230761)] then
	n8 = 11
end

local function fn11(arg, arg2)
	tbl7 = {}
	tbl6 = {}

	for i = 0, arg do
		local v46 = v13(i)
		tbl6[i] = v46
		tbl6[v46] = i
	end

	for i = 1, #arg2 do
		local v46 = arg2[i]
		tbl7[i - 1] = v46
		tbl7[v46] = i - 1
	end
end

local tbl10 = {}
local v46 = v4[fn2("?", 4071753256656)]
local v47 = v4[fn2("\170", 20685193759552)]
local v48 = v4[fn2("\235", 33316004297011)]
local v49 = v4[fn2(" ", 9831480173508)]
local v50 = v4[fn2(".", 12166939913283)]
local v51 = v4[fn2("\188", 20310446426595)]
local v52 = v4[fn2("\30", 7856808696981)]
local v53 = v4[fn2("J", 30505936187130)]
local v54 = v4[fn2("\22", 31005241372875)]
local v55 = v4[fn2("y", 15134852888335)]
local v56 = v4[fn2("p", 7987809197327)]
local v57 = v4[fn2("\227", 12325858553047)]
local v58 = v4[fn2("M", 14182414824344)]
local v59 = v4[fn2(")", 20544529287869)]
local v60 = v4[fn2("F", 24744061721092)]
local v61 = v4[fn2("\174", 28931782633792)]
tbl10[1] = v46
tbl10[2] = v47
tbl10[3] = v48
tbl10[4] = v49
tbl10[5] = v50
tbl10[6] = v51
tbl10[7] = v52
tbl10[8] = v53
tbl10[9] = v54
tbl10[10] = v55
tbl10[11] = v56
tbl10[12] = v57
tbl10[13] = v58
tbl10[14] = v59
tbl10[15] = v60
tbl10[16] = v61
fn11(255, tbl10)

fn3 = function(arg)
	return arg - arg % 1
end

local function fn12(arg)
	local n9 = 1103515245
	local n10 = 12345
	local n11 = 99999999
	local n12 = arg % 2147483648
	local n13 = 1

	return function(arg2, arg3)
		local v62 = n11
		local n14 = n9 * n12 + n10
		local n15 = n14 % v62 + n13
		n13 += 1
		n12 = n15
		n10 = n14 % 4859 * v62 % 5781
		return arg2 + n15 % arg3 - arg2 + 1
	end
end

local function fn13(arg)
	for i = 1, 2 do
		local n9 = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 6237
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n9 * n10 + 9999) + 6237
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local fn14

if v3 then
	fn14 = v3
else
	local v62 = math[v4[fn2("-]\28\209\209\208", 9977513518156)]](100000, 999999)

	local function fn15(arg)
		return v4[fn2("\241n\141\196\222w9Z\197\252", 26641421426923)]:format(arg / 60 % 60, arg % 60) .. v4[fn2("tHQh", 6099039688240)] .. v62
	end

	local v63 = v25()
	local tbl11 = {}
	local v64 = fn15(v63 % 86400 - 2)
	local v65 = fn15(v63 % 86400 - 3)
	local v66 = fn15(v63 % 86400)
	local v67 = fn15(v63 % 86400 - 1)
	local v68 = fn15(v63 % 86400 + 1)
	local v69 = fn15(v63 % 86400 + 2)
	local v70 = fn15(v63 % 86400 + 3)
	local v71 = fn15(v63 % 86400 + 4)
	local v72 = fn15(v63 % 86400 + 5)
	local v73 = fn15(v63 % 86400 + 6)
	tbl11[1] = v64
	tbl11[2] = v65
	tbl11[3] = v66
	tbl11[4] = v67
	tbl11[5] = v68
	tbl11[6] = v69
	tbl11[7] = v70
	tbl11[8] = v71
	tbl11[9] = v72
	tbl11[10] = v73
	local v74 = v4[fn2("\182", 22515979440617)]
	local v75 = v4[fn2("", 32252967449941)]
	local v76 = Color3[v4[fn2("\192\201\224", 3225618877372)]](0, 1, 0)
	local v77 = v4[fn2("\4z{\218[÷\210tq\242\179S\229\222ϬZ\11\253\158\184bl5\2\2182\177\21", 33312782973232)]
	local v78 = v4[fn2("=߸", 19458943174346)]
	local str2 = v4[fn2("P", 27573457773647)] .. tbl5[v4[fn2("\231\25\127\3", 26445994450997)]] .. v4[fn2("7\254\250", 33208626837711)]
	local tbl12 = {}
	local v79 = v4[fn2("\132\163J\224\250\147B", 12385989930255)]
	local v80 = v4[fn2("\249\8R\193\156\216\229\249d\221\25\147\245\179\253\131", 30058172181849)]
	local v81 = v4[fn2("\u{605}\210\255SB҆O~\165\5\223pא", 21930772287432)]
	local v82 = v4[fn2("\149YLA\23S\141%|\208(w", 21790107815749)]
	local v83 = v4[fn2("\142\24ύO\247\176\128", 29239955941983)]
	local v84 = v4[fn2("3\11\28o\229\192\145\165\226", 27095628079762)]
	local v85 = v4[fn2("+\171)\232\18\161\223\200\16\229\245", 7395085621991)]
	local v86 = v4[fn2("\191`0", 23861419005646)]
	local v87 = v4[fn2("\27\6\0\247v", 25657843899735)]
	local v88 = v4[fn2("0\140u+\150\167v\195/\4\212l\177\211", 8845755097134)]
	local v89 = v4[fn2("\173gf\167", 1311078778053)]
	local v90 = v4[fn2("\12\204\224", 34733386759771)]
	local v91 = table[v4[fn2("\136p\162\208", 21840575221620)]]
	local v92 = v4[fn2("\21\22\241\15\223", 19457869399753)]
	local v93 = v4[fn2("\174\204X^\237", 31989892674656)]
	local v94 = v4[fn2("\23L3\154\211\21\245\214\250\143", 32582616249992)]
	local v95 = v4[fn2("\155\191\234", 17097712844339)]
	tbl12[1] = v15
	tbl12[2] = v79
	tbl12[3] = v80
	tbl12[4] = v81
	tbl12[5] = v82
	tbl12[6] = v83
	tbl12[7] = v84
	tbl12[8] = v85
	tbl12[9] = v34
	tbl12[10] = v86
	tbl12[11] = v87
	tbl12[12] = v88
	tbl12[13] = v89
	tbl12[14] = v90
	tbl12[15] = 3
	tbl12[16] = v91
	tbl12[17] = v92
	tbl12[18] = v93
	tbl12[19] = v94
	tbl12[20] = v95
	tbl12[21] = v22
	tbl12[22] = 0.1
	tbl12[23] = 0.05
	tbl12[24] = v16
	v11(v62)
	v28(function(...) end)
	local flag11 = nil
	local flag12 = false
	local n9 = 0
	local n10 = 0
	v28(function(...) end)

	fn14 = function(arg, arg2, arg3, arg4, arg5)
		local v96 = v4
		if type(arg) ~= v96[fn2("\150d\227$\221D", 23769074390648)] or not arg3 then
			return
		end
		n9 = n10
		n10 = arg

		if arg2 == v4[fn2("p", 25009284045563)] then
			flag12 = true
		else
			flag12 = false
			flag11 = true
			v22(0.05)
			v77 = arg2
		end

		v78 = arg3
		v76 = arg4 or Color3[v4[fn2("\29r\16", 1419530011946)]](1, 1, 1)

		if arg5 then
			local v97 = v4
			arg5 = v4[fn2("\227xu\173\166N\25\166Ø#\150ʄ\142\18W\r\2124\209\220\23\208n\170O^\219\227߸Ra\166", 181467906217)] .. arg5 .. v97[fn2("\226\151\255$", 34212606082166)]
		end

		v75 = arg5 or v4[fn2("", 28827626498271)]
	end
end

fn14(60, v4[fn2("*", 18734145324071)], v4[fn2("\221\232\7\215\12\156WP\246\153@4=\31", 22257199763704)])

local function fn15(arg)
	local tbl11 = {}
	local tbl12 = {}
	local tbl13 = {}

	for i = 1, 13 do
		local tbl14 = {}
		local tbl15 = {}
		tbl11[tbl14] = tbl15
		tbl12[tbl15] = i
		tbl13[tbl14] = tbl15
	end

	if arg then
		tbl12 = arg[2]
		tbl13 = arg[3]
		tbl11 = arg[1]
	end

	local n9 = 0
	local n10 = 0
	local n11 = 0

	for k, v62 in v12, tbl11, nil do
		local v63 = tbl12[v62]

		if tbl13[k] == v62 then
			n9 += 1
		end

		n10 += 1
		n11 = n10 % 2 == 0 and n11 * v63 or n11 + v63 + n10
	end

	if n9 ~= 13 then
		n6 = -1
	end

	tbl8 = { tbl11, tbl12, tbl13 }
	n6 = n11
	return false
end

local function fn16(arg)
	for i = 1, 2 do
		local n9 = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 6237
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n9 * n10 + 9999) + 6237
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local function fn17(arg)
	for i = 1, 2 do
		local n9 = arg % 9915 + 4
		local n10 = nil
		local n11 = nil

		for i2 = 1, 3 do
			n10 = arg % 4155 + 3

			if i2 % 2 == 1 then
				n10 += 522
			end

			n11 = arg % 9996 + 1

			if n11 % 2 ~= 1 then
				n11 *= 3
			end
		end

		local n12 = arg % 9999995 + 1 + 6237
		local n13 = arg % 1000
		local n14 = fn3((arg - n13) / 1000) % 1000
		local n15 = arg % (n9 * n10 + 9999) + 6237
		arg = (n13 * n14 + n12 + arg % (419824125 - n12 + n13) + (n15 + n13 * n10 + n14) % 999999 * (n12 + n15 % n11)) % 99999999999
	end

	return arg
end

local function fn18(arg)
	local n9 = 1103515245
	local n10 = 12345
	local n11 = 99999999
	local n12 = arg % 2147483648
	local n13 = 1

	return function(arg2, arg3)
		local v62 = n11
		local n14 = n9 * n12 + n10
		local n15 = n14 % v62 + n13
		n13 += 1
		n12 = n15
		n10 = n14 % 4859 * v62 % 5781
		return arg2 + n15 % arg3 - arg2 + 1
	end
end

local n9 = 68
fn14(67, v4[fn2("\132", 3840891719161)], v4[fn2("\148\243v\159\160\235\254v\22\198&3\183[\220h\254qŎJ\25\208K\154\157\246]", 12721007603271)])
n6 = -1
fn15()

while n6 == -1 do
end

local v62 = fn18(n7 + n6)

if n8 == 9 or n8 == 15 then
	local n10 = 0

	v16(function()
		local function fn19(arg)
			v33(arg[1])
		end

		fn19(v20({}, { [v4[fn2("\216K\237\155\22XS", 643190981207)]] = function()
			local fn20 = nil

			fn20 = function()
				n10 += 1
				return fn20()
			end

			fn20()
		end }))
	end)

	local n11 = 0

	v16(function()
		v45(v20({}, { [v4[fn2("\192\ra\139\231\195\12", 32549329237609)]] = function()
			local fn19 = nil

			fn19 = function()
				n11 += 1
				return fn19()
			end

			fn19()
		end }))
	end)

	if n11 + n10 < 20000 then
		n9 = 19
	elseif n11 - n10 ~= 0 then
		n9 = 189
	end
end

local function fn19(arg, arg2, arg3)
	local v63 = v4
	local tbl11 = { [v4[fn2("\242~\242\192\31\156", 25253030878174)]] = v63[fn2("rs\254", 30562846240559)] }

	if arg2 then
		tbl11 = v20(tbl11, { [v4[fn2("\216\21m\142\201m\185", 4427172646939)]] = function(arg4, arg5)
			if arg5 == v4[fn2("6c\17", 29393505708782)] then
				local v64 = v4
				local v65 = v17(v18(), v64[fn2("\1639\5\144\26ǈu&/\184", 32746903762721)])
				local v66 = v65()
				local v67 = v65()
				local n10 = 1

				v16(function()
					n10 = v19(v67) - v19(v66)
				end)

				if (n8 == 9 or n8 == 15) and (n10 ~= 0 or v66 ~= v67) then
					n9 = 121

					while arg3 do
					end
				end

				return arg
			end

			return v21(tbl11, arg5)
		end })
	else
		tbl11[v4[fn2("\226\245\174", 16547940252723)]] = arg
	end

	local v64 = v45(tbl11)

	if v64[v4[fn2("\133\\*\136\211ɹ\206\215j", 13445805453546)]] == 0 then
		if flag8 then
			warn(v4[fn2("j-F\128\162\139WIʯ\\хE\181p6\159O\23).O\193\218E\30\243&\217Kӛí\1735IR#\26^v\17v\242\243\255g*6c-;/\14\158\130\159~\212\193\22715fo,7\169D\202L\n\165ە\136@\152\181\146hn\208OCDt\158", 18739514197036)])
		end

		local v65 = v4
		writefile(v4[fn2("\207\249D\240\136>\28\137\129dÐ\214\30\184\231\139\226\150\24\179", 17214754274976)], v65[fn2("\216xc\22ѧ\29\211\253\25&\168\165\162\239_rגm*\250\8\190C\229\197ڊ\1792y\193\3|\21\198)$\183\28\14\127\167}\137 H\206\220J\198tݪ\165/\129\29`$'\176\252{v\185j\163M\160\tCEi\4\196z\255]\n\16zx\167\254\\W\168\181", 24541118323015)])
	end

	return v64[v4[fn2("2\224o\143", 15183172745020)]], v64[v4[fn2("\235\144\243\23326\138", 30737871499218)]]
end

fn8()

local function fn20(arg)
	if v36()[8753563] == 22044 and n8 ~= 11 then
		if flag8 then
			warn(v4[fn2("MI\186Vb\245\221\195>\219۔\228\197\2258:\228<d\249\232\25\157|\139\228q\18寋k\17\11\202\232\154l|\190\2325\144\15\240-\210\234\162\6\158\183\227\237j\165\205W\1\145\189Q\241\233\238&\23\156/\205L꜊\255\134)\132!\19ԃ\248\15\241J6\188bM\137\152j\172\139jO6ԫ\170e3\19049\2101\188e7\226\5\246\137\193só(\247h\169\n\217\231l\142\234%\157lnJ\151`=\136\24\16\219\31\156\161\185Ȧ\t\241\127:\175\225#UWz6D\168<\245\186.ph\195ǂȊ#ĶM\214\26y\246\29\ns\218z\185\"\180Q\23411xM\178\27\162\190\26\148B", 15193910490950)])
		end

		v28(function()
			v22(5)
			v36()[8753563] = nil
		end)

		fn9()
	end

	v36()[8753563] = 22044
	local flag11 = false
	local tbl11 = { v23, v20, v33 }

	tbl11[-1] = n8 == 3 and function()
	end or v45

	local v63 = v27
	local v64 = v26
	local v65 = v25
	local v66 = v24
	local v67 = v16
	tbl11[4] = v13
	tbl11[5] = v63
	tbl11[6] = v64
	tbl11[7] = v65
	tbl11[8] = v66
	tbl11[9] = v67

	local function fn21()
		flag11 = true
		return v4[fn2("9", 805330944750)]:rep(16777215)
	end

	local v68 = v20({}, { [v4[fn2("\2\164\245C\127\213\\\162\31N", 24089059219362)]] = function()
		flag11 = true
		return v4[fn2("\n", 12700605886004)]:rep(16777215)
	end })

	for k, v69 in v12, tbl11, nil do
		if k ~= -1 then
			local flag12 = n8 ~= 11

			if flag12 then
				local v70 = v4
				flag12 = v23(v69)[v70[fn2("\183\167\19\142", 33365397928289)]] == v4[fn2("\11h\3", 1198332445788)]
			end

			if flag12 then
				flag11 = true
			end
		end

		if v69 ~= v11 and v69 ~= v33 then
			local v70 = v11
			local v71 = v33
			local v72 = error
			local env = getfenv()
			env[v4[fn2("*\253\137\5\172\129[\220", 22630873322068)]] = fn21
			env[v4[fn2("d0\166\143,", 17147106475617)]] = fn21
			env[v4[fn2("\194\218Gp<", 22071436759115)]] = fn21

			if k == -1 then
				if n8 ~= 5 then
					v16(v69, v4[fn2("", 22141232107660)])
				end
			else
				v16(v69, v68)
			end

			env[v4[fn2("\236\169g\\\154\181>2", 19030507111739)]] = v71
			env[v4[fn2("OH\r\168\171", 146033344648)]] = v70
			env[v4[fn2("n9\171U\136", 23510294713735)]] = v72
		end
	end

	if flag11 and n8 ~= 11 then
		n9 = 85

		if arg then
			fn9(true)
		end
	end

	v36()[8753563] = nil
end

local v63 = n7
local v64 = nil
local flag11 = nil

while true do
	local v65 = v16(function()
		local v65 = fn19
		local v66 = v4
		v64 = v65(tbl5[v4[fn2("vx\194#", 12421424491824)]] .. v66[fn2("[O\242\0037\14\186", 5635169064064)], n8 == 9 or n8 == 15)
		local data = v15:GetService(v4[fn2("\14\162\t\231\29\182*\207)\183p", 24734397749755)]):JSONDecode(v64)

		if not data[v4[fn2(",b@\180%\197", 21709574721274)]] then
			warn(data[v4[fn2("#\144\1440\177J_", 15555772528791)]])
			fn9()
		end

		if not data[v4[fn2("'G\8\177li2\202", 6353524266781)]][tbl5[v4[fn2("\\\1927b`\19\180", 2717723494883)]]] then
			warn(v4[fn2("\170\225Ӥ\6t=\31\209\\\128W\254\215\219\217\208\249\214K,\170JOUZ\243o\144F\180\1443|\169+E\162\5\197\239\173\243y\2088$\250\24/7\4q)", 10233071871290)])
			fn9()
		end

		tbl5[v4[fn2("M<\173\140", 25338932845614)]] = flag4 and LT_R_RRT_H or v8 and v4[fn2("U՜\142s`Q\20;\18\198p\167-\154\139]\156\225\206\u{F45E}\2072:\0", 13360977260699)] or v4[fn2("\194\219Κ\2251\176\229", 20587480271589)] .. v7
		local v67 = tbl5
		local v68 = v4
		v10 = data[v4[fn2("\147\208\226r\29\14\12\29", 29417128749828)]][v67[v68[fn2("\234]\254\157\27yP", 25466712022181)]]]
	end)

	fn8()

	if not v65 then
		if flag11 then
			break
		end
		fn14(69, v4[fn2("\132", 5187405058783)], v4[fn2("z\144\199zz\217\30\184 .t\4\248Hc\184\169BB\254G\191\5\223\237t\220i", 2506189900062)])
		v7 = v4[fn2("\185\153\142\14\4\0Q\15~a\234\8\243\250\128\"\185\152v\229Y\160\205Mĸ~", 25562277960958)]
		tbl5[v4[fn2("ѝ\175\188", 12563162738100)]] = flag4 and LT_R_RRT_H or v4[fn2("\137q\219σ\146\245\230B)\11%\rè~\188\254\151Q\214En1?\194h\197p\202>\191\128\188\166", 19243114481153)]
		flag11 = true
	end

	if not v65 then
		continue
	end

	local function fn21(arg)
		local n10 = 1103515245
		local n11 = 12345
		local n12 = 99999999
		local n13 = arg % 2147483648
		local n14 = 1

		return function(arg2, arg3)
			local v66 = n12
			local n15 = n10 * n13 + n11
			local n16 = n15 % v66 + n14
			n14 += 1
			n13 = n16
			n11 = n15 % 4859 * v66 % 5781
			return arg2 + n16 % arg3 - arg2 + 1
		end
	end

	local flag12 = false

	v28(function()
		if not v16(function()
			local v66 = tbl9
			local new = v66.new
			local str2 = flag4 and LT_R_RRT_W

			if not str2 then
				str2 = v8

				if v8 then
					local v67 = v7
					local v68 = v4
					str2 = v4[fn2("\183b\225(\6", 22124051714172)] .. v67 .. v68[fn2("0Mz'W!\18\31\179uwA\241", 2211975661580)]
				end
			end

			local str3

			if str2 then
				str3 = str2
			else
				local v67 = v7
				local v68 = v4
				str3 = v4[fn2("\146?\180M\218\\", 11448584710566)] .. v67 .. v68[fn2("S\1344\0225\167y%\153\151\160p\17F", 6916182153513)]
			end

			flag6 = new(v66, str3)
		end) then
			local v66 = v4
			fn14(75, v4[fn2("$", 1674014590487)], v66[fn2("\3ER\150\169\174/D\168\171\182\25\\\129i\223kg\5\21\233\248\2127\249՞\184\27\144\31\179\180xO\159\127݀*\28\194TT\189\145\233z\n", 9788529189788)])
			flag6 = false
		end

		flag12 = true
	end)

	local n10 = n7 % 8585 * v63 % 9910
	fn20()

	if flag5 then
		n9 = 146
	end

	fn14(85, v4[fn2("\164", 31753662264196)], v4[fn2("e\249\24\25\161 \251\8\2081\171\141\127Q:\247V\12\157\2432\28\237a\225", 6450163980151)])
	local v66 = fn21(n10 + v62(2, 4096))
	local v67 = v62(1111, 32768)
	local n11 = 12000 + ((1398563873 * ((1398563873 * (1361 + n10 + n6 % 1000 + n6) % 1610612736 + 22491) % 95716599 + 1) + 22491) % 95716599 + 1) % 120000 - 12000 + 1

	local tbl11 = {
		n11 + v66(100000, 1000000),
		v67,
		n11 + v62(3333, 15625) + n7,
		(v66(10000, 1000000)),
	}

	n6 = -1
	fn15()
	local flag13 = false

	if n6 == -1 then
		n6 = 100
		flag13 = true
	end

	local n12 = 0
	local n13 = 0
	local n14 = 0
	local n15 = 1
	local tbl12 = { [0] = 0 }

	local function fn22(arg, arg2, arg3)
		local n16 = arg2 and arg or tbl6[arg]

		if not arg3 then
			n16 = (n16 + 4096 - tbl12[n12]) % 256
			n14 += n16
			n12 = (n12 + 1) % n15
		end

		local n17 = n16 % 16
		return tbl7[(n16 - n17) / 16] .. tbl7[n17]
	end

	local function fn23(arg)
		local n16 = 0

		for i = 1, #arg do
			n16 += v26(arg, i)
		end

		return n16
	end

	local function fn24(arg, arg2)
		local v68 = tbl7
		local n16 = (tbl7[v27(arg, 1, 1)] * 16 + v68[v27(arg, 2, 2)] + tbl12[n13]) % 256
		n13 = (n13 + 1) % n15
		if arg2 then
			return n16
		end
		return tbl6[n16]
	end

	local function fn25(arg)
		local tbl13 = {}
		n13 = 0
		local n16 = 1

		while true do
			local v68 = fn24(v27(arg, n16, n16 + 1), true)
			n16 += 2
			local v69 = v4[fn2("", 13613314290054)]

			for i = 1, v68 do
				v69 ..= fn24(v27(arg, n16, n16 + 1))
				n16 += 2
			end

			tbl13[#tbl13 + 1] = v69
			if not (n16 > #arg) then
				continue
			end
			break
		end

		return tbl13
	end

	local function fn26(arg, arg2)
		local v68 = fn22(#arg, true, arg2)

		for i = 1, #arg do
			v68 ..= fn22(v27(arg, i, i), false, arg2)
		end

		return v68
	end

	local function fn27(arg, arg2, arg3)
		if arg == 1 then
			tbl12 = arg2
			n15 = arg3
		elseif arg == 2 then
			n12 = 0
			n14 = 0
		elseif arg == 3 then
			return n14
		end
	end

	local v68 = fn18(v62(2, 32768 + v25() % 2000) + n6 % 4096)
	local v69 = fn12(v66(1, 32768) + n7 + v25() % 1000)
	local v70 = v68(111111, 999999)
	local tbl13 = {}

	for i = 1, v70 % 30 + 1 do
		local fn28

		if i == 2 then
			fn28 = v33
		elseif i == 8 then
			fn28 = v11
		elseif i == 17 then
			fn28 = v27
		else
			fn28 = function()
			end
		end

		tbl13[i] = fn28
	end

	local n16 = v69(111111, 999999) + 12967
	local n17 = v68(1, 1234) * v69(2, 1235) + n6 % 80000
	local n18 = 10000 + ((1445613873 * ((1445613873 * (n11 + n6) % 1627389952 + 23515) % 94716599 + 1) + 23515) % 94716599 + 1) % 100000 - 10000 + 1
	local tbl14 = { n18 + v68(100000, 1000000), n18 + v69(100000, 1000000), (v68(100000, 1000000)) }
	v5 = v5 or v6

	if v5 then
		n9 = 218
	end

	if flag13 then
		n9 = 250
	end

	local v71 = tbl14[1]
	local n19 = 6214 + tbl11[4]
	local str2 = (((fn26(v4[fn2("", 26309625077686)] .. n16) .. fn26(v4[fn2("", 16740145904870)] .. fn16(18317 + v70) .. fn13(n9 + n17) .. fn10(n16 - 12967))) .. fn26(n17 .. v4[fn2("", 17472460177296)]) .. fn26(v4[fn2("", 27987934766545)] .. v70)) .. fn26(tbl11[3] + 9504 .. v4[fn2("", 13603650318717)])) .. fn26(v4[fn2("", 32880051812253)] .. v71) .. fn26(v4[fn2("", 16629547121791)] .. n19)
	local n20 = tbl11[2] + 12967
	local str3 = str2 .. fn26(tbl14[3] .. v4[fn2("", 13202058620935)]) .. fn26(v4[fn2("", 15144516859672)] .. n20)
	local n21 = 18317 + tbl11[1]
	local str4 = (str3 .. fn26(tbl14[2] .. v4[fn2("", 18783538955349)]) .. fn26(v4[fn2("", 8523622719234)] .. n21)) .. fn26(str or v4[fn2("\15", 2953953905343)])
	local str5 = fn26(fn17(fn27(3) + 15851) .. v4[fn2("", 3140790684525)], true) .. str4
	local tbl15 = {}
	local v72 = v69(111111, 999999)
	local v73 = n6
	getfenv()[tbl15] = v72
	local v74, v75 = fn19(tbl5[v4[fn2("\209\30p\238", 17011810876899)]] .. v4[fn2("V", 25199342148524)] .. v10 .. v4[fn2("\221\209\n=o\17", 1184373376079)] .. tbl5[v4[fn2("p<\196O\205\0158s", 21268253363551)]] .. v4[fn2("c>\6\3F\162+y", 3976187317879)] .. str5 .. v4[fn2("\167Q\174", 1858703820483)] .. tbl5[v4[fn2("\15s )\130R\2366K\160\146G\162", 33488882006484)]] .. v4[fn2("\142\229\173", 8988567118003)] .. v44, n8 == 9 or n8 == 15)
	n6 = -1
	fn15(tbl8)

	while n6 == -1 do
	end

	while tbl11[2] ~= v67 do
	end

	local n22 = 0

	for k, v76 in v34(tbl13) do
		if k == 2 and v76 ~= v33 then
			n9 = 147
		end

		if k == 8 and v76 ~= v11 then
			n9 = 147
		end

		if k == 17 and v76 ~= v27 then
			n9 = 147
		end

		n22 = k
	end

	if n22 ~= v70 % 30 + 1 then
		n9 = 147
	end

	local flag14 = false

	if n9 == 147 then
		flag14 = true
	end

	if n6 ~= v73 then
		n9 = 100
		flag14 = true
	end

	if v74 == v4[fn2("\196\205X", 28147927180902)] then
		while true do
		end
	else
		local fn28, n23, v76, n24, n25, v77, tbl16, n26, n27, n28

		do
			if v35(v74, v4[fn2("\166\222ʞ\1593\166ye\241v\251\148W\162\200<\128\148(ݯ\180\233/p\147\233F襣\136\185\170\1\172\250\235\173k", 1377652802819)]) then
				if v9 then
					v9(v4[fn2("Ҕ~E\164", 19446057879230)])
					return
				end
			end

			if v27(v74, 1, 1) == v4[fn2("\138", 5914350458244)] then
				local v78 = v4[fn2("l\24\178\25+\175\tY\29B갖X\23", 28383083816769)]
				local v79

				if string[v4[fn2("\220eg'", 2761748253196)]](v74, v4[fn2("\23GB\147\212y\236\24\167&\219\243@y;\217", 9639274521361)]) then
					v78 = v4[fn2("LY\1333\11w\134\174FP\194 \4\177,y7\5y", 15260484515716)]
					v79 = v27(v74, 2, #v74 - 17)
				else
					v79 = v27(v74, 2, #v74)
				end

				fn14(100, v4[fn2("\244\159\237\201L\217X\239\180\245$\181G?", 30952626417818)], v4[fn2("N=1MT {!\211Z\191R\207'\140\200\253|3\169\178\183\150U\25c", 27278169760572)], Color3[v4[fn2("\189o`", 30263263129112)]](1, 0, 0), v4[fn2("4\226\14\232\14", 13170919157738)])
				fn4(v78, v79)
				fn9()
			end

			if v75 then
				if not v75[v4[fn2("\2\209\252\2074\186vTX\135", 27265284465456)]] then
					local v78 = v75[v4[fn2("\212/tO\130\27\16ĩ\177", 17419845222239)]]
				end
			end

			local n29 = tbl11[4] % 256
			local tbl17 = { [0] = tbl11[1] % 256, tbl11[2] % 256, tbl11[3] % 256, n29 }
			fn8()

			fn28 = function(arg)
				local n30 = 1103515245
				local n31 = 12345
				local n32 = 99999999
				local n33 = arg % 2147483648
				local n34 = 1

				return function(arg2, arg3)
					local v78 = n32
					local n35 = n30 * n33 + n31
					local n36 = n35 % v78 + n34
					n34 += 1
					n33 = n36
					n31 = n35 % 4859 * v78 % 5781
					return arg2 + n36 % arg3 - arg2 + 1
				end
			end

			if getfenv()[tbl15] ~= v72 then
				n9 = 100
				flag14 = true
			end

			n23 = 1

			for i = 1, 30 do
				local v78 = v33({})
				local n30

				if v33({}) < v78 then
					n30 = n23 + 1
				else
					n30 = n23 * 2
				end

				n23 = n30 % 10000
			end

			fn27(1, tbl17, 4)
			v76 = fn25(v74)
			n24 = v76[1] - n16
			n25 = v76[4] - v70

			while n29 ~= tbl17[3] do
			end

			fn20()
			v77 = tbl17[3]

			tbl16 = {
				[0] = tbl17[0],
				[2] = tbl17[1],
				[4] = tbl17[2],
				[6] = v77,
				v76[9],
				[3] = v76[7],
				[5] = v76[2],
				[7] = v76[6],
			}

			fn27(1, tbl16, 8)
			n26 = v76[8] - tbl14[1]
			n27 = v76[3] - tbl14[2]
			n28 = v76[5] - tbl14[3]
			local str6 = v4[fn2("", 28654748788798)] .. fn17(tbl14[3] + 9293) .. fn16(tbl14[1] + 31) .. fn13(tbl14[2] + 9379)

			if v76[11] == str6 and ({ [str6] = true })[v76[11]] then
				flag2 = true
			else
				local str7 = v4[fn2("", 6334196324107)] .. fn10(tbl14[3] + 9293) .. fn13(tbl14[1] + 69) .. fn16(tbl14[2] + 9379)

				if v76[11] == str7 and ({ [str7] = true })[v76[11]] then
					flag2 = true
				end
			end
		end

		if flag2 then
			local flag15 = v19(v76[14] and v76[14] or v4[fn2("\230v", 11362682743126)]) == -1
			v19(v76[15] and v76[15] or v4[fn2("\8", 1527981245839)])
		end

		n6 = -1
		fn15()

		if n6 == -1 then
			n9 = 250
			n6 = 100
		end

		local n29 = n7 + v68(111111, 999999) + v69(1234, 5678) + n6 % 99915 + n23
		tbl14[4] = n7 + n6 % 9951
		v68(100000, 1000000 + n6 % 1000)
		tbl14[5] = n6 % 8005 + n23 + v69(100000, 1000000 + n6 % 5000)
		tbl14[6] = v68(100000, 1000000)
		fn27(2)
		local v78 = v76[10]
		local v79 = tbl14[6]
		local str6 = fn26(v4[fn2("", 11551667071494)] .. fn13(v76[13] + 3877) .. fn17(n29 + n9) .. fn16(v76[10] + v70)) .. fn26(tbl14[5] .. v4[fn2("", 33512505047530)]) .. fn26(v4[fn2("", 24280191096916)] .. n29) .. fn26(v4[fn2("", 281328943366)] .. v79) .. fn26(tbl14[4] .. v4[fn2("", 30946183770260)])
		local str7 = fn26(fn13(fn27(3) + 15851) .. v4[fn2("", 1284234413228)], true) .. str6
		local v80 = v76[12]
		local response = v15:HttpGet(tbl5[v4[fn2("\204=\165,", 285624041738)]] .. v4[fn2("\215", 34962100748080)] .. v10 .. v4[fn2("\180T}\144E`\233N0\18\159\197", 5342028600175)] .. v80 .. v4[fn2("l4\190", 13551035363660)] .. str7)

		while v77 ~= tbl16[6] do
		end

		if response == v4[fn2("-\n+", 31841711780822)] then
			while true do
			end
		else
			if v27(response, 1, 1) == v4[fn2("\231", 5502021014532)] then
				v15:GetService(v4[fn2("<\165\18]\1795\142", 2067016091525)])[v4[fn2("\135\2218q\250\240\249wOź", 21595754614416)]]:Kick(response)
				fn9()
			end

			do
				local v81 = fn25(response)
				local n30 = 1
				local v82 = fn28(1 + v68(100, 1000 + n23) + v69(500, 5000 + n23) + n7 % 10000)
				local flag15 = false
				local n31 = 0
				local flag16 = false
				local flag17 = false
				local v83 = nil

				for i = 1, 3 do
					local v84 = v81[3]
					local str8 = fn13(tbl14[5] + 12967) .. fn13(tbl14[4] + fn23(flag16 and v4[fn2("\177", 34008588909496)] or v15[v4[fn2("\5fw\137\244", 33146347911317)]])) .. fn13(tbl14[6] + tbl14[2])

					if v84 == str8 and ({ [str8] = true })[v84] then
						do
							flag3 = true

							do
								local v85 = v81[8]
								local flag18

								if v85 then
									flag18 = v81[8] ~= v4[fn2("C", 5343102374768)] and v81[8]
								else
									flag18 = v85
								end

								if not flag18 then
									local v86 = v4[fn2("x\138\221<\173~N", 31676350493500)]
								end
							end
						end

						if not (v81[9] and v81[9]) then
							local v85 = v4[fn2("\190;h\148\252\0\245", 23283728274612)]
						end

						v83 = v81[6]

						do
							local n32 = v81[1] - tbl14[4]
							local n33 = v81[7] - tbl14[5]
							local n34 = v81[5] - tbl14[6]
							local v85 = n26
							local v86 = n27
							local v87 = n28

							n26 = function(arg)
								if not (flag15 or n31 < v30() - 8) then
									n30 = (n30 + arg % 66) % 6644
									return v85 * arg % n32 + arg * 3
								end

								while true do
								end
							end

							n27 = function(arg)
								local v88 = flag15
								local flag18

								if flag15 then
									flag18 = v88
								else
									flag18 = n31 < v30() - 8
								end

								if not flag18 then
									n30 = (n30 + arg % 50) % 5891
									return v86 * arg % 10000 + arg * n33 % 4
								end

								while true do
								end
							end

							n28 = function(arg)
								if not (flag15 or n31 < v30() - 8) then
									n30 = (n30 + arg % 35) % 6711
									return (arg + n34) % 100 * arg % (v87 % 100 + 1)
								end

								while true do
								end
							end
						end

						flag17 = true
						break
					elseif i == 3 then
						flag17 = false
						v83 = nil
					else
						flag16 = true
						flag17 = false
						v83 = nil
					end
				end

				if not flag17 then
					while true do
					end
				else
					if not flag14 then
						local v84, v85, service, service2, UserInputService, currentCamera, localPlayer, flag18, v86, fn29
						local fn30, fn31, fn32, lib, tbl17, tbl18, fn33, fn34, fn35, fn36
						local VirtualInputManager, fn37, fn38, tbl19, tbl20, tbl21, tbl22, fn39, fn40, fn41
						local fn42, event, tbl23, fn43, v87, v88, v89, v90, v91, v92
						local v93, flag19, flag20, v94, v95, v96, v97, str8, n32, n33
						local n34, n35, str9, n36, str10, n37, n38, n39, n40, str11
						local value, fn44, fn45, fn46, v98, Config, Minigames, flag21, n41, tbl24
						local fn47

						do
							do
								local zhEspLib, table_, Lighting, tbl25, Dungeon, flag22, flag23, str12, flag24

								do
									do
										local v99, localPlayer2, currentCamera2, worldToViewportPoint, findFirstChildOfClass, findFirstChild, vector2, udim2, udim22, numberSequence
										local new, format, clear, floor2, clamp, abs, remove2, n42, v100, position
										local n43, v101, index, v102, tbl26, tbl27, tbl28

										do
											do
												local v103

												do
													do
														while not flag12 do
															v29:Wait()
														end

														flag7 = true

														do
															local flag25 = false
															local flag26 = false
															local n44 = 0
															local n45 = 0
															local n46 = 0
															local flag27 = false
															local n47 = 0
															local n48 = 0
															local v104 = v76[12]

															v28(function()
																flag26 = true

																while not flag9 do
																	local n49 = v82(1000, n30 + 10000) + n30
																	local n50 = v82(1000, n30 + 10000) + n30
																	n47 = n49
																	n48 = n50
																	fn27(2)
																	local v105 = fn26
																	local str13 = fn26(n48 .. v4[fn2("", 15363566876644)]) .. v105(fn17(n48 + v78) .. v4[fn2("", 6862493423863)] .. fn16(n47 + n16)) .. fn26(n47 .. v4[fn2("", 13612240515461)])
																	local v106 = v4[fn2("", 26792823644536)]
																	local v107 = v10
																	local v108 = v4
																	local str14 = tbl5[v4[fn2("\251k\3\137", 8239072452089)]] .. v4[fn2("\243", 6554320115672)] .. v107 .. v4[fn2("\1716y\6\132\215\1\133#\18\21'\12\146H\155\195\17", 8461343792840)] .. str13 .. v108[fn2("\224\212\238", 27556277380159)] .. v104

																	v16(function()
																		if flag8 then
																			local v109 = v4
																			v31(v4[fn2("@", 8025391308082)] .. v30() .. v4[fn2("\198\5\158\149\150H\31\14\31\12\163}g\158\31H\4\5\208[", 21377778372037)] .. v33(flag6) .. v109[fn2("\229\215", 957806936956)])
																		end

																		if flag6 == false then
																			v106 = fn19(str14)
																		else
																			v106 = flag6:request({ [v4[fn2("E\143\147", 17306025115381)]] = str14 })
																		end

																		if flag8 then
																			local v109 = v4
																			v31(v4[fn2("\136", 8205785439706)] .. v30() .. v109[fn2("\20N\188+\204\18\227\131`OM\249P=\163n\206\2432", 6507074033580)])
																		end

																		if v106 and #v106 > 3 then
																			if v106 == v4[fn2(",.[\"@+o>\223", 19626452010854)] then
																				flag15 = true
																				flag2 = false
																				flag3 = false
																				n25 = 1
																				n24 = 2
																				local v109 = v4
																				v15:GetService(v4[fn2("K\26\21\0193\18\164", 34803182108316)])[v109[fn2("\210\201\222Q\159{D\181\180\253d", 29684498623485)]]:Kick(v4[fn2("\3\174d\163\173\15\196\248\n\148\211g\189\226M\252,\146?T\145^m\161\29J\31mM\158n\1\176D\232\133\t\2291r*\138W\145\0190\29\152I\176\177\147X^3\153O۴", 33049708197947)])
																				fn9()
																			end

																			if v106 == v4[fn2("Ɖ\162J", 30249304059403)] then
																				flag15 = true
																				flag2 = false
																				flag3 = false
																				n25 = 1
																				n24 = 2
																				local v109 = v4
																				writefile(v4[fn2("\231\151|(\168\248]\170\254\215\233V\231k\136M\172\129\168", 14824532030958)], v109[fn2("s25z\154\234a\131\145", 15250820544379)])

																				while true do
																				end
																			else
																				v106 = fn25(v106)[1]

																				if v106 == fn13(n47 * n48 % 100000 + n29 + 18317) .. v4[fn2("", 28489387501476)] then
																					n45 += 1
																					flag27 = true
																					flag25 = true
																				elseif v106 == fn10(n47 * n48 % 100000 + n29 + 18317 + 4919) .. v4[fn2("", 15233640150891)] then
																					flag27 = true
																					flag25 = true
																					flag9 = true

																					v16(function()
																						flag6:close()
																					end)
																				else
																					flag15 = true
																					flag2 = false
																					flag3 = false
																					n25 = 1
																					n24 = 2
																					local v109 = v4
																					v15:GetService(v4[fn2("\197>x\169\18fL", 29485850323780)])[v109[fn2("\172\15\203V*\147lM\179R\26", 24838553885276)]]:Kick(v4[fn2("\174\191bRRQ*\193ع'\25\154\n\158j\6\129\242\184\187\21\21D\245\225tL\179\160(", 22159486275741)] .. n45)
																				end
																			end
																		end
																	end)

																	v22(20)
																end
															end)

															while not flag26 do
																v29:Wait()
															end

															flag26 = false

															v28(function()
																flag26 = true
																local n49 = 200

																while true do
																	n49 += 1

																	if not flag9 and n49 >= 250 then
																		if flag27 then
																			n44 += 1

																			if n44 > 4 then
																				n44 = 0

																				if n46 < 10 then
																					n46 += 1
																				end
																			end
																		else
																			n46 -= 1

																			if n46 <= 0 then
																				flag15 = true
																				flag2 = false
																				flag3 = false
																				n25 = 1
																				n24 = 2
																				local v105 = n45
																				writefile(v4[fn2("\rq\227Ŗ\196C\12d5\169P\130\23\225R%\162/\160\157", 15647043369196)], v4[fn2("\226\254\178K\216\255Z+Z", 8167129554358)] .. v105 .. v4[fn2("\250\193X\28", 24571184011619)] .. v33(flag6))
																			end
																		end

																		flag27 = false
																		n49 = 0
																	end

																	n31 = v30()
																	v22(0.18)
																	if n31 ~= v30() then
																		continue
																	end
																	flag15 = true
																	flag2 = false
																	flag3 = false
																	n25 = 1
																	n24 = 2
																	local v105 = n45
																	writefile(v4[fn2("\221aK\192\216\12q\174n\167\"\232\6\199\17:\166y\t=)", 26022927261355)], v4[fn2("\206\224\168?\226v\231\19\29", 709765005973)] .. v105 .. v4[fn2("\169d\175m", 10312531191172)] .. v33(flag6))
																end
															end)

															fn14(95, v4[fn2("\132", 22787644412646)], v4[fn2("\"\140\144$Il~ٳz\219Z\206:\t", 447764005281)])

															while not flag26 or not flag25 do
																v22()
															end
														end
													end

													do
														fn14(100, v4[fn2("^\156\160\174\193/5\1494\0U\206\225\165}", 10029054698620)], v4[fn2("[Q7ð=\11x\218~\1302}\200\234/m\228.\159", 31806277219253)] .. v30() - now .. v4[fn2("\252", 21953321553885)], Color3[v4[fn2("wܽ", 20447889574499)]](0, 1, 0), v4[fn2("\211\225ף", 11135042529410)])
														v84 = nil

														do
															local tbl29 = {
																[5] = 248,
																[3] = 0,
																[4] = 54,
																[14] = 148,
																[12] = 153,
																[2] = 0,
																[10] = 128,
																[6] = 233,
																43,
																[13] = 10,
																[11] = 79,
																[8] = 69,
																[9] = 253,
																[7] = 86,
															}

															luraph_runtime1(v83, buffer.fromstring("\205\226`v4Y)\149\149\217\15\133]\218d\152η\254O\238\228\210d\8\210\255C<\198h\250I\231\21\138?N\25\155L\21.\244s\206Bb\223\231\219X\18\236R\1336t\185\241}\1305\30\181\148\167\1689(5\239\198)M\169\199&\27C \189\n\163\243\162\235\237~\11)躘G\196\250)m\143\180p\2\213ꚀA\169\24N\129\237\210\253h\164\225\23\16\218!.\6۹W\127\30G\154R\26\8\176<k\142\r\143\2474\191\229B\232\184BZ^z\27\151<Lo\185iA\14\175&\21\163\161\176\r\168\11Wp\2 \192J\r`\242ȶ`YQ\18|\142\135\20\219\11\158F;\147\186\156\236\225v\207L\230\197y\225Ba-B\183[\191\160\218D}\2198\249\248\5%\193\140\169\252\233\16?5\t\130\169\19\182홊\136\235j;\254\220\28\131\216l\26\r&G\30\2L\134c\199\23e\246EA\165\162\8V\146\172\246\16\240\221Y\251\163v>ϻb \157\178\213f\192\234\226+\243N\199\212\244@`\172\22708S\26\1837k\253V\177\189Q[\22588\251\233\r;2\193\1\132\254\179<\247\157\210\0273Y\"\160\158\179i/\177\203 Z\244Խ\213:\186\174'\147yLb\240á\16v\135\165\158Ē'\194LpI\127\21L\30\200\195JA\224\"5\n\184\220T'.ݣ7\6,\173\166\133[t\206\14lC\8\156V\173q\155\1901#l,\188\255\250\15\211\225\202S\220yڲ\157\169xo~\128\137F\205\195\28\175\154㹈{m✡ܐ1\155\25\171\140\146˞V\220ǟ\253\25!M\30?\226\241\253\31\251\25x\174\27\rf>\138:\185\246\231\2518\168ѭ\145\155\190\226p}\205\t\187!\224O\135\212\218Of\242\137t×\8'\137;:\127\194I\155wU\137\171\133\228\158_!\n\159\149F\16\31\149\143\215%\25\226+\205\246H\202ÎI[\208S\1483\147m\20!Qk:\210\26M??\170iyItc\17Ze\223O\t>e\134\22?\144j\0W\169\183y\163͏+<\1\8\231\233o\158\242\182\167\23\227\227\rX\3\30\22?;Й=\14\1\214\1958IF\22\221S@\246T\148^6h\215͍\12Ӎ\11d\180\253\194f\244\130\205\25b\176\12r\205\t'b\152'%\211\127\232Y\189{#D\6\165\4쀾\186f!\214\2\153\174\182\166kWo\7\224\205d\179\29n\201\235\251\135?*\229\247\253\170\23\205\31!\225\245ہ\200\229c\207\27cr\196t\182\25\155\132\150\214\228\25\249\191\230\155D\4\140\141k^\18\155\25,\5\150\145\191\0\222sfF\225c|\131摰/U+\251\204m%\128\149Ô\228/b\213c\196H\179\150\190'$\128\154\172\175\174~N\200Z\\\242{\251ה(\149\163\250\216{\1\1591t\200B\200\229\130F;ٌ\182\23\185{\207\246+16\143\240\186ی\173\247l\237\7\1W\208\223\228\253\198=\243\156\n\146˷f\255\216\227\184?\181\166\249\151\150\168@\152\234(\176u\196@ƕ\248'\248v:Y\2480dXb\163\248;N\227\5TI{\218\252k]\250c\127\252M\233D\217\\Ҋ\141\173?\166\1\2205\179^H1\232\217ֈ\137\247@z\185\139\165\11\138\12\247Rɶ\226\248\233\181\235\241%\u{557}\163$^ɑS\31\229\7s\24\r\21X\29\1\226\226d\1\18\243\2T\243*\254\6\12\181?\11\177r\0170\14\164\244U4\18\t3\172\175``\147\128[i*g\177)տ\175\0314qwi\r?\28x[\240\145.\24\21W+\151\199-\253\251\27DLk\231\144D\177L\179\140Z\177B定\150\172\160\221\199?\7\22l\18\18\170\145\131s\251D\137\1{m1\19\201\6]\31@N6eյ\18\173\25\t\137ن\143\16\25A#\232\28Ԟd\187\138Ȫ\131j\0064W\163\168\185I\26p\162?\247Dɮ \224\243\0250a\16Ƕ\140Mpr\\\tk\11\1428\246\190\220\0069\0168a\194\255\150\175\232\174fZ\217:\15!\22\140\172\"\t\170\2348T\240Ms\131\\Nᬨ\168{]7^Ϫ\19o$83\182\168l\204\230R\29{\148\249\131\213\233YT\192\184\157jv\no\190 \236hH\t\200ٚ\184\31ϵc\175y63\167\200=1\132\163\n(o~U\200b0\232y\140\4RH9~\181B\246z\224i\229j\14\213L\174\170v\158\164\171\149\190\155\171\195F\1764-cᶋ\239\254\138\21\140\233\187I\134\0191 \19\221>͜\15$\237\232\166\231\t>g\252)E\240\152i\"\217GŕJ\134r-jW\5\171\183q\22\12\239Y\192Ԏ7\249\129\136We\12\2\28fuѓ\209牒.d^qm\161\128\161\168\236\160\2298\244<\255\224-\26\244\181\206\202\5'jtg\28\u{5EC}\220Kd\18\174\142Y\235ێ\226\134\240m\23\216b\142\171\29\151\236J\173K۱\147\148\139\7#\24\226f\215\216 |ki\5\134]8s\141\249)F7\185\176\230\188\203\254P@\139F\26z\157\232\19\213|\161YT\1\157\153Y)\223\255\156\194D\22\25\188\217\198\223K\160\133\178\185\175j\177\207\228\144T\158\194Se\5H\194\239q\215\226r\164\216\24!\178\165\25k\163\7\171c\166\185\160\144Px6\1Ȧ\3\128%\159vų|V\16\151\239]\205^\195\225\161:\12\224\u{3D7B8}\2\23/8\255\130w*\251\166\179D#\177n\19OaL?\1330\153\236]rkP\7_j\193\252\205!\u{7FC}PoL\25\168}d\151\232l\219t?\151\222l\4\207\24r\2064}\145\11\164\154͘J\1\155\207\7]\195\6\244\249ZF\222e\223`\222UH\0299Y\26D\168W\198\209\237\171%|\239p_\8\166.\143\245L}9\135㡄Yڦ\2214\170_928\225Sd\216zB\168X\246K~v\199\6\139rܳ@\4\2S\16\238\170Z\252\233u\14/\229\29\145\216nt\129>\164\ne\2470\254?\205\8\188\21\132\233܆\136\239\254=y8š\ri?\1\24s2\251\2539O\218\255\132b\202H\27.\213OҼ\191\208\5\r\1928\147r\252cB\248XcÙ\170\210\27\229'F\15\187d\179\14t%\195\245\152\137\164~y=B\1914+\5\211s\1\175\182\184\170W\12\179{\229\188͂t5o\188\239\185\27s\15\236Xe\229_#x\245\227R<Vh\14\200H8>\228[o\179\168\247\182\244^e\20\131\6\142\169\140\184\212bgL\127\203bs.\2\253\222J\15{\205j\145h\161m\150\251\25.$\253x;X\14\151\144~\131\228u\137zB\135\236G\248N\2113ʝ\129k\156pa@\213^\176P$\127\"\232P\171%D\214\4\228|\175\132Ҝ4W4\197űB\226k\195G\229!\157(\173(\24\200S.\246\"`\11<\165\252\134ͥH\213\244\237%J\173k\1498\162\154kY!\23\142\239&\184&I}~V(\2149\175%\228߅\208\250P?#`\157㙓֡\230\191\\\216R-\7\171\246\138p榲\178\7\249\18\235\219\253\2234\191\212\240\198\208\24\23x\128\2\1975\2\184\146s\227W\205z\8\194\1\161\202#n\128R\238\140Z2\241\140E\150\152\249$F\221p+\184A]\t\253\220\221\230\138\2\12\18<\198\204a\250\22Lm9樺\153g\232\132#_2\27<rV\180\129&\t\16*\2472\199\230\159\8p\209C\211m\251r7\\HP\135\30D \30:Ti\244\16\162\221q.\220\254\21|\163H\"@<\151s\250\15\174\14\222hYo\173\185\231\201)\225\31\131\4h\0031\251hROTXm\1743\144\200y\154\132h\14$\221\240rCu\169\239F.k\192+\240\149\18\24\199\250\1875Q\246\31Q\132\21>ǃ\187\187\n\210'\228;\232oP\232\3\191\252G\255\4#C'B\241\14p\14\143\140.\7Q^\4\166}0U\245,\147\210t\188Æ\233\134\0\190\165\205} \234U\189q\189pZK\215\206P\127\25\217<o^x\180۠\250\232\132|\171\232\161\251\169,+\238{\251S\225j+%\rdm'g\161\r\223\1\238P\25\139\160\252\209d\175&&5\2542\211j\22K2ݕ R\8\186r\219p^\235\241~\174\199<\136\193\201;\226_x\2085B\134n\2363h\23\225?'\153\25u\4+Z~\2057\23\139\145>\209^\196\234!.\153\143\227\24 9\216I'\6\153Iؑ\190Ù\18|vI\0086e&\1337=\146\132\238\226\129/\228\165\203)~*\0269\30\224L\233\238?0\198\254\181\17\135]\183\n\177\188`\u{7B4}\15\211\226N\192v\226ʽ\182q\22k;\186\157\242\127\148e\4\245\22\183\20R\186\194\n5$<\24\175\242\244\199~D\159\168>\193\223:nٿByIq\207\229=i\179boN\2396v\209\26\185m\2260\212\242D\151)_>\228h\179\167VN1dV\177W1\196\249\24]\216x\242\156\167k\16[\15^\146\7 o\188\1952z\5t4\4\220z\6ZU\206\243\130J\149\161\234&<ÂG\158>\6\234\197`!\127\227B\19\150\174\26\203Z\147\4g\225.U\227R\31J\146\189E\133\166\155?\26\161\\6\0050[\235\183N6,!z\186Pe\2316\240\135@\14t\168\162P\231\2371IF#r\224\136w\209\218̧\226\\\156\28\201\nU\149?)#;\157\155G\248\249P\240\163,m\18e<9\6W\nqI\132\21嬩\214\22\130\145<\219\201ǹ\217\21\157r9\205^\173+\195\228|\244\1574\143\164\31B\6\183u\151:\217Ե0\141J\nv\26\185\192gv\250L\171\230J_\218X\0A\0\131\n\29T\162D\179j\189\158\154\127\r\2\16\25\161\8=\5c\140X\178\25545\156y\250\136f\205?\204\1H\209\16Q\182@\139\6\19G\tK\148\191+\196\16:\5I\169\246\211\12\161ܘA\25\145\243\240\15\187G\235\144\19\235\193́Nek\27\228\204MQm\189\152ir\127\28\249tV\6\226\229\250Ŋ\236\146!\201\127\144Ǽ&\15\243\171\130ӡߍ\\c\170\n\11\150#\191\253\26\151\129ڣ\208Y\248\143\189\158;\27\186\r\204\237Y\146\231\226\nH\171\187\237\155\231\31\234^Ɩ\238\209\225\152S\163\239\129\247w\240Uı\135\178&*\234\11\155\22-)Q\204\250\223\249/\140\148\154\243\11\203,\178\231\243+\221\28\30l\18\154\164\213{eA\192MvJ\2\7ܬ\147\233~\229\5\181\220\18\168j\4\2059tF;\rM\\甫\245\14\207ny̚}\130\133\179 \15A\252\148\164\220\254\142\152}Z\184CL\131\202\19+9\148O^\254\128}\24_\217|\153Rq\139\229-M\186γ%\237\243\228l;\169\203\246\153g\187`\7\159\225\152\21\21\249\239B\177\192Q8G5Ω\3d>gBH\8\138\165\165e\204Ƣ˾Y@@\143\2442GI\181G\30\127_z\5P0=c\181[\154\233I\252\133\253\152o\240 \135.\193\"\30^E\171,Wu\138\231~u@2l\137\247\2mA\2\188\23ȃ\r\17\2211\20kN\226?@\181\230z\225L\22\205\245)\0295\160\165lÚ\243wt\138\224\217XEВ8\145|\2088s\225o\4\29\228=G\31\167\190ݵ\3\214U\185V \1285r\242]\174s\236\241\219ȧd\1279j\255Ol\227yP&j\234SL\192\242?\157C<\22\218zz\202+\11\157z\149\208/\26>\1\214\233\134J\201\11\229g\194q\22\147GK|O\30,´\168F\17vy\178S1\230\172otF\197\240~w{\250\3\205\201@qaz\151ev\18z\135d\142SҔ\240\242\154\254_\191\254\151\156\165&\0167dBv\152\163|̾\204.\245\240\153^^a\236r\1816\130\4\n\179\6\145\7\138EQ\187\181\r]\29\\\144\176\21\191^\174~,\162\196S\192\231n1\186EW8g\180\22N\201pU4\r\222= \26W\196\250<\133\227\2459\207Ag\145E\212\253\138\178\149\165\214j\132vy\222\218_\24\149\\\135:A\132\236\20\29\138D\231\152\243\0\136\157\127\29\232`3\136w\176\31\194=[\172k\24\189<\184\202\31\163R6;\195r\31x\159\248\11y9\24H\173\229\171\21\243\14\14!\253\230\183[X2\132\246\136\18A\147\1813\200\3\140\236\241\217m\129PX\201(k\140\4\6\254\198\224S{\26/\199\17\132\204\2234x\u{F4E6}\135\228\255&\193\127\168\168xx\141\168\225H\209\233\30s\241\171h\222h\245\193y\210IQ\254x\184na\223\23\16\4\181\234\244e\195|\223xMLH\1\174\228b0\0\221_} \223'eo\160h\130\136\162W\31\176\7\220@-\174\151\166\6\1327U\149uғO\157\160\244\213 \7\220+\154=f\25\136DG1\0052t\227 \176\210\228\168N\1845\149\5;\237\230D\27\221\12H\178\164\130\29\128wiE\161G\167\196\235eOLT\2\1557%\175:]\16{\247\174\198\20\29\159\22\15!4\222I\1625\154\29\18\228\179_\0\2\147\238\141\30Gβ\171f\27\184Y\22\139M#H\231\249\205Y\166Q\22\225P]\204\248\250\3\147E\14\186\2524i\165C*̆\161\128ˌ\150\23m|k.\207\239\252V\230\r\152#6:\168% [\211d\212Y\1522\238\172XPt\129>,\148\247\247\177\169\170%\142\212_\200z\134f\208\200t<\252\179\23\17\236\254V\249N\147\242\1\220Ce\216E\199\242wI\140\194־\23029^\2481\203lBڈ\nr\167Ӌ\136I\1527]\20\204\222}\128\15\220\7\219I^\186!'\251,\216z\236Z1\186\234\224K\227\14C\174y\221\248\2171Uy\30_\215\251\137.z\174~\211N\23\238\16t\130̭c\187?\144@eʲ4\207҂\161\195\204\16]\7aT`\166\214AO[\18\239\223|\19\192Yν\2011\135\148\0117\1316\228*\173\11\5\29\229HՅ\189\192\134\162#va|\157\248\157\0212\1365^LJ\1967\2235\2205el\2419B\196\2254\218I\237\r\\\251\218\255\2408\224~\173\255\160\187\231\177]Q\240\154\4mTC\152S*\189!\144\136K\28\177\\\224UjP[\134\180\149\176=\156#ý(cD!2\248;\178\30NU[\158\172\167\130\250\11\218rau\128\167\251\21\189\192\127_&{\158\193rٸ\7\215\196\237\222Y\199j\163k\7\162\236\0223\220\4:K\11\u{BEFA3}Pgh\156\157\250\138\176\1\144\249>\181\229L#a\134Q\\\145\134̓\r\16m\217v\171;\25D\180SEX̎\151PC\171v\193)\210(\22b܊\142]\150\128<\226.\148X\212Ā\163\138\197\5\135\253\170V[~Z\161\211\205p\218^\191[W\203w\25\175\131a\201`\22N\nB\164"), tbl29, 345)()
														end
													end

													do
														if not game:IsLoaded() then
															game.Loaded:Wait()
														end

														pcall(function()
															local localPlayer3 = (cloneref or function(arg)
																return arg
															end)(game:GetService("Players")).LocalPlayer

															localPlayer3 = localPlayer3 and localPlayer3:FindFirstChild(v84[76])
															localPlayer3 = localPlayer3 and localPlayer3:FindFirstChild("PlayerModule")
															localPlayer3 = localPlayer3 and localPlayer3:FindFirstChild("ServerAuthority", true)
															if not localPlayer3 or not localPlayer3:IsA("ModuleScript") then
																return warn("No module found")
															end
															local ok, result = pcall(require, localPlayer3)
															if not ok then
																return warn(result)
															end
															local initialize = type(result) == "table" and result.initialize
															if type(initialize) ~= "function" then
																return warn("No initialize function found")
															end
															print(debug.getupvalue(initialize, 1) and "Server auth is initialized" or v84[166])
														end)

														do
															local ScriptContext = game:GetService("ScriptContext")
															local localPlayer3 = game:GetService("Players").LocalPlayer

															if not localPlayer3 then
																game:GetService(v84[127]):GetPropertyChangedSignal("LocalPlayer"):Wait()
																localPlayer3 = game:GetService("Players").LocalPlayer
															end

															local function fn48()
																if not getconnections then
																	return
																end

																pcall(function()
																	for _, v104 in ipairs(getconnections(ScriptContext.Error)) do
																		pcall(function()
																			if v104.Disable then
																				v104:Disable()
																			end
																		end)

																		pcall(function()
																			if v104.Disconnect then
																				v104:Disconnect()
																			end
																		end)
																	end
																end)
															end

															fn48()

															localPlayer3.CharacterAdded:Connect(function()
																task.wait(0.5)
																fn48()
															end)

															task.spawn(function()
																while task.wait(1) do
																	fn48()
																end
															end)
														end
													end

													if getgenv()._ZH_EspLib and getgenv()._ZH_EspLib.Unload then
														pcall(getgenv()._ZH_EspLib.Unload, getgenv()._ZH_EspLib)
													end

													do
														local obj = setmetatable({}, { __index = function(arg, arg2)
															return game:GetService(arg2)
														end })

														v99 = obj[v84[127]]
														v85 = obj[v84[8]]
														v103 = obj[v84[137]]
														localPlayer2 = v99.LocalPlayer
														currentCamera2 = obj[v84[135]].CurrentCamera
													end
												end

												do
													local udim

													do
														local tan, rad

														do
															worldToViewportPoint = currentCamera2.WorldToViewportPoint
															findFirstChildOfClass = game.FindFirstChildOfClass
															findFirstChild = game.FindFirstChild

															do
																local vector = Vector3.new
																vector2 = Vector2.new
																udim = UDim.new
																udim2 = UDim2.new
																udim22 = UDim2.fromOffset
																numberSequence = NumberSequence.new
																new = NumberSequenceKeypoint.new
																format = string.format
																clear = table.clear
																floor2 = math.floor
																clamp = math.clamp
																abs = math.abs
																tan = math.tan
																rad = math.rad
																remove2 = table.remove
																n42 = 0.016666666666666666
																v100 = vector(v84[67], 0, 0)
																position = vector(0, 0, 0)
															end
														end

														local n44 = 0
														n43 = 0
														v101 = v84[67]

														local function fn48()
															n43 = currentCamera2.ViewportSize.Y
															local v104 = v84[155]
															n44 = n43 / 2 * tan(rad(currentCamera2.FieldOfView) * v104)
														end

														fn48()
														currentCamera2:GetPropertyChangedSignal("FieldOfView"):Connect(fn48)
														currentCamera2:GetPropertyChangedSignal("ViewportSize"):Connect(fn48)
													end

													index = {
														[v84[47]] = "Esp",
														Cache = {},
														Holder = nil,
														Threads = {},
														Connections = {},
														Table = {
															Enabled = v84[35],
															ShowLocalPlayer = false,
															Distance = 7520,
															RefreshRate = v84[95],
															Font = "TahomaBold",
															FontSize = 12,
															FontType = v84[65],
															Boxes = {
																Enabled = true,
																Type = "2D",
																Rotation = 90,
																["Box Glow"] = {
																	[v84[100]] = true,
																	Top = Color3.fromRGB(255, 255, 255),
																	Bot = Color3.fromRGB(255, v84[12], 255),
																	Transparency = { v84[86], 0.75 },
																},
																[v84[171]] = {
																	Top = Color3.fromRGB(255, 255, 255),
																	[v84[39]] = Color3.fromRGB(v84[12], v84[12], 255),
																},
																[v84[38]] = {
																	Enabled = false,
																	Top = Color3.fromRGB(255, 255, 255),
																	Bot = Color3.fromRGB(255, 255, 255),
																	Transparency = { v84[115], 0.65 },
																},
															},
															Bars = {
																["Health Bar"] = {
																	[v84[100]] = true,
																	Top = Color3.fromRGB(0, v84[12], 0),
																	Mid = Color3.fromRGB(255, 170, v84[67]),
																	Bot = Color3.fromRGB(255, 0, 0),
																},
																["Armor Bar"] = {
																	Enabled = v84[35],
																	Top = Color3.fromRGB(255, 255, v84[12]),
																	[v84[77]] = Color3.fromRGB(220, v84[48], v84[48]),
																	Bot = Color3.fromRGB(v84[118], 180, 180),
																},
															},
															Texts = {
																Name = {
																	[v84[100]] = v84[126],
																	Color = Color3.fromRGB(v84[12], 255, 255),
																},
																Distance = {
																	Enabled = true,
																	Color = Color3.fromRGB(255, 255, 255),
																},
																[v84[191]] = {
																	Enabled = true,
																	[v84[194]] = Color3.fromRGB(255, 255, 255),
																},
															},
															Flags = {
																[v84[108]] = {
																	[v84[100]] = false,
																	[v84[194]] = Color3.fromRGB(255, 0, 0),
																	Text = "Walking",
																},
																Jumping = {
																	Enabled = false,
																	Color = Color3.fromRGB(144, 238, 144),
																	Text = "Jumping",
																},
																[v84[200]] = {
																	Enabled = false,
																	[v84[194]] = Color3.fromRGB(0, 255, v84[12]),
																	Text = "Swimming",
																},
															},
															Chams = {
																[v84[100]] = v84[35],
																FillTransparency = 0,
																FillColor = Color3.fromRGB(255, v84[12], 255),
																OutlineColor = Color3.fromRGB(0, 0, 0),
															},
														},
													}

													v102 = index[v84[87]]

													do
														local function fn48(arg, arg2, arg3, arg4)
															if not isfile(arg4.Id) then
																writefile(arg4.Id, arg4.Font)
															end

															if isfile(arg .. v84[114]) then
																delfile(arg .. ".font")
															end

															writefile(arg .. ".font", v103:JSONEncode({
																name = arg,
																faces = { { name = "Normal", weight = arg2, style = arg3, assetId = getcustomasset(arg4.Id) } },
															}))

															return getcustomasset(arg .. v84[114])
														end

														index.Minecraftia = Font.new(({
															Minecraftia = fn48("Minecraftia", 400, v84[169], {
																Id = "Minecraftia-Regular.ttf",
																Font = game:HttpGet("https://raw.githubusercontent.com/i77lhm/storage/main/fonts/Minecraftia-Regular.ttf"),
															}),
														}).Minecraftia, Enum.FontWeight.Regular, Enum.FontStyle.Normal)
													end

													index.__index = index
													getgenv()._ZH_EspLib = index

													index.CreateObjects = function(arg, arg2, arg3)
														local instance = Instance.new(arg2)
														local tbl29 = arg3 or {}

														for k, v104 in tbl29, nil, nil do
															instance[k] = v104
														end

														return instance
													end

													index.CreateThreads = function(arg, arg2, arg3, arg4)
														local connection = arg3:Connect(arg4)
														arg.Threads[arg2] = connection
														return connection
													end

													index.Holder = index:CreateObjects(v84[54], {
														Name = "\n",
														Parent = gethui(),
														ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
														ZIndexBehavior = Enum.ZIndexBehavior.Global,
														ResetOnSpawn = false,
														DisplayOrder = 10000,
														IgnoreGuiInset = true,
													})

													index.InitEsp = function(arg, arg2)
														local objects = arg2.Objects

														objects.TargetHolder = arg:CreateObjects("Frame", {
															Parent = arg.Holder,
															Visible = false,
															BackgroundTransparency = 1,
															Position = udim2(0, 0, 0, 0),
															Size = udim2(0, 0, 0, v84[67]),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(v84[67], 0, 0),
															BackgroundColor3 = Color3.fromRGB(255, v84[12], 255),
														})

														objects.TopHolder = arg:CreateObjects("Frame", {
															Parent = objects.TargetHolder,
															AutomaticSize = Enum.AutomaticSize.Y,
															Visible = true,
															BackgroundTransparency = 1,
															AnchorPoint = vector2(v84[67], v84[115]),
															Position = udim2(0, -2, 0, -v84[32]),
															Size = udim2(1, 4, v84[67], 0),
															BorderSizePixel = v84[67],
															BorderColor3 = Color3.fromRGB(0, 0, v84[67]),
															BackgroundColor3 = Color3.fromRGB(v84[12], 255, v84[12]),
														})

														objects.BottomHolder = arg:CreateObjects("Frame", {
															Parent = objects[v84[44]],
															AutomaticSize = Enum.AutomaticSize.Y,
															Visible = true,
															BackgroundTransparency = v84[115],
															Position = udim2(0, -v84[119], v84[115], 3),
															Size = udim2(1, 4, 0, 0),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(v84[67], 0, 0),
															BackgroundColor3 = Color3.fromRGB(255, 255, 255),
														})

														objects.LeftHolder = arg:CreateObjects("Frame", {
															Parent = objects[v84[44]],
															AutomaticSize = Enum.AutomaticSize.X,
															Visible = true,
															BackgroundTransparency = 1,
															AnchorPoint = vector2(1, 0),
															Position = udim2(0, -5, 0, -2),
															Size = udim2(0, 0, 1, 4),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, v84[67], 0),
															BackgroundColor3 = Color3.fromRGB(255, 255, v84[12]),
														})

														objects.RightHolder = arg:CreateObjects(v84[34], {
															Parent = objects.TargetHolder,
															AutomaticSize = Enum.AutomaticSize.X,
															Visible = v84[126],
															BackgroundTransparency = 1,
															Position = udim2(1, 5, 0, -v84[119]),
															Size = udim2(0, v84[67], 1, 4),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, v84[67], 0),
															BackgroundColor3 = Color3.fromRGB(255, 255, v84[12]),
														})

														objects.TopTextHolder = arg:CreateObjects("Frame", {
															Parent = objects.TopHolder,
															AutomaticSize = Enum.AutomaticSize.Y,
															Visible = true,
															BackgroundTransparency = 1,
															Position = udim2(0, 0, 0, 0),
															Size = udim2(1, 0, 0, 0),
															BorderSizePixel = v84[67],
															BorderColor3 = Color3.fromRGB(0, 0, v84[67]),
															BackgroundColor3 = Color3.fromRGB(255, 255, 255),
														})

														objects.BottomTextHolder = arg:CreateObjects(v84[34], {
															Parent = objects.BottomHolder,
															LayoutOrder = 2,
															AutomaticSize = Enum.AutomaticSize.Y,
															Visible = true,
															BackgroundTransparency = 1,
															Position = udim2(0, 0, 0, v84[67]),
															Size = udim2(1, 0, 0, v84[67]),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, v84[67], v84[67]),
															BackgroundColor3 = Color3.fromRGB(255, 255, 255),
														})

														objects.LeftTextHolder = arg:CreateObjects(v84[34], {
															Parent = objects.LeftHolder,
															AutomaticSize = Enum.AutomaticSize.XY,
															Visible = true,
															BackgroundTransparency = 1,
															Position = udim2(v84[67], 0, 0, v84[67]),
															Size = udim2(1, 0, 0, 0),
															BorderSizePixel = v84[67],
															BorderColor3 = Color3.fromRGB(0, v84[67], 0),
															BackgroundColor3 = Color3.fromRGB(255, 255, v84[12]),
														})

														objects.RightTextHolder = arg:CreateObjects("Frame", {
															Parent = objects.RightHolder,
															LayoutOrder = 2,
															AutomaticSize = Enum.AutomaticSize.XY,
															Visible = v84[126],
															BackgroundTransparency = 1,
															Position = udim2(0, v84[67], 0, v84[67]),
															Size = udim2(0, 0, 0, v84[67]),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, 0, 0),
															BackgroundColor3 = Color3.fromRGB(v84[12], 255, 255),
														})

														objects.LeftBarHolder = arg:CreateObjects(v84[34], {
															Parent = objects.LeftHolder,
															AutomaticSize = Enum.AutomaticSize.X,
															Visible = false,
															BackgroundTransparency = 1,
															Position = udim2(v84[67], 0, 0, 0),
															Size = udim2(v84[67], 0, 1, 0),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, 0, 0),
															BackgroundColor3 = Color3.fromRGB(v84[12], 255, 255),
														})

														objects.BottomBarHolder = arg:CreateObjects("Frame", {
															Parent = objects.BottomHolder,
															LayoutOrder = v84[67],
															AutomaticSize = Enum.AutomaticSize.Y,
															Visible = false,
															BackgroundTransparency = 1,
															Position = udim2(0, 0, 0, 0),
															Size = udim2(v84[115], v84[67], 0, v84[67]),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, 0, 0),
															BackgroundColor3 = Color3.fromRGB(255, 255, v84[12]),
														})

														arg:CreateObjects("UIListLayout", {
															Parent = objects.TopTextHolder,
															VerticalAlignment = Enum.VerticalAlignment.Bottom,
															HorizontalAlignment = Enum.HorizontalAlignment.Center,
															Padding = udim(v84[67], 1),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects("UIListLayout", {
															Parent = objects[v84[69]],
															HorizontalAlignment = Enum.HorizontalAlignment.Center,
															Padding = udim(0, -1),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects(v84[139], {
															Parent = objects[v84[23]],
															HorizontalAlignment = Enum.HorizontalAlignment.Right,
															Padding = udim(0, 0),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects("UIListLayout", {
															Parent = objects.RightTextHolder,
															HorizontalAlignment = Enum.HorizontalAlignment.Left,
															Padding = udim(0, v84[67]),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects("UIListLayout", {
															Parent = objects[v84[74]],
															FillDirection = Enum.FillDirection.Horizontal,
															HorizontalAlignment = Enum.HorizontalAlignment.Right,
															Padding = udim(0, v84[32]),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects("UIListLayout", {
															Parent = objects.BottomBarHolder,
															HorizontalAlignment = Enum.HorizontalAlignment.Center,
															Padding = udim(0, v84[32]),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects("UIListLayout", {
															Parent = objects.TopHolder,
															VerticalAlignment = Enum.VerticalAlignment.Bottom,
															Padding = udim(v84[67], 1),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects(v84[139], { Parent = objects.BottomHolder, Padding = udim(0, 1), SortOrder = Enum.SortOrder.LayoutOrder })

														arg:CreateObjects("UIListLayout", {
															Parent = objects[v84[43]],
															FillDirection = Enum.FillDirection.Horizontal,
															HorizontalAlignment = Enum.HorizontalAlignment.Left,
															Padding = udim(0, 1),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects("UIListLayout", {
															Parent = objects[v84[61]],
															FillDirection = Enum.FillDirection.Horizontal,
															HorizontalAlignment = Enum.HorizontalAlignment.Left,
															Padding = udim(0, 1),
															SortOrder = Enum.SortOrder.LayoutOrder,
														})

														arg:CreateObjects("UIPadding", { Parent = objects[v84[68]], PaddingBottom = udim(0, v84[67]) })
														arg:CreateObjects(v84[62], { Parent = objects.BottomTextHolder, PaddingTop = udim(0, -v84[115]) })
														arg:CreateObjects("UIPadding", { Parent = objects.LeftTextHolder, PaddingTop = udim(0, -3) })
														arg:CreateObjects("UIPadding", { Parent = objects.RightTextHolder, PaddingTop = udim(v84[67], -v84[28]) })
														arg:CreateObjects("UIPadding", { Parent = objects.LeftBarHolder, PaddingRight = udim(0, 0) })
														arg:CreateObjects(v84[62], { Parent = objects.BottomBarHolder, PaddingTop = udim(0, 2) })
														arg:CreateObjects("UIPadding", { Parent = objects.LeftHolder, PaddingRight = udim(0, v84[115]) })

														objects.BoxGlow = arg:CreateObjects(v84[179], {
															Parent = objects[v84[44]],
															Image = "rbxassetid://110204605000367",
															ScaleType = Enum.ScaleType.Slice,
															SliceCenter = Rect.new(vector2(21, 21), vector2(79, 79)),
															AutomaticSize = Enum.AutomaticSize.XY,
															ImageTransparency = 0.65,
															ResampleMode = Enum.ResamplerMode.Pixelated,
															Visible = true,
															BackgroundTransparency = 1,
															Position = udim2(0, -21, 0, -21),
															Size = udim2(0, 0, v84[67], 0),
															BorderSizePixel = v84[67],
															BorderColor3 = Color3.fromRGB(v84[67], v84[67], 0),
															BackgroundColor3 = Color3.fromRGB(255, v84[12], 255),
														})

														local new2 = ColorSequenceKeypoint.new
														local color = Color3.fromRGB

														objects.BoxGlowGradient = arg:CreateObjects("UIGradient", {
															Parent = objects.BoxGlow,
															Rotation = 90,
															Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, v84[67], 0)), new2(1, color(0, 0, 0)) }),
															Transparency = numberSequence({ new(0, 0), new(1, 0) }),
														})

														arg:CreateObjects("UIPadding", {
															Parent = objects[v84[105]],
															PaddingTop = udim(0, 21),
															PaddingBottom = udim(v84[67], 20),
															PaddingLeft = udim(0, v84[142]),
															PaddingRight = udim(0, 20),
														})

														objects.BoxOutlineHolder = arg:CreateObjects("Frame", {
															Parent = objects.BoxGlow,
															Visible = false,
															BackgroundTransparency = v84[115],
															Position = udim2(0, v84[67], 0, 0),
															Size = udim2(0, 0, v84[67], 0),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, v84[67], 0),
															BackgroundColor3 = Color3.fromRGB(255, v84[12], 255),
														})

														objects.BoxOutline = arg:CreateObjects("UIStroke", { Parent = objects.BoxOutlineHolder, Thickness = 3, LineJoinMode = Enum.LineJoinMode.Miter })
														local new3 = ColorSequenceKeypoint.new
														local color2 = Color3.fromRGB
														local v104 = v84[67]
														local v105 = v84[115]

														objects.BoxOutlineGradient = arg:CreateObjects("UIGradient", {
															Parent = objects.BoxOutline,
															Rotation = 90,
															Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(v84[67], 0, 0)), new3(1, color2(0, 0, v104)) }),
															Transparency = numberSequence({ new(0, 0), new(v105, 0) }),
														})

														objects[v84[102]] = arg:CreateObjects(v84[34], {
															Parent = objects.BoxGlow,
															Visible = false,
															BackgroundTransparency = 1,
															Position = udim2(0, -1, 0, -1),
															Size = udim2(v84[67], 0, 0, 0),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, v84[67], 0),
															BackgroundColor3 = Color3.fromRGB(255, 255, v84[12]),
														})

														objects.BoxInline = arg:CreateObjects("UIStroke", {
															Parent = objects.BoxInlineHolder,
															Color = Color3.fromRGB(v84[12], v84[12], v84[12]),
															LineJoinMode = Enum.LineJoinMode.Miter,
														})

														local new4 = ColorSequenceKeypoint.new
														local color3 = Color3.fromRGB
														local v106 = v84[12]

														objects[v84[182]] = arg:CreateObjects(v84[161], {
															Parent = objects.BoxInline,
															Rotation = 90,
															Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), new4(1, color3(255, v106, 255)) }),
															Transparency = numberSequence({ new(v84[67], 0), new(1, 0) }),
														})

														objects[v84[21]] = arg:CreateObjects("Frame", {
															Parent = objects[v84[105]],
															Visible = false,
															BackgroundTransparency = 0,
															Position = udim2(v84[67], 0, v84[67], 0),
															Size = udim2(0, v84[67], 0, 0),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, 0, v84[67]),
															BackgroundColor3 = Color3.fromRGB(255, 255, v84[12]),
														})

														local new5 = ColorSequenceKeypoint.new
														local color4 = Color3.fromRGB

														objects[v84[11]] = arg:CreateObjects(v84[161], {
															Parent = objects.BoxFill,
															Rotation = v84[94],
															Color = ColorSequence.new({ ColorSequenceKeypoint.new(v84[67], Color3.fromRGB(0, 0, 0)), new5(1, color4(255, 255, 255)) }),
															Transparency = numberSequence({ new(0, v84[115]), new(1, 1) }),
														})

														objects.CornerHolder = arg:CreateObjects("Frame", {
															Parent = objects[v84[105]],
															Visible = false,
															BackgroundTransparency = 1,
															Position = udim2(0, -1, v84[67], -1),
															Size = udim2(v84[67], 0, v84[67], 0),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(v84[67], v84[67], 0),
															BackgroundColor3 = Color3.fromRGB(v84[12], 255, 255),
														})

														for i = 1, 8 do
															objects[v84[186] .. i] = arg:CreateObjects("Frame", {
																Parent = objects.CornerHolder,
																Visible = v84[35],
																BackgroundTransparency = 0,
																Position = udim2(0, 0, 0, 0),
																Size = udim2(v84[67], v84[67], v84[67], 0),
																BorderSizePixel = 0,
																BorderColor3 = Color3.fromRGB(0, 0, 0),
																BackgroundColor3 = Color3.fromRGB(v84[12], v84[12], 255),
															})

															arg:CreateObjects(v84[131], { Parent = objects[v84[186] .. i], Thickness = 1, LineJoinMode = Enum.LineJoinMode.Miter })
														end

														objects.HealthBarOutline = arg:CreateObjects(v84[34], {
															Parent = objects.LeftBarHolder,
															ZIndex = 5,
															LayoutOrder = 0,
															Visible = false,
															BackgroundTransparency = v84[67],
															Position = udim2(v84[67], 0, 0, 0),
															Size = udim2(0, v84[26], 1, 0),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, 0, v84[67]),
															BackgroundColor3 = Color3.fromRGB(v84[67], v84[67], v84[67]),
															ClipsDescendants = v84[35],
														})

														arg:CreateObjects("UIStroke", { Parent = objects.HealthBarOutline, Thickness = 1, LineJoinMode = Enum.LineJoinMode.Miter })

														objects.HealthBar = arg:CreateObjects("Frame", {
															Parent = objects[v84[55]],
															ZIndex = v84[177],
															AnchorPoint = vector2(0, 1),
															Position = udim2(0, 0, v84[115], 0),
															Size = udim2(1, v84[67], 1, v84[67]),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, 0, 0),
															BackgroundColor3 = Color3.fromRGB(v84[12], 255, 255),
															ClipsDescendants = true,
														})

														local createObjects = arg.CreateObjects
														local tbl29 = { Parent = objects.HealthBar, Rotation = 90 }
														local colorSequence = ColorSequence.new
														local tbl30 = {}
														local v107 = ColorSequenceKeypoint.new(0, v102.Bars["Health Bar"][v84[27]])
														local v108 = ColorSequenceKeypoint.new(v84[155], v102.Bars["Health Bar"].Mid)
														local new6 = ColorSequenceKeypoint.new
														local bot = v102.Bars["Health Bar"].Bot
														tbl30[1] = v107
														tbl30[2] = v108

														do
															local values = table.pack(new6(1, bot))
															table.move(values, 1, values.n, 3, tbl30)
														end

														tbl29.Color = colorSequence(tbl30)
														local v109 = v84[115]
														tbl29.Transparency = numberSequence({ new(v84[67], 0), new(v109, 0) })
														objects.HealthBarGradient = createObjects(arg, "UIGradient", tbl29)

														objects.HealthBarText = arg:CreateObjects("TextLabel", {
															Parent = objects.HealthBarOutline,
															FontFace = index.Minecraftia,
															TextSize = 14,
															ZIndex = v84[31],
															TextColor3 = Color3.fromRGB(255, v84[12], 255),
															Text = "",
															TextXAlignment = Enum.TextXAlignment.Center,
															TextYAlignment = Enum.TextYAlignment.Center,
															AnchorPoint = vector2(0.5, v84[155]),
															Position = udim2(v84[155], v84[67], 1, 0),
															BorderSizePixel = v84[67],
															Visible = false,
															BackgroundTransparency = 1,
															AutomaticSize = Enum.AutomaticSize.XY,
															Size = udim2(0, 0, 0, v84[67]),
														})

														arg:CreateObjects(v84[131], {
															Parent = objects.HealthBarText,
															Color = Color3.fromRGB(0, v84[67], 0),
															LineJoinMode = Enum.LineJoinMode.Miter,
														})

														objects.ArmorBarOutline = arg:CreateObjects("Frame", {
															Parent = objects.BottomBarHolder,
															ZIndex = 5,
															LayoutOrder = 0,
															Visible = v84[35],
															BackgroundTransparency = 0,
															Position = udim2(0, v84[67], v84[67], 0),
															Size = udim2(1, 0, 0, 4),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(v84[67], v84[67], v84[67]),
															BackgroundColor3 = Color3.fromRGB(0, 0, 0),
															ClipsDescendants = v84[126],
														})

														arg:CreateObjects("UIStroke", { Parent = objects[v84[190]], Thickness = v84[115], LineJoinMode = Enum.LineJoinMode.Miter })

														objects.ArmorBar = arg:CreateObjects("Frame", {
															Parent = objects.ArmorBarOutline,
															ZIndex = v84[177],
															AnchorPoint = vector2(0, v84[67]),
															Position = udim2(v84[67], 0, 0, 0),
															Size = udim2(1, 0, 1, 0),
															BorderSizePixel = 0,
															BorderColor3 = Color3.fromRGB(0, 0, 0),
															BackgroundColor3 = Color3.fromRGB(v84[12], v84[12], 255),
														})

														local createObjects2 = arg.CreateObjects
														local tbl31 = { Parent = objects[v84[98]], Rotation = 0 }
														local colorSequence2 = ColorSequence.new
														local tbl32 = {}
														local v110 = ColorSequenceKeypoint.new(0, v102.Bars[v84[141]].Top)
														local v111 = ColorSequenceKeypoint.new(0.5, v102.Bars["Armor Bar"][v84[77]])
														local new7 = ColorSequenceKeypoint.new
														local v112 = v84[115]
														local bot2 = v102[v84[82]]["Armor Bar"].Bot
														tbl32[1] = v110
														tbl32[2] = v111

														do
															local values = table.pack(new7(v112, bot2))
															table.move(values, 1, values.n, 3, tbl32)
														end

														tbl31.Color = colorSequence2(tbl32)
														local v113 = v84[115]
														tbl31.Transparency = numberSequence({ new(v84[67], 0), new(v113, 0) })
														objects.ArmorBarGradient = createObjects2(arg, "UIGradient", tbl31)

														objects.ArmorBarText = arg:CreateObjects("TextLabel", {
															Parent = objects[v84[98]],
															FontFace = index.Minecraftia,
															TextSize = v84[123],
															ZIndex = v84[31],
															TextColor3 = Color3.fromRGB(255, v84[12], 255),
															Text = "",
															TextXAlignment = Enum.TextXAlignment.Center,
															AnchorPoint = vector2(0.5, 0.5),
															Position = udim2(v84[155], 0, 0.5, 0),
															BorderSizePixel = 0,
															Visible = v84[35],
															BackgroundTransparency = 1,
															AutomaticSize = Enum.AutomaticSize.XY,
															Size = udim2(v84[67], 0, 0, 0),
														})

														arg:CreateObjects("UIStroke", {
															Parent = objects.ArmorBarText,
															Color = Color3.fromRGB(0, 0, 0),
															LineJoinMode = Enum.LineJoinMode.Miter,
														})

														objects[v84[150]] = arg:CreateObjects("TextLabel", {
															Parent = objects[v84[68]],
															FontFace = index.Minecraftia,
															TextSize = v84[123],
															LayoutOrder = 2,
															TextColor3 = v102.Texts[v84[103]].Color,
															Text = "",
															TextXAlignment = Enum.TextXAlignment.Center,
															BorderSizePixel = 0,
															Visible = v84[35],
															BackgroundTransparency = v84[115],
															ZIndex = 5,
															AutomaticSize = Enum.AutomaticSize.XY,
															Size = udim2(0, 0, 0, 0),
														})

														arg:CreateObjects(v84[131], {
															Parent = objects.TargetName,
															Color = Color3.fromRGB(v84[67], 0, 0),
															LineJoinMode = Enum.LineJoinMode.Miter,
														})

														objects.Distance = arg:CreateObjects("TextLabel", {
															Parent = objects.BottomTextHolder,
															FontFace = index.Minecraftia,
															TextSize = 14,
															LayoutOrder = 2,
															TextColor3 = v102.Texts.Distance.Color,
															Text = "",
															TextXAlignment = Enum.TextXAlignment.Center,
															BorderSizePixel = 0,
															Visible = v84[35],
															BackgroundTransparency = v84[115],
															ZIndex = 5,
															AutomaticSize = Enum.AutomaticSize.XY,
															Size = udim2(0, v84[67], 0, 0),
														})

														arg:CreateObjects("UIStroke", { Parent = objects[v84[17]], Color = Color3.fromRGB(0, 0, 0), LineJoinMode = Enum.LineJoinMode.Miter })

														objects[v84[75]] = arg:CreateObjects("TextLabel", {
															Parent = objects.RightTextHolder,
															FontFace = index.Minecraftia,
															TextSize = 14,
															LayoutOrder = 1,
															TextColor3 = v102[v84[145]].Walking[v84[194]],
															Text = v102.Flags.Walking.Text,
															TextXAlignment = Enum.TextXAlignment.Left,
															BorderSizePixel = 0,
															Visible = false,
															BackgroundTransparency = 1,
															ZIndex = 5,
															AutomaticSize = Enum.AutomaticSize.XY,
															Size = udim2(0, 0, 0, v84[67]),
														})

														arg:CreateObjects("UIStroke", {
															Parent = objects.WalkFlag,
															Color = Color3.fromRGB(v84[67], 0, 0),
															LineJoinMode = Enum.LineJoinMode.Miter,
														})

														objects.JumpFlag = arg:CreateObjects(v84[64], {
															Parent = objects[v84[106]],
															FontFace = index.Minecraftia,
															TextSize = 14,
															LayoutOrder = 2,
															TextColor3 = v102.Flags[v84[154]].Color,
															Text = v102.Flags.Jumping.Text,
															TextXAlignment = Enum.TextXAlignment.Left,
															BorderSizePixel = 0,
															Visible = false,
															BackgroundTransparency = 1,
															ZIndex = 5,
															AutomaticSize = Enum.AutomaticSize.XY,
															Size = udim2(v84[67], 0, 0, v84[67]),
														})

														arg:CreateObjects("UIStroke", {
															Parent = objects.JumpFlag,
															Color = Color3.fromRGB(v84[67], v84[67], 0),
															LineJoinMode = Enum.LineJoinMode.Miter,
														})

														objects[v84[149]] = arg:CreateObjects(v84[64], {
															Parent = objects.RightTextHolder,
															FontFace = index.Minecraftia,
															TextSize = 14,
															LayoutOrder = 4,
															TextColor3 = v102.Flags.Swimming.Color,
															Text = v102.Flags.Swimming[v84[1]],
															TextXAlignment = Enum.TextXAlignment.Left,
															BorderSizePixel = v84[67],
															Visible = false,
															BackgroundTransparency = 1,
															ZIndex = v84[32],
															AutomaticSize = Enum.AutomaticSize.XY,
															Size = udim2(0, 0, v84[67], 0),
														})

														arg:CreateObjects(v84[131], {
															Parent = objects[v84[149]],
															Color = Color3.fromRGB(0, v84[67], 0),
															LineJoinMode = Enum.LineJoinMode.Miter,
														})

														objects[v84[191]] = arg:CreateObjects("TextLabel", {
															Parent = objects.BottomTextHolder,
															FontFace = index.Minecraftia,
															TextSize = v84[123],
															LayoutOrder = 3,
															TextColor3 = v102.Texts.Weapon[v84[194]],
															Text = "none",
															TextXAlignment = Enum.TextXAlignment.Center,
															BorderSizePixel = 0,
															Visible = false,
															BackgroundTransparency = 1,
															ZIndex = 5,
															AutomaticSize = Enum.AutomaticSize.XY,
															Size = udim2(0, 0, 0, 0),
														})

														arg:CreateObjects("UIStroke", {
															Parent = objects.Weapon,
															Color = Color3.fromRGB(v84[67], 0, 0),
															LineJoinMode = Enum.LineJoinMode.Miter,
														})

														objects.Highlight = arg:CreateObjects(v84[165], {
															Parent = arg.Holder,
															FillColor = Color3.fromRGB(v84[12], 255, 255),
															OutlineColor = Color3.fromRGB(0, 0, 0),
															FillTransparency = v102[v84[128]].FillTransparency,
															OutlineTransparency = 0,
															DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
															Enabled = v84[35],
														})
													end
												end
											end

											do
												tbl26 = {}
												tbl27 = {}

												do
													local v103 = udim2(0, -1, 0, -1)
													local v104 = udim2(0.3, v84[67], 0, 1)
													local v105 = vector2(0, 0)
													tbl27[1] = v103
													tbl27[2] = v104
													tbl27[3] = v105
												end
											end

											tbl27[4] = 0
											tbl28 = {}

											do
												local v103 = udim2(0, -1, 0, -1)
												local v104 = udim2(v84[67], 1, 0.3, 0)
												local v105 = vector2(0, 0)
												local v106 = v84[118]
												tbl28[1] = v103
												tbl28[2] = v104
												tbl28[3] = v105
												tbl28[4] = v106
											end
										end

										local tbl29, tbl30, tbl31

										do
											do
												tbl29 = {}

												do
													local v103 = udim2(1, v84[115], v84[67], -1)
													local v104 = udim2(v84[13], 0, v84[67], v84[115])
													local v105 = vector2(1, 0)
													local v106 = v84[67]
													tbl29[1] = v103
													tbl29[2] = v104
													tbl29[3] = v105
													tbl29[4] = v106
												end
											end

											do
												tbl30 = {}

												do
													local v103 = udim2(1, 1, v84[67], -v84[115])
													local v104 = udim2(0, 1, 0.3, v84[67])
													local v105 = vector2(v84[115], 0)
													tbl30[1] = v103
													tbl30[2] = v104
													tbl30[3] = v105
												end
											end

											tbl30[4] = 180
											tbl31 = {}

											do
												local v103 = udim2(0, -1, 1, 1)
												local v104 = udim2(v84[13], 0, 0, v84[115])
												local v105 = vector2(v84[67], 1)
												tbl31[1] = v103
												tbl31[2] = v104
												tbl31[3] = v105
											end
										end

										local tbl32, tbl33

										do
											do
												tbl31[4] = 0
												tbl32 = {}

												do
													local v103 = udim2(0, -1, 1, v84[115])
													local v104 = udim2(0, 1, 0.3, 0)
													local v105 = vector2(0, 1)
													tbl32[1] = v103
													tbl32[2] = v104
													tbl32[3] = v105
												end
											end

											tbl32[4] = -180
											tbl33 = {}

											do
												local v103 = udim2(1, 1, 1, v84[115])
												local v104 = udim2(v84[13], v84[67], v84[67], 1)
												local v105 = vector2(1, v84[115])
												local v106 = v84[67]
												tbl33[1] = v103
												tbl33[2] = v104
												tbl33[3] = v105
												tbl33[4] = v106
											end
										end

										do
											local tbl34 = {}
											local v103 = udim2(1, 1, 1, 1)
											local v104 = udim2(0, v84[115], 0.3, 0)
											local v105 = vector2(1, 1)
											local n44 = -v84[118]
											tbl34[1] = v103
											tbl34[2] = v104
											tbl34[3] = v105
											tbl34[4] = n44
											tbl26[1] = tbl27
											tbl26[2] = tbl28
											tbl26[3] = tbl29
											tbl26[4] = tbl30
											tbl26[5] = tbl31
											tbl26[6] = tbl32
											tbl26[7] = tbl33
											tbl26[8] = tbl34
										end

										index.CalculateBox = function(arg, arg2)
											local v103 = arg2[v84[52]]
											if not v103 then
												return nil, nil, nil, nil, false
											end
											local v104, v105 = worldToViewportPoint(currentCamera2, v103.Position)
											if not v105 then
												return nil, nil, nil, nil, false
											end
											local n44 = v103.Size.Y * n43 / v104.Z * 2
											local n45 = 3 * n44
											local n46 = v84[125] * n44
											return n45, n46, v104.X - n45 * 0.5, v104.Y - n46 * 0.5, v105
										end

										index.AddTarget = function(arg, arg2)
											if arg2 == localPlayer2 and not v102.ShowLocalPlayer then
												return
											end

											if arg.Cache[arg2] then
												return
											end

											local tbl34 = {
												Player = arg2,
												Objects = {},
												Conns = {},
												Character = nil,
												RootPart = nil,
												[v84[33]] = nil,
												Children = nil,
												[v84[197]] = 0,
												MaxHealth = 100,
												Armor = 100,
												MaxArmor = 100,
												CurrentTool = nil,
												Alive = false,
												LastChamsT = nil,
												LastW = nil,
												LastH = nil,
												LastX = nil,
												LastY = nil,
												[v84[5]] = false,
												[v84[199]] = false,
												[v84[117]] = v84[35],
												[v84[113]] = false,
												LastGlowTop = nil,
												LastGlowBot = nil,
												LastGlowT1 = nil,
												LastGlowT2 = nil,
												LastGradTop = nil,
												[v84[18]] = nil,
												[v84[22]] = nil,
												LastFillBot = nil,
												LastFillT1 = nil,
												[v84[40]] = nil,
												[v84[175]] = nil,
												LastDistColor = nil,
												LastDisplayName = nil,
												LastNameColor = nil,
												LastHealthTop = nil,
												LastHealthMid = nil,
												[v84[163]] = nil,
												LastHealthFloor = nil,
												LastRatio = nil,
												LastArmorTop = nil,
												LastArmorMid = nil,
												[v84[185]] = nil,
												LastArmorFloor = nil,
												LastArmorRatio = nil,
												LastWeapon = nil,
												[v84[110]] = nil,
												LastChamsFill = nil,
												LastChamsOutline = nil,
												CustomGradTop = getgenv()._ZH_PlayerESPColor,
												CustomGradBot = getgenv()._ZH_PlayerESPColor,
											}

											arg:InitEsp(tbl34)
											arg.Cache[arg2] = tbl34

											tbl34.BindHealth = ({ BindHealth = function(humanoid)
												if tbl34.Conns.Health then
													tbl34[v84[6]][v84[197]]:Disconnect()
												end

												if tbl34.Conns.Died then
													tbl34[v84[6]][v84[109]]:Disconnect()
												end

												tbl34.Humanoid = humanoid
												tbl34.Health = humanoid.Health
												tbl34.MaxHealth = humanoid.MaxHealth
												tbl34.Alive = tbl34.Health > 0

												tbl34.Conns.Health = humanoid.HealthChanged:Connect(function(health)
													tbl34[v84[57]] = health > v84[67]
													tbl34.Health = health
												end)

												tbl34.Conns[v84[109]] = humanoid.Died:Connect(function()
													tbl34[v84[57]] = v84[35]
												end)
											end }).BindHealth

											tbl34[v84[56]] = ({ BindTool = function(arg3)
												if tbl34.Conns[v84[37]] then
													tbl34.Conns.ToolAdded:Disconnect()
												end

												if tbl34.Conns.ToolRemoved then
													tbl34[v84[6]][v84[79]]:Disconnect()
												end

												if tbl34.Children then
													for _, v103 in tbl34.Children, nil, nil do
														if v103:IsA("Tool") then
															tbl34.CurrentTool = v103.Name
															break
														end
													end
												end

												tbl34[v84[6]].ToolAdded = arg3.ChildAdded:Connect(function(child)
													if child:IsA("Tool") then
														tbl34.CurrentTool = child.Name
													end
												end)

												tbl34.Conns[v84[79]] = arg3.ChildRemoved:Connect(function(child)
													if child:IsA(v84[45]) then
														tbl34.CurrentTool = nil
													end
												end)
											end }).BindTool

											tbl34[v84[92]] = ({ BindChildren = function(arg3)
												if tbl34.Conns.ChildAdded then
													tbl34.Conns[v84[107]]:Disconnect()
												end

												if tbl34.Conns.ChildRemoved then
													tbl34.Conns.ChildRemoved:Disconnect()
												end

												local children = arg3:GetChildren()
												tbl34.Children = children

												tbl34.Conns.ChildAdded = arg3.ChildAdded:Connect(function(child)
													children[#children + 1] = child
												end)

												tbl34.Conns[v84[156]] = arg3.ChildRemoved:Connect(function(child)
													for i = #children, 1, -1 do
														if children[i] == child then
															remove2(children, i)
															break
														end
													end
												end)

												tbl34.BindTool(arg3)
											end }).BindChildren

											tbl34.BindFlags = ({ BindFlags = function(arg3)
												if tbl34.Conns[v84[7]] then
													tbl34.Conns.MoveDir:Disconnect()
												end

												if tbl34[v84[6]].StateChange then
													tbl34.Conns.StateChange:Disconnect()
												end

												local objects = tbl34.Objects
												tbl34.JumpActive = v84[35]
												tbl34.WalkActive = v84[35]
												tbl34.FallingActive = false
												tbl34.SwimmingActive = false
												objects.WalkFlag.Visible = false
												objects.JumpFlag.Visible = false
												objects.SwimmingFlag.Visible = false

												tbl34.Conns[v84[7]] = arg3:GetPropertyChangedSignal("MoveDirection"):Connect(function()
													local flag25 = arg3.MoveDirection ~= v100

													if flag25 and not tbl34[v84[5]] then
														tbl34.WalkActive = true

														if tbl34.JumpActive then
															objects.WalkFlag.LayoutOrder = v84[119]
														else
															objects.WalkFlag.LayoutOrder = 1
															objects.JumpFlag.LayoutOrder = 2
														end

														objects[v84[75]].Visible = v102.Flags[v84[108]][v84[100]]
													elseif not flag25 and tbl34.WalkActive then
														tbl34.WalkActive = false
														objects.WalkFlag.Visible = false
													end
												end)

												tbl34.Conns[v84[2]] = arg3.StateChanged:Connect(function(old, new2)
													if new2 == Enum.HumanoidStateType.Jumping and not tbl34.JumpActive then
														tbl34[v84[199]] = true
														objects.JumpFlag.Visible = v102.Flags.Jumping[v84[100]]

														if tbl34.WalkActive then
															objects.JumpFlag.LayoutOrder = v84[119]
														else
															objects.JumpFlag.LayoutOrder = 1
															objects.WalkFlag.LayoutOrder = 2
														end
													elseif new2 == Enum.HumanoidStateType.Landed and tbl34[v84[199]] then
														tbl34.JumpActive = false
														objects[v84[97]].Visible = false

														if tbl34.WalkActive then
															objects.WalkFlag.LayoutOrder = 1
														end
													end

													if new2 == Enum.HumanoidStateType.Swimming and not tbl34.SwimmingActive then
														tbl34.SwimmingActive = v84[126]
														objects[v84[149]].Visible = v102.Flags.Swimming.Enabled
													elseif new2 ~= Enum.HumanoidStateType.Swimming and tbl34.SwimmingActive then
														tbl34.SwimmingActive = v84[35]
														objects.SwimmingFlag.Visible = v84[35]
													end
												end)
											end }).BindFlags

											local tbl35 = { OnCharacter = function(character)
												tbl34.Character = character
												tbl34.RootPart = nil
												tbl34[v84[33]] = nil
												tbl34[v84[4]] = nil
												tbl34.Alive = v84[35]
												tbl34.WalkActive = false
												tbl34[v84[199]] = false
												tbl34[v84[117]] = false
												tbl34.SwimmingActive = false

												if not character or not character.Parent then
													if n25 <= 4371 then
														while v84[126] do
														end
													end

													return
												end

												local humanoidRootPart = findFirstChild(character, "HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 10)
												local humanoid = findFirstChildOfClass(character, "Humanoid") or character:WaitForChild("Humanoid", 10)
												if not humanoidRootPart or not humanoid then
													return
												end

												if not character.Parent then
													return
												end
												tbl34.RootPart = humanoidRootPart
												tbl34.Humanoid = humanoid
												tbl34.BindChildren(character)
												tbl34.BindHealth(humanoid)
											end }

											tbl34.Conns.CharAdded = arg2.CharacterAdded:Connect(function(character)
												task.defer(tbl35.OnCharacter, character)
											end)

											if arg2.Character and arg2.Character.Parent then
												task.defer(tbl35.OnCharacter, arg2.Character)
											end
										end

										index.RemoveTarget = function(arg, arg2)
											local v103 = arg.Cache[arg2]
											if not v103 then
												return
											end

											for _, v104 in v103.Conns, nil, nil do
												v104:Disconnect()
											end

											clear(v103.Conns)

											if v103.Objects[v84[165]] then
												pcall(function()
													v103.Objects[v84[165]]:Destroy()
												end)
											end

											if v103.Objects.TargetHolder then
												v103.Objects.TargetHolder:Destroy()
											end

											clear(v103[v84[104]])
											arg.Cache[arg2] = nil
										end

										index.Update = function(arg, arg2, arg3)
											local objects = arg3.Objects

											if not arg3.RootPart then
												if objects.TargetHolder.Visible then
													objects.TargetHolder.Visible = false
												end

												return
											end

											if not arg3[v84[57]] then
												if objects.TargetHolder.Visible then
													objects[v84[44]].Visible = false
												end

												return
											end

											local v103 = floor2((position - arg3[v84[52]].Position).Magnitude)

											if v102.Distance < v103 then
												if objects.TargetHolder.Visible then
													objects.TargetHolder.Visible = false
												end

												return
											end

											local v104, v105, v106, v107, v108 = arg:CalculateBox(arg3)

											if not v108 or not v104 then
												if objects[v84[44]].Visible then
													objects[v84[44]].Visible = false
												end

												return
											end

											if not objects.TargetHolder.Visible then
												objects[v84[44]].Visible = true
											end

											local flag25 = arg3.RawX == nil
											local rawX = arg3.RawX or v106
											local rawY = arg3.RawY or v107
											local rawW = arg3.RawW or v104
											local rawH = arg3.RawH or v105
											local flag26 = flag25 or abs(v106 - rawX) > 1 or abs(v107 - rawY) > 1
											flag25 = flag25 or abs(v104 - rawW) > v84[115]

											if not flag25 then
												local v109 = v84[115]
												flag25 = abs(v105 - rawH) > v109
											end

											if flag26 then
												local v109 = floor2(v106 + 0.5)
												local v110 = floor2(v107 + 0.5)
												objects.TargetHolder.Position = udim22(v109, v110)
												arg3[v84[81]] = v106
												arg3.RawY = v107
												arg3.LastX = v109
												arg3[v84[160]] = v110
											end

											if flag25 then
												local v109 = floor2(v104 + 0.5)
												local v110 = floor2(v105 + 0.5)
												objects[v84[44]].Size = udim22(v109, v110)
												objects.BoxGlow.Size = udim22(v109, v110)
												objects.BoxOutlineHolder.Size = udim22(v109, v110)
												objects.BoxInlineHolder.Size = udim22(v109 + 2, v110 + 2)
												objects.BoxFill.Size = udim22(v109, v110)
												objects[v84[193]].Size = udim22(v109 + 2, v110 + v84[119])
												arg3.RawW = v104
												arg3[v84[29]] = v105
												arg3.LastW = v109
												arg3[v84[164]] = v110
											end

											local boxes = v102.Boxes
											local v109 = v102[v84[96]]

											if boxes[v84[100]] then
												if boxes["Box Glow"].Enabled then
													if objects[v84[105]].ImageTransparency ~= 0 then
														objects.BoxGlow.ImageTransparency = v84[67]
													end

													local customGradTop = arg3.CustomGradTop or boxes["Box Glow"].Top
													local customGradBot = arg3.CustomGradBot or boxes["Box Glow"][v84[39]]

													if arg3.LastGlowTop ~= customGradTop or arg3[v84[174]] ~= customGradBot then
														local new2 = ColorSequenceKeypoint.new
														local v110 = v84[115]
														objects[v84[138]].Color = ColorSequence.new({ ColorSequenceKeypoint.new(v84[67], customGradTop), new2(v110, customGradBot) })
														arg3.LastGlowTop = customGradTop
														arg3[v84[174]] = customGradBot
													end

													local v110 = boxes[v84[25]][v84[168]][v84[115]]
													local v111 = boxes[v84[25]].Transparency[v84[119]]

													if arg3.LastGlowT1 ~= v110 or arg3.LastGlowT2 ~= v111 then
														objects.BoxGlowGradient.Transparency = numberSequence({ new(v84[67], v110), new(1, v111) })
														arg3.LastGlowT1 = v110
														arg3.LastGlowT2 = v111
													end
												elseif objects.BoxGlow.ImageTransparency ~= v84[115] then
													objects.BoxGlow.ImageTransparency = 1
												end

												if boxes.Type == v84[189] then
													if objects.BoxOutlineHolder.Visible then
														objects.BoxOutlineHolder.Visible = false
													end

													if objects.BoxInlineHolder.Visible then
														objects[v84[102]].Visible = false
													end

													if objects.BoxFill.Visible then
														objects.BoxFill.Visible = false
													end

													if not objects.CornerHolder.Visible then
														objects.CornerHolder.Visible = v84[126]
													end

													local customGradTop = arg3.CustomGradTop or boxes.Gradients.Top

													for i = v84[115], v84[70] do
														local v110 = objects["Line_" .. i]
														local uiStroke = v110:FindFirstChildOfClass("UIStroke")
														local v111 = tbl26[i]
														v110.Position = v111[v84[115]]
														v110.Size = v111[2]
														v110.AnchorPoint = v111[3]
														v110.Rotation = v111[4]
														v110.BackgroundColor3 = customGradTop
														v110.BackgroundTransparency = 0

														if uiStroke then
															uiStroke.Color = customGradTop
														end

														v110.Visible = v84[126]
													end
												else
													if objects.CornerHolder.Visible then
														objects.CornerHolder.Visible = false
													end

													for i = 1, v84[70] do
														if objects[v84[186] .. i].Visible then
															objects[v84[186] .. i].Visible = false
														end
													end

													if not objects.BoxOutlineHolder.Visible then
														objects[v84[152]].Visible = true
													end

													if not objects.BoxInlineHolder.Visible then
														objects[v84[102]].Visible = true
													end

													local customGradTop = arg3.CustomGradTop or boxes[v84[171]].Top
													local customGradBot = arg3.CustomGradBot or boxes.Gradients[v84[39]]

													if arg3.LastGradTop ~= customGradTop or arg3.LastGradBot ~= customGradBot then
														local new2 = ColorSequenceKeypoint.new
														objects.BoxInlineGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(v84[67], customGradTop), new2(1, customGradBot) })
														arg3.LastGradTop = customGradTop
														arg3.LastGradBot = customGradBot
													end

													if not flag3 then
														return
													end

													if boxes.Filled[v84[100]] then
														if not objects.BoxFill.Visible then
															objects.BoxFill.Visible = true
														end

														local customGradTop2 = arg3.CustomGradTop or boxes.Filled.Top
														local customGradBot2 = arg3.CustomGradBot or boxes[v84[38]].Bot
														local v110 = boxes.Filled[v84[168]][v84[115]]
														local v111 = boxes[v84[38]].Transparency[2]

														if arg3.LastFillTop ~= customGradTop2 or arg3.LastFillBot ~= customGradBot2 then
															local new2 = ColorSequenceKeypoint.new
															objects[v84[11]].Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, customGradTop2), new2(1, customGradBot2) })
															arg3.LastFillTop = customGradTop2
															arg3[v84[72]] = customGradBot2
														end

														if arg3[v84[121]] ~= v110 or arg3.LastFillT2 ~= v111 then
															objects[v84[11]].Transparency = numberSequence({ new(0, v110), new(1, v111) })
															arg3.LastFillT1 = v110
															arg3.LastFillT2 = v111
														end
													elseif objects.BoxFill.Visible then
														objects.BoxFill.Visible = false
													end
												end
											else
												if objects.BoxGlow.ImageTransparency ~= v84[115] then
													objects.BoxGlow.ImageTransparency = 1
												end

												if objects.BoxOutlineHolder.Visible then
													objects[v84[152]].Visible = v84[35]
												end

												if objects[v84[102]].Visible then
													objects[v84[102]].Visible = false
												end

												if objects.BoxFill.Visible then
													objects.BoxFill.Visible = v84[35]
												end

												if objects.CornerHolder.Visible then
													objects[v84[193]].Visible = false
												end

												for i = 1, 8 do
													if objects[v84[186] .. i].Visible then
														objects["Line_" .. i].Visible = false
													end
												end
											end

											if v109.Name.Enabled then
												if not objects.TargetName.Visible then
													if n25 >= 4392 then
														while true do
														end
													else
														objects.TargetName.Visible = true
													end
												end

												local displayName = arg3.DisplayName or arg2 and arg2.DisplayName or "?"

												if arg3.LastDisplayName ~= displayName then
													objects.TargetName.Text = displayName
													arg3.LastDisplayName = displayName
												end

												local color = v109.Name.Color

												if arg3.LastNameColor ~= color then
													objects[v84[150]].TextColor3 = color
													arg3.LastNameColor = color
												end
											elseif objects.TargetName.Visible then
												objects.TargetName.Visible = false
											end

											if v109[v84[17]][v84[100]] then
												if not objects.Distance.Visible then
													objects.Distance.Visible = true
												end

												if arg3[v84[175]] ~= v103 then
													objects.Distance.Text = format("%dst", v103)
													arg3.LastDist = v103
												end

												local v110 = v109[v84[17]][v84[194]]

												if arg3.LastDistColor ~= v110 then
													objects.Distance.TextColor3 = v110
													arg3.LastDistColor = v110
												end
											elseif objects.Distance.Visible then
												objects.Distance.Visible = false
											end

											local armorBar = v102.Bars["Armor Bar"]

											if v102.Bars["Health Bar"].Enabled then
												local health = arg3.Health or 0
												local v110 = clamp(health / (arg3.MaxHealth or v84[153]), 0, 1)

												if not objects.LeftBarHolder.Visible then
													objects.LeftBarHolder.Visible = true
												end

												if not objects.HealthBarOutline.Visible then
													objects.HealthBarOutline.Visible = true
												end

												local flag27 = arg3[v84[122]] ~= v110

												if flag27 then
													objects[v84[196]].Size = udim2(1, 0, v110, 0)
													arg3.LastRatio = v110
												end

												local n44 = v110 * v84[51]
												local color = Color3.fromHSV(n44, 1, 1)
												local v111 = v84[170]
												local color2 = Color3.fromHSV(clamp(n44 - 0.05, v84[67], 0.33), 1, v111)

												if arg3[v84[59]] ~= n44 then
													local v112 = v84[195]

													if n26(1675) < v112 then
														local new2 = ColorSequenceKeypoint.new
														objects.HealthBarGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(v84[67], color), new2(1, color2) })
														arg3[v84[59]] = n44
													else
														while v84[126] do
														end
													end
												end

												if not objects.HealthBarText.Visible then
													objects.HealthBarText.Visible = true
												end

												local v112 = floor2(health)

												if arg3.LastHealthFloor ~= v112 or flag27 then
													objects[v84[132]].Text = format("%d", v112)
													objects.HealthBarText.Position = udim2(1, -v84[31], v84[115] - v110, v84[115])
													arg3.LastHealthFloor = v112
												end
											else
												if objects.HealthBarOutline.Visible then
													objects[v84[55]].Visible = false
												end

												if objects.HealthBarText.Visible then
													objects.HealthBarText.Visible = false
												end

												if not armorBar.Enabled then
													if objects[v84[74]].Visible then
														objects.LeftBarHolder.Visible = false
													end
												end
											end

											if armorBar[v84[100]] then
												local v110 = clamp(arg3.Armor / arg3.MaxArmor, 0, 1)

												if not objects.BottomBarHolder.Visible then
													objects.BottomBarHolder.Visible = v84[126]
												end

												if not objects.ArmorBarOutline.Visible then
													objects.ArmorBarOutline.Visible = true
												end

												if arg3.LastArmorRatio ~= v110 then
													objects.ArmorBar.Size = udim2(v110, 0, 1, 0)
													arg3.LastArmorRatio = v110
												end

												local top = armorBar.Top
												local v111 = armorBar[v84[77]]
												local v112 = armorBar[v84[39]]

												if arg3[v84[30]] ~= top or arg3.LastArmorMid ~= v111 or arg3.LastArmorBot ~= v112 then
													local armorBarGradient = objects.ArmorBarGradient
													local colorSequence = ColorSequence.new
													local tbl34 = {}
													local v113 = ColorSequenceKeypoint.new(0, top)
													local v114 = ColorSequenceKeypoint.new(0.5, v111)
													local new2 = ColorSequenceKeypoint.new
													tbl34[1] = v113
													tbl34[2] = v114

													do
														local values = table.pack(new2(1, v112))
														table.move(values, 1, values.n, 3, tbl34)
													end

													armorBarGradient.Color = colorSequence(tbl34)
													arg3.LastArmorTop = top
													arg3.LastArmorMid = v111
													arg3.LastArmorBot = v112
												end
											else
												if objects.ArmorBarOutline.Visible then
													objects[v84[190]].Visible = false
												end

												if objects[v84[16]].Visible then
													objects[v84[16]].Visible = false
												end
											end

											if v109.Weapon.Enabled then
												if n24 >= 8225 then
													while true do
													end
												else
													if not objects.Weapon.Visible then
														objects[v84[191]].Visible = true
													end

													local currentTool = arg3.CurrentTool or v84[65]

													if arg3[v84[50]] ~= currentTool then
														objects.Weapon.Text = currentTool
														if not flag2 then
															return
														end
														arg3.LastWeapon = currentTool
													end

													local color = v109.Weapon.Color

													if arg3[v84[110]] ~= color then
														objects.Weapon.TextColor3 = color
														arg3[v84[110]] = color
													end
												end
											elseif objects.Weapon.Visible then
												objects[v84[191]].Visible = false
											end
										end

										index:CreateThreads("Renderer", v85.RenderStepped, function()
											local now2 = os.clock()
											if now2 - v101 < n42 then
												return
											end
											v101 = now2
											position = currentCamera2.CFrame.Position
											local enabled = v102.Enabled
											local chams = v102.Chams
											local enabled2 = chams.Enabled

											for k, v103 in index.Cache, nil, nil do
												local highlight, visible, fillTransparency, fillColor, outlineColor

												if not enabled then
													if not (k == localPlayer2) or not v102.ShowLocalPlayer then
														if v103.Objects.TargetHolder.Visible then
															v103[v84[104]].TargetHolder.Visible = false
														end

														if v103.Objects.Highlight and v103.Objects[v84[165]].Enabled then
															v103.Objects[v84[165]].Enabled = false
														end
													else
														index:Update(k, v103)
														highlight = v103.Objects.Highlight

														if highlight then
															visible = enabled2 and v103.Objects.TargetHolder.Visible

															if visible then
																if not highlight.Enabled then
																	highlight.Enabled = true
																end

																if highlight.Adornee ~= v103.Character then
																	highlight.Adornee = v103[v84[178]]
																end

																fillTransparency = chams.FillTransparency

																if v103.LastChamsT ~= fillTransparency then
																	highlight.FillTransparency = fillTransparency
																	v103.LastChamsT = fillTransparency
																end

																fillColor = chams.FillColor

																if v103.LastChamsFill ~= fillColor then
																	highlight.FillColor = fillColor
																	v103[v84[93]] = fillColor
																end

																outlineColor = chams.OutlineColor

																if v103.LastChamsOutline ~= outlineColor then
																	highlight.OutlineColor = outlineColor
																	v103.LastChamsOutline = outlineColor
																end
															elseif highlight.Enabled then
																highlight.Enabled = false
															end
														end
													end
												else
													index:Update(k, v103)
													highlight = v103.Objects.Highlight

													if highlight then
														visible = enabled2 and v103.Objects.TargetHolder.Visible

														if visible then
															if not highlight.Enabled then
																highlight.Enabled = true
															end

															if highlight.Adornee ~= v103.Character then
																highlight.Adornee = v103[v84[178]]
															end

															fillTransparency = chams.FillTransparency

															if v103.LastChamsT ~= fillTransparency then
																highlight.FillTransparency = fillTransparency
																v103.LastChamsT = fillTransparency
															end

															fillColor = chams.FillColor

															if v103.LastChamsFill ~= fillColor then
																highlight.FillColor = fillColor
																v103[v84[93]] = fillColor
															end

															outlineColor = chams.OutlineColor

															if v103.LastChamsOutline ~= outlineColor then
																highlight.OutlineColor = outlineColor
																v103.LastChamsOutline = outlineColor
															end
														elseif highlight.Enabled then
															highlight.Enabled = false
														end
													end
												end
											end
										end)

										for _, v103 in v99:GetPlayers() do
											index:AddTarget(v103)
										end

										index:CreateThreads("PlayerAdded", v99.PlayerAdded, function(arg)
											index:AddTarget(arg)
										end)

										index:CreateThreads(v84[63], v99.PlayerRemoving, function(arg)
											index:RemoveTarget(arg)
										end)

										index.Unload = function(arg)
											for k in arg.Cache, nil, nil do
												arg:RemoveTarget(k)
											end

											for _, v103 in arg.Connections, nil, nil do
												v103:Disconnect()
											end

											clear(arg[v84[24]])

											for _, v103 in arg.Threads, nil, nil do
												v103:Disconnect()
											end

											clear(arg.Threads)

											if arg.Holder then
												arg.Holder:Destroy()
												arg.Holder = nil
											end

											clear(arg.Cache)
										end
									end

									do
										do
											local regions

											do
												do
													local v99

													do
														do
															do
																zhEspLib = getgenv()._ZH_EspLib
																table_ = zhEspLib.Table
																getgenv()._ZH_PlayerESPColor = getgenv()._ZH_PlayerESPColor or Color3.fromRGB(0, 255, v84[67])
																service = game:GetService(v84[8])
																service2 = game:GetService(v84[127])
																UserInputService = game:GetService("UserInputService")
																Lighting = game:GetService("Lighting")
																currentCamera = workspace.CurrentCamera
																localPlayer = service2.LocalPlayer
																flag18 = false
																v86 = v84[67]

																fn29 = function()
																	if flag18 then
																		return nil
																	end
																	return localPlayer.Character
																end

																fn30 = function()
																	local v100 = fn29()
																	return v100 and v100:FindFirstChild(v84[167])
																end

																fn31 = function()
																	local v100 = fn29()
																	return v100 and v100:FindFirstChildOfClass("Humanoid")
																end

																fn32 = function(cFrame)
																	local v100 = fn30()
																	if not v100 then
																		return
																	end

																	if typeof(cFrame) == "Vector3" then
																		cFrame = CFrame.new(cFrame)
																	end

																	v100.CFrame = cFrame
																	v100.AssemblyLinearVelocity = Vector3.zero
																end

																tbl25 = {
																	speed = 100,
																	infJumpH = v84[157],
																	flySpeed = 100,
																	tweenSpeed = 100,
																	brightness = 2,
																	freeCamSens = 0.3,
																	freeCamSpeed = 0.5,
																	fovVal = 70,
																}

																if getgenv()._ZeroUnload then
																	pcall(getgenv()._ZeroUnload)
																end

																lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/lionun-lab/Newstar/refs/heads/main/EthosSuite"))()

																v99 = lib:CreateWindow({
																	Title = "ZERO HUB",
																	Version = v84[36],
																})

																tbl17 = {}
																tbl18 = {}

																do
																	local tbl26 = {}

																	fn33 = function(arg)
																		table.insert(tbl26, arg)
																	end

																	getgenv()._ZeroWindow = lib
																	local unload = v99.Unload

																	v99.Unload = function(arg)
																		for _, v100 in ipairs(tbl26) do
																			pcall(v100)
																		end

																		getgenv()._ZeroWindow = nil
																		getgenv()._ZeroUnload = nil
																		return unload(arg)
																	end
																end
															end

															getgenv()._ZeroUnload = function()
																if not flag3 then
																	return
																end
																v99:Unload()
															end

															fn34 = function(arg, arg2)
																task.defer(function()
																	pcall(function()
																		lib:Notify({ Title = v84[73], Description = arg, Duration = arg2 or 3 })
																	end)
																end)
															end

															fn35 = function(arg)
																local v100 = lib.Flags[arg]
																if type(v100) == "table" and v100.Value ~= nil then
																	return v100.Value
																end
																local v101 = v84[124]
																if type(v100) ~= v101 then
																	return false
																end

																if n27(v84[188]) >= 3824 then
																	return v100
																end

																while true do
																end
															end

															do
																local function fn48(arg, arg2)
																	local options = lib.Options and lib.Options[arg]
																	local v100 = v84[162]
																	options = type(options) == v100 and options.SetValue and options or lib.Flags[arg]

																	if type(options) == "table" and options.SetValue then
																		pcall(function()
																			options:SetValue(arg2)
																		end)
																	end
																end

																fn36 = function(arg)
																	fn34("That's a premium feature, get the full version at getzerohub.com", 4)

																	if arg then
																		task.defer(fn48, arg, v84[35])
																	end
																end
															end
														end

														do
															VirtualInputManager = game:GetService("VirtualInputManager")

															fn37 = function(arg)
																if not arg then
																	return
																end

																pcall(function()
																	firesignal(arg.MouseButton1Click)
																end)
															end

															fn38 = function()
																local flag25 = false
																local connection = nil

																connection = game:GetService("RunService").RenderStepped:Connect(function()
																	if flag25 then
																		return
																	end

																	pcall(function()
																		local dialogueFrame = localPlayer.PlayerGui.ComponentsHolder:FindFirstChild("DialogueFrame")
																		if not dialogueFrame then
																			return
																		end
																		local clickDetector = dialogueFrame.Actual:FindFirstChild("ClickDetector")

																		if clickDetector then
																			fn37(clickDetector)
																		end

																		local buttonHolder = dialogueFrame.Actual:FindFirstChild("ButtonHolder")

																		if buttonHolder then
																			for _, child in ipairs(buttonHolder:GetChildren()) do
																				if child:IsA("Frame") and child:FindFirstChild("TextButton") then
																					flag25 = v84[126]
																					connection:Disconnect()
																					return
																				end
																			end
																		end
																	end)
																end)

																local now2 = tick()

																while true do
																	local flag26 = not flag25

																	if flag26 then
																		local v100 = v84[28]
																		flag26 = tick() - now2 < v100
																	end

																	if flag26 then
																		task.wait(v84[116])
																		continue
																	end
																	break
																end

																if connection.Connected then
																	connection:Disconnect()
																end

																return flag25
															end

															tbl19 = {}

															do
																local farm = v99:AddCategory("FARM")
																tbl19.MobFarm = farm:AddTab("Mob Farm")
																tbl19.BossFarm = farm:AddTab(v84[111])
																tbl19.PlayerFarm = farm:AddTab("Player Farm")
																tbl19.Mastery = farm:AddTab(v84[180])
																tbl19.Loot = farm:AddTab(v84[129])
															end
														end

														do
															local v100 = v99:AddCategory(v84[71])
															tbl19.AutoQuest = v100:AddTab("Level Farm")
															tbl19.Questlines = v100:AddTab(v84[136])
															tbl19.Training = v100:AddTab(v84[146])
															tbl19.DemonProg = v100:AddTab("Demon Progression")
															tbl19.CrowQuests = v100:AddTab("Crow Quests")
															tbl19.MuzanQuests = v100:AddTab("Muzan Quests")
															tbl19.Schematics = v100:AddTab("Schematics")
														end

														do
															local ouwigahara = v99:AddCategory("OUWIGAHARA")
															tbl19.OuwMain = ouwigahara:AddTab(v84[144])
															tbl19.OuwCfg = ouwigahara:AddTab("Config")
															tbl19.OuwShop = ouwigahara:AddTab("Shop")
															tbl19.OuwCraft = ouwigahara:AddTab("Craft")
														end
													end

													do
														do
															tbl19.OuwIK = tbl19.OuwCfg

															do
																local combat = v99:AddCategory("COMBAT")
																tbl19.KillAura = combat:AddTab("Combat")
																tbl19.Survival = combat:AddTab("Survival")
															end
														end

														do
															tbl19.NetOwn = tbl19.KillAura
															tbl19.Retreat = tbl19.Survival

															do
																local v100 = v99:AddCategory(v84[147])
																tbl19.Fishing = v100:AddTab("Fishing")
																tbl19.ClanSpin = v100:AddTab("Clan Spin")
																tbl19.Horse = v100:AddTab("Horse")
															end
														end

														do
															local player = v99:AddCategory("PLAYER")
															tbl19.Movement = player:AddTab("Movement")
															tbl19.Utility = player:AddTab("Character")
															tbl19.Identity = player:AddTab("Identity")
														end
													end

													do
														do
															local visuals = v99:AddCategory("VISUALS")
															tbl19.ESP = visuals:AddTab(v84[134])
															tbl19.ESPCfg = visuals:AddTab("ESP Config")
															tbl19.Camera = visuals:AddTab("Camera")
															tbl19.World = visuals:AddTab("World")
														end

														tbl19.Perf = tbl19.World

														do
															local v100 = v99:AddCategory(v84[140])
															tbl19.Teleports = v100:AddTab("Teleports")
															tbl19.Teleport = v100:AddTab(v84[3])
															tbl19.Attach = v100:AddTab("Attach")
														end
													end

													do
														local v100 = v99:AddCategory(v84[99])
														tbl19.Server = v100:AddTab("Server")
														tbl19.Safety = v100:AddTab("Safety")
														tbl19.Events = v100:AddTab(v84[88])
														tbl19.Misc = v100:AddTab("Chat & Logs")
													end

													lib:CreateSettingsTab(v99)
												end

												pcall(function()
													lib.Options._ZeroPremade:SetValue("Amber")
												end)

												tbl20 = {
													Fly = tbl19.Movement:AddGroupbox("Fly"),
													Speed = tbl19.Movement:AddGroupbox("Speed"),
													Jump = tbl19.Movement:AddGroupbox(v84[66]),
													Coll = tbl19.Movement:AddGroupbox("Collision"),
													MobFarm = tbl19.MobFarm:AddGroupbox(v84[173]),
													MobCfg = tbl19.MobFarm:AddGroupbox("Config"),
													Chests = tbl19.Loot:AddGroupbox("Chests"),
													PlrFarm = tbl19.PlayerFarm:AddGroupbox(v84[83]),
													PlrFarmCfg = tbl19.PlayerFarm:AddGroupbox("Config"),
													Anim = tbl19.Utility:AddGroupbox("Animations"),
													Util = tbl19.Utility:AddGroupbox(v84[49]),
													Prot = tbl19.Survival:AddGroupbox("Protection"),
													Server = tbl19.Server:AddGroupbox("Server"),
													Chat = tbl19.Misc:AddGroupbox("Chat"),
													Webhook = tbl19.Misc:AddGroupbox("Webhook"),
													Horse = tbl19.Horse:AddGroupbox("Horse"),
													Survival = tbl19.Survival:AddGroupbox("Survival"),
													VizL = tbl19.ESP:AddGroupbox("Player ESP"),
													VizL2 = tbl19.ESP:AddGroupbox("Local Player ESP"),
													MobESP = tbl19.ESP:AddGroupbox("Mob ESP"),
													NPCESP = tbl19.ESP:AddGroupbox("NPC ESP"),
													VizL3 = tbl19.ESP:AddGroupbox(v84[91]),
													VizR = tbl19.ESPCfg:AddGroupbox("Toggles"),
													VizR2 = tbl19.ESPCfg:AddGroupbox("Style"),
													VizR3 = tbl19.ESPCfg:AddGroupbox(v84[151]),
													CamSpec = tbl19.Camera:AddGroupbox("Spectate"),
													CamLight = tbl19.World:AddGroupbox(v84[176]),
													CamFree = tbl19.Camera:AddGroupbox(v84[41]),
													CamView = tbl19.Camera:AddGroupbox("View"),
													CamVis = tbl19.Camera:AddGroupbox("X-Ray"),
													WorldR2 = tbl19.Perf:AddGroupbox("FPS Boost"),
													PerfVis = tbl19.Perf:AddGroupbox("Visibility"),
													SafeAlert = tbl19.Safety:AddGroupbox("Alerts"),
													Retreat = tbl19.Retreat:AddGroupbox(v84[184]),
													NavL = tbl19.Teleport:AddGroupbox(v84[159]),
													NPCTP = tbl19.Teleports:AddGroupbox("NPC Teleport"),
													PlrTP = tbl19.Teleports:AddGroupbox("Player Teleport"),
													MobTP = tbl19.Teleports:AddGroupbox("Mob Teleport"),
													NavR = tbl19.Attach:AddGroupbox("Attach"),
													NavR2 = tbl19.Attach:AddGroupbox(v84[198]),
													IdSelf = tbl19.Identity:AddGroupbox("Your Name"),
													IdOthers = tbl19.Identity:AddGroupbox("Other Players"),
													IdVis = tbl19.Identity:AddGroupbox("Appearance"),
												}

												regions = workspace:FindFirstChild("Humanoids") and workspace.Humanoids:FindFirstChild("Regions")

												if workspace:FindFirstChild(v84[101]) then
													workspace.Debree:FindFirstChild("Regions")
												end

												tbl21 = {}

												do
													local flag25 = false

													task.spawn(function()
														if not flag25 then
															flag25 = true

															pcall(function()
																local regions2 = game:GetService(v84[183]):FindFirstChild("Regions")
																if not regions2 then
																	return
																end
																local module = require(regions2)
																module = module.Regions or module
																if type(module) ~= "table" then
																	return
																end

																for _, v99 in pairs(module) do
																	if type(v99) == "table" then
																		local npcs = v99.Npcs or v99.npcs
																		local v100 = v84[162]

																		if type(npcs) == v100 then
																			for k, npc in pairs(npcs) do
																				if type(npc) == "table" then
																					npc = npc.SendOver or npc

																					if npc then
																						npc = npc.Spawning or npc.spawning
																					end

																					if npc then
																						local tbl26 = {}
																						local center = npc.Center or npc.center

																						if center and typeof(center) == "CFrame" then
																							table.insert(tbl26, center)
																						elseif center and typeof(center) == "Vector3" then
																							table.insert(tbl26, CFrame.new(center))
																						end

																						local locations = npc.Locations or npc.locations

																						if type(locations) == "table" then
																							for _, location in ipairs(locations) do
																								if typeof(location) == "CFrame" then
																									table.insert(tbl26, location)
																								else
																									local v101 = v84[181]

																									if typeof(location) == v101 then
																										table.insert(tbl26, CFrame.new(location))
																									end
																								end
																							end
																						end

																						if #tbl26 > 0 then
																							if not tbl21[k] then
																								tbl21[k] = tbl26
																							else
																								for _, v101 in ipairs(tbl26) do
																									table.insert(tbl21[k], v101)
																								end
																							end
																						end
																					end
																				end
																			end
																		end
																	end
																end
															end)

															pcall(function()
																local ouwland = game:GetService("ReplicatedStorage"):FindFirstChild("Ouwland")
																if not ouwland then
																	return
																end
																local content = ouwland:FindFirstChild("Content")
																if not content then
																	return
																end

																for _, child in ipairs(content:GetChildren()) do
																	local npcs = child:FindFirstChild("Npcs")

																	if npcs then
																		for _, child2 in ipairs(npcs:GetChildren()) do
																			if child2:IsA("ModuleScript") then
																				local ok, result = pcall(require, child2)
																				local flag26 = not ok

																				if not flag26 then
																					local v99 = v84[162]
																					flag26 = type(result) ~= v99
																				end

																				if not flag26 then
																					local spawns = result.Spawns or result.spawns

																					if type(spawns) == "table" then
																						local tbl26 = {}

																						for _, spawn_ in ipairs(spawns) do
																							if type(spawn_) == "table" then
																								local cFrame = spawn_.CFrame or spawn_.cframe or spawn_[v84[115]]

																								if typeof(cFrame) == "CFrame" then
																									table.insert(tbl26, cFrame)
																								end
																							elseif typeof(spawn_) == "CFrame" then
																								table.insert(tbl26, spawn_)
																							end
																						end

																						if v84[67] < #tbl26 then
																							local name = result.Name or child2.Name

																							if not tbl21[name] then
																								tbl21[name] = tbl26
																							else
																								for _, v99 in ipairs(tbl26) do
																									table.insert(tbl21[name], v99)
																								end
																							end
																						end
																					end
																				end
																			end
																		end
																	end
																end
															end)

															if next(tbl21) == nil then
																tbl21 = {
																	["*Civilian*"] = { CFrame.new(-687, 1260, -v84[15]) },
																	Bandit = { CFrame.new(-297, 1224, -v84[172]) },
																	["Bear Cub"] = { CFrame.new(540, v84[192], -1024) },
																	["Beast Born Demon"] = { CFrame.new(170, 888, v84[78]) },
																	["Blood Hounded Demon"] = { CFrame.new(v84[46], 829, 927) },
																	Civilian = { CFrame.new(170, 888, 603) },
																	["Fire Profound Demon"] = { CFrame.new(-916, 1374, -2431) },
																	["Greater Demon"] = { CFrame.new(-499, 284, 528) },
																	["High Demon"] = { CFrame.new(v84[89], 1253, -1928) },
																	[v84[158]] = { CFrame.new(-1741, 311, 881) },
																	["Hoyuzo Subordinate"] = { CFrame.new(533, 1001, -1357) },
																	["Ice Profound Demon"] = { CFrame.new(-v84[20], 1381, -v84[130]) },
																	[v84[42]] = { CFrame.new(v84[143], 1146, -1315) },
																	[v84[133]] = { CFrame.new(283, 1302, -v84[80]) },
																	["Lesser Demon"] = { CFrame.new(-676, 230, v84[60]) },
																	["Mizunoe Demon Slayer"] = { CFrame.new(-1835, 31, 487) },
																	Mizunoto = { CFrame.new(-v84[84], 964, -76) },
																	[v84[58]] = { CFrame.new(v84[143], v84[187], -1315) },
																	Hoyuzo = { CFrame.new(v84[53], 1001, -v84[90]) },
																	["Mother Bear"] = { CFrame.new(540, 1121, -1024) },
																	Zuko = { CFrame.new(-282, 1227, -1031) },
																	Fujiko = { CFrame.new(-1835, 31, v84[10]) },
																	Akazo = { CFrame.new(-v84[9], 1380, -1746) },
																	Datai = { CFrame.new(-165, v84[14], -1137) },
																	Domae = { CFrame.new(-296, 1350, -v84[112]) },
																	Enru = { CFrame.new(v84[85], 800, 543) },
																	[v84[19]] = { CFrame.new(-1128, 1029, 994) },
																	Giyen = { CFrame.new(388, 1018, -85) },
																	Gyorei = { CFrame.new(2574, 1089, -742) },
																	Gyutai = { CFrame.new(-266, 1043, -1139) },
																	["Insect Trainee"] = { CFrame.new(-1395, 261, 69) },
																	Nezura = { CFrame.new(-1459, 275, 935) },
																	Obari = { CFrame.new(770, 1121, -1047) },
																	["Reaper Trainee Kuzan"] = { CFrame.new(-1219, 1373, -3034) },
																	Reaper = { CFrame.new(98, v84[14], -573) },
																	Rengu = { CFrame.new(-712, 965, 883) },
																	Saneri = { CFrame.new(-379, 1093, -422) },
																	["Serpent Trainee"] = { CFrame.new(-271, 1292, -1535) },
																	Shinora = { CFrame.new(-452, 964, 2) },
																	["Soryu Trainee Goki"] = { CFrame.new(-426, 288, 543) },
																	["Sound Trainee"] = { CFrame.new(192, 1349, -2581) },
																	["Stone Trainee"] = { CFrame.new(2685, 1073, -568) },
																	Sumari = { CFrame.new(396, 1018, -620) },
																	["Tai Chi Trainee Suzume"] = { CFrame.new(2360, 601, -642) },
																	Tengai = { CFrame.new(-133, 1349, -2631) },
																	["Thunder Trainee"] = { CFrame.new(2425, 1073, -556) },
																	["Water Trainee Sabito"] = { CFrame.new(815, 1018, 101) },
																	["Wind Trainee"] = { CFrame.new(-941, 1381, -2635) },
																	Yahari = { CFrame.new(825, 1019, -641) },
																	Zentaro = { CFrame.new(1332, 821, -1017) },
																}
															end

															return
														end

														if not (v84[148] < n25) then
															return
														end

														while true do
														end
													end)
												end
											end

											do
												do
													do
														tbl22 = {}

														do
															local flag25 = false

															task.spawn(function()
																if flag25 then
																	return
																end
																flag25 = v84[126]

																pcall(function()
																	local ouwland = game:GetService(v84[183]):FindFirstChild("Ouwland")
																	if not ouwland then
																		return
																	end
																	local content = ouwland:FindFirstChild("Content")
																	if not content then
																		return
																	end

																	for _, child in ipairs(content:GetChildren()) do
																		local npcs = child:FindFirstChild("Npcs")

																		if npcs then
																			for _, child2 in ipairs(npcs:GetChildren()) do
																				if child2:IsA("ModuleScript") then
																					local ok, result = pcall(require, child2)

																					if not (not ok or type(result) ~= "table") then
																						local name = result.Name or child2.Name
																						local spawns = result.Spawns or result.spawns

																						if type(spawns) == "table" and #spawns > 0 then
																							local cFrame = spawns[1]

																							if type(cFrame) == "table" then
																								cFrame = cFrame.CFrame or cFrame.cframe or cFrame[v84[115]]
																							else
																								local v99 = nil

																								if typeof(cFrame) ~= "CFrame" then
																									cFrame = v99
																								end
																							end

																							if cFrame and typeof(cFrame) == "CFrame" then
																								tbl22[name] = cFrame
																							end
																						end
																					end
																				end
																			end
																		end
																	end
																end)

																pcall(function()
																	local regions2 = game:GetService("ReplicatedStorage"):FindFirstChild("Regions")

																	if regions2 then
																		local module = require(regions2)
																		module = module.Regions or module
																		if type(module) ~= "table" then
																			return
																		end

																		for _, v99 in pairs(module) do
																			local v100 = v84[162]

																			if type(v99) == v100 then
																				local npcs = v99.Npcs or v99.npcs
																				local v101 = v84[162]

																				if type(npcs) == v101 then
																					for k, npc in pairs(npcs) do
																						if not tbl22[k] then
																							if type(npc) == "table" then
																								local sendOver = npc.SendOver or npc

																								if sendOver then
																									sendOver = sendOver.Spawning or sendOver.spawning
																								end

																								if sendOver then
																									local center = sendOver.Center or sendOver.center

																									if center then
																										if typeof(center) == "CFrame" then
																											tbl22[k] = center
																										elseif typeof(center) == "Vector3" then
																											tbl22[k] = CFrame.new(center)
																										end
																									end
																								end
																							end
																						end
																					end
																				end
																			end
																		end

																		return
																	end

																	if not (n24 >= 8245) then
																		return
																	end

																	while true do
																	end
																end)

																for k, v99 in pairs({
																	Krue = CFrame.new(-425.5, 1243.5, -952.5),
																	Kazu = CFrame.new(-626, 1245, -1138),
																	Kona = CFrame.new(-791.61, 1262.57, -1130.91),
																	Noote = CFrame.new(-515.55, 1245.39, -1251.24),
																	MoldySugar = CFrame.new(-701.61, 1245.68, -982.74),
																	Raze = CFrame.new(-594, 1245.08, -1095),
																	Rika = CFrame.new(-497.04, 1249.66, -1176.81),
																	Lucy = CFrame.new(-615.5, 1261, -1177.5),
																	Betty = CFrame.new(540.5, 1121, -1023.5),
																	Tom = CFrame.new(540.5, 1121, -1023.5),
																	Liv = CFrame.new(540.5, 1121, -1023.5),
																	Chaka = CFrame.new(585.71, 1146.55, -1314.89),
																	Wagwan = CFrame.new(651, 1001, -1023.31),
																	Rin = CFrame.new(170, 888, 603),
																	["Lamplighter Isamu"] = CFrame.new(1079, 1422, -781),
																	["Serpent Trainer Obari"] = CFrame.new(36.95, 1307.5, -1179.5),
																	["Angler Runo"] = CFrame.new(540.5, 1121, -1023.5),
																	["Demon Delroy"] = CFrame.new(v84[89], 1253, -1928),
																	["Wounded Slayer Tomoi"] = CFrame.new(388, 1253, -1928),
																	["Demon Slayer Mitsu"] = CFrame.new(-916, 1374, -2431),
																	Shiori = CFrame.new(v84[89], 1253, -1928),
																	Niko = CFrame.new(v84[89], 1253, -1928),
																	Ren = CFrame.new(388, 1253, -1928),
																	Togane = CFrame.new(388, 1253, -1928),
																}) do
																	if not tbl22[k] then
																		tbl22[k] = v99
																	end
																end
															end)
														end
													end

													do
														local function_ = game:GetService("ReplicatedStorage").Communication.ServerAndClient.Signals.SignalFunction.Function
													end

													fn39 = function()
														local tbl26 = {}
														local regions2 = workspace:FindFirstChild("Humanoids") and workspace.Humanoids:FindFirstChild("Regions")

														if regions2 then
															regions = regions2

															for _, child in ipairs(regions2:GetChildren()) do
																local activeNpcs = child:FindFirstChild("ActiveNpcs")

																if activeNpcs then
																	for _, child2 in ipairs(activeNpcs:GetChildren()) do
																		local model = child2:FindFirstChildWhichIsA("Model")

																		if model and model:FindFirstChild("HumanoidRootPart") and model:FindFirstChildOfClass("Humanoid") then
																			table.insert(tbl26, model)
																		end
																	end
																end
															end
														end

														return tbl26
													end

													fn40 = function(arg)
														local regions2 = workspace:FindFirstChild(v84[101]) and workspace.Debree:FindFirstChild("Regions")

														if regions2 then
															for _, child in ipairs(regions2:GetChildren()) do
																local stationaryNpcs = child:FindFirstChild("StationaryNpcs")

																if stationaryNpcs then
																	for _, child2 in ipairs(stationaryNpcs:GetChildren()) do
																		if child2.Name == arg and child2:IsA("Model") and child2:FindFirstChild(v84[167]) then
																			return child2
																		end
																	end
																end

																for _, child2 in ipairs(child:GetChildren()) do
																	if child2.Name == arg and child2:IsA("Model") and child2:FindFirstChild("HumanoidRootPart") then
																		return child2
																	end

																	if child2:IsA("Folder") and child2.Name == arg then
																		local model = child2:FindFirstChildWhichIsA("Model")
																		if model and model:FindFirstChild("HumanoidRootPart") then
																			return model
																		end
																	end
																end
															end
														end

														local regions3 = workspace:FindFirstChild("Humanoids") and workspace.Humanoids:FindFirstChild("Regions")

														if regions3 then
															for _, child in ipairs(regions3:GetChildren()) do
																local activeNpcs = child:FindFirstChild("ActiveNpcs")

																if activeNpcs then
																	for _, child2 in ipairs(activeNpcs:GetChildren()) do
																		if child2.Name ~= arg then
																			continue
																		end
																		local model = child2:FindFirstChildWhichIsA("Model")
																		if model and model:FindFirstChild("HumanoidRootPart") then
																			return model
																		end
																	end
																end
															end
														end

														for _, descendant in ipairs(workspace:GetDescendants()) do
															if descendant.Name == arg and descendant:IsA("Model") and descendant:FindFirstChild("HumanoidRootPart") then
																return descendant
															end
														end

														return nil
													end

													fn41 = function(arg)
														local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
														if not humanoidRootPart then
															return
														end
														local v99 = fn30()
														if not v99 then
															return
														end
														v99.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, v84[28])
														v99.AssemblyLinearVelocity = Vector3.zero
														task.wait(0.3)

														for _, descendant in ipairs(arg:GetDescendants()) do
															if descendant:IsA("ProximityPrompt") then
																pcall(function()
																	fireproximityprompt(descendant)
																end)
															end
														end

														task.wait(0.3)
														fn38()
													end

													fn42 = function()
														pcall(function()
															local dialogueFrame = localPlayer.PlayerGui:FindFirstChild("ComponentsHolder") and localPlayer.PlayerGui.ComponentsHolder:FindFirstChild("DialogueFrame")

															if dialogueFrame then
																local zZZZZZZZZ2 = dialogueFrame.Actual.ButtonHolder:FindFirstChild("ZZZZZZZZZ2")

																if zZZZZZZZZ2 then
																	local textButton = zZZZZZZZZ2:FindFirstChild("TextButton")

																	if textButton then
																		fn37(textButton)
																	end
																end
															end
														end)
													end

													event = game:GetService(v84[183]).Communication.ServerAndClient.Signals.SignalEvent.Event

													do
														local n42 = 0

														tbl23 = {
															"Combat",
															"Regular Katana",
															"Sickles",
															"Obi Manipulation",
															"Insect Katana",
															"Axe and Mace",
															"Sound Katanas",
															"Scythe",
															"Claws",
															"Tai Chi",
															"Bear",
															"Shotgun",
															"Tanto",
															"Bladed Wagasa",
															"Spear",
															"War Fans",
															"Gauntlet",
															"Blood Manipulation",
														}

														fn43 = function(arg)
															n42 += 1

															if n42 > 5 then
																n42 = 1
															end

															arg = arg or "Combat"

															pcall(function()
																event:FireServer("Combat_Service", arg, n42, v84[126], 0, v84[126], nil)
															end)
														end
													end
												end

												do
													lib:Notify({
														Title = "Zero Hub",
														Description = "Project Slayers loaded.",
														Type = "Success",
														Duration = 4,
													})

													task.spawn(function()
														while task.wait() do
															pcall(function()
																localPlayer.GameplayPaused = false
															end)
														end
													end)

													tbl17.Fly = tbl20.Fly:AddToggle("Fly", {
														Text = "Fly (Premium)",
														Description = "Fly around the map in any direction",
														Default = v84[35],
														Callback = function(arg)
															if arg then
																fn36("Fly")
															end
														end,
													})

													tbl17.Fly:AddKeybind({ Default = Enum.KeyCode.Y, Mode = "Toggle" })

													tbl18.FlySpeed = tbl20.Fly:AddSlider("FlySpeed", {
														Text = "Fly Speed",
														Default = 100,
														Min = 0,
														Max = 5000,
														Rounding = 0,
														Callback = function(flySpeed)
															tbl25.flySpeed = flySpeed
														end,
													})

													tbl17.Speedhack = tbl20.Speed:AddToggle("Speedhack", {
														Text = "Speedhack (Premium)",
														Description = "Run way faster than everyone else",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("Speedhack")
															end
														end,
													})

													tbl17.Speedhack:AddKeybind({ Default = Enum.KeyCode.N, Mode = "Toggle" })

													tbl18.SpeedhackSpeed = tbl20.Speed:AddSlider("SpeedhackSpeed", {
														Text = "Speed",
														Default = 100,
														Min = 0,
														Max = 5000,
														Rounding = 0,
														Callback = function(speed)
															tbl25.speed = speed
														end,
													})

													v87 = nil

													tbl17.InfiniteJump = tbl20.Jump:AddToggle("InfiniteJump", {
														Text = "Infinite Jump (Premium)",
														Description = "Keep jumping in mid-air as many times as you want",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("InfiniteJump")
															end
														end,
													})

													tbl17.InfiniteJump:AddKeybind({ Default = Enum.KeyCode.H, Mode = "Toggle" })

													tbl18.InfiniteJumpHeight = tbl20.Jump:AddSlider("InfiniteJumpHeight", {
														Text = "Jump Height",
														Default = v84[157],
														Min = 0,
														Max = 1000,
														Rounding = 0,
														Callback = function(infJumpH)
															tbl25.infJumpH = infJumpH
														end,
													})

													v88 = nil
													v89 = nil

													tbl17.JumpFix = tbl20.Jump:AddToggle("JumpFix", {
														Text = "Ignore Jump Lock (Premium)",
														Description = "Jump even when the game tries to stop you",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("JumpFix")
															end
														end,
													})

													do
														local v99 = nil

														tbl17.BunnyHop = tbl20.Jump:AddToggle("BunnyHop", {
															Text = "Bunny Hop (Premium)",
															Description = "Automatically jump again the instant you touch the ground",
															Default = v84[35],
															Callback = function(arg)
																if arg then
																	fn36("BunnyHop")
																end
															end,
														})

														fn33(function()
															if v99 then
																v99:Disconnect()
																v99 = nil
															end
														end)
													end
												end

												do
													v90 = nil

													tbl17.Noclip = tbl20.Coll:AddToggle("Noclip", {
														Text = "Noclip (Premium)",
														Description = "Phase through any wall or object",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("Noclip")
															end
														end,
													})

													tbl17.Noclip:AddKeybind({ Default = Enum.KeyCode.T, Mode = "Toggle" })

													do
														local tbl26 = {}

														tbl17.NoDashCD = tbl20.Coll:AddToggle("NoDashCD", {
															Text = "No Dash Cooldown (Premium)",
															Description = "Removes dash cooldown completely",
															Default = v84[35],
															Callback = function(arg)
																if arg then
																	fn36("NoDashCD")
																end
															end,
														})

														fn33(function()
															for _, v99 in ipairs(tbl26) do
																pcall(function()
																	v99:Disconnect()
																end)
															end

															tbl26 = {}
														end)
													end
												end

												v91 = nil
												v92 = nil

												tbl17.NoAnims = tbl20.Anim:AddToggle("NoAnims", {
													Text = "No Anims (Premium)",
													Description = "Stop all character animations",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("NoAnims")
														end
													end,
												})

												do
													local function fn48()
														local v99 = nil
														local v100 = v84[115]

														local function fn49(arg)
															pcall(function()
																local v101 = fn29()
																if not v101 then
																	return
																end
																local humanoid = v101:FindFirstChildOfClass("Humanoid")
																if not humanoid then
																	return
																end
																local animator = humanoid:FindFirstChildOfClass("Animator")
																if not animator then
																	return
																end

																for _, v102 in ipairs(animator:GetPlayingAnimationTracks()) do
																	pcall(function()
																		v102:AdjustSpeed(arg)
																	end)
																end
															end)
														end

														tbl17.AnimSpeed = tbl20.Anim:AddToggle("AnimSpeed", {
															Text = "Anim Speed (Premium)",
															Description = "Make your animations play faster or slower",
															Default = v84[35],
															Callback = function(arg)
																if arg then
																	fn36("AnimSpeed")
																end
															end,
														})

														tbl18.AnimSpeedSlider = tbl20.Anim:AddSlider("AnimSpeedSlider", {
															Text = "Speed",
															Default = v84[115],
															Min = 0.1,
															Max = 200,
															Rounding = 1,
															Callback = function(arg)
																v100 = arg
															end,
														})

														fn33(function()
															if v99 then
																v99:Disconnect()
																v99 = nil
															end

															fn49(1)
														end)
													end

													fn48()
												end
											end
										end

										do
											do
												local VirtualUser = game:GetService("VirtualUser")

												local connection = localPlayer.Idled:Connect(function()
													pcall(function()
														VirtualUser:CaptureController()
														VirtualUser:ClickButton2(Vector2.new())
													end)
												end)

												fn33(function()
													connection:Disconnect()
												end)
											end

											do
												v93 = nil
												flag19 = false

												tbl17.AntiAFK = tbl20.Util:AddToggle("AntiAFK", {
													Text = "Anti AFK (Premium)",
													Description = "Stay in game forever without getting kicked",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("AntiAFK")
														end
													end,
												})

												tbl20.Util:AddButton({
													Text = "Kill Self (Premium)",
													Func = function()
														fn36()
													end,
												})

												do
													local Items = nil

													pcall(function()
														Items = require(game.ReplicatedStorage.CAM.Global.Collectibles.Items)
													end)
												end
											end

											do
												local flag25 = false

												tbl17.AutoEquip = tbl20.Util:AddToggle("AutoEquip", {
													Text = "Auto Equip Best (Premium)",
													Description = "Keep equipping the best stat accessories you pick up",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("AutoEquip")
														end
													end,
												})

												fn33(function()
													flag25 = false
												end)
											end
										end

										do
											do
												local tbl26 = {}
												local tbl27 = {}

												tbl17.NoKillbricks = tbl20.Prot:AddToggle("NoKillbricks", {
													Text = "No Killbricks (Premium)",
													Description = "Walk over kill parts without dying",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("NoKillbricks")
														end
													end,
												})

												fn33(function()
													for _, v99 in ipairs(tbl26) do
														pcall(function()
															v99:Disconnect()
														end)
													end

													tbl26 = {}

													for _, v99 in pairs(tbl27) do
														for _, v100 in ipairs(v99) do
															pcall(function()
																v100:Reconnect()
															end)
														end
													end

													tbl27 = {}
												end)
											end
										end

										do
											local v99 = nil
											local v100 = nil

											tbl17.AntiVoid = tbl20.Prot:AddToggle("AntiVoid", {
												Text = "Anti Void (Premium)",
												Description = "Invisible floor that stops you from falling into the void",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("AntiVoid")
													end
												end,
											})

											fn33(function()
												if v99 then
													v99:Disconnect()
													v99 = nil
												end

												if v100 then
													if n28(3187) >= 409 then
														pcall(function()
															workspace.FallenPartsDestroyHeight = v100
														end)

														v100 = nil
													else
														while true do
														end
													end
												end
											end)
										end
									end

									do
										do
											do
												do
													local function fn48()
														local tbl26 = {}

														local function fn49()
															for _, v99 in ipairs(tbl26) do
																pcall(function()
																	v99:Disconnect()
																end)
															end

															table.clear(tbl26)
														end

														tbl17.TPOnDeath = tbl20.Util:AddToggle("TPOnDeath", {
															Text = "TP Back on Death (Premium)",
															Description = "Spawn back where you died instead of the lobby",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("TPOnDeath")
																end
															end,
														})

														fn33(function()
															fn49()
														end)
													end

													fn48()
												end

												tbl20.Server:AddButton({
													Text = "Server Hop (Premium)",
													Description = "Leave and join a new server",
													Func = function()
														fn36()
													end,
												})

												tbl20.Server:AddButton({
													Text = "Rejoin Server (Premium)",
													Description = "Rejoin this same server",
													Func = function()
														fn36()
													end,
												})

												tbl20.Server:AddButton({
													Text = "Server Age (Premium)",
													Description = "See how long this server has been running",
													Func = function()
														fn36()
													end,
												})

												do
													local v99 = nil
													local tbl26 = {}

													local function fn48()
														for _, v100 in ipairs(tbl26) do
															pcall(function()
																v100:Disconnect()
															end)
														end

														tbl26 = {}

														if v99 then
															pcall(function()
																v99:Destroy()
															end)

															v99 = nil
														end
													end

													tbl17.ChatLogger = tbl20.Chat:AddToggle("ChatLogger", {
														Text = "Chat Logger (Premium)",
														Description = "See everything everyone types in a separate window",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("ChatLogger")
															end
														end,
													})

													fn33(function()
														fn48()
													end)
												end
											end

											do
												local v99, v100

												do
													v99 = v84[35]

													do
														local str13 = ""
														v100 = tbl19.ClanSpin:AddGroupbox("Clan Spinner")

														v100:AddDropdown("DesiredClan", {
															Text = "Desired Clan",
															Description = "Which clan you want to roll",
															Values = {
																"Agatsuma",
																"Ando",
																"Aokawa",
																"Aori",
																"Aoshima",
																"Douma",
																"Fujiwara",
																"Fukukoshi",
																"Hagiwara",
																"Himejima",
																"Hozumi",
																"Iguro",
																"Kamado",
																"Kaneki",
																"Kanzaki",
																"Kazetani",
																"Kocho",
																"Kuroaki",
																"Kurosaki",
																"Kurotsume",
																"Makomo",
																"Mori",
																"Rengoku",
																"Sabito",
																"Saito",
																"Sakurai",
																"Shabana",
																"Shinazugawa",
																"Soyama",
																"Susumaru",
																"Suzuki",
																"Tamayo",
																"Toka",
																"Tomioka",
																"Tsukino",
																"Ubuyashiki",
																"Urokodaki",
																"Uzui",
																"Yahaba",
																"Yamagiri",
																"Yukimori",
															},
															Default = nil,
															Multi = false,
															Callback = function(arg)
																str13 = arg or ""
															end,
														})
													end
												end

												do
													v100:AddButton({
														Text = "Check Spins (Premium)",
														Func = function()
															fn36()
														end,
													})

													local function_ = game:GetService(v84[183]).Communication.ServerAndClient.Signals.SignalFunction.Function
												end

												local event2 = game:GetService(v84[183]).Communication.ServerAndClient.Signals.SignalEvent.Event

												tbl17.AutoSpin = v100:AddToggle("AutoSpin", {
													Text = "Auto Spin (Premium)",
													Description = "Keep spinning until you get the clan you want",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("AutoSpin")
														end
													end,
												})

												fn33(function()
													v99 = v84[35]
												end)
											end
										end

										do
											local str13, flag25, request_

											do
												str13 = ""
												flag25 = false

												do
													local flag26 = type(request) == "function" and request

													if flag26 then
														request_ = flag26
													else
														request_ = syn and syn.request
													end
												end
											end

											do
												local request_2 = request_ or http and http.request or type(http_request) == "function" and http_request
												local request_3

												if request_2 then
													request_3 = request_2
												else
													request_3 = fluxus and fluxus.request
												end

												getgenv()._zhSendWebhook = function(arg)
													if not flag25 or str13 == "" or not request_3 then
														return
													end

													pcall(function()
														request_3({
															Url = str13,
															Method = "POST",
															Headers = { ["Content-Type"] = "application/json" },
															Body = game:GetService("HttpService"):JSONEncode({
																embeds = {
																	{
																		title = "Item Picked Up",
																		color = 65416,
																		fields = {
																			{ name = "Player", value = localPlayer.Name, inline = true },
																			{ name = "Item", value = arg, inline = true },
																		},
																		footer = { text = "Zero Hub • Project Slayers 2" },
																		timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
																	},
																},
															}),
														})
													end)
												end
											end

											tbl20.Webhook:AddInput("WebhookURL", {
												Text = "Webhook URL",
												Default = "",
												Placeholder = "https://discord.com/api/webhooks/...",
												Callback = function(arg)
													str13 = arg or ""
												end,
											})

											tbl17.WebhookEnabled = tbl20.Webhook:AddToggle("WebhookEnabled", {
												Text = "Loot Webhook (Premium)",
												Description = "Send a webhook when you pick up loot",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("WebhookEnabled")
													end
												end,
											})

											fn33(function()
												flag25 = false
											end)
										end
									end

									do
										do
											flag20 = v84[35]
											Dungeon = tbl19.OuwMain:AddGroupbox("Dungeon")

											do
												local flag25 = false
												flag22 = false

												tbl17.AutoEnterOuw = Dungeon:AddToggle("AutoEnterOuw", {
													Text = "Auto Enter Ouwigahara (Premium)",
													Description = "TPs to gate and enters",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("AutoEnterOuw")
														end
													end,
												})

												fn33(function()
													flag25 = v84[35]
												end)
											end
										end

										do
											local v99 = tbl19.OuwCfg:AddGroupbox("Farm Config")

											tbl17.AutoReady = Dungeon:AddToggle("AutoReady", {
												Text = "Auto Ready Up (Premium)",
												Description = "Steps on the pad for you",
												Default = v84[35],
												Callback = function(arg)
													if arg then
														fn36("AutoReady")
													end
												end,
											})

											flag23 = false
											local str13 = "Below"
											local n42 = 6.5
											local n43 = 0
											local n44 = 2
											local n45 = 0
											local str14 = "Combat"
											local n46 = 0

											tbl17.OuwFarm = Dungeon:AddToggle("OuwFarm", {
												Text = "Auto Farm Mobs (Premium)",
												Description = "Attacks mobs as they spawn",
												Default = v84[35],
												Callback = function(arg)
													if arg then
														fn36("OuwFarm")
													end
												end,
											})

											v99:AddDropdown("OuwEquipSlot", {
												Text = "Auto Equip Slot",
												Description = "Which toolbar slot to equip while farming (0 = none)",
												Values = { "0", "1", "2", "3", "4", "5" },
												Default = "0",
												Multi = v84[35],
												Callback = function(arg)
													n46 = tonumber(arg) or 0
												end,
											})

											v99:AddDropdown("OuwKaWeapon", {
												Text = "Kill Aura Weapon",
												Description = "Weapon to swing",
												Values = tbl23,
												Default = "Combat",
												Multi = v84[35],
												Callback = function(arg)
													str14 = arg
												end,
											})

											v99:AddDropdown("OuwFarmMode", {
												Text = "Farm Position",
												Description = "Where you stand near the mob",
												Values = { "Above", "Below", "In Front", "Behind" },
												Default = "Below",
												Multi = false,
												Callback = function(arg)
													str13 = arg

													if n25 <= 4374 then
														while v84[126] do
														end
													end
												end,
											})

											v99:AddSlider("OuwFarmDist", {
												Text = "Distance",
												Default = 6.5,
												Min = 0,
												Max = 30,
												Rounding = 1,
												Callback = function(arg)
													n42 = arg
												end,
											})

											v99:AddSlider("OuwFarmOffX", {
												Text = "X Offset",
												Default = v84[67],
												Min = -20,
												Max = 20,
												Rounding = 1,
												Callback = function(arg)
													n43 = arg
												end,
											})

											v99:AddSlider("OuwFarmOffY", {
												Text = "Y Offset",
												Default = 2,
												Min = -20,
												Max = 20,
												Rounding = 1,
												Callback = function(arg)
													if not (n25 < 4373) then
														n44 = arg
														return
													end

													while true do
													end
												end,
											})

											v99:AddSlider("OuwFarmOffZ", {
												Text = "Z Offset",
												Default = v84[67],
												Min = -20,
												Max = 20,
												Rounding = 1,
												Callback = function(arg)
													n45 = arg
												end,
											})
										end
									end

									str12 = ""
									flag24 = false

									do
										local tbl26 = {
											startTime = 0,
											endPoints = 0,
											startPoints = 0,
											floor = 0,
											cardsPicked = {},
											itemsBought = {},
											itemsCrafted = {},
											deaths = 0,
											kills = v84[67],
											chestsOpened = 0,
											mode = "",
											map = "",
										}

										local function zhResetRunStats()
											tbl26 = {
												startTime = os.time(),
												endPoints = 0,
												startPoints = tonumber(localPlayer:GetAttribute("RunPoints")) or 0,
												floor = 0,
												cardsPicked = {},
												itemsBought = {},
												itemsCrafted = {},
												deaths = 0,
												kills = 0,
												chestsOpened = 0,
												sent = false,
												mode = workspace:GetAttribute("MinigameRunMode") or v84[169],
												map = workspace:GetAttribute("MinigameMap") or "Unknown",
											}
										end

										local function zhTrackCard(arg)
											if not flag24 then
												return
											end
											table.insert(tbl26.cardsPicked, arg)
										end

										local function zhTrackBuy(arg)
											if not flag24 then
												return
											end
											table.insert(tbl26.itemsBought, arg)
										end

										local function zhTrackCraft(arg)
											if not flag24 then
												return
											end
											table.insert(tbl26.itemsCrafted, arg)
										end

										local function zhSendRunWebhook()
											if not flag24 or str12 == "" then
												return
											end
											local request_ = type(request) == "function" and request or syn and syn.request or http and http.request or type(http_request) == "function" and http_request
											local request_2

											if request_ then
												request_2 = request_
											else
												request_2 = fluxus and fluxus.request
											end

											if not request_2 then
												fn34("Webhook failed — no HTTP function", v84[28])
												return
											end

											local function fn48(arg, arg2)
												local n42 = arg2 or 900
												if #arg <= n42 then
													return arg
												end
												return arg:sub(1, n42) .. "\n..."
											end

											local ok, result = pcall(function()
												local n42 = os.time() - (tbl26.startTime or os.time())
												local n43 = math.floor(n42 / 60)
												local n44 = n42 % 60
												local n45 = tonumber(localPlayer:GetAttribute("RunPoints")) or 0
												local n46 = tonumber(workspace:GetAttribute("MinigameFloor")) or 0
												local n47 = tonumber(localPlayer:GetAttribute("Hearts")) or 0
												local str13 = #tbl26.cardsPicked > 0 and table.concat(tbl26.cardsPicked, ", ") or "None"
												local str14 = #tbl26.itemsBought > 0 and table.concat(tbl26.itemsBought, ", ") or "None"
												local str15 = #tbl26.itemsCrafted > v84[67] and table.concat(tbl26.itemsCrafted, ", ") or "None"
												local concat = table.concat
												local tbl27 = {}
												local str16 = "Player : " .. tostring(localPlayer.Name)
												local str17 = "Map    : " .. tostring(tbl26.map or "Unknown")
												local str18 = "Mode   : " .. tostring(tbl26.mode or v84[169])
												local str19 = "Floor  : " .. tostring(n46)
												local str20 = "Points : " .. tostring(n45)
												local str21 = "Lives  : " .. tostring(n47)
												tbl27[1] = "```"
												tbl27[2] = str16
												tbl27[3] = str17
												tbl27[4] = str18
												tbl27[5] = str19
												tbl27[6] = "Time   : " .. n43 .. "m " .. n44 .. "s"
												tbl27[7] = str20
												tbl27[8] = str21
												tbl27[9] = "```"
												local v99 = concat(tbl27, "\n")
												local fields = {}
												local tbl28 = { name = "Cards", value = fn48(str13), inline = true }
												local tbl29 = { name = "Bought", value = fn48(str14), inline = true }
												fields[1] = tbl28
												fields[2] = tbl29

												if #tbl26.itemsCrafted > 0 then
													table.insert(fields, { name = "Crafted", value = fn48(str15), inline = v84[126] })
												end

												local HttpService = game:GetService("HttpService")
												local jsonEncode = HttpService.JSONEncode
												local tbl30 = {}
												local embeds = {}
												local tbl31 = { title = "Ouwigahara Run Complete" }
												local color = n45 >= 30000 and 65407

												if not color then
													color = n45 >= 15000 and 16766720 or 16729156
												end

												tbl31.color = color
												tbl31.description = v99
												tbl31.fields = fields
												tbl31.footer = { text = "Zero Hub" }
												embeds[1] = tbl31
												tbl30.embeds = embeds
												tbl30.username = "Zero Hub"

												local v100 = request_2({
													Url = str12,
													Method = "POST",
													Headers = { ["Content-Type"] = "application/json" },
													Body = jsonEncode(HttpService, tbl30),
												})

												if v100 and v100.StatusCode and v100.StatusCode >= 400 then
													fn34("Webhook returned " .. tostring(v100.StatusCode), 3)
												end
											end)

											if not ok then
												fn34("Webhook error: " .. tostring(result), 4)
											end
										end

										getgenv()._zhTrackCard = zhTrackCard
										getgenv()._zhTrackBuy = zhTrackBuy
										getgenv()._zhTrackCraft = zhTrackCraft
										getgenv()._zhSendRunWebhook = zhSendRunWebhook
										getgenv()._zhResetRunStats = zhResetRunStats
									end
								end

								local tbl26, tbl27, fn48

								do
									do
										do
											local flag25, flag26, flag27, flag28, flag29, flag30, flag31, tbl28

											do
												local n42

												do
													local tbl29, tbl30

													do
														do
															local v99 = tbl19.OuwCfg:AddGroupbox("Run Webhook")

															v99:AddInput("OuwWebhookURL", {
																Text = "Webhook URL",
																Default = "",
																Placeholder = "https://discord.com/api/webhooks/...",
																Callback = function(arg)
																	str12 = arg or ""
																end,
															})

															v99:AddToggle("OuwWebhookEnabled", {
																Text = "Run Summary Webhook (Premium)",
																Description = "Posts run stats to Discord",
																Default = false,
																Callback = function(arg)
																	if arg then
																		fn36("OuwWebhookEnabled")
																	end
																end,
															})

															v99:AddButton({
																Text = "Test Webhook (Premium)",
																Func = function()
																	fn36()
																end,
															})
														end

														do
															fn33(function()
																flag24 = v84[35]
															end)

															flag25 = false

															do
																local tbl31 = {}
																local tbl32 = {}
																local n43 = 50

																Dungeon:AddDropdown("CardPriority", {
																	Text = "Card Priority",
																	Description = "Prefer these types after rarity",
																	Values = {
																		"Heal",
																		"Potion",
																		"Stat",
																		"Skill",
																		v84[191],
																		"Clan",
																		"Forge",
																		"Fortune",
																		"ExtraLife",
																		"Revive",
																		"Reroll",
																		"Points",
																		"AscendClan",
																		"Trade",
																		"SkillSwap",
																		"SwapMap",
																		"Event",
																		"Skip",
																		"SkipFloor",
																	},
																	Default = {},
																	Multi = true,
																	Callback = function(arg)
																		tbl31 = {}

																		if type(arg) == "table" then
																			for k, v99 in pairs(arg) do
																				if type(k) == "string" and v99 then
																					tbl31[k] = v84[126]
																				elseif type(v99) == "string" then
																					tbl31[v99] = true
																				end
																			end
																		end
																	end,
																})

																Dungeon:AddDropdown("CardBlacklist", {
																	Text = "Blacklisted Cards",
																	Description = "Never picks these",
																	Values = {
																		"Arsenal",
																		"Berserk",
																		"Bloodbank",
																		"Cartographer",
																		"Clan Heir",
																		"Deep Freeze",
																		"Endurance Training",
																		"Featherweight",
																		"Focused Mind",
																		"Forbidden Art",
																		"Frenzy",
																		"Glass Cannon",
																		"Heavy Hitter",
																		"Hoarder",
																		"Last Rites",
																		"Loaded Dice",
																		"Lone Wolf",
																		"Lucky Draw",
																		"Medic",
																		"Momentum",
																		"Pacifist",
																		"Parting Gift",
																		"Plague Bearer",
																		"Prodigy",
																		"Quartermaster",
																		"Reincarnated",
																		"Reincarnation",
																		"Second Chance",
																		"Thick Blood",
																		"Twin Souls",
																		"Twin Weapons",
																		"Vampiric",
																		"Venom Fang",
																		"Weapon Master",
																		"Wildfire",
																		"Bare Hands",
																		"Berserkers",
																		"Bleeding Floor",
																		"Blood Moon",
																		"Boss Hunt",
																		"Champion",
																		"Cursed Coin",
																		"Double Time",
																		"Elite Guard",
																		"Fair Fight",
																		"Fog Of War",
																		"Glass Floor",
																		"Gold Rush",
																		"Grounded",
																		"Heavy Air",
																		"Iron Discipline",
																		"Lights Out",
																		"Long Night",
																		"No Guard",
																		"Rush Hour",
																		"The Horde",
																		"Thick Skin",
																		"Thin Air",
																		"Time Attack",
																		"Twin Bosses",
																		"Warcry",
																		"Adrenaline",
																		"Blood Pact",
																		"Bounty",
																		"Bulwark",
																		"Cheap Seats",
																		"Chill",
																		"Double Down",
																		"Envenomed",
																		"Handoff",
																		"Headhunter",
																		"Ignition",
																		"Jackpot Floor",
																		"Lifeline",
																		"Mulligan",
																		"Reshuffle",
																		"Respec",
																		"Sacrifice",
																		"Second Skin",
																		"Tainted Edge",
																		"Ticket Pack",
																		"Toll Gate",
																		"Tribute",
																		"Wager",
																		"Ascension",
																		"Boss Rush",
																		"Communal Heal",
																		"Iron Tower",
																		"Last Stand",
																		"Marathon",
																		"Rally",
																		"Split The Take",
																		"Streak",
																	},
																	Default = {},
																	Multi = true,
																	Callback = function(arg)
																		tbl32 = {}

																		if type(arg) == "table" then
																			for k, v99 in pairs(arg) do
																				if type(k) == "string" and v99 then
																					tbl32[k] = v84[126]
																				elseif type(v99) == "string" then
																					tbl32[v99] = true
																				end
																			end
																		end
																	end,
																})

																Dungeon:AddSlider("FullHealHP", {
																	Text = "Heal Card Below HP %",
																	Description = "0 = off",
																	Default = 50,
																	Min = 0,
																	Max = 100,
																	Rounding = 0,
																	Callback = function(arg)
																		n43 = arg
																	end,
																})
															end
														end

														tbl17.AutoPick = Dungeon:AddToggle("AutoPick", {
															Text = "Auto Pick Cards (Premium)",
															Description = "Picks the best card for you",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("AutoPick")
																end
															end,
														})

														flag26 = false

														tbl17.AutoSkip = Dungeon:AddToggle("AutoSkip", {
															Text = "Auto Skip Wave (Premium)",
															Description = "Votes to skip between waves",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("AutoSkip")
																end
															end,
														})

														tbl29 = {}
														flag27 = v84[35]
														flag28 = false
														n42 = 30000

														tbl30 = {
															["500 Wen"] = "Zeni",
															["Refinement Ore"] = "Zeni",
															["Mythic Refinement Ore"] = "Zeni",
															["1,000 Exp"] = "Crystal",
															["Bladed Wagasa Mastery"] = "Crystal",
															["Gauntlet Mastery"] = "Crystal",
															["Axe and Mace Mastery"] = "Crystal",
															["Water Mastery"] = "Crystal",
															["Scythe Mastery"] = "Crystal",
															["Fist Mastery"] = "Crystal",
															["Arrow Mastery"] = "Crystal",
															["Thunder Mastery"] = "Crystal",
															["Tai Chi Mastery"] = "Crystal",
															["Dream Mastery"] = "Crystal",
															["Shotgun Mastery"] = "Crystal",
															["Claws Mastery"] = "Crystal",
															["Pyrokenesis Mastery"] = "Crystal",
															["Spear Mastery"] = "Crystal",
															["Blood Manipulation Mastery"] = "Crystal",
															["Sword Mastery"] = "Crystal",
															["Reaping Blades Mastery"] = "Crystal",
															["Insect Mastery"] = "Crystal",
															["Sickles Mastery"] = "Crystal",
															["Tanto Mastery"] = "Crystal",
															["Wind Mastery"] = "Crystal",
															["Flame Mastery"] = "Crystal",
															["Cryokinesis Mastery"] = "Crystal",
															["Tamari Mastery"] = "Crystal",
															["Obi Manipulation Mastery"] = "Crystal",
															["Serpent Mastery"] = "Crystal",
															["Reaper Mastery"] = "Crystal",
															["Soryu Mastery"] = "Crystal",
															["War Fans Mastery"] = "Crystal",
															["Stone Mastery"] = "Crystal",
															["Sound Mastery"] = "Crystal",
															["Shockwave Mastery"] = "Crystal",
														}

														do
															local tbl31 = {}

															pcall(function()
																local Shop = require(game:GetService(v84[183]).CAM.Global.Shop)

																if Shop and Shop.itemsforsale then
																	for k in pairs(tbl30) do
																		local v99 = Shop.itemsforsale[k]

																		if v99 and v99.Price and v99.Price.RunPoints then
																			tbl31[k] = v99.Price.RunPoints
																		end
																	end
																end
															end)
														end
													end

													do
														local v99

														do
															local tbl31 = {}

															for k in pairs(tbl30) do
																table.insert(tbl31, k)
															end

															table.sort(tbl31)
															v99 = tbl19.OuwShop:AddGroupbox("Auto Buy")

															v99:AddDropdown("AutoBuyItem", {
																Text = "Auto Buy Items",
																Description = "Spends your points on these",
																Values = tbl31,
																Default = {},
																Multi = true,
																Callback = function(arg)
																	tbl29 = {}

																	if type(arg) == "table" then
																		for k, v100 in pairs(arg) do
																			if type(k) == "string" and v100 == v84[126] then
																				table.insert(tbl29, k)
																			elseif type(v100) == "string" then
																				table.insert(tbl29, v100)
																			end
																		end
																	end
																end,
															})
														end

														local event2 = game:GetService(v84[183]).Communication.ServerAndClient.Signals.SignalEvent.Event

														v99:AddButton({
															Text = "Buy Now (Premium)",
															Description = "One-time buy",
															Func = function()
																fn36()
															end,
														})

														tbl17.AutoBuyZeni = v99:AddToggle("AutoBuyZeni", {
															Text = "Auto Buy (Premium)",
															Description = "Keeps buying while you can afford it",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("AutoBuyZeni")
																end
															end,
														})
													end
												end

												local v99 = tbl19.OuwShop:AddGroupbox("Points Shop")

												v99:AddToggle("AutoResetPoints", {
													Text = "Auto Reset At Points (Premium)",
													Description = "Die 3x at threshold",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("AutoResetPoints")
														end
													end,
												})

												v99:AddSlider("ResetAtPoints", {
													Text = "Reset At",
													Description = "Points threshold to trigger auto reset",
													Default = 30000,
													Min = 1000,
													Max = 1000000,
													Rounding = 0,
													Callback = function(arg)
														if not flag3 then
															return
														end
														n42 = arg
													end,
												})

												v99:AddButton({
													Text = "Leave Dungeon (Premium)",
													Description = "Leave now",
													Func = function()
														fn36()
													end,
												})

												flag29 = false

												v99:AddToggle("AutoOuwChest", {
													Text = "Auto Open Chest (Premium)",
													Description = "Opens at 30k points",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("AutoOuwChest")
														end
													end,
												})

												flag30 = false
												local n43 = 300
												flag31 = false
												tbl28 = {}
												local function_ = game:GetService("ReplicatedStorage").Communication.ServerAndClient.Signals.SignalFunction.Function

												v99:AddSlider("LeaveDelay", {
													Text = "Leave Delay (seconds)",
													Default = 300,
													Min = 1,
													Max = 600,
													Rounding = 0,
													Callback = function(arg)
														n43 = arg
													end,
												})

												v99:AddToggle("AutoLeaveDungeon", {
													Text = "Auto Leave Dungeon (Premium)",
													Description = "Leave after delay when dungeon ends",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("AutoLeaveDungeon")
														end
													end,
												})
											end

											local v99, v100

											do
												do
													local v101 = tbl19.OuwCraft:AddGroupbox("Auto Craft")
													local tbl29 = {}
													local tbl30 = {}

													for k, definition in pairs(require(game:GetService("ReplicatedStorage").CAM.Global.Crafting).Definitions) do
														if definition.station == "Ouwigahara" then
															tbl30[definition.result] = k
															table.insert(tbl29, definition.result)
														end
													end

													table.sort(tbl29)

													v101:AddDropdown("AutoCraftRecipe", {
														Text = "Recipes",
														Description = "What to craft",
														Values = tbl29,
														Default = {},
														Multi = v84[126],
														Callback = function(arg)
															tbl28 = {}

															if type(arg) == "table" then
																for k, v102 in pairs(arg) do
																	if type(k) == "string" and v102 == true then
																		if tbl30[k] then
																			table.insert(tbl28, tbl30[k])
																		end
																	elseif type(v102) == "string" then
																		if tbl30[v102] then
																			table.insert(tbl28, tbl30[v102])
																		end
																	end
																end
															end
														end,
													})

													v101:AddToggle("AutoCraftToggle", {
														Text = "Auto Craft (Premium)",
														Description = "Loops until out of materials",
														Default = v84[35],
														Callback = function(arg)
															if arg then
																fn36("AutoCraftToggle")
															end
														end,
													})
												end

												fn33(function()
													flag31 = false
												end)

												v99 = tbl19.OuwIK:AddGroupbox("Insta Kill")
												v100 = v84[35]

												do
													local v101 = v84[153]
													local n42 = 95

													tbl17.OuwIK = v99:AddToggle("OuwIK", {
														Text = "Insta Kill (Premium)",
														Description = "Kills mobs below the HP threshold, no kill credit but still farms dungeon points",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("OuwIK")
															end
														end,
													})

													v99:AddSlider("OuwIKRange", {
														Text = "Insta Kill Range",
														Description = "How far it reaches",
														Default = v84[153],
														Min = v84[31],
														Max = 500,
														Rounding = v84[67],
														Callback = function(arg)
															v101 = arg
														end,
													})

													v99:AddSlider("OuwIKThreshold", {
														Text = "HP Threshold %",
														Description = "Only kills below this HP",
														Default = 95,
														Min = 1,
														Max = 100,
														Rounding = 0,
														Callback = function(arg)
															n42 = arg
														end,
													})
												end
											end

											do
												local flag32 = false

												v99:AddToggle("OuwInsectSkill", {
													Text = "Killaura V2 (Premium)",
													Description = "Insect Breathing needed",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("OuwInsectSkill")
														end
													end,
												})

												fn33(function()
													flag22 = false
													flag23 = false
													flag25 = v84[35]
													flag26 = v84[35]
													v100 = v84[35]
													flag32 = v84[35]
													flag27 = false
													flag28 = false
													flag30 = false
													flag29 = false
												end)
											end
										end

										do
											do
												local v99 = nil
												local str13 = "Zero Hub on top"
												local n42 = 1000

												tbl18.SpamMsg = tbl20.Chat:AddInput("SpamMsg", {
													Text = "Spam Message",
													Default = "Zero Hub on top",
													Placeholder = "Message to spam",
													Callback = function(arg)
														str13 = arg
													end,
												})

												tbl18.SpamDelay = tbl20.Chat:AddSlider("SpamDelay", {
													Text = "Delay (ms)",
													Default = 1000,
													Min = v84[153],
													Max = 10000,
													Rounding = v84[67],
													Callback = function(arg)
														n42 = arg
													end,
												})

												tbl17.ChatSpammer = tbl20.Chat:AddToggle("ChatSpammer", {
													Text = "Chat Spammer (Premium)",
													Description = "Repeatedly send a message in chat on a timer",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("ChatSpammer")
														end
													end,
												})

												fn33(function()
													if v99 then
														task.cancel(v99)
														v99 = nil
													end
												end)
											end
										end

										do
											local function fn49()
												tbl17.PlayerESPEnabled = tbl20.VizL:AddToggle("PlayerESPEnabled", {
													Text = "Player ESP (Premium)",
													Description = "See all players through walls",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("PlayerESPEnabled")
														end
													end,
												})

												tbl18.PlayerESPColor = tbl20.VizL:AddColorPicker("PlayerESPColor", {
													Text = "Player ESP Color",
													Default = Color3.fromRGB(v84[67], 255, v84[67]),
													Callback = function(zhPlayerESPColor)
														getgenv()._ZH_PlayerESPColor = zhPlayerESPColor

														for k, v99 in pairs(zhEspLib.Cache) do
															if typeof(k) == "Instance" and k:IsA("Player") then
																v99.CustomGradTop = zhPlayerESPColor
																v99.CustomGradBot = zhPlayerESPColor
																v99.LastGradTop = nil
																v99.LastGradBot = nil
																v99.LastGlowTop = nil
																v99[v84[174]] = nil
																v99[v84[22]] = nil
																v99[v84[72]] = nil
															end
														end
													end,
												})

												tbl17.ShowLocalESP = tbl20.VizL2:AddToggle("ShowLocalESP", {
													Text = "Show Local Player (Premium)",
													Description = "See ESP on your own character too",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("ShowLocalESP")
														end
													end,
												})

												local v99 = nil

												local function fn50()
													local tbl28 = { "-- None --" }

													for _, player in ipairs(service2:GetPlayers()) do
														if player ~= localPlayer then
															table.insert(tbl28, player.Name)
														end
													end

													return tbl28
												end

												tbl18.ESPTargetPlayer = tbl20.VizL3:AddDropdown("ESPTargetPlayer", {
													Text = "ESP Target",
													Description = "Only show ESP on this player",
													Values = fn50(),
													Default = nil,
													Multi = false,
													Callback = function(arg)
														v99 = arg
													end,
												})

												tbl20.VizL3:AddButton({
													Text = "Refresh Players (Premium)",
													Func = function()
														fn36()
													end,
												})

												tbl17.ESPTargetOnly = tbl20.VizL3:AddToggle("ESPTargetOnly", {
													Text = "ESP Single Player (Premium)",
													Description = "Only show ESP on the player you picked above",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("ESPTargetOnly")
														end
													end,
												})

												tbl17.ESPNearestOnly = tbl20.VizL3:AddToggle("ESPNearestOnly", {
													Text = "ESP Nearest Only (Premium)",
													Description = "Only show ESP on whoever is closest to you",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("ESPNearestOnly")
														end
													end,
												})

												tbl17.ESPBoxes = tbl20.VizR:AddToggle("ESPBoxes", {
													Text = "Boxes (Premium)",
													Description = "Draw boxes around players",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("ESPBoxes")
														end
													end,
												})

												tbl17.ESPGlow = tbl20.VizR:AddToggle("ESPGlow", {
													Text = "Box Glow (Premium)",
													Description = "Add a glow around the boxes",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("ESPGlow")
														end
													end,
												})

												tbl17.ESPChams = tbl20.VizR:AddToggle("ESPChams", {
													Text = "Chams (Premium)",
													Description = "Color players so you can see them through anything",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("ESPChams")
														end
													end,
												})

												tbl17.ESPShowName = tbl20.VizR:AddToggle("ESPShowName", {
													Text = "Name (Premium)",
													Description = "Show each player's name above them",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("ESPShowName")
														end
													end,
												})

												tbl17.ESPShowDist = tbl20.VizR:AddToggle("ESPShowDist", {
													Text = "Distance (Premium)",
													Description = "Show how far away each player is",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("ESPShowDist")
														end
													end,
												})

												tbl17.ESPShowHP = tbl20.VizR:AddToggle("ESPShowHP", {
													Text = "Health Bar (Premium)",
													Description = "Show how much health each player has",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("ESPShowHP")
														end
													end,
												})

												tbl17.ESPShowWeapon = tbl20.VizR:AddToggle("ESPShowWeapon", {
													Text = "Weapon (Premium)",
													Description = "Show what weapon each player is holding",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("ESPShowWeapon")
														end
													end,
												})

												tbl18.ESPDist = tbl20.VizR:AddSlider("ESPDist", {
													Text = "Max Distance",
													Default = 7520,
													Min = 100,
													Max = 15000,
													Rounding = 0,
													Callback = function(distance)
														table_.Distance = distance
													end,
												})

												tbl18.BoxType = tbl20.VizR2:AddDropdown("BoxType", {
													Text = "Box Type",
													Description = "Choose box rendering style",
													Values = { "2D", "Corner" },
													Default = "2D",
													Multi = false,
													Callback = function(type_)
														table_.Boxes.Type = type_
													end,
												})

												tbl18.GlowT1 = tbl20.VizR2:AddSlider("GlowT1", {
													Text = "Glow Top Trans",
													Default = 0.75,
													Min = 0,
													Max = 1,
													Rounding = 2,
													Callback = function(arg)
														table_.Boxes["Box Glow"].Transparency[1] = arg
													end,
												})

												tbl18.GlowT2 = tbl20.VizR2:AddSlider("GlowT2", {
													Text = "Glow Bot Trans",
													Default = 0.75,
													Min = 0,
													Max = 1,
													Rounding = v84[119],
													Callback = function(arg)
														table_.Boxes["Box Glow"].Transparency[v84[119]] = arg
													end,
												})

												tbl18.ChamsFillT = tbl20.VizR2:AddSlider("ChamsFillT", {
													Text = "Chams Fill Trans",
													Default = 0,
													Min = v84[67],
													Max = v84[115],
													Rounding = 2,
													Callback = function(fillTransparency)
														table_.Chams.FillTransparency = fillTransparency
													end,
												})

												tbl18.ChamsColor = tbl20.VizR3:AddColorPicker("ChamsColor", {
													Text = "Chams Color",
													Default = Color3.fromRGB(v84[12], 255, 255),
													Callback = function(fillColor)
														if 2429 > n28(1142) then
															table_.Chams.FillColor = fillColor
															return
														end

														while true do
														end
													end,
												})

												tbl18.BoxTopColor = tbl20.VizR3:AddColorPicker("BoxTopColor", {
													Text = "Box Top",
													Default = Color3.fromRGB(255, v84[12], 255),
													Callback = function(top)
														table_.Boxes.Gradients.Top = top
														table_.Boxes["Box Glow"].Top = top
													end,
												})

												tbl18.BoxBotColor = tbl20.VizR3:AddColorPicker("BoxBotColor", {
													Text = "Box Bottom",
													Default = Color3.fromRGB(255, 255, 255),
													Callback = function(bot)
														table_.Boxes.Gradients.Bot = bot
														table_.Boxes[v84[25]].Bot = bot
													end,
												})

												fn33(function()
													if n26(964) >= 5998 then
														pcall(function()
															if zhEspLib and zhEspLib.Unload then
																zhEspLib:Unload()
															end
														end)

														return
													end

													while true do
													end
												end)
											end

											fn49()
										end
									end

									do
										do
											do
												do
													local function fn49()
														local key = nil

														local function fn50()
															local tbl28 = { "--" }

															for _, player in ipairs(service2:GetPlayers()) do
																if player ~= localPlayer then
																	table.insert(tbl28, player.Name)
																end
															end

															return tbl28
														end

														tbl18.SpectatePlayers = tbl20.CamSpec:AddDropdown("SpectatePlayers", {
															Text = "Spectate Player",
															Description = "Watch another player's screen",
															Values = fn50(),
															Default = nil,
															Multi = false,
															Callback = function(arg)
																key = type(arg) == "table" and next(arg) or arg
															end,
														})

														tbl20.CamSpec:AddButton({
															Text = "Refresh Players (Premium)",
															Func = function()
																fn36()
															end,
														})

														tbl20.CamSpec:AddButton({
															Text = "Spectate / Stop (Premium)",
															Func = function()
																fn36()
															end,
														})

														local tbl28 = {}

														tbl17.NoFog = tbl20.CamLight:AddToggle("NoFog", {
															Text = "No Fog (Premium)",
															Description = "See clearly even in foggy or hazy areas",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("NoFog")
																end
															end,
														})

														local tbl29 = {}

														tbl17.NoAtmosphere = tbl20.CamLight:AddToggle("NoAtmosphere", {
															Text = "No Atmosphere (Premium)",
															Description = "Remove bloom, blur, and sun rays for a cleaner view",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("NoAtmosphere")
																end
															end,
														})

														tbl17.FullBright = tbl20.CamLight:AddToggle("FullBright", {
															Text = "FullBright (Premium)",
															Description = "Light up everything so dark areas aren't dark anymore",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("FullBright")
																end
															end,
														})

														tbl18.Brightness = tbl20.CamLight:AddSlider("Brightness", {
															Text = "Brightness",
															Default = 2,
															Min = 0,
															Max = 10,
															Rounding = 1,
															Callback = function(brightness)
																tbl25.brightness = brightness
															end,
														})

														local color = Color3.fromRGB(128, 128, 128)

														tbl17.CustomAmbient = tbl20.CamLight:AddToggle("CustomAmbient", {
															Text = "World Ambient (Premium)",
															Description = "Tint the entire map with a custom color",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("CustomAmbient")
																end
															end,
														})

														tbl18.WorldAmbient = tbl20.CamLight:AddColorPicker("WorldAmbient", {
															Text = "Ambient Color",
															Default = Color3.fromRGB(128, 128, 128),
															Callback = function(arg)
																color = arg
															end,
														})

														local v99 = nil
														local n42 = 14

														tbl17.TimeOfDay = tbl20.CamLight:AddToggle("TimeOfDay", {
															Text = "Force Time of Day (Premium)",
															Description = "Lock the in-game clock to whatever hour you want",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("TimeOfDay")
																end
															end,
														})

														tbl18.TimeOfDayHour = tbl20.CamLight:AddSlider("TimeOfDayHour", {
															Text = "Hour",
															Default = v84[123],
															Min = 0,
															Max = 24,
															Rounding = v84[115],
															Callback = function(clockTime)
																n42 = clockTime

																if v99 then
																	Lighting.ClockTime = clockTime
																end
															end,
														})

														fn33(function()
															if v99 then
																v99:Disconnect()
																v99 = nil
															end
														end)

														local tbl30 = {}

														tbl17.Freecam = tbl20.CamFree:AddToggle("Freecam", {
															Text = "Free Cam (Premium)",
															Description = "Detach and fly your camera freely",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("Freecam")
																end
															end,
														})

														tbl18.FreeCamSens = tbl20.CamFree:AddSlider("FreeCamSens", {
															Text = "Look Sensitivity",
															Default = v84[13],
															Min = 0.1,
															Max = 5,
															Rounding = 1,
															Callback = function(freeCamSens)
																tbl25.freeCamSens = freeCamSens
															end,
														})

														tbl18.FreeCamSpeed = tbl20.CamFree:AddSlider("FreeCamSpeed", {
															Text = "Move Speed",
															Default = 0.5,
															Min = 0.1,
															Max = 50,
															Rounding = 1,
															Callback = function(freeCamSpeed)
																tbl25.freeCamSpeed = freeCamSpeed
															end,
														})

														tbl17.Force3rdPerson = tbl20.CamView:AddToggle("Force3rdPerson", {
															Text = "Force 3rd Person (Premium)",
															Description = "Stay zoomed out even if the game forces first person",
															Default = false,
															Callback = function(arg)
																if arg then
																	if n27(2552) > 9143 then
																		fn36("Force3rdPerson")
																	else
																		while v84[126] do
																		end
																	end
																end
															end,
														})

														local v100 = nil

														tbl17.FOVChanger = tbl20.CamView:AddToggle("FOVChanger", {
															Text = "Custom FOV (Premium)",
															Description = "Change how wide your view is",
															Default = v84[35],
															Callback = function(arg)
																if arg then
																	fn36("FOVChanger")
																end
															end,
														})

														tbl18.FOV = tbl20.CamView:AddSlider("FOV", {
															Text = "Camera FOV",
															Default = 70,
															Min = 0,
															Max = 120,
															Rounding = v84[115],
															Callback = function(fovVal)
																tbl25.fovVal = fovVal

																if v100 then
																	currentCamera.FieldOfView = fovVal
																end
															end,
														})

														local v101 = nil

														tbl17.InfZoom = tbl20.CamView:AddToggle("InfZoom", {
															Text = "Infinite Zoom (Premium)",
															Description = "Zoom your camera in and out as far as you want",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("InfZoom")
																	if not flag3 then
																		return
																	end
																end
															end,
														})

														fn33(function()
															if v101 then
																v101:Disconnect()
																v101 = nil

																pcall(function()
																	localPlayer.CameraMaxZoomDistance = 128
																end)
															end
														end)

														fn33(function()
															if n28(413) <= 2629 then
																if v100 then
																	v100:Disconnect()
																	v100 = nil
																end

																for _, v102 in ipairs(tbl28) do
																	pcall(function()
																		v102:Disconnect()
																	end)
																end

																for _, v102 in ipairs(tbl29) do
																	pcall(function()
																		v102:Disconnect()
																	end)
																end

																UserInputService.MouseIconEnabled = true

																for _, v102 in ipairs(tbl30) do
																	pcall(function()
																		v102:Disconnect()
																	end)
																end

																pcall(function()
																	local v102 = fn29()

																	if v102 then
																		local v103 = v102:FindFirstChild(v84[167])

																		if v103 then
																			v103.Anchored = false
																		end
																	end
																end)

																currentCamera.FieldOfView = 70
																currentCamera.CameraType = Enum.CameraType.Custom
																UserInputService.MouseBehavior = Enum.MouseBehavior.Default
																return
															end

															while true do
															end
														end)
													end

													fn49()
												end

												tbl18.PerfFPSCap = tbl20.WorldR2:AddSlider("PerfFPSCap", {
													Text = "FPS Cap (0 = unlimited)",
													Default = 0,
													Min = 0,
													Max = 360,
													Rounding = 0,
													Callback = function(arg)
														pcall(function()
															setfpscap(arg == 0 and math.huge or arg)
														end)
													end,
												})

												do
													local v99 = nil

													tbl17.No3DRender = tbl20.WorldR2:AddToggle("No3DRender", {
														Text = "Disable 3D Rendering (Premium)",
														Description = "Turn off all 3D visuals for maximum FPS — you'll only see the UI",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("No3DRender")
															end
														end,
													})

													fn33(function()
														if v99 then
															v99:Disconnect()
															v99 = nil
														end

														pcall(function()
															service:Set3dRenderingEnabled(true)
														end)
													end)
												end
											end

											do
												tbl17.PotatoMode = tbl20.WorldR2:AddToggle("PotatoMode", {
													Text = "Potato Mode (Premium)",
													Description = "Strip the game down to bare minimum graphics for the most FPS possible",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("PotatoMode")
														end
													end,
												})

												fn33(function()
												end)

												tbl18.Coordinates = tbl20.NavL:AddInput(v84[3], {
													Default = "",
													Placeholder = "X, Y, Z",
													Callback = function()
													end,
												})

												tbl20.NavL:AddButton({
													Text = "Tween To (Premium)",
													Func = function()
														fn36()
													end,
												})

												tbl20.NavL:AddButton({
													Text = "Copy Position (Premium)",
													Func = function()
														fn36()
													end,
												})

												v94 = nil

												tbl17.ClickTP = tbl20.NavL:AddToggle("ClickTP", {
													Text = "Click TP (Premium)",
													Description = "Right-click anywhere on the map to teleport there",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("ClickTP")
														end
													end,
												})

												do
													local tbl28 = {}
													local tbl29 = {}
													local v99 = tbl19.Teleport:AddGroupbox("Place Teleport")

													tbl18.PlacePicker = v99:AddDropdown("PlacePicker", {
														Text = "Select Place",
														Values = { "Loading..." },
														Default = nil,
														Multi = v84[35],
														Callback = function()
														end,
													})

													v99:AddButton({
														Text = "Teleport To Place (Premium)",
														Description = "Go to the selected place",
														Func = function()
															fn36()
														end,
													})

													task.spawn(function()
														local ok, result = pcall(function()
															return game:GetService("AssetService"):GetGamePlacesAsync()
														end)

														if ok and result then
															pcall(function()
																while true do
																	for _, v100 in ipairs(result:GetCurrentPage()) do
																		local name = v100.Name or "Place " .. v100.PlaceId
																		table.insert(tbl28, name)
																		tbl29[name] = v100.PlaceId
																	end

																	if not result.IsFinished then
																		result:AdvanceToNextPageAsync()
																		continue
																	end
																	break
																end
															end)
														end

														if #tbl28 == 0 then
															table.insert(tbl28, "Current: " .. game.PlaceId)
															tbl29["Current: " .. game.PlaceId] = game.PlaceId
														end

														pcall(function()
															tbl18.PlacePicker:SetValues(tbl28)
														end)
													end)
												end
											end

											do
												local function fn49()
													local function fn50()
														local tbl28 = { "--" }

														for _, player in ipairs(service2:GetPlayers()) do
															if player ~= localPlayer then
																table.insert(tbl28, player.Name)
															end
														end

														return tbl28
													end

													tbl18.AttachTargetPlayer = tbl20.NavR:AddDropdown("AttachTargetPlayer", {
														Text = "Attach Target",
														Description = "Pick a player to stick to",
														Values = fn50(),
														Default = nil,
														Multi = v84[35],
														Callback = function()
														end,
													})

													tbl20.NavR:AddButton({
														Text = "Refresh Players (Premium)",
														Func = function()
															fn36()
														end,
													})
												end

												fn49()
											end
										end

										do
											tbl17.AttachSelected = tbl20.NavR:AddToggle("AttachSelected", {
												Text = "Attach Player (Premium)",
												Description = "Follow a player and stay right on top of them",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("AttachSelected")
													end
												end,
											})

											tbl18.MobsRange = tbl20.NavR2:AddSlider("MobsRange", {
												Text = "Range",
												Default = 1000,
												Min = 0,
												Max = 10000,
												Rounding = v84[67],
												Callback = function()
												end,
											})

											tbl18.MobsDistance = tbl20.NavR2:AddSlider("MobsDistance", {
												Text = "Distance",
												Default = 0,
												Min = -50,
												Max = 50,
												Rounding = v84[67],
												Callback = function()
												end,
											})

											tbl18.MobsHeight = tbl20.NavR2:AddSlider("MobsHeight", {
												Text = "Height",
												Default = 0,
												Min = -50,
												Max = 50,
												Rounding = v84[67],
												Callback = function()
												end,
											})

											do
												local flag25 = false
												local tbl28 = {}
												local v99 = nil
												local v100 = nil

												local function fn49()
													local tbl29 = { "--" }

													for _, player in ipairs(service2:GetPlayers()) do
														if player ~= localPlayer then
															table.insert(tbl29, player.Name)
														end
													end

													return tbl29
												end

												local function fn50()
													flag25 = false

													if v100 then
														pcall(function()
															v100:Disconnect()
														end)

														v100 = nil
													end

													for _, v101 in ipairs(tbl28) do
														pcall(function()
															v101:Disconnect()
														end)
													end

													tbl28 = {}
													local v101 = fn29()

													if v101 then
														for _, descendant in ipairs(v101:GetDescendants()) do
															if descendant:IsA("BasePart") then
																pcall(function()
																	descendant.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
																	descendant.Massless = v84[35]
																	descendant.Velocity = Vector3.zero
																end)
															elseif descendant:IsA("BodyAngularVelocity") then
																pcall(function()
																	descendant:Destroy()
																end)
															end
														end
													end
												end

												tbl18.FlingTarget = tbl20.NavR2:AddDropdown("FlingTarget", {
													Text = "Fling Target",
													Description = "Pick a player to fling",
													Values = fn49(),
													Default = nil,
													Multi = false,
													Callback = function(arg)
														v99 = arg
													end,
												})

												tbl20.NavR2:AddButton({
													Text = "Refresh Players (Premium)",
													Func = function()
														fn36()
													end,
												})

												tbl17.FlingPlayer = tbl20.NavR2:AddToggle("FlingPlayer", {
													Text = "Fling Player (Premium)",
													Description = "Teleport to a player and launch them into the sky",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("FlingPlayer")
														end
													end,
												})

												fn33(function()
													fn50()
												end)
											end
										end

										do
											do
												do
													local v99 = nil

													tbl17.AntiFling = tbl20.NavR2:AddToggle("AntiFling", {
														Text = "Anti Fling (Premium)",
														Description = "Stop other players from flinging you",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("AntiFling")
															end
														end,
													})

													fn33(function()
														if v99 then
															v99:Disconnect()
															v99 = nil
														end
													end)
												end
											end

											do
												local v99 = nil
												local flag25 = false

												tbl17.XRay = tbl20.CamVis:AddToggle("XRay", {
													Text = "X-Ray (Premium)",
													Description = "See through walls and objects",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("XRay")
														end
													end,
												})

												tbl17.XRay:AddKeybind({ Default = Enum.KeyCode.P, Mode = "Toggle" })

												fn33(function()
													if v99 then
														v99:Disconnect()
														v99 = nil
													end

													flag25 = false

													for _, descendant in ipairs(workspace:GetDescendants()) do
														if descendant:IsA("BasePart") then
															pcall(function()
																descendant.LocalTransparencyModifier = 0
															end)
														end
													end
												end)
											end
										end

										do
											local flag25 = false
											local v99 = nil

											tbl17.HideMap = tbl20.PerfVis:AddToggle("HideMap", {
												Text = "Hide Map (Premium)",
												Description = "Make the entire map invisible so you only see players",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("HideMap")
													end
												end,
											})

											fn33(function()
												if v99 then
													v99:Disconnect()
													v99 = nil
												end

												flag25 = v84[35]

												for _, descendant in ipairs(workspace:GetDescendants()) do
													if descendant:IsA("BasePart") then
														pcall(function()
															descendant.LocalTransparencyModifier = 0
														end)
													end
												end

												pcall(function()
													local v100 = v84[67]
													workspace:FindFirstChildOfClass("Terrain").Transparency = v100
												end)
											end)
										end
									end

									do
										do
											do
												do
													local v99 = nil
													local flag25 = false

													tbl17.HideChar = tbl20.IdVis:AddToggle("HideChar", {
														Text = "Hide Character (Premium)",
														Description = "Make yourself invisible on your screen",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("HideChar")
															end
														end,
													})

													fn33(function()
														if v99 then
															v99:Disconnect()
															v99 = nil
														end

														flag25 = false
														local v100 = fn29()

														if v100 then
															for _, descendant in ipairs(v100:GetDescendants()) do
																if descendant:IsA("BasePart") or descendant:IsA("Decal") then
																	pcall(function()
																		descendant.LocalTransparencyModifier = v84[67]
																	end)
																end
															end
														end
													end)
												end
											end

											do
												local v99 = nil
												local flag25 = false

												tbl17.HideOthers = tbl20.IdVis:AddToggle("HideOthers", {
													Text = "Hide Other Players (Premium)",
													Description = "Make every other player invisible on your screen",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("HideOthers")
														end
													end,
												})

												fn33(function()
													if v99 then
														v99:Disconnect()
														v99 = nil
													end

													flag25 = false

													for _, player in ipairs(service2:GetPlayers()) do
														if player ~= localPlayer and player.Character then
															for _, descendant in ipairs(player.Character:GetDescendants()) do
																if descendant:IsA("BasePart") or descendant:IsA("Decal") then
																	pcall(function()
																		descendant.LocalTransparencyModifier = v84[67]
																	end)
																end
															end
														end
													end
												end)
											end
										end

										do
											do
												local v99 = nil
												local flag25 = v84[35]

												tbl17.HideAllPlayers = tbl20.IdVis:AddToggle("HideAllPlayers", {
													Text = "Hide All Players (Premium)",
													Description = "Make every player including yourself invisible",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("HideAllPlayers")
														end
													end,
												})

												fn33(function()
													if v99 then
														v99:Disconnect()
														v99 = nil
													end

													flag25 = false

													for _, player in ipairs(service2:GetPlayers()) do
														if player.Character then
															for _, descendant in ipairs(player.Character:GetDescendants()) do
																if descendant:IsA("BasePart") or descendant:IsA("Decal") then
																	pcall(function()
																		descendant.LocalTransparencyModifier = 0
																	end)
																end
															end
														end
													end
												end)
											end
										end

										do
											v95 = nil

											tbl17.NearbyNotifier = tbl20.SafeAlert:AddToggle("NearbyNotifier", {
												Text = "Nearby Alert (Premium)",
												Description = "Get warned when someone is getting close to you",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("NearbyNotifier")
													end
												end,
											})

											tbl18.NearbyDist = tbl20.SafeAlert:AddSlider("NearbyDist", {
												Text = "Alert Range",
												Default = 500,
												Min = 0,
												Max = 10000,
												Rounding = 0,
												Callback = function()
												end,
											})

											tbl17.KickNearby = tbl20.SafeAlert:AddToggle("KickNearby", {
												Text = "Kick Nearby (Premium)",
												Description = "Automatically leave the server when a player gets too close",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("KickNearby")
													end
												end,
											})

											tbl18.KickNearbyDist = tbl20.SafeAlert:AddSlider("KickNearbyDist", {
												Text = "Kick Range",
												Default = v84[157],
												Min = v84[32],
												Max = 500,
												Rounding = 0,
												Callback = function()
												end,
											})

											do
												local v99 = nil

												tbl20.Retreat:AddButton({
													Text = "Set Retreat Position (Premium)",
													Description = "Save your current location as the retreat point",
													Func = function()
														fn36()
													end,
												})

												tbl20.Retreat:AddButton({
													Text = "Clear Retreat Position (Premium)",
													Func = function()
														fn36()
													end,
												})

												tbl17.AutoRetreat = tbl20.Retreat:AddToggle("AutoRetreat", {
													Text = "Auto Retreat (Premium)",
													Description = "Teleport to your retreat point when health gets low",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("AutoRetreat")
														end
													end,
												})

												tbl18.RetreatHP = tbl20.Retreat:AddSlider("RetreatHP", {
													Text = "Retreat At HP %",
													Default = 30,
													Min = 1,
													Max = 90,
													Rounding = v84[67],
													Callback = function()
													end,
												})

												fn33(function()
													if v99 then
														v99:Disconnect()
														v99 = nil
													end
												end)
											end
										end

										do
											local tbl28 = {}

											tbl17.StaffDetect = tbl20.SafeAlert:AddToggle("StaffDetect", {
												Text = "Staff Detection (Premium)",
												Description = "Get notified when a game staff member is in the server or joins",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("StaffDetect")
													end
												end,
											})

											tbl17.StaffKick = tbl20.SafeAlert:AddToggle("StaffKick", {
												Text = "Kick On Staff Join (Premium)",
												Description = "Automatically leave the server when staff is detected",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("StaffKick")
													end
												end,
											})

											fn33(function()
												for _, v99 in ipairs(tbl28) do
													pcall(function()
														v99:Disconnect()
													end)
												end

												tbl28 = {}
											end)
										end
									end

									do
										do
											do
												tbl17.NoSlow = tbl20.Prot:AddToggle("NoSlow", {
													Text = "No Slow (Premium)",
													Description = "Keep moving at full speed even when you get stunned or slowed",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("NoSlow")
														end
													end,
												})

												tbl20.Server:AddButton({
													Text = "Infinite Yield (Premium)",
													Description = "Open the Infinite Yield admin commands",
													Func = function()
														fn36()
													end,
												})

												tbl17.AutoRejoin = tbl20.Server:AddToggle("AutoRejoin", {
													Text = "Auto Rejoin (Premium)",
													Description = "Automatically rejoin if you get kicked or disconnected",
													Default = false,
													Callback = function(arg)
														if n28(1016) <= 3163 then
															if arg then
																fn36("AutoRejoin")
															end

															return
														end

														while true do
														end
													end,
												})

												do
													local v99 = nil

													tbl17.KickTimer = tbl20.Server:AddToggle("KickTimer", {
														Text = "Kick Timer (Premium)",
														Description = "Leave the server after a set amount of minutes",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("KickTimer")
															end
														end,
													})

													tbl18.KickTimerMins = tbl20.Server:AddSlider("KickTimerMins", {
														Text = "Minutes",
														Default = 30,
														Min = v84[115],
														Max = 240,
														Rounding = 0,
														Callback = function()
														end,
													})

													fn33(function()
														if v99 then
															v99:Disconnect()
															v99 = nil
														end
													end)
												end
											end

											do
												local tbl28 = {}

												tbl17.JoinLeaveLog = tbl20.Server:AddToggle("JoinLeaveLog", {
													Text = "Join / Leave Logger (Premium)",
													Description = "Get notified whenever someone joins or leaves the server",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("JoinLeaveLog")
														end
													end,
												})

												fn33(function()
													for _, v99 in ipairs(tbl28) do
														pcall(function()
															v99:Disconnect()
														end)
													end

													tbl28 = {}
												end)
											end
										end

										do
											local str13 = ""
											local flag25 = false
											local v99 = nil
											local communication = service:FindFirstChild("Communication")

											if communication then
												local serverAndClient = communication:FindFirstChild("ServerAndClient")

												if serverAndClient then
													local signals = serverAndClient:FindFirstChild("Signals")

													if signals then
														local signalFunction = signals:FindFirstChild("SignalFunction")

														if signalFunction then
															signalFunction:FindFirstChild("Function")
														end
													end
												end
											end

											tbl20.Server:AddInput("PSOwnerInput", {
												Text = "Private Server Owner",
												Description = "Username of the private server owner",
												Default = "",
												Placeholder = "Enter username...",
												Callback = function(arg)
													str13 = arg
												end,
											})

											tbl20.Server:AddButton({
												Text = "Join Private Server (Premium)",
												Description = "Teleport to the specified player's private server",
												Func = function()
													fn36()
												end,
											})

											tbl17.AutoJoinPS = tbl20.Server:AddToggle("AutoJoinPS", {
												Text = "Auto Join Private Server (Premium)",
												Description = "Automatically join the specified private server on kick/disconnect",
												Default = v84[35],
												Callback = function(arg)
													if arg then
														fn36("AutoJoinPS")
													end
												end,
											})

											fn33(function()
												flag25 = v84[35]

												if v99 then
													v99:Disconnect()
													v99 = nil
												end
											end)
										end
									end

									do
										do
											local tbl28 = {}
											tbl26 = {}
											tbl27 = {}

											fn48 = function()
												for _, v99 in ipairs(tbl28) do
													pcall(function()
														v99:Disconnect()
													end)
												end

												tbl28 = {}
											end
										end
									end

									do
										local str13 = ""
										local str14 = ""
										tbl20.IdSelf:AddLabel("Current: " .. localPlayer.DisplayName .. " (@" .. localPlayer.Name .. ")")

										tbl18.SelfDisplayName = tbl20.IdSelf:AddInput("SelfDisplayName", {
											Text = "Display Name",
											Default = localPlayer.DisplayName,
											Placeholder = "New display name",
											Callback = function(arg)
												str13 = arg
											end,
										})

										tbl18.SelfUsername = tbl20.IdSelf:AddInput("SelfUsername", {
											Text = "Username",
											Default = localPlayer.Name,
											Placeholder = "New username",
											Callback = function(arg)
												str14 = arg
											end,
										})
									end
								end

								do
									do
										local v99, v100

										do
											do
												do
													tbl20.IdSelf:AddButton({
														Text = "Apply (Premium)",
														Func = function()
															fn36()
														end,
													})

													tbl20.IdSelf:AddButton({
														Text = "Reset (Premium)",
														Func = function()
															fn36()
														end,
													})

													do
														local str13 = ""
														local str14 = ""
														local str15 = ""

														local function fn49()
															local tbl28 = { "--" }

															for _, player in ipairs(service2:GetPlayers()) do
																if player ~= localPlayer then
																	table.insert(tbl28, player.Name)
																end
															end

															return tbl28
														end

														tbl18.IdTargetPlayer = tbl20.IdOthers:AddDropdown("IdTargetPlayer", {
															Text = "Player",
															Description = "Pick a player to rename on the leaderboard",
															Values = fn49(),
															Default = nil,
															Multi = false,
															Callback = function(arg)
																str13 = arg
															end,
														})

														tbl20.IdOthers:AddButton({
															Text = "Refresh Players (Premium)",
															Func = function()
																fn36()
															end,
														})

														tbl18.TargetDisplayName = tbl20.IdOthers:AddInput("TargetDisplayName", {
															Text = "Display Name",
															Default = "",
															Placeholder = "New display name",
															Callback = function(arg)
																str14 = arg
															end,
														})

														tbl18.TargetUsername = tbl20.IdOthers:AddInput("TargetUsername", {
															Text = "Username",
															Default = "",
															Placeholder = "New username",
															Callback = function(arg)
																str15 = arg
															end,
														})
													end
												end

												tbl20.IdOthers:AddButton({
													Text = "Apply (Premium)",
													Func = function()
														fn36()
													end,
												})

												do
													local tbl28 = {}
													local flag25 = false
													local tbl29 = {}

													local function fn49(arg)
														if tbl29[arg] then
															if n28(4052) > 4270 then
																for _, v101 in ipairs(tbl29[arg]) do
																	pcall(function()
																		if arg.Character then
																			v101.Parent = arg.Character
																		end
																	end)
																end

																tbl29[arg] = nil
															else
																while v84[126] do
																end
															end
														end

														if arg.Character then
															local humanoid = arg.Character:FindFirstChildOfClass("Humanoid")

															if humanoid then
																pcall(function()
																	humanoid.DisplayName = arg.DisplayName
																end)
															end
														end
													end

													tbl17.HideAllNames = tbl20.IdVis:AddToggle("HideAllNames", {
														Text = "Hide All Names (Premium)",
														Description = "Replace everyone's name, outfit and profile with Zero Hub ad",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("HideAllNames")
															end
														end,
													})

													fn33(function()
														for _, v101 in ipairs(tbl28) do
															pcall(function()
																v101:Disconnect()
															end)
														end

														tbl28 = {}
														flag25 = v84[35]

														for _, player in ipairs(service2:GetPlayers()) do
															fn49(player)
														end

														tbl29 = {}
													end)
												end
											end

											do
												local v101

												do
													fn33(function()
														fn48()
														tbl26 = {}
														tbl27 = {}
													end)

													do
														local v102 = tbl19.KillAura:AddGroupbox("Kill Aura")
														v101 = tbl19.KillAura:AddGroupbox("Insta Kill")
														v99 = tbl19.KillAura:AddGroupbox("Auto Skills")
														v100 = v84[35]
														local n42 = 150
														local str13 = "Combat"

														tbl17.KillAuraEnabled = v102:AddToggle("KillAuraEnabled", {
															Text = "Kill Aura (Premium)",
															Description = "Automatically attack everything around you nonstop",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("KillAuraEnabled")
																end
															end,
														})

														v102:AddSlider("KASpeed", {
															Text = "Kill Aura Speed (ms)",
															Description = "How fast you swing",
															Default = 150,
															Min = 50,
															Max = 1000,
															Rounding = 0,
															Callback = function(arg)
																n42 = arg
															end,
														})

														v102:AddDropdown("KAWeapon", {
															Text = "Kill Aura Weapon",
															Description = "Weapon to swing",
															Values = tbl23,
															Default = "Combat",
															Multi = false,
															Callback = function(arg)
																str13 = arg
															end,
														})
													end
												end

												do
													local n42 = 100
													local n43 = 95

													tbl17.InstaKillEnabled = v101:AddToggle("InstaKillEnabled", {
														Text = "Insta Kill (Premium)",
														Description = "Kills mobs below the HP threshold, no kill credit but still farms dungeon points",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("InstaKillEnabled")
															end
														end,
													})

													v101:AddSlider("IKRange", {
														Text = "Insta Kill Range",
														Description = "How far away you can insta kill (studs)",
														Default = 100,
														Min = 10,
														Max = 500,
														Rounding = 0,
														Callback = function(arg)
															n42 = arg
														end,
													})

													v101:AddSlider("IKThreshold", {
														Text = "HP Threshold %",
														Description = "Only kills below this HP",
														Default = 95,
														Min = 1,
														Max = v84[153],
														Rounding = 0,
														Callback = function(arg)
															n43 = arg
														end,
													})
												end

												v101:AddToggle("CombatInsectSkill", {
													Text = "Killaura V2 (Premium)",
													Description = "Insect Breathing needed",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("CombatInsectSkill")
														end
													end,
												})
											end
										end

										do
											do
												local v101 = tbl19.KillAura:AddGroupbox("Freeze Mobs")
												local n42 = 200
												local n43 = 95

												tbl17.FreezeMobs = v101:AddToggle("FreezeMobs", {
													Text = "Freeze Mobs (Premium)",
													Description = "Anchors nearby mobs below the HP threshold so they can't move",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("FreezeMobs")
														end
													end,
												})

												v101:AddSlider("FreezeRange", {
													Text = "Freeze Range",
													Description = "How far to search for mobs (studs)",
													Default = 200,
													Min = v84[31],
													Max = 1000,
													Rounding = 0,
													Callback = function(arg)
														n42 = arg
													end,
												})

												v101:AddSlider("FreezeThreshold", {
													Text = "HP Threshold %",
													Description = "Only freezes mobs below this HP",
													Default = 95,
													Min = 1,
													Max = 100,
													Rounding = v84[67],
													Callback = function(arg)
														n43 = arg
													end,
												})
											end

											do
												local tbl28

												do
													local tbl29 = {}
													local n42 = 2.5
													tbl28 = {}

													v99:AddToggle("UseMoves", {
														Text = "Use Skills (Premium)",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("UseMoves")
															end
														end,
													})

													v99:AddDropdown("MoveKeys", {
														Text = "Skill keys to press",
														Values = {
															"Z",
															"X",
															"C",
															"V",
															"B",
															"R",
															"Q",
															"E",
															"G",
															"T",
														},
														Multi = true,
														Default = {},
														Callback = function(arg)
															tbl29 = arg
														end,
													})

													v99:AddSlider("MoveRate", {
														Text = "Seconds between skills",
														Default = 2.5,
														Min = 0.2,
														Max = 15,
														Rounding = v84[115],
														Suffix = "s",
														Callback = function(arg)
															n42 = arg
														end,
													})
												end

												local v101 = v84[28]

												v99:AddDropdown("HoldKeys", {
													Text = "Skills to hold down",
													Values = {
														"Z",
														"X",
														"C",
														"V",
														"B",
														"R",
														"Q",
														"E",
														"G",
														"T",
													},
													Multi = true,
													Default = {},
													Callback = function(arg)
														tbl28 = arg
													end,
												})

												v99:AddSlider("HoldDuration", {
													Text = "Hold duration",
													Default = 3,
													Min = 0.5,
													Max = 30,
													Rounding = 1,
													Suffix = "s",
													Callback = function(arg)
														v101 = arg
													end,
												})
											end
										end

										do
											local v101, flag25, v102

											do
												v99:AddToggle("HoldSkills", {
													Text = "Hold Skills (Premium)",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("HoldSkills")
														end
													end,
												})

												game:GetService("VirtualInputManager")

												game:GetService(v84[8]).Heartbeat:Connect(function()
												end)

												v101 = tbl19.Survival:AddGroupbox("Semi Godmode")
												flag25 = false
												v102 = nil

												tbl17.AutoParry = v101:AddToggle("AutoParry", {
													Text = "Semi Godmode (Premium)",
													Description = "Gives semi godmode",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("AutoParry")
														end
													end,
												})

												tbl17.AutoParry:AddKeybind({ Default = Enum.KeyCode.F9, Mode = "Toggle" })
												local function_ = game:GetService(v84[183]).Communication.ServerAndClient.Signals.SignalFunction.Function
											end

											tbl17.NoSunDmg = v101:AddToggle("NoSunDmg", {
												Text = "No Sun Damage (Premium)",
												Description = "Removes sun damage for demons",
												Default = false,
												Callback = function(arg)
													if not (n25 > 4395) then
														if arg then
															fn36("NoSunDmg")
														end

														return
													end

													while true do
													end
												end,
											})

											do
												local flag26 = false
												local v103 = v84[35]

												tbl17.AntiBlockStun = v101:AddToggle("AntiBlockStun", {
													Text = "Anti Block Stun (Premium)",
													Description = "Block while you are being comboed or attacked",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("AntiBlockStun")
														end
													end,
												})

												fn33(function()
													v100 = v84[35]
													_autoSkillsActive = v84[35]
													flag25 = false
													flag26 = false
													v103 = v84[35]

													if v102 then
														pcall(task.cancel, v102)
														v102 = nil
													end
												end)
											end
										end
									end

									do
										local tbl28 = {}

										tbl17.ShowOwnership = tbl19.NetOwn:AddGroupbox("Network Ownership"):AddToggle("ShowOwnership", {
											Text = "Show Ownership (Premium)",
											Description = "Green = you own it, Red = server owned",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("ShowOwnership")
												end
											end,
										})

										fn33(function()
											for _, v99 in pairs(tbl28) do
												pcall(function()
													v99:Destroy()
												end)
											end
										end)
									end
								end
							end

							do
								do
									local zhEspLib, tbl25, tbl26, flag22

									do
										zhEspLib = getgenv()._ZH_EspLib
										tbl25 = {}

										do
											local tbl27 = {}
											local flag23 = false
											tbl26 = {}
											flag22 = false
											local color = Color3.fromRGB(255, 100, 100)
											local tbl28 = {}

											local function fn48(arg)
												local v99 = tbl27[arg]
												if not v99 then
													return
												end

												pcall(function()
													zhEspLib:RemoveTarget(v99)
												end)

												pcall(function()
													v99._bindable:Destroy()
												end)

												if tbl25[arg] then
													pcall(function()
														tbl25[arg]:Destroy()
													end)

													tbl25[arg] = nil
												end

												tbl27[arg] = nil
											end

											local function fn49()
												if not (n24 >= 8243) then
													flag23 = v84[35]

													for _, v99 in ipairs(tbl28) do
														pcall(function()
															v99:Disconnect()
														end)
													end

													tbl28 = {}
													local tbl29 = {}

													for k in pairs(tbl27) do
														table.insert(tbl29, k)
													end

													for _, v99 in ipairs(tbl29) do
														fn48(v99)
													end

													return
												end

												while true do
												end
											end

											tbl17.MobESPEnabled = tbl20.MobESP:AddToggle("MobESPEnabled", {
												Text = "Mob ESP (Premium)",
												Description = "See mobs through walls",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("MobESPEnabled")
													end

													if not (n24 >= 8234) then
														return
													end

													while true do
													end
												end,
											})

											tbl20.MobESP:AddColorPicker("MobESPColor", {
												Text = "Mob ESP Color",
												Default = Color3.fromRGB(255, v84[153], 100),
												Callback = function(customGradTop)
													color = customGradTop

													for _, v99 in pairs(tbl27) do
														local v100 = zhEspLib.Cache[v99]

														if v100 then
															v100.CustomGradTop = customGradTop
															v100.CustomGradBot = customGradTop
															v100.LastGradTop = nil
															v100.LastGradBot = nil
														end
													end
												end,
											})

											fn33(function()
												fn49()
											end)
										end
									end

									do
										local color = Color3.fromRGB(100, 220, 255)
										local tbl27 = {}

										local function fn48(arg)
											local v99 = tbl26[arg]
											if not v99 then
												return
											end

											pcall(function()
												zhEspLib:RemoveTarget(v99)
											end)

											pcall(function()
												v99._bindable:Destroy()
											end)

											if tbl25[arg] then
												pcall(function()
													tbl25[arg]:Destroy()
												end)

												tbl25[arg] = nil
											end

											tbl26[arg] = nil
										end

										local function fn49()
											flag22 = false

											for _, v99 in ipairs(tbl27) do
												pcall(function()
													v99:Disconnect()
												end)
											end

											tbl27 = {}
											local tbl28 = {}

											for k in pairs(tbl26) do
												table.insert(tbl28, k)
											end

											for _, v99 in ipairs(tbl28) do
												fn48(v99)
											end
										end

										tbl17.NPCESPEnabled = tbl20.NPCESP:AddToggle("NPCESPEnabled", {
											Text = "NPC ESP (Premium)",
											Description = "See NPCs through walls",
											Default = v84[35],
											Callback = function(arg)
												if arg then
													fn36("NPCESPEnabled")
												end
											end,
										})

										tbl20.NPCESP:AddColorPicker("NPCESPColor", {
											Text = "NPC ESP Color",
											Default = Color3.fromRGB(v84[153], 220, 255),
											Callback = function(customGradTop)
												color = customGradTop

												for _, v99 in pairs(tbl26) do
													local v100 = zhEspLib.Cache[v99]

													if v100 then
														v100.CustomGradTop = customGradTop
														v100.CustomGradBot = customGradTop
														v100.LastGradTop = nil
														v100.LastGradBot = nil
													end
												end
											end,
										})

										fn33(function()
											fn49()
										end)
									end
								end

								local v99 = tbl19.ESP:AddGroupbox("Spider Lily ESP")
								local tbl25 = {}
								local flag22 = false
								local color = Color3.fromRGB(v84[12], 50, 200)

								local function fn48()
									for _, v100 in ipairs(tbl25) do
										pcall(function()
											v100:Destroy()
										end)
									end

									tbl25 = {}
									if not flag22 then
										return
									end
									local debree = workspace:FindFirstChild("Debree")
									if not debree then
										return
									end

									for _, child in ipairs(debree:GetChildren()) do
										if child.Name == "Spider Lily" and child:IsA("Model") then
											pcall(function()
												local boundingBox = child:GetBoundingBox()
												if not boundingBox then
													return
												end
												local part = Instance.new("Part")
												part.Anchored = v84[126]
												part.CanCollide = false
												part.Transparency = v84[115]
												part.Size = Vector3.new(v84[115], 1, v84[115])
												part.Position = boundingBox.Position
												part.Parent = workspace
												local billboardGui = Instance.new("BillboardGui")
												billboardGui.Adornee = part
												billboardGui.Size = UDim2.new(0, 100, 0, 40)
												billboardGui.AlwaysOnTop = v84[126]
												billboardGui.MaxDistance = 5000
												billboardGui.Parent = part
												local instance = Instance.new(v84[64])
												instance.Size = UDim2.new(1, 0, 1, v84[67])
												instance.BackgroundTransparency = v84[115]
												instance.Text = "Spider Lily\n" .. math.round((boundingBox.Position - (fn30() and fn30().Position or boundingBox.Position)).Magnitude) .. "m"
												instance.TextColor3 = color
												instance.TextStrokeTransparency = 0.3
												instance.Font = Enum.Font.GothamBold
												instance.TextSize = 14
												instance.Parent = billboardGui
												table.insert(tbl25, part)
											end)
										end
									end
								end

								tbl17.LilyESP = v99:AddToggle("LilyESP", {
									Text = "Spider Lily ESP (Premium)",
									Description = "Show spider lily locations through walls",
									Default = false,
									Callback = function(arg)
										if arg then
											fn36("LilyESP")
										end
									end,
								})

								v99:AddColorPicker("LilyESPColor", {
									Text = "Color",
									Default = Color3.fromRGB(v84[12], 50, 200),
									Callback = function(arg)
										color = arg
										fn48()
									end,
								})

								fn33(function()
									flag22 = v84[35]

									for _, v100 in ipairs(tbl25) do
										pcall(function()
											v100:Destroy()
										end)
									end

									tbl25 = {}
								end)
							end

							do
								do
									local v99 = tbl19.ESP:AddGroupbox("Item ESP")
									local tbl25 = {}
									local flag22 = v84[35]
									local color = Color3.fromRGB(255, 220, 50)

									local function fn48()
										for _, v100 in ipairs(tbl25) do
											pcall(function()
												v100:Destroy()
											end)
										end

										tbl25 = {}
										if not flag22 then
											return
										end
										local lootDrops = workspace:FindFirstChild("LootDrops")
										if not lootDrops then
											return
										end
										local v100 = fn30()

										for _, child in ipairs(lootDrops:GetChildren()) do
											pcall(function()
												local objectText = nil
												local v101 = nil

												for _, descendant in ipairs(child:GetDescendants()) do
													if descendant:IsA("ProximityPrompt") and descendant.Enabled then
														objectText = descendant
													end

													if descendant:IsA("BasePart") and not v101 then
														v101 = descendant
													end
												end

												if not v101 then
													return
												end
												objectText = objectText and objectText.ObjectText or child.Name
												local v102 = v100 and math.round((v101.Position - v100.Position).Magnitude) or v84[67]
												local billboardGui = Instance.new("BillboardGui")
												billboardGui.Adornee = v101
												billboardGui.Size = UDim2.new(0, 120, 0, 35)
												billboardGui.AlwaysOnTop = v84[126]
												billboardGui.MaxDistance = 5000
												billboardGui.StudsOffset = Vector3.new(0, 3, 0)
												billboardGui.Parent = v101
												local textLabel = Instance.new("TextLabel")
												textLabel.Size = UDim2.new(1, 0, 1, v84[67])
												textLabel.BackgroundTransparency = 1
												textLabel.Text = objectText .. "\n" .. v102 .. "m"
												textLabel.TextColor3 = color
												textLabel.TextStrokeTransparency = v84[13]
												textLabel.Font = Enum.Font.GothamBold
												textLabel.TextSize = 13
												textLabel.Parent = billboardGui
												table.insert(tbl25, billboardGui)
											end)
										end
									end

									tbl17.ItemESP = v99:AddToggle("ItemESP", {
										Text = "Item ESP (Premium)",
										Description = "Show loot drops through walls",
										Default = false,
										Callback = function(arg)
											if arg then
												fn36("ItemESP")
											end
										end,
									})

									v99:AddColorPicker("ItemESPColor", {
										Text = "Color",
										Default = Color3.fromRGB(255, v84[48], 50),
										Callback = function(arg)
											color = arg
											fn48()
										end,
									})

									fn33(function()
										flag22 = false

										for _, v100 in ipairs(tbl25) do
											pcall(function()
												v100:Destroy()
											end)
										end

										tbl25 = {}
									end)
								end

								do
									v96 = nil
									v97 = v84[35]
									str8 = "Below"
									n32 = 0
									n33 = 2
									n34 = 0
									n35 = 6.5

									do
										local tbl25 = {}
										str9 = "Combat"
										n36 = 0

										local function fn48(arg)
											local tbl26 = {}

											for k, v99 in pairs(arg) do
												if type(k) == "string" and v99 == v84[126] then
													tbl26[k] = true
												elseif type(v99) == "string" then
													tbl26[v99] = true
												end
											end

											return tbl26
										end

										local tbl26 = {}

										pcall(function()
											for _, descendant in ipairs(game:GetService(v84[183]).Ouwland.Content:GetDescendants()) do
												if descendant:IsA("ModuleScript") and descendant:FindFirstAncestor("ActiveNpcs") then
													local ok, result = pcall(require, descendant)
													local locations = ok and type(result) == "table" and result.SendOver and result.SendOver.Spawning and result.SendOver.Spawning.Locations
													ok = ok and type(result) == "table" and type(result.Name) == "string" and result.Name or descendant.Name

													if type(locations) == "table" and #locations > v84[67] and not tbl26[ok] then
														local tbl27 = {}

														for _, location in ipairs(locations) do
															table.insert(tbl27, typeof(location) == "CFrame" and location.Position or location)
														end

														tbl26[ok] = tbl27
													end
												end
											end
										end)

										local function fn49()
											local tbl27 = {}

											for k in pairs(tbl26) do
												table.insert(tbl27, k)
											end

											table.sort(tbl27)
											table.insert(tbl27, 1, "Nearest Mob")
											return tbl27
										end

										tbl18.MobSelect = tbl20.MobFarm:AddDropdown("MobSelect", {
											Text = "Target Mob",
											Description = "Pick mob types to farm",
											Values = fn49(),
											Default = { "Nearest Mob" },
											Multi = true,
											Callback = function(arg)
												tbl25 = fn48(arg)
											end,
										})
									end
								end

								tbl17.FarmMobs = tbl20.MobFarm:AddToggle("FarmMobs", {
									Text = "Farm Mobs (Premium)",
									Description = "Goes to where your mobs spawn and farms them",
									Default = false,
									Callback = function(arg)
										if arg then
											fn36("FarmMobs")
										end
									end,
								})

								tbl17.MobFarmKA = tbl20.MobFarm:AddToggle("MobFarmKA", {
									Text = "Kill Aura (Premium)",
									Description = "Auto swing while farming mobs",
									Default = false,
									Callback = function(arg)
										if arg then
											fn36("MobFarmKA")
										end
									end,
								})

								do
									local tbl25 = {}
									local flag22 = false
									str10 = "Below"
									n37 = 0
									n38 = 2
									n39 = 0
									n40 = 6.5
									str11 = "Combat"
									value = v84[67]

									task.spawn(function()
										if flag22 then
											return
										end
										flag22 = true

										tbl25 = {
											["Ill take 3 bandits"] = { npc = "Krue", mob = "Bandit", ui = "Defeat 3 bandits", lvl = v84[67] },
											["Ill help clear them out"] = { npc = "Kazu", mob = "*Civilian*", ui = "Clear Village Spies", lvl = v84[67] },
											["Ill recover the pages"] = { npc = "Kona", mob = nil, ui = "Recover Lost Pages", lvl = v84[67] },
											["Ill deliver the letter"] = { npc = "Noote", mob = nil, ui = "Deliver Coded Letter", lvl = 0 },
											["Report to Noote"] = { npc = "Kazu", mob = nil, ui = "Report to Noote", lvl = 0 },
											["Ill deliver the package"] = { npc = "MoldySugar", mob = nil, ui = "Deliver Package", lvl = 0 },
											["The Plate Trial"] = { npc = "Lamplighter Isamu", mob = nil, ui = "The Plate Trial", lvl = 0 },
											["Ill take the bandit boss(Lv 7)"] = { npc = "Krue", mob = "Zuko", ui = "Defeat the bandit boss", lvl = 7 },
											["Ill look for it(Lv 10)"] = { npc = "Betty", mob = nil, ui = "Find Betty's Gemstone", lvl = 10 },
											["Ill drive the bears back(Lv 10)"] = { npc = "Tom", mob = "Bear Cub", ui = "Hunt the Bears", lvl = 10 },
											["Ill restock the pantry(Lv 10)"] = { npc = "Lucy", mob = "Bear Cub", ui = "Acquire Bear Meat", lvl = 10 },
											["Ill look for the penny(Lv 14)"] = { npc = "Liv", mob = nil, ui = "Find the Lucky Penny", lvl = 14 },
											["Ill fell the Mother Bear(Lv 18)"] = { npc = "Tom", mob = "Mother Bear", ui = "Fell the Mother Bear", lvl = 18 },
											["Ill find the coins(Lv 21)"] = { npc = "Liv", mob = nil, ui = "Five Hundred Pennies", lvl = 21 },
											["Ill clear out his subordinates(Lv 26)"] = { npc = "Chaka", mob = "Kaiden Subordinate", ui = "Clear Kaiden's Subordinates", lvl = 26 },
											["Ill deal with Kaiden(Lv 34)"] = { npc = "Chaka", mob = "Kaiden", ui = "Defeat Kaiden", lvl = 34 },
											["I will clear out his guards(Lv 40)"] = { npc = "Wagwan", mob = "Hoyuzo Subordinate", ui = "Clear Hoyuzo's Guard", lvl = 40 },
											["BossHunt Flame Trainee"] = { npc = "BossHunt", mob = "Flame Trainee", ui = "Eliminate Flame Trainee", lvl = 45 },
											["BossHunt Insect Trainee"] = { npc = "BossHunt", mob = "Insect Trainee", ui = "Eliminate Insect Trainee", lvl = 45 },
											["BossHunt Serpent Trainee"] = { npc = "BossHunt", mob = "Serpent Trainee", ui = "Eliminate Serpent Trainee", lvl = 45 },
											["BossHunt Sound Trainee"] = { npc = "BossHunt", mob = "Sound Trainee", ui = "Eliminate Sound Trainee", lvl = 45 },
											["BossHunt Stone Trainee"] = { npc = "BossHunt", mob = "Stone Trainee", ui = "Eliminate Stone Trainee", lvl = 45 },
											["BossHunt Thunder Trainee"] = { npc = "BossHunt", mob = "Thunder Trainee", ui = "Eliminate Thunder Trainee", lvl = 45 },
											["BossHunt Water Trainee Sabito"] = {
												npc = "BossHunt",
												mob = "Water Trainee Sabito",
												ui = "Eliminate Water Trainee Sabito",
												lvl = 45,
											},
											["BossHunt Wind Trainee"] = { npc = "BossHunt", mob = "Wind Trainee", ui = "Eliminate Wind Trainee", lvl = 45 },
											["Ill drive them off(Lv 47)"] = { npc = "Rin", mob = "Beast Born Demon", ui = "Hold the Night", lvl = 47 },
											["I will take care of Hoyuzo(Lv 50)"] = { npc = "Wagwan", mob = "Hoyuzo", ui = "Eliminate Hoyuzo", lvl = 50 },
											["BossHunt Hoyuzo"] = { npc = "BossHunt", mob = "Hoyuzo", ui = "Defeat Hoyuzo", lvl = 50 },
											["The Good Catch(Lv 60)"] = { npc = "Angler Runo", mob = nil, ui = "The Good Catch", lvl = 60 },
											["The Soryu Trial(Lv 62)"] = { npc = "Soryu", mob = nil, ui = "The Soryu Trial", lvl = 62 },
											["BossHunt Soryu Trainee Goki"] = { npc = "BossHunt", mob = "Soryu Trainee Goki", ui = "Eliminate Soryu Trainee", lvl = 62 },
											["The Tai Chi Trial(Lv 65)"] = { npc = "TaiChi", mob = nil, ui = "Tai Chi Trial", lvl = 65 },
											["BossHunt Tai Chi Trainee Suzume"] = { npc = "BossHunt", mob = "Tai Chi Trainee Suzume", ui = "Eliminate Tai Chi Trainee", lvl = 65 },
											["Blacksmith Togane(Lv 65)"] = { npc = "Togane", mob = nil, ui = "Blacksmith Togane", lvl = 65 },
											["Deliver Nikos Supply Box(Lv 70)"] = { npc = "Niko", mob = nil, ui = "Deliver Niko's Supply Box", lvl = 70 },
											["Restock Infirmary(Lv 70)"] = { npc = "Shiori", mob = nil, ui = "Restock Infirmary", lvl = 70 },
											["Locate Rens Lost Nichirin(Lv 75)"] = { npc = "Ren", mob = nil, ui = "Locate Ren's Lost Nichirin", lvl = 75 },
											["The Full Pantry(Lv 75)"] = { npc = "Shiori", mob = nil, ui = "The Full Pantry", lvl = 75 },
											["Theyre not welcome here(Lv 90)"] = { npc = "Demon Delroy", mob = "High Demon", ui = "Thin Kanoe Ranks", lvl = 90 },
											["Ill help you defeat them(Lv 90)"] = {
												npc = "Wounded Slayer Tomoi",
												mob = "Fire Profound Demon",
												ui = "Drive Off High Demons",
												lvl = 90,
											},
											["Ill drive back the frost(Lv 105)"] = {
												npc = "Demon Slayer Mitsu",
												mob = "Ice Profound Demon",
												ui = "Drive Back the Frost",
												lvl = 105,
											},
											["Ill put out the blaze(Lv 115)"] = { npc = "Demon Slayer Mitsu", mob = "Fire Profound Demon", ui = "Put Out the Blaze", lvl = 115 },
											["BossHunt Giyen"] = { npc = "BossHunt", mob = "Giyen", ui = "Eliminate Giyen", lvl = 125 },
											["BossHunt Enru"] = { npc = "BossHunt", mob = "Enru", ui = "Eliminate Enru", lvl = 125 },
											["BossHunt Gyutai"] = { npc = "BossHunt", mob = "Gyutai", ui = "Eliminate Gyutai", lvl = 125 },
											["BossHunt Domae"] = { npc = "BossHunt", mob = "Domae", ui = "Eliminate Domae", lvl = 125 },
											["BossHunt Sumari"] = { npc = "BossHunt", mob = "Sumari", ui = "Eliminate Sumari", lvl = 125 },
											["BossHunt Saneri"] = { npc = "BossHunt", mob = "Saneri", ui = "Eliminate Saneri", lvl = 125 },
											["BossHunt Tengai"] = { npc = "BossHunt", mob = "Tengai", ui = "Eliminate Tengai", lvl = 125 },
											["BossHunt Zentaro"] = { npc = "BossHunt", mob = "Zentaro", ui = "Eliminate Zentaro", lvl = 125 },
											["BossHunt Shinora"] = { npc = "BossHunt", mob = "Shinora", ui = "Eliminate Shinora", lvl = 125 },
											["BossHunt Yahari"] = { npc = "BossHunt", mob = "Yahari", ui = "Eliminate Yahari", lvl = 125 },
											["BossHunt Gyorei"] = { npc = "BossHunt", mob = "Gyorei", ui = "Eliminate Gyorei", lvl = 125 },
										}

										pcall(function()
											local holder = require(game:GetService("ReplicatedStorage").CAM.Global.Subsets.Gameplay.Quests).Holder
											if type(holder) ~= "table" then
												return
											end

											for k, v99 in pairs(holder) do
												if type(v99) == "table" then
													local offerNpc = v99.OfferNpc or ""

													if offerNpc == "false" then
														offerNpc = ""
													end

													local lvl = tonumber(k:match("%(Lv (%d+)%)")) or 0
													local category = v99.Category or ""

													if not tbl25[k] then
														local v100 = tbl25
														local tbl26 = {}
														offerNpc = offerNpc ~= "" and offerNpc
														tbl26.npc = offerNpc or nil
														tbl26.mob = nil
														tbl26.lvl = lvl
														tbl26.ui = (v99.QuestInstance or k):gsub("^Ill ", ""):gsub("^I will ", "")
														tbl26.category = category
														v100[k] = tbl26
													elseif offerNpc ~= "" and (not tbl25[k].npc or tbl25[k].npc == "") then
														tbl25[k].npc = offerNpc
													end
												end
											end
										end)
									end)
								end
							end

							do
								local fn48

								do
									fn48 = function()
										local n42 = v84[67]

										pcall(function()
											local data = game.ReplicatedStorage.Player_Service.Data
											local v99 = data:FindFirstChild(localPlayer.Name)
											local v100

											if not v99 then
												for _, child in ipairs(data:GetChildren()) do
													if child:FindFirstChild("slotEquipped") then
														v99 = child
														break
													end
												end

												v100 = v99
											else
												v100 = v99
											end

											if not v100 then
												return
											end
											local slotEquipped = v100:FindFirstChild("slotEquipped")
											if not slotEquipped then
												return
											end
											local slots = v100:FindFirstChild("slots") and v100.slots:FindFirstChild("Slot" .. slotEquipped.Value)
											if not slots then
												return
											end
											local exp = slots:FindFirstChild("Exp")
											if not exp then
												return
											end
											local goal = exp:FindFirstChild("Goal")

											if goal then
												n42 = math.floor(goal.Value / v84[95])
											end
										end)

										return n42
									end

									fn44 = function(arg)
										local position = arg.Position
										local vector

										if str10 == "Above" then
											vector = Vector3.new(position.X, position.Y + n40, position.Z)
										elseif str10 == "Below" then
											vector = Vector3.new(position.X, position.Y - n40, position.Z)
										elseif str10 == "In Front" then
											vector = position + arg.CFrame.LookVector * n40
										elseif str10 == "Behind" then
											vector = position - arg.CFrame.LookVector * n40
										else
											vector = Vector3.new(position.X, position.Y - n40, position.Z)
										end

										local n42 = arg.CFrame.LookVector * n39
										return vector + arg.CFrame.RightVector * n37 + Vector3.new(0, n38, 0) + n42
									end

									fn45 = function(arg)
										local tbl25 = { completed = false, tasks = {} }

										pcall(function()
											local data = game.ReplicatedStorage.Player_Service.Data
											local v99 = data:FindFirstChild(localPlayer.Name)

											if not v99 then
												for _, child in ipairs(data:GetChildren()) do
													if child:FindFirstChild("slotEquipped") then
														v99 = child
														break
													end
												end
											end

											if not v99 then
												return
											end
											local slotEquipped = v99:FindFirstChild("slotEquipped")
											if not slotEquipped then
												return
											end
											local slots = v99:FindFirstChild("slots") and v99.slots:FindFirstChild("Slot" .. slotEquipped.Value)
											if not slots then
												return
											end
											local quests = slots:FindFirstChild("Quests")
											if not quests then
												return
											end
											local holder = quests:FindFirstChild("Holder")
											if not holder then
												return
											end
											local v100 = nil

											for _, child in ipairs(holder:GetChildren()) do
												local value2 = nil

												pcall(function()
													value2 = child:FindFirstChild("QuestString") and child.QuestString.Value
												end)

												if not value2 then
													pcall(function()
														value2 = child:GetAttribute("QuestString")
													end)
												end

												if value2 == arg or child.Name == arg then
													v100 = child
													break
												else
													v100 = nil
												end
											end

											if not v100 then
												return
											end
											local tasks = v100:FindFirstChild("Tasks")

											if tasks then
												local flag22 = true

												for _, child in ipairs(tasks:GetChildren()) do
													local n42 = child:FindFirstChild("Value") and child.Value.Value or 0
													local n43 = child:FindFirstChild("Max") and child.Max.Value or 1
													table.insert(tbl25.tasks, { code = child:FindFirstChild("Code") and child.Code.Value or "", value = n42, max = n43 })

													if n42 < n43 then
														flag22 = v84[35]
													end
												end

												tbl25.completed = flag22 and #tbl25.tasks > 0
											end
										end)

										return tbl25
									end

									fn46 = function(arg)
										local flag22 = v84[35]

										pcall(function()
											local data = game.ReplicatedStorage.Player_Service.Data
											local v99 = data:FindFirstChild(localPlayer.Name)

											if not v99 then
												for _, child in ipairs(data:GetChildren()) do
													if child:FindFirstChild("slotEquipped") then
														v99 = child
														break
													end
												end
											end

											if not v99 then
												return
											end
											local slotEquipped = v99:FindFirstChild("slotEquipped")
											if not slotEquipped then
												return
											end
											local slots = v99:FindFirstChild("slots") and v99.slots:FindFirstChild("Slot" .. slotEquipped.Value)
											if not slots then
												return
											end
											local quests = slots:FindFirstChild("Quests")
											if not quests then
												return
											end
											local holder = quests:FindFirstChild("Holder")
											if not holder then
												return
											end

											for _, child in ipairs(holder:GetChildren()) do
												local value2 = nil

												pcall(function()
													value2 = child:FindFirstChild("QuestString") and child.QuestString.Value
												end)

												if not value2 then
													pcall(function()
														value2 = child:GetAttribute("QuestString")
													end)
												end

												if value2 == arg or child.Name == arg then
													flag22 = true
													break
												else
												end
											end
										end)

										return flag22
									end

									v98 = tbl19.AutoQuest:AddGroupbox("Level Farm")
									Config = tbl19.AutoQuest:AddGroupbox("Config")
									Minigames = tbl19.Training:AddGroupbox("Minigames")
									flag21 = false

									do
										local cframe = CFrame.new(-425.49, 1243.5, -952.49, -1, 0, 0, 0, 1, 0, 0, 0, -1)
										local cframe2 = CFrame.new(507.2, 1123.92, -970.3, 0.9561, -0.0109, 0.2928, 3e-05, 0.9993, 0.0371, -0.293, -0.0355, 0.9555)
										local cframe3 = CFrame.new(-626, 1245, -1138, -v84[115], 0, v84[67], 0, 1, 0, 0, v84[67], -1)
										local cframe4 = CFrame.new(-515.55, 1245.4, -1251.24, -0.4632, 0, 0.8862, 0, 1, 0, -0.8862, v84[67], -0.4632)
										local cframe5 = CFrame.new(471, 1148.5, -1260, 0.5917, v84[67], 0.8061, 0, v84[115], 0, -0.8061, 0, 0.5917)
										local cframe6 = CFrame.new(723.76, 1021.7, -801.98, -0.0095, 0, -1, 0, 1, 0, v84[115], v84[67], -0.0095)
										n41 = 0

										tbl24 = {
											bandits = {
												key = "Ill take 3 bandits",
												npc = "Krue",
												npcCF = cframe,
												mob = "Bandit",
												lvl = 0,
											},
											zuko = {
												key = "Ill take the bandit boss(Lv 7)",
												npc = "Krue",
												npcCF = cframe,
												mob = "Zuko",
												lvl = 7,
											},
											bearCubs = {
												key = "Ill drive the bears back(Lv 10)",
												npc = "Tom",
												npcCF = cframe2,
												mob = "Bear Cub",
												lvl = 10,
											},
											motherBear = {
												key = "Ill fell the Mother Bear(Lv 18)",
												npc = "Tom",
												npcCF = cframe2,
												mob = "Mother Bear",
												lvl = 18,
											},
											civilians = {
												key = "Ill help clear them out",
												npc = "Kazu",
												npcCF = cframe3,
												mob = "*Civilian*",
												lvl = 26,
											},
											bringNotes = {
												key = "Ill bring him the notes",
												npc = "Noote",
												npcCF = cframe4,
												mob = nil,
												talkTo = "Noote",
												talkCF = cframe4,
												lvl = 26,
											},
											deliverNote = {
												key = "Ill get this letter delivered",
												npc = "Noote",
												npcCF = cframe4,
												mob = nil,
												talkTo = "Chaka",
												talkCF = cframe5,
												talkBtn = "Hand over the letter",
												lvl = 26,
											},
											kaidenSubs = {
												key = "Ill clear out his subordinates(Lv 26)",
												npc = "Chaka",
												npcCF = cframe5,
												mob = "Kaiden Subordinate",
												lvl = 27,
											},
											kaiden = {
												key = "Ill deal with Kaiden(Lv 34)",
												npc = "Chaka",
												npcCF = cframe5,
												mob = "Kaiden",
												lvl = 34,
											},
											hoyuzoSubs = {
												key = "I will clear out his guards(Lv 40)",
												npc = "Wagwan",
												npcCF = cframe6,
												mob = "Hoyuzo Subordinate",
												lvl = 40,
											},
											hoyuzo = {
												key = "I will take care of Hoyuzo(Lv 50)",
												npc = "Wagwan",
												npcCF = cframe6,
												mob = "Hoyuzo",
												lvl = v84[157],
											},
											forge = {
												key = "Ill find the forge(Lv 65)",
												npc = "Blacksmith Togane",
												npcCF = CFrame.new(1732.07, 696.53, -764.55, -0.9962, 0, 0.0872, 0, 1, v84[67], -0.0872, v84[67], -0.9962),
												mob = nil,
												dialogueSteps = { "Your other forge", "Ill find the forge(Lv 65)" },
												talkTo = "portal",
												talkCF = CFrame.new(-1605.63, 1007.69, 1142.71),
												talkPrompt = true,
												talkPromptHold = 0.5,
												lvl = 65,
											},
										}
									end
								end

								do
									local function fn49(arg)
										for _, v99 in ipairs(fn39()) do
											if (v99.Parent and v99.Parent.Name or v99.Name) == arg then
												local v100 = v99:FindFirstChildOfClass(v84[33])
												if v100 and v100.Health > 0 then
													return true
												end
											end
										end

										return false
									end

									local function fn50(arg)
										local flag22 = false

										pcall(function()
											local v99 = require(game:GetService(v84[183]).CAM.Global.Utility).GetData(localPlayer)

											if v99 then
												flag22 = v99.Inventory.Inventory:FindFirstChild(arg) ~= nil
											end
										end)

										return flag22
									end

									local function fn51(arg)
										local flag22 = false

										pcall(function()
											flag22 = require(game:GetService("ReplicatedStorage").CAM.Global.Subsets.Gameplay.Quests).GetPlayerQuestState(localPlayer, arg) == "Done"
										end)

										return flag22
									end

									fn47 = function()
										local v99 = fn48()
										local illGetThisLetterDelivered = fn51("Ill get this letter delivered")
										if v99 >= 65 and not fn51("Ill find the forge(Lv 65)") then
											return tbl24.forge
										end

										if v99 >= 50 and fn49("Hoyuzo") then
											return tbl24.hoyuzo
										end

										if v99 >= 40 then
											return tbl24.hoyuzoSubs
										end

										if illGetThisLetterDelivered and v99 >= 34 and fn49("Kaiden") then
											return tbl24.kaiden
										end

										if illGetThisLetterDelivered and v99 >= 26 then
											return tbl24.kaidenSubs
										end
										local illBringHimTheNotes = fn51("Ill bring him the notes")
										if illBringHimTheNotes and not illGetThisLetterDelivered then
											return tbl24.deliverNote
										end

										if fn50("Suspicious Note") and not illBringHimTheNotes and v99 >= 26 then
											return tbl24.bringNotes
										end

										if v99 >= 26 then
											return tbl24.civilians
										end

										if v99 >= 18 and fn49("Mother Bear") then
											return tbl24.motherBear
										end

										if v84[31] <= v99 then
											return tbl24.bearCubs
										end

										if v99 >= 7 and fn49("Zuko") then
											return tbl24.zuko
										end
										return tbl24.bandits
									end
								end
							end
						end

						do
							local n42, Config2, n43, str12, flag22, value2, n44, str13, n45

							do
								local CollectionService, v99, thread, tbl25, n46
								local fn48, tbl26

								do
									do
										do
											do
												do
													do
														local function fn49()
															for _, v100 in pairs(tbl24) do
																if fn46(v100.key) then
																	return v100
																end
															end

															return nil
														end

														local function fn50(arg)
															local v100 = fn30()

															if v100 then
																v100.CFrame = arg.npcCF * CFrame.new(0, v84[67], 5)
																v100.AssemblyLinearVelocity = Vector3.zero
															end

															task.wait(1)

															pcall(function()
																local v101 = fn40(arg.npc)
																if not v101 then
																	return
																end
																fn41(v101)
																local dialogueSteps = arg.dialogueSteps or { arg.key }

																for _, dialogueStep in ipairs(dialogueSteps) do
																	task.wait(0.5)
																	fn38()
																	task.wait(v84[13])
																	local dialogueFrame = localPlayer.PlayerGui:FindFirstChild("ComponentsHolder") and localPlayer.PlayerGui.ComponentsHolder:FindFirstChild("DialogueFrame")
																	if not dialogueFrame then
																		return
																	end
																	local buttonHolder = dialogueFrame.Actual:FindFirstChild("ButtonHolder")
																	if not buttonHolder then
																		return
																	end
																	local v102 = buttonHolder:FindFirstChild(dialogueStep)

																	if v102 then
																		local textButton = v102:FindFirstChildOfClass("TextButton") or v102:FindFirstChild("TextButton")

																		if textButton then
																			fn37(textButton)
																		end
																	end
																end

																task.wait(v84[155])
																fn42()
															end)
														end

														local function fn51(arg)
															pcall(function()
																event:FireServer("QuestProgress", arg.key, "TurnIn")
															end)

															task.wait(1)

															if fn46(arg.key) then
																local v100 = fn30()

																if v100 then
																	v100.CFrame = arg.npcCF * CFrame.new(0, v84[67], 5)
																	v100.AssemblyLinearVelocity = Vector3.zero
																end

																task.wait(1)

																pcall(function()
																	local v101 = fn40(arg.npc)

																	if v101 then
																		fn41(v101)
																		fn42()
																	end
																end)
															end
														end

														v98:AddToggle("AutoQuestKrue", {
															Text = "Level Farm",
															Description = "Farms your level until 65 for dungeons",
															Default = false,
															Callback = function(arg)
																flag21 = arg
																if not arg then
																	return
																end

																task.spawn(function()
																	if n25 > 4409 then
																		while v84[126] do
																		end
																	end

																	while flag21 and fn35("AutoQuestKrue") do
																		local v100 = fn49()

																		if not v100 then
																			local v101 = fn47()
																			fn50(v101)
																			task.wait(2)
																		elseif fn45(v100.key).completed then
																			fn51(v100)
																			task.wait(4)
																		elseif v100.talkTo and not v100.mob then
																			local v101 = fn30()

																			if v101 then
																				v101.CFrame = v100.talkCF * CFrame.new(v84[67], 0, 5)
																				v101.AssemblyLinearVelocity = Vector3.zero
																			end

																			task.wait(1)

																			if v100.talkPrompt then
																				pcall(function()
																					for _, descendant in ipairs(workspace:GetDescendants()) do
																						if descendant:IsA("ProximityPrompt") and descendant.Parent and (descendant.Parent.Position - v100.talkCF.Position).Magnitude < 15 then
																							fireproximityprompt(descendant, v100.talkPromptHold or 0)
																							break
																						end
																					end
																				end)
																			else
																				pcall(function()
																					local v102 = fn40(v100.talkTo)
																					if not v102 then
																						return
																					end
																					fn41(v102)

																					if v100.talkBtn then
																						task.wait(0.5)
																						local dialogueFrame = localPlayer.PlayerGui:FindFirstChild("ComponentsHolder") and localPlayer.PlayerGui.ComponentsHolder:FindFirstChild("DialogueFrame")

																						if dialogueFrame then
																							local buttonHolder = dialogueFrame.Actual:FindFirstChild("ButtonHolder")

																							if buttonHolder then
																								local v103 = buttonHolder:FindFirstChild(v100.talkBtn)

																								if v103 then
																									local textButton = v103:FindFirstChildOfClass("TextButton") or v103:FindFirstChild("TextButton")

																									if textButton then
																										fn37(textButton)
																									end

																									task.wait(0.5)
																								end
																							end
																						end
																					end

																					fn42()
																				end)
																			end

																			task.wait(v84[119])
																		else
																			local v101 = fn30()

																			if v101 then
																				if v84[67] < value then
																					pcall(function()
																						localPlayer:FindFirstChild("Items_Config").Equipped.Value = value
																					end)
																				end

																				local huge = math.huge
																				local v102 = nil

																				for _, v103 in ipairs(fn39()) do
																					if (v103.Parent and v103.Parent.Name or v103.Name) == v100.mob then
																						local humanoidRootPart = v103:FindFirstChild("HumanoidRootPart")
																						local humanoid = v103:FindFirstChildOfClass("Humanoid")

																						if humanoidRootPart and humanoid and humanoid.Health > v84[67] then
																							local magnitude = (humanoidRootPart.Position - v101.Position).Magnitude

																							if magnitude < huge then
																								huge = magnitude
																								v102 = humanoidRootPart
																							end
																						end
																					end
																				end

																				if v102 then
																					local position = v102.Position
																					v101.CFrame = CFrame.lookAt(fn44(v102), position)
																					v101.AssemblyLinearVelocity = Vector3.zero
																					v101.AssemblyAngularVelocity = Vector3.zero
																					n41 += 1

																					if n41 > 5 then
																						n41 = v84[115]
																					end

																					pcall(function()
																						event:FireServer("Combat_Service", str11, n41, true, v84[67], true, nil)
																					end)
																				end
																			end

																			task.wait()
																		end
																	end
																end)
															end,
														})
													end
												end

												do
													do
														fn33(function()
															flag21 = false
														end)

														do
															local flag23 = false
															CFrame.new(-1680.24, 315.8, -195.53, -1, 0, v84[67], v84[67], 1, v84[67], v84[67], 0, -1)

															Minigames:AddToggle("AutoPushups", {
																Text = "Auto Pushups (Premium)",
																Description = "Auto does the minigame",
																Default = false,
																Callback = function(arg)
																	if arg then
																		fn36("AutoPushups")
																	end
																end,
															})

															fn33(function()
																flag23 = false
															end)
														end
													end

													do
														local flag23 = false
														CFrame.new(-1635.07, 315.8, -193.83, 0, 0, -1, 0, 1, v84[67], 1, 0, 0)

														Minigames:AddToggle("AutoMeditate", {
															Text = "Auto Meditate (Premium)",
															Description = "Auto does the minigame",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("AutoMeditate")
																end
															end,
														})

														fn33(function()
															flag23 = false
														end)
													end
												end

												do
													do
														local flag23 = false
														CFrame.new(-1591.1, 316.45, -206.12, 0, v84[67], 1, 0, v84[115], 0, -1, 0, 0)

														Minigames:AddToggle("AutoCupGame", {
															Text = "Auto Cup Game (Premium)",
															Description = "Auto does the minigame",
															Default = false,
															Callback = function(arg)
																if arg then
																	fn36("AutoCupGame")
																end
															end,
														})

														fn33(function()
															flag23 = false
														end)
													end
												end

												do
													local flag23 = false
													CFrame.new(-1499.57, 314.95, -155.49, -0.9962, 0, 0.0872, 0, 1, 0, -0.0872, 0, -0.9962)

													Minigames:AddToggle("AutoAimTraining", {
														Text = "Auto Aim Training (Premium)",
														Description = "Auto does the minigame",
														Default = false,
														Callback = function(arg)
															if not flag3 then
																return
															end

															if arg then
																fn36("AutoAimTraining")
															end
														end,
													})

													fn33(function()
														flag23 = false
													end)
												end
											end

											do
												do
													do
														local flag23 = false
														CFrame.new(-311.58, 1071.61, -579.58, v84[67], 0, -1, 0, v84[115], 0, 1, 0, 0)
														CFrame.new(-638.76, 1069.68, -595.17)

														Minigames:AddToggle("AutoBoulder", {
															Text = "Auto Boulder Push (Premium)",
															Description = "Auto does the minigame",
															Default = v84[35],
															Callback = function(arg)
																if arg then
																	fn36("AutoBoulder")
																end
															end,
														})

														fn33(function()
															flag23 = false
														end)
													end
												end

												do
													local function fn49(arg, arg2, arg3, arg4)
														local v100 = fn30()
														if not v100 then
															return
														end
														v100.Anchored = true
														v100.CFrame = CFrame.new(arg2 + Vector3.new(v84[67], 8, v84[67]))
														local v101 = nil

														for i = 1, 24 do
															for _, descendant in ipairs(workspace.Training[arg]:GetDescendants()) do
																if descendant:IsA("ProximityPrompt") and descendant.Enabled then
																	v101 = descendant
																	break
																end
															end

															if not (v101 or not arg3()) then
																task.wait(0.25)
																continue
															end
															break
														end

														if not v101 then
															v100.Anchored = v84[35]
															return
														end
														local position = v101.Parent.Position
														local raycastParams = RaycastParams.new()
														raycastParams.FilterDescendantsInstances = { localPlayer.Character }
														raycastParams.FilterType = Enum.RaycastFilterType.Exclude
														local hit = workspace:Raycast(position + Vector3.new(0, 8, 3), Vector3.new(v84[67], -30, v84[67]), raycastParams)
														local n47 = (hit and hit.Position.Y or position.Y) + 3.5
														local vector = Vector3.new
														local x = position.X
														local z = position.Z
														v100.CFrame = CFrame.new(Vector3.new(position.X, n47, position.Z + 3), vector(x, n47, z))
														task.wait(0.3)
														v100.Anchored = v84[35]
														task.wait(0.3)
														firesignal(v101.PromptButtonHoldBegan, localPlayer)
														task.wait(v101.HoldDuration + 0.3)
														fireproximityprompt(v101)
														task.wait(0.2)
														firesignal(v101.PromptButtonHoldEnded, localPlayer)
														local misc = localPlayer.PlayerGui:FindFirstChild("Misc")

														for i = v84[115], 24 do
															if not (misc and #misc:GetChildren() > 0) then
																task.wait(0.25)
																misc = localPlayer.PlayerGui:FindFirstChild("Misc")
																continue
															end

															break
														end

														local flag23

														if misc then
															local v102 = v84[67]
															flag23 = #misc:GetChildren() > v102
														else
															flag23 = misc
														end

														if not flag23 then
															return
														end
														task.wait(0.8)

														pcall(function()
															event:FireServer("training_signaler", "Stop", true)
														end)

														task.wait(0.5)

														pcall(function()
															for _, child in ipairs(misc:GetChildren()) do
																child:Destroy()
															end
														end)

														task.wait(arg4)
													end

													local v100 = ipairs
													local tbl27 = {}

													local tbl28 = {
														id = "AutoBoulderSplit",
														text = "Auto Boulder Split",
														folder = "Boulder Split",
														near = Vector3.new(-1047, 1130, -617),
														settle = 13,
													}

													local tbl29 = {
														id = "AutoSquat",
														text = "Auto Squat",
														folder = "Squat Rack",
														near = Vector3.new(-1858, 314, -72),
														settle = 1,
													}

													tbl27[1] = tbl28
													tbl27[2] = tbl29

													for _, v101 in v100(tbl27) do
														do
															local flag23 = false

															Minigames:AddToggle(v101.id, {
																Text = v101.text,
																Description = "Auto does the minigame",
																Default = v84[35],
																Callback = function(arg)
																	flag23 = arg
																	if not arg then
																		return
																	end

																	task.spawn(function()
																		while flag23 and fn35(v101.id) do
																			pcall(fn49, v101.folder, v101.near, function()
																				return flag23
																			end, v101.settle)

																			task.wait(v84[28])
																		end
																	end)
																end,
															})

															fn33(function()
																flag23 = v84[35]
															end)
														end
													end
												end
											end

											do
												Config:AddDropdown("QuestEquipSlot", {
													Text = "Auto Equip Slot",
													Description = "Which toolbar slot to equip while farming (0 = none)",
													Values = { "0", "1", "2", "3", "4", "5" },
													Default = "0",
													Multi = false,
													Callback = function(arg)
														value = tonumber(arg) or 0
													end,
												})

												Config:AddDropdown("QuestKaWeapon", {
													Text = "Kill Aura Weapon",
													Description = "Weapon to swing",
													Values = tbl23,
													Default = "Combat",
													Multi = false,
													Callback = function(arg)
														if 12753 >= n27(3105) then
															str11 = arg
															return
														end

														while true do
														end
													end,
												})

												Config:AddDropdown("QuestFarmMode", {
													Text = "Farm Position",
													Values = { "Above", "Below", "In Front", "Behind" },
													Default = "Below",
													Multi = false,
													Callback = function(arg)
														str10 = arg
													end,
												})

												Config:AddSlider("QuestFarmOffX", {
													Text = "X Offset",
													Default = 0,
													Min = -v84[157],
													Max = 50,
													Rounding = 1,
													Callback = function(arg)
														n37 = arg
													end,
												})

												Config:AddSlider("QuestFarmOffY", {
													Text = "Y Offset",
													Default = 2,
													Min = -50,
													Max = v84[157],
													Rounding = 1,
													Callback = function(arg)
														n38 = arg
													end,
												})

												Config:AddSlider("QuestFarmOffZ", {
													Text = "Z Offset",
													Default = 0,
													Min = -50,
													Max = 50,
													Rounding = v84[115],
													Callback = function(arg)
														n39 = arg
													end,
												})

												Config:AddSlider("QuestFarmDist", {
													Text = "Distance",
													Description = "How far from the mob to stand",
													Default = 6.5,
													Min = 0,
													Max = v84[157],
													Rounding = 1,
													Callback = function(arg)
														n40 = arg
													end,
												})

												tbl20.MobCfg:AddDropdown("MobEquipSlot", {
													Text = "Auto Equip Slot",
													Description = "Which toolbar slot to equip while farming (0 = none)",
													Values = { "0", "1", "2", "3", "4", "5" },
													Default = "0",
													Multi = false,
													Callback = function(arg)
														n36 = tonumber(arg) or v84[67]
													end,
												})

												tbl20.MobCfg:AddDropdown("MobKaWeapon", {
													Text = "Kill Aura Weapon",
													Description = "Weapon to swing",
													Values = tbl23,
													Default = "Combat",
													Multi = false,
													Callback = function(arg)
														str9 = arg
													end,
												})

												tbl20.MobCfg:AddDropdown("MobFarmMode", {
													Text = "Farm Position",
													Values = { "Above", "Below", "In Front", "Behind" },
													Default = "Below",
													Multi = false,
													Callback = function(arg)
														str8 = arg
													end,
												})

												tbl20.MobCfg:AddSlider("MobFarmOffX", {
													Text = "X Offset",
													Default = v84[67],
													Min = -50,
													Max = 50,
													Rounding = 1,
													Callback = function(arg)
														n32 = arg
													end,
												})

												tbl20.MobCfg:AddSlider("MobFarmOffY", {
													Text = "Y Offset",
													Default = 2,
													Min = -v84[157],
													Max = v84[157],
													Rounding = 1,
													Callback = function(arg)
														n33 = arg
													end,
												})

												tbl20.MobCfg:AddSlider("MobFarmOffZ", {
													Text = "Z Offset",
													Default = 0,
													Min = -50,
													Max = 50,
													Rounding = v84[115],
													Callback = function(arg)
														n34 = arg
													end,
												})

												tbl20.MobCfg:AddSlider("MobFarmDist", {
													Text = v84[17],
													Description = "How far from the mob to stand",
													Default = 6.5,
													Min = v84[67],
													Max = 50,
													Rounding = 1,
													Callback = function(arg)
														n35 = arg
													end,
												})

												fn33(function()
													v97 = v84[35]

													if v96 then
														v96:Disconnect()
														v96 = nil
													end
												end)

												do
													local flag23 = v84[35]

													tbl20.Chests:AddToggle("AutoChests", {
														Text = "Auto Loot Chests (Premium)",
														Description = "Teleport to and open any nearby chests",
														Default = v84[35],
														Callback = function(arg)
															if arg then
																fn36("AutoChests")
															end
														end,
													})

													fn33(function()
														flag23 = false
													end)
												end
											end

											do
												local flag23 = false

												tbl20.Chests:AddToggle("PickupAura", {
													Text = "Pickup Aura (Premium)",
													Description = "Auto collect any loot drops",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("PickupAura")
														end
													end,
												})

												fn33(function()
													flag23 = false
												end)
											end
										end

										do
											do
												do
													local flag23 = false
													local tbl27 = {}
													local vector = Vector3.new(-1740.47, 311.5, 881.24)
													local vector2 = Vector3.new(128.307, 827.359, 987.86)
													local vector3 = Vector3.new(607.25, 1017.5, -224.46)
													local vector4 = Vector3.new(-1035.752, 1130.074, -718.828)
													local vector5 = Vector3.new(-299.885, 1307.598, -1775.326)
													local vector6 = Vector3.new
													tbl27[1] = vector
													tbl27[2] = vector2
													tbl27[3] = vector3
													tbl27[4] = vector4
													tbl27[5] = vector5

													do
														local values = table.pack(vector6(1165.37, 1102.5, -963.35))
														table.move(values, 1, values.n, 6, tbl27)
													end

													tbl20.Horse:AddToggle("HorseTameAutoBuy", {
														Text = "Auto Buy Horse (Premium)",
														Description = "Automatically purchase horse after taming",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("HorseTameAutoBuy")
															end
														end,
													})

													tbl17.AutoHorse = tbl20.Horse:AddToggle("AutoHorse", {
														Text = "Auto Horse Taming (Premium)",
														Description = "Teleport to horses and auto-tame them",
														Default = false,
														Callback = function(arg)
															if arg then
																fn36("AutoHorse")
															end
														end,
													})

													fn33(function()
														flag23 = false
													end)
												end
											end

											do
												local v100 = nil

												local function fn49()
													for _, v101 in pairs(getgc(true)) do
														local v102 = v84[162]
														if type(v101) ~= v102 then
															continue
														end

														local ok, result = pcall(function()
															local flag23 = v101[1] and v101[2] and v101[3]

															if flag23 then
																local v103 = v84[162]
																flag23 = type(v101[v84[115]]) == v103
															end

															if flag23 and type(v101[2]) == "table" and type(v101[3]) == "table" then
																if v101[1].Speed == 10 and v101[v84[115]].Name == "Walk" and v101[v84[119]].Speed == 36 and v101[v84[28]].Speed == 54 then
																	return v101
																end
															end

															return nil
														end)

														if ok and result then
															return result
														end
													end

													return nil
												end

												tbl20.Horse:AddToggle("InfHorseStamina", {
													Text = "Inf Horse Stamina (Premium)",
													Description = "Zeroes stamina drain on all horse gears so sprint never depletes",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("InfHorseStamina")
														end
													end,
												})

												fn33(function()
													if v100 then
														pcall(function()
															local v101 = fn49()

															if v101 then
																v101[1].StaminaDrain = v100[v84[115]]
																v101[2].StaminaDrain = v100[2]
																v101[3].StaminaDrain = v100[3]
															end
														end)

														v100 = nil
													end
												end)
											end
										end

										do
											do
												do
													local flag23 = false
													local v100 = nil
													local v101 = nil

													tbl20.Survival:AddToggle("NoDrown", {
														Text = "No Drown (Premium)",
														Description = "Keeps breath at maximum so you never take drowning damage",
														Default = v84[35],
														Callback = function(arg)
															if arg then
																fn36("NoDrown")
															end
														end,
													})

													fn33(function()
														flag23 = false
														v101 = nil

														if v100 then
															v100:Disconnect()
															v100 = nil
														end
													end)
												end
											end

											do
												local v100 = v84[35]
												local v101 = nil
												local v102 = nil

												tbl20.Survival:AddToggle("InfClimb", {
													Text = "Inf Climb (Premium)",
													Description = "Keeps climbing stamina at maximum so you never fall off walls",
													Default = false,
													Callback = function(arg)
														if arg then
															fn36("InfClimb")
														end
													end,
												})

												fn33(function()
													v100 = v84[35]
													v102 = nil

													if v101 then
														v101:Disconnect()
														v101 = nil
													end
												end)
											end
										end

										do
											local flag23, v100, flag24, n47, n48

											do
												flag23 = false
												v100 = nil
												flag24 = v84[35]
												n47 = 50
												n48 = 2

												do
													local module = nil

													pcall(function()
														module = require(game:GetService("ReplicatedStorage").ToolScripts["Health Potion"]["Health Potion"])
													end)
												end
											end

											do
												local v101 = tbl19.Survival:AddGroupbox("Auto Drink")

												v101:AddDropdown("DrinkSlot", {
													Text = "Potion Slot",
													Description = "Which toolbar slot has your potion",
													Values = { "1", "2", "3", "4", "5" },
													Default = "2",
													Multi = false,
													Callback = function(arg)
														n48 = tonumber(arg) or 2
													end,
												})

												tbl18.DrinkThreshold = v101:AddSlider("DrinkThreshold", {
													Text = "Drink At HP %",
													Default = 50,
													Min = 5,
													Max = 95,
													Rounding = 0,
													Callback = function(arg)
														n47 = arg
													end,
												})

												tbl17.AutoDrink = v101:AddToggle("AutoDrink", {
													Text = "Auto Drink Potion (Premium)",
													Description = "Equip and drink a health potion when HP drops below threshold",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("AutoDrink")
														end
													end,
												})
											end

											fn33(function()
												flag23 = false
												flag24 = false

												if v100 then
													v100:Disconnect()
													v100 = nil
												end
											end)
										end
									end

									CollectionService = game:GetService("CollectionService")
									v99 = tbl19.BossFarm:AddGroupbox("Boss Farm")
									Config2 = tbl19.BossFarm:AddGroupbox("Config")
									flag22 = false
									thread = nil
									tbl25 = {}
									n46 = 0
									str12 = "Below"
									n43 = 0
									n42 = 2
									n44 = 0
									n45 = 6.5
									str13 = "Combat"
									value2 = 0

									fn48 = function(arg)
										local position = arg.Position
										local vector

										if str12 == "Above" then
											vector = Vector3.new(position.X, position.Y + n45, position.Z)
										elseif str12 == "Below" then
											vector = Vector3.new(position.X, position.Y - n45, position.Z)
										elseif str12 == "In Front" then
											vector = position + arg.CFrame.LookVector * n45
										elseif str12 == "Behind" then
											vector = position - arg.CFrame.LookVector * n45
										else
											vector = Vector3.new(position.X, position.Y - n45, position.Z)
										end

										local n47 = arg.CFrame.LookVector * n44
										return vector + arg.CFrame.RightVector * n43 + Vector3.new(0, n42, v84[67]) + n47
									end

									tbl26 = {}

									do
										local tbl27 = {
											name = "Akazo",
											cf = CFrame.new(-1132, 1380, -1747),
											spawnTime = 300,
										}

										local tbl28 = {
											name = "Datai",
											cf = CFrame.new(-166, v84[14], -1138),
											spawnTime = 300,
										}

										local tbl29 = {
											name = "Domae",
											cf = CFrame.new(-297, 1350, -3452),
											spawnTime = 300,
											nightOnly = true,
										}

										local tbl30 = {
											name = "Enru",
											cf = CFrame.new(821, 800, 543),
											spawnTime = 300,
										}

										local tbl31 = {
											name = "Flame Trainee",
											cf = CFrame.new(-1129, 1029, 994),
											spawnTime = 120,
										}

										local tbl32 = {
											name = "Fujiko",
											cf = CFrame.new(-2460, 37, 1119),
											spawnTime = v84[118],
										}

										local tbl33 = {
											name = "Giyen",
											cf = CFrame.new(388, 1018, -86),
											spawnTime = 300,
										}

										local tbl34 = {
											name = "Gyorei",
											cf = CFrame.new(2574, 1089, -743),
											spawnTime = 300,
										}

										local tbl35 = {
											name = "Gyutai",
											cf = CFrame.new(-267, v84[14], -1140),
											spawnTime = 300,
										}

										local tbl36 = {
											name = "Hoyuzo",
											cf = CFrame.new(746, 1001, -1413),
											spawnTime = v84[118],
										}

										local tbl37 = {
											name = "Insect Trainee",
											cf = CFrame.new(-1396, 261, 69),
											spawnTime = 120,
										}

										local tbl38 = {
											name = "Kaiden",
											cf = CFrame.new(585, 1146, -1315),
											spawnTime = 165,
										}

										local tbl39 = {
											name = "Mother Bear",
											cf = CFrame.new(540, 1121, -1024),
											spawnTime = 110,
										}

										local tbl40 = {
											name = "Nezura",
											cf = CFrame.new(-1460, 275, 935),
											spawnTime = 300,
										}

										local tbl41 = {
											name = "Obari",
											cf = CFrame.new(770, 1121, -1048),
											spawnTime = 300,
										}

										local tbl42 = {
											name = "Reaper",
											cf = CFrame.new(98, 1043, -574),
											spawnTime = 300,
											nightOnly = true,
										}

										local tbl43 = {
											name = "Reaper Trainee Kuzan",
											cf = CFrame.new(-1220, 1373, -3035),
											spawnTime = 120,
										}

										local tbl44 = {
											name = "Rengu",
											cf = CFrame.new(-713, 965, 883),
											spawnTime = 300,
										}

										local tbl45 = {
											name = "Saneri",
											cf = CFrame.new(-380, 1093, -423),
											spawnTime = 300,
										}

										local tbl46 = {
											name = "Serpent Trainee",
											cf = CFrame.new(-272, 1292, -1536),
											spawnTime = 120,
										}

										local tbl47 = {
											name = "Shinora",
											cf = CFrame.new(-453, 964, 2),
											spawnTime = 300,
										}

										local tbl48 = {
											name = "Soryu Trainee Goki",
											cf = CFrame.new(-427, 288, 543),
											spawnTime = 120,
										}

										local tbl49 = {
											name = "Sound Trainee",
											cf = CFrame.new(192, 1349, -2582),
											spawnTime = 120,
										}

										local tbl50 = {
											name = "Stone Trainee",
											cf = CFrame.new(2685, 1073, -569),
											spawnTime = 120,
										}

										local tbl51 = {
											name = "Sumari",
											cf = CFrame.new(396, 1018, -621),
											spawnTime = 300,
											nightOnly = true,
										}

										local tbl52 = {
											name = "Tai Chi Trainee Suzume",
											cf = CFrame.new(2360, 601, -643),
											spawnTime = 120,
										}

										local tbl53 = {
											name = "Tengai",
											cf = CFrame.new(-134, 1349, -2632),
											spawnTime = 300,
										}

										local tbl54 = {
											name = "Thunder Trainee",
											cf = CFrame.new(2425, 1073, -557),
											spawnTime = 120,
										}

										local tbl55 = {
											name = "Water Trainee Sabito",
											cf = CFrame.new(815, 1018, 101),
											spawnTime = 120,
										}

										local tbl56 = {
											name = "Wind Trainee",
											cf = CFrame.new(-942, 1381, -2636),
											spawnTime = 120,
										}

										local tbl57 = {
											name = "Yahari",
											cf = CFrame.new(825, 1019, -642),
											spawnTime = 300,
											nightOnly = true,
										}

										local tbl58 = {
											name = "Zentaro",
											cf = CFrame.new(1332, 821, -1018),
											spawnTime = 300,
										}

										local tbl59 = {
											name = "Zuko",
											cf = CFrame.new(-297, 1224, -1023),
											spawnTime = 90,
										}

										tbl26[1] = tbl27
										tbl26[2] = tbl28
										tbl26[3] = tbl29
										tbl26[4] = tbl30
										tbl26[5] = tbl31
										tbl26[6] = tbl32
										tbl26[7] = tbl33
										tbl26[8] = tbl34
										tbl26[9] = tbl35
										tbl26[10] = tbl36
										tbl26[11] = tbl37
										tbl26[12] = tbl38
										tbl26[13] = tbl39
										tbl26[14] = tbl40
										tbl26[15] = tbl41
										tbl26[16] = tbl42
										tbl26[17] = tbl43
										tbl26[18] = tbl44
										tbl26[19] = tbl45
										tbl26[20] = tbl46
										tbl26[21] = tbl47
										tbl26[22] = tbl48
										tbl26[23] = tbl49
										tbl26[24] = tbl50
										tbl26[25] = tbl51
										tbl26[26] = tbl52
										tbl26[27] = tbl53
										tbl26[28] = tbl54
										tbl26[29] = tbl55
										tbl26[30] = tbl56
										tbl26[31] = tbl57
										tbl26[32] = tbl58
										tbl26[33] = tbl59
									end
								end

								do
									local function fn49()
										local tbl27 = { "All Bosses" }

										for _, v100 in ipairs(tbl26) do
											table.insert(tbl27, v100.name)
										end

										return tbl27
									end

									local function fn50(arg)
										local tbl27 = {}

										for k, v100 in pairs(arg) do
											if type(k) == "string" and v100 == true then
												tbl27[k] = true
											elseif type(v100) == "string" then
												tbl27[v100] = true
											end
										end

										return tbl27
									end

									local function fn51(arg, arg2, arg3)
										arg2 = arg2 or 250
										local regions = workspace:FindFirstChild("Humanoids") and workspace.Humanoids:FindFirstChild("Regions")
										if not regions then
											return nil
										end

										for _, child in ipairs(regions:GetChildren()) do
											local activeNpcs = child:FindFirstChild("ActiveNpcs")
											if not activeNpcs then
												continue
											end

											for _, child2 in ipairs(activeNpcs:GetChildren()) do
												if arg3 and child2.Name ~= arg3 then
													continue
												end
												local model = child2:FindFirstChildWhichIsA("Model")
												if not model then
													continue
												end
												local humanoidRootPart = model:FindFirstChild("HumanoidRootPart")
												local humanoid = model:FindFirstChildOfClass("Humanoid")
												if humanoidRootPart and humanoid and humanoid.Health > 0 and (humanoidRootPart.Position - arg).Magnitude < arg2 then
													return { name = child2.Name, model = model, hrp = humanoidRootPart, hum = humanoid }
												end
											end
										end

										return nil
									end

									local function fn52(arg, arg2)
										local n47 = arg2 or 120
										local v100 = fn30()
										if not v100 then
											return
										end
										task.wait(1.5)

										for i = 1, 3 do
											local flag23 = false

											pcall(function()
												local tagged = CollectionService:GetTagged("LootDrop")

												for _, v101 in ipairs(tagged) do
													if not flag22 then
														return
													end
													local basePart

													if v101:IsA("BasePart") then
														basePart = v101
													else
														basePart = nil

														if v101:IsA("Model") then
															basePart = v101:FindFirstChild(v84[52]) or v101:FindFirstChildWhichIsA("BasePart")
														end
													end

													if basePart and (basePart.Position - arg).Magnitude < n47 then
														flag23 = v84[126]
														v100.CFrame = basePart.CFrame * CFrame.new(0, 0, 2)
														v100.AssemblyLinearVelocity = Vector3.zero
														task.wait(0.2)

														for _, descendant in ipairs(v101:GetDescendants()) do
															if descendant:IsA("ProximityPrompt") and descendant.Enabled then
																pcall(fireproximityprompt, descendant)

																pcall(function()
																	if getgenv()._zhSendWebhook then
																		getgenv()._zhSendWebhook(descendant.ObjectText or v101.Name)
																	end
																end)

																break
															end
														end

														pcall(function()
															if v101:FindFirstChildOfClass("ProximityPrompt") then
																fireproximityprompt(v101:FindFirstChildOfClass("ProximityPrompt"))
															end
														end)

														task.wait(0.4)
													end
												end
											end)

											pcall(function()
												local tagged = CollectionService:GetTagged("Chest")

												for _, v101 in ipairs(tagged) do
													if not flag22 then
														return
													end
													local rootPart = v101:FindFirstChild("RootPart") or v101:FindFirstChildWhichIsA("BasePart")

													if rootPart then
														if not (n47 < (rootPart.Position - arg).Magnitude) then
															for _, descendant in ipairs(v101:GetDescendants()) do
																if descendant:IsA("ProximityPrompt") and descendant.Enabled then
																	flag23 = true
																	v100.CFrame = rootPart.CFrame * CFrame.new(0, 0, 3)
																	v100.AssemblyLinearVelocity = Vector3.zero
																	task.wait(0.3)
																	pcall(fireproximityprompt, descendant)
																	task.wait(v84[115])
																	break
																end
															end
														end
													end
												end
											end)

											pcall(function()
												local lootDrops = workspace:FindFirstChild("LootDrops")

												if lootDrops then
													for _, child in ipairs(lootDrops:GetChildren()) do
														if not flag22 then
															return
														end
														local isBasePart = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")

														if isBasePart and (isBasePart.Position - arg).Magnitude < n47 then
															flag23 = true
															v100.CFrame = isBasePart.CFrame * CFrame.new(0, 0, 2)
															v100.AssemblyLinearVelocity = Vector3.zero
															task.wait(0.2)

															for _, descendant in ipairs(child:GetDescendants()) do
																if descendant:IsA("ProximityPrompt") then
																	pcall(fireproximityprompt, descendant)

																	pcall(function()
																		if getgenv()._zhSendWebhook then
																			getgenv()._zhSendWebhook(descendant.ObjectText or child.Name)
																		end
																	end)

																	break
																end
															end

															task.wait(v84[13])
														end
													end
												end
											end)

											pcall(function()
												local chests = workspace:FindFirstChild("Chests")

												if chests then
													for _, child in ipairs(chests:GetChildren()) do
														if not flag22 then
															return
														end
														local rootPart = child:FindFirstChild("RootPart") or child:FindFirstChildWhichIsA("BasePart")

														if rootPart then
															if not (n47 < (rootPart.Position - arg).Magnitude) then
																for _, descendant in ipairs(child:GetDescendants()) do
																	if descendant:IsA("ProximityPrompt") and descendant.Enabled then
																		flag23 = true
																		v100.CFrame = rootPart.CFrame * CFrame.new(0, v84[67], 3)
																		v100.AssemblyLinearVelocity = Vector3.zero
																		task.wait(0.3)
																		pcall(fireproximityprompt, descendant)
																		task.wait(1)
																		break
																	end
																end
															end
														end
													end
												end
											end)

											if not flag23 then
												break
											else
												task.wait(v84[155])
											end
										end
									end

									tbl18.BossSelect = v99:AddDropdown("BossSelect", {
										Text = "Target Bosses",
										Description = "Select one or more bosses to farm (cycles through them)",
										Values = fn49(),
										Default = { "All Bosses" },
										Multi = true,
										Callback = function(arg)
											tbl25 = fn50(arg)
										end,
									})

									tbl17.BossFarm = v99:AddToggle("BossFarm", {
										Text = v84[111],
										Description = "TPs to boss area, waits for spawn, farms, collects drops",
										Default = false,
										Callback = function(arg)
											flag22 = arg

											if thread then
												pcall(task.cancel, thread)
												thread = nil
											end

											if not arg then
												return
											end
											n46 = 0
											local v100 = nil
											local v101 = nil
											local n47 = 1

											thread = task.spawn(function()
												task.wait(0.1)

												while flag22 and fn35("BossFarm") do
													if not pcall(function()
														local v102 = fn30()
														local v103 = fn31()
														if not v102 or not v103 or v103.Health <= v84[67] then
															return
														end

														if value2 > 0 then
															pcall(function()
																localPlayer:FindFirstChild("Items_Config").Equipped.Value = value2
															end)
														end

														if v100 then
															local flag23 = v84[35]
															local position = nil

															pcall(function()
																local humanoid = v100.model:FindFirstChildOfClass("Humanoid")
																local humanoidRootPart = v100.model:FindFirstChild("HumanoidRootPart")

																if humanoidRootPart then
																	position = humanoidRootPart.Position
																end

																if not humanoid or humanoid.Health <= 0 or not v100.model.Parent then
																	flag23 = true
																end
															end)

															if flag23 then
																if not position then
																	local v104 = v101

																	if v101 then
																		position = v101.cf.Position
																	else
																		position = v104
																	end
																end

																fn34("Boss died — collecting drops", 2)
																v100 = nil

																if position then
																	fn52(position, 120)
																end

																task.wait(v84[115])
																return
															end
														end

														if not v100 then
															local allBosses = not next(tbl25) or tbl25["All Bosses"]
															local tbl27 = {}

															for _, v104 in ipairs(tbl26) do
																if allBosses or tbl25[v104.name] then
																	table.insert(tbl27, v104)
																end
															end

															if #tbl27 == v84[67] then
																task.wait(v84[119])
																return
															end

															if #tbl27 < n47 then
																n47 = 1
															end

															local n48 = 0

															while n48 < #tbl27 do
																if not flag22 then
																	break
																end
																local v104 = tbl27[n47]
																n47 += 1

																if n47 > #tbl27 then
																	n47 = v84[115]
																end

																n48 += 1
																fn34("Going to " .. v104.name .. " area", 1)
																fn32(v104.cf)
																task.wait(2)
																local v105 = fn51(v104.cf.Position, 250, v104.name)

																if v105 then
																	v100 = v105
																	v101 = v104
																	fn34("Found " .. v105.name, 2)
																	break
																end

																fn52(v104.cf.Position, 80)
															end

															if not v100 then
																task.wait(v84[32])
																return
															end
														end

														if v100 and v100.model and v100.model.Parent then
															local humanoidRootPart = v100.model:FindFirstChild("HumanoidRootPart")

															if humanoidRootPart then
																local position = humanoidRootPart.Position
																v102.CFrame = CFrame.lookAt(fn48(humanoidRootPart), position)
																v102.AssemblyLinearVelocity = Vector3.zero
																v102.AssemblyAngularVelocity = Vector3.zero
																n46 += 1

																if n46 > 5 then
																	n46 = 1
																end

																pcall(function()
																	event:FireServer("Combat_Service", str13, n46, true, v84[67], true, nil)
																end)
															end
														end
													end) then
														task.wait(1)
													else
														task.wait()
													end
												end
											end)
										end,
									})
								end
							end

							local v99, Config3, v100, flag23, v101, tbl25, str14, n46, n47, n48
							local n49, str15, num, v102, tbl26, n50, tbl27, n51, tbl28

							do
								Config2:AddDropdown("BossEquipSlot", {
									Text = "Auto Equip Slot",
									Description = "Which toolbar slot to equip while farming (0 = none)",
									Values = { "0", "1", "2", "3", "4", "5" },
									Default = "0",
									Multi = false,
									Callback = function(arg)
										value2 = tonumber(arg) or 0
									end,
								})

								Config2:AddDropdown("BossKaWeapon", {
									Text = "Kill Aura Weapon",
									Description = "Weapon to swing",
									Values = tbl23,
									Default = "Combat",
									Multi = v84[35],
									Callback = function(arg)
										str13 = arg
									end,
								})

								Config2:AddDropdown("BossFarmMode", {
									Text = "Farm Position",
									Description = "Where to stand relative to the boss",
									Values = { "Above", "Below", "In Front", "Behind" },
									Default = "Below",
									Multi = false,
									Callback = function(arg)
										str12 = arg
									end,
								})

								Config2:AddSlider("BossFarmOffX", {
									Text = "X Offset",
									Default = 0,
									Min = -50,
									Max = v84[157],
									Rounding = 1,
									Callback = function(arg)
										n43 = arg
									end,
								})

								Config2:AddSlider("BossFarmOffY", {
									Text = "Y Offset",
									Default = v84[119],
									Min = -50,
									Max = 50,
									Rounding = 1,
									Callback = function(arg)
										n42 = arg
									end,
								})

								Config2:AddSlider("BossFarmOffZ", {
									Text = "Z Offset",
									Default = 0,
									Min = -50,
									Max = 50,
									Rounding = 1,
									Callback = function(arg)
										n44 = arg
									end,
								})

								Config2:AddSlider("BossFarmDist", {
									Text = "Distance",
									Description = "How far from the boss to stand",
									Default = 6.5,
									Min = 0,
									Max = v84[157],
									Rounding = 1,
									Callback = function(arg)
										n45 = arg
									end,
								})

								fn33(function()
									flag22 = false
								end)

								game:GetService("CollectionService")
								v99 = tbl19.Mastery:AddGroupbox("Auto Mastery")
								Config3 = tbl19.Mastery:AddGroupbox("Config")
								v100 = tbl19.Mastery:AddGroupbox("Skill Finisher")
								flag23 = false
								v101 = nil
								tbl25 = {}
								str14 = "Below"
								n46 = 0
								n47 = 2
								n48 = 0
								n49 = 6.5
								str15 = "Combat"
								num = v84[67]
								v102 = v84[95]
								tbl26 = {}
								n50 = 1.5
								tbl27 = {}
								n51 = 3
								tbl28 = {}

								do
									local tbl29 = { name = "Akazo", cf = CFrame.new(-1132, 1380, -1747) }
									local tbl30 = { name = "Datai", cf = CFrame.new(-166, v84[14], -1138) }
									local tbl31 = { name = "Domae", cf = CFrame.new(-297, 1350, -3452) }
									local tbl32 = { name = "Enru", cf = CFrame.new(821, 800, 543) }
									local tbl33 = { name = "Flame Trainee", cf = CFrame.new(-1129, 1029, 994) }
									local tbl34 = { name = "Fujiko", cf = CFrame.new(-2460, 37, 1119) }
									local tbl35 = { name = "Giyen", cf = CFrame.new(388, 1018, -86) }
									local tbl36 = { name = "Gyorei", cf = CFrame.new(2574, 1089, -743) }
									local tbl37 = { name = "Gyutai", cf = CFrame.new(-267, 1043, -1140) }
									local tbl38 = { name = "Hoyuzo", cf = CFrame.new(746, 1001, -1413) }
									local tbl39 = { name = "Insect Trainee", cf = CFrame.new(-1396, 261, 69) }
									local tbl40 = { name = "Kaiden", cf = CFrame.new(v84[143], 1146, -1315) }
									local tbl41 = { name = "Mother Bear", cf = CFrame.new(540, 1121, -1024) }
									local tbl42 = { name = "Nezura", cf = CFrame.new(-1460, 275, 935) }
									local tbl43 = { name = "Obari", cf = CFrame.new(770, v84[192], -1048) }
									local tbl44 = { name = "Reaper", cf = CFrame.new(98, 1043, -574) }

									local tbl45 = {
										name = "Reaper Trainee Kuzan",
										cf = CFrame.new(-1220, 1373, -3035),
									}

									local tbl46 = { name = "Rengu", cf = CFrame.new(-713, 965, 883) }
									local tbl47 = { name = "Saneri", cf = CFrame.new(-380, 1093, -423) }
									local tbl48 = { name = "Serpent Trainee", cf = CFrame.new(-272, 1292, -1536) }
									local tbl49 = { name = "Shinora", cf = CFrame.new(-453, 964, 2) }
									local tbl50 = { name = "Soryu Trainee Goki", cf = CFrame.new(-427, 288, 543) }
									local tbl51 = { name = "Sound Trainee", cf = CFrame.new(192, 1349, -2582) }
									local tbl52 = { name = "Stone Trainee", cf = CFrame.new(2685, 1073, -569) }
									local tbl53 = { name = "Sumari", cf = CFrame.new(396, 1018, -621) }

									local tbl54 = {
										name = "Tai Chi Trainee Suzume",
										cf = CFrame.new(2360, 601, -643),
									}

									local tbl55 = { name = "Tengai", cf = CFrame.new(-134, 1349, -2632) }
									local tbl56 = { name = "Thunder Trainee", cf = CFrame.new(2425, 1073, -557) }

									local tbl57 = {
										name = "Water Trainee Sabito",
										cf = CFrame.new(815, 1018, 101),
									}

									local tbl58 = { name = "Wind Trainee", cf = CFrame.new(-942, 1381, -2636) }
									local tbl59 = { name = "Yahari", cf = CFrame.new(825, 1019, -642) }
									local tbl60 = { name = "Zentaro", cf = CFrame.new(1332, 821, -1018) }
									local tbl61 = { name = "Zuko", cf = CFrame.new(-297, 1224, -1023) }
									tbl28[1] = tbl29
									tbl28[2] = tbl30
									tbl28[3] = tbl31
									tbl28[4] = tbl32
									tbl28[5] = tbl33
									tbl28[6] = tbl34
									tbl28[7] = tbl35
									tbl28[8] = tbl36
									tbl28[9] = tbl37
									tbl28[10] = tbl38
									tbl28[11] = tbl39
									tbl28[12] = tbl40
									tbl28[13] = tbl41
									tbl28[14] = tbl42
									tbl28[15] = tbl43
									tbl28[16] = tbl44
									tbl28[17] = tbl45
									tbl28[18] = tbl46
									tbl28[19] = tbl47
									tbl28[20] = tbl48
									tbl28[21] = tbl49
									tbl28[22] = tbl50
									tbl28[23] = tbl51
									tbl28[24] = tbl52
									tbl28[25] = tbl53
									tbl28[26] = tbl54
									tbl28[27] = tbl55
									tbl28[28] = tbl56
									tbl28[29] = tbl57
									tbl28[30] = tbl58
									tbl28[31] = tbl59
									tbl28[32] = tbl60
									tbl28[33] = tbl61
								end
							end

							do
								local function fn48()
									local tbl29 = { "All Bosses" }

									for _, v103 in ipairs(tbl28) do
										table.insert(tbl29, v103.name)
									end

									return tbl29
								end

								Config3:AddDropdown("MastTargets", {
									Text = "Target Bosses",
									Description = "Select one or more bosses to farm mastery on (cycles through them)",
									Values = fn48(),
									Default = { "All Bosses" },
									Multi = v84[126],
									Callback = function(arg)
										tbl25 = {}

										for k, v103 in pairs(arg) do
											if type(k) == "string" and v103 then
												tbl25[k] = v84[126]
											elseif type(v103) == "string" then
												tbl25[v103] = v84[126]
											end
										end
									end,
								})
							end

							Config3:AddDropdown("MastEquipSlot", {
								Text = "Auto Equip Slot",
								Description = "Which toolbar slot to equip while farming (0 = none)",
								Values = { "0", "1", "2", "3", "4", "5" },
								Default = "0",
								Multi = false,
								Callback = function(arg)
									num = tonumber(arg) or v84[67]
								end,
							})

							Config3:AddDropdown("MastWeapon", {
								Text = "Kill Aura Weapon",
								Description = "Weapon to swing while bringing HP down",
								Values = tbl23,
								Default = "Combat",
								Multi = false,
								Callback = function(arg)
									str15 = arg
								end,
							})

							Config3:AddDropdown("MastMode", {
								Text = "Farm Position",
								Description = "Where to stand relative to the boss",
								Values = { "Above", "Below", "In Front", "Behind" },
								Default = "Below",
								Multi = false,
								Callback = function(arg)
									str14 = arg
								end,
							})

							Config3:AddSlider("MastOffX", {
								Text = "X Offset",
								Default = 0,
								Min = -50,
								Max = v84[157],
								Rounding = v84[115],
								Callback = function(arg)
									n46 = arg
								end,
							})

							Config3:AddSlider("MastOffY", {
								Text = "Y Offset",
								Default = 2,
								Min = -50,
								Max = 50,
								Rounding = 1,
								Callback = function(arg)
									n47 = arg
								end,
							})

							Config3:AddSlider("MastOffZ", {
								Text = "Z Offset",
								Default = 0,
								Min = -50,
								Max = 50,
								Rounding = 1,
								Callback = function(arg)
									n48 = arg
								end,
							})

							Config3:AddSlider("MastDist", {
								Text = "Distance",
								Description = "How far from the boss to stand",
								Default = 6.5,
								Min = 0,
								Max = 50,
								Rounding = 1,
								Callback = function(arg)
									n49 = arg
								end,
							})

							Config3:AddSlider("MastHpThreshold", {
								Text = "Switch to skills at HP",
								Description = "Stop swinging and use skills when boss HP drops below this",
								Default = 60,
								Min = v84[31],
								Max = 500,
								Rounding = 0,
								Suffix = " HP",
								Callback = function(arg)
									if n28(3568) > 7543 then
										v102 = arg
										return
									end

									while true do
									end
								end,
							})

							v100:AddDropdown("MastSkillKeys", {
								Text = "Skills to press",
								Description = "Keys to press for finishing blow",
								Values = { "Z", "X", "C", "V", "B", "R", "Q", "E", "G", "T" },
								Multi = true,
								Default = {},
								Callback = function(arg)
									tbl26 = arg
								end,
							})

							v100:AddSlider("MastSkillRate", {
								Text = "Seconds between skills",
								Default = 1.5,
								Min = 0.2,
								Max = 10,
								Rounding = 1,
								Suffix = "s",
								Callback = function(arg)
									n50 = arg
								end,
							})

							v100:AddDropdown("MastHoldKeys", {
								Text = "Skills to hold",
								Description = "Keys to hold down for finishing",
								Values = { "Z", "X", "C", "V", "B", "R", "Q", "E", "G", "T" },
								Multi = true,
								Default = {},
								Callback = function(arg)
									tbl27 = arg
								end,
							})

							v100:AddSlider("MastHoldDur", {
								Text = "Hold duration",
								Default = 3,
								Min = 0.5,
								Max = 15,
								Rounding = v84[115],
								Suffix = "s",
								Callback = function(arg)
									n51 = arg
								end,
							})

							tbl17.AutoMastery = v99:AddToggle("AutoMastery", {
								Text = "Auto Mastery (Premium)",
								Description = "Farm bosses with kill aura, finish with skills for mastery XP",
								Default = false,
								Callback = function(arg)
									if arg then
										fn36("AutoMastery")
									end
								end,
							})

							fn33(function()
								flag23 = false

								if v101 then
									pcall(task.cancel, v101)
									v101 = nil
								end
							end)
						end

						do
							do
								do
									local v99, Config2, flag22, thread, value2, n42, str12, str13, n43, n44
									local v100, n45, tbl25

									do
										v99 = tbl19.CrowQuests:AddGroupbox("Crow Quests")
										Config2 = tbl19.CrowQuests:AddGroupbox("Config")
										flag22 = false
										thread = nil
										value2 = 1
										n42 = 0
										str12 = "Combat"
										str13 = "Below"
										n43 = 0
										n44 = 2
										v100 = v84[67]
										n45 = 6.5
										tbl25 = {}

										do
											local tbl26 = {
												code = "MotherBear",
												index = 27,
												name = "Mother Bear",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(540, 1121, -1024),
											}

											local tbl27 = {
												code = "Hoyuzo",
												index = 28,
												name = "Hoyuzo",
												minLvl = 50,
												maxLvl = 125,
												cf = CFrame.new(746, 1001, -1413),
											}

											local tbl28 = {
												code = "SoryuTrainee",
												index = 29,
												name = "Soryu Trainee Goki",
												minLvl = 62,
												maxLvl = 125,
												cf = CFrame.new(-427, 288, 543),
											}

											local tbl29 = {
												code = "ReaperTrainee",
												index = 30,
												name = "Reaper Trainee Kuzan",
												minLvl = 100,
												maxLvl = 125,
												cf = CFrame.new(-1220, 1373, -3035),
											}

											local tbl30 = {
												code = "Datai",
												index = 16,
												name = "Datai",
												minLvl = 125,
												cf = CFrame.new(-166, 1043, -1138),
											}

											local tbl31 = {
												code = "Domae",
												index = 17,
												name = "Domae",
												minLvl = 125,
												cf = CFrame.new(-297, 1350, -3452),
											}

											local tbl32 = {
												code = "Sumari",
												index = 14,
												name = "Sumari",
												minLvl = 125,
												cf = CFrame.new(396, 1018, -621),
											}

											local tbl33 = {
												code = "Yahari",
												index = 15,
												name = "Yahari",
												minLvl = 125,
												cf = CFrame.new(825, 1019, -642),
											}

											local tbl34 = {
												code = "Enru",
												index = 12,
												name = "Enru",
												minLvl = 125,
												cf = CFrame.new(821, 800, 543),
											}

											local tbl35 = {
												code = "Nezura",
												index = 13,
												name = "Nezura",
												minLvl = 125,
												cf = CFrame.new(-1460, 275, 935),
											}

											local tbl36 = {
												code = "Gyutai",
												index = 9,
												name = "Gyutai",
												minLvl = 125,
												cf = CFrame.new(-267, 1043, -1140),
											}

											local tbl37 = {
												code = "Akazo",
												index = v84[31],
												name = "Akazo",
												minLvl = 125,
												cf = CFrame.new(-1132, 1380, -1747),
											}

											local tbl38 = {
												code = "Reaper",
												index = 11,
												name = "Reaper",
												minLvl = 125,
												cf = CFrame.new(98, 1043, -574),
											}

											tbl25[1] = tbl26
											tbl25[2] = tbl27
											tbl25[3] = tbl28
											tbl25[4] = tbl29
											tbl25[5] = tbl30
											tbl25[6] = tbl31
											tbl25[7] = tbl32
											tbl25[8] = tbl33
											tbl25[9] = tbl34
											tbl25[10] = tbl35
											tbl25[11] = tbl36
											tbl25[12] = tbl37
											tbl25[13] = tbl38
										end
									end

									do
										local function fn48()
											for _, v101 in ipairs(tbl25) do
												local str14 = "Eliminate " .. v101.name
												local flag23 = false

												pcall(function()
													if require(game:GetService(v84[183]).CAM.Global.Utility).GetData(localPlayer).Quests.Holder:FindFirstChild(str14) then
														flag23 = true
													end
												end)

												if flag23 then
													return v101
												end
											end

											return nil
										end

										local function fn49(arg)
											local position = arg.Position
											local vector

											if str13 == "Above" then
												vector = Vector3.new(position.X, position.Y + n45, position.Z)
											elseif str13 == "Below" then
												vector = Vector3.new(position.X, position.Y - n45, position.Z)
											elseif str13 == "In Front" then
												vector = position + arg.CFrame.LookVector * n45
											elseif str13 == "Behind" then
												vector = position - arg.CFrame.LookVector * n45
											else
												vector = Vector3.new(position.X, position.Y - n45, position.Z)
											end

											return vector + Vector3.new(n43, n44, v100)
										end

										local function fn50(arg, arg2)
											local regions = workspace:FindFirstChild("Humanoids") and workspace.Humanoids:FindFirstChild("Regions")
											if not regions then
												return nil
											end

											for _, child in ipairs(regions:GetChildren()) do
												local activeNpcs = child:FindFirstChild("ActiveNpcs")
												if not activeNpcs then
													continue
												end

												for _, child2 in ipairs(activeNpcs:GetChildren()) do
													if child2.Name ~= arg2 then
														continue
													end
													local model = child2:FindFirstChildWhichIsA("Model")
													if not model then
														continue
													end
													local humanoidRootPart = model:FindFirstChild("HumanoidRootPart")
													local humanoid = model:FindFirstChildOfClass("Humanoid")
													if humanoidRootPart and humanoid and humanoid.Health > 0 then
														return model, humanoidRootPart, humanoid
													end
												end
											end

											return nil
										end

										local function fn51(arg)
											local v101 = fn30()
											if not v101 then
												return
											end
											task.wait(1.5)
											local CollectionService = game:GetService("CollectionService")

											for i = 1, 3 do
												local flag23 = false

												pcall(function()
													for _, v102 in ipairs(CollectionService:GetTagged("LootDrop")) do
														if not flag22 then
															return
														end
														local isBasePart = v102:IsA("BasePart") and v102 or v102:FindFirstChildWhichIsA("BasePart")

														if isBasePart and (isBasePart.Position - arg).Magnitude < 120 then
															flag23 = true
															v101.CFrame = isBasePart.CFrame * CFrame.new(v84[67], v84[67], 2)
															v101.AssemblyLinearVelocity = Vector3.zero
															task.wait(0.2)

															for _, descendant in ipairs(v102:GetDescendants()) do
																if descendant:IsA("ProximityPrompt") and descendant.Enabled then
																	pcall(fireproximityprompt, descendant)
																	break
																end
															end

															task.wait(0.4)
														end
													end
												end)

												pcall(function()
													for _, v102 in ipairs(CollectionService:GetTagged("Chest")) do
														if not flag22 then
															return
														end
														local rootPart = v102:FindFirstChild("RootPart") or v102:FindFirstChildWhichIsA("BasePart")

														if rootPart then
															if not ((rootPart.Position - arg).Magnitude > 120) then
																for _, descendant in ipairs(v102:GetDescendants()) do
																	if descendant:IsA("ProximityPrompt") and descendant.Enabled then
																		flag23 = v84[126]
																		v101.CFrame = rootPart.CFrame * CFrame.new(0, 0, 3)
																		v101.AssemblyLinearVelocity = Vector3.zero
																		task.wait(0.3)
																		pcall(fireproximityprompt, descendant)
																		task.wait(1)
																		break
																	end
																end
															end
														end
													end
												end)

												pcall(function()
													local lootDrops = workspace:FindFirstChild("LootDrops")

													if lootDrops then
														for _, child in ipairs(lootDrops:GetChildren()) do
															local isBasePart = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")

															if isBasePart and (isBasePart.Position - arg).Magnitude < 120 then
																flag23 = true
																v101.CFrame = isBasePart.CFrame * CFrame.new(0, 0, 2)
																v101.AssemblyLinearVelocity = Vector3.zero
																task.wait(0.2)

																for _, descendant in ipairs(child:GetDescendants()) do
																	if descendant:IsA("ProximityPrompt") then
																		pcall(fireproximityprompt, descendant)
																		break
																	end
																end

																task.wait(0.3)
															end
														end
													end
												end)

												if not flag23 then
													break
												else
													task.wait(0.5)
												end
											end
										end

										v99:AddDropdown("CrowSlot", {
											Text = "Crow Toolbar Slot",
											Description = "Which slot your crow is in",
											Values = { "1", "2", "3", "4", "5", "6", "7", "8" },
											Default = "1",
											Callback = function(arg)
												value2 = tonumber(arg) or v84[115]
											end,
										})

										v99:AddToggle("CrowQuestFarm", {
											Text = "Auto Crow Quest",
											Description = "Picks a random hunt, farms the boss, collects loot, repeats",
											Default = v84[35],
											Callback = function(arg)
												flag22 = arg

												if thread then
													pcall(task.cancel, thread)
													thread = nil
												end

												if not arg then
													return
												end

												thread = task.spawn(function()
													while flag22 and fn35("CrowQuestFarm") do
														if not pcall(function()
															local v101 = fn48()

															if not v101 then
																if value2 > 0 then
																	pcall(function()
																		localPlayer:FindFirstChild("Items_Config").Equipped.Value = value2
																	end)
																end

																local componentsHolder = localPlayer.PlayerGui:FindFirstChild("ComponentsHolder")
																local flag23 = false

																if componentsHolder then
																	local dialogueContent = componentsHolder:FindFirstChild("DialogueContent") or componentsHolder:WaitForChild("DialogueContent", 5)

																	if dialogueContent then
																		for i = 1, 50 do
																			if flag22 then
																				local tbl26 = {}

																				for _, descendant in ipairs(dialogueContent:GetDescendants()) do
																					if descendant.Name == "Claim" and descendant:IsA("TextButton") then
																						local parent = descendant.Parent

																						if parent and parent.Name:match("^Hunt%d+$") then
																							local levelCover = parent:FindFirstChild("LevelCover", true)

																							if not levelCover or levelCover.Visible == false then
																								table.insert(tbl26, descendant)
																							end
																						end
																					end
																				end

																				if #tbl26 > 0 then
																					fn37(tbl26[math.random(1, #tbl26)])
																					flag23 = v84[126]
																					break
																				else
																					task.wait(0.1)
																					continue
																				end
																			end

																			break
																		end
																	end
																end

																task.wait(flag23 and v84[28] or v84[115])

																pcall(function()
																	localPlayer:FindFirstChild("Items_Config").Equipped.Value = 0
																end)

																if flag23 then
																	pcall(function()
																		localPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health = 0
																	end)

																	task.wait(3)
																end

																task.wait(1)

																pcall(function()
																	local dialogueFrame = localPlayer.PlayerGui.ComponentsHolder:FindFirstChild("DialogueFrame")

																	if dialogueFrame then
																		local zZZZZZZZZ2 = dialogueFrame.Actual.ButtonHolder:FindFirstChild("ZZZZZZZZZ2")

																		if zZZZZZZZZ2 then
																			local textButton = zZZZZZZZZ2:FindFirstChild("TextButton")

																			if textButton then
																				fn37(textButton)
																			end
																		end
																	end
																end)

																task.wait(1)
																return
															end

															local v102 = fn30()
															if not v102 then
																task.wait()
																return
															end

															pcall(function()
																localPlayer:FindFirstChild("Items_Config").Equipped.Value = 1
															end)

															v102.CFrame = v101.cf
															v102.AssemblyLinearVelocity = Vector3.zero
															task.wait(1)
															local v103, v104, v105 = fn50(v101.cf.Position, v101.name)
															if not v104 then
																task.wait(3)
																return
															end
															local position = v104.Position

															while flag22 do
																local flag23 = false

																pcall(function()
																	if v103 and v103.Parent and v105 and v105.Health > 0 then
																		flag23 = true
																	end

																	if v104 then
																		position = v104.Position
																	end
																end)

																if not flag23 then
																	break
																else
																	local v106 = fn30()

																	if not v106 then
																		break
																	else
																		local position2 = v104.Position
																		v106.CFrame = CFrame.lookAt(fn49(v104), position2)
																		v106.AssemblyLinearVelocity = Vector3.zero
																		v106.AssemblyAngularVelocity = Vector3.zero
																		n42 += v84[115]

																		if v84[32] < n42 then
																			n42 = 1
																		end

																		pcall(function()
																			event:FireServer("Combat_Service", str12, n42, true, v84[67], true, nil)
																		end)

																		position = v104.Position
																		task.wait()
																	end
																end
															end

															fn51(position)
														end) then
															task.wait(1)
														else
															task.wait(2)
														end
													end
												end)
											end,
										})
									end

									fn33(function()
										flag22 = false

										if thread then
											pcall(task.cancel, thread)
											thread = nil
										end
									end)

									Config2:AddDropdown("CrowKaWeapon", {
										Text = "Kill Aura Weapon",
										Description = "Which weapon to swing with",
										Values = tbl23,
										Default = "Combat",
										Callback = function(arg)
											str12 = arg
										end,
									})

									Config2:AddDropdown("CrowFarmMode", {
										Text = "Farm Position",
										Description = "Where to stand relative to the boss",
										Values = { "Above", "Below", "In Front", "Behind" },
										Default = "Below",
										Callback = function(arg)
											str13 = arg
										end,
									})

									Config2:AddSlider("CrowFarmOffX", {
										Text = "X Offset",
										Default = v84[67],
										Min = -50,
										Max = 50,
										Rounding = 1,
										Callback = function(arg)
											n43 = arg
										end,
									})

									Config2:AddSlider("CrowFarmOffY", {
										Text = "Y Offset",
										Default = 2,
										Min = -50,
										Max = 50,
										Rounding = 1,
										Callback = function(arg)
											n44 = arg
										end,
									})

									Config2:AddSlider("CrowFarmOffZ", {
										Text = "Z Offset",
										Default = v84[67],
										Min = -v84[157],
										Max = 50,
										Rounding = 1,
										Callback = function(arg)
											v100 = arg
										end,
									})

									Config2:AddSlider("CrowFarmDist", {
										Text = "Distance",
										Default = 6.5,
										Min = 0,
										Max = v84[157],
										Rounding = 1,
										Callback = function(arg)
											n45 = arg
										end,
									})
								end

								do
									local v99, Config2, flag22, thread, value2, n42, str12, str13, v100, v101
									local n43, n44, tbl25

									do
										v99 = tbl19.MuzanQuests:AddGroupbox("Muzan Quests")
										Config2 = tbl19.MuzanQuests:AddGroupbox("Config")
										flag22 = false
										thread = nil
										value2 = v84[115]
										n42 = 0
										str12 = "Combat"
										str13 = "Below"
										v100 = v84[67]
										v101 = v84[119]
										n43 = 0
										n44 = 6.5
										tbl25 = {}

										do
											local tbl26 = {
												name = "Flame Trainee",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(-1129, 1029, 994),
											}

											local tbl27 = {
												name = "Thunder Trainee",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(2425, 1073, -557),
											}

											local tbl28 = {
												name = "Water Trainee Sabito",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(815, 1018, 101),
											}

											local tbl29 = {
												name = "Wind Trainee",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(-942, 1381, -2636),
											}

											local tbl30 = {
												name = "Stone Trainee",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(2685, 1073, -569),
											}

											local tbl31 = {
												name = "Serpent Trainee",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(-272, 1292, -1536),
											}

											local tbl32 = {
												name = "Insect Trainee",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(-1396, 261, 69),
											}

											local tbl33 = {
												name = "Sound Trainee",
												minLvl = 45,
												maxLvl = 125,
												cf = CFrame.new(192, 1349, -2582),
											}

											local tbl34 = {
												name = "Tai Chi Trainee Suzume",
												minLvl = 65,
												maxLvl = 125,
												cf = CFrame.new(2360, 601, -643),
											}

											local tbl35 = {
												name = "Obari",
												minLvl = 125,
												cf = CFrame.new(770, 1121, -1048),
											}

											local tbl36 = {
												name = "Tengai",
												minLvl = 125,
												cf = CFrame.new(-134, 1349, -2632),
											}

											local tbl37 = {
												name = "Shinora",
												minLvl = 125,
												cf = CFrame.new(-453, 964, 2),
											}

											local tbl38 = {
												name = "Rengu",
												minLvl = 125,
												cf = CFrame.new(-713, 965, 883),
											}

											local tbl39 = {
												name = "Saneri",
												minLvl = 125,
												cf = CFrame.new(-380, 1093, -423),
											}

											local tbl40 = {
												name = "Gyorei",
												minLvl = 125,
												cf = CFrame.new(2574, 1089, -743),
											}

											local tbl41 = {
												name = "Zentaro",
												minLvl = 125,
												cf = CFrame.new(1332, 821, -1018),
											}

											local tbl42 = {
												name = "Giyen",
												minLvl = 125,
												cf = CFrame.new(388, 1018, -86),
											}

											local tbl43 = {
												name = "Gyutai",
												minLvl = 125,
												cf = CFrame.new(-267, 1043, -1140),
											}

											local tbl44 = {
												name = "Datai",
												minLvl = 125,
												cf = CFrame.new(-166, 1043, -1138),
											}

											tbl25[1] = tbl26
											tbl25[2] = tbl27
											tbl25[3] = tbl28
											tbl25[4] = tbl29
											tbl25[5] = tbl30
											tbl25[6] = tbl31
											tbl25[7] = tbl32
											tbl25[8] = tbl33
											tbl25[9] = tbl34
											tbl25[10] = tbl35
											tbl25[11] = tbl36
											tbl25[12] = tbl37
											tbl25[13] = tbl38
											tbl25[14] = tbl39
											tbl25[15] = tbl40
											tbl25[16] = tbl41
											tbl25[17] = tbl42
											tbl25[18] = tbl43
											tbl25[19] = tbl44
										end
									end

									do
										do
											do
												local function fn48()
													for _, v102 in ipairs(tbl25) do
														local str14 = "Eliminate " .. v102.name
														local flag23 = false

														pcall(function()
															if require(game:GetService("ReplicatedStorage").CAM.Global.Utility).GetData(localPlayer).Quests.Holder:FindFirstChild(str14) then
																flag23 = v84[126]
															end
														end)

														if flag23 then
															return v102
														end
													end

													return nil
												end

												local function fn49(arg)
													local position = arg.Position
													local vector

													if str13 == "Above" then
														vector = Vector3.new(position.X, position.Y + n44, position.Z)
													elseif str13 == "Below" then
														vector = Vector3.new(position.X, position.Y - n44, position.Z)
													elseif str13 == "In Front" then
														vector = position + arg.CFrame.LookVector * n44
													elseif str13 == "Behind" then
														vector = position - arg.CFrame.LookVector * n44
													else
														vector = Vector3.new(position.X, position.Y - n44, position.Z)
													end

													return vector + Vector3.new(v100, v101, n43)
												end

												local function fn50(arg)
													local regions = workspace:FindFirstChild("Humanoids") and workspace.Humanoids:FindFirstChild("Regions")
													if not regions then
														return nil
													end

													for _, child in ipairs(regions:GetChildren()) do
														local activeNpcs = child:FindFirstChild("ActiveNpcs")
														if not activeNpcs then
															continue
														end

														for _, child2 in ipairs(activeNpcs:GetChildren()) do
															if child2.Name ~= arg then
																continue
															end
															local model = child2:FindFirstChildWhichIsA("Model")
															if not model then
																continue
															end
															local v102 = model:FindFirstChild(v84[167])
															local v103 = model:FindFirstChildOfClass(v84[33])
															if v102 and v103 and v103.Health > 0 then
																return model, v102, v103
															end
														end
													end

													return nil
												end

												local function fn51(arg)
													local v102 = fn30()
													if not v102 then
														return
													end
													task.wait(0.5)
													local CollectionService = game:GetService("CollectionService")

													for i = 1, v84[28] do
														local flag23 = false

														pcall(function()
															for _, v103 in ipairs(CollectionService:GetTagged("LootDrop")) do
																local isBasePart = v103:IsA("BasePart") and v103 or v103:FindFirstChildWhichIsA("BasePart")

																if isBasePart and (isBasePart.Position - arg).Magnitude < 120 then
																	flag23 = true
																	v102.CFrame = isBasePart.CFrame * CFrame.new(0, 0, 2)
																	v102.AssemblyLinearVelocity = Vector3.zero
																	task.wait(0.2)

																	for _, descendant in ipairs(v103:GetDescendants()) do
																		if descendant:IsA("ProximityPrompt") and descendant.Enabled then
																			pcall(fireproximityprompt, descendant)
																			break
																		end
																	end

																	task.wait(0.4)
																end
															end
														end)

														pcall(function()
															for _, v103 in ipairs(CollectionService:GetTagged("Chest")) do
																local rootPart = v103:FindFirstChild("RootPart") or v103:FindFirstChildWhichIsA("BasePart")

																if rootPart then
																	if not ((rootPart.Position - arg).Magnitude > 120) then
																		for _, descendant in ipairs(v103:GetDescendants()) do
																			if descendant:IsA("ProximityPrompt") and descendant.Enabled then
																				flag23 = v84[126]
																				v102.CFrame = rootPart.CFrame * CFrame.new(0, v84[67], 3)
																				v102.AssemblyLinearVelocity = Vector3.zero
																				task.wait(0.3)
																				pcall(fireproximityprompt, descendant)
																				task.wait(1)
																				break
																			end
																		end
																	end
																end
															end
														end)

														pcall(function()
															local lootDrops = workspace:FindFirstChild("LootDrops")

															if lootDrops then
																for _, child in ipairs(lootDrops:GetChildren()) do
																	local isBasePart = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")

																	if isBasePart and (isBasePart.Position - arg).Magnitude < 120 then
																		flag23 = v84[126]
																		v102.CFrame = isBasePart.CFrame * CFrame.new(0, v84[67], 2)
																		v102.AssemblyLinearVelocity = Vector3.zero
																		task.wait(0.2)

																		for _, descendant in ipairs(child:GetDescendants()) do
																			if descendant:IsA("ProximityPrompt") then
																				pcall(fireproximityprompt, descendant)
																				break
																			end
																		end

																		task.wait(v84[13])
																	end
																end
															end
														end)

														if not flag23 then
															break
														else
															task.wait(0.5)
														end
													end
												end

												v99:AddDropdown("MuzanBellSlot", {
													Text = "Biwa Bell Toolbar Slot",
													Description = "Which slot has your Biwa Bell",
													Values = { "1", "2", "3", "4", "5", "6", "7", "8" },
													Default = "1",
													Callback = function(arg)
														value2 = tonumber(arg) or 1
													end,
												})

												v99:AddToggle("MuzanQuestFarm", {
													Text = "Auto Muzan Quest",
													Description = "TPs to Muzan, picks a random hunt, farms the boss, collects loot, repeats",
													Default = false,
													Callback = function(arg)
														flag22 = arg

														if thread then
															pcall(task.cancel, thread)
															thread = nil
														end

														if not arg then
															return
														end

														thread = task.spawn(function()
															while flag22 and fn35("MuzanQuestFarm") do
																if not pcall(function()
																	local v102 = fn48()

																	if not v102 then
																		local v103 = fn30()
																		local flag23 = true

																		pcall(function()
																			local muzanLairModel = workspace.Debree:FindFirstChild("MuzanLairModel")

																			if muzanLairModel then
																				local humanoidRootPart = muzanLairModel:FindFirstChild("HumanoidRootPart")

																				if humanoidRootPart and v103 and (v103.Position - humanoidRootPart.Position).Magnitude < 50 then
																					flag23 = false
																				end
																			end
																		end)

																		if flag23 and value2 > 0 then
																			pcall(function()
																				localPlayer:FindFirstChild("Items_Config").Equipped.Value = value2
																			end)

																			task.wait(0.2)

																			pcall(function()
																				local currentCamera2 = workspace.CurrentCamera
																				local n45 = currentCamera2.ViewportSize.X / v84[119]
																				local n46 = currentCamera2.ViewportSize.Y * 0.15
																				VirtualInputManager:SendMouseButtonEvent(n45, n46, 0, true, game, 0)
																				task.wait(0.1)
																				VirtualInputManager:SendMouseButtonEvent(n45, n46, 0, false, game, 0)
																			end)

																			task.wait(0.8)
																		end

																		v103 = fn30()

																		pcall(function()
																			local muzanLairModel = workspace.Debree:FindFirstChild("MuzanLairModel")

																			if muzanLairModel then
																				local humanoidRootPart = muzanLairModel:FindFirstChild("HumanoidRootPart")

																				if humanoidRootPart and v103 and (v103.Position - humanoidRootPart.Position).Magnitude < 50 then
																					v103.CFrame = humanoidRootPart.CFrame * CFrame.new(v84[67], 0, 3)
																					v103.AssemblyLinearVelocity = Vector3.zero
																					task.wait(0.15)
																					local proximityPrompt = humanoidRootPart:FindFirstChildOfClass("ProximityPrompt")

																					if proximityPrompt and proximityPrompt.Enabled then
																						pcall(function()
																							fireproximityprompt(proximityPrompt)
																						end)
																					end
																				end
																			end
																		end)

																		local flag24 = false
																		local connection = nil

																		connection = v85.RenderStepped:Connect(function()
																			if flag24 then
																				return
																			end

																			pcall(function()
																				local dialogueFrame = localPlayer.PlayerGui.ComponentsHolder:FindFirstChild("DialogueFrame")
																				if not dialogueFrame then
																					return
																				end
																				local clickDetector = dialogueFrame.Actual:FindFirstChild("ClickDetector")

																				if clickDetector then
																					fn37(clickDetector)
																				end

																				local buttonHolder = dialogueFrame.Actual:FindFirstChild("ButtonHolder")

																				if buttonHolder then
																					for _, child in ipairs(buttonHolder:GetChildren()) do
																						if child:IsA("Frame") and child:FindFirstChild("TextButton") then
																							flag24 = v84[126]
																							connection:Disconnect()
																							return
																						end
																					end
																				end
																			end)
																		end)

																		local now2 = tick()

																		while not flag24 and tick() - now2 < 1 do
																			task.wait(0.05)
																		end

																		if connection.Connected then
																			connection:Disconnect()
																		end

																		pcall(function()
																			local dialogueFrame = localPlayer.PlayerGui.ComponentsHolder:FindFirstChild("DialogueFrame")
																			if not dialogueFrame then
																				return
																			end
																			local buttonHolder = dialogueFrame.Actual:FindFirstChild("ButtonHolder")
																			if not buttonHolder then
																				return
																			end
																			local giveMeATask = buttonHolder:FindFirstChild("Give me a task")

																			if giveMeATask then
																				local textButton = giveMeATask:FindFirstChildOfClass("TextButton") or giveMeATask:FindFirstChild("TextButton")

																				if textButton then
																					fn37(textButton)
																				end
																			end
																		end)

																		local componentsHolder = localPlayer.PlayerGui:FindFirstChild("ComponentsHolder")
																		local flag25 = false

																		if componentsHolder then
																			local dialogueContent = componentsHolder:FindFirstChild("DialogueContent") or componentsHolder:WaitForChild("DialogueContent", 2)
																			local flag26 = false

																			if dialogueContent then
																				local flag27 = false

																				for i = 1, 20 do
																					if flag22 then
																						local tbl26 = {}

																						for _, descendant in ipairs(dialogueContent:GetDescendants()) do
																							if descendant.Name == "Claim" and descendant:IsA("TextButton") then
																								local parent = descendant.Parent

																								if parent and parent.Name:match("^Hunt%d+$") then
																									local levelCover = parent:FindFirstChild("LevelCover", true)

																									if not levelCover or levelCover.Visible == false then
																										table.insert(tbl26, descendant)
																									end
																								end
																							end
																						end

																						if #tbl26 > 0 then
																							fn37(tbl26[math.random(1, #tbl26)])
																							flag27 = v84[126]
																							break
																						else
																							task.wait(0.1)
																							continue
																						end
																					end

																					break
																				end

																				task.wait(flag27 and 0.5 or 0.3)
																				flag25 = flag27
																			else
																				flag25 = flag26
																			end
																		end

																		pcall(function()
																			local v104 = v84[67]
																			localPlayer:FindFirstChild("Items_Config").Equipped.Value = v104
																		end)

																		if flag25 then
																			task.wait(3)

																			pcall(function()
																				localPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health = 0
																			end)

																			task.wait(3)
																		end

																		return
																	end

																	local v103 = fn30()
																	if not v103 then
																		task.wait()
																		return
																	end
																	v103.CFrame = v102.cf
																	v103.AssemblyLinearVelocity = Vector3.zero
																	task.wait(0.3)
																	local v104, v105, v106 = fn50(v102.name)
																	if not v105 then
																		task.wait(1)
																		return
																	end
																	local position = v105.Position

																	while flag22 do
																		local v107 = v84[35]

																		pcall(function()
																			if v104 and v104.Parent and v106 and v106.Health > 0 then
																				v107 = v84[126]
																			end

																			if v105 then
																				position = v105.Position
																			end
																		end)

																		if not v107 then
																			break
																		else
																			local v108 = fn30()

																			if not v108 then
																				break
																			else
																				local position2 = v105.Position
																				v108.CFrame = CFrame.lookAt(fn49(v105), position2)
																				v108.AssemblyLinearVelocity = Vector3.zero
																				v108.AssemblyAngularVelocity = Vector3.zero
																				n42 += 1

																				if v84[32] < n42 then
																					n42 = 1
																				end

																				pcall(function()
																					event:FireServer("Combat_Service", str12, n42, true, 0, true, nil)
																				end)

																				task.wait()
																			end
																		end
																	end

																	fn51(position)
																end) then
																	task.wait(0.5)
																else
																	task.wait(v84[155])
																end
															end
														end)
													end,
												})
											end
										end

										fn33(function()
											flag22 = false

											if thread then
												pcall(task.cancel, thread)
												thread = nil
											end
										end)

										Config2:AddDropdown("MuzanKaWeapon", {
											Text = "Kill Aura Weapon",
											Description = "Which weapon to swing with",
											Values = tbl23,
											Default = "Combat",
											Callback = function(arg)
												str12 = arg
											end,
										})

										Config2:AddDropdown("MuzanFarmMode", {
											Text = "Farm Position",
											Description = "Where to stand relative to the boss",
											Values = { "Above", "Below", "In Front", "Behind" },
											Default = "Below",
											Callback = function(arg)
												str13 = arg
											end,
										})

										Config2:AddSlider("MuzanFarmOffX", {
											Text = "X Offset",
											Default = v84[67],
											Min = -50,
											Max = 50,
											Rounding = v84[115],
											Callback = function(arg)
												v100 = arg
											end,
										})

										Config2:AddSlider("MuzanFarmOffY", {
											Text = "Y Offset",
											Default = v84[119],
											Min = -50,
											Max = 50,
											Rounding = v84[115],
											Callback = function(arg)
												v101 = arg
											end,
										})

										Config2:AddSlider("MuzanFarmOffZ", {
											Text = "Z Offset",
											Default = v84[67],
											Min = -50,
											Max = 50,
											Rounding = 1,
											Callback = function(arg)
												n43 = arg
											end,
										})

										Config2:AddSlider("MuzanFarmDist", {
											Text = "Distance",
											Default = 6.5,
											Min = 0,
											Max = 50,
											Rounding = 1,
											Callback = function(arg)
												n44 = arg
											end,
										})

										do
											local function fn48()
												local v102 = v84[35]
												local cFrame = nil

												local function fn49(arg)
													flag18 = false

													if arg then
														arg.Anchored = false

														if cFrame then
															arg.CFrame = cFrame
														end

														arg.AssemblyLinearVelocity = Vector3.zero
													end
												end

												local connection = game:GetService("RunService").Heartbeat:Connect(function()
													local character = localPlayer.Character
													local humanoid = character and character:FindFirstChildOfClass("Humanoid")
													character = character and character:FindFirstChild("HumanoidRootPart")
													if not (humanoid and character and humanoid.Health > 0) then
														flag18 = v84[35]
														return
													end

													if not (v102 or v86 > 0) then
														if flag18 then
															if not flag2 then
																return
															end
															fn49(character)

															if n25 < 4378 then
																while true do
																end
															end
														end

														return
													end

													if not flag18 then
														if humanoid.Health >= math.min(150, humanoid.MaxHealth * 0.4) then
															if n26(3158) <= 9603 then
																return
															end

															while v84[126] do
															end
														end

														cFrame = character.CFrame
														flag18 = true
														fn34("Low HP, floating up to heal", 3)
													end

													if humanoid.MaxHealth <= humanoid.Health then
														fn49(character)
														fn34("Healed, dropping back down", 3)
														return
													end

													character.Anchored = v84[35]
													character.CFrame = CFrame.new(cFrame.Position + Vector3.new(v84[67], 300, 0))
													character.AssemblyLinearVelocity = Vector3.zero
													character.AssemblyAngularVelocity = Vector3.zero
												end)

												tbl20.Survival:AddToggle("SkyHeal", {
													Text = "Sky Heal (Premium)",
													Description = "Floats you up into the sky when you drop under 150 HP and brings you back once you're at full HP",
													Default = v84[35],
													Callback = function(arg)
														if arg then
															fn36("SkyHeal")
														end
													end,
												})

												fn33(function()
													connection:Disconnect()

													if flag18 then
														local character = localPlayer.Character
														fn49(character and character:FindFirstChild("HumanoidRootPart"))
													end
												end)
											end

											fn48()
										end
									end
								end
							end

							do
								do
									local function fn48()
										local Gourd = tbl19.Training:AddGroupbox("Gourd")
										local ReplicatedStorage = game:GetService("ReplicatedStorage")
										local SignalEvent = require(ReplicatedStorage.Communication.ServerAndClient.Signals.SignalEvent)
										local Utility = require(ReplicatedStorage.CAM.Global.Utility)
										local tbl25 = { "One", "Two", "Three", "Four", "Five" }
										local flag22 = false
										local v99 = nil
										local str12 = "Large Gourd"
										local v100 = v84[67]
										local v101 = nil
										local v102 = nil

										local function fn49()
											return Utility.GetData(localPlayer).Inventory
										end

										local function fn50()
											if not v101 then
												return
											end
											local itemsConfig = localPlayer:FindFirstChild("Items_Config")

											if itemsConfig and itemsConfig.Equipped.Value == v101 then
												itemsConfig.Equipped.Value = 0
											end

											local v103 = tbl25[v101]

											if fn49().Toolbar[v103].Value ~= v102 then
												SignalEvent.ToServer("Toolbar_Equip", tbl25[v101], v102)
											end

											v101 = nil
											v102 = nil
										end

										Vector3.new(-1854, 317, 10)

										tbl17.AutoGourd = Gourd:AddToggle("AutoGourd", {
											Text = "Auto Use Gourd (Premium)",
											Description = "Blows through every gourd in your bag for Slayer training",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("AutoGourd")
												end
											end,
										})

										tbl17.AutoBuyGourd = Gourd:AddToggle("AutoBuyGourd", {
											Text = "Auto Buy Gourds (Premium)",
											Description = "When you run out, buys more from the gourd stand and keeps going",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("AutoBuyGourd")
												end
											end,
										})

										Gourd:AddDropdown("GourdBuyPick", {
											Text = "Gourd To Buy",
											Description = "Large gives the most training for your Wen",
											Values = { "Small Gourd", "Medium Gourd", "Large Gourd" },
											Default = "Large Gourd",
											Multi = v84[35],
											Callback = function(arg)
												str12 = arg or "Large Gourd"
											end,
										})

										Gourd:AddSlider("GourdKeepWen", {
											Text = "Keep Wen",
											Description = "Never spends your Wen below this",
											Default = v84[67],
											Min = v84[67],
											Max = 100000,
											Rounding = 0,
											Callback = function(arg)
												v100 = arg
											end,
										})

										fn33(function()
											flag22 = false

											if v99 then
												pcall(task.cancel, v99)
												v99 = nil
											end

											pcall(fn50)
										end)
									end

									fn48()
								end

								do
									local function fn48()
										local v99 = tbl19.Schematics:AddGroupbox("Schematic Farm")
										local ReplicatedStorage = game:GetService("ReplicatedStorage")
										local CollectionService = game:GetService("CollectionService")
										local SignalEvent = require(ReplicatedStorage.Communication.ServerAndClient.Signals.SignalEvent)
										local Utility = require(ReplicatedStorage.CAM.Global.Utility)
										local Series = require(ReplicatedStorage.CAM.Global.Series)
										local Quests = require(ReplicatedStorage.CAM.Global.Subsets.Gameplay.Quests)
										local SimonSaysController = require(ReplicatedStorage.CAM.Client.Controllers.SimonSaysController)
										local flag22 = v84[35]
										local v100 = nil

										local tbl25 = {
											Isamu = Vector3.new(1082.2, 1425.7, -749),
											Hatsu = Vector3.new(2281.2, 812.7, 14.7),
											Omi = Vector3.new(1827.2, 1616.2, 119.7),
											Genzo = Vector3.new(-1058.8, 1226, -955.7),
											Tobei = Vector3.new(1876, 659, -206),
											Togane = Vector3.new(1732.1, 694, -764.6),
											Hibiki = Vector3.new(-1233.8, 1427.4, -4592.8),
											Lynx = Vector3.new(-91.7, 1353.4, -2705.6),
											SerpentBox = Vector3.new(899.4, 878.5, 738.7),
											SicklesProp = Vector3.new(-1024.5, 812.4, 630.8),
											TantoMound = Vector3.new(-1374.6, 1420.5, -3824.4),
											WarFansMound = Vector3.new(-424.6, 1353.6, -3528.6),
										}

										local tbl26 = {}
										local tbl27 = { "Firstlight Spear", Vector3.new(-889.6, 983.1, -3962.7) }
										local tbl28 = { "Firstlight Katana", Vector3.new(-1266.5, 982.7, -3347.2) }
										local tbl29 = { "Nightfall Scythe", Vector3.new(-1205.3, 968.8, -3186.8) }
										local tbl30 = { "Nightfall Axe and Mace", Vector3.new(1082.9, 1583.8, -810.7) }
										local tbl31 = { "Firstlight Mask", Vector3.new(2232.1, 603.6, -509) }
										local tbl32 = { "Nightfall Katana", Vector3.new(-570.2, 815.2, 111.9) }
										local tbl33 = { "Firstlight Insect Katana", Vector3.new(-698.1, 857.6, 75) }
										local tbl34 = { "Nightfall Mask", Vector3.new(-1628.7, 1229.1, 1143.3) }
										local tbl35 = { "Nightfall Claws", Vector3.new(-1815.8, -43.7, 438) }
										tbl26[1] = tbl27
										tbl26[2] = tbl28
										tbl26[3] = tbl29
										tbl26[4] = tbl30
										tbl26[5] = tbl31
										tbl26[6] = tbl32
										tbl26[7] = tbl33
										tbl26[8] = tbl34
										tbl26[9] = tbl35
										local tbl36 = {}
										local vector = Vector3.new(1868, 688, -733)
										local vector2 = Vector3.new(653, 1048, -2164)
										local vector3 = Vector3.new(1055, 1552, -787)
										local vector4 = Vector3.new(757, 928, -364)
										local vector5 = Vector3.new(-1417, 158, 522)
										local vector6 = Vector3.new(-1247, 1383, -1761)
										local vector7 = Vector3.new(2754, 970, -823)
										local vector8 = Vector3.new(1939, 1322, -224)
										local vector9 = Vector3.new(859, 1227, 476)
										local vector10 = Vector3.new
										tbl36[1] = vector
										tbl36[2] = vector2
										tbl36[3] = vector3
										tbl36[4] = vector4
										tbl36[5] = vector5
										tbl36[6] = vector6
										tbl36[7] = vector7
										tbl36[8] = vector8
										tbl36[9] = vector9

										do
											local values = table.pack(vector10(-1690, 124, 602))
											table.move(values, 1, values.n, 10, tbl36)
										end

										local tbl37 = {}
										local vector11 = Vector3.new(-58.5, 734.7, 910.5)
										local vector12 = Vector3.new(-345.2, 733.4, 1168)
										local vector13 = Vector3.new(-321.1, 733.4, 1129.5)
										local vector14 = Vector3.new(-315, 733.4, 1221.5)
										local vector15 = Vector3.new(-293, 733.4, 1161.7)
										local vector16 = Vector3.new(-285, 733.4, 1243.5)
										local vector17 = Vector3.new(32.9, 739.5, 1268.5)
										local vector18 = Vector3.new(-141.5, 733.4, 1087.5)
										local vector19 = Vector3.new(-213.2, 733.4, 844)
										local vector20 = Vector3.new(-335, 733.4, 941.5)
										local vector21 = Vector3.new(-89.1, 733.8, 758.4)
										local vector22 = Vector3.new(-344.5, 740.5, 770.1)
										local vector23 = Vector3.new(-146.9, 734.3, 540.9)
										local vector24 = Vector3.new(-217, 733.4, 460.9)
										local vector25 = Vector3.new(-282.5, 733.8, 429.5)
										local vector26 = Vector3.new(-374.9, 733.4, 540.2)
										local vector27 = Vector3.new(-389.1, 733.4, 603)
										local vector28 = Vector3.new(-319.5, 733.7, 666)
										local vector29 = Vector3.new(-483.2, 733.4, 545.1)
										local vector30 = Vector3.new(-595, 733.4, 506.8)
										local vector31 = Vector3.new(-698.8, 740.4, 373.5)
										local vector32 = Vector3.new(-766.3, 746.4, 278.5)
										local vector33 = Vector3.new(-692.1, 733.4, 551.8)
										local vector34 = Vector3.new(-573, 733.4, 674.8)
										local vector35 = Vector3.new(-263, 733.4, 263.1)
										local vector36 = Vector3.new
										tbl37[1] = vector11
										tbl37[2] = vector12
										tbl37[3] = vector13
										tbl37[4] = vector14
										tbl37[5] = vector15
										tbl37[6] = vector16
										tbl37[7] = vector17
										tbl37[8] = vector18
										tbl37[9] = vector19
										tbl37[10] = vector20
										tbl37[11] = vector21
										tbl37[12] = vector22
										tbl37[13] = vector23
										tbl37[14] = vector24
										tbl37[15] = vector25
										tbl37[16] = vector26
										tbl37[17] = vector27
										tbl37[18] = vector28
										tbl37[19] = vector29
										tbl37[20] = vector30
										tbl37[21] = vector31
										tbl37[22] = vector32
										tbl37[23] = vector33
										tbl37[24] = vector34
										tbl37[25] = vector35

										do
											local values = table.pack(vector36(-169, 733.4, 199.1))
											table.move(values, 1, values.n, 26, tbl37)
										end

										local function fn49()
											local v101 = Utility.GetData(localPlayer)
											return v101 and v101.Inventory.Inventory
										end

										local function fn50(arg)
											local v101 = fn49()
											return v101 ~= nil and v101:FindFirstChild(arg) ~= nil
										end

										local function fn51(arg)
											local worldEvents = Utility.GetData(localPlayer)
											worldEvents = worldEvents and worldEvents:FindFirstChild("WorldEvents")
											return worldEvents ~= nil and worldEvents:FindFirstChild(arg) ~= nil
										end

										local function fn52(arg, arg2)
											local v101 = v84[115]
											arg2 = arg2 or 8

											for i = v101, arg2 * 2 do
												if arg() then
													return true
												end
												task.wait(0.5)
											end

											return arg()
										end

										local function fn53(arg, arg2)
											for i = v84[115], arg do
												local v101 = arg2()
												if v101 then
													return v101
												end
												task.wait(0.5)
											end
										end

										local function fn54()
											local character = localPlayer.Character

											while true do
												local flag23 = flag18

												if not flag18 then
													flag23 = not (character and character:FindFirstChild(v84[167]))
												end

												if flag23 then
													task.wait(0.25)
													character = localPlayer.Character
													continue
												end

												break
											end

											return character.HumanoidRootPart
										end

										local function fn55(arg, arg2)
											local v101 = fn54()
											v101.AssemblyLinearVelocity = Vector3.zero
											v101.CFrame = arg2 and CFrame.new(arg, arg2) or CFrame.new(arg)
										end

										local function fn56(arg, arg2)
											local v101 = fn54()
											v101.Anchored = true
											fn55(arg + Vector3.new(v84[67], 6, 0))
											task.wait(arg2 or v84[26])
											local raycastParams = RaycastParams.new()
											raycastParams.FilterDescendantsInstances = { localPlayer.Character }
											raycastParams.FilterType = Enum.RaycastFilterType.Exclude
											local hit = workspace:Raycast(arg + Vector3.new(0, 12, v84[67]), Vector3.new(0, -80, 0), raycastParams)

											if hit then
												fn55(hit.Position + Vector3.new(0, 3.5, v84[67]))
											end

											v101.Anchored = false
										end

										local function fn57(arg, arg2)
											local v101 = fn54()
											v101.Anchored = true
											fn55(arg + Vector3.new(0, arg2, 0))
											task.wait(0.7)
											v101.Anchored = v84[35]
											task.wait(0.9)
										end

										local function fn58(arg)
											local parent = arg.Parent

											if parent:IsA("BasePart") then
												if n27(2274) <= 12746 then
													return parent.Position
												end

												while v84[126] do
												end
											end

											if parent:IsA("Attachment") then
												return parent.WorldPosition
											end
										end

										local function fn59(arg)
											for _, descendant in ipairs(arg:GetDescendants()) do
												if descendant:IsA("ProximityPrompt") and descendant.Enabled then
													return descendant
												end
											end
										end

										local function fn60(arg, arg2, arg3)
											for _, descendant in ipairs(workspace:GetDescendants()) do
												if descendant:IsA("ProximityPrompt") and descendant.Enabled and descendant.ActionText == arg then
													local v101 = fn58(descendant)
													if v101 and (v101 - arg2).Magnitude <= arg3 then
														return descendant
													end
												end
											end
										end

										local function fn61(arg, arg2, arg3)
											local v101 = fn58(arg)

											if v101 then
												fn55(v101 + arg2, v101)
												task.wait(arg3)
											end

											if firesignal then
												firesignal(arg.PromptButtonHoldBegan, localPlayer)
												task.wait(arg.HoldDuration + 0.25)
												fireproximityprompt(arg)
												task.wait(0.2)
												firesignal(arg.PromptButtonHoldEnded, localPlayer)
											else
												fireproximityprompt(arg)
											end
										end

										local function fn62(arg, arg2)
											fn55(arg2 + Vector3.new(4, 3, 0))

											local v101 = fn53(40, function()
												for _, descendant in ipairs(workspace:GetDescendants()) do
													if descendant.Name == arg and descendant:IsA("Model") then
														local humanoidRootPart = descendant:FindFirstChild("HumanoidRootPart")
														if humanoidRootPart and (humanoidRootPart.Position - arg2).Magnitude < 120 then
															return humanoidRootPart
														end
													end
												end
											end)

											if not v101 then
												return false
											end
											fn55(v101.Position + v101.CFrame.LookVector * v84[26], v101.Position)
											task.wait(1)

											for _, child in ipairs(v101:GetChildren()) do
												if child:IsA("ProximityPrompt") and child.ActionText == "Chat" then
													fireproximityprompt(child)
												end
											end

											task.wait(2.5)
											return true
										end

										local function fn63(arg, arg2)
											local str12 = arg .. " Schematic"
											if fn50(str12) then
												return true
											end
											fn56(arg2)

											local v101 = fn53(30, function()
												for _, v101 in ipairs(CollectionService:GetTagged("StudyProp")) do
													local flag23 = v101:GetAttribute("Item") == arg and fn59(v101)
													if flag23 then
														return flag23
													end
												end
											end)

											if not v101 then
												return false
											end
											local v102 = fn58(v101)

											if v102 then
												fn55(v102 + Vector3.new(3, v84[28], 0), v102)
												task.wait(0.8)
											end

											fireproximityprompt(v101)

											return fn52(function()
												return fn50(str12)
											end, 8)
										end

										local function fn64()
											if fn50("Nightfall Sickles Schematic") then
												return true
											end

											if not localPlayer:GetAttribute("SicklesSewerOpen") then
												for _, v101 in ipairs(tbl36) do
													fn56(v101, v84[28])

													local v102 = fn53(12, function()
														return fn60("Pull", v101, 20)
													end)

													local parent = v102 and v102.Parent and v102.Parent.Parent
													local flag23

													if v102 then
														flag23 = not (parent and parent:GetAttribute("On"))
													else
														flag23 = v102
													end

													if flag23 then
														local v103 = v84[155]
														fn61(v102, Vector3.new(v84[28], 0, v84[67]), v103)
														task.wait(1.5)
													end

													if not localPlayer:GetAttribute("SicklesSewerOpen") then
														continue
													end
													break
												end

												if not fn52(function()
													return localPlayer:GetAttribute("SicklesSewerOpen") == true
												end, 6) then
													return v84[35]
												end
											end

											return fn63("Nightfall Sickles", tbl25.SicklesProp)
										end

										local function fn65()
											for _, v101 in ipairs(tbl37) do
												if not fn50("Nightfall Serpent Katana Schematic") then
													if not fn50("Serpent Key") then
														fn57(v101, 2)

														local v102 = fn53(10, function()
															for _, v102 in ipairs(CollectionService:GetTagged("SerpentKey")) do
																local flag23 = (v102:GetPivot().Position - v101).Magnitude < 15 and fn59(v102)
																if flag23 then
																	return flag23
																end
															end
														end)

														if v102 then
															fn61(v102, Vector3.new(2, 0.5, 0), 1.1)

															fn52(function()
																return fn50("Serpent Key")
															end, 4)
														end
													end

													if fn50("Serpent Key") then
														fn57(tbl25.SerpentBox, v84[31])

														local v102 = fn53(12, function()
															local v102 = CollectionService:GetTagged("SerpentBox")[1]
															return v102 and fn59(v102)
														end)

														if v102 then
															fn61(v102, Vector3.new(2, v84[155], 0), 1.1)

															fn52(function()
																return fn50("Nightfall Serpent Katana Schematic")
															end, 5)
														end
													end

													continue
												end

												break
											end

											return fn50("Nightfall Serpent Katana Schematic")
										end

										local tbl38 = {}
										SimonSaysController.__zhOrig = SimonSaysController.__zhOrig or SimonSaysController.handle

										SimonSaysController.handle = function(arg, ...)
											if flag22 and type(arg) == "table" then
												arg.__at = os.clock()
												table.insert(tbl38, arg)
											end

											return SimonSaysController.__zhOrig(arg, ...)
										end

										local function fn66(arg)
											local ok, result = pcall(Quests.GetPlayerQuestState, localPlayer, arg)
											return ok and result or nil
										end

										local function fn67(arg)
											for _, v101 in ipairs(CollectionService:GetTagged("SimonPlate")) do
												if v101:GetAttribute("SimonIndex") == arg then
													local boundingBox, v102 = v101:GetBoundingBox()
													fn55(boundingBox.Position + Vector3.new(0, v102.Y / v84[119] + 9, 0))
													local character = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass(v84[33])
													task.wait(0.2)
													local n42 = 0

													while character and character.FloorMaterial == Enum.Material.Air and n42 < v84[28] do
														task.wait(0.1)
														n42 += 0.1
													end

													task.wait(0.15)
													return
												end
											end
										end

										local function fn68()
											for i = 1, 4 do
												if fn50("Firstlight Lantern Schematic") then
													return true
												end

												if fn66("Ill walk the order") == "Doing" then
													fn55(tbl25.Isamu + Vector3.new(4, 3, 0))
													task.wait(2)

													for i2 = 1, 9 do
														if fn66("Ill walk the order") == "Doing" then
															fn67(i2)
															task.wait(1)
															continue
														end

														break
													end

													if fn66("Ill walk the order") == "Doing" then
														return false
													end
												end

												local v101 = workspace
												local value2 = Utility.GetData(localPlayer).Quests.LastTime.Value
												local n42 = 30 - v101:GetServerTimeNow() - value2

												if v84[67] < n42 then
													task.wait(n42 + 1)
												end

												table.clear(tbl38)
												local flag23 = v84[35]

												for i2 = 1, 2 do
													if fn62("Lamplighter Isamu", tbl25.Isamu) then
														SignalEvent.ToServer("AddQuest", "Ill walk the order")
														task.wait(3)
														if fn66("Ill walk the order") == "Doing" then
															flag23 = true
															break
														end
													end
												end

												if not flag23 then
													return false
												end
												local n43 = 0

												while not fn50("Firstlight Lantern Schematic") and fn66("Ill walk the order") == "Doing" do
													local v102 = table.remove(tbl38, 1)

													if v102 and v102.Action == "Show" then
														task.wait(math.max(0, v102.__at + (v102.Lead or 0) + #v102.Plates * (v102.Step or 0.6) + v84[13] - os.clock()))

														for _, plate in ipairs(v102.Plates) do
															fn67(plate)
															task.wait(0.35)
														end

														n43 = 0
														continue
													end

													if v102 and v102.Action == "Fail" then
														break
													end

													if not v102 then
														n43 += v84[155]
														if n43 >= 20 then
															break
														end
														task.wait(0.5)
													end
												end

												if fn52(function()
													return fn50("Firstlight Lantern Schematic")
												end, v84[32]) then
													return true
												end
											end

											return fn50("Firstlight Lantern Schematic")
										end

										local function fn69()
											local regions = workspace:FindFirstChild("Humanoids") and workspace.Humanoids:FindFirstChild("Regions")
											if not regions then
												return
											end

											for _, child in ipairs(regions:GetChildren()) do
												local activeNpcs = child:FindFirstChild("ActiveNpcs")
												activeNpcs = activeNpcs and activeNpcs:FindFirstChild("Duelist Hibiki")
												activeNpcs = activeNpcs and activeNpcs:FindFirstChildWhichIsA("Model")
												local humanoid = activeNpcs and activeNpcs:FindFirstChildOfClass("Humanoid")
												if humanoid and humanoid.Health > 0 and activeNpcs:FindFirstChild("HumanoidRootPart") then
													return activeNpcs, humanoid
												end
											end
										end

										local function fn70()
											if fn50("Firstlight Sound Cleavers Schematic") then
												return true
											end

											if not fn69() then
												fn56(tbl25.Hibiki)
												if not fn62("Duelist Hibiki", tbl25.Hibiki) then
													return false
												end
												SignalEvent.ToServer("CleaverDuel")
											end

											local v101 = nil
											local v102 = nil

											for i = 1, 20 do
												v101, v102 = fn69()
												if not v101 then
													task.wait(0.25)
													continue
												end
												break
											end

											if not v101 then
												return v84[35]
											end
											local humanoidRootPart = v101.HumanoidRootPart

											local connection = game:GetService(v84[8]).Heartbeat:Connect(function()
												local v103 = fn30()
												if not v103 or not v101.Parent or v102.Health <= 0 then
													return
												end
												local position = humanoidRootPart.Position
												local n42

												if str8 == "Above" then
													n42 = position + Vector3.new(0, n35, 0)
												elseif str8 == "In Front" then
													n42 = position + humanoidRootPart.CFrame.LookVector * n35
												elseif str8 == "Behind" then
													n42 = position - humanoidRootPart.CFrame.LookVector * n35
												else
													n42 = position - Vector3.new(v84[67], n35, 0)
												end

												local n43 = humanoidRootPart.CFrame.LookVector * n34
												v103.CFrame = CFrame.lookAt(n42 + humanoidRootPart.CFrame.RightVector * n32 + Vector3.new(v84[67], n33, 0) + n43, position)
												v103.AssemblyLinearVelocity = Vector3.zero
												v103.AssemblyAngularVelocity = Vector3.zero
												fn43(str9)

												if v102.Health < v102.MaxHealth then
													pcall(function()
														v102.Health = 0
													end)

													pcall(function()
														v102:TakeDamage(v102.MaxHealth)
													end)
												end
											end)

											local v103 = fn52(function()
												return fn50("Firstlight Sound Cleavers Schematic")
											end, 30)

											connection:Disconnect()
											return v103
										end

										local flag23 = false
										local flag24 = v84[35]

										local function fn71()
											return not fn50("Nightfall Cape Schematic") and not fn50("Lost Cape")
										end

										local function fn72()
											return not fn50("Firstlight Haori Schematic") and not fn50("Lost Outfit")
										end

										local function fn73(arg, arg2)
											local options = lib.Options and lib.Options[arg]
											if type(options) ~= "table" then
												return
											end

											pcall(function()
												options:SetValue(arg2)
											end)

											lib.Flags[arg] = arg2

											if type(options.Callback) == "function" then
												task.spawn(options.Callback, arg2)
											end
										end

										local function fn74()
											if flag23 then
												fn73("AutoFish", false)
											end

											if flag24 then
												fn73("FishPickup", false)
											end

											flag23 = false
											flag24 = false
										end

										local function fn75()
											local v101 = fn71()
											local v102 = fn72()
											flag24 = not fn35("FishPickup")
											flag23 = true
											fn73("FishPickup", true)
											fn73("AutoFish", true)

											while true do
												local flag25 = flag22

												if flag22 then
													flag25 = not (v101 and fn50("Lost Cape") or v102 and fn50("Lost Outfit"))
												end

												if flag25 then
													task.wait(1)
													continue
												end
												break
											end

											fn74()
											return v101 and fn50("Lost Cape") or v102 and fn50("Lost Outfit")
										end

										local function fn76(arg, arg2, arg3, ...)
											if fn50(arg3) then
												return true
											end

											if not fn62(arg, arg2) then
												return false
											end
											SignalEvent.ToServer(...)

											return fn52(function()
												return fn50(arg3)
											end, 8)
										end

										local function fn77(arg, arg2)
											if fn50(arg2) then
												return v84[126]
											end
											fn56(arg + Vector3.new(6, 0, v84[67]))

											local v101 = fn53(20, function()
												return fn60("Dig", arg, 40)
											end)

											if not v101 then
												return false
											end
											local v102 = nil

											for i = 1, 3 do
												fn61(v101, Vector3.new(3, 0, 0), 0.5)

												v102 = fn53(24, function()
													return fn60("Open", arg, 60)
												end)

												local flag25

												if v102 then
													flag25 = v102
												else
													flag25 = not (v101.Parent and v101.Enabled)
												end

												if not flag25 then
													continue
												end
												break
											end

											if not v102 then
												return false
											end
											fn61(v102, Vector3.new(3, 0, v84[67]), 0.5)

											return fn52(function()
												return fn50(arg2)
											end, 8)
										end

										local function fn78(arg)
											for _, v101 in ipairs(Series.CapstoneGate(arg)) do
												if not fn50(v101) then
													return v84[35]
												end
											end

											return true
										end

										local tbl39 = {}

										local function fn79(arg, arg2, arg3)
											table.insert(tbl39, { sch = arg, can = arg2, run = arg3 })
										end

										for _, v101 in ipairs(tbl26) do
											fn79(v101[1] .. " Schematic", nil, function()
												return fn63(v101[1], v101[2])
											end)
										end

										fn79("Nightfall Sickles Schematic", nil, fn64)
										fn79("Nightfall Serpent Katana Schematic", nil, fn65)
										fn79("Firstlight Lantern Schematic", nil, fn68)
										fn79("Firstlight Sound Cleavers Schematic", nil, fn70)

										fn79("Lost Cape or Lost Outfit", function()
											return fn71() or fn72()
										end, fn75)

										fn79("Nightfall Cape Schematic", function()
											return fn50("Lost Cape")
										end, function()
											return fn76("Weaver Hatsu", tbl25.Hatsu, "Nightfall Cape Schematic", "SeriesTrade", "Cape")
										end)

										fn79("Firstlight Haori Schematic", function()
											return fn50("Lost Outfit")
										end, function()
											return fn76("Tailor Omi", tbl25.Omi, "Firstlight Haori Schematic", "SeriesTrade", "Haori")
										end)

										fn79("Firstlight Bladed Wagasa Schematic", function()
											return fn50("Damascus Bladed Wagasa")
										end, function()
											return fn76("Wagasa Maker Genzo", tbl25.Genzo, "Firstlight Bladed Wagasa Schematic", "WagasaGiveSchematic")
										end)

										fn79("Nightfall Gauntlet Schematic", function()
											return require(ReplicatedStorage.CAM.Client.Controllers.GauntletStatuesController).Done() == true
										end, function()
											return fn76("Stonemason Tobei", tbl25.Tobei, "Nightfall Gauntlet Schematic", "GauntletGiveSchematic")
										end)

										fn79("Firstlight War Fans Schematic", function()
											return fn50("Shovel") and fn51("WarFansClue_4")
										end, function()
											if not flag2 then
												return
											end
											return fn77(tbl25.WarFansMound, "Firstlight War Fans Schematic")
										end)

										fn79("Firstlight Tanto Schematic", function()
											return fn50("Shovel") and Series.WornEntry(localPlayer, "Mushroom Lit Lantern") ~= nil
										end, function()
											return fn77(tbl25.TantoMound, "Firstlight Tanto Schematic")
										end)

										for _, v101 in ipairs({ "Firstlight", "Nightfall" }) do
											fn79(v101 .. " Top Schematic", function()
												return fn78(v101)
											end, function()
												return fn76("Blacksmith Togane", tbl25.Togane, v101 .. " Top Schematic", "SeriesCapstone", v101)
											end)
										end

										tbl17.AutoSchematics = v99:AddToggle("AutoSchematics", {
											Text = "Auto Schematic Farm (Premium)",
											Description = "Goes around and grabs every schematic you can get right now. Leave it on and it keeps picking up new ones",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("AutoSchematics")
												end
											end,
										})

										fn33(function()
											flag22 = false

											if v100 then
												if n27(4979) < 15070 then
													pcall(task.cancel, v100)
													v100 = nil
												else
													while true do
													end
												end
											end

											fn74()

											if SimonSaysController.__zhOrig then
												SimonSaysController.handle = SimonSaysController.__zhOrig
											end
										end)
									end

									fn48()
								end
							end

							do
								local function fn48()
									local v99 = tbl19.Questlines:AddGroupbox("Delivery Quests")
									local Shovel = tbl19.Questlines:AddGroupbox("Shovel")
									local Infirmary = tbl19.Questlines:AddGroupbox("Infirmary")
									local ReplicatedStorage = game:GetService("ReplicatedStorage")
									local SignalEvent = require(ReplicatedStorage.Communication.ServerAndClient.Signals.SignalEvent)
									local Utility = require(ReplicatedStorage.CAM.Global.Utility)
									local Quests = require(ReplicatedStorage.CAM.Global.Subsets.Gameplay.Quests)
									local regions = require(ReplicatedStorage.Regions).Regions
									local flag22 = false
									local v100 = nil
									local flag23 = false
									local v101 = nil
									local flag24 = false
									local flag25 = false
									local v102 = nil
									local flag26 = false
									local flag27 = false
									local v103 = nil
									local flag28 = false
									local flag29 = false
									local flag30 = false
									local flag31 = false
									local flag32 = false
									local flag33 = false
									local v104 = nil

									local function fn49()
										if v104 then
											v104:Disconnect()
											v104 = nil
										end
									end

									local function fn50()
										return Utility.GetData(localPlayer)
									end

									local function fn51(arg)
										local v105 = fn50().Inventory.Inventory:FindFirstChild(arg)
										local amount = v105 and v105:FindFirstChild("Amount")
										return v105 == nil and 0 or amount == nil and 1 or amount.Value
									end

									local function fn52(arg, arg2)
										local v105 = arg2 or v84[70]

										for i = 1, v105 * 2 do
											if arg() then
												return v84[126]
											end
											task.wait(0.5)
										end

										return arg()
									end

									local function fn53()
										local character = localPlayer.Character

										while true do
											local flag34 = flag18

											if not flag18 then
												flag34 = not (character and character:FindFirstChild("HumanoidRootPart"))
											end

											if flag34 then
												task.wait(0.25)
												character = localPlayer.Character
												continue
											end

											break
										end

										return character.HumanoidRootPart
									end

									local function fn54(arg, arg2)
										local v105 = fn53()
										v105.AssemblyLinearVelocity = Vector3.zero
										v105.CFrame = arg2 and CFrame.new(arg, arg2) or CFrame.new(arg)
									end

									local function fn55(arg, arg2)
										local v105 = fn53()
										v105.Anchored = v84[126]
										fn54(arg + Vector3.new(0, v84[177], v84[67]))
										task.wait(arg2 or 3)
										local raycastParams = RaycastParams.new()
										raycastParams.FilterDescendantsInstances = { localPlayer.Character }
										raycastParams.FilterType = Enum.RaycastFilterType.Exclude
										local hit = workspace:Raycast(arg + Vector3.new(0, 12, 0), Vector3.new(v84[67], -80, 0), raycastParams)

										if hit then
											fn54(hit.Position + Vector3.new(0, 3.5, 0))
										end

										v105.Anchored = false
									end

									local function fn56(arg)
										for _, region in pairs(regions) do
											local v105 = pairs
											local npcs = region.Npcs or {}

											for _, npc in v105(npcs) do
												local v106 = v84[162]

												if type(npc) == v106 and npc.Name == arg and type(npc.Spawns) == "table" then
													local tbl25 = {}

													for _, spawn_ in pairs(npc.Spawns) do
														local insert = table.insert
														spawn_ = typeof(spawn_) == "CFrame" and spawn_.Position or spawn_
														insert(tbl25, spawn_)
													end

													return tbl25
												end
											end
										end

										return {}
									end

									local tbl25 = {
										["Angler Runo"] = Vector3.new(-561, 796, 684),
										Betty = Vector3.new(714, 1121, -808),
										["Blacksmith Togane"] = Vector3.new(1732, 694, -765),
										Chaka = Vector3.new(471, 1146, -1260),
										["Demon Delroy"] = Vector3.new(140, 1254, -1911),
										["Demon Mokuro"] = Vector3.new(-1948, 28, 374),
										["Demon Slayer Goro"] = Vector3.new(-872, 235, 318),
										["Demon Slayer Mitsu"] = Vector3.new(-824, 1382, -2538),
										["Dock Master Sofen"] = Vector3.new(-161, 796, 703),
										Elara = Vector3.new(428, 941, 507),
										["Estate Worker Niko"] = Vector3.new(374, 942, 523),
										["Flame Trainer Rengu"] = Vector3.new(-968, 1029, 1188),
										Ginzo = Vector3.new(274, 942, 528),
										["Harvester of Souls Zurinyz"] = Vector3.new(-1213, 1387, -2372),
										["Iceveil Guard Shiro"] = Vector3.new(-107, 1349, -2499),
										["Insect Trainer Shinora"] = Vector3.new(-1799, 348, -189),
										Jugg = Vector3.new(488, 874, 1008),
										Kazu = Vector3.new(-626, 1242, -1138),
										Kona = Vector3.new(-792, 1260, -v84[9]),
										Krue = Vector3.new(-425, 1244, -952),
										["Lamplighter Isamu"] = Vector3.new(1082, 1426, -749),
										Liv = Vector3.new(657, 1019, 140),
										Lucy = Vector3.new(-615, 1258, -1177),
										MoldySugar = Vector3.new(-702, 1243, -983),
										Noote = Vector3.new(-516, 1243, -1251),
										Ren = Vector3.new(-1795, 312, -85),
										Rin = Vector3.new(432, 1018, 73),
										["Serpent Trainer Obari"] = Vector3.new(37, 1311, -1180),
										["Shady Individual Rooyi"] = Vector3.new(-773, 965, -9),
										Shiori = Vector3.new(-1814, 312, -101),
										["Shrine Messenger Akio"] = Vector3.new(-207, 1350, -2423),
										["Soryu Expert Kazuma"] = Vector3.new(-769, 909, 303),
										["Sound Trainer Tengai"] = Vector3.new(465, 1491, -3273),
										["Stone Trainer Gyorei"] = Vector3.new(2579, 1096, -828),
										["Tai Chi Expert Renjiro"] = Vector3.new(1883, 687, -761),
										["Thunder Trainer Zentaro"] = Vector3.new(1970, 1660, -610),
										Tom = Vector3.new(507, 1121, -970),
										Wagwan = Vector3.new(724, 1019, -802),
										["Water Trainer Urokodaki"] = Vector3.new(667, 1023, -228),
										["Wind Trainer Saneri"] = Vector3.new(-276, 1187, -3437),
										["Wounded Slayer Tomoi"] = Vector3.new(485, 1223, -1813),
									}

									local function fn57(arg)
										local regions2 = workspace:FindFirstChild("Debree") and workspace.Debree:FindFirstChild("Regions")
										local v105 = ipairs
										regions2 = regions2 and regions2:GetChildren() or {}

										for _, v106 in v105(regions2) do
											local stationaryNpcs = v106:FindFirstChild("StationaryNpcs")
											stationaryNpcs = stationaryNpcs and stationaryNpcs:FindFirstChild(arg)
											stationaryNpcs = stationaryNpcs and stationaryNpcs:FindFirstChild("HumanoidRootPart")
											local v107 = ipairs
											local children = stationaryNpcs and stationaryNpcs:GetChildren() or {}

											for _, child in v107(children) do
												if child:IsA("ProximityPrompt") and child.ActionText == "Chat" then
													return stationaryNpcs, child
												end
											end
										end
									end

									local function fn58(arg)
										for _, descendant in ipairs(workspace:GetDescendants()) do
											local humanoidRootPart = descendant.Name == arg and descendant:IsA("Model") and descendant:FindFirstChild("HumanoidRootPart")
											local v105 = ipairs
											local children = humanoidRootPart and humanoidRootPart:GetChildren() or {}

											for _, child in v105(children) do
												if child:IsA("ProximityPrompt") and child.ActionText == "Chat" then
													return humanoidRootPart, child
												end
											end
										end
									end

									local function fn59(arg)
										local v105, v106 = fn57(arg)
										local v107, v108

										if not v105 then
											local v109 = tbl25[arg] or fn56(arg)[1]
											if not v109 then
												return v84[35]
											end
											local v110 = fn53()
											v110.Anchored = true
											fn54(v109 + Vector3.new(0, 8, 0))

											for i = 1, 30 do
												v105, v106 = fn57(arg)
												if not v105 then
													task.wait(0.2)
													continue
												end
												break
											end

											if not v105 then
												v105, v106 = fn58(arg)
											end

											v110.Anchored = false
											if not v105 then
												return false
											end
											v107 = v105
											v108 = v106
										else
											v107 = v105
											v108 = v106
										end

										fn54(v107.Position + v107.CFrame.LookVector * v84[26], v107.Position)
										task.wait(0.6)
										fireproximityprompt(v108)
										task.wait(2)
										return true
									end

									local function fn60(arg)
										local name = Quests.Holder[arg].QuestInstance.Name

										for _, child in ipairs(fn50().Quests.Holder:GetChildren()) do
											if child.Name == arg or child.Name == name then
												return child
											end
										end
									end

									local function fn61(arg)
										local value2 = arg:FindFirstChild("Value")
										local max = arg:FindFirstChild("Max")
										return value2 and value2.Value or 0, max and max.Value or 1
									end

									local function fn62(arg, arg2)
										local v105 = fn60(arg)
										local tasks = v105 and v105:FindFirstChild("Tasks") and v105.Tasks:FindFirstChild(arg2)
										return tasks and fn61(tasks) or 0
									end

									local function fn63(arg)
										local ok, result = pcall(Quests.GetPlayerQuestState, localPlayer, arg)
										return ok and result or nil
									end

									local function fn64(arg)
										if fn60(arg) then
											return v84[126]
										end
										local offerNpc = Quests.Holder[arg].OfferNpc

										for i = 1, 2 do
											if not fn59(offerNpc) then
												return false
											end
											local flag34 = false

											for i2 = v84[115], 80 do
												local ok, result, result2 = pcall(Quests.CanAddQuest, localPlayer, arg)
												if ok and result == true then
													break
												end

												if not (ok and result == false and result2 == true) then
													return false
												end
												task.wait(0.5)
												flag34 = true
											end

											if flag34 and not fn59(offerNpc) then
												return false
											end
											SignalEvent.ToServer("AddQuest", arg)
											if fn52(function()
												return fn60(arg) ~= nil
											end, 6) then
												return v84[126]
											end
										end

										return false
									end

									tbl17.AutoDeliveryQuests = v99:AddToggle("AutoDeliveryQuests", {
										Text = "Auto Delivery Quests (Lv 0+) (Premium)",
										Description = "Auto Does Delivery Quests for you",
										Default = false,
										Callback = function(arg)
											if arg then
												fn36("AutoDeliveryQuests")
											end
										end,
									})

									local function fn65()
										if flag24 then
											flag24 = false
											v86 -= 1
										end
									end

									tbl17.GetShovel = Shovel:AddToggle("GetShovel", {
										Text = "Get Shovel (Lv 100) (Premium)",
										Description = "Auto Does Shovel Questline for you",
										Default = v84[35],
										Callback = function(arg)
											if arg then
												fn36("GetShovel")
											end
										end,
									})

									local function fn66()
										if flag26 then
											flag26 = false
											v86 -= 1
										end
									end

									tbl17.AutoShiori = Infirmary:AddToggle("AutoShiori", {
										Text = "Auto Infirmary Quest (Lv 70) (Premium)",
										Description = "Auto Does Shiori's Infirmary Quest for you",
										Default = false,
										Callback = function(arg)
											if arg then
												fn36("AutoShiori")
											end
										end,
									})

									local v105 = tbl19.Fishing:AddGroupbox("Fishing Rod")
									local v106 = tbl19.Fishing:AddGroupbox("Fish Quests")
									local tbl26 = { "Legendary Fishing Rod", "Rare Fishing Rod", "Basic Fishing Rod" }
									local tbl27 = { "One", "Two", "Three", "Four", "Five" }
									local flag34 = false
									local flag35 = false
									local v107 = nil
									local flag36 = false
									local v108 = nil

									local function fn67()
										for _, v109 in ipairs(tbl26) do
											if fn51(v109) > 0 then
												return v109
											end
										end
									end

									local function fn68(arg)
										local v109 = arg and fn50().Inventory.Inventory:FindFirstChild(arg)
										local value2 = v109 and v109:FindFirstChild("Id") and v109.Id.Value
										if not value2 then
											return
										end
										local fishSlot = lib.Options and lib.Options.FishSlot
										local str12 = tbl27[tonumber(fishSlot and fishSlot.Value) or 4] or "Four"

										if fn50().Inventory.Toolbar[str12].Value ~= value2 then
											SignalEvent.ToServer("Toolbar_Equip", str12, value2)
										end
									end

									local function fn69()
										if fn67() then
											fn68(fn67())
											return "you already have a rod, it's in your rod slot"
										end

										if fn63("Ill find the permit stamp(Lv 45)") ~= "Done" then
											if not fn64("Ill find the permit stamp(Lv 45)") then
												return "couldn't take Sofen's quest"
											end

											if fn62("Ill find the permit stamp(Lv 45)", "Permit Stamp found") < 1 then
												local v109 = Quests.Holder["Ill find the permit stamp(Lv 45)"].TaskSpecs["Permit Stamp found"].Positions[1]
												fn55(v109, 2.5)
												fn54(v109 + Vector3.new(2, v84[119], 0), v109)
												task.wait(v84[155])
												SignalEvent.ToServer("QuestProgress", "Ill find the permit stamp(Lv 45)", "Permit Stamp found", 1)

												if not fn52(function()
													local v110 = v84[115]
													return fn62("Ill find the permit stamp(Lv 45)", "Permit Stamp found") >= v110
												end, 5) then
													return "couldn't grab the permit stamp"
												end
											end

											if not fn59("Dock Master Sofen") then
												return "couldn't find Sofen"
											end
											SignalEvent.ToServer("QuestProgress", "Ill find the permit stamp(Lv 45)", "Return to Sofen")
											if not fn52(function()
												return fn63("Ill find the permit stamp(Lv 45)") == "Done"
											end, 8) then
												return "Sofen didn't take the stamp"
											end
										end

										local wen = require(ReplicatedStorage.Items.Fishing["Basic Fishing Rod"]).Price.Wen or 0
										if fn50().Wen.Value < wen then
											return ("the rod costs %d Wen"):format(wen)
										end

										if not fn59("Fisherman Jeso") then
											return "couldn't find Jeso"
										end
										SignalEvent.ToServer("PurchaseFromShop", "Basic Fishing Rod", 1)
										if not fn52(function()
											return fn51("Basic Fishing Rod") > 0
										end, v84[177]) then
											return "Jeso didn't sell the rod"
										end
										fn68("Basic Fishing Rod")
									end

									v105:AddButton({
										Text = "Get Fishing Rod",
										Description = "Gets the fishing permit and buys the rod for you",
										Func = function()
											if flag34 then
												return
											end
											flag34 = v84[126]

											task.spawn(function()
												fn34("Getting the fishing rod", 3)
												local ok, fishingRod = pcall(fn69)
												flag34 = false
												local v109 = fn30()

												if v109 then
													v109.Anchored = v84[35]
												end

												if not ok then
													fn34("Fishing rod: " .. tostring(fishingRod), 5)
												elseif fishingRod then
													fn34("Fishing rod: " .. fishingRod, 5)
												else
													fn34("Got the fishing rod!", 5)
												end
											end)
										end,
									})

									tbl17.AutoUpgradeRod = v105:AddToggle("AutoUpgradeRod", {
										Text = "Auto Upgrade Rod (Premium)",
										Description = "Buys the Rare Fishing Rod as soon as you can afford it and puts it in your rod slot",
										Default = v84[35],
										Callback = function(arg)
											if arg then
												fn36("AutoUpgradeRod")
											end
										end,
									})

									tbl17.AutoFishQuests = v106:AddToggle("AutoFishQuests", {
										Text = "Auto Fish Quests (Premium)",
										Description = "Fishes for you and hands in every fish quest you have the catch for",
										Default = false,
										Callback = function(arg)
											if arg then
												fn36("AutoFishQuests")
											end
										end,
									})

									local Breathing = tbl19.Questlines:AddGroupbox("Breathing")

									local tbl28 = {
										Meditation = { folder = "Meditation", at = Vector3.new(-1635, 316, -194) },
										Pushups = { folder = "Pushups", at = Vector3.new(-1680, 316, -196) },
										["Cup Game"] = { folder = "Cup Game", at = Vector3.new(-1591, 316, -206) },
										["Target Shooting"] = { folder = "Aim Training", at = Vector3.new(-1500, 315, -155) },
										["Boulder Split"] = { folder = "Boulder Split", at = Vector3.new(-1047, 1130, -617) },
										["Boulder Push"] = { folder = "Boulder Push", at = Vector3.new(-312, 1072, -570) },
										Squat = { folder = "Squat Rack" },
									}

									local str12 = "Serpent"

									local function fn70()
										local tbl29 = {}

										for k in pairs(Quests.Holder) do
											local match = tostring(k):match("^Ill learn (.+) Breathing%(Lv 25%)$")

											if match then
												table.insert(tbl29, match)
											end
										end

										table.sort(tbl29)
										return tbl29
									end

									require(ReplicatedStorage.CAM.Client.Modules.ItemSources)

									Breathing:AddDropdown("BreathingPick", {
										Text = "Breathing",
										Description = "Which breathing to learn",
										Values = fn70(),
										Default = "Serpent",
										Multi = false,
										Callback = function(arg)
											str12 = arg or "Serpent"
										end,
									})

									local function fn71()
										if flag28 then
											flag28 = false
											v86 -= v84[115]
										end
									end

									tbl17.AutoBreathing = Breathing:AddToggle("AutoBreathing", {
										Text = "Auto Breathing Quest (Lv 25) (Premium)",
										Description = "Auto does the breathing quest you picked",
										Default = v84[35],
										Callback = function(arg)
											if arg then
												fn36("AutoBreathing")
											end
										end,
									})

									local function fn72()
										local v109 = tbl19.Questlines:AddGroupbox("Smart Progression")
										require(ReplicatedStorage.CAM.Global.Caps)
										local expPerLevel = require(ReplicatedStorage.CAM.Global.gameSettings).expPerLevel
										local v110 = nil

										tbl17.SmartProgression = v109:AddToggle("SmartProgression", {
											Text = "Smart Progression (Lv 1+) (Premium)",
											Description = "Levels you up with the best quest for your level, new quests first",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("SmartProgression")
												end

												if not flag2 then
													return
												end
											end,
										})

										v109:AddButton({
											Text = "Best Quest For Me (Premium)",
											Description = "Tells you the best quest for your level right now",
											Func = function()
												fn36()
											end,
										})

										fn33(function()
											flag32 = false

											if v110 then
												pcall(task.cancel, v110)
												v110 = nil
											end
										end)
									end

									fn72()

									local function fn73()
										local v109 = tbl19.Questlines:AddGroupbox("Ouwigahara & Escort")
										local v110 = nil

										v109:AddButton({
											Text = "Unlock Ouwigahara (Lv 65) (Premium)",
											Description = "Does Togane's forge quest and opens the Ouwigahara portal for you",
											Func = function()
												fn36()
											end,
										})

										tbl17.AutoEscortAkio = v109:AddToggle("AutoEscortAkio", {
											Text = "Akio's Windy Peak Escort (Lv 105) (Premium)",
											Description = "Walks Akio to Windy Peak and fights off every ambush for you",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("AutoEscortAkio")
												end
											end,
										})

										fn33(function()
											flag33 = v84[35]

											if v110 then
												pcall(task.cancel, v110)
												v110 = nil
											end
										end)
									end

									fn73()

									local function fn74()
										local v109 = tbl19.Questlines:AddGroupbox("Fighting Style")
										local v110 = nil
										local flag37 = false
										local flag38 = nil
										local tbl29 = {}

										for k in pairs(Quests.Holder) do
											local match = tostring(k):match("^Ill learn the (.+) Style%(Lv %d+%)$")

											if match then
												tbl29[match] = k
											end
										end

										local function fn75()
											local tbl30 = {}

											for k in pairs(tbl29) do
												table.insert(tbl30, k)
											end

											table.sort(tbl30)
											return tbl30
										end

										v109:AddDropdown("FightingStylePick", {
											Text = "Fighting Style",
											Description = "Which fighting style to learn",
											Values = fn75(),
											Default = nil,
											Multi = false,
											Callback = function(arg)
												flag38 = arg ~= "" and arg or nil
											end,
										})

										local function fn76()
											if flag37 then
												flag37 = v84[35]
												v86 -= 1
											end
										end

										tbl17.AutoFightingStyle = v109:AddToggle("AutoFightingStyle", {
											Text = "Auto Fighting Style Quest (Lv 62+) (Premium)",
											Description = "Auto Does the Fighting Style Quest for you",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("AutoFightingStyle")
												end
											end,
										})

										fn33(function()
											flag31 = false

											if v110 then
												pcall(task.cancel, v110)
												v110 = nil
											end

											fn76()
										end)
									end

									fn74()

									local function fn75()
										local v109 = tbl19.DemonProg:AddGroupbox("Become Demon")
										local v110 = tbl19.DemonProg:AddGroupbox("Demon Art")
										local Souls = tbl19.DemonProg:AddGroupbox("Souls")
										game:GetService("RunService")
										local MuzanSettings = require(ReplicatedStorage.CAM.Global.MuzanSettings)
										require(ReplicatedStorage.CAM.Global.Subsets.Gameplay.InCombat)
										local tbl29 = {}
										local vector = Vector3.new(55, 826.5, 781.5)
										local vector2 = Vector3.new(1920.6, 599, -881)
										local vector3 = Vector3.new
										tbl29[1] = vector
										tbl29[2] = vector2

										do
											local values = table.pack(vector3(-687, 1380.5, -2606.5))
											table.move(values, 1, values.n, 3, tbl29)
										end

										if typeof(MuzanSettings.HigoshimaSpawn) == "CFrame" then
										end

										local v111 = nil
										local flag37 = false
										local flag38 = false
										local v112 = nil
										local v113 = nil
										local v114 = nil
										local v115 = nil
										local v116 = nil

										local function fn76()
											if flag37 then
												flag37 = false
												v86 -= 1
											end
										end

										tbl17.AutoBecomeDemon = v109:AddToggle("AutoBecomeDemon", {
											Text = "Auto Become Demon (Premium)",
											Description = "Becomes Demon For you",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("AutoBecomeDemon")
												end
											end,
										})

										local v117 = nil
										local flag39 = nil

										local function fn77()
											local tbl30 = {}

											for k in pairs(Quests.Holder) do
												local match = tostring(k):match("^I will train my (.+) core$")

												if match then
													table.insert(tbl30, match)
												end
											end

											table.sort(tbl30)
											return tbl30
										end

										v110:AddDropdown("DemonArtPick", {
											Text = "Demon Art",
											Description = "Which Demon Art to train",
											Values = fn77(),
											Default = nil,
											Multi = false,
											Callback = function(arg)
												flag39 = arg ~= "" and arg or nil
											end,
										})

										tbl17.AutoDemonArt = v110:AddToggle("AutoDemonArt", {
											Text = "Auto Demon Art Quest (Premium)",
											Description = "Auto Does the Demon Art Quest for you",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("AutoDemonArt")
												end
											end,
										})

										local function fn78()
											flag38 = v84[35]
											flag20 = false

											if v112 then
												pcall(task.cancel, v112)
												v112 = nil
											end

											if v113 then
												v113:Disconnect()
												v113 = nil
											end

											if v114 then
												v114:Disconnect()
												v114 = nil
											end

											v115 = nil
											v116 = nil
										end

										tbl17.AutoSoul = Souls:AddToggle("AutoSoul", {
											Text = "Auto Eat Souls (Premium)",
											Description = "Farms bears and eats every soul they drop",
											Default = false,
											Callback = function(arg)
												if arg then
													fn36("AutoSoul")
												end
											end,
										})

										fn33(function()
											flag29 = false
											flag30 = false

											if v111 then
												pcall(task.cancel, v111)
												v111 = nil
											end

											if v117 then
												pcall(task.cancel, v117)
												v117 = nil
											end

											fn76()
											fn78()
										end)
									end

									fn75()

									fn33(function()
										local v109 = v84[35]
										flag22 = false
										flag23 = v109
										flag25 = false

										if v100 then
											pcall(task.cancel, v100)
											v100 = nil
										end

										if v101 then
											pcall(task.cancel, v101)
											v101 = nil
										end

										if v102 then
											pcall(task.cancel, v102)
											v102 = nil
										end

										flag35 = false
										flag36 = false
										flag27 = false

										if v103 then
											pcall(task.cancel, v103)
											v103 = nil
										end

										fn71()

										if v107 then
											pcall(task.cancel, v107)
											v107 = nil
										end

										if v108 then
											pcall(task.cancel, v108)
											v108 = nil
										end

										fn49()
										fn65()
										fn66()
									end)
								end

								fn48()
							end

							do
								local function fn48()
									local v99 = tbl19.Questlines:AddGroupbox("Final Selection")
									local ReplicatedStorage = game:GetService("ReplicatedStorage")
									local SignalEvent = require(ReplicatedStorage.Communication.ServerAndClient.Signals.SignalEvent)
									local Utility = require(ReplicatedStorage.CAM.Global.Utility)
									local Quests = require(ReplicatedStorage.CAM.Global.Subsets.Gameplay.Quests)

									local tbl25 = {
										"Locate Rem",
										"Help Rem",
										"Find Vael",
										"Defeat Demons for Vael",
										"Find Klien",
										"Speak with Klien",
										"Find Rika",
										"Treat Klien",
										"Find Mizuto",
										"Defeat Lost",
										"The Dungeon",
										"Find Lavato",
										"Mountain Survival",
										"Rescue and Hold the Zone",
										"Find Steve",
										"Defeat the Hand Demon",
									}

									local tbl26 = { LesserDemon = "Lesser Demon", Lost = "Lost", HandDemon = "Hand Demon" }
									local tbl27 = {}
									local vector = Vector3.new(-6617, 39, 2518)
									local vector2 = Vector3.new(-5500, 39, 1607)
									local vector3 = Vector3.new(-3821, 39, 1628)
									local vector4 = Vector3.new
									tbl27[1] = vector
									tbl27[2] = vector2
									tbl27[3] = vector3

									do
										local values = table.pack(vector4(-5191, 39, 1011))
										table.move(values, 1, values.n, 4, tbl27)
									end

									local vector5 = Vector3.new(-68, 890, 4076)
									local vector6 = Vector3.new(124.2, 1042.3, 2990.3)
									local flag22 = v84[35]
									local thread = nil
									local connection = nil
									local cframe = nil
									local v100 = nil
									local flag23 = nil

									local function fn49()
										return Utility.GetData(localPlayer)
									end

									local function fn50()
										if n24 >= 8226 then
											while v84[126] do
											end
										end

										return ReplicatedStorage["Minigames Place"].Content["Final Selection"].Npcs
									end

									local function fn51(arg)
										local v101 = fn49().Inventory.Inventory:FindFirstChild(arg)
										local amount = v101 and v101:FindFirstChild("Amount")
										return v101 == nil and 0 or amount == nil and 1 or amount.Value
									end

									local function fn52(arg, arg2)
										local n42 = arg2 or 8

										while n42 > 0 and flag22 and not arg() do
											task.wait(0.25)

											if not flag18 then
												n42 -= 0.25
											end
										end

										return arg()
									end

									local function fn53(arg, arg2, arg3)
										if not flag2 then
											return
										end
										cframe = arg2 and CFrame.new(arg, arg2) or CFrame.new(arg)
										local v101 = fn52

										local function fn54()
											return false
										end

										v101(fn54, arg3 or 1.5)
									end

									local function fn54(arg)
										if firesignal and arg.HoldDuration > 0 then
											firesignal(arg.PromptButtonHoldBegan, localPlayer)
											task.wait(arg.HoldDuration + v84[13])
											fireproximityprompt(arg)
											task.wait(0.2)
											firesignal(arg.PromptButtonHoldEnded, localPlayer)
										else
											fireproximityprompt(arg)
										end
									end

									local function fn55(arg)
										return fn49().Quests.Holder:FindFirstChild(Quests.Holder[arg].QuestInstance.Name)
									end

									local function fn56()
										for _, v101 in ipairs(tbl25) do
											local v102 = fn55(v101)
											if v102 then
												return v101, v102
											end
										end
									end

									local function fn57(arg)
										local value2 = arg:FindFirstChild("Value")
										local max = arg:FindFirstChild("Max")
										return value2 and value2.Value or 0, max and max.Value or 1
									end

									local function fn58(arg, arg2)
										local v101 = fn55(arg)
										local tasks = v101 and v101:FindFirstChild("Tasks") and v101.Tasks:FindFirstChild(arg2)
										if not tasks then
											return true
										end
										local v102, v103 = fn57(tasks)
										return v102 >= v103
									end

									local function fn59(arg, arg2)
										local tasks = arg2:FindFirstChild("Tasks")
										if not tasks then
											return nil
										end
										local tasks2 = Quests.Holder[arg].QuestInstance.Tasks

										for _, child in ipairs(tasks:GetChildren()) do
											if not fn58(arg, child.Name) then
												local need = tasks2:FindFirstChild(child.Name)
												need = need and need:FindFirstChild("Need")
												if not need or fn58(arg, need.Value) then
													return child
												end
											end
										end
									end

									local function fn60(arg)
										local ok, result = pcall(require, fn50():FindFirstChild(arg))
										return ok and type(result) == "table" and result or nil
									end

									local function fn61(arg)
										local v101 = fn60(arg)
										local spawns = v101 and v101.Spawns and v101.Spawns[1]
										return typeof(spawns) == "CFrame" and spawns.Position or spawns
									end

									local function fn62(arg)
										for _, child in ipairs(workspace.Debree.Regions:GetChildren()) do
											local stationaryNpcs = child:FindFirstChild("StationaryNpcs")
											stationaryNpcs = stationaryNpcs and stationaryNpcs:FindFirstChild(arg)
											if stationaryNpcs and stationaryNpcs:FindFirstChild(v84[167]) then
												return stationaryNpcs.HumanoidRootPart
											end
										end
									end

									local function fn63(arg)
										local v101 = fn61(arg)
										if not v101 then
											return false
										end
										fn53(v101 + Vector3.new(4, v84[32], 0), nil, 2.5)
										local v102 = nil

										fn52(function()
											v102 = fn62(arg)
											return v102 ~= nil
										end, 8)

										if not v102 then
											return v84[35]
										end
										fn53(v102.Position + v102.CFrame.LookVector * 4, v102.Position, 1)

										for _, child in ipairs(v102:GetChildren()) do
											if child:IsA("ProximityPrompt") and child.ActionText == "Chat" then
												fireproximityprompt(child)
											end
										end

										task.wait(2.5)
										return true
									end

									local function fn64(arg)
										local v101 = ipairs
										local v102 = fn50()

										for _, child in v101(v102:GetChildren()) do
											local v103 = fn60(child.Name)
											local flag24

											if v103 then
												local v104 = v84[162]
												flag24 = type(v103.Shop) == v104
											else
												flag24 = v103
											end

											flag24 = flag24 and v103.Shop[arg] and fn63(child.Name)

											if flag24 then
												SignalEvent.ToServer("PurchaseFromShop", arg, 1)

												return fn52(function()
													local v104 = v84[67]
													return fn51(arg) > v104
												end, 5)
											end
										end

										if not flag2 then
											return
										end
										return false
									end

									local function fn65(arg)
										local parent = arg and arg.Parent and arg:FindFirstChildOfClass(v84[33])
										return parent ~= nil and parent.Health > v84[67] and arg:FindFirstChild("HumanoidRootPart") ~= nil
									end

									local function fn66(arg, arg2, arg3)
										local v101 = nil
										local v102 = nil

										for _, descendant in ipairs(workspace.Humanoids:GetDescendants()) do
											if descendant:IsA("Model") and descendant.Name == arg and fn65(descendant) then
												local magnitude = (descendant.HumanoidRootPart.Position - arg2).Magnitude

												if magnitude < arg3 and (not v101 or magnitude < v101) then
													v101 = magnitude
													v102 = descendant
												end
											end
										end

										return v102
									end

									local function fn67(arg)
										local position = arg.Position
										local cFrame = arg.CFrame
										local n42

										if str8 == "Above" then
											n42 = position + Vector3.new(0, n35, 0)
										elseif str8 == "In Front" then
											n42 = position + cFrame.LookVector * n35
										elseif str8 == "Behind" then
											n42 = position - cFrame.LookVector * n35
										else
											n42 = position - Vector3.new(v84[67], n35, 0)
										end

										local n43 = n42 + cFrame.RightVector * n32
										local n44 = cFrame.LookVector * n34
										return n43 + Vector3.new(v84[67], n33, 0) + n44
									end

									local function fn68()
										if flag18 then
											return
										end
										local v101 = fn30()
										if not v101 then
											return
										end

										if v100 then
											if not fn65(v100) then
												return
											end
											local humanoidRootPart = v100.HumanoidRootPart
											v101.Anchored = false
											v101.CFrame = CFrame.lookAt(fn67(humanoidRootPart), humanoidRootPart.Position)
											v101.AssemblyLinearVelocity = Vector3.zero
											v101.AssemblyAngularVelocity = Vector3.zero
											fn43(str9)
										elseif cframe then
											v101.Anchored = v84[35]
											v101.CFrame = cframe
											v101.AssemblyLinearVelocity = Vector3.zero
										end
									end

									local function fn69(arg, arg2, arg3)
										if arg2 then
											fn53(arg2, nil, 2)
										end

										cframe = nil
										local n42 = 0

										while flag22 and not arg3() do
											local v101 = fn30()

											if v101 then
												local rogueDemon = fn66("Rogue Demon", v101.Position, 150)

												if not fn65(v100) or rogueDemon and v100.Name ~= "Rogue Demon" then
													v100 = rogueDemon or fn66(arg, v101.Position, 400)
												end
											end

											if v100 then
												n42 = 0
											else
												n42 += 0.25

												if n42 >= 8 and arg2 and not flag18 then
													fn53(arg2, nil, 2)
													cframe = nil
													n42 = 0
												end
											end

											task.wait(0.25)
										end

										v100 = nil
									end

									local function fn70(arg, arg2, arg3)
										if arg3.RequiredItem and fn51(arg3.RequiredItem) < 1 then
											fn64(arg3.RequiredItem)
										end

										for i = v84[115], 3 do
											if fn63(arg3.TargetNpc) then
												SignalEvent.ToServer("QuestProgress", arg, arg2.Name)
											end

											if fn52(function()
												return fn58(arg, arg2.Name)
											end, 5) then
												return
											end
										end
									end

									local function fn71(arg, arg2, arg3)
										local v101 = ipairs
										local v102 = v84[162]
										local positions = type(arg3.Positions) == v102 and arg3.Positions or {}

										for k, position in v101(positions) do
											if fn58(arg, arg2.Name) or not flag22 then
												return
											end
											fn53(position + Vector3.new(v84[119], 3, 0), position, 1.5)
											local v103 = fn57(arg2)
											SignalEvent.ToServer("QuestProgress", arg, arg2.Name, k)

											fn52(function()
												return not arg2.Parent or fn57(arg2) > v103
											end, 3)
										end
									end

									local function fn72(arg, arg2)
										local parkourTraining = workspace.Map.DetachedMaps:FindFirstChild("ParkourTraining")
										if not parkourTraining then
											return
										end

										local function fn73()
											return localPlayer.PlayerGui.ComponentsHolder:FindFirstChild("ParkourTrainingUI", true) ~= nil
										end

										if not fn73() then
											local v101 = v84[28]
											fn53(Vector3.new(-5731, 50, 1446), Vector3.new(-5731, 45, 1440), v101)
											local ref = nil

											fn52(function()
												local parkourDungeon = workspace.Debree:FindFirstChild("Parkour Dungeon")
												ref = parkourDungeon and parkourDungeon:FindFirstChild("Ref")
												return ref ~= nil
											end, 10)

											local proximityPrompt = ref and ref:FindFirstChildWhichIsA("ProximityPrompt")
											if not proximityPrompt then
												return
											end
											local position = ref.Position
											fn53(ref.Position + Vector3.new(v84[28], 2, v84[67]), position, 1)
											fn54(proximityPrompt)
											cframe = nil

											if not fn52(function()
												local v102 = fn30()
												return fn73() and v102 ~= nil and (v102.Position - vector5).Magnitude < 150
											end, 15) then
												return
											end
										end

										local now2 = os.clock()
										task.wait(v84[119])

										for i = 1, 7 do
											local v101 = parkourTraining.Switchs:FindFirstChild("Switch_" .. i)
											local a = v101 and v101:FindFirstChild("A_")

											if a and not a:GetAttribute("On") then
												local position = a:GetPivot().Position
												local v102 = v84[119]
												fn53(position + Vector3.new(0, 3, 4), position, v102)
												local v103 = nil

												fn52(function()
													for _, descendant in ipairs(v101:GetDescendants()) do
														if descendant:IsA("ProximityPrompt") and descendant.Enabled then
															v103 = descendant
														end
													end

													return v103 ~= nil
												end, 5)

												if v103 then
													fn54(v103)
												end

												fn52(function()
													return a:GetAttribute("On") == true
												end, 3)
											end
										end

										local final = parkourTraining:FindFirstChild("Final")
										local position = final and final.Position or vector6
										fn53(position + Vector3.new(0, 0, 70), position, 1)

										fn52(function()
											return os.clock() - now2 >= 240 or not fn73()
										end, 260)

										local n42 = 0

										fn52(function()
											n42 += v84[115]
											cframe = CFrame.new(position + Vector3.new(math.sin(n42 * 0.7) * 12, 0, math.cos(n42 * 0.7) * 12))
											return not fn73()
										end, 20)

										cframe = nil

										fn52(function()
											return fn58(arg, arg2.Name)
										end, v84[177])
									end

									local function fn73(arg)
										if not localPlayer:GetAttribute("MountainTrialEndsAt") then
											fn63("Lavato")
											SignalEvent.ToServer("StartMountainTrial")

											fn52(function()
												return localPlayer:GetAttribute("MountainTrialEndsAt") ~= nil
											end, 5)
										end

										local mountainCheckpoints = workspace.Debree:FindFirstChild("MountainCheckpoints")

										for i = 1, 4 do
											if not arg.Parent or not flag22 then
												return
											end
											local v101 = fn57(arg)

											if v101 < i then
												local touchPart = mountainCheckpoints and mountainCheckpoints:FindFirstChild("Checkpoint" .. i)
												touchPart = touchPart and touchPart:FindFirstChild("TouchPart")
												fn53((touchPart and touchPart.Position or tbl27[i]) + Vector3.new(v84[67], 3, 0), nil, 1.2)
												SignalEvent.ToServer("MountainCheckpoint", i)

												fn52(function()
													return not arg.Parent or fn57(arg) > v101
												end, 3)
											end
										end
									end

									local function fn74(arg)
										local attribute = nil

										fn52(function()
											attribute = localPlayer:GetAttribute("RescueZonePos")
											return typeof(attribute) == "Vector3"
										end, 10)

										if typeof(attribute) ~= "Vector3" then
											return
										end

										if not fn58(arg, "Capture the Zone") then
											cframe = CFrame.new(attribute + Vector3.new(v84[67], 45, v84[67]))

											fn52(function()
												return fn58(arg, "Capture the Zone")
											end, 90)
										end

										if not fn58(arg, "Rescue the Civilian") then
											local rescueCivilian = nil

											fn52(function()
												rescueCivilian = workspace.Debree:FindFirstChild("RescueCivilian")
												return rescueCivilian ~= nil
											end, 8)

											if not rescueCivilian then
												return
											end
											local position = rescueCivilian:GetPivot().Position
											fn53(position + Vector3.new(3, 1, 0), position, 1.2)
											local proximityPrompt = rescueCivilian:FindFirstChildWhichIsA("ProximityPrompt", true)

											if proximityPrompt then
												fn54(proximityPrompt)
											end

											fn52(function()
												return fn58(arg, "Rescue the Civilian")
											end, v84[26])
										end

										if fn58(arg, "Rescue the Civilian") then
											local Levi = fn61("Levi")
											local v101 = v84[115]
											fn53(Levi + Vector3.new(4, 3, 0), Levi, v101)

											fn52(function()
												return fn55(arg) == nil
											end, 10)
										end

										cframe = nil
									end

									local function fn75()
										if not fn56() then
											SignalEvent.ToServer("AddQuest", "Locate Rem")

											fn52(function()
												return fn56() ~= nil
											end, v84[177])
										end

										local n42 = 0

										while flag22 do
											local v101, v102 = fn56()
											if not v101 then
												return true
											end
											local v103 = fn59(v101, v102)

											if not v103 then
												fn52(function()
													return fn56() ~= v101
												end, 10)

												continue
											end

											local v104 = Quests.Holder[v101]
											local flag24 = type(v104.TaskSpecs) == "table" and v104.TaskSpecs[v103.Name] or nil
											local flag25 = type(v104.Markers) == "table" and v104.Markers[v103.Name]
											local position = type(flag25) == "table" and typeof(flag25.Position) == "Vector3" and flag25.Position or nil
											local value2 = v103:FindFirstChild("Code") and v103.Code.Value
											fn34("Final Selection: " .. v103.Name, v84[28])

											if v101 == "Rescue and Hold the Zone" then
												fn74(v101)
											elseif v103.Name == "Checkpoints" then
												fn73(v103)
											elseif flag24 and flag24.Type == "Dungeon" then
												fn72(v101, v103)
											elseif flag24 and flag24.Type == "Deliver" then
												fn70(v101, v103, flag24)
											elseif flag24 and flag24.Type == "Pickup" then
												fn71(v101, v103, flag24)
											elseif tbl26[value2] then
												fn69(tbl26[value2], position, function()
													return fn58(v101, v103.Name)
												end)
											end

											cframe = nil
											if fn58(v101, v103.Name) or fn56() ~= v101 then
												n42 = 0
												continue
											end
											n42 += v84[115]
											if n42 >= v84[32] then
												fn34("Final Selection: stuck on " .. v103.Name .. ", turn it back on to retry", 6)
												return false
											end
										end
									end

									local function fn76()
										if connection then
											connection:Disconnect()
											connection = nil
										end

										if flag23 then
											flag23 = false
											v86 -= v84[115]
										end

										cframe = nil
										v100 = nil
										local v101 = fn30()

										if v101 then
											v101.Anchored = false
										end
									end

									tbl17.AutoFinalSelection = v99:AddToggle("AutoFinalSelection", {
										Text = "Auto Final Selection (Any Lv)",
										Description = "Does Final Selection For you",
										Default = false,
										Callback = function(arg)
											flag22 = arg

											if thread then
												pcall(task.cancel, thread)
												thread = nil
											end

											fn76()
											if not arg then
												return
											end
											local minigamesPlace = ReplicatedStorage:FindFirstChild("Minigames Place")
											minigamesPlace = minigamesPlace and minigamesPlace:FindFirstChild("Content")
											if not (minigamesPlace and minigamesPlace:FindFirstChild("Final Selection")) then
												fn34("Only works inside Final Selection", 4)
												return
											end
											connection = game:GetService("RunService").Heartbeat:Connect(fn68)
											flag23 = true
											v86 += v84[115]

											thread = task.spawn(function()
												local ok, result = pcall(fn75)

												if not (n25 >= 4398) then
													if ok and result then
														fn34("Final Selection done!", 6)
													end

													if not ok then
														fn34("Final Selection stopped: " .. tostring(result), 6)
													end

													flag22 = false
													thread = nil
													fn76()

													pcall(function()
														lib.Options.AutoFinalSelection:SetValue(v84[35])
													end)

													return
												end

												while true do
												end
											end)
										end,
									})

									fn33(function()
										flag22 = false

										if thread then
											pcall(task.cancel, thread)
											thread = nil
										end

										fn76()
									end)
								end

								fn48()
							end

							do
								local function fn48()
									local Yeti = tbl19.BossFarm:AddGroupbox("Yeti")
									local ReplicatedStorage = game:GetService("ReplicatedStorage")
									require(ReplicatedStorage.CAM.Global.Utility)
									local regions = require(ReplicatedStorage.Regions).Regions
									Vector3.new(-1382, -33, 503)
									local flag22 = false
									local v99 = nil
									local v100 = nil
									local v101 = v84[35]
									local flag23 = v84[35]
									local v102 = nil
									local tbl25 = { T1 = v84[126], T2 = true, T3 = true }
									local hold = nil
									local v103 = nil
									local flag24 = nil
									local v104 = nil

									local function fn49(arg)
										if not v104 then
											return
										end
										local v105 = v104
										v104 = nil

										if v105.pin then
											v105.pin:Disconnect()
										end

										hold = v105.hold
										local v106 = fn30()

										if v106 and arg then
											v106.CFrame = v105.back
											v106.AssemblyLinearVelocity = Vector3.zero
										end
									end

									local function fn50()
										fn49(false)

										if v100 then
											v100:Disconnect()
											v100 = nil
										end

										if v101 then
											v101 = v84[35]
											v86 -= 1
										end

										hold = nil
										v103 = nil
										flag24 = false
										local v105 = fn30()

										if v105 then
											v105.Anchored = v84[35]
										end
									end

									local Coins = tbl19.Loot:AddGroupbox("Coins")
									require(ReplicatedStorage.Communication.ServerAndClient.Signals.SignalFunction)
									local flag25 = v84[35]
									local v105 = nil

									tbl17.AutoSellCoins = Coins:AddToggle("AutoSellCoins", {
										Text = "Auto Sell Coins (Premium)",
										Description = "Sells your coin pouches, piles and stacks to Ginzo",
										Default = v84[35],
										Callback = function(arg)
											if arg then
												fn36("AutoSellCoins")
											end
										end,
									})

									local function fn51()
										flag23 = false

										if v102 then
											pcall(task.cancel, v102)
											v102 = nil
										end
									end

									tbl20.Chests:AddDropdown("RaidChestTiers", {
										Text = "Chest Tiers",
										Description = "Which sealed chests to raid",
										Values = { "T1", "T2", "T3" },
										Default = { "T1", "T2", "T3" },
										Multi = true,
										Callback = function(arg)
											if n28(2298) > 39 then
												local tbl26 = {}
												local v106 = pairs
												local tbl27 = arg or {}

												for k, v107 in v106(tbl27) do
													if type(k) == "string" and v107 == true then
														tbl26[k] = true
													elseif type(v107) == "string" then
														tbl26[v107] = true
													end
												end

												tbl25 = tbl26
											else
												while v84[126] do
												end
											end
										end,
									})

									tbl17.RaidChests = tbl20.Chests:AddToggle("RaidChests", {
										Text = "Auto Raid Chests (Premium)",
										Description = "Kills the guards, opens every sealed chest and grabs the loot",
										Default = false,
										Callback = function(arg)
											if arg then
												fn36("RaidChests")
											end
										end,
									})

									tbl17.RaidHop = tbl20.Chests:AddToggle("RaidHop", {
										Text = "Hop Servers When Looted (Premium)",
										Description = "Once every chest in the server is raided, jumps to a new server",
										Default = false,
										Callback = function(arg)
											if arg then
												fn36("RaidHop")
											end
										end,
									})

									tbl17.AutoYeti = Yeti:AddToggle("AutoYeti", {
										Text = "Auto Yeti Farm (Premium)",
										Description = "Auto Farms Sealed Chests and the Yeti for you",
										Default = false,
										Callback = function(arg)
											if arg then
												fn36("AutoYeti")
											end
										end,
									})

									fn33(function()
										flag22 = v84[35]

										if v99 then
											pcall(task.cancel, v99)
											v99 = nil
										end

										fn51()
										flag25 = false

										if v105 then
											pcall(task.cancel, v105)
											v105 = nil
											if not flag2 then
												return
											end
										end

										fn50()
									end)
								end

								fn48()
							end
						end

						do
							do
								local v99, v100, flag22, flag23, connection, tbl25, str12, fn48

								do
									local ReplicatedStorage, v101, v102, value2, stop, flag24, tbl26, tbl27

									do
										local tbl28

										do
											ReplicatedStorage = game:GetService("ReplicatedStorage")
											v101 = tbl19.Fishing:AddGroupbox("Auto Fish")
											v99 = tbl19.Fishing:AddGroupbox("Fishing Spots")
											v100 = tbl19.Fishing:AddGroupbox("Auto Pickup")
											flag22 = false
											v102 = nil
											value2 = 4
											flag23 = v84[35]
											connection = nil
											stop = nil
											flag24 = v84[35]

											pcall(function()
												local BarKeepup = require(ReplicatedStorage.CAM.Client.Components.NonePackagedMisc.Minigames.BarKeepup)
												local v103 = nil

												local function fn49(arg, arg2)
													if flag22 and type(arg2) == "table" and type(arg2.Stop) == "function" then
														stop = arg2.Stop
														return
													end
													return v103(arg, arg2)
												end

												v103 = hookfunction
												v103 = v103(BarKeepup, fn49)
												flag24 = true

												fn33(function()
													pcall(hookfunction, BarKeepup, v103)
												end)
											end)

											pcall(function()
												local v103 = nil

												local function fn49(arg, ...)
													local v104 = table.pack(...)

													if flag22 and arg == event and not checkcaller() and getnamecallmethod() == "FireServer" then
														if ... == "Tool_Mouse" then
															return
														end
														return v103(arg, table.unpack(v104, 1, v104.n))
													end

													return v103(arg, ...)
												end

												v103 = hookmetamethod
												v103 = v103(game, "__namecall", fn49)

												fn33(function()
													pcall(hookmetamethod, game, "__namecall", v103)
												end)
											end)

											tbl26 = {
												name = "Mistfall Harbor",
												cf = CFrame.new(619.464, 1008.5, -853.304),
												cast = Vector3.new(635.09, 1001.55, -850.4),
											}

											tbl27 = {}

											do
												local vector = Vector3.new

												tbl28 = {
													name = "Drowned Ledge",
													cf = CFrame.lookAt(Vector3.new(-143.13, 861.66, 213.58), vector(-158.92, 861.66, 216.12)),
													cast = Vector3.new(-158.92, 789.2, 216.12),
												}
											end
										end

										local vector = Vector3.new

										local tbl29 = {
											name = "Isao's Rod Ledge",
											cf = CFrame.lookAt(Vector3.new(-2040.12, 158.5, 276.46), vector(-2056, 158.5, 278.4)),
											cast = Vector3.new(-2056, 26.2, 278.4),
										}

										tbl27[1] = tbl28
										tbl27[2] = tbl29
									end

									tbl25 = {}
									str12 = "Mistfall Harbor"

									fn48 = function()
										local tbl28 = { "Mistfall Harbor" }

										for _, v103 in ipairs(tbl27) do
											table.insert(tbl28, v103.name)
										end

										for _, v103 in ipairs(tbl25) do
											table.insert(tbl28, v103.name)
										end

										return tbl28
									end

									do
										local function fn49()
											if str12 == "Mistfall Harbor" then
												return tbl26
											end

											for _, v103 in ipairs(tbl27) do
												if v103.name == str12 then
													return v103
												end
											end

											for _, v103 in ipairs(tbl25) do
												if v103.name == str12 then
													return v103
												end
											end

											return tbl26
										end

										local function fn50(arg)
											local filterDescendantsInstances = {}

											for _, v103 in ipairs(game:GetService("CollectionService"):GetTagged("SwimParts")) do
												table.insert(filterDescendantsInstances, v103.Parent or v103)
											end

											if #filterDescendantsInstances == 0 then
												return nil
											end
											local raycastParams = RaycastParams.new()
											raycastParams.FilterType = Enum.RaycastFilterType.Include
											raycastParams.FilterDescendantsInstances = filterDescendantsInstances
											raycastParams.BruteForceAllSlow = v84[126]
											local hit = workspace:Raycast(Vector3.new(arg.X, arg.Y + 300, arg.Z), Vector3.new(v84[67], -700, v84[67]), raycastParams)
											return hit and hit.Position
										end

										v101:AddDropdown("FishSlot", {
											Text = "Rod Slot",
											Description = "Which toolbar slot has your fishing rod",
											Values = { "1", "2", "3", "4", "5" },
											Default = "4",
											Multi = false,
											Callback = function(arg)
												value2 = tonumber(arg) or 4
											end,
										})

										tbl18.FishSpotSelect = v101:AddDropdown("FishSpotSelect", {
											Text = "Fishing Spot",
											Values = fn48(),
											Default = "Mistfall Harbor",
											Multi = false,
											Callback = function(arg)
												if not (n24 <= 8216) then
													str12 = arg or "Mistfall Harbor"
													return
												end

												while true do
												end
											end,
										})

										tbl17.AutoFish = v101:AddToggle("AutoFish", {
											Text = "Auto Fish",
											Description = "Fishes for you with no minigame, every catch goes straight into your bag",
											Default = false,
											Callback = function(arg)
												flag22 = arg
												v102 = nil
												if not arg then
													return
												end
												local tbl28 = {}
												v102 = tbl28

												task.spawn(function()
													local function fn51()
														return flag22 and v102 == tbl28 and fn35("AutoFish")
													end

													local itemsConfig = localPlayer:FindFirstChild("Items_Config")

													if not itemsConfig then
														fn34("Items_Config missing", v84[26])
														flag22 = v84[35]
														return
													end

													pcall(function()
														local inventory = require(ReplicatedStorage.CAM.Global.Utility).GetData(localPlayer).Inventory
														local str13 = ({ "One", "Two", "Three", "Four", "Five" })[value2] or "Four"

														for _, v103 in ipairs({ "Legendary Fishing Rod", "Rare Fishing Rod", "Basic Fishing Rod" }) do
															local v104 = inventory.Inventory:FindFirstChild(v103)

															if v104 and v104:FindFirstChild("Id") then
																if inventory.Toolbar[str13].Value ~= v104.Id.Value then
																	local value3 = v104.Id.Value
																	require(ReplicatedStorage.Communication.ServerAndClient.Signals.SignalEvent).ToServer("Toolbar_Equip", str13, value3)
																	task.wait(1)
																end

																break
															end
														end
													end)

													local v103 = fn49()

													if v103 ~= tbl27[v84[115]] and v103 ~= tbl27[2] then
														pcall(function()
															local inventory = require(ReplicatedStorage.CAM.Global.Utility).GetData(localPlayer).Inventory.Inventory

															for _, v104 in ipairs({ "Golden Tentacle", "Fish Head", "Worm" }) do
																local v105 = inventory:FindFirstChild(v104)

																if v105 and v105:FindFirstChild("Id") then
																	local value3 = v105.Id.Value
																	require(ReplicatedStorage.Communication.ServerAndClient.Signals.SignalEvent).ToServer("EquipBait", value3)
																	break
																end
															end
														end)
													end

													fn32(v103.cf)
													task.wait(2)
													local cast = fn50(v103.cast) or v103.cast
													local debree = workspace:WaitForChild("Debree")

													local function fn52()
														local toolAccessories = localPlayer.Character and localPlayer.Character:FindFirstChild("Tool_Accessories")
														local v104 = ipairs
														toolAccessories = toolAccessories and toolAccessories:GetChildren() or {}

														for _, toolAccessory in v104(toolAccessories) do
															if toolAccessory.Name:find("Fishing Rod") then
																return true
															end
														end

														return v84[35]
													end

													local function fn53()
														itemsConfig.Equipped.Value = 0
														task.wait(v84[13])
														itemsConfig.Equipped.Value = value2

														for i = 1, 20 do
															if not fn52() then
																task.wait(0.1)
																continue
															end
															break
														end

														task.wait(v84[13])
													end

													local function fn54(arg2, arg3)
														local v104 = fn30()
														if not v104 then
															return nil
														end

														for _, child in ipairs(debree:GetChildren()) do
															if child.Name:find(arg2) then
																local isBasePart = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart", true)

																if isBasePart then
																	isBasePart = (isBasePart.Position - v104.Position).Magnitude < (arg3 or 60)
																end

																if isBasePart then
																	return child
																end
															end
														end
													end

													local function fn55()
														pcall(function()
															event:FireServer("Tool_Mouse", "Down", cast)
														end)

														task.wait(0.15)

														pcall(function()
															event:FireServer("Tool_Mouse", "Up", cast)
														end)
													end

													local function fn56()
														local v104 = nil

														pcall(function()
															for _, v105 in ipairs(getgc(false)) do
																if type(v105) == "function" then
																	local ok, result = pcall(debug.getinfo, v105)

																	if ok and result.source and result.source:find("Fishing Rod") and result.name == "report" then
																		local ok2, result2 = pcall(getupvalues, v105)
																		if ok2 and result2[1] == false then
																			v104 = v105
																			break
																		end
																	end
																end
															end
														end)

														return v104
													end

													fn53()
													task.wait(v84[119])
													local v104

													while fn51() do
														local v105 = fn30()

														if v105 then
															v105.CFrame = v103.cf
															v105.AssemblyLinearVelocity = Vector3.zero
														end

														if not fn52() then
															fn53()
															task.wait(v84[119])
														end

														stop = nil
														fn55()
														local flag25 = v84[35]

														for i = 1, 2 do
															for i2 = v84[115], 40 do
																if fn54("FishingLine_") then
																	flag25 = true
																	break
																else
																	task.wait(0.1)
																end
															end

															if not (flag25 or i == 2) then
																fn55()
																continue
															end
															break
														end

														if not flag25 then
															fn53()
															task.wait(2)
															continue
														else
															local now2 = tick()

															while true do
																local flag26 = fn51() and tick() - now2 < 45
																v104 = nil

																if flag26 then
																	if stop then
																		v104 = stop
																		break
																	elseif not flag24 and localPlayer:GetAttribute("FishingBite") then
																		v104 = fn56()
																		break
																	else
																		v104 = nil
																		if fn54("FishingLine_") then
																			task.wait(0.1)
																			continue
																		end
																	end
																end

																break
															end

															if fn51() then
																if v104 then
																	pcall(v104, true)
																	stop = nil
																	local FishingCatch = nil
																	local now3 = nil

																	for i = 1, 40 do
																		FishingCatch = fn54("FishingCatch", 25)

																		if FishingCatch then
																			now3 = os.clock()
																			break
																		else
																			task.wait(v84[116])
																			now3 = nil
																		end
																	end

																	local proximityPrompt = nil

																	for i = v84[115], 20 do
																		proximityPrompt = FishingCatch and FishingCatch:FindFirstChildWhichIsA("ProximityPrompt", true)
																		if not (proximityPrompt or not FishingCatch) then
																			task.wait(v84[116])
																			continue
																		end
																		break
																	end

																	local parent = proximityPrompt and proximityPrompt.Parent

																	if parent and parent:IsA("BasePart") then
																		for i = 1, 8 do
																			local v106 = fn30()

																			if v106 then
																				v106.CFrame = CFrame.new(parent.Position + Vector3.new(v84[67], 2.5, 0))
																				v106.AssemblyLinearVelocity = Vector3.zero
																			end

																			task.wait(v84[116])
																		end

																		proximityPrompt.HoldDuration = 0
																		fireproximityprompt(proximityPrompt)

																		for i = 1, 20 do
																			if FishingCatch.Parent then
																				task.wait(v84[116])
																				continue
																			end
																			break
																		end

																		if FishingCatch.Parent then
																			pcall(function()
																				proximityPrompt:InputHoldBegin()
																				task.wait(0.1)
																				proximityPrompt:InputHoldEnd()
																			end)

																			for i = 1, 20 do
																				if FishingCatch.Parent then
																					task.wait(0.05)
																					continue
																				end
																				break
																			end
																		end

																		if not FishingCatch.Parent then
																			fn34("Caught " .. tostring(FishingCatch:GetAttribute("CatchItem") or "a fish") .. "!", 2)
																		end

																		local v106 = fn30()

																		if v106 then
																			v106.CFrame = v103.cf
																			v106.AssemblyLinearVelocity = Vector3.zero
																		end

																		task.wait(math.max(0.75 - os.clock() - now3, 0.2))
																		fn55()
																		task.wait(0.4)
																	end

																	task.wait(0.2)
																end

																continue
															end
														end

														break
													end

													if v102 == tbl28 then
														pcall(function()
															itemsConfig.Equipped.Value = 0
														end)
													end
												end)
											end,
										})

										v101:AddButton({
											Text = "TP to Spot",
											Description = "Teleport to the selected fishing spot",
											Func = function()
												local v103 = fn49()
												fn32(v103.cf)
												fn34("Teleported to " .. v103.name, 3)
											end,
										})
									end
								end

								do
									do
										local v101 = v84[157]

										tbl18.FishPickupRange = v100:AddSlider("FishPickupRange", {
											Text = "Pickup Range",
											Default = 50,
											Min = v84[32],
											Max = 200,
											Rounding = 0,
											Callback = function(arg)
												v101 = arg
											end,
										})

										tbl17.FishPickup = v100:AddToggle("FishPickup", {
											Text = "Auto Pickup Fish",
											Description = "Automatically collect any fishing loot within range",
											Default = false,
											Callback = function(arg)
												flag23 = arg

												if connection then
													connection:Disconnect()
													connection = nil
												end

												if not arg then
													return
												end

												connection = service.Heartbeat:Connect(function()
													if not flag23 then
														return
													end
													local v102 = fn30()
													if not v102 then
														return
													end
													local debree = workspace:FindFirstChild("Debree")
													if not debree then
														return
													end

													for _, child in ipairs(debree:GetChildren()) do
														if child.Name:find("FishingCatch") then
															local isBasePart = child:IsA("BasePart") and child or child:FindFirstChildWhichIsA("BasePart")

															if isBasePart and (isBasePart.Position - v102.Position).Magnitude <= v101 then
																local proximityPrompt = child:FindFirstChildWhichIsA("ProximityPrompt", true)

																if proximityPrompt and proximityPrompt.Enabled then
																	pcall(function()
																		fireproximityprompt(proximityPrompt)
																	end)
																end
															end
														end
													end
												end)
											end,
										})
									end

									do
										local str13 = ""

										v99:AddInput("NewSpotName", {
											Text = "Spot Name",
											Default = "",
											Placeholder = "My Fishing Spot",
											Callback = function(arg)
												str13 = arg
											end,
										})

										v99:AddButton({
											Text = "Save Current Position",
											Description = "Save where you're standing — face the water before saving",
											Func = function()
												local v101 = fn30()
												if not v101 then
													fn34("No character", 3)
													return
												end
												local savedSpot = str13

												if savedSpot == "" then
													savedSpot = "Spot " .. tostring(#tbl25 + 1)
												end

												for _, v102 in ipairs(tbl25) do
													if v102.name == savedSpot then
														fn34("Name already used", 3)
														return
													end
												end

												local cFrame = v101.CFrame
												table.insert(tbl25, { name = savedSpot, cf = cFrame, cast = cFrame.Position + cFrame.LookVector * 15 + Vector3.new(0, -v84[28], 0) })

												pcall(function()
													tbl18.FishSpotSelect:SetValues(fn48())
												end)

												pcall(function()
													tbl18.FishSpotSelect:SetValue(savedSpot)
												end)

												str12 = savedSpot
												fn34("Saved spot: " .. savedSpot, 3)
											end,
										})
									end

									v99:AddButton({
										Text = "Delete Selected Spot",
										Func = function()
											if str12 == "Mistfall Harbor" then
												fn34("Can't delete default spot", 3)
												return
											end

											for i, v101 in ipairs(tbl25) do
												if v101.name == str12 then
													table.remove(tbl25, i)
													break
												end
											end

											str12 = "Mistfall Harbor"

											pcall(function()
												tbl18.FishSpotSelect:SetValues(fn48())
											end)

											pcall(function()
												tbl18.FishSpotSelect:SetValue("Mistfall Harbor")
											end)

											fn34("Spot deleted", 3)
										end,
									})

									do
										local function fn49()
											local v101 = tbl19.Fishing:AddGroupbox("Legendary Rod")
											local ReplicatedStorage = game:GetService("ReplicatedStorage")
											require(ReplicatedStorage.Communication.ServerAndClient.Signals.SignalEvent)
											require(ReplicatedStorage.CAM.Global.Utility)
											require(ReplicatedStorage.CAM.Global.DayAndNightHandler)
											Vector3.new(-161, 796, 703)
											Vector3.new(-214.6, 797, 61.1)
											local flag24 = false
											local v102 = nil

											tbl17.AutoLegendaryRod = v101:AddToggle("AutoLegendaryRod", {
												Text = "Auto Legendary Rod (Premium)",
												Description = "Does the whole Legendary Fishing Rod chain for you",
												Default = false,
												Callback = function(arg)
													if arg then
														fn36("AutoLegendaryRod")
													end
												end,
											})

											fn33(function()
												flag24 = false

												if v102 then
													pcall(task.cancel, v102)
													v102 = nil
												end
											end)
										end

										fn49()
									end
								end

								fn33(function()
									flag22 = false
									flag23 = false

									if connection then
										connection:Disconnect()
										connection = nil
									end
								end)
							end

							do
								local v99 = nil
								local flag22 = v84[35]
								local str12 = "Below"
								local n42 = 0
								local v100 = v84[119]
								local v101 = v84[67]
								local n43 = 6.5
								local str13 = ""
								local str14 = "Combat"
								local n44 = 0

								local function fn48()
									local tbl25 = { "Nearest Player" }

									for _, player in ipairs(service2:GetPlayers()) do
										if player ~= localPlayer then
											table.insert(tbl25, player.Name)
										end
									end

									return tbl25
								end

								tbl18.PlrFarmSelect = tbl20.PlrFarm:AddDropdown("PlrFarmSelect", {
									Text = "Target Player",
									Description = "Pick a player to farm",
									Values = fn48(),
									Default = nil,
									Multi = false,
									Callback = function(arg)
										str13 = arg or ""
									end,
								})

								tbl20.PlrFarm:AddButton({
									Text = "Refresh Players (Premium)",
									Func = function()
										fn36()
									end,
								})

								tbl17.FarmPlayers = tbl20.PlrFarm:AddToggle("FarmPlayers", {
									Text = "Farm Player (Premium)",
									Description = "Auto teleport to and follow a player",
									Default = false,
									Callback = function(arg)
										if arg then
											fn36("FarmPlayers")
										end
									end,
								})

								tbl17.PlrFarmKA = tbl20.PlrFarm:AddToggle("PlrFarmKA", {
									Text = "Kill Aura (Premium)",
									Description = "Auto swing while farming players",
									Default = v84[35],
									Callback = function(arg)
										if arg then
											fn36("PlrFarmKA")
										end
									end,
								})

								tbl20.PlrFarmCfg:AddDropdown("PlrEquipSlot", {
									Text = "Auto Equip Slot",
									Description = "Which toolbar slot to equip while farming (0 = none)",
									Values = { "0", "1", "2", "3", "4", "5" },
									Default = "0",
									Multi = false,
									Callback = function(arg)
										n44 = tonumber(arg) or v84[67]
									end,
								})

								tbl20.PlrFarmCfg:AddDropdown("PlrKaWeapon", {
									Text = "Kill Aura Weapon",
									Description = "Weapon to swing",
									Values = tbl23,
									Default = "Combat",
									Multi = false,
									Callback = function(arg)
										str14 = arg
									end,
								})

								tbl20.PlrFarmCfg:AddDropdown("PlrFarmMode", {
									Text = "Farm Position",
									Description = "Where to stand relative to the player",
									Values = { "Above", "Below", "In Front", "Behind" },
									Default = "Below",
									Multi = false,
									Callback = function(arg)
										str12 = arg
									end,
								})

								tbl20.PlrFarmCfg:AddSlider("PlrFarmOffX", {
									Text = "X Offset",
									Default = 0,
									Min = -50,
									Max = 50,
									Rounding = 1,
									Callback = function(arg)
										n42 = arg
									end,
								})

								tbl20.PlrFarmCfg:AddSlider("PlrFarmOffY", {
									Text = "Y Offset",
									Default = 2,
									Min = -50,
									Max = 50,
									Rounding = 1,
									Callback = function(arg)
										v100 = arg
									end,
								})

								tbl20.PlrFarmCfg:AddSlider("PlrFarmOffZ", {
									Text = "Z Offset",
									Default = 0,
									Min = -50,
									Max = 50,
									Rounding = 1,
									Callback = function(arg)
										v101 = arg
									end,
								})

								tbl20.PlrFarmCfg:AddSlider("PlrFarmDist", {
									Text = "Distance",
									Description = "How far from the player to stand",
									Default = 6.5,
									Min = 0,
									Max = v84[157],
									Rounding = v84[115],
									Callback = function(arg)
										n43 = arg
									end,
								})

								fn33(function()
									flag22 = false

									if v99 then
										v99:Disconnect()
										v99 = nil
									end
								end)
							end
						end

						do
							local Muzan

							do
								do
									do
										do
											local function fn48()
												local tbl25 = {}

												for k in pairs(tbl22) do
													if type(k) == "string" then
														table.insert(tbl25, k)
													end
												end

												table.sort(tbl25)
												return tbl25
											end

											tbl18.NPCTPSelect = tbl20.NPCTP:AddDropdown("NPCTPSelect", {
												Text = "NPC",
												Values = fn48(),
												Default = nil,
												Multi = v84[35],
												Callback = function()
												end,
											})
										end
									end

									do
										tbl20.NPCTP:AddButton({
											Text = "Teleport to NPC (Premium)",
											Func = function()
												fn36()
											end,
										})

										do
											local function fn48()
												local tbl25 = {}

												for _, player in ipairs(service2:GetPlayers()) do
													if player ~= localPlayer then
														table.insert(tbl25, player.Name)
													end
												end

												table.sort(tbl25)
												return tbl25
											end

											tbl18.PlrTPSelect = tbl20.PlrTP:AddDropdown("PlrTPSelect", {
												Text = "Player",
												Values = fn48(),
												Default = nil,
												Multi = v84[35],
												Callback = function()
												end,
											})
										end
									end

									tbl20.PlrTP:AddButton({
										Text = "Refresh (Premium)",
										Func = function()
											fn36()
										end,
									})

									tbl20.PlrTP:AddButton({
										Text = "Teleport to Player (Premium)",
										Func = function()
											fn36()
										end,
									})

									do
										local function fn48()
											local tbl25 = {}

											for k in pairs(tbl21) do
												if type(k) == "string" then
													table.insert(tbl25, k)
												end
											end

											table.sort(tbl25)
											return tbl25
										end

										tbl18.MobTPSelect = tbl20.MobTP:AddDropdown("MobTPSelect", {
											Text = "Mob",
											Values = fn48(),
											Default = nil,
											Multi = v84[35],
											Callback = function()
											end,
										})
									end
								end

								do
									tbl20.MobTP:AddButton({
										Text = "Teleport to Mob (Premium)",
										Func = function()
											fn36()
										end,
									})

									Muzan = tbl19.Events:AddGroupbox("Muzan")

									Muzan:AddButton({
										Text = "TP to Muzan's Lair (Premium)",
										Func = function()
											fn36()
										end,
									})

									Muzan:AddButton({
										Text = "TP to Muzan (if spawned) (Premium)",
										Func = function()
											fn36()
										end,
									})

									do
										local flag22 = false
										local tbl25 = {}

										Muzan:AddToggle("MuzanNotifier", {
											Text = "Muzan Spawn Notifier (Premium)",
											Description = "Pings you when Muzan spawns in this server",
											Default = v84[35],
											Callback = function(arg)
												if arg then
													fn36("MuzanNotifier")
												end
											end,
										})

										fn33(function()
											flag22 = v84[35]

											for _, v99 in ipairs(tbl25) do
												pcall(v99.Disconnect, v99)
											end

											tbl25 = {}
										end)
									end
								end

								do
									local flag22 = false

									local function fn48()
										if flag22 then
											return
										end

										if game.PrivateServerId ~= "" then
											return
										end
										flag22 = true

										pcall(function()
											local request_ = request or syn and syn.request or http_request
											if not request_ then
												return
											end
											local service3 = game:GetService(v84[127])
											local HttpService = game:GetService("HttpService")
											local str12 = ", \"" .. game.JobId .. "\")"
											local jsonEncode = HttpService.JSONEncode
											local tbl25 = {}
											local embeds = {}
											local tbl26 = { title = "Muzan Has Spawned", description = "**Muzan** found in server", color = 16711680 }
											local fields = {}

											local tbl27 = {
												name = "Join Script",
												value = "```lua\n" .. ("loadstring(game:HttpGet(\"https://pastebin.com/raw/3MY472xA\"))(" .. tostring(game.PlaceId) .. str12) .. "\n```",
												inline = v84[35],
											}

											fields[1] = { name = "Players", value = tostring(#service3:GetPlayers()) .. "/" .. service3.MaxPlayers, inline = true }
											fields[2] = tbl27
											tbl26.fields = fields
											tbl26.footer = { text = "Slayers 2 — discord.gg/zerohub" }
											tbl26.timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
											embeds[1] = tbl26
											tbl25.embeds = embeds

											request_({
												Url = "https://discord.com/api/v10/channels/1551661444091617380/messages",
												Method = "POST",
												Headers = {
													Authorization = "Bot MTQ5MjkxNDYwOTU0NjU5NjU3NA.GgFXtt.Cy83NxT-JU3hM6uD33mXldJh_SDUzWOTbTS17Q",
													["Content-Type"] = "application/json",
													["User-Agent"] = "DiscordBot (https://discord.com, 10)",
												},
												Body = jsonEncode(HttpService, tbl25),
											})
										end)
									end

									pcall(function()
										for _, descendant in ipairs(workspace:GetDescendants()) do
											if descendant.Name == "Muzan" and descendant:IsA("Model") then
												fn48()
												break
											end
										end
									end)

									workspace.DescendantAdded:Connect(function(descendant)
										if descendant.Name == "Muzan" and descendant:IsA("Model") then
											fn48()
										end
									end)

									workspace.DescendantRemoving:Connect(function(descendant)
										if descendant.Name == "Muzan" and descendant:IsA("Model") then
											flag22 = false
										end
									end)
								end
							end

							local flag22 = v84[35]
							local v99 = nil
							local tbl25 = {}
							local cframe = CFrame.new(55, 826.5, 781.5)
							local cframe2 = CFrame.new(1920.6, 599, -881)
							local cframe3 = CFrame.new
							tbl25[1] = cframe
							tbl25[2] = cframe2

							do
								local values = table.pack(cframe3(-687, 1380.5, -2606.5))
								table.move(values, 1, values.n, 3, tbl25)
							end

							Muzan:AddToggle("MuzanHunt", {
								Text = "Server Hop For Muzan (Premium)",
								Description = "Hops servers until Muzan is found, then TPs to him",
								Default = false,
								Callback = function(arg)
									if arg then
										fn36("MuzanHunt")
									end
								end,
							})

							fn33(function()
								flag22 = false

								if v99 then
									pcall(task.cancel, v99)
									v99 = nil
								end
							end)
						end

						local v99

						do
							v99 = tbl19.Events:AddGroupbox("Black Marketer")

							do
								local tbl25 = {}
								local cframe = CFrame.new(-132.7, 804, 101.2)
								local cframe2 = CFrame.new(2162, 823.5, -900.7)
								local cframe3 = CFrame.new(1795.5, 659.4, -523.1)
								local cframe4 = CFrame.new(-464.9, 1357, -3497.8)
								local cframe5 = CFrame.new(-2089.8, 62.2, -408.5)
								local cframe6 = CFrame.new(-864.7, 1389, -1639.5)
								local cframe7 = CFrame.new(-118.7, 1379.3, -1861.3)
								local cframe8 = CFrame.new(-1045.4, 1282, -1312.5)
								local cframe9 = CFrame.new(-1775.2, 141.8, 1297.1)
								local cframe10 = CFrame.new(-2736.3, 143.8, 833.5)
								local cframe11 = CFrame.new
								tbl25[1] = cframe
								tbl25[2] = cframe2
								tbl25[3] = cframe3
								tbl25[4] = cframe4
								tbl25[5] = cframe5
								tbl25[6] = cframe6
								tbl25[7] = cframe7
								tbl25[8] = cframe8
								tbl25[9] = cframe9
								tbl25[10] = cframe10

								do
									local values = table.pack(cframe11(-1946, 311.5, -282.9))
									table.move(values, 1, values.n, 11, tbl25)
								end
							end
						end

						do
							do
								v99:AddButton({
									Text = "TP to Black Marketer (Premium)",
									Func = function()
										fn36()
									end,
								})

								do
									local flag22 = false
									local v100 = nil

									v99:AddToggle("BMNotifier", {
										Text = "Black Marketer Notifier (Premium)",
										Description = "Pings you when Black Marketer spawns",
										Default = false,
										Callback = function(arg)
											if arg then
												fn36("BMNotifier")
											end
										end,
									})

									fn33(function()
										flag22 = v84[35]

										if v100 then
											pcall(task.cancel, v100)
											v100 = nil
										end
									end)
								end
							end

							do
								local flag22 = false

								task.spawn(function()
									while task.wait(5) do
										pcall(function()
											if game.PrivateServerId ~= "" then
												return
											end
											local v100 = nil

											for _, descendant in ipairs(workspace:GetDescendants()) do
												if descendant.Name == "Black Marketer" and descendant:IsA("Model") then
													v100 = descendant
													break
												else
													v100 = nil
												end
											end

											if not v100 then
												flag22 = false
												return
											end

											if flag22 then
												return
											end
											flag22 = true
											local v101 = request
											local request_

											if v101 then
												request_ = v101
											else
												request_ = syn and syn.request
											end

											local v102 = request_ or http_request
											if not v102 then
												return
											end
											local Players = game:GetService("Players")
											local service3 = game:GetService(v84[137])
											local str12 = ", \"" .. game.JobId .. "\")"
											local jsonEncode = service3.JSONEncode
											local tbl25 = {}
											local embeds = {}

											local tbl26 = {
												title = "Black Marketer Has Spawned",
												description = "**Black Marketer** found in server",
												color = 10181046,
											}

											local fields = {}

											local tbl27 = {
												name = "Join Script",
												value = "```lua\n" .. ("loadstring(game:HttpGet(\"https://pastebin.com/raw/3MY472xA\"))(" .. tostring(game.PlaceId) .. str12) .. "\n```",
												inline = v84[35],
											}

											fields[1] = { name = "Players", value = tostring(#Players:GetPlayers()) .. "/" .. Players.MaxPlayers, inline = true }
											fields[2] = tbl27
											tbl26.fields = fields
											tbl26.footer = { text = "Slayers 2 — discord.gg/zerohub" }
											tbl26.timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
											embeds[1] = tbl26
											tbl25.embeds = embeds

											v102({
												Url = "https://discord.com/api/v10/channels/1551685263296565279/messages",
												Method = "POST",
												Headers = {
													Authorization = "Bot MTQ5MjkxNDYwOTU0NjU5NjU3NA.GgFXtt.Cy83NxT-JU3hM6uD33mXldJh_SDUzWOTbTS17Q",
													["Content-Type"] = "application/json",
													["User-Agent"] = "DiscordBot (https://discord.com, 10)",
												},
												Body = jsonEncode(service3, tbl25),
											})
										end)
									end
								end)
							end

							do
								local flag22 = false
								local v100 = nil

								v99:AddToggle("BMHunt", {
									Text = "Server Hop For Black Marketer (Premium)",
									Description = "Hops servers until Black Marketer is found",
									Default = false,
									Callback = function(arg)
										if arg then
											fn36("BMHunt")
										end
									end,
								})

								fn33(function()
									flag22 = false

									if v100 then
										pcall(task.cancel, v100)
										v100 = nil
									end
								end)
							end
						end

						do
							local function fn48()
								local tbl25 = {}
								local regions = workspace:FindFirstChild("Debree") and workspace.Debree:FindFirstChild("Regions")
								if not regions then
									return tbl25
								end

								for _, child in ipairs(regions:GetChildren()) do
									for _, child2 in ipairs(child:GetChildren()) do
										if child2.Name:find("SpawnCrystal") then
											table.insert(tbl25, child.Name)
										end
									end
								end

								table.sort(tbl25)
								return tbl25
							end

							local v100 = tbl19.Teleports:AddGroupbox("Spawn Crystal")

							tbl18.SpawnTPSelect = v100:AddDropdown("SpawnTPSelect", {
								Text = "Region",
								Values = fn48(),
								Default = nil,
								Multi = false,
								Callback = function()
								end,
							})

							v100:AddButton({
								Text = "Refresh (Premium)",
								Func = function()
									fn36()
								end,
							})

							v100:AddButton({
								Text = "Teleport to Spawn Crystal (Premium)",
								Func = function()
									fn36()
								end,
							})
						end

						do
							local v100 = tbl19.Loot:AddGroupbox("Spider Lily")
							local flag22 = v84[35]
							local v101 = nil

							tbl17.SpiderLilyFarm = v100:AddToggle("SpiderLilyFarm", {
								Text = "Spider Lily Farm (Premium)",
								Description = "Loop through spider lilies and fire any prompts on them",
								Default = false,
								Callback = function(arg)
									if arg then
										fn36("SpiderLilyFarm")
									end
								end,
							})

							v100:AddButton({
								Text = "TP to Nearest Lily (Premium)",
								Func = function()
									fn36()
								end,
							})

							fn33(function()
								flag22 = false

								if v101 then
									pcall(task.cancel, v101)
									v101 = nil
								end
							end)
						end

						fn33(function()
							pcall(function()
								service:UnbindFromRenderStep("QDSpeed")
								if not flag2 then
									return
								end
							end)

							pcall(function()
								service:UnbindFromRenderStep("QDFly")
							end)

							pcall(function()
								service:UnbindFromRenderStep("QDTween")
							end)

							pcall(function()
								service:UnbindFromRenderStep("QDNoSlow")
							end)

							getgenv()._QD_flyFrame = nil

							if v90 then
								v90:Disconnect()
								v90 = nil
							end

							if v87 then
								v87:Disconnect()
								v87 = nil
							end

							if v88 then
								v88:Disconnect()
								v88 = nil
							end

							if v89 then
								v89:Disconnect()
								v89 = nil
							end

							if v93 then
								v93:Disconnect()
								v93 = nil
							end

							flag19 = false

							if v91 then
								v91:Disconnect()
								v91 = nil
							end

							if v92 then
								v92:Disconnect()
								v92 = nil
							end

							if v94 then
								v94:Disconnect()
								v94 = nil
							end

							if v95 then
								v95:Disconnect()
								v95 = nil
							end

							local v100 = fn29()

							if v100 then
								for _, descendant in ipairs(v100:GetDescendants()) do
									if descendant:IsA("BasePart") then
										pcall(function()
											descendant.CanCollide = true
										end)
									end
								end

								local humanoidRootPart = v100:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart then
									pcall(function()
										humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
									end)

									pcall(function()
										humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
									end)
								end

								local humanoid = v100:FindFirstChildOfClass("Humanoid")

								if humanoid then
									pcall(function()
										humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
										humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
										humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, v84[126])
										humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
										local physics = Enum.HumanoidStateType.Physics
										local flag22 = humanoid:GetState() == physics
										local flag23

										if flag22 then
											flag23 = flag22
										else
											local fallingDown = Enum.HumanoidStateType.FallingDown
											flag23 = humanoid:GetState() == fallingDown
										end

										if flag23 then
											humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
										end
									end)
								end
							end

							pcall(function()
								currentCamera.CameraType = Enum.CameraType.Custom
							end)

							pcall(function()
								currentCamera.FieldOfView = 70
							end)

							pcall(function()
								UserInputService.MouseBehavior = Enum.MouseBehavior.Default
							end)

							pcall(function()
								UserInputService.MouseIconEnabled = true
							end)

							pcall(function()
								localPlayer.CameraMinViewDistance = 0.5
							end)

							pcall(function()
								localPlayer.CameraMode = Enum.CameraMode.Classic
							end)

							local v101 = fn29()

							if v101 then
								local humanoid = v101:FindFirstChildOfClass("Humanoid")

								if humanoid then
									pcall(function()
										currentCamera.CameraSubject = humanoid
									end)
								end
							end
						end)

						tbl19.Movement:Select()
						return
					end

					while true do
					end
				end
			end
		end
	end
end

fn14(100, v4[fn2("n\218\192\176\129w\151\190\193\1756", 21845944094585)], v4[fn2("-\209 \r\161\128\30\181)\162\169\194\240\156\19Ȣs\0212\188p\207(\188\240\176\157\230\2\142\167\11\226\159&\233", 10693721171687)] .. v33(v64), Color3[v4[fn2("\211\207k", 18772801209419)]](1, 0, 0), v4[fn2(" `\4\162\157", 18561267614598)])
