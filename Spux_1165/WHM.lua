local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = 750 -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = 890 -- The Max MP you have when /blm in your idle set
local drkSJMaxMP = nil -- The Max MP you have when /drk in your idle set

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
   -- Back = 'Warlock\'s Mantle',
}
local virology_ring = {
    -- Ring2 = 'Virology Ring',
}
local republic_circlet = {
    -- Head = 'Republic Circlet',
}
local cure_clogs = {
    Feet = 'Cure Clogs',
}
local ruckes_rung = {
    -- Main = 'Rucke\'s Rung',
}
local medicine_ring = {
    -- Ring1 = 'Medicine Ring',
}
local mjollnir = {
    -- Main = 'Mjollnir',
}
local asklepios = { -- Used for Cures with Mjollnir when /NIN
    -- Sub = 'Asklepios',
}

local sets = {
--[[Main = '',
		Ammo = '',
		Head = '',
		Neck = '',
		Ear1 = '',
		Ear2 = '',
		Body = '',
		Hands = '',
		Ring1 = '',
		Ring2 = '',
		Back = '',
		Waist = '',
		Legs = '',
		Feet = '',
	]]--

	
    Idle = {
		Main = 'Terra\'s Staff',
		Ammo = 'Fortune Egg',
		Head ='Green Ribbon +1', -- displaced, --
		Neck = 'Jeweled Collar', --'Spirit Torque', --
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body =  'Noble\'s Tunic', --'Vermillion Cloak', --
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Merman\'s Ring', --
		Ring2 = 'Merman\'s Ring', --
		Back = 'Cheviot Cape',
		Waist = 'Penitent\'s Rope',
		Legs = 'Healer\'s Pantaln.',
		Feet = 'Healer\'s Duckbills',
	
	},
    IdleALT = {
		
	},
    IdleMaxMP = {
	Head = 'Healer\'s Cap',
	Neck = 'Spirit Torque',
	Ear1 = 'Night Earring',
	Ear2 = 'Night Earring',
	Body = 'Noble\'s Tunic',
	Hands = 'Zenith Mitts',
	
	Ring1 = 'Ether Ring', --'Merman\'s Ring', --
	Ring2 = 'Astral Ring', --'Merman\'s Ring', --
	Waist = 'Hierarch Belt',
	Legs = 'Blessed Trousers',
	
	},
    Resting = {
		Main = 'Pluto\'s Staff',
		Ammo = '',
		Head = '',
		Neck = 'Checkered Scarf',
		Ear1 = '',
		Ear2 = '',
		Body = 'Errant Hpl.', --'Seer\'s Tunic', --
		Hands = '',
		Ring1 = '',
		Ring2 = '',
		Back = '',
		Waist = 'Hierarch Belt',
		Legs = 'Baron\'s Slops',
		Feet = '',
		},
		
    Town = {
		Main = 'Terra\'s Staff',
		Ammo = 'Fortune Egg',
		Head = 'Green Ribbon +1',
		Neck = 'Jeweled Collar',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Noble\'s Tunic',
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Ether Ring',
		Ring2 = 'Astral Ring',
		Back = 'Hexerei Cape',
		Waist = 'Penitent\'s Rope',
		Legs = 'Cleric\'s Pantaln.',
		Feet = 'Healer\'s Duckbills',
	
	},
    Movement = {},

    DT = {},
    DTNight = {},
    MDT = { -- Shell ii is 10/10
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
	
	},
    Casting = { -- Default Casting Equipment when using Idle sets
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = {

	Hands = 'Blessed Mitts',
	Legs = 'Blessed Trousers',
	Feet = 'Blessed Pumps',

	-- Used only on Haste, Refresh, Blink and Utsusemi casts
	
	Waist = 'Swift Belt',
	
    },
    ConserveMP = {},

    Yellow = { --254HP~
	
	Neck = 'Shield Pendant', --20
	Ear1 = 'Pigeon Earring', --20
	Ear2 = 'Pigeon Earring', --20
	Hands = 'Blessed Mitts',
	Ring2 = 'Bomb Ring', --15
	Waist = 'Powerful Rope', --20
	Back = 'Gigant Mantle', --80
	Feet = 'Root Sabots', -- 35
	
	 Hate = { -- Switches to this set when casting Sleep, Blind, Dispel, Bind, Flash and Cures on other players if /hate is toggled on
    },
    Cheat_C3HPDown = {},
    Cheat_C4HPDown = {},
    Cheat_HPUp = {},
	
	
	},   
    Cure = {
		Main = 'Apollo\'s Staff',--I 30
        Sub = '',
		Head = 'Crow Beret', --7E
        Ammo = '',
        Neck = 'Ajari Necklace',--Benign neck
		Body = 'Noble\'s Tunic', --8E
        Ear1 = '',--I 5
        Ear2 = '',--II 2
        Hands = 'Healer\'s Mitts', --4E
        Ring1 = 'Peace Ring', --1E
        Ring2 = '',--'Solace Ring',
        Back = '',
        Waist = 'Penitent\'s Rope', --3E
        Legs = 'Blessed Trousers', --5E
        Feet = 'Blessed Pumps', --4E
	},
    Cure5 = {
		Main = 'Apollo\'s Staff',--I 30
		Head = 'Healer\'s Cap',
		Ammo = '',
        Neck = 'Ajari Necklace',--Benign neck
		Body = 'Noble\'s Tunic', --8E
        Ear1 = '',--I 5
        Ear2 = '',--II 2
        Hands = 'Healer\'s Mitts', --4E
        Ring1 = 'Peace Ring', --1E
        Ring2 = '',--'Solace Ring',
        Back = 'Red Cape',
        Waist = 'Penitent\'s Rope', --3E
        Legs = 'Druid\'s Slops', --5E
        Feet = 'Crow Gaiters', --4E
	},
    Regen = {
        Body = 'Cleric\'s Bliaut',
    },
    Barspell = {
	Body = 'Blessed Bliaut',
	Legs = 'Cleric\'s Pantaln.',
	},
    Cursna = {},

    Enhancing = {
		Main = 'Kirin\'s Pole',
        Sub = '',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Errant Hat', --{Name = "Zenith Crown", Priority = 100},
        Neck = 'Ajari Necklace',
        Ear1 = {Name = "Death Earring", Priority = 100},
        Ear2 = {Name = "Death Earring", Priority = 100},
        Body = 'Errant Hpl.',
        Hands = 'Devotee\'s Mitts',
        Ring1 = {Name = "Solace Ring", Priority = -1}, --"Aqua Ring"
        Ring2 = {Name = "Solace Ring", Priority = -1}, --"Aqua Ring"
        Back = {Name = "Rainbow Cape", Priority = 100}, --Prism
        Waist = {Name = "Swift Belt", Priority = -1}, --"Penitent\'s Rope",
        Legs = 'Errant Slops',
        Feet = 'Errant Pgch.'
	
	},
    Stoneskin = {
	Neck = 'Stone Gorget',
        Back = 'Prism Cape',	
	},
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {
	
	--Sub = 'Ammurapi Shield',
       -- Ammo = 'Pemphredo Tathlum',
        Head = 'Traveler\'s Hat',
        Neck = 'Justice Badge',
        --Ear1 = 'Regal Earring',
        --Ear2 = 'Malignance Earring',
        Ring1 = 'Solace Ring',
        Ring2 = 'Solace Ring', 
		Legs = 'Wonder Braccae',
		Feet = 'Healer\'s Duckbills',},
    EnfeeblingINT = {},
    EnfeeblingACC = {},
--/tb palette change base
    Divine = {
	
		Main = 'Apollo\'s Staff',
        Sub = '',
        Ammo = 'Fortune Egg',
        Head = 'Bastokan Circlet',
        Neck = 'Divine Torque', --'Ajari Necklace',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Justaucorps',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Solace Ring',
        Ring2 = 'Solace Ring',
        Back = 'Red Cape',
        Waist = 'Penitent\'s Rope', --'Friar\'s Rope',
        Legs = 'Healer\'s Pantaln.', --'Blessed Trousers',
        Feet = 'Seer\'s Pumps',
	
	
	
	},
    Banish = {
		Main = 'Apollo\'s Staff',
        Sub = '',
        Ammo = 'Fortune Egg',
        Head = 'Bastokan Circlet',
        Neck = 'Divine Torque', --'Ajari Necklace',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Blessed Bliaut', --'Justaucorps',
        Hands = 'Blessed Mitts', --'Devotee\'s Mitts',
        Ring1 = 'Solace Ring',
        Ring2 = 'Solace Ring',
        Back = 'Red Cape',
        Waist = 'Penitent\'s Rope', --'Friar\'s Rope',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Blessed Pumps',
	},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {
	Ammo = 'Happy Egg',
        Head = 'Green Ribbon',--'Walkure Mask', --'Drn. Armet +1',
        Neck = 'Shield Pendant',
        Ear1 = 'Pigeon Earring', --'Ethereal Earring',
        Ear2 = 'Pigeon Earring', --'Loquac. Earring',
        Body = 'Wonder Kaftan', --'Homam Corazza',
        Hands = 'Gigas Bracelets', --'Homam Manopolas',
        Ring1 = 'Solace Ring', --'Toreador\'s Ring',
        Ring2 = 'Bomb Ring', --'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Powerful Rope',
        Legs = 'Wonder Braccae', --'Homam Cosciales',
        Feet = 'Root Sabots', --'Homam Gambieras',
		},
        LockSet2 = {
	
	Range = 'Halcyon Rod', --'Hume Fishing Rod', --
	Ammo = 'Worm Lure', --OTHER BAIT SWAP 'Insect Ball', 'Fly Lure', --
	Body = 'Angler\'s Tunica',
	Hands = 'Angler\'s Gloves',
	Legs = 'Angler\'s Hose',
	Feet = 'Angler\'s Boots',
	},
    LockSet3 = {
	
	Body = 'Field Tunica',
	Hands = 'Field Gloves',
	Feet = 'Field Boots',
	
	},

  
    TP_HighAcc = {},
    
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},
    TP_NIN = {
	
	Main = 'Purgatory Mace',
	Sub = 'Darksteel Maul',
	Ammo = 'Tiphia Sting',
        Head = 'Empress Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Reverend Mail',
        Hands = 'Blessed Mitts', --'Battle Gloves',
        Ring1 = 'Woodsman Ring',
        Ring2 = 'Woodsman Ring',
        Back = 'Lucent Cape',
        Waist = 'Swift Belt',
        Legs = 'Blessed Trousers',
        Feet = 'Blessed Pumps',
		},
      TP = {
        
        Ammo = 'Tiphia Sting',
        Head = 'Empress Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Reverend Mail',
        Hands = 'Blessed Mitts', --'Battle Gloves',
        Ring1 = 'Woodsman Ring',
        Ring2 = 'Woodsman Ring',
        Back = 'Lucent Cape',
        Waist = 'Swift Belt',
        Legs = 'Blessed Trousers',
        Feet = 'Blessed Pumps',
    },

    WS = {},
    WS_HighAcc = {},
    WS_Randgrith = {},

    Weapon_Loadout_1 = {
		Main = 'Purgatory Mace',
        Sub = 'Genbu\'s Shield',
		},
    Weapon_Loadout_2 = {
	Main = 'Purgatory Mace',
		Sub = 'Darksteel Maul',},
    Weapon_Loadout_3 = {},
	
	
	Lockstyle = {
	Main = 'Kgd. Signet Staff',
	Head = 'Rabbit Cap',
	Body = 'Mandra. Suit',
	--Hands = 'Zenith Mitts',
	--Legs = 'Cleric\'s Pantaln.',
	--Feet = 'Healer\'s duckbills',
	},
	
}
	
	
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

sets.warlocks_mantle = warlocks_mantle
sets.virology_ring = virology_ring
sets.republic_circlet = republic_circlet
sets.cure_clogs = cure_clogs
sets.ruckes_rung = ruckes_rung
sets.medicine_ring = medicine_ring
sets.mjollnir = mjollnir
sets.asklepios = asklepios
profile.Sets = gcmage.AppendSets(sets)

profile.HandleAbility = function()
    gcmage.DoAbility()
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

    local action = gData.GetAction()
    if (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.WS_Randgrith)
    end

    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args, sets)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, drkSJMaxMP)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
	gFunc.LockStyle(sets.Lockstyle)
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmage.DoPrecast(sets, fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmage.DoPrecast(sets, fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, drkSJMaxMP)

    local action = gData.GetAction()
    if (action.Skill == 'Enhancing Magic') then
        if (string.match(action.Name, 'Regen')) then
            gFunc.EquipSet('Regen')
        elseif (string.match(action.Name, 'Bar')) then
            gFunc.EquipSet('Barspell')
        end
    elseif (string.match(action.Name, 'Banish')
        or string.match(action.Name, 'Holy')
        or (string.match(action.Name, 'Cure') and gData.GetActionTarget().Type == 'Monster')
    ) then
        if (republic_circlet.Head) then
            if (conquest:GetInsideControl()) then
                print(chat.header('LAC - WHM'):append(chat.message('In Region - Using Republic Circlet')))
                gFunc.EquipSet('republic_circlet')
            end
        end
    elseif (string.match(action.Name, '.*na$') or (action.Name == 'Erase')) then
        gFunc.EquipSet('virology_ring')
    end
end

return profile
