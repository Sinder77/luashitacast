local profile = {}

local fastCastValue = 0.00 -- Only include Fast Cast e.g. Loquacious Earring, Rostrum Pumps
local fastCastValueSong = 0.37 -- Only include Song Spellcasting Time e.g. Minstrel's Ring, Sha'ir Manteel

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 280 -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local displayheadOnAbility = true

local sets = {
    Idle = {
		Main = 'Terra\'s Staff',
        Sub = '',
        Range = 'Traversiere +1',
        Head = 'Darksteel Cap +1',--'Empress Hairpin',
		Neck = 'Jeweled Collar', --'Spirit Torque',
        Ear1 = 'Melody Earring', --'Pigeon Earring', 
        Ear2 = 'Beastly Earring', --'Pigeon Earring', 
		Body = 'Darksteel Harness', --CRow Jupon --
        Hands = 'Dst. Mittens +1',--'Battle Gloves',
        Ring1 = 'Allure Ring',
        Ring2 = 'Allure Ring',
        Back = 'Gigant Mantle', -- --'Jester\'s Cape +1'
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
		Main = 'Terra\'s Staff',
		Head = 'displace',
		Body = 'Vermillion Cloak',
		Neck = 'Jeweled Collar',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
		Legs = 'Choral Cannions',
		Back = 'Hexerei Cape',
		Feet = 'Powder Boots',
    },
    IdleMaxMP = {
		Main = 'Terra\'s Staff',
        Sub = '',
        Range = 'Traversiere +1',
        Head = 'Darksteel Cap +1',--'Empress Hairpin',
		Neck = 'Jeweled Collar', --'Spirit Torque',
        Ear1 = 'Melody Earring', --'Pigeon Earring', 
        Ear2 = 'Beastly Earring', --'Pigeon Earring', 
		Body = 'Darksteel Harness', --CRow Jupon --
        Hands = 'Dst. Mittens +1',--'Battle Gloves',
        Ring1 = 'Allure Ring',
        Ring2 = 'Allure Ring',
        Back = 'Gigant Mantle', -- --'Jester\'s Cape +1'
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
       
		},
	
    Resting = {
        Main = 'Pluto\'s Staff',
		Range = '',
		Ammo = '',
        Head = '',
		Body = 'Errant Hpl.',		-- 'Hydra Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        
       
    },
    Town = {
        Range = 'Gjallarhorn',
		Body = 'Sha\'ir Manteel',
    },
    Movement = {},

    DT = {
		Main = 'Terra\'s Staff',
        Sub = '',
        Range = 'Traversiere +1',
        Head = 'Darksteel Cap +1',--'Empress Hairpin',
		Neck = 'Jeweled Collar', --'Spirit Torque',
        Ear1 = 'Melody Earring', --'Pigeon Earring', 
        Ear2 = 'Beastly Earring', --'Pigeon Earring', 
		Body = 'Darksteel Harness', --CRow Jupon --
        Hands = 'Dst. Mittens +1',--'Battle Gloves',
        Ring1 = 'Allure Ring',
        Ring2 = 'Allure Ring',
        Back = 'Cheviot Cape',
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
	},
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Terra\'s Staff',
		Head = 'Green Ribbon +1',
		Body = 'Black Cotehardie',
		Neck = 'Jeweled Collar',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
		Legs = 'Choral Cannions',
		Back = 'Hexerei Cape',
		Feet = 'Root Sabots',
    },
    FireRes = {
        Main = 'Neptune\'s Staff',
        Head = 'Green Ribbon +1',
        Neck = 'Enfeebling Torque',
        Body = 'Dst. Harness +1',
        Ear1 = 'Ruby Earring',
        Ear2 = 'Ruby Earring',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Malflame Ring',
        Feet = 'Suzaku\'s Sune-ate',
    },
	
	
	
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast_Songs_HPDown = { -- This set will equip even before precast for songs in case you require HP Down equipment to trigger Minstrel's Ring
		--base 910HP DefaultIDle is 1010 HP 910-75= 835  850/.75=1134
		
		
		Hands = '', --'Errant Cuffs', -- -25
		Back = '', -- -80
		Feet = '',--'Errant Pigaches', -- -20
		Waist = 'Penitent\'s Rope', -- -20
		Ring1 = '', --'Ether Ring',  -- -30
		},
		
    Precast = {
       --Ear2 = 'Loquac. Earring',
       --Feet = 'Rostrum Pumps',
    },
    Precast_Songs = {
		Main = 'Tutelary', -- +30
        Sub = 'Genbu\'s Shield',
        Range = '',
		Ammo = 'Happy Egg',
        Head = 'Genbu\'s Kabuto', --+15
        Neck = 'Shield Pendant', --+20
        Ear1 = 'Pigeon Earring', --+20
        Ear2 = 'Pigeon Earring', --+20
        Body = 'Sha\'ir Manteel', --'Wonder Kaftan', --+32
        Hands = 'Seiryu\'s Kote',--'Enkelados\'s Bracelets',-- +25
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Bomb Ring', --+15
        Back = 'Gigant Mantle', --+80
        Waist = 'Powerful Rope', --+20
        Legs = 'Wonder Braccae', --+21
        Feet = 'Root Sabots', --+35
		--Total 301
	
	
	
     --[[   Main = 'Tutelary',
        Sub = 'She-slime Shield',
        Ammo = 'Happy Egg',
        Head = 'Genbu\'s Kabuto',
        Neck = 'Bird Whistle',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Sha\'ir Manteel',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Powerful Rope',
        Legs = 'Dusk Trousers',
        Feet = 'Rostrum Pumps',]]
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Terra\'s Staff',
        Range = 'Mythic Harp +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Gigant Mantle', --'Hexerei Cape',
        Waist = 'Swift Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Neck = 'Willpower Torque',
        Waist = 'Druid\'s Rope',
        Feet = 'Mountain Gaiters',
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Range = 'Angel Lyre',
        Body = 'Sha\'ir Manteel',
        Ear1 = 'Magnetic Earring',
        Hands = 'Dusk Gloves',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Sha\'ir Crackows',
    },
    ConserveMP = {
        Ear2 = 'Magnetic Earring',
    },

    Sing_Default = {
        --Range = 'Gjallarhorn',
        --Head = 'Brd. Roundlet +1',
        --Neck = 'Wind Torque',
        --Ear1 = 'Singing Earring',
        --Ear2 = 'Musical Earring',
        --Hands = 'Chl. Cuffs +1',
        --Legs = 'Chl. Cannions +1',
        --Back = 'Astute Cape',
    },
	
	WindBuff = {
        Main = 'Chanter\'s Staff', --Singing+4
        Head = 'Demon Helm',--'Bard\'s Roundlet', --Singing+5
        Neck = 'Jeweled Collar',--'Wind Torque', --Wind+7
        Ear1 = 'Beastly Earring',--'Singing Earring', --Singing+3 (Place Holder)
        Ear2 = 'Melody Earring',--'Musical Earring', --String+5, Wind+5
		Ring1 = 'Allure Ring',
		Ring2 = 'Allure Ring',
        Body = 'Darksteel Harness',--'Crow Jupon', --'Minstrel\'s Coat', --String+3, Wind+3 (Place Holder)
        Hands = 'Choral Cuffs', --Singing+10
        Back = 'Cheviot Cape', --'Astute Cape', --Singing+5 (Place Holder)
		Waist = 'Swift Belt',
        Legs = 'Choral Cannions', -- +1 Wind+8
        Feet = 'Sha\'ir Crackows',
		
		
    },
	
	
    StringBuff = {
        Main = 'Chanter\'s Staff', --Singing+4,
        Head = 'Demon Helm', -- 'Bard\'s Roundlet', --Singing+5,
		Neck = 'String Torque', --String+7
        Ear1 = 'String Earring',--'Singing Earring', --Singing+3 (PlaceS Holder)
        Ear2 = 'Beastly Earring',--'Musical Earring', --String+5, Wind+5
		Ring1 = 'Allure Ring',
		Ring2 = 'Allure Ring',
        Body = 'Choral Jstcorps', --String+3
		Hands = 'Choral Cuffs', --Singing+10,
        Back = 'Cheviot Cape', --'Astute Cape', --Singing+5 (Place Holder)
		Waist = 'Swift Belt',
        Legs = 'Dst. Subligar +1', --'Choral Cannions', -- +1 Wind+8
        Feet = 'Bard\'s Slippers', --String+3
    }, 
	
    Sing_Buff = {
        Main = 'Chanter\'s Staff',
        Body = 'Minstrel\'s Coat',
    },
    Sing_Debuff = {
        Body = 'Mahatma Hpl.',
        Ring1 = 'Heavens Ring',
        Ring2 = 'Heavens Ring',
        Waist = 'Corsette +1',
        Feet = 'Sha\'ir Crackows',
    },
	
	WindDebuff = { --225 wind
        Main = 'Chanter\'s Staff', --Singing+4, CHR+6
        Head = 'Demon Helm', --'Bard\'s Roundlet', --Singing+5, CHR+5
        Neck = 'Bird Whistle', --'Wind Torque', --Wind+7
        Ear1 = 'Melody Earring', --'Beastly Earring', --CHR+2 / Need Singing Earring
        Ear2 = 'Beastly Earring', --'Musical Earring', --String+5, Wind+5
        Body = 'Errant Hpl.', --'Kirin\'s Osode', --CHR+10
        Hands = 'Choral Cuffs', --Singing+10, CHR+7
        Ring1 = 'Allure Ring', --'Luftpause Mark', --Macc +3
        Ring2 = 'Allure Ring', --'Angel\'s Ring', --CHR+4
        Back = 'Jester\'s Cape +1', --CHR+10
        Waist = 'Corsette +1', --CHR+6
        Legs = 'Choral Cannions', --Wind+8
        Feet = 'Sha\'ir Crackows', --CHR+4
    },
    StringDebuff = { -- 238 string
        Main = 'Chanter\'s Staff', --Singing+4, CHR+6
        Head = 'Demon Helm', --Singing+5, CHR+5
        Neck = 'String Torque', --String+7
        Ear1 = 'String Earring',--'Beastly Earring', --CHR+2 / Need Singing Earring
        Ear2 = 'Musical Earring', --String+5, Wind+5
        Body = 'Errant Hpl.',--'Kirin\'s Osode', --CHR+10
        Hands = 'Choral Cuffs', --Singing+10, CHR+7
        Ring1 = 'Allure Ring',--'Luftpause Mark', --Macc +3
        Ring2 = 'Allure Ring',--'Angel\'s Ring', --CHR+4
        Back = 'Jester\'s Cape +1', --CHR+10
        Waist = 'Corsette +1', --CHR+6
        Legs = 'Errant Slops', --'Bard\'s Cannions', --CHR+8
        Feet = 'Sha\'ir Crackows',--'Bard\'s Slippers', --String+3
    },

    Sing_Ballad_Large = {
        Range = 'Angel Lyre',
        Body = 'Sha\'ir Manteel',
        Hands = 'Sha\'ir Gages',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },
    Sing_Ballad_Small = {
        Range = 'Cornette +1',
        Body = 'Sha\'ir Manteel',
        Hands = 'Sha\'ir Gages',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },
--[[ Sing_Paeon = {
        Range = 'Ebony Harp +1',
        Neck = 'String Torque',
    },
    Sing_Mazurka = {
        Range = 'Gjallarhorn',
    },
     Sing_Minuet = {
        Range = 'Gjallarhorn',
    },
    Sing_March = {
        Range = 'Gjallarhorn',
    },
    Sing_Madrigal = {
        Range = 'Gjallarhorn',
    },
    Sing_Elegy = {
        Range = 'Gjallarhorn',
        Main = 'Terra\'s Staff',
    },
    Sing_Lullaby = {
        Range = 'Gjallarhorn',
        Main = 'Apollo\'s Staff',
    },
]]
    Sing_HordeLullaby_Large = {
        Range = 'Angel Lyre', --'Nursemaid\'s Harp',
        Main = 'Apollo\'s Staff',
        Neck = 'String Torque',
        Legs = 'Errant Slops',
    },
    Sing_HordeLullaby_Small = {
        Range = 'Cornette +1', --'Gjallarhorn',
        Main = 'Apollo\'s Staff',
    },
    Sing_SleepRecast = {
        Hands = 'Sheikh Gages',
    },
	
 --[[Sing_FinaleRequiem = {
        Range = 'Gjallarhorn',
        Main = 'Apollo\'s Staff',
    },
    Sing_Carol = {
        Range = 'Gjallarhorn',
    },
    Sing_Mambo = {
        Range = 'Gjallarhorn',
    },
    Sing_Prelude = {
        Range = 'Gjallarhorn',
    },
    Sing_Threnody = {
        Range = 'Sorrowful Harp',
        Neck = 'String Torque',
        Legs = 'Mahatma Slops',
    },
    Sing_Hymnus = {
        Range = 'Angel Lyre',
        Neck = 'String Torque',
        Hands = 'Sheikh Gages',
        Body = 'Sha\'ir Manteel',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },
]]
    Cure = {
        Main = 'Apollo\'s Staff',
        Head = 'Hydra Beret',
        Neck = 'Justice Badge',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Hydra Doublet',
        Hands = 'Hydra Gloves',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Cursna = {},

    Enhancing = {
        Ear1 = 'Magnetic Earring',
    },
    Stoneskin = {
		Main = 'Water Staff', --MND+6
		Head = 'Errant Hat',--'Crow Beret', +3
		Neck = 'Justice Badge', --+3
        Body = 'Errant Hpl.',--'Kirin\'s Osode', --MND+10
		Hands = 'Devotee\'s Mitts', --+5
        Ring1 = 'Solace Ring', --MND+3
        Ring2 = 'Solace Ring', --MND+3
		Back = 'Rainbow Cape', --+3
        Waist = 'Friar\'s Rope', --MND+1 / Need Penitent's Rope
        Legs = 'Errant Slops', --+7			'Bard\'s Cannions', --MND+8
        Feet = 'Errant Pigaches', --+5		'Suzaku\'s Sune-Ate', --MND+15
    },
	
	
	
	
	
       --[[ Main = 'Chanter\'s Staff',
        Head = 'Hydra Beret',
        Neck = 'Stone Gorget',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Geist Earring',
        Body = 'Mahatma hpl.',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Suzaku\'s Sune-ate',
    },]]
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Divine = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {
	Feet = 'Powder Boots',
	},
	
     LockSet2 = {
	
	Range = 'Hume Fishing Rod', -- 'Halcyon Rod',
	Ammo = 'Fly Lure', --'Little Worm', --OTHER BAIT SWAP 'Insect Ball',
	Body = 'Angler\'s Tunica',
	Hands = 'Angler\'s Gloves',
	Legs = 'Angler\'s Hose',
	Feet = 'Angler\'s Boots',
	},
    LockSet3 = {
	Range = 'Halcyon Rod',
	Ammo = 'Worm Lure', --'Little Worm', --OTHER BAIT SWAP 'Insect Ball',
	Body = 'Angler\'s Tunica',
	Hands = 'Angler\'s Gloves',
	Legs = 'Angler\'s Hose',
	Feet = 'Angler\'s Boots',},

    TP = {},
    TP_HighAcc = {},
    TP_NIN = {},
    TP_Mjollnir_Haste = {},
    WS = {},
    WS_HighAcc = {},
    ['Lockstyle'] = {
        Main = 'Terra\'s Staff',
        Range = 'Traversiere +1',
        Head = 'Darksteel Cap +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Melody Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Darksteel Harness',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Allure Ring',
        Ring2 = 'Allure Ring',
        Back = 'Gigant Mantle',
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Powder Boots',
    },
}
profile.Sets = sets


profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    if (displayheadOnAbility) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/displayhead')
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
	
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end
    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'sballad','shorde','srecast'})
    gcdisplay.CreateToggle('SmallBallad', false)
    gcdisplay.CreateToggle('SmallHorde', false)
    gcdisplay.CreateToggle('SleepRecast', false)
    gcmage.Load()
	AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 017');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !DELETE /ma "Chocobo Mazurka" <me>');
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !DELETE /ma "Chocobo Mazurka" <me>');
    gcinclude.ClearAlias(T{'sballad','shorde','srecast'})
end

profile.HandleCommand = function(args)
	

    if (args[1] == 'sballad') then
        gcdisplay.AdvanceToggle('SmallBallad')
        gcinclude.Message('SmallBallad', gcdisplay.GetToggle('SmallBallad'))
    elseif (args[1] == 'shorde') then
        gcdisplay.AdvanceToggle('SmallHorde')
        gcinclude.Message('SmallHorde', gcdisplay.GetToggle('SmallHorde'))
    elseif (args[1] == 'srecast') then
        gcdisplay.AdvanceToggle('SleepRecast')
        gcinclude.Message('SleepRecast', gcdisplay.GetToggle('SleepRecast'))
    else
        gcmage.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
	if (Powder == true) then
	gFunc.EquipSet(sets.Powder)
	end
	
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
	
	
end

profile.HandlePrecast = function()
    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.ForceEquipSet('Precast_Songs_HPDown')
        gFunc.EquipSet(sets.Precast_Songs)
        local totalFastCast = 1 - (1 - fastCastValueSong) * (1 - fastCastValue)
        gcmage.DoPrecast(totalFastCast)
    else
        gcmage.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)
	
	local ElementalStaffTable = {
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Terra\'s Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Jupiter\'s Staff',
    ['Light'] = 'Apollo\'s Staff',
    ['Dark'] = 'Pluto\'s Staff'
};
	local EleThrenody = T{ 'Wind Threnody', 'Ice Threnody', 'Fire Threnody', 'Water Threnody', 'Earth Threnody', 'Lightning Threnody', 'Dark Threnody', 'Light Threnody', };

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Sing_Default)

        if string.match(action.Name, 'Threnody') then --
			gFunc.EquipSet(sets.StringDebuff);
			gFunc.Equip('main', ElementalStaffTable[action.Element]);
			gFunc.Equip('Range', 'Sorrowful Harp'); 
        elseif string.match(action.Name, 'Elegy') then --
            gFunc.EquipSet(sets.WindDebuff);
				gFunc.Equip('Main', 'Terra\'s Staff');
			gFunc.Equip('Range', 'Horn +1');
        elseif string.match(action.Name, 'Foe Lullaby') then --
            gFunc.EquipSet(sets.WindDebuff)
            gFunc.EquipSet(sets.Sing_Lullaby)
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif string.match(action.Name, 'Horde Lullaby') then --
            gFunc.EquipSet(sets.StringDebuff);
            gFunc.EquipSet(sets.Sing_HordeLullaby_Large)
            if (gcdisplay.GetToggle('SmallHorde')) then
                gFunc.EquipSet(sets.Sing_HordeLullaby_Small)
            end
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif (action.Name == 'Magic Finale') then --
            gFunc.EquipSet(sets.WindDebuff);
			gFunc.Equip('Main', 'Apollo\'s Staff');
			gFunc.Equip('Range', 'Cornette +1'); --Place Holder/Need Military Harp
		elseif string.match(action.Name, 'Requiem') then --
			gFunc.EquipSet(sets.WindDebuff);
			gFunc.Equip('Main', 'Apollo\'s Staff');
			gFunc.Equip('Range', 'Flute +1');
        elseif string.match(action.Name, 'Carol') then --
            gFunc.EquipSet(sets.WindBuff);
			gFunc.Equip('Range', 'Crumhorn +1');
        elseif string.match(action.Name, 'Ballad') then --
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Ballad_Large)
            if (gcdisplay.GetToggle('SmallBallad')) then
                gFunc.EquipSet(sets.Sing_Ballad_Small)
            end
        elseif string.match(action.Name, 'Minuet') then --
            gFunc.EquipSet(sets.WindBuff); 
			gFunc.Equip('Range', 'Cornette +1'); 
        elseif string.match(action.Name, 'March') then --
            gFunc.EquipSet(sets.WindBuff);
			gFunc.Equip('Range', 'Faerie Piccolo');
        elseif string.match(action.Name, 'Madrigal') then 
            gFunc.EquipSet(sets.WindBuff);
			gFunc.Equip('Range', 'Traversiere +1');
        elseif string.match(action.Name, 'Mambo') then --
            gFunc.EquipSet(sets.WindBuff);
			gFunc.Equip('Range', 'Gemshorn +1');
        elseif string.match(action.Name, 'Prelude') then
            gFunc.EquipSet(sets.WindBuff);
			gFunc.Equip('Range', 'Angel\'s Flute +1'); --Place Holder/Who cares.
        elseif string.match(action.Name, 'Hymnus') then --
            gFunc.EquipSet(sets.StringBuff);
			gFunc.Equip('Range', 'Angel Lyre');
        elseif (action.Name == 'Chocobo Mazurka') then
            gFunc.EquipSet(sets.WindBuff);
			gFunc.Equip('Range', 'Harlequin\'s Horn');
        elseif string.match(action.Name, 'Paeon') then
            gFunc.EquipSet(sets.StringBuff);
			gFunc.Equip('Range', 'Ebony Harp +1');
        end
    end
end

return profile
