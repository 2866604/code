
local profile =TestCore.InitProfile()
local MD5 = 'GkrdG91gEMttpFdB'
local _initConfig = false
local Wait = function(time)
    return TestCore.Core.Wait(time)
end
profile.IgnoreCoreNavigateToCorpse=true

local UI =KW.UI.Profile
if not UI.Init('KW-脚本设置') then
    UI.AddToggle('拉老虎', '拉老虎', true)
    -- UI.AddHeader('策略')
    -- UI.AddDropdown('暴风雪-小鬼', '根据你的装备选择下雨次数', {'下雨一次', '下雨两次'}, 2, true)
    -- UI.AddRange('下雨一次-小鬼', '第一次聚怪对小鬼暴风雪时间（默认8秒）', 0, 8, 0.1, 8, true)
    -- UI.AddRange('下雨两次-小鬼', '第一次聚怪对小鬼暴风雪时间（默认两次每次5.5秒）', 0, 8, 0.1, 5.5, true)
    -- UI.AddRange('下雨时间(非树杈)', '击杀阶段下雨时间（默认7秒）', 0, 8, 0.1, 5, true)
    -- UI.AddRange('下雨时间(树杈上)', '击杀阶段下雨时间（默认7.5秒）', 0, 8, 0.1, 6, true)
    -- UI.AddDropdown('跳树杈方式', '选择跳树杈方式', {'普通跳', '超级跳'}, 2, true)
    -- UI.AddDropdown('结尾杀小鬼方式', '选择方式', {'寒冰箭', '下雨+寒冰箭'}, 2, true)
    UI.AddHeader('爆本限制')
    -- UI.AddToggle("", nil, true)
    UI.AddRange('爆本限制(单位:分钟)', '限制多少分钟刷一次,默认13分钟', 0, 60, 0.1, 13, true)
    UI.AddRange('爆本后等待(单位:分钟)', '爆本后等待多少分钟再尝试进本,默认3分钟', 0, 60, 0.1, 3, true)
    -- UI.AddToggle('等待时搓绷带', '等待时搓绷带', true)
    UI.AddHeader('杂项')
    -- UI.AddToggle("", nil, true)
    UI.AddToggle('拾取尸体', '打完后拾取尸体', true)
    -- UI.AddToggle('自动删除', '删除花草等不值钱物品', false)
	-- UI.AddToggle('修理时删除袋子', '出现修理或邮寄卡袋子情况，删除袋子', false)
    UI.AddToggle('副本内包满炉石回城', '包满后在副本内炉石回城', false)
    UI.AddToggle('队伍喊话通知', '进出本队伍里说话通知', false)
    UI.AddInput('进本喊话', '队伍喊话通知', '1', false)
    UI.AddInput('出本喊话', '队伍喊话通知', '1', false)
    UI.AddToggle('就位确认', '进出本就位确认', false)
    UI.AddToggle('进本后就位确认', '进本后就位确认', false)
    UI.AddToggle('死亡后重置副本', '死亡后重置副本', true)
    UI.AddHeader('KW-大号带刷')
    UI.AddToggle('开启大号带刷', '开启大号带刷,需要运行小号脚本', false)
    -- UI.AddToggle("美味风蛇", "美味风蛇变身", false)
    -- ui.AddToggle("冰甲术/霜甲术", nil, true)
    -- ui.AddToggle("魔甲术", nil, false)
    -- ui.AddToggle("魔法抑制", nil, true)
    -- ui.AddToggle("法术反制", nil, true)
    -- ui.AddToggle("寒冰护体", nil, true)
    -- ui.AddToggle("法力护盾", nil, true)
    -- ui.AddRange("生命低于", "使用法力护盾最低生命值百分比", 0, 100, 1, 50)
    -- ui.AddHeader("副本")
    -- ui.AddToggle("副本", "不使用副本脚本不要开启", false)
    -- ui.AddToggle("魔爆术", nil, true)
    UI.Show()
else
    UI.Show()
end

local GetSetting = function(name)
    return KW.Settings.profile.Profile[name]
end

profile.ShowConfig = function()
end

-- 攻击模式
-- Active / Passive / Defense
profile.Attack.Mode = 'Defense'
-- 范围:搜索敌人
profile.Range.Attack = 12
-- 范围:移动判定
profile.Range.MoveTo = 3
-- 范围:找回尸体
profile.Range.RetrieveCorpse = 20

-- 采集物品ID列表
profile.GatherIds = {75299, 75296}

-- 商人
if KW.Me.FactionGroup == 'Horde' then
    print('初始化部落NPC')
    profile.Vendors = {
        {
            ID = 1146,
            Name = '维哈尔',
            Position = {-12357.7744, 155.5521, 4.2480},
            Ammo = false,
            Drink = false,
            Food = false,
            Home = false,
            Junk = true,
            Repair = true
        },
        {
            ID = 1146,
            Name = '维哈尔',
            Position = {-12357.7744, 155.5521, 4.2480},
            Ammo = false,
            Drink = false,
            Food = false,
            Home = false,
            Junk = true,
            Repair = true
        },
        {
            ID = 163645,
            Name = '邮箱',
            Position = {-12388.0088, 146.6871, 2.6226},
            Mail = true
        }
    }
    -- if KW.Me:DistanceTo(-1677.0315, 3073.2659, 34.5377) > 300 then
    -- 回城路径
    profile.EnterTownPath = {
        -- true 表示使用自动寻路
        -- {-1183.1384, 2880.0518, 85.9657, true},
    }
    -- end
    -- 开启离开城镇路径
    profile.LeaveTownPath = {
        -- true 表示使用自动寻路
        -- {-1641.5209, 3087.8921, 31.6906, true},
    }
else
    print('初始化联盟NPC')
    profile.Vendors = {
        {
            ID = 226,
            Name = '莫格·纳尔特里',
            Position = {-10590.5215, -1155.9293, 30.0596},
            Ammo = false,
            Drink = false,
            Food = false,
            Home = false,
            Junk = true,
            Repair = true
        },
        {
            ID = 226,
            Name = '莫格·纳尔特里',
            Position = {-10590.5215, -1155.9293, 30.0596},
            Ammo = false,
            Drink = true,
            Food = true,
            Home = false,
            Junk = true,
            Repair = false
        },
        {
            ID = 142089,
            Name = '邮箱',
            Position = {-10547.3916, -1157.2557, 27.8954},
            Mail = true
        }
    }
    -- if KW.Me:DistanceTo(202.8367, 1179.1896, 167.9988) > 300 then
    -- 回城路径
    profile.EnterTownPath = {
        -- true 表示使用自动寻路
        -- {-1183.1384, 2880.0518, 85.9657, true},
    }
    -- end

    -- 开启离开城镇路径
    profile.LeaveTownPath = {
        -- true 表示使用自动寻路
        -- {154.0186, 1232.4561, 165.6301, true},
    }
end

profile.PathCorrection = {
    --炉石营地修理
    {
        StuckX = 250.06521606445,
        StuckY = 1222.8923339844,
        StuckZ = 191.77722167969,
        EndX = 202.8367,
        EndY = 1179.1896,
        EndZ = 167.9988,
        Radius = 5,
        NewPath = {
            {X = 246.6868, Y = 1209.9586, Z = 189.9627},
            {X = 237.7649, Y = 1214.3751, Z = 189.6263},
            {X = 225.0548, Y = 1232.3618, Z = 189.4630},
            {X = 211.1394, Y = 1238.2194, Z = 186.7965},
            {X = 193.2063, Y = 1239.8438, Z = 178.9115},
            {X = 179.1115, Y = 1231.3972, Z = 170.9360},
            {X = 169.3045, Y = 1215.2014, Z = 166.0979},
            {X = 171.3887, Y = 1191.0110, Z = 166.1228},
            {X = 179.8055, Y = 1182.3975, Z = 165.9917},
            {X = 191.0939, Y = 1181.0034, Z = 168.2203},
            {X = 202.8267, Y = 1179.2212, Z = 167.9988}
        }
    },
    --部落修理至副本门口
    {
        StuckX = -1420.4654541016,
        StuckY = 2930.0749511719,
        StuckZ = 135.82556152344,
        EndX = -1184.7213,
        EndY = 2874.1172,
        EndZ = 85.7544,
        Radius = 5,
        NewPath = {
            {X = -1422.7230, Y = 2922.3972, Z = 136.3630},
            --门
            {X = -1424.0065, Y = 2943.5242, Z = 134.6386},
            {X = -1432.2847, Y = 2948.5330, Z = 134.6340},
            {X = -1453.9442, Y = 2960.2854, Z = 123.4090},
            {X = -1471.8861, Y = 2958.9773, Z = 121.7253},
            {X = -1474.5315, Y = 2980.5679, Z = 117.1705},
            {X = -1447.9200, Y = 2994.0449, Z = 115.0552},
            {X = -1435.2299, Y = 3000.1021, Z = 115.2862},
            {X = -1432.6615, Y = 2985.6548, Z = 115.1119},
            {X = -1433.0992, Y = 2975.1814, Z = 100.1379},
            {X = -1428.2278, Y = 2948.2627, Z = 95.1068},
            {X = -1421.6025, Y = 2936.1406, Z = 95.0370},
            {X = -1385.2524, Y = 2917.6045, Z = 92.5961},
            {X = -1374.8179, Y = 2875.1719, Z = 90.6467},
            {X = -1355.9526, Y = 2849.1528, Z = 87.0963},
            {X = -1346.5042, Y = 2851.8577, Z = 87.3665},
            {X = -1329.6868, Y = 2872.3062, Z = 88.1433},
            {X = -1322.5621, Y = 2886.1545, Z = 88.6992},
            {X = -1308.8236, Y = 2899.7859, Z = 88.6970},
            {X = -1298.0403, Y = 2916.9692, Z = 88.3003},
            {X = -1290.0098, Y = 2928.6868, Z = 88.1735},
            {X = -1282.8120, Y = 2925.7795, Z = 87.9285},
            {X = -1273.5569, Y = 2910.8252, Z = 87.8935},
            {X = -1238.1793, Y = 2903.7883, Z = 86.9185},
            {X = -1195.1954, Y = 2892.1838, Z = 85.9657},
            {X = -1187.2317, Y = 2879.2102, Z = 85.8115},
            {X = -1184.9647, Y = 2877.6560, Z = 85.8378}
        }
    },
    --联盟营地至副本门口
    {
        StuckX = 21.333278656006,
        StuckY = 1215.9997558594,
        StuckZ = 132.31071472168,
        EndX = -1184.7213,
        EndY = 2874.1172,
        EndZ = 85.7544,
        Radius = 5,
        NewPath = {
            {X = 17.9213, Y = 1217.6802, Z = 130.0940},
            {X = -8.9784, Y = 1207.1934, Z = 111.8237},
            {X = -29.6252, Y = 1199.3788, Z = 100.4011},
            {X = -67.7874, Y = 1228.7889, Z = 90.8241},
            {X = -119.1536, Y = 1284.0979, Z = 90.2392},
            {X = -184.3264, Y = 1340.9480, Z = 89.0119},
            {X = -286.8917, Y = 1395.5068, Z = 95.0154},
            {X = -426.0187, Y = 1468.5054, Z = 89.3549},
            {X = -540.4245, Y = 1529.3470, Z = 89.3548},
            {X = -599.4390, Y = 1597.8777, Z = 91.6762},
            {X = -669.8344, Y = 1694.2463, Z = 88.5801},
            {X = -700.0107, Y = 1774.6218, Z = 92.3373},
            {X = -727.7459, Y = 1885.2787, Z = 88.5017},
            {X = -822.9464, Y = 1968.2450, Z = 85.1121},
            {X = -952.5990, Y = 2043.9845, Z = 62.3125},
            {X = -1033.9926, Y = 2117.2427, Z = 61.8692},
            {X = -1075.9694, Y = 2177.0779, Z = 62.9789},
            {X = -1128.3042, Y = 2275.7256, Z = 90.1390},
            {X = -1234.9957, Y = 2341.6228, Z = 92.1334},
            {X = -1355.4387, Y = 2405.1704, Z = 90.8610},
            {X = -1379.8051, Y = 2462.0718, Z = 88.8226},
            {X = -1380.2230, Y = 2504.0271, Z = 91.7929},
            {X = -1368.1990, Y = 2547.9026, Z = 106.5239},
            {X = -1383.3673, Y = 2573.0825, Z = 111.5275},
            {X = -1380.3027, Y = 2633.9399, Z = 111.5553},
            {X = -1362.0415, Y = 2656.8635, Z = 111.5553},
            {X = -1344.6929, Y = 2669.4561, Z = 111.5810},
            {X = -1245.1936, Y = 2678.9580, Z = 111.5633},
            {X = -1176.6449, Y = 2737.1548, Z = 111.6861},
            {X = -1184.9756, Y = 2779.9556, Z = 111.1226},
            {X = -1278.3754, Y = 2856.8257, Z = 113.7118},
            {X = -1361.4164, Y = 2854.0083, Z = 115.3449},
            {X = -1397.9375, Y = 2878.3513, Z = 130.5594},
            {X = -1420.5980, Y = 2888.3523, Z = 132.8812},
            {X = -1422.7230, Y = 2922.3972, Z = 136.3630},
            --门
            {X = -1424.0065, Y = 2943.5242, Z = 134.6386},
            {X = -1432.2847, Y = 2948.5330, Z = 134.6340},
            {X = -1453.9442, Y = 2960.2854, Z = 123.4090},
            {X = -1471.8861, Y = 2958.9773, Z = 121.7253},
            {X = -1474.5315, Y = 2980.5679, Z = 117.1705},
            {X = -1447.9200, Y = 2994.0449, Z = 115.0552},
            {X = -1435.2299, Y = 3000.1021, Z = 115.2862},
            {X = -1432.6615, Y = 2985.6548, Z = 115.1119},
            {X = -1433.0992, Y = 2975.1814, Z = 100.1379},
            {X = -1428.2278, Y = 2948.2627, Z = 95.1068},
            {X = -1421.6025, Y = 2936.1406, Z = 95.0370},
            {X = -1385.2524, Y = 2917.6045, Z = 92.5961},
            {X = -1374.8179, Y = 2875.1719, Z = 90.6467},
            {X = -1355.9526, Y = 2849.1528, Z = 87.0963},
            {X = -1346.5042, Y = 2851.8577, Z = 87.3665},
            {X = -1329.6868, Y = 2872.3062, Z = 88.1433},
            {X = -1322.5621, Y = 2886.1545, Z = 88.6992},
            {X = -1308.8236, Y = 2899.7859, Z = 88.6970},
            {X = -1298.0403, Y = 2916.9692, Z = 88.3003},
            {X = -1290.0098, Y = 2928.6868, Z = 88.1735},
            {X = -1282.8120, Y = 2925.7795, Z = 87.9285},
            {X = -1273.5569, Y = 2910.8252, Z = 87.8935},
            {X = -1238.1793, Y = 2903.7883, Z = 86.9185},
            {X = -1195.1954, Y = 2892.1838, Z = 85.9657},
            {X = -1187.2317, Y = 2879.2102, Z = 85.8115},
            {X = -1184.9647, Y = 2877.6560, Z = 85.8378}
        }
    },
    --副本门口至联盟营地
    {
        StuckX = -1212.2622070313,
        StuckY = 2894.7087402344,
        StuckZ = 86.143997192383,
        EndX = 202.8367,
        EndY = 1179.1896,
        EndZ = 167.9988,
        Radius = 5,
        NewPath = {
            {X = -1183.1384, Y = 2880.0518, Z = 85.9657},
            {X = -1188.4043, Y = 2891.8870, Z = 86.1124},
            {X = -1205.4788, Y = 2899.4102, Z = 85.9633},
            {X = -1226.0071, Y = 2907.6064, Z = 86.9390},
            {X = -1244.2734, Y = 2907.3064, Z = 86.9148},
            {X = -1260.6582, Y = 2907.3279, Z = 87.5757},
            {X = -1273.9296, Y = 2907.2910, Z = 87.8345},
            {X = -1281.1653, Y = 2921.9172, Z = 88.0143},
            {X = -1290.0875, Y = 2927.1455, Z = 88.1324},
            {X = -1300.0110, Y = 2922.3428, Z = 88.2518},
            {X = -1304.2810, Y = 2911.4221, Z = 88.2525},
            {X = -1308.0409, Y = 2900.3237, Z = 88.6958},
            {X = -1319.3845, Y = 2892.3228, Z = 88.6818},
            {X = -1325.8666, Y = 2880.6074, Z = 88.6094},
            {X = -1331.8495, Y = 2866.5940, Z = 87.8074},
            {X = -1338.4630, Y = 2856.0979, Z = 87.5614},
            {X = -1347.9799, Y = 2848.9109, Z = 87.3851},
            {X = -1358.3458, Y = 2850.0981, Z = 86.9942},
            {X = -1367.1693, Y = 2858.8638, Z = 89.2153},
            {X = -1374.4542, Y = 2870.2407, Z = 90.5059},
            {X = -1378.5428, Y = 2882.2144, Z = 89.8756},
            {X = -1380.3644, Y = 2894.6145, Z = 88.7992},
            {X = -1382.0718, Y = 2908.0349, Z = 90.2907},
            {X = -1383.3407, Y = 2918.0093, Z = 92.3705},
            {X = -1391.1254, Y = 2922.4700, Z = 93.4915},
            {X = -1404.2283, Y = 2928.8044, Z = 94.8990},
            {X = -1416.6010, Y = 2937.4023, Z = 95.2766},
            {X = -1426.9957, Y = 2945.1799, Z = 94.6738},
            {X = -1430.1289, Y = 2957.7002, Z = 96.9306},
            {X = -1430.3202, Y = 2973.8567, Z = 100.1004},
            {X = -1423.7756, Y = 2977.9956, Z = 100.5590},
            {X = -1416.4269, Y = 2980.4106, Z = 100.4047},
            {X = -1399.9491, Y = 2980.7229, Z = 105.9624},
            {X = -1396.8564, Y = 2984.1438, Z = 106.2494},
            {X = -1398.1945, Y = 2991.8972, Z = 106.3951},
            {X = -1414.1323, Y = 2992.2456, Z = 110.9959},
            {X = -1429.5569, Y = 2990.9717, Z = 115.1682},
            {X = -1439.4843, Y = 2998.4688, Z = 115.2845},
            {X = -1445.5988, Y = 2996.0886, Z = 115.2214},
            {X = -1452.9032, Y = 2992.7112, Z = 115.1054},
            {X = -1464.0381, Y = 2988.4417, Z = 115.9962},
            {X = -1476.6375, Y = 2983.5967, Z = 118.0227},
            {X = -1486.6542, Y = 2978.0645, Z = 119.0273},
            {X = -1492.2512, Y = 2970.5500, Z = 119.6203},
            {X = -1490.7563, Y = 2961.1819, Z = 120.7863},
            {X = -1481.9346, Y = 2950.4739, Z = 121.3570},
            {X = -1470.3406, Y = 2950.8982, Z = 121.8787},
            {X = -1452.8003, Y = 2960.2778, Z = 123.5266},
            {X = -1428.7169, Y = 2962.9397, Z = 124.4329},
            {X = -1417.5201, Y = 2956.7932, Z = 123.9054},
            {X = -1408.2950, Y = 2957.9150, Z = 126.1647},
            {X = -1399.3217, Y = 2966.7095, Z = 127.1106},
            {X = -1400.4937, Y = 2980.1086, Z = 130.1984},
            {X = -1414.4331, Y = 2987.2065, Z = 131.3484},
            {X = -1422.7040, Y = 2987.6746, Z = 133.1450},
            {X = -1427.1174, Y = 2972.3831, Z = 132.7927},
            {X = -1425.1163, Y = 2957.8298, Z = 134.6866},
            {X = -1423.9552, Y = 2941.5757, Z = 134.7834},
            {X = -1423.7046, Y = 2930.8806, Z = 135.9686},
            {X = -1407.7717, Y = 2885.4348, Z = 132.8330},
            {X = -1354.0084, Y = 2851.8347, Z = 113.8390},
            {X = -1303.2759, Y = 2865.9175, Z = 113.2976},
            {X = -1254.6935, Y = 2860.7234, Z = 114.5011},
            {X = -1216.2426, Y = 2822.6216, Z = 116.4064},
            {X = -1174.1532, Y = 2759.0195, Z = 112.2475},
            {X = -1204.6619, Y = 2700.4458, Z = 111.1948},
            {X = -1253.8507, Y = 2667.3945, Z = 112.0629},
            {X = -1291.7502, Y = 2646.0325, Z = 111.5565},
            {X = -1326.2411, Y = 2600.9229, Z = 111.5567},
            {X = -1350.4032, Y = 2574.1951, Z = 111.5567},
            {X = -1370.6469, Y = 2548.9392, Z = 106.6184},
            {X = -1380.5483, Y = 2499.3486, Z = 90.7062},
            {X = -1371.6648, Y = 2403.2393, Z = 89.4075},
            {X = -1268.0737, Y = 2346.3926, Z = 92.6597},
            {X = -1103.8510, Y = 2319.8245, Z = 94.9374},
            {X = -935.2493, Y = 2286.5645, Z = 87.0734},
            {X = -796.5272, Y = 2259.8958, Z = 89.8830},
            {X = -690.8677, Y = 2177.2256, Z = 101.9675},
            {X = -659.4505, Y = 2078.5247, Z = 98.0154},
            {X = -645.5344, Y = 1880.0125, Z = 88.5325},
            {X = -662.9420, Y = 1750.5565, Z = 88.4426},
            {X = -641.4346, Y = 1658.6508, Z = 88.8131},
            {X = -603.5851, Y = 1591.9465, Z = 92.0978},
            {X = -552.6548, Y = 1497.1611, Z = 89.3548},
            {X = -508.6735, Y = 1441.7781, Z = 89.2959},
            {X = -411.6130, Y = 1404.9780, Z = 97.2301},
            {X = -326.2538, Y = 1386.4559, Z = 95.6985},
            {X = -260.7496, Y = 1401.3068, Z = 95.5952},
            {X = -234.8278, Y = 1393.2955, Z = 96.6754},
            {X = -151.9740, Y = 1329.8894, Z = 88.9934},
            {X = -97.1443, Y = 1257.2943, Z = 90.8587},
            {X = -22.8250, Y = 1197.8748, Z = 102.6224},
            {X = 1.8727, Y = 1211.9607, Z = 119.1373},
            {X = 19.2005, Y = 1218.2595, Z = 130.8821},
            {X = 50.5764, Y = 1218.7620, Z = 148.3367},
            {X = 73.5280, Y = 1218.5714, Z = 158.2837},
            {X = 150.9705, Y = 1214.2273, Z = 165.6720},
            {X = 170.9092, Y = 1203.3422, Z = 166.3797},
            {X = 178.1312, Y = 1183.6849, Z = 166.0256},
            {X = 184.5392, Y = 1182.7205, Z = 166.9259},
            {X = 189.8247, Y = 1182.4585, Z = 168.1177},
            {X = 196.2540, Y = 1180.7659, Z = 167.9988},
            {X = 200.1173, Y = 1179.7260, Z = 167.9988},
            {X = 202.8987, Y = 1179.2524, Z = 167.9988}
        }
    },
    {
        StuckX = -1219.2452392578,
        StuckY = 2899.0051269531,
        StuckZ = 86.494850158691,
        EndX = 202.8367,
        EndY = 1179.1896,
        EndZ = 167.9988,
        Radius = 5,
        NewPath = {
            {X = -1183.1384, Y = 2880.0518, Z = 85.9657},
            {X = -1188.4043, Y = 2891.8870, Z = 86.1124},
            {X = -1205.4788, Y = 2899.4102, Z = 85.9633},
            {X = -1226.0071, Y = 2907.6064, Z = 86.9390},
            {X = -1244.2734, Y = 2907.3064, Z = 86.9148},
            {X = -1260.6582, Y = 2907.3279, Z = 87.5757},
            {X = -1273.9296, Y = 2907.2910, Z = 87.8345},
            {X = -1281.1653, Y = 2921.9172, Z = 88.0143},
            {X = -1290.0875, Y = 2927.1455, Z = 88.1324},
            {X = -1300.0110, Y = 2922.3428, Z = 88.2518},
            {X = -1304.2810, Y = 2911.4221, Z = 88.2525},
            {X = -1308.0409, Y = 2900.3237, Z = 88.6958},
            {X = -1319.3845, Y = 2892.3228, Z = 88.6818},
            {X = -1325.8666, Y = 2880.6074, Z = 88.6094},
            {X = -1331.8495, Y = 2866.5940, Z = 87.8074},
            {X = -1338.4630, Y = 2856.0979, Z = 87.5614},
            {X = -1347.9799, Y = 2848.9109, Z = 87.3851},
            {X = -1358.3458, Y = 2850.0981, Z = 86.9942},
            {X = -1367.1693, Y = 2858.8638, Z = 89.2153},
            {X = -1374.4542, Y = 2870.2407, Z = 90.5059},
            {X = -1378.5428, Y = 2882.2144, Z = 89.8756},
            {X = -1380.3644, Y = 2894.6145, Z = 88.7992},
            {X = -1382.0718, Y = 2908.0349, Z = 90.2907},
            {X = -1383.3407, Y = 2918.0093, Z = 92.3705},
            {X = -1391.1254, Y = 2922.4700, Z = 93.4915},
            {X = -1404.2283, Y = 2928.8044, Z = 94.8990},
            {X = -1416.6010, Y = 2937.4023, Z = 95.2766},
            {X = -1426.9957, Y = 2945.1799, Z = 94.6738},
            {X = -1430.1289, Y = 2957.7002, Z = 96.9306},
            {X = -1430.3202, Y = 2973.8567, Z = 100.1004},
            {X = -1423.7756, Y = 2977.9956, Z = 100.5590},
            {X = -1416.4269, Y = 2980.4106, Z = 100.4047},
            {X = -1399.9491, Y = 2980.7229, Z = 105.9624},
            {X = -1396.8564, Y = 2984.1438, Z = 106.2494},
            {X = -1398.1945, Y = 2991.8972, Z = 106.3951},
            {X = -1414.1323, Y = 2992.2456, Z = 110.9959},
            {X = -1429.5569, Y = 2990.9717, Z = 115.1682},
            {X = -1439.4843, Y = 2998.4688, Z = 115.2845},
            {X = -1445.5988, Y = 2996.0886, Z = 115.2214},
            {X = -1452.9032, Y = 2992.7112, Z = 115.1054},
            {X = -1464.0381, Y = 2988.4417, Z = 115.9962},
            {X = -1476.6375, Y = 2983.5967, Z = 118.0227},
            {X = -1486.6542, Y = 2978.0645, Z = 119.0273},
            {X = -1492.2512, Y = 2970.5500, Z = 119.6203},
            {X = -1490.7563, Y = 2961.1819, Z = 120.7863},
            {X = -1481.9346, Y = 2950.4739, Z = 121.3570},
            {X = -1470.3406, Y = 2950.8982, Z = 121.8787},
            {X = -1452.8003, Y = 2960.2778, Z = 123.5266},
            {X = -1428.7169, Y = 2962.9397, Z = 124.4329},
            {X = -1417.5201, Y = 2956.7932, Z = 123.9054},
            {X = -1408.2950, Y = 2957.9150, Z = 126.1647},
            {X = -1399.3217, Y = 2966.7095, Z = 127.1106},
            {X = -1400.4937, Y = 2980.1086, Z = 130.1984},
            {X = -1414.4331, Y = 2987.2065, Z = 131.3484},
            {X = -1422.7040, Y = 2987.6746, Z = 133.1450},
            {X = -1427.1174, Y = 2972.3831, Z = 132.7927},
            {X = -1425.1163, Y = 2957.8298, Z = 134.6866},
            {X = -1423.9552, Y = 2941.5757, Z = 134.7834},
            {X = -1423.7046, Y = 2930.8806, Z = 135.9686},
            {X = -1407.7717, Y = 2885.4348, Z = 132.8330},
            {X = -1354.0084, Y = 2851.8347, Z = 113.8390},
            {X = -1303.2759, Y = 2865.9175, Z = 113.2976},
            {X = -1254.6935, Y = 2860.7234, Z = 114.5011},
            {X = -1216.2426, Y = 2822.6216, Z = 116.4064},
            {X = -1174.1532, Y = 2759.0195, Z = 112.2475},
            {X = -1204.6619, Y = 2700.4458, Z = 111.1948},
            {X = -1253.8507, Y = 2667.3945, Z = 112.0629},
            {X = -1291.7502, Y = 2646.0325, Z = 111.5565},
            {X = -1326.2411, Y = 2600.9229, Z = 111.5567},
            {X = -1350.4032, Y = 2574.1951, Z = 111.5567},
            {X = -1370.6469, Y = 2548.9392, Z = 106.6184},
            {X = -1380.5483, Y = 2499.3486, Z = 90.7062},
            {X = -1371.6648, Y = 2403.2393, Z = 89.4075},
            {X = -1268.0737, Y = 2346.3926, Z = 92.6597},
            {X = -1103.8510, Y = 2319.8245, Z = 94.9374},
            {X = -935.2493, Y = 2286.5645, Z = 87.0734},
            {X = -796.5272, Y = 2259.8958, Z = 89.8830},
            {X = -690.8677, Y = 2177.2256, Z = 101.9675},
            {X = -659.4505, Y = 2078.5247, Z = 98.0154},
            {X = -645.5344, Y = 1880.0125, Z = 88.5325},
            {X = -662.9420, Y = 1750.5565, Z = 88.4426},
            {X = -641.4346, Y = 1658.6508, Z = 88.8131},
            {X = -603.5851, Y = 1591.9465, Z = 92.0978},
            {X = -552.6548, Y = 1497.1611, Z = 89.3548},
            {X = -508.6735, Y = 1441.7781, Z = 89.2959},
            {X = -411.6130, Y = 1404.9780, Z = 97.2301},
            {X = -326.2538, Y = 1386.4559, Z = 95.6985},
            {X = -260.7496, Y = 1401.3068, Z = 95.5952},
            {X = -234.8278, Y = 1393.2955, Z = 96.6754},
            {X = -151.9740, Y = 1329.8894, Z = 88.9934},
            {X = -97.1443, Y = 1257.2943, Z = 90.8587},
            {X = -22.8250, Y = 1197.8748, Z = 102.6224},
            {X = 1.8727, Y = 1211.9607, Z = 119.1373},
            {X = 19.2005, Y = 1218.2595, Z = 130.8821},
            {X = 50.5764, Y = 1218.7620, Z = 148.3367},
            {X = 73.5280, Y = 1218.5714, Z = 158.2837},
            {X = 150.9705, Y = 1214.2273, Z = 165.6720},
            {X = 170.9092, Y = 1203.3422, Z = 166.3797},
            {X = 178.1312, Y = 1183.6849, Z = 166.0256},
            {X = 184.5392, Y = 1182.7205, Z = 166.9259},
            {X = 189.8247, Y = 1182.4585, Z = 168.1177},
            {X = 196.2540, Y = 1180.7659, Z = 167.9988},
            {X = 200.1173, Y = 1179.7260, Z = 167.9988},
            {X = 202.8987, Y = 1179.2524, Z = 167.9988}
        }
    },
    {
        StuckX = -1215.9611,
        StuckY = 2745.8159,
        StuckZ = 115.4681,
        X = -1214.7483,
        Y = 2745.5540,
        Z = 114.9033,
        Radius = 5,
        NewPath = {
            {X = -1206.0216, Y = 2753.7336, Z = 111.9932}
        }
    },
    --部落副本门口至修理
    {
        StuckX = -1344.8485107422,
        StuckY = 2857.6904296875,
        StuckZ = 87.82568359375,
        EndX = -1677.0315,
        EndY = 3073.2659,
        EndZ = 34.5377,
        Radius = 5,
        NewPath = {
            {X = -1341.0020, Y = 2850.9285, Z = 87.7069},
            {X = -1352.7626, Y = 2846.6006, Z = 87.2662},
            {X = -1366.8959, Y = 2857.6282, Z = 89.1012},
            {X = -1376.2440, Y = 2874.3010, Z = 90.6659},
            {X = -1381.4825, Y = 2903.0603, Z = 89.2763},
            {X = -1383.7670, Y = 2917.7771, Z = 92.4286},
            {X = -1388.5745, Y = 2923.9272, Z = 93.4141},
            {X = -1409.9763, Y = 2930.5405, Z = 95.1824},
            {X = -1424.7101, Y = 2942.4043, Z = 94.4309},
            {X = -1430.3615, Y = 2954.7949, Z = 96.0987},
            {X = -1429.9597, Y = 2969.7764, Z = 99.7686},
            {X = -1420.6979, Y = 2980.1807, Z = 100.5708},
            {X = -1399.2810, Y = 2981.9731, Z = 106.1046},
            {X = -1398.2201, Y = 2987.6946, Z = 106.3290},
            {X = -1407.9973, Y = 2990.8337, Z = 108.7651},
            {X = -1427.8827, Y = 2990.8792, Z = 115.1299},
            {X = -1438.2964, Y = 2997.1353, Z = 115.2598},
            {X = -1443.4979, Y = 2996.7419, Z = 115.2384},
            {X = -1450.1901, Y = 2993.2251, Z = 114.9668},
            {X = -1469.0457, Y = 2986.3286, Z = 117.0126},
            {X = -1490.9220, Y = 2972.3662, Z = 119.3384},
            {X = -1491.9438, Y = 2964.0195, Z = 120.3439},
            {X = -1486.8579, Y = 2953.1084, Z = 121.3265},
            {X = -1466.3811, Y = 2953.2473, Z = 122.2207},
            {X = -1444.1647, Y = 2961.6858, Z = 124.0237},
            {X = -1420.0179, Y = 2958.4656, Z = 123.9911},
            {X = -1406.1885, Y = 2962.8674, Z = 126.6971},
            {X = -1401.6024, Y = 2979.4917, Z = 130.1930},
            {X = -1412.8040, Y = 2986.6230, Z = 130.9334},
            {X = -1422.0344, Y = 2980.6897, Z = 133.1550},
            {X = -1426.7549, Y = 2971.4153, Z = 133.0275},
            {X = -1423.2976, Y = 2928.9368, Z = 136.2123},
            --门
            {X = -1421.5812, Y = 2882.2810, Z = 132.6277},
            {X = -1417.4753, Y = 2850.1147, Z = 121.9998},
            {X = -1405.4574, Y = 2813.7292, Z = 112.3231},
            {X = -1420.8265, Y = 2788.9954, Z = 111.8671},
            {X = -1429.5752, Y = 2774.9160, Z = 112.1886},
            {X = -1432.2222, Y = 2751.0811, Z = 112.7233},
            {X = -1441.1493, Y = 2738.3777, Z = 113.1970},
            {X = -1477.1310, Y = 2716.1655, Z = 112.3072},
            {X = -1487.5874, Y = 2714.8035, Z = 111.9670},
            {X = -1502.2064, Y = 2723.1589, Z = 111.9514},
            {X = -1523.7866, Y = 2747.6040, Z = 111.9422},
            {X = -1524.7395, Y = 2766.3550, Z = 111.9751},
            {X = -1498.1682, Y = 2814.0342, Z = 112.3067},
            {X = -1500.5940, Y = 2837.5598, Z = 109.0190},
            {X = -1518.8763, Y = 2865.4761, Z = 111.4610},
            {X = -1536.1014, Y = 2890.3115, Z = 116.7386},
            {X = -1554.1455, Y = 2894.1721, Z = 114.5060},
            {X = -1588.9846, Y = 2889.6294, Z = 107.4856},
            {X = -1673.5914, Y = 2870.5122, Z = 84.0281},
            {X = -1752.4210, Y = 2885.2544, Z = 63.1453},
            {X = -1792.1350, Y = 2932.6572, Z = 43.0927},
            {X = -1824.2196, Y = 2999.6567, Z = 16.5781},
            {X = -1817.2029, Y = 3029.7397, Z = 7.6578},
            {X = -1791.2435, Y = 3052.6094, Z = 8.4872},
            {X = -1769.6490, Y = 3073.3652, Z = 21.0047},
            {X = -1743.4204, Y = 3086.2290, Z = 31.6457},
            {X = -1724.1763, Y = 3099.6777, Z = 34.7779},
            {X = -1666.1021, Y = 3091.8418, Z = 30.5858},
            {X = -1667.7467, Y = 3083.6045, Z = 30.5369},
            {X = -1676.9453, Y = 3073.3083, Z = 34.5381}
        }
    }
}

local Spell =KW.Me.Spells
local Buff = DMW.Player.Buffs
local OutDoorPosition =KW.Classes.Vector3(-11916.3623, -1220.4401, 107.5329)

KW.Status = ''

local mage =KW.Mage
local spells =KW.Enums.Spells.MAGE.Abilities
-- local Wait = Wait
local GetCooldown =TestCore.Core.GetCooldown
local needResetInstances
-- Core.Debug(message, level)
-- Core.MoveTo(x, y, z, range, attackable)
-- Core.NavigateTo(x, y, z, range, attackable)
-- Core.Stop()
-- Wait(funcOrMillisecond, millisecond)
-- me.CorpsePosition
-- me.IsAlive
-- me.IsCombating
-- me.IsGhost
-- me.IsMoving
-- me.Pointer
-- me.Position

KW.Mage = {
    -- /run print(KW.Mage.InCD(13033))
    InCD = function(spellId)
        local start, duration, enabled = GetSpellCooldown(spellId)
        -- print(spellId,' = ',start)
        return start > 0
    end,
    Cast = function(spellId, waitSuccess)
        local wait = waitSuccess or false
        if wait then
            -- print('cd=',KW.Mage.InCD(spellId))
            while not KW.Mage.InCD(spellId) do
                CastSpellByID(spellId)
                Wait(0)
            end
        else
            CastSpellByID(spellId)
        end
    end,
    -- 暴风雪(x,y,z,等级)KW.Mage.BlizzardTo(x,y,z, 1)
    BlizzardTo = function(x, y, z, rank)
        local x, y, z = ObjectPosition('target')
        CastSpellByID(KW.Enums.Spells.MAGE.Abilities.Blizzard.Ranks[rank or 6])
        ClickPosition(x, y, z)
    end,
    -- 魔爆术(等级)KW.Mage.ArcaneExplosion(1)
    ArcaneExplosion = function(rank)
        -- print(KW.Enums.Spells.MAGE.Abilities.Frostbolt.Ranks[rank])
        CastSpellByID(KW.Enums.Spells.MAGE.Abilities.ArcaneExplosion.Ranks[rank])
    end,
    -- 寒冰箭(等级)KW.Mage.Frostbolt(1)
    Frostbolt = function(rank)
        -- print(KW.Enums.Spells.MAGE.Abilities.Frostbolt.Ranks[rank])
        CastSpellByID(KW.Enums.Spells.MAGE.Abilities.Frostbolt.Ranks[rank])
    end,
    -- 奥爆术 冰霜新星 防护冰霜结界 寒冰屏障
    -- 是否有寒冰护体BUFF /run print(KW.Mage.HasIceBarrier())
    HasIceBarrier = function()
        return KW.Me:HasAura(13033)
    end,
    -- 是否有法力护盾BUFF /run print(KW.Mage.HasManaShield())
    HasManaShield = function()
        return KW.Me:HasAura(10193)
    end
}

function GetBuffTimeLeft(id)
    for i = 1, 40 do
        local name, _, _, _, duration, expirationTime, unitCaster, _, _, spellId = UnitAura('player', i)
        if name then
            if id == spellId then
                return math.floor(expirationTime - GetTime())
            end
        end
    end
    return nil
end

function MageDebuffs(idOrName)
    for i = 1, 40 do
        local name, _, _, _, duration, expirationTime, unitCaster, _, _, spellId = UnitDebuff('player', i)
        if name then
            -- print(name.."="..spellId)

            -- if buffId == spellId then
            if type(idOrName) == 'string' and idOrName == name then
                return true
            end

            if type(idOrName) == 'number' and idOrName == spellId then
                return true
            end
        end
    end
    return false
end

function SelectUnitAtLocation(x, y, z, range, faceNow)
    local target =
       KW.ObjectManager.GetWoWUnit(
        function(unit)
            -- print(unit:DistanceTo(x,y,z), UnitCanAttack("player", unit.Pointer))
            return unit:DistanceTo(x, y, z) <= range and not unit.Dead and UnitCanAttack('player', unit.Pointer) and
                unit.GUID ~=KW.Me.GUID
        end
    )

    if target then
        --KW.Log.Write('选择并面向目标 = %s', target.Name)
        target:TargetUnit()
        if faceNow then
            target:Face()
        end
        return target
    end

    return false
end

function SelectUnitByLocationAndId(x, y, z, range, unitId, faceNow)
    local target =
       KW.ObjectManager.GetWoWUnit(
        function(unit)
            -- print(unit:DistanceTo(x,y,z), UnitCanAttack("player", unit.Pointer))
            return unit.ObjectID == unitId and unit:DistanceTo(x, y, z) <= range and not unit.Dead and UnitCanAttack('player', unit.Pointer) and
                unit.GUID ~=KW.Me.GUID
        end
    )

    if target then
        --KW.Log.Write('选择并面向目标 = %s', target.Name)
        target:TargetUnit()
        if faceNow then
            target:Face()
        end
        return target
    end

    return false
end

local function LootBodys()
    if KW.Me.FreeBagSlots < 1 then
        return
    end

    -- 遍历3遍尸体
    local lootCounts = 0
    for i = 1, 3 do
        local bodys =
           KW.ObjectManager.GetWoWUnits(
            function(unit)
                if unit.Dead and unit.Distance <= 1 and UnitCanBeLooted(unit.Pointer) then
                    InteractUnit(unit.Pointer)
                    -- Wait(0)
                    lootCounts = lootCounts + 1
                    return true
                end
            end
        )
        --TestCore.Log.Info('5码内尸体数量 > ', #bodys, ' 总拾取次数 > ', lootCounts)
        Wait(100)
    end
end

local function WaitLootBodys()
    if KW.Me.FreeBagSlots < 1 then
        return
    end

    local lootCounts = 0
    while true do
        local count = 0
        local bodys =
           KW.ObjectManager.GetWoWUnits(
            function(unit)
                if unit.Dead and unit.Distance <= 1.5 and UnitCanBeLooted(unit.Pointer) then
                    InteractUnit(unit.Pointer)
                    lootCounts = lootCounts + 1
                    count = count + 1
                    if count > 5 then
                        Wait(100)
                    end
                    return true
                end
            end
        )
        if #bodys == 0 then
     TestCore.Log.Info('5码内没有尸体,继续...')
      return
        else
           TestCore.Log.Info('5码内尸体数量', #bodys)
        end
        Wait(100)
    end
end

local function MyMoveTo(x, y, z, range, attackable)
    --TestCore.Core.Info('移动到坐标=>', x, y, z)
   TestCore.Core.MoveTo(x, y, z, range, attackable)
end

local function MyMoveToBuff(x, y, z, range, attackable)
    --TestCore.Core.Info('移动到坐标=>', x, y, z)
    STATUS = 'ResetBuff'
   TestCore.Core.MoveTo(x, y, z, range, attackable)
    STATUS = ''
end

function KW.SpaceWalkTo(x, y, z, delay)
    -- if not IsHackEnabled('multijump') then
    -- SetHackEnabled('multijump', true)
    -- end
	--TestCore.Core.Info('移动到坐标=>', x, y, z)
    while TestCore.IsRunning do
        local dis = getDistance2D(KW.Me.PosX,KW.Me.PosY, x, y)
        if dis > 3.5 then
            MoveTo(x, y, z)
           KW.WaitTime(delay or 500)
            RunMacroText('.stopfall')
        else
            AscendStop()
            return true
        end
    end
end

-- function KW.SpaceWalkGoTo(x, y, z, delay)
    -- while TestCore.IsRunning do
        -- local dis = getDistance2D(KW.Me.PosX,KW.Me.PosY, x, y)
        -- if dis > 3.5 then
            -- MoveTo(x, y, z)
            --KW.WaitTime(delay or 500)
            -- RunMacroText('.stopfall')
			-- while KW.Me.PosZ < 42 do
				-- JumpOrAscendStart()
				--KW.WaitTime(300)
				-- RunMacroText('.stopfall')
			-- end
        -- else
            -- AscendStop()
            -- return true
        -- end
    -- end
	-- RunMacroText('.stopfall')
-- end

function KW.SpaceWalkGoTo(x, y, z, delay)
    if not IsHackEnabled('multijump') then
    SetHackEnabled('multijump', true)
    end
	
	
    while TestCore.IsRunning do
        local dis = getDistance2D(KW.Me.PosX,KW.Me.PosY, x, y)
        if dis > 3.5 then
            JumpOrAscendStart()
            MoveTo(x, y, z)
           KW.WaitTime(delay or 500)
			while KW.Me.PosZ < 42 do
				JumpOrAscendStart()
				KW.WaitTime(300)
				RunMacroText('.stopfall')
			end
        else
            AscendStop()
            return true
        end
    end
	RunMacroText('.stopfall')
end

local function ForwardJump(x, y, z)
    -- print('往前跳啊')
    if x and y then
        FaceDirection(x, y, z, true)
    -- Wait(1000)
    end
    MoveForwardStart()
    Wait(100)
   KW.MovementManager.Jump()
    MoveForwardStop()
end

-- 往一个坐标跳
local function JumpOnceTo(x, y, z, range)
    local times = -1
    range = range or .8
    while TestCore.IsRunning do
        local dis = getDistance2D(KW.Me.PosX,KW.Me.PosY, x, y)

        if dis >= range then
            MoveTo(x, y, z)
            if times == -1 and IsFalling() then
                times = 0
            end
            if times == 0 and not IsFalling() then
                Wait(0)
                JumpOrAscendStart()
                times = times + 1
            end
        else
            if not IsFalling() then
                AscendStop()
                return true
            end
        end
        Wait(0)
    end
end

local function DeleteItem()
    if not GetSetting('自动删除') then
        return
    end
      print('删除物品')  
                if GetSetting('自动删除') then
                   KW.Bag.DeleteItem(2452)
                   KW.Bag.DeleteItem(1645)
                   KW.Bag.DeleteItem(3357)
                   KW.Bag.DeleteItem(4625)
                   KW.Bag.DeleteItem(3821)
                   KW.Bag.DeleteItem(785)
                   KW.Bag.DeleteItem(10286)
                   KW.Bag.DeleteItem(4608)
                   KW.Bag.DeleteItem(8831)
                   KW.Bag.DeleteItem(20763)
                   KW.Bag.DeleteItem(3676)
                   KW.Bag.DeleteItem(4599)
                   KW.Bag.DeleteItem(3671)
                   KW.Bag.DeleteItem(3820)
                   KW.Bag.DeleteItem(1710)
                   KW.Bag.DeleteItem(3358)
                   KW.Bag.DeleteItem(765)
                   KW.Bag.DeleteItem(2450)
                   KW.Bag.DeleteItem(8846)
                   KW.Bag.DeleteItem(6149)
                   KW.Bag.DeleteItem(7909)
                   KW.Bag.DeleteItem(2447)
                   KW.Bag.DeleteItem(2449)
                   KW.Bag.DeleteItem(8836)
                   KW.Bag.DeleteItem(3818)
                   KW.Bag.DeleteItem(3819)
                   KW.Bag.DeleteItem(2453)
                   KW.Bag.DeleteItem(3827)
                   KW.Bag.DeleteItem(4419)
                   KW.Bag.DeleteItem(8838)
					KW.Bag.DeleteItem(8839)
                   TestCore.Core.UseItem(4421)
                   TestCore.Core.UseItem(4424)
                   TestCore.Core.UseItem(4422)
                   TestCore.Core.UseItem(4425)
                   TestCore.Core.UseItem(4426)
                end
end				

local function FaceBlink(x, y, z)
    print('闪现')
    if x and y then
        FaceDirection(x, y, z, true)
    -- Wait(1000)
    end
    MoveForwardStart()
    Wait(100)
    Spell.Blink:Cast()
    MoveForwardStop()
end

local function FaceConeOfCold(x, y, z)
    print('吹风')
    if x and y then
        FaceDirection(x, y, z, true)
    -- Wait(1000)
    end
    MoveForwardStart()
    Wait(100)
    Spell.ConeOfCold:Cast()
    MoveForwardStop()
end

function KW.SuperJumpTo1(x, y, z, range, delay)
    if IsInInstance() then
        if not IsHackEnabled('multijump') then
            SetHackEnabled('multijump', true)
        end
    elseif IsHackEnabled('multijump') then
        SetHackEnabled('multijump', false)
    end

    local _range = range or 3.5
    while TestCore.IsRunning do
        local dis = getDistance2D(KW.Me.PosX,KW.Me.PosY, x, y)
        if dis > _range then
            JumpOrAscendStart()
            MoveTo(x, y, z)
           KW.WaitTime(delay or 500)
        else
            AscendStop()
            return true
        end
    end
end

-- 计算暴风雪已经施法的时间
local function BlizzardCastTime()
    local name, _, _, startTime, endTime, _, _, spellID = ChannelInfo()
    if not spellID or (spellID ~= 10 and spellID ~= 10185 and spellID ~= 10186 and spellID ~= 10187) then
        return 0
    end

    return GetTime() - startTime / 1000
    -- /run local name, _, _, startTime, endTime, _, _, spellID = ChannelInfo();print(endTime/1000-GetTime())print(spellID)
end

-- 计算暴风雪剩余时间
local function BlizzardLeftTime()
    local name, _, _, startTime, endTime, _, _, spellID = ChannelInfo()
    if not spellID or (spellID ~= 10 and spellID ~= 10185 and spellID ~= 10186 and spellID ~= 10187) then
        return 0
    end

    return endTime / 1000 - GetTime()
    -- /run local name, _, _, startTime, endTime, _, _, spellID = ChannelInfo();print(endTime/1000-GetTime())print(spellID)
end

local function BlizzardTo(x, y, z, rank)
    CastSpellByID(KW.Enums.Spells.MAGE.Abilities.Blizzard.Ranks[rank or 6])
    Wait(50)
    ClickPosition(x, y, z)
    if BlizzardCastTime() == 0 then
        ClickPosition(x, y, z)
    end
end

-- local function BlizzardTo(x, y, z, rank)

-- local r = Spell.Blizzard:CastGround(x,y,z, rank or 6)

--KW.Log.Write('Spell.Blizzard:CastGround = %s, %s, %s (%s)', x, y, z, rank or 6)
-- Wait(100)
-- while BlizzardCastTime() == 0 do
-- print('雪！一片一片一片~')
-- ClickPosition(x, y, z)
-- Wait(100)
-- end
-- end

function CancelAura(idOrName)
    for i = 1, 40 do
        local name, _, _, _, duration, expirationTime, unitCaster, _, _, spellId = UnitAura('player', i)
        if name then
            if type(idOrName) == 'string' and idOrName == name then
                CancelUnitBuff('player', i)
                return true
            end

            if type(idOrName) == 'number' and idOrName == spellId then
                CancelUnitBuff('player', i)
                return true
            end
        end
    end
    return false
end

local function CurrentTotalMoney()
    local profitInCopper = 0
    local itemsSold = 0
   KW.Bag.GetBagItems(
        function(itemInfo, bag, slot)
            -- print(itemInfo.Link, '价格=',GetCoinTextureString(itemInfo.SellPrice * itemInfo.Count))
            itemsSold = itemsSold + 1
            profitInCopper = profitInCopper + (itemInfo.SellPrice * itemInfo.Count)
            return true
        end
    )

    if (profitInCopper > 0 and itemsSold > 0) then
        print('当前背包总收益=', GetCoinTextureString(profitInCopper))
        print('当前角色金币=', GetCoinTextureString(GetMoney()))
        local totalMoney = profitInCopper + GetMoney()
        -- print(totalMoney)
        print('当前总资产=', GetCoinTextureString(totalMoney))
        return totalMoney
    end

    return 0
end

local ThisTimeLootTotalMoney = 0
local ThisTimeTotalTime = 0

local function MoveToStation(x, y, z, func, range)
    local _range = .8
    local callbackFunc = nil

    if type(func) == 'function' then
        callbackFunc = func
    end

    if type(func) == 'number' then
        print(func)
        _range = func
    end

    --TestCore.Core.Info('移动到坐标=>', x, y, z)

    if range then
        _range = range
    end
    while TestCore.IsRunning do
        --KW.Me:Update()
        local px, py, pz = ObjectPosition('player')
        local dis2D = GetPlaneDistanceBetweenPositions(px, py, x, y)
        -- print(dis2D)
        if not KW.Me.Moving and dis2D <= _range then
            -- MoveTo(x, y, z)
            return true
        else
            MoveTo(x, y, z)
            if callbackFunc then
                callbackFunc()
            end
        end

       KW.WaitTime(0)
    end
end

local function LogicStartLoot()
    local body =
       KW.ObjectManager.GetWoWUnit(
        function(unit)
            return not KW.BlackList.IsBlackListed(unit.GUID) and unit.Dead and UnitCanBeLooted(unit.Pointer)
        end
    )

    if not body then
       KW.Log.Write('没有可拾取的尸体')
        local lootTotal = CurrentTotalMoney()
        print(lootTotal - ThisTimeLootTotalMoney)
        print('本次获得总收益:', GetCoinTextureString(lootTotal - ThisTimeLootTotalMoney))
        STATUS = 'GOOUT'
    end
end

local function LogicStartGoOut()
    print('本次副本耗时：', math.floor((GetTime() - ThisTimeTotalTime) / 60))
    print('出副本')

    --KW.NavTo(908.5566, 1400.1373, 18.0238)
    --KW.NavTo(874.5905, 1396.6550, 18.0061)
    --KW.NavTo(870.9828, 1360.9590, 18.0061)
    --KW.NavTo(870.3223, 1324.0260, 18.0061)
   KW.NavTo(853.5751, 1320.6088, 18.6734)
    DungeonTimer.Wait()
   KW.GoOutDungeon(852.1581, 1302.8694, 3.7197)
    STATUS = 'ResetBuff'
    needResetInstances = true
    Wait(3000)
end

--[[
    主逻辑循环
--]]
-- 副本计时器


DungeonTimer = {
    -- 计时器设定时间 单位秒
    MaxTime = GetSetting('爆本限制(单位:分钟)') * 60,
    StartTime = nil,
    -- 开始计时
    Start = function()
        if not DungeonTimer.StartTime then
            DungeonTimer.StartTime = GetTime()
            print('副本计时器启动')
        end
    end,
    -- 等待计时器结束
    Wait = function()
        print('等待计时器结束')
        DungeonTimer.MaxTime = GetSetting('爆本限制(单位:分钟)') * 60
        while GetTime() - DungeonTimer.StartTime < DungeonTimer.MaxTime do
            -- print('等待副本计时器结束,剩余', math.floor(DungeonTimer.MaxTime - (GetTime() - DungeonTimer.StartTime)), '秒')
           KW.Log.Status('防爆本倒计时%s秒', math.floor(DungeonTimer.MaxTime - (GetTime() - DungeonTimer.StartTime)))
            Wait(1000)
        end
        DungeonTimer.StartTime = nil
    end
}

local function jijiu()
    -- RunMacroText('/cast 急救')

    -- for i = 1, GetNumTradeSkills()do
    -- a,_,b = GetTradeSkillInfo(i)
    -- if a and (a:find("厚符文布绷带") or a:find("魔纹绷带") or a:find("厚丝质绷带") or a:find("厚绒线绷带") or a:find("厚亚麻绷带") or a:find("亚麻绷带"))and b>0 then
    -- DoTradeSkill(i,b)
    -- break
    -- end
    -- end
    -- Wait(10000)
    -- CastSpellByName('急救')
    -- MakeLeastCrafts()	厚
    CastSpellByName('急救')
    MakeMostCrafts()
    Wait(3000)
end

local frame = nil
local IsLooting = false
local NeedEnterDungeon = false
local NeedOutDungeon = false
local PlayerLeavedDungeon = false
local PlayerInDungeon = false
local WaitInDungeon = false
local frameOnEvent = function(self, event, ...)
    local message, sender, language, arg4, arg5, arg6 = ...

    -- 队长在队伍频道消息
    if event == 'CHAT_MSG_PARTY_LEADER' then
        -- 队员在队伍频道消息
        if not UnitIsGroupLeader('player') and message == 'ENTER_DUNGEON' then
            -- 如果我不是队长并且接收到队长消息 ENTER_DUNGEON
            NeedEnterDungeon = true
            print('收到命令进入副本...')
        end
        if not UnitIsGroupLeader('player') and message == 'OUT_DUNGEON' then
            -- 如果我不是队长并且接收到队长消息 OUT_DUNGEON
            NeedOutDungeon = true
            print('收到命令退出副本...')
        end
    elseif event == 'CHAT_MSG_PARTY' then
        if UnitIsGroupLeader('player') and message == 'PLAYER_LEAVED_DUNGEON' then
            -- 如果我是队长并且接收到队员消息 PLAYER_LEAVED_DUNGEON
            PlayerLeavedDungeon = true
            print('队员已经离开副本')
        end
        if UnitIsGroupLeader('player') and message == 'PLAYER_IN_DUNGEON' then
            -- 如果我是队长并且接收到队员消息 PLAYER_LEAVED_DUNGEON
            PlayerInDungeon = true
            print('队员已经进入副本')
        end
    elseif event == 'CHAT_MSG_SYSTEM' then
        -- if  message:find('你在短时间内进入副本的次数过多') then
        if message == '你在短时间内进入副本的次数过多。' then
            -- 系统消息
            WaitInDungeon = true
            print('爆本了 等待几分钟')
        end
    elseif event == 'LOOT_OPENED' then
        IsLooting = true
    elseif event == 'LOOT_CLOSED' then
        IsLooting = false
    end
end

local blackFrame = nil

function profile.OnStart()
    -- InitialTime = GetTime()
    -- InitialWealth = CurrentTotalMoney()

    -- CurrentStartingTime = InitialTime
    -- CurrentStartingWealth = InitialWealth

    -- profile.IgnoreRest = true
	KW.AutoFight(false)
   KW.CurrentSettings.FoodPercent = 0
   KW.CurrentSettings.DrinkPercent = 0
   KW.Log.Write('=======================')
   KW.Log.Write('KW - 祖尔格拉布法师单刷一波流v2.1')
   KW.Log.Write('=======================')
   KW.Log.Write(' 作者:KW_X 更新:2020-04-20')
   KW.Log.Write('=======================')
   KW.Log.Write(' 开始运行')
   KW.Log.Write('=======================')

    if not frame then
        frame = CreateFrame('Frame', nil, UIParent)
        frame:SetScript('OnEvent', frameOnEvent)
    end
    frame:RegisterEvent('LOOT_OPENED')
    frame:RegisterEvent('LOOT_CLOSED')
    frame:RegisterEvent('CHAT_MSG_SYSTEM')
    frame:RegisterEvent('CHAT_MSG_PARTY')
    frame:RegisterEvent('CHAT_MSG_PARTY_LEADER')

    if not _G['Blizzard_AzeritblackUI'] then
        blackFrame = CreateFrame('Frame', nil, UIParent)
        blackFrame:SetWidth(GetScreenWidth())
        blackFrame:SetHeight(GetScreenHeight())
        blackFrame:SetPoint('TOPLEFT', 0, 0, 'BOTTOMLEFT', 0, 0)
        blackFrame:SetPoint('BOTTOMRIGHT', nil, 'BOTTOMRIGHT', 0, 0)
        blackFrame.texture = blackFrame:CreateTexture()
        blackFrame.texture:SetAllPoints(blackFrame)
        blackFrame.texture:SetColorTexture(0, 0, 0)
        blackFrame.text = blackFrame:CreateFontString(nil, 'ARTWORK')
        blackFrame.text:SetPoint('CENTER', 0, 0)
        _G['Blizzard_AzeritblackUI'] = blackFrame
    else
        blackFrame = _G['Blizzard_AzeritblackUI']
    end
    blackFrame.text:SetSpacing(15)
    blackFrame.text:SetTextColor(0.92, 0.22, 0.52)
    blackFrame.text:SetFont(STANDARD_TEXT_FONT, 18, 'OUTLINE')
    local text = 'EWT - 祖尔格拉布法师单刷一波流v2.1\n'
    text = text .. '广告时刻..\n'
    text = text .. '运行中不要点击鼠标和键盘\n'
    blackFrame.text:SetText(text)
    blackFrame:SetFrameStrata('LOW')

    -- 设置玩家头像最高级
    PlayerFrame:SetFrameStrata('HIGH')
    -- 设置聊天对话框1最高级
    ChatFrame1:SetFrameStrata('HIGH')
    -- 设置聊天对话框2最高级
    ChatFrame2:SetFrameStrata('HIGH')
    -- 设置聊天选项卡1最高级
    ChatFrame1Tab:SetFrameStrata('HIGH')
    -- 设置聊天选项卡2最高级
    ChatFrame2Tab:SetFrameStrata('HIGH')
    -- 设置装备耐久图最高级
    DurabilityFrame:SetFrameStrata('HIGH')
    -- 设置BUFF列表
    BuffFrame:SetFrameStrata('HIGH')
    blackFrame:Hide()
end

function profile.OnStop()
    -- local currentTime = GetTime()
    -- local currentWealth = CurrentTotalMoney()
    -- local totalTimeConsuming = currentTime - InitialTime
    -- local totalProfit = currentWealth - InitialWealth
    -- local totalProfitRate = totalTimeConsuming == 0 and 0 or (totalProfit / totalTimeConsuming * 3600)

    --TestCore.Log.Info('总耗时：  ' .. math.floor(totalTimeConsuming / 60) .. '分钟')
    --TestCore.Log.Info('总收益：  ' .. GetCoinTextureString(totalProfit))
    --TestCore.Log.Info('总收益率：' .. GetCoinTextureString(totalProfitRate) .. '/小时')

    profile.IgnoreRest = false
	if IsHackEnabled('hover') then SetHackEnabled('hover', false) end
    if IsHackEnabled('multijump') == true then
        RunMacroText('.multijump')
    end	
    --KW.CurrentSettings.FoodPercent = 0
    --KW.CurrentSettings.DrinkPercent = 0
   KW.Log.Write('=======================')
   KW.Log.Write('KW - 祖尔格拉布法师单刷一波流v2.1')
   KW.Log.Write('=======================')
   KW.Log.Write(' 停止运行')
   KW.Log.Write('=======================')

    if frame then
        frame:UnregisterEvent('LOOT_OPENED')
        frame:UnregisterEvent('LOOT_CLOSED')
        frame:UnregisterEvent('CHAT_MSG_SYSTEM')
        frame:UnregisterEvent('CHAT_MSG_PARTY')
        frame:UnregisterEvent('CHAT_MSG_PARTY_LEADER')
    end

    -- 还原玩家头像级别
    PlayerFrame:SetFrameStrata('LOW')
    -- 还原聊天对话框1级别
    ChatFrame1:SetFrameStrata('LOW')
    -- 还原聊天对话框2级别
    ChatFrame2:SetFrameStrata('LOW')
    -- 还原聊天选项卡1级别
    ChatFrame1Tab:SetFrameStrata('LOW')
    -- 还原聊天选项卡2级别
    ChatFrame2Tab:SetFrameStrata('LOW')
    -- 还原装备耐久图级别
    DurabilityFrame:SetFrameStrata('LOW')
    -- 还原BUFF列表
    BuffFrame:SetFrameStrata('LOW')
end

local  function showBlackFrame() 
--if blackFrame then blackFrame:Show() end 
end

local  function hideBlackFrame() 
--if blackFrame then blackFrame:Hide() end 
end


local function NearbyUnitInParty(range)
    --[[
        -- 使用方法
        if NearbyUnitInParty(100) then
            print('附近有队员 停止脚本!')
           TestCore.Stop()
            return
        end
    ]]
    local x, y, z  = ObjectPosition('player')
    local target =
       KW.ObjectManager.GetWoWUnit(
        function(unit)
            -- print(unit:DistanceTo(x,y,z), UnitCanAttack("player", unit.Pointer))
            return unit:DistanceTo(x,y,z) <= range and UnitInParty(unit.Pointer) and unit.GUID ~=KW.Me.GUID and unit:DistanceTo(-11916.7246, -1242.6409, 92.5353) > 20
        end
    )
    return target
end


local function buffs()
    if GetItemCount(4422, false, false) >= 1 and not KW.Me:HasAura(8101) then
       TestCore.Core.UseItem(4422)
        Wait(1000)
        print('耐力卷轴 III')
    end
    if GetItemCount(4424, false, false) >= 1 and not KW.Me:HasAura(8114) then
       TestCore.Core.UseItem(4424)
        Wait(1000)
        print('精神卷轴 III')
    end
    if GetItemCount(4421, false, false) >= 1 then
       TestCore.Core.UseItem(4421)
        Wait(1000)
        print('保护卷轴 III')
    end
    if GetItemCount(4425, false, false) >= 1 then
       TestCore.Core.UseItem(4425)
        Wait(1000)
        print('敏捷卷轴 III')
    end
    if GetItemCount(4426, false, false) >= 1 then
       TestCore.Core.UseItem(4426)
        Wait(1000)
        print('力量卷轴 III')
    end

    if GetItemCount(8079, false, false) < 10 and GetItemCount(8078, false, false) < 10 and KW.Me.FreeBagSlots >= 1 then
        print('制造魔法水')
        if IsSpellKnown(10140) then
            CastSpellByID(10140)
        else
            CastSpellByID(10139)
        end
        Wait(3500)
    end
    if GetItemCount(8076, false, false) < 10 and KW.Me.FreeBagSlots >= 1 then
        print('制造魔法面包')
        if IsSpellKnown(10145) then
            CastSpellByID(10145)
        end
        Wait(3500)
    end

    if (UnitPower('player', 0) / UnitPowerMax('player', 0) * 100) < 80 then
        print('坐下回蓝')
        DoEmote('SIT')
        Wait(2000)
        MoveBackwardStart()
        Wait(100)
        MoveBackwardStop()
        Wait(500)
    end

    if KeepBuff(10157, 900) then
        CastSpellByID(10157)
        Wait(2000)
        print('奥术智慧')
    end
    if KeepBuff(22783, 900) then
        CastSpellByID(22783)
        Wait(2000)
        print('法师护甲')
    end
    if KeepBuff(10174, 600) then
        CastSpellByID(10174)
        Wait(2000)
        print('魔法抑制')
    end

    if (UnitPower('player', 0) / UnitPowerMax('player', 0) * 100) < 80 then
        print('坐下回蓝')
        DoEmote('SIT')
        Wait(2000)
        MoveBackwardStart()
        Wait(100)
        MoveBackwardStop()
        Wait(500)
    end
    if GetItemCount(8008, false, false) < 1 and KW.Me.FreeBagSlots >= 1 then
        print('制造魔法宝石')
        CastSpellByID(10054)
        Wait(4500)
    end
    if GetItemCount(8007, false, false) < 1 and KW.Me.FreeBagSlots >= 1 then
        print('制造魔法黄水晶')
        CastSpellByID(10053)
        Wait(4500)
    end

    if (UnitPower('player', 0) / UnitPowerMax('player', 0) * 100) < 80 then
        print('坐下回蓝')
        DoEmote('SIT')
        Wait(2000)
    end
end

local function pullone()
   KW.NavTo(-11917.2588, -1275.5367, 85.3852)
    MoveToStation(-11929.2881, -1274.7162, 85.3828)
    MoveToStation(-11934.3330, -1258.0546, 85.3536)

	
    -- FaceBlink(813.8098, -585.8922, -32.434)
    -- MoveTo(-11957.5918, -1292.4235, 75.6655)
	-- Wait(3500)
    -- if IsHackEnabled('waterwalk') then
        -- RunMacroText('.waterwalk')
    -- end	
	
	-- MoveTo(-11963.8789, -1305.8167, 75.6524)
	-- Wait(3500)
	-- MoveTo(-11961.4834, -1340.1772, 75.6641)
	-- Wait(6000)
	
	
	-- MoveTo(-11941.8418, -1358.1362, 60.7039)
	-- Wait(8000)
	-- MoveTo(-11942.5088, -1368.5333, 61.4664)
	-- Wait(3000)
	-- MoveTo(-11945.0479, -1376.1505, 62.3155)
	-- Wait(3500)
	-- MoveTo(-11941.7783, -1388.0416, 62.0880)
	-- Wait(3500)
	-- MoveTo(-11946.5000, -1394.6875, 65.2085)
	-- Wait(3500)
	-- MoveTo(-11957.7314, -1395.9927, 69.6510)
	-- Wait(3500)
	-- MoveTo(-11964.0791, -1402.8646, 72.2495)
	-- Wait(3500)
	-- MoveTo(-11962.4229, -1417.7010, 71.9418)
	-- Wait(3500)
	-- MoveTo(-11956.5889, -1417.2428, 76.4466)
	-- Wait(2500)
	-- MoveTo(-11954.7480, -1411.4512, 80.5921)
	-- Wait(2500)
	-- MoveTo(-11954.5088, -1407.9696, 83.8229)
	-- Wait(2000)
	-- MoveTo(-11950.1309, -1408.7395, 85.8048)
	-- Wait(1000)
	-- MoveTo(-11946.2559, -1412.3998, 86.7486)
	Wait(1000)	
    if buffs() then
    end
end


local function RightTo()
    -- 右移动

    StrafeRightStart()
    Wait(0)	
    local timer = GetTime()

    while true do
        print(GetTime() - timer .. '='..KW.Me.PosY)
        if GetTime() - timer > 0.08 or KW.Me.PosY == -1499 then
            StrafeRightStop()
            RunMacroText('.stopfall')
            break
        end
        Wait(0)
    end
    StrafeRightStop()
    RunMacroText('.stopfall')

end

local function LeftTo()
    -- 左移动

    StrafeLeftStart()
    -- Wait(0)	
    local timer = GetTime()
    while true do
        print(GetTime() - timer .. '='..KW.Me.PosY)
        if GetTime() - timer > 0.15 or KW.Me.PosY == -1502 then
            StrafeLeftStop()
            RunMacroText('.stopfall')
            break
        end
        Wait(0)
    end
    StrafeLeftStop()
    RunMacroText('.stopfall')

end

profile.IgnoreGotoTown = true


function profile.Logic(Core, me)
    -- if KW.UserInfo.Key:find('KW%-N') then
    -- 	KW.Log.Error('普通卡不支持此脚本')
    -- 	TestCore.Stop()
    -- 	return
    -- end

	--if TestCore.Activation.GeKWeyMark() ~= '888' then
       --KW.Log.Error('内部专用脚本,此卡类型不可使用')
       --TestCore.Stop()
        --return
    --end
	
    local Me =KW.Me
    CurrentTotalMoney()
    print('祖尔格拉布')
    -- if IsHackEnabled('multijump') == true then
        -- RunMacroText('.multijump')
    -- end
   TestCore.Settings.Set('MoveChecking.Enabled', false)
   TestCore.Settings.Set('MoveTo.RandomJumpChance', 0)
	-- SetCVar("maxFPS", 50)
    -- SetCVar("maxFPSBk", 50)	
	
   KW.AutoFight(false)
    RunMacroText('/ffa')
   TestCore.Event.Add(
        'PLAYER_LEAVING_WORLD',
        function()
            hideBlackFrame()
        end
    )
	
			-- while KW.Me.PosZ < 81 do
				--KW.MovementManager.Jump()
				--KW.WaitTime(350)
				-- RunMacroText('.stopfall')
			-- end			
		-- if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end
	
		-- MoveToStation(-11765.1885, -1815.6803, 81.3562, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
		-- MoveToStation(-11688.9707, -1716.7537, 81.3562, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)		
		-- MoveToStation(-11689.4121, -1603.6813, 81.3562, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)						
					
		-- MoveToStation(-11696.7324, -1601.2566, 82.6138, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
		-- if IsHackEnabled('hover') then SetHackEnabled('hover', false) end	
			--KW.SpaceWalkTo(-11736.7783, -1541.0862, 42.0044, 400)					


			-- while KW.Me.PosZ > 41 do
				--KW.MovementManager.Jump()
				--KW.WaitTime(1500)
				-- RunMacroText('.stopfall')
			-- end			
		
			-- while KW.Me.PosZ < 41 do
				--KW.MovementManager.Jump()
				--KW.WaitTime(350)
				-- RunMacroText('.stopfall')
			-- end			
		-- if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end		
	
	
		-- MoveToStation(-11694.6543, -1562.3719, 82.0318, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
		-- if IsHackEnabled('hover') then SetHackEnabled('hover', false) end	
			--KW.SpaceWalkTo(-11735.1025, -1532.9949, 41.9478, 500)					

		-- if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end	

			-- while KW.Me.PosZ < 41 do
				--KW.MovementManager.Jump()
				--KW.WaitTime(350)
				-- RunMacroText('.stopfall')
			-- end			
			
		-- MoveToStation(-11735.1025, -1532.9949, 41.9478, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
			
    -- Wait(2000000)

    while Core.Wait(100) do
       TestCore.Log.Debug('循环开始')
       KW.CurrentSettings.DrinkPercent = 0
       KW.CurrentSettings.DrinkMaxPercent = 100
       KW.CurrentSettings.FoodPercent = 0
       KW.CurrentSettings.FoodMaxPercent = 100
        DMW.Settings.profile.Rotation['制造法力石'] = false
        CheckDanger_FrostNova = false
       TestCore.Settings.Set('MoveChecking.Enabled', false)
       TestCore.Settings.Set('MoveTo.RandomJumpChance', 0)
       KW.CurrentSettings.AutoLoot = false
	-- 关闭水下呼吸检测
		TestCore.Settings.Set('MoveTo.PreventionOfDrowning.Enabled', false)

        if GetMapId() == 309 then
            --local Mana = (UnitPower('player', 0) / UnitPowerMax('player', 0) * 100)
            -- 副本中
            print('副本中')
		if IsMounted()	then
			RunMacroText('/dismount')
			Wait(500)
		end
					
			if KW.NeedGotoTown() then					
					MoveToStation(-11916.8535, -1235.6573, 92.5352)			
					KW.GoOutDungeon(-11917.3094, -1220.6643, 107.5282)
					Wait(5000)	
					TestCore.Reset()
					profile.IgnoreGotoTown = false
					KW.AutoFight(false)
					Wait(5000)			
			end			
            profile.IgnoreGotoTown = true
            DungeonTimer.Start()
            ThisTimeTotalTime = GetTime()
           KW.AutoFight(false)
            CheckDanger_FrostNova = false

            STATUS = ''

            if GetSetting('开启大号带刷') and KW.Me:DistanceTo(-11916.6152, -1240.7395, 92.5338) <= 20 then
                PlayerInDungeon = false
                if not PlayerInDungeon then
                    SendChatMessage('ENTER_DUNGEON', 'PARTY')
                    while not PlayerInDungeon do
                        Wait(500)
                    end
                    PlayerInDungeon = false
                end
            end

            if GetSetting('进本后就位确认') then
                RunMacroText('/readycheck')
            end

		if IsHackEnabled('hover') then SetHackEnabled('hover', false) end	

	
                if pullone() then
                end
				
showBlackFrame()				
		if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end		
		-- if not IsMounted()	then
			-- RunMacroText('/cast ' ..KW.CurrentSettings.MountName)
			-- Wait(5000)
		-- end
		--KW.SpaceWalkTo(-11889.1758, -1534.0568, 38.6161, 350)
		-- RunMacroText('/dismount')

			while KW.Me.PosZ < 110 do
				KW.MovementManager.Jump()
				KW.WaitTime(350)
				RunMacroText('.stopfall')
			end	
			
if GetSetting('拉老虎') then	
   KW.Log.Write('=======================')
   KW.Log.Write(' 老虎+鳄鱼')
   KW.Log.Write('=======================')
		MoveToStation(-11893.1807, -1533.9006, 110)	
		if IsHackEnabled('hover') then SetHackEnabled('hover', false) end
		
			while KW.Me.PosZ > 81 do
				KW.MovementManager.Jump()
				KW.WaitTime(1500)
				RunMacroText('.stopfall')
			end			
		
		
			while KW.Me.PosZ < 81 do
				KW.MovementManager.Jump()
				KW.WaitTime(350)
				RunMacroText('.stopfall')
			end	
		if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end	
	
		MoveToStation(-11807.0137, -1867.2856, 81.3562, function()
                   if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					end, 1)	
					
    Wait(500)
    local mob77 =
       KW.ObjectManager.GetWoWUnit(
        function(unit)
            if not unit.Dead and (unit.ObjectID == 11352) and
                    unit.Position:DistanceTo(-11791.5898, -1851.4008, 45.7640) <= 45
             then
                return true
            end
            return false
        end
    )
    while mob77 ~= nil do
        mob77 =
           KW.ObjectManager.GetWoWUnit(
            function(unit)
                if
                not unit.Dead and (unit.ObjectID == 11352) and
                    unit.Position:DistanceTo(-11791.5898, -1851.4008, 45.7640) <= 45
             then
                    return true
                end
                return false
            end
        )
        Wait(500)
    end					

--老虎					
		local target
		local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		local target = SelectUnitByLocationAndId(-11818.3008, -1892.8357, 48.6931, 5, 11361, true)
		Wait(200)
		Spell.Fireball:Cast(target, 1)	
		Wait(1000)	
		
		local target
		local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		local target = SelectUnitByLocationAndId(-11826.7207, -1871.1613, 52.6418, 5, 11361, true)
		Wait(200)
		Spell.Fireball:Cast(target, 1)	
		Wait(1500)			





		
		
		-- MoveToStation(-11765.6094, -1817.2048, 81.3838, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
					
					
		-- MoveToStation(-11599.7734, -1662.8575, 81.3838, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)						
		-- MoveToStation(-11552.3994, -1638.2410, 81.3838, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
					

					
		-- local target
		-- local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		-- local target = SelectUnitByLocationAndId(-11519.0391, -1664.1144, 71.3234, 5, 11356, true)
		-- Wait(200)
		-- Spell.Fireball:Cast(target, 1)	
		-- Wait(castTime)	

		-- MoveToStation(-11549.5596, -1600.4604, 81.3838, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
					
		-- local target
		-- local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		-- local target = SelectUnitByLocationAndId(-11525.1094, -1582.6989, 71.3234, 5, 11356, true)
		-- Wait(200)
		-- Spell.Fireball:Cast(target, 1)	
		-- Wait(castTime)	





		
		
		-- MoveToStation(-11605.7275, -1588.0356, 81.3838, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
		-- MoveToStation(-11655.1104, -1592.3560, 81.3838, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)		
					
		MoveToStation(-11765.1885, -1815.6803, 81.3562, function()
                   if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					end, 1)	
		MoveToStation(-11688.9707, -1716.7537, 81.3562, function()
                   if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					end, 1)		
		MoveToStation(-11689.4121, -1603.6813, 81.3562, function()
                   if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					end, 1)						
					
		MoveToStation(-11696.7324, -1601.2566, 82.6138, function()
                   if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					end, 1)	
		if IsHackEnabled('hover') then SetHackEnabled('hover', false) end	
			KW.SpaceWalkTo(-11736.7783, -1541.0862, 42.0044, 400)					


			while KW.Me.PosZ > 41 do
				KW.MovementManager.Jump()
				KW.WaitTime(1500)
				RunMacroText('.stopfall')
			end			
		
			while KW.Me.PosZ < 41 do
				KW.MovementManager.Jump()
				KW.WaitTime(350)
				RunMacroText('.stopfall')
			end			
		if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end	
			
		-- MoveToStation(-11735.1025, -1532.9949, 41.9478, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
		-- MoveToStation(-11878.1563, -1564.8898, 42.0089, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
		-- MoveToStation(-11928.1162, -1531.9352, 42.0089, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)	
		-- MoveToStation(-11848.9141, -1563.9871, 41.9478, function()
                   -- if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					-- end, 1)
			
		MoveToStation(-11828.5225, -1528.6418, 42.6062, function()
                   if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					end, 1)	


			
		
else		
   KW.Log.Write('=======================')
   KW.Log.Write(' 鳄鱼')
   KW.Log.Write('=======================')		
		MoveToStation(-11893.1807, -1533.9006, 110)	
		if IsHackEnabled('hover') then SetHackEnabled('hover', false) end
		
			while KW.Me.PosZ > 41 do
				KW.MovementManager.Jump()
				KW.WaitTime(1500)
				RunMacroText('.stopfall')
			end			
		
		
			while KW.Me.PosZ < 41 do
				KW.MovementManager.Jump()
				KW.WaitTime(350)
				RunMacroText('.stopfall')
			end		
end		
		
		
		
        if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end		
		MoveToStation(-11869.2754, -1500.5857, 41.6934)		
		
                local mobs =
                   KW.ObjectManager.GetWoWUnit(
                    function(unit)
                        if
                            not unit.Dead and (unit.ObjectID == 15043) and unit.Position:DistanceTo(-11892.9072, -1496.0400, 12.9789) <= 20
                         then
                            return true
                        end
                        return false
                    end
                )		
                if mobs == nil then
                    print('残本，出本重置')
					
                    needResetInstances = true
					while KW.Me.PosZ < 110 do
						KW.MovementManager.Jump()
						KW.WaitTime(350)
						RunMacroText('.stopfall')
					end		
				
				if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end		
				
					MoveToStation(-11795.2100, -1288.7513, 110.0863)
					MoveToStation(-11870.6475, -1275.9053, 110.0863)
				if IsHackEnabled('hover') then SetHackEnabled('hover', false) end	
					KW.SpaceWalkTo(-11900.7969, -1264.5450, 85.3843, 500)
					
					MoveToStation(-11909.2168, -1276.8579, 85.3852)
					MoveToStation(-11917.1055, -1272.9203, 85.3852)	
					MoveToStation(-11916.8535, -1235.6573, 92.5352)
                    if GetSetting('队伍喊话通知') then
                        SendChatMessage(GetSetting('出本喊话'), 'PARTY')
                    end
                    if GetSetting('就位确认') then
                        RunMacroText('/readycheck')
                    end					
					KW.GoOutDungeon(-11917.3094, -1220.6643, 107.5282)
					TestCore.Reset()
					Wait(5000)					
                end			
		
		local target
		local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		local target = SelectUnitByLocationAndId(-11897.2539, -1500.9690, 14.7174, 8, 15043, true)
		Wait(200)
		Spell.Fireball:Cast(target, 1)	
		Wait(castTime)	
		


	
		

-- 第二波		
		-- MoveToStation(-11804.7734, -1466.7998, 42.5862)
		-- local target
		-- local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		-- local target = SelectUnitByLocationAndId(-11819.8330, -1494.7485, 13.3933, 8, 15043, true)
		
		-- Wait(200)
		-- Spell.Fireball:Cast(target, 1)	
		-- Wait(castTime)	
				
-- 第三波		
		MoveToStation(-11796.9316, -1428.3662, 41.6934)	
		
		local target
		local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		local target = SelectUnitByLocationAndId(-11785.0176, -1402.7172, 13.1889, 5, 15043, true)
		-- -11785.0176, -1402.7172, 13.1889
		-- -11777.0273, -1404.8535, 12.7910
		Wait(200)
		Spell.Fireball:Cast(target, 1)	
		Wait(castTime)	
		
		
		MoveToStation(-11712.6396, -1483.9326, 42.5862, function()
                   if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					end, 1)		
		MoveToStation(-11686.1250, -1641.4142, 42.5862)	
		MoveToStation(-11696.5957, -1719.5770, 42.5862)	
		MoveToStation(-11726.9600, -1755.6370, 42.5862)	
		MoveToStation(-11792.1768, -1757.9337, 42.5862)	





		
		
		MoveToStation(-11854.5098, -1743.7787, 42.0089)		
		local target
		local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		local target = SelectUnitByLocationAndId(-11840.4473, -1761.0546, 13.4058, 8, 15043, true)
		Wait(200)
		Spell.Fireball:Cast(target, 1)	
		Wait(castTime)			
					
					
		MoveToStation(-11890.6729, -1707.9423, 42.0089)		
		local target
		local castTime = Spell.Fireball:CastTime(1) * 1000 + 100
		local target = SelectUnitByLocationAndId(-11901.1221, -1731.6802, 13.1319, 8, 15043, true)
		Wait(200)
		Spell.Fireball:Cast(target, 1)	
		Wait(castTime)		

		MoveToStation(-11888.3926, -1677.2455, 42.5862, function()
                   if not KW.Me:HasAura(10193) then CastSpellByID(10193) print('法力护盾') end				
					end, 1)		
		MoveToStation(-11873.0947, -1564.0895, 41.7135)		
		
		MoveToStation(-11780.5156, -1446.7654, 42.5662)				
		MoveToStation(-11719.8809, -1472.1920, 42.5662)				
		MoveToStation(-11708.1729, -1500.8672, 41.5306)	
		if IsHackEnabled('hover') then SetHackEnabled('hover', false) end			
		Wait(200)			
needResetInstances = true			
			
                local mobs =
                   KW.ObjectManager.GetWoWUnit(
                    function(unit)
                        if
                            not unit.Dead and
                                (unit.ObjectID == 15043) and
                                unit.Position:DistanceTo(-11739.8564, -1491.5248, 41.5408) <= 18 and
                                unit.IsTargetingMe
                         then
                            return true
                        end
                        return false
                    end
                )
                while mobs == nil do
                    mobs =
                   KW.ObjectManager.GetWoWUnit(
                    function(unit)
                        if
                            not unit.Dead and
                                (unit.ObjectID == 15043) and
                                unit.Position:DistanceTo(-11739.8564, -1491.5248, 41.5408) <= 18 and
                                unit.IsTargetingMe
                         then
                            return true
                        end
                        return false
                    end
                )
                    print('等待下雨')
                    Wait(500)
                end
                --统计敌人数量
                local enemies100y =
                   KW.ObjectManager.GetWoWUnits(
                    function(unit)
                        return not unit.Dead and UnitCanAttack('PLAYER', unit.Pointer) and unit.IsTargetingMe
                    end,
                    function(x, y)
                        return x.Distance < y.Distance
                    end
                )
                print('拉怪总数=', #enemies100y)
				print('当前生命值=',KW.Me.Health, '当前法力值=',KW.Me.Power)				
                while Spell.Blizzard:CD() ~= 0 do
                    Wait(0)
                end
				if KW.Me.Level >= 60 then
					if KW.Me:HasAura(12536) then
						BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)
					else
						BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
					end	
				else
					if KW.Me:HasAura(12536) then
						BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)
					else
						BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
					end					
				end
                Wait(500)
                if BlizzardLeftTime() == 0 then
					if KW.Me.Level >= 60 then
						if KW.Me:HasAura(12536) then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)
						else
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
						end	
					else
						if KW.Me:HasAura(12536) then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)
						else
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
						end					
					end
                end
                Wait(2000)
                while BlizzardLeftTime() > 4 do
                    Wait(0)
                end	
				
                -- local mobs =
                    --KW.ObjectManager.GetWoWUnit(
                    -- function(unit)
                        -- if
                            -- not unit.Dead and
                                -- (unit.ObjectID == 15043) and
                                -- unit.Position:DistanceTo(-11727.1953, -1493.9579, 36.5818) <= 3.5 and
                                -- unit.IsTargetingMe
                         -- then
                            -- return true
                        -- end
                        -- return false
                    -- end
                -- )				
				-- if mobs == nil then	
					-- while Spell.Blizzard:CD() ~= 0 do
						-- Wait(0)
					-- end
					-- if KW.Me:HasAura(12536) then
						-- BlizzardTo(-11734.0693, -1491.7742, 40.4443, 6)
					-- else
						-- BlizzardTo(-11734.0693, -1491.7742, 40.4443, 1)
					-- end				
					-- Wait(500)
					-- if BlizzardLeftTime() == 0 then
						-- if KW.Me:HasAura(12536) then
							-- BlizzardTo(-11734.0693, -1491.7742, 40.4443, 6)
						-- else
							-- BlizzardTo(-11734.0693, -1491.7742, 40.4443, 1)
						-- end	
					-- end
					-- Wait(3000)
					-- while BlizzardLeftTime() > 3.5 do
						-- Wait(0)
					-- end				
				-- end				
	
             while Me.Combat do
                    Wait(0)
				if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end
				Wait(100)
				MoveToStation(-11709.1299, -1504.5240, 41.5306)	
				if IsHackEnabled('hover') then SetHackEnabled('hover', false) end
				Wait(200)				
							
				if KW.Me.Power >= 500 then			
					while Spell.Blizzard:CD() ~= 0 do
						Wait(0)
					end
					if KW.Me.Level >= 60 then
						if KW.Me:HasAura(12536) then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)
						elseif KW.Me.Power > 4000 then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)						
						else
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
						end
					else
						if KW.Me:HasAura(12536) then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)
						elseif KW.Me.Power > 4000 then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)						
						else
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
						end	
					end
					Wait(500)
					if BlizzardLeftTime() == 0 then
						if KW.Me.Level >= 60 then
							if KW.Me:HasAura(12536) then
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)
							elseif KW.Me.Power > 4000 then
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)						
							else
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
							end
						else
							if KW.Me:HasAura(12536) then
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)
							elseif KW.Me.Power > 4000 then
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)						
							else
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
							end	
						end
					end
					Wait(3000)
					while BlizzardLeftTime() > 1 do
						Wait(0)
					end	
				else	
					Wait(200)
					if GetSpellCooldown(12051) == 0 then
						CastSpellByID(12051)
						Wait(6000)
						print('唤醒')
					end				
				end	
					if KW.Me.Power < 3000 then
						TestCore.Core.UseItem(8008)
						TestCore.Core.UseItem(8007)
					end	
					
				if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end
				Wait(100)
				MoveToStation(-11708.1729, -1500.8672, 41.5306)	
				if IsHackEnabled('hover') then SetHackEnabled('hover', false) end			
				Wait(200)
				if KW.Me.Power >= 280 then	
					while Spell.Blizzard:CD() ~= 0 do
						Wait(0)
					end
					if KW.Me.Level >= 60 then
						if KW.Me:HasAura(12536) then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)
						elseif KW.Me.Power > 4000 then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)						
						else
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
						end
					else
						if KW.Me:HasAura(12536) then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)
						elseif KW.Me.Power > 4000 then
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)						
						else
							BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
						end	
					end			
					Wait(500)
					if BlizzardLeftTime() == 0 then
						if KW.Me.Level >= 60 then
							if KW.Me:HasAura(12536) then
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)
							elseif KW.Me.Power > 4000 then
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 6)						
							else
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
							end
						else
							if KW.Me:HasAura(12536) then
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)
							elseif KW.Me.Power > 4000 then
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 5)						
							else
								BlizzardTo(-11739.8564, -1491.5248, 41.5408, 1)
							end	
						end
					end
					Wait(3000)
					while BlizzardLeftTime() > 1.5 do
						Wait(0)
					end	
				end	
					-- local mobs =
						--KW.ObjectManager.GetWoWUnit(
						-- function(unit)
							-- if
								-- not unit.Dead and
									-- (unit.ObjectID == 15043) and
									-- unit.Position:DistanceTo(-11727.1953, -1493.9579, 36.5818) <= 3.5 and
									-- unit.IsTargetingMe
							 -- then
								-- return true
							-- end
							-- return false
						-- end
					-- )				
					-- if mobs == nil then	
						-- while Spell.Blizzard:CD() ~= 0 do
							-- Wait(0)
						-- end
						-- if KW.Me:HasAura(12536) then
							-- BlizzardTo(-11734.0693, -1491.7742, 40.4443, 6)
						-- else
							-- BlizzardTo(-11734.0693, -1491.7742, 40.4443, 1)
						-- end				
						-- Wait(500)
						-- if BlizzardLeftTime() == 0 then
							-- if KW.Me:HasAura(12536) then
								-- BlizzardTo(-11734.0693, -1491.7742, 40.4443, 6)
							-- else
								-- BlizzardTo(-11734.0693, -1491.7742, 40.4443, 1)
							-- end	
						-- end
						-- Wait(3000)
						-- while BlizzardLeftTime() > 3.5 do
							-- Wait(0)
						-- end				
					-- end						

				end



		

            print('本次副本耗时：', math.floor((GetTime() - ThisTimeTotalTime) / 60), '分钟')
            -- 拾取
            local Lootunit =
               KW.ObjectManager.GetWoWUnit(
                function(unit)
                    if
                        unit.Dead and
                            (unit.ObjectID == 15043) and
                            UnitCanBeLooted(unit.Pointer)
                     then
                        return true
                    end
                    return false
                end
            )
            if GetSetting('拾取尸体') and Lootunit ~= nil then
                STATUS = 'Lootin'
               KW.CurrentSettings.AutoLoot = false
                -- DMW.Settings.profile.Helpers.AutoLoot = false
                ThisTimeLootTotalMoney = CurrentTotalMoney() or 0

				DMW.Settings.profile.Helpers.AutoLoot = false
				if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end
				Wait(200)
				MoveToStation(-11725.0957, -1494.7312, 41.4825)	
				if IsHackEnabled('hover') then SetHackEnabled('hover', false) end			
				Wait(200)





				
                            FaceDirection(-11728.1895, -1494.0869, 36.9503, true)
							Wait(100)				

							MoveToStation(-11728.1895, -1494.0869, 36.9503)
							LootBodys()
							Wait(2000)
hideBlackFrame()											
							MoveToStation(-11732.0186, -1493.2434, 39.0578)
							LootBodys()
							Wait(3000)
							MoveToStation(-11735.8242, -1492.2588, 41.3183)
							LootBodys()
							Wait(3000)
							MoveToStation(-11740.1299, -1490.3430, 41.4767)
							LootBodys()
							Wait(3000)
							MoveToStation(-11743.7422, -1490.0027, 40.5859)
							LootBodys()
							Wait(3000)
							MoveToStation(-11747.4434, -1489.2847, 39.8411)
							LootBodys()
							Wait(3000)
							MoveToStation(-11748.7129, -1494.8506, 39.4304)
							LootBodys()
							Wait(3000)
							MoveToStation(-11742.8604, -1496.8927, 40.5822)
							LootBodys()
							Wait(3000)

                local currentTime = GetTime()
                local currentWealth = CurrentTotalMoney()



                local lootTotal = CurrentTotalMoney()
                print(lootTotal - ThisTimeLootTotalMoney)
                print('本次获得总收益:', GetCoinTextureString(lootTotal - ThisTimeLootTotalMoney))

                CurrentStartingTime = currentTime
                CurrentStartingWealth = currentWealth



                STATUS = ''
            end

            -- 出副本

            if GetSetting('拾取尸体') and KW.NeedGotoTown() then
                Wait(2000)
                print('包满了 忽略爆本计时')
            else
                STATUS = 'Waiting'
                DungeonTimer.Wait()
                STATUS = ''
            end

            if GetSetting('队伍喊话通知') then
                SendChatMessage(GetSetting('出本喊话'), 'PARTY')
            end
            if GetSetting('就位确认') then
                RunMacroText('/readycheck')
            end
            if GetSetting('副本内包满炉石回城') and KW.NeedGotoTown() and GetItemCooldown(6948) == 0 then
                Wait(2000)
                print('炉石回城')
               TestCore.Core.UseItem(6948)
                Wait(20000)
               TestCore.Reset()
                profile.IgnoreGotoTown = false
               KW.AutoFight(false)
                Wait(5000)
            end
showBlackFrame()			
			while KW.Me.PosZ < 110 do
				KW.MovementManager.Jump()
				KW.WaitTime(350)
				RunMacroText('.stopfall')
			end		
		
        if not IsHackEnabled('hover') then SetHackEnabled('hover', true) end		
		
		    MoveToStation(-11795.2100, -1288.7513, 110.0863)
			MoveToStation(-11870.6475, -1275.9053, 110.0863)
		if IsHackEnabled('hover') then SetHackEnabled('hover', false) end	
			KW.SpaceWalkTo(-11900.7969, -1264.5450, 85.3843, 500)
			
		    MoveToStation(-11909.2168, -1276.8579, 85.3852)
			MoveToStation(-11917.1055, -1272.9203, 85.3852)	
			MoveToStation(-11916.8535, -1235.6573, 92.5352)
hideBlackFrame()			
           KW.GoOutDungeon(-11917.3094, -1220.6643, 107.5282)
            Wait(5000)
        else
           KW.AutoFight(false)
            profile.IgnoreGotoTown = false
			if IsHackEnabled('hover') then SetHackEnabled('hover', false) end
			if IsHackEnabled('multijump') == true then
				RunMacroText('.multijump')
			end				
            if needResetInstances then
                needResetInstances = nil
                print('重置副本')
                ResetInstances()
            end
            if KW.NeedGotoTown() then
                Wait(8000)

            end


            if KW.Me:DistanceTo(-11916.2451, -1223.9757, 92.2878) < 10 and KW.CurrentStatus ~= 'GOTOTOWN' then
                -- profile.IgnoreGotoTown = false
                -- print('重置副本')
                if needResetInstances then
                    needResetInstances = nil
                    PlayerInDungeon = false
                    print('重置副本')
                    ResetInstances()
                end
                -- RunMacroText('/p 进本')

                Wait(500)
                --KW.NavTo(-1185.4081, 2883.4219, 85.9815)
               KW.NavTo(-11916.2451, -1223.9757, 92.2878)
                if GetSetting('队伍喊话通知') then
                    SendChatMessage(GetSetting('进本喊话'), 'PARTY')
                end
                if GetSetting('就位确认') then
                    RunMacroText('/readycheck')
                end
                MoveTo(-11916.1628, -1238.9755, 77.2880)
                Wait(1000)
                JumpOrAscendStart()
                Wait(8000)
                if WaitInDungeon then
                    WaitInDungeon = false
                    STATUS = 'Wait'
                    print('爆本了 等待几分钟再尝试进本')
                   TestCore.NavigateTo(GetRandomPositionFromPosition(-11916.2451, -1223.9757, 92.2878, 5))
                    --KW.NavTo(-1185.4081, 2883.4219, 85.9815)
                    Wait(GetSetting('爆本后等待(单位:分钟)') * 1000 * 60)
                    STATUS = ''
                end
            else
               KW.NavTo(-11916.2451, -1223.9757, 92.2878)
            end
        end
    end
end


function profile.NavigateToCorpse(x, y, z, mapId)
	if IsHackEnabled('hover') then SetHackEnabled('hover', false) end
    if IsHackEnabled('multijump') == true then
        RunMacroText('.multijump')
    end	
   TestCore.Log.Debug('导航到尸体位置', math.floor(x), math.floor(y), math.floor(z))
    if 309 == mapId then
        if not IsCloseToCorpse() then
			MoveToStation(-11519.8936, -242.7023, 30.1162)
			MoveToStation(-11506.9717, -274.2192, 37.9464)
			MoveToStation(-11522.5576, -322.0943, 35.8047)
			MoveToStation(-11584.8311, -330.4920, 38.2657)
			MoveToStation(-11618.5332, -387.2814, 16.8082)
			MoveToStation(-11634.9189, -424.8844, 15.9514)
			MoveToStation(-11682.8203, -456.7945, 20.3413)
			MoveToStation(-11748.5605, -525.8510, 19.5041)
			MoveToStation(-11790.2168, -575.5430, 18.2620)
			MoveToStation(-11756.2100, -613.8862, 36.9818)
			MoveToStation(-11774.1924, -661.1965, 37.6974)
			MoveToStation(-11803.4199, -692.2379, 39.8447)
			MoveToStation(-11840.1182, -780.6700, 35.8126)
			MoveToStation(-11876.7256, -856.3547, 33.2525)
			MoveToStation(-11909.0439, -882.6221, 32.6647)
			MoveToStation(-11914.2207, -986.9897, 66.8727)
			MoveToStation(-11910.9980, -1047.0419, 69.8333)
			MoveToStation(-11911.0547, -1077.3663, 77.2788)
			MoveToStation(-11915.7988, -1153.9409, 77.2802)
			JumpOrAscendStart()
			MoveToStation(-11915.5752, -1176.2557, 85.1420)
			MoveToStation(-11916.3027, -1213.6266, 92.2883)
			MoveToStation(-11916.2979, -1224.6287, 92.2883)
           KW.NavTo(-11916.2979, -1224.6287, 92.2883,TestCore.Settings.Get('NavigateToCorpse.Range'))
        end
        if not IsRetrievableCorpse() then
           TestCore.Log.Debug('该死，我的尸体哪去了？！或许我该去副本里看看……')
            -- 寻路到副本门口
            -- 进入副本
            -- RunMacroText('/p 翻车了 重置副本')
           KW.NavTo(-11916.2979, -1224.6287, 92.2883)
            if GetSetting('队伍喊话通知') and GetSetting('死亡后重置副本') then
                SendChatMessage(GetSetting('出本喊话'), 'PARTY')
            end
            if GetSetting('就位确认') then
                RunMacroText('/readycheck')
            end
            if GetSetting('死亡后重置副本') then
                if needResetInstances then
                    needResetInstances = nil
                    print('重置副本')
                    ResetInstances()
                    if GetSetting('队伍喊话通知') and GetSetting('死亡后重置副本') then
                        SendChatMessage(GetSetting('进本喊话'), 'PARTY')
                    end
                end
            end
           TestCore.Reset()
           KW.GoInDungeon(-11916.6868, -1239.6236, 77.2933)
        end
    else
        if not IsCloseToCorpse() then
	    MoveToStation(-11544.6260, -246.5592, 29.0497)
			--MoveToStation(-11519.8936, -242.7023, 30.1162)
			--MoveToStation(-11506.9717, -274.2192, 37.9464)
			--MoveToStation(-11522.5576, -322.0943, 35.8047)
			--MoveToStation(-11584.8311, -330.4920, 38.2657)	
           TestCore.Log.Debug('移动至尸体……')
           TestCore.NavigateToCorpse(x, y, z, mapId)
        end
        if not IsRetrievableCorpse() then
           TestCore.Log.Debug('该死，我的尸体哪去了？！或许我该去副本里看看……')
            -- 寻路到副本门口
            -- 进入副本
            -- RunMacroText('/p 翻车了 重置副本')
           KW.NavTo(-11916.2979, -1224.6287, 92.2883)
            if GetSetting('队伍喊话通知') and GetSetting('死亡后重置副本') then
                SendChatMessage(GetSetting('出本喊话'), 'PARTY')
            end
            if GetSetting('就位确认') then
                RunMacroText('/readycheck')
            end
            if GetSetting('死亡后重置副本') then
                if needResetInstances then
                    needResetInstances = nil
                    print('重置副本')
                    ResetInstances()
                    if GetSetting('队伍喊话通知') and GetSetting('死亡后重置副本') then
                        SendChatMessage(GetSetting('进本喊话'), 'PARTY')
                    end
                end
            end
           TestCore.Reset()
           KW.GoInDungeon(-11916.6868, -1239.6236, 77.2933)
        end
    end
end

function profile.Pulse()
    -- if UnitIsDeadOrGhost('player') and KW.Me:DistanceTo(-11915.6406, -1156.4138, 77.3898) <= 3 then
       -- JumpOrAscendStart()
	   -- Wait(3000)
    -- end
    if UnitIsDeadOrGhost('player') or not KW.Me:Standing() then
        return
    end

    if
        (STATUS == 'wait' or STATUS == 'Waiting') and GetSetting('等待时搓绷带') and
            (GetItemCount(4306, false, false) >= 2 or GetItemCount(4338, false, false) >= 2) and
           KW.Me.FreeBagSlots >= 2
     then
        jijiu()
    end

    -- if KW.CurrentStatus == "GOTOTOWN" and GetMapId() == 309 and
    -- (not KW.CurrentSettings.UseHearthStone or (KW.CurrentSettings.UseHearthStone and not KW.CanUseHearthStone())) then
    -- 如果在副本内触发回城

    -- 寻路到副本门口
    --KW.NavTo(755.4200, -621.2326, -33.0390)
    --KW.GoOutDungeon(755.0870, -639.7826, -47.8944)
    --TestCore.Stop()
    --TestCore.Start()
    -- end

    if LootFrame:IsShown() and StaticPopup1Button1:IsVisible() == true then
       KW.Log.Write('开始自动绑定确认(%s)', LootFrame.numLootItems)
        for i = 1, LootFrame.numLootItems do
            ConfirmLootSlot(i)
            Wait(100)
        end
		CloseAllWindows()
    end

    if
        (MageDebuffs(12540) or MageDebuffs(5413) or MageDebuffs(9080)) and GetSpellCooldown(11958) == 0 and
           KW.Me:DistanceTo(781.8348, -497.2694, -42.6489) > 20 and
           KW.Me:DistanceTo(777.4785, -535.9409, -36.7652) > 20
     then
       KW.Log.Error('发现DEBUFF!')
        print('冰箱解除DEBUFF')
        CastSpellByID(11958)
        Wait(100)
        CancelAura(11958)
    end
	
    if (MageDebuffs(24375) or MageDebuffs(9080) or MageDebuffs(11428) or MageDebuffs(16790)) and GetSpellCooldown(11958) == 0 then
       KW.Log.Error('发现DEBUFF!')
        print('冰箱解除DEBUFF')
        CastSpellByID(11958)
        Wait(100)
        CancelAura(11958)
    end	

    if KW.Me:HasAura(11958) and GetMapId() == 309 then
        Wait(100)
        CancelAura(11958)
    end

    if MageDebuffs(6533) and GetSpellCooldown(1953) == 0 then
        print('被网住了！ 闪现')
        CastSpellByID(1953)
    end

    if STATUS == 'ResetBuff' and KW.Me.Power > 500 and GetMapId() == 309 then
        -- if not KW.Me:HasAura(13033) and GetSpellCooldown(13033) == 0 then
            -- CastSpellByID(13033)
            -- print('[寒冰护体]-副本内')
        -- end
        if not KW.Me:HasAura(10193) and GetSpellCooldown(10193) == 0 then
            CastSpellByID(10193)
            print('[法力护盾]-副本内')
        end
    end
    if
        GetMapId() ~= 309 and not IsMounted() and KW.Me.Power > 500 and
           KW.Me:DistanceTo(-11916.2979, -1224.6287, 92.2883) > 30 and
           KW.Me:DistanceTo(-10590.5215, -1155.9293, 30.0596) > 300 and
           KW.Me:DistanceTo(-12357.7744, 155.5521, 4.2480) > 300
     then
        -- if not KW.Me:HasAura(13033) and GetSpellCooldown(13033) == 0 then
            -- CastSpellByID(13033)
            -- print('[寒冰护体]-副本外')
        -- end
        if not KW.Me:HasAura(10193) and GetSpellCooldown(10193) == 0 then
            CastSpellByID(10193)
            print('[法力护盾]-副本外')
        end
        if not KW.Me:HasAura(10157) and CastSpellByID(10157) then
            Wait(1000)
            print('奥术智慧')
        end
        if not KW.Me:HasAura(10220) and CastSpellByID(10220) then
            Wait(1000)
            print('冰甲术')
        end
        if not KW.Me:HasAura(10174) and CastSpellByID(10174) then
            Wait(1000)
            print('魔法抑制')
        end
    end

        if NearbyUnitInParty(500) and GetMapId() == 309 and not GetSetting('开启大号带刷') and not GetSetting('进本后就位确认') and not GetSetting('就位确认') and not GetSetting('队伍喊话通知') then
            print('停止脚本!')
           TestCore.Stop()
            return
        end
		
	if GetMapId() ~= 309 and KW.CurrentStatus == 'GOTOTOWN' and GetItemCount(20767, false, false) >= 1 and GetSetting('修理时删除袋子') then
		print('删除浮渣覆盖的袋子')
		KW.Bag.DeleteItem(20767)
	else
		if GetMapId() ~= 309 and not IsMounted() and GetItemCount(20767, false, false) >= 1 and KW.Me.FreeBagSlots >= 3 and KW.Me:DistanceTo(202.8367, 1179.1896, 167.9988) > 20 and KW.Me:DistanceTo(-1677.0315, 3073.2659, 34.5377) > 20 and KW.Me:DistanceTo(248.1182, 1291.6497, 190.3918) > 20 and KW.Me:DistanceTo(-1609.1992, 3118.8621, 44.8293) > 20 then
			print('浮渣覆盖的袋子')
			TestCore.Core.UseItem(20767)
			Wait(2000)
		end
	end

    local Object =KW.ObjectManager.GetGameObjectById(180323)
    if Object ~= nill and Object.Distance <= 10 then
        ObjectInteract(Object.Pointer)
        Wait(1000)
    end

    --吹风
    if CheckDanger_FrostNova then
        local enemies10y =
           KW.ObjectManager.GetWoWUnits(
            function(unit)
                return not unit.Dead and unit.Distance < 10 and UnitCanAttack('PLAYER', unit.Pointer) and
                    UnitAffectingCombat(unit.Pointer) and
                    unit.GUID ~=KW.Me.GUID
            end,
            function(x, y)
                return x.Distance < y.Distance
            end
        )

        if #enemies10y > 6 then
            print('10码内敌人=', #enemies10y)
            if Spell.ConeOfCold:IsReady() then
                FaceDirection(enemies10y[1].Pointer, true)
                Spell.ConeOfCold:Cast(enemies10y[1], 1)
            end
        end
    end

    if KW.Me.HP < 50 and not UnitIsDeadOrGhost('player') and KW.Me:DistanceTo(-11702.3252, -1502.8093, 30.7955) > 30
     then
       TestCore.Core.UseItem(13446)
       TestCore.Core.UseItem(1710)
       TestCore.Core.UseItem(3928)
    end

end