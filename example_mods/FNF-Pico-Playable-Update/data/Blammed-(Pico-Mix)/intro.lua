
local allowCountdown = false
local stops = 0;
local hueValue = -26
local saturationValue = -16
local contrastValue = 0
local brightnessValue = -5
local chance = 50
elpene=false
NOMAMESWEYALAVERGA = getRandomBool(chance)
MUERTE=getRandomBool(chance/2)
function onStartCountdown()

	if not allowCountdown then

		setProperty('inCutscene', true);
        if stops == 0 then
            runTimer('ciga',3.7)
            runTimer('dispara',6.25)
            runTimer('spin',10.3)
            if MUERTE then
                playMusic('week3cutscene/cutscene2')
            else
            playMusic('week3cutscene/cutscene')
            end
            playSound('week3cutscene/picoGasp')
            makeLuaSprite('sha', '', 80, -600)
            addLuaSprite('sha', false)
            setPropertyFromClass('flixel.FlxG', 'camera.scroll.y', 186)
            setProperty('camFollow.y', 186)
            --
            makeFlxAnimateSprite("mySprite2",  218,801, "philly/erect/pico_doppleganger")
            loadAnimateAtlas("mySprite2", "philly/erect/pico_doppleganger")
            addAnimationBySymbolIndices("mySprite2","dispara", "picoDoppleganger", {0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            12,
            13,
            14,
            15,
            16,
            17,
            18,
            19,
            20,
            21,
            22,
            23,
            24,
            25,
            26,
            27,
            28,
            29,
            30,
            31,
            32,
            33,
            34,
            35,
            36,
            37,
            38,
            39,
            40,
            41,
            42,
            43,
            44,
            45,
            46,
            47,
            48,
            49,
            50,
            51,
            52,
            53,
            54,
            55,
            56,
            57,
            58,
            59,
            60,
            61,
            62,
            63,
            64,
            65,
            66,
            67,
            68,
            69,
            70,
            71,
            72,
            73,
            74,
            75,
            76,
            77,
            78,
            79,
            80,
            81,
            82,
            83,
            84,
            85,
            86,
            87,
            88,
            89,
            90,
            91,
            92,
            93,
            94,
            95,
            96,
            97,
            98,
            99,
            100,
            101,
            102,
            103,
            104,
            105,
            106,
            107,
            108,
            109,
            110,
            111,
            112,
            113,
            114,
            115,
            116,
            117,
            118,
            119,
            120,
            121,
            122,
            123,
            124,
            125,
            126,
            127,
            128,
            129,
            130,
            131,
            132,
            133,
            134,
            135,
            136,
            137,
            138,
            139,
            140,
            141,
            142,
            143,
            144,
            145,
            146,
            147,
            148,
            149,
            150,
            151,
            152,
            153,
            154,
            155,
            156,
            157,
            158,
            159,
            160,
            161,
            162,
            163,
            164,
            165,
            166,
            167,
            168,
            169,
            170,
            171,
            172,
            173,
            174,
            175,
            176,
            177,
            178,
            179,
            180,
            181,
            182,
            183,
            184,
            185,
            186,
            187,
            188,
            189,
            190,
            191,
            192,
            193,
            194,
            195,
            196,
            197,
            198,
            199,
            200,
            201,
            202,
            203,
            204,
            205,
            206,
            207,
            208,
            209,
            210,
            211,
            212,
            213,
            214,
            215,
            216,
            217,
            218,
            219,
            220,
            221,
            222,
            223,
            224,
            225,
            226,
            227,
            228,
            229,
            230,
            231,
            232,
            233,
            234,
            235,
            236,
            237,
            238,
            239,
            240,
            241,
            242,
            243,
            244,
            245,
            246,
            247,
            248,
            249,
            250,
            251,
            252,
            253,
            254,
            255,
            256,
            257,
            258,
            259,
            260,
            261,
            262,
            263,
            264,
            265,
            266,
            267,
            268,
            269,
            270,
            271,
            272,
            273,
            274,
            275,
            276,
            277,
            278,
            279,
            280,
            281,
            282,
            283,
            284,
            285,
            286,
            287,
            288,
            289,
            290,
            291,
            292,
            293,
            294,
            295,
            296,
            297,
            298}, 24, false)
            addAnimationBySymbolIndices("mySprite2","casilomatan", "picoDoppleganger", {577,
            578,
            579,
            580,
            581,
            582,
            583,
            584,
            585,
            586,
            587,
            588,
            589,
            590,
            591,
            592,
            593,
            594,
            595,
            596,
            597,
            598,
            599,
            600,
            601,
            602,
            603,
            604,
            605,
            606,
            607,
            608,
            609,
            610,
            611,
            612,
            613,
            614,
            615,
            616,
            617,
            618,
            619,
            620,
            621,
            622,
            623,
            624,
            625,
            626,
            627,
            628,
            629,
            630,
            631,
            632,
            633,
            634,
            635,
            636,
            637,
            638,
            639,
            640,
            641,
            642,
            643,
            644,
            645,
            646,
            647,
            648,
            649,
            650,
            651,
            652,
            653,
            654,
            655,
            656,
            657,
            658,
            659,
            660,
            661,
            662,
            663,
            664,
            665,
            666,
            667,
            668,
            669,
            670,
            671,
            672,
            673,
            674,
            675,
            676,
            677,
            678,
            679,
            680,
            681,
            682,
            683,
            684,
            685,
            686,
            687,
            688,
            689,
            690,
            691,
            692,
            693,
            694,
            695,
            696,
            697,
            698,
            699,
            700,
            701,
            702,
            703,
            704,
            705,
            706,
            707,
            708,
            709,
            710,
            711,
            712,
            713,
            714,
            715,
            716,
            717,
            718,
            719,
            720,
            721,
            722,
            723,
            724,
            725,
            726,
            727,
            728,
            729,
            730,
            731,
            732,
            733,
            734,
            735,
            736,
            737,
            738,
            739,
            740,
            741,
            742,
            743,
            744,
            745,
            746,
            747,
            748,
            749,
            750,
            751,
            752,
            753,
            754,
            755,
            756,
            757,
            758,
            759,
            760,
            761,
            762,
            763,
            764,
            765,
            766,
            767,
            768,
            769,
            770,
            771,
            772,
            773,
            774,
            775,
            776,
            777,
            778,
            779,
            780,
            781,
            782,
            783,
            784,
            785,
            786,
            787,
            788,
            789,
            790,
            791,
            792,
            793,
            794,
            795,
            796,
            797,
            798,
            799,
            800,
            801,
            802,
            803,
            804,
            805,
            806,
            807,
            808,
            809,
            810,
            811,
            812,
            813,
            814,
            815,
            816,
            817,
            818,
            819,
            820,
            821,
            822,
            823,
            824,
            825,
            826,
            827,
            828,
            829,
            830,
            831,
            832,
            833,
            834,
            835,
            836,
            837,
            838,
            839,
            840,
            841,
            842,
            843,
            844,
            845,
            846,
            847,
            848,
            849,
            850,
            851,
            852,
            853,
            854,
            855,
            856,
            857,
            858,
            859,
            860,
            861,
            862,
            863,
            864}, 24, false)
            addAnimationBySymbolIndices("mySprite2","lomatan", "picoDoppleganger", {298,
            299,
            300,
            301,
            302,
            303,
            304,
            305,
            306,
            307,
            308,
            309,
            310,
            311,
            312,
            313,
            314,
            315,
            316,
            317,
            318,
            319,
            320,
            321,
            322,
            323,
            324,
            325,
            326,
            327,
            328,
            329,
            330,
            331,
            332,
            333,
            334,
            335,
            336,
            337,
            338,
            339,
            340,
            341,
            342,
            343,
            344,
            345,
            346,
            347,
            348,
            349,
            350,
            351,
            352,
            353,
            354,
            355,
            356,
            357,
            358,
            359,
            360,
            361,
            362,
            363,
            364,
            365,
            366,
            367,
            368,
            369,
            370,
            371,
            372,
            373,
            374,
            375,
            376,
            377,
            378,
            379,
            380,
            381,
            382,
            383,
            384,
            385,
            386,
            387,
            388,
            389,
            390,
            391,
            392,
            393,
            394,
            395,
            396,
            397,
            398,
            399,
            400,
            401,
            402,
            403,
            404,
            405,
            406,
            407,
            408,
            409,
            410,
            411,
            412,
            413,
            414,
            415,
            416,
            417,
            418,
            419,
            420,
            421,
            422,
            423,
            424,
            425,
            426,
            427,
            428,
            429,
            430,
            431,
            432,
            433,
            434,
            435,
            436,
            437,
            438,
            439,
            440,
            441,
            442,
            443,
            444,
            445,
            446,
            447,
            448,
            449,
            450,
            451,
            452,
            453,
            454,
            455,
            456,
            457,
            458,
            459,
            460,
            461,
            462,
            463,
            464,
            465,
            466,
            467,
            468,
            469,
            470,
            471,
            472,
            473,
            474,
            475,
            476,
            477,
            478,
            479,
            480,
            481,
            482,
            483,
            484,
            485,
            486,
            487,
            488,
            489,
            490,
            491,
            492,
            493,
            494,
            495,
            496,
            497,
            498,
            499,
            500,
            501,
            502,
            503,
            504,
            505,
            506,
            507,
            508,
            509,
            510,
            511,
            512,
            513,
            514,
            515,
            516,
            517,
            518,
            519,
            520,
            521,
            522,
            523,
            524,
            525,
            526,
            527,
            528,
            529,
            530,
            531,
            532,
            533,
            534,
            535,
            536,
            537,
            538,
            539,
            540,
            541,
            542,
            543,
            544,
            545,
            546,
            547,
            548,
            549,
            550,
            551,
            552,
            553,
            554,
            555,
            556,
            557,
            558,
            559,
            560,
            561,
            562,
            563,
            564,
            565,
            566,
            567,
            568,
            569,
            570,
            571,
            572,
            573,
            574,
            575,
            576}, 24, false)
            addLuaSprite("mySprite2", true)
            ---------
            makeFlxAnimateSprite("mySprite",  218,811, "philly/erect/pico_doppleganger")
            loadAnimateAtlas("mySprite", "philly/erect/pico_doppleganger")
            addAnimationBySymbolIndices("mySprite","dispara", "picoDoppleganger", {878,
            879,
            880,
            881,
            882,
            883,
            884,
            885,
            886,
            887,
            888,
            889,
            890,
            891,
            892,
            893,
            894,
            895,
            896,
            897,
            898,
            899,
            900,
            901,
            902,
            903,
            904,
            905,
            906,
            907,
            908,
            909,
            910,
            911,
            912,
            913,
            914,
            915,
            916,
            917,
            918,
            919,
            920,
            921,
            922,
            923,
            924,
            925,
            926,
            927,
            928,
            929,
            930,
            931,
            932,
            933,
            934,
            935,
            936,
            937,
            938,
            939,
            940,
            941,
            942,
            943,
            944,
            945,
            946,
            947,
            948,
            949,
            950,
            951,
            952,
            953,
            954,
            955,
            956,
            957,
            958,
            959,
            960,
            961,
            962,
            963,
            964,
            965,
            966,
            967,
            968,
            969,
            970,
            971,
            972,
            973,
            974,
            975,
            976,
            977,
            978,
            979,
            980,
            981,
            982,
            983,
            984,
            985,
            986,
            987,
            988,
            989,
            990,
            991,
            992,
            993,
            994,
            995,
            996,
            997,
            998,
            999,
            1000,
            1001,
            1002,
            1003,
            1004,
            1005,
            1006,
            1007,
            1008,
            1009,
            1010,
            1011,
            1012,
            1013,
            1014,
            1015,
            1016,
            1017,
            1018,
            1019,
            1020,
            1021,
            1022,
            1023,
            1024,
            1025,
            1026,
            1027,
            1028,
            1029,
            1030,
            1031,
            1032,
            1033,
            1034,
            1035,
            1036,
            1037,
            1038,
            1039,
            1040,
            1041,
            1042,
            1043,
            1044,
            1045,
            1046,
            1047,
            1048,
            1049,
            1050,
            1051,
            1052,
            1053,
            1054,
            1055,
            1056,
            1057,
            1058,
            1059,
            1060,
            1061,
            1062,
            1063,
            1064,
            1065,
            1066,
            1067,
            1068,
            1069,
            1070,
            1071,
            1072,
            1073,
            1074,
            1075,
            1076,
            1077,
            1078,
            1079,
            1080,
            1081,
            1082,
            1083,
            1084,
            1085,
            1086,
            1087,
            1088,
            1089,
            1090,
            1091,
            1092,
            1093,
            1094,
            1095,
            1096,
            1097,
            1098,
            1099,
            1100,
            1101,
            1102,
            1103,
            1104,
            1105,
            1106,
            1107,
            1108,
            1109,
            1110,
            1111,
            1112,
            1113,
            1114,
            1115,
            1116,
            1117,
            1118,
            1119,
            1120,
            1121,
            1122,
            1123,
            1124,
            1125,
            1126,
            1127,
            1128,
            1129,
            1130,
            1131,
            1132,
            1133,
            1134,
            1135,
            1136,
            1137,
            1138,
            1139,
            1140,
            1141,
            1142,
            1143,
            1144,
            1145,
            1146,
            1147,
            1148,
            1149,
            1150,
            1151,
            1152,
            1153,
            1154,
            1155,
            1156,
            1157,
            1158,
            1159,
            1160,
            1161,
            1162,
            1163,
            1164,
            1165,
            1166,
            1167,
            1168,
            1169,
            1170,
            1171,
            1172,
            1173,
            1174,
            1175,
            1176,
            1177}, 24, false)
            addAnimationBySymbolIndices("mySprite","casilomatan", "picoDoppleganger", {1455,
            1456,
            1457,
            1458,
            1459,
            1460,
            1461,
            1462,
            1463,
            1464,
            1465,
            1466,
            1467,
            1468,
            1469,
            1470,
            1471,
            1472,
            1473,
            1474,
            1475,
            1476,
            1477,
            1478,
            1479,
            1480,
            1481,
            1482,
            1483,
            1484,
            1485,
            1486,
            1487,
            1488,
            1489,
            1490,
            1491,
            1492,
            1493,
            1494,
            1495,
            1496,
            1497,
            1498,
            1499,
            1500,
            1501,
            1502,
            1503,
            1504,
            1505,
            1506,
            1507,
            1508,
            1509,
            1510,
            1511,
            1512,
            1513,
            1514,
            1515,
            1516,
            1517,
            1518,
            1519,
            1520,
            1521,
            1522,
            1523,
            1524,
            1525,
            1526,
            1527,
            1528,
            1529,
            1530,
            1531,
            1532,
            1533,
            1534,
            1535,
            1536,
            1537,
            1538,
            1539,
            1540,
            1541,
            1542,
            1543,
            1544,
            1545,
            1546,
            1547,
            1548,
            1549,
            1550,
            1551,
            1552,
            1553,
            1554,
            1555,
            1556,
            1557,
            1558,
            1559,
            1560,
            1561,
            1562,
            1563,
            1564,
            1565,
            1566,
            1567,
            1568,
            1569,
            1570,
            1571,
            1572,
            1573,
            1574,
            1575,
            1576,
            1577,
            1578,
            1579,
            1580,
            1581,
            1582,
            1583,
            1584,
            1585,
            1586,
            1587,
            1588,
            1589,
            1590,
            1591,
            1592,
            1593,
            1594,
            1595,
            1596,
            1597,
            1598,
            1599,
            1600,
            1601,
            1602,
            1603,
            1604,
            1605,
            1606,
            1607,
            1608,
            1609,
            1610,
            1611,
            1612,
            1613,
            1614,
            1615,
            1616,
            1617,
            1618,
            1619,
            1620,
            1621,
            1622,
            1623,
            1624,
            1625,
            1626,
            1627,
            1628,
            1629,
            1630,
            1631,
            1632,
            1633,
            1634,
            1635,
            1636,
            1637,
            1638,
            1639,
            1640,
            1641,
            1642,
            1643,
            1644,
            1645,
            1646,
            1647,
            1648,
            1649,
            1650,
            1651,
            1652,
            1653,
            1654,
            1655,
            1656,
            1657,
            1658,
            1659,
            1660,
            1661,
            1662,
            1663,
            1664,
            1665,
            1666,
            1667,
            1668,
            1669,
            1670,
            1671,
            1672,
            1673,
            1674,
            1675,
            1676,
            1677,
            1678,
            1679,
            1680,
            1681,
            1682,
            1683,
            1684,
            1685,
            1686,
            1687,
            1688,
            1689,
            1690,
            1691,
            1692,
            1693,
            1694,
            1695,
            1696,
            1697,
            1698,
            1699,
            1700,
            1701,
            1702,
            1703,
            1704,
            1705,
            1706,
            1707,
            1708,
            1709,
            1710,
            1711,
            1712,
            1713,
            1714,
            1715,
            1716,
            1717,
            1718,
            1719,
            1720,
            1721,
            1722,
            1723,
            1724,
            1725,
            1726,
            1727,
            1728,
            1729,
            1730,
            1731,
            1732,
            1733,
            1734,
            1735,
            1736,
            1737,
            1738,
            1739,
            1740,
            1741,
            1742,
            1743,
            1744,
            1745,
            1746,
            1747,
            1748,
            1749,
            1750,
            1751,
            1752,
            1753,
            1754,
            1755}, 24, false)
            addAnimationBySymbol("mySprite","lomatan", "compressed/picoExplode", 24, false)
            addLuaSprite("mySprite", true)
            ---------
            
		cameraFlash('camGame','000000',1,true)
		setProperty('camHUD.alpha',0)
		runTimer('startC',13)
		runTimer('a',13.1)
		runTimer('150',100/24)
        setProperty('mySprite2.x',280)
        setProperty('mySprite.x',910)
        setProperty('mySprite.y',800)
        if NOMAMESWEYALAVERGA==true then
playAnim('mySprite','dispara')
playAnim('mySprite2','casilomatan')
if MUERTE then
    playAnim('mySprite','dispara')
    playAnim('mySprite2','lomatan')
end
        else
            playAnim('mySprite2','dispara')
            playAnim('mySprite','casilomatan')
            if MUERTE then
                playAnim('mySprite2','dispara')
                playAnim('mySprite','lomatan')
                setProperty('mySprite.x',750)
                setProperty('mySprite.y',590)
            end
        end
setProperty('dad.alpha',0)
setProperty('boyfriend.alpha',0)
runTimer('nosewe',13)
		allowCountdown = true;
        end
        stops = stops + 1
		return Function_Stop;
	end
	return Function_Continue;
end
function onUpdate()
    if MUERTE then
        setProperty('Vocals.volume',0)
if curStep >2 then
    for i = 0, getProperty('unspawnNotes.length')-1 do  
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
    end
end
end
    if not elpene then
    camara=getProperty('sha.x')
    setPropertyFromClass('flixel.FlxG', 'camera.scroll.x', camara)
    setProperty('camFollow.x', camara)
end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'suputamadre' then
        if NOMAMESWEYALAVERGA==true then
          doTweenX('sdasd','sha',30,1/2,'linear')
        else
            doTweenX('sdasd','sha',180,1/2,'linear')
        end
    end
    if tag == 'ciga3' then
        setObjectOrder('cigarette',getObjectOrder('dad')-1)
    end
    if tag == 'ciga2' then
if not MUERTE then
        if NOMAMESWEYALAVERGA==true then
            makeAnimatedLuaSprite('cigarette', 'philly/erect/cigarette', 460,560);
            addAnimationByPrefix('cigarette', 'a2', 'cigarette spit', 24, false);
            scaleObject('cigarette', 1,1)
            addLuaSprite('cigarette', false);
            setProperty('cigarette.flipX',true)
            setObjectOrder('cigarette',getObjectOrder('mySprite'))
        else
            makeAnimatedLuaSprite('cigarette', 'philly/erect/cigarette', 460,560);
            addAnimationByPrefix('cigarette', 'a2', 'cigarette spit', 24, false);
            scaleObject('cigarette', 1,1)
            addLuaSprite('cigarette', false);
            setObjectOrder('cigarette',getObjectOrder('mySprite'))
        end
        local hueValue = -26
        local saturationValue = -16
        local contrastValue = 0
        local brightnessValue = -5
        
        setSpriteShader('cigarette', 'adjustColor')
        setShaderFloat('cigarette', 'hue', hueValue)
        setShaderFloat('cigarette', 'saturation', saturationValue)
        setShaderFloat('cigarette', 'contrast', contrastValue)
        setShaderFloat('cigarette', 'brightness', brightnessValue)
        runTimer('ciga3',0.3)
    end
    end
    if tag == '4x' then
        if MUERTE then
            characterPlayAnim('gf', 'QUERISAWEY', true)
            setProperty('gf.specialAnim', true)
            playSound('week3cutscene/picoExplode')
        end
    end
    if tag == 'ciga' then
        runTimer('4x',5)
        runTimer('ciga2',7.8)
        if NOMAMESWEYALAVERGA==true then
            doTweenX('sdasd','sha',30,1.5,'linear')
        else
            doTweenX('sdasd','sha',180,1.5,'linear')
        end
        if MUERTE then
            playSound('week3cutscene/picoCigarette2')
        else
playSound('week3cutscene/picoCigarette')
        end
    end
    if tag == 'spin' then
        playSound('week3cutscene/picoSpin')
    end
    if tag == 'dispara' then
        runTimer('suputamadre',2.1)
        if NOMAMESWEYALAVERGA==false then
            doTweenX('sdasd','sha',30,1.5,'linear')
        else
            doTweenX('sdasd','sha',180,1.5,'linear')
        end
        playSound('week3cutscene/picoShoot')
    end
    if tag == 'nosewe' then
        local tweenDuration = 0.25 
        local tweenType = 'linear' 
        function startAlphaTweens()
            if NOMAMESWEYALAVERGA == true and MUERTE == true then
            doTweenAlpha('fadeMySprite', 'mySprite', 0, tweenDuration, tweenType)
            doTweenAlpha('fadeBoyfriend', 'boyfriend', 1, tweenDuration, tweenType)
            end
            if NOMAMESWEYALAVERGA == false and MUERTE == true then
                doTweenAlpha('fadeMySprite2', 'mySprite2', 0, tweenDuration, tweenType)
                doTweenAlpha('fadeDad', 'dad', 1, tweenDuration, tweenType)
                end
                if MUERTE == false then
                    doTweenAlpha('fadeMySprite', 'mySprite', 0, tweenDuration, tweenType)
                    doTweenAlpha('fadeBoyfriend', 'boyfriend', 1, tweenDuration, tweenType)
                    doTweenAlpha('fadeMySprite2', 'mySprite2', 0, tweenDuration, tweenType)
                    doTweenAlpha('fadeDad', 'dad', 1, tweenDuration, tweenType)
                end
        end
        startAlphaTweens()
    end
	if tag == 'startC' then
        if MUERTE and not NOMAMESWEYALAVERGA then
            endSong()
        else
		startCountdown();
        end
elpene=true
	end
	if tag == 'a' then 
	   setProperty('camHUD.alpha',1)
	end
end
