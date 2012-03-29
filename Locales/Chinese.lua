﻿local T, C, L = unpack(ShestakUI)
if T.client ~= "zhCN" then return end

----------------------------------------------------------------------------------------
--	Localization for zhCN client(Thanks to tat2dawn for the translation)
----------------------------------------------------------------------------------------
-- Key binding Header Name
L_EXTRA_HEADER_EXTRABAR = "Extra Bar" -- Needs review
L_EXTRA_HEADER_MARK = "Mouseover Raid Icons" -- Needs review

-- Announce fps
L_EXTRA_ANNOUNCE_FPS = "我目前的 FPS 是 "

-- Click2Cast
L_EXTRA_BINDER_FRAMES = "点击施法框体"
L_EXTRA_BINDER_OPEN = "打开点击施法绑定页面"
L_EXTRA_BINDER_CLOSE = "关闭点击施法绑定页面"

-- BG announce
L_EXTRA_ANNOUNCE_BG_LIGHT = "敌方小型攻击部队来到 "
L_EXTRA_ANNOUNCE_BG_MEDIUM = "敌方中型攻击部队来到 "
L_EXTRA_ANNOUNCE_BG_HEAVY = "敌方大部队来到 "
L_EXTRA_ANNOUNCE_BG_CLEAR = " 这边已经清掉所有敌人"
L_EXTRA_ANNOUNCE_BG_FOCUS = "集火目标 "
L_EXTRA_ANNOUNCE_BG_STEALTH = "敌方潜行在我们旁边"

-- EnchantScroll
L_EXTRA_SCROLL = "附魔卷轴"

-- Announce your Lightwell
L_EXTRA_ANNOUNCE_LA_USE = " 使用我的光束泉. "
L_EXTRA_ANNOUNCE_LA_CHARGE = " 刷新)"
L_EXTRA_ANNOUNCE_LA_USELESS = "尽量少地使用我的光束泉. "
L_EXTRA_ANNOUNCE_LA_STOP = "你不应该使用光束泉."
L_EXTRA_ANNOUNCE_LA_PLACED = "光束泉位置. "
L_EXTRA_ANNOUNCE_LA_CHARGES = "刷新."

-- Announce flasks and food
L_EXTRA_ANNOUNCE_FF_NOFOOD = "No Food: " -- Needs review
L_EXTRA_ANNOUNCE_FF_NOFLASK = "No Flask: " -- Needs review
L_EXTRA_ANNOUNCE_FF_ALLBUFFED = "All Buffed!" -- Needs review
L_EXTRA_ANNOUNCE_FF_CHECK_BUTTON = "Check food and flask" -- Needs review

-- Taunt announce
L_EXTRA_TAUNT_UNKNOWN = "未知命令:"
L_EXTRA_TAUNT_ADD = "添加坦克 "
L_EXTRA_TAUNT_DEL = "移除坦克 "
L_EXTRA_TAUNT_DEL_ALL = "移除所有坦克"
L_EXTRA_TAUNT_TANK_LIST = "坦克列表"
L_EXTRA_TAUNT_AURA = "检查光环"
L_EXTRA_TAUNT_AURA_CHECK = "光环检查完毕."
L_EXTRA_TAUNT_ALREADY_LIST = " 已经在列表中."
L_EXTRA_TAUNT_ADDED_TANK = "已添加坦克 "
L_EXTRA_TAUNT_REMOVED_TANK = "已移除坦克 "
L_EXTRA_TAUNT_TARGET_FIRST = "请先选择一位队友为目标."
L_EXTRA_TAUNT_ALL_REMOVED = "已移除所有自定义添加的坦克."

-- ExploreMap
L_EXTRA_EXPLORED = "Explored: " -- Needs review
L_EXTRA_ZONEACHID = { -- Needs review
	-- http://www.wowhead.com/achievement=*
	-- e(X)plore achievement id, (Q)uest achievement id
	["Eastern Kingdoms"]				= {X =   42, A =    0, H =    0},
	["Kalimdor"]						= {X =   43, A =    0, H =    0},
	["Outland"]							= {X =   44, A =    0, H =    0},
	["Northrend"]						= {X =   45, A =    0, H =    0},
	["World Map"]						= {X =  nil, A =    0, H =    0},
	-- Eastern Kingdoms
	["Arathi Highlands"]				= {X =  761, A = 4896, H = 4896},
	["Badlands"]						= {X =  765, A = 4900, H = 4900},
	["Blasted Lands"]					= {X =  766, A = 4909, H = 4909},
	["Burning Steppes"]					= {X =  775, A = 4901, H = 4901},
	["Deadwind Pass"]					= {X =  777, A =    0, H =    0},
	["Dun Morogh"]						= {X =  627, A =    0, H =    0},
	["Duskwood"]						= {X =  778, A = 4907, H =    0},
	["Eastern Plaguelands"]				= {X =  771, A = 4892, H = 4892},
	["Elwynn Forest"]					= {X =  776, A =    0, H =    0},
	["Eversong Woods"]					= {X =  859, A =    0, H =    0},
	["Ghostlands"]						= {X =  858, A =    0, H = 4908},
	["Hillsbrad Foothills"]				= {X =  772, A =    0, H = 4895},
	["Loch Modan"]						= {X =  779, A = 4899, H =    0},
	["Northern Stranglethorn"]			= {X =  781, A = 4906, H = 4906},
	["Redridge Mountains"]				= {X =  780, A = 4902, H =    0},
	["Searing Gorge"]					= {X =  774, A = 4910, H = 4910},
	["Silverpine Forest"]				= {X =  769, A =    0, H = 4894},
	["Swamp of Sorrows"]				= {X =  782, A = 4904, H = 4904},
	["The Cape of Stranglethorn"]		= {X = 4995, A = 4905, H = 4905},
	["The Hinterlands"]					= {X =  773, A = 4897, H = 4897},
	["Tirisfal Glades"]					= {X =  768, A =    0, H =    0},
	["Western Plaguelands"]				= {X =  770, A = 4893, H = 4893},
	["Westfall"]						= {X =  802, A = 4903, H =    0},
	["Wetlands"]						= {X =  841, A = 4898, H =    0},
	-- Kalimdor
	["Ashenvale"]						= {X =  845, A = 4925, H = 4976},
	["Azshara"]							= {X =  852, A =    0, H = 4927},
	["Azuremyst Isle"]					= {X =  860, A =    0, H =    0},
	["Bloodmyst Isle"]					= {X =  861, A = 4926, H = 4926},
	["Darkshore"]						= {X =  844, A = 4928, H = 4928},
	["Desolace"]						= {X =  848, A = 4930, H = 4930},
	["Durotar"]							= {X =  728, A =    0, H =    0},
	["Dustwallow Marsh"]				= {X =  850, A = 4929, H = 4978},
	["Felwood"]							= {X =  853, A = 4931, H = 4931},
	["Feralas"]							= {X =  849, A = 4932, H = 4979},
	["Moonglade"]						= {X =  855, A =    0, H =    0},
	["Mulgore"]							= {X =  736, A =    0, H =    0},
	["Northern Barrens"]				= {X =  750, A =    0, H = 4933},
	["Silithus"]						= {X =  856, A = 4934, H = 4934},
	["Southern Barrens"]				= {X = 4996, A = 4937, H = 4981},
	["Stonetalon Mountains"]			= {X =  847, A = 4936, H = 4980},
	["Tanaris"]							= {X =  851, A = 4935, H = 4935},
	["Teldrassil"]						= {X =  842, A =    0, H =    0},
	["Thousand Needles"]				= {X =  846, A = 4938, H = 4938},
	["Un'Goro Crater"]					= {X =  854, A = 4939, H = 4939},
	["Winterspring"]					= {X =  857, A = 4940, H = 4940},
	-- Outland
	["Blade's Edge Mountains"]			= {X =  865, A = 1193, H = 1193},
	["Hellfire Peninsula"]				= {X =  862, A = 1189, H = 1271},
	["Nagrand"]							= {X =  866, A = 1192, H = 1273},
	["Netherstorm"]						= {X =  843, A = 1194, H = 1194},
	["Shadowmoon Valley"]				= {X =  864, A = 1195, H = 1195},
	["Terokkar Forest"]					= {X =  867, A = 1191, H = 1272},
	["Zangarmarsh"]						= {X =  863, A = 1190, H = 1190},
	-- Northrend
	["Borean Tundra"]					= {X = 1264, A =   33, H = 1358},
	["Crystalsong Forest"]				= {X = 1457, A =    0, H =    0},
	["Dragonblight"]					= {X = 1265, A =   35, H = 1356},
	["Grizzly Hills"]					= {X = 1266, A =   37, H = 1357},
	["Howling Fjord"]					= {X = 1263, A =   34, H = 1356},
	["Icecrown"]						= {X = 1270, A =   40, H =   40},
	["Sholazar Basin"]					= {X = 1268, A =   39, H =   39},
	["The Storm Peaks"]					= {X = 1269, A =   38, H =   38},
	["Zul'Drak"]						= {X = 1267, A =   36, H =   36},
	-- Cataclysm
	["Deepholm"]						= {X = 4864, A = 4871, H = 4871},
	["Mount Hyjal"]						= {X = 4863, A = 4870, H = 4870},
	["Twilight Highlands"]				= {X = 4866, A = 4873, H = 5501},
	["Uldum"]							= {X = 4865, A = 4872, H = 4872},
	["Vashj'ir"]						= {X = 4825, A = 4869, H = 4982},
	["Tol Barad"]						= {X =    0, A = 4874, H = 4874},
	["Tol Barad Peninsula"]				= {X =    0, A = 4874, H = 4874},
	-- Boolean Explores
	["Isle of Quel'Danas"]				= {X =  868, A =    0, H =    0},
	["Ahn'Qiraj: The Fallen Kingdom"]	= {X =    0, A =    0, H =    0},
	["Wintergrasp"]						= {X =    0, A =    0, H =    0},
}