local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = 904 -- The Max MP you have when /blm in your idle set

local virology_ring = false
local virology_ring_slot = 'Ring2'

local displayheadOnAbility = false

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
		Head = 'Green Ribbon +1',
		Neck = 'Spirit Torque',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Noble\'s Tunic',
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Ether Ring',
		Ring2 = 'Astral Ring',
		Back = 'Cheviot Cape',
		Waist = 'Penitent\'s Rope',
		Legs = 'Healer\'s Pantaln.',
		Feet = 'Healer\'s Duckbills',
	
	},
    IdleALT = {
		
	},
    IdleMaxMP = {},
    Resting = {
		Main = 'Pluto\'s Staff',
		Ammo = '',
		Head = '',
		Neck = 'Checkered Scarf',
		Ear1 = '',
		Ear2 = '',
		Body = 'Seer\'s Tunic', --Errant Hppl
		Hands = '',
		Ring1 = '',
		Ring2 = '',
		Back = '',
		Waist = '',
		Legs = 'Baron\'s Slops',
		Feet = '',
		},
		
    Town = {
		Main = 'Terra\'s Staff',
		Ammo = 'Fortune Egg',
		Head = 'Green Ribbon +1',
		Neck = 'Spirit Torque',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Noble\'s Tunic',
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Ether Ring',
		Ring2 = 'Astral Ring',
		Back = 'Lucent Cape',
		Waist = 'Penitent\'s Rope',
		Legs = 'Healer\'s Pantaln.',
		Feet = 'Healer\'s Duckbills',
	
	},
    Movement = {},

    DT = {},
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    Casting = { -- Default Casting Equipment when using Idle sets
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
	
	Waist = 'Swift Belt',
	
    },
    ConserveMP = {},

    Yellow = {},
    Cure = {
		Main = 'Apollo\'s Staff',--I 30
        Sub = '',
		Head = 'Crow Beret', --7E
        Ammo = '',
        Neck = 'Justice Badge',--Benign neck
		Body = 'Noble\'s Tunic', --8E
        Ear1 = '',--I 5
        Ear2 = '',--II 2
        Hands = 'Healer\'s Mitts', --4E
        Ring1 = 'Peace Ring', --1E
        Ring2 = '',--'Solace Ring',
        Back = '',
        Waist = 'Penitent\'s Rope', --3E
        Legs = 'Crow Hose', --5E
        Feet = 'Crow Gaiters', --4E
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
    Barspell = {},
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
        Neck = 'Ajari Necklace',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Justaucorps',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Solace Ring',
        Ring2 = 'Solace Ring',
        Back = 'Red Cape',
        Waist = 'Penitent\'s Rope', --'Friar\'s Rope',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Seer\'s Pumps',
	
	
	
	},
    Banish = {
	Main = 'Apollo\'s Staff',
        Sub = '',
        Ammo = 'Fortune Egg',
        Head = 'Bastokan Circlet',
        Neck = 'Ajari Necklace',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Justaucorps',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Solace Ring',
        Ring2 = 'Solace Ring',
        Back = 'Red Cape',
        Waist = 'Penitent\'s Rope', --'Friar\'s Rope',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Seer\'s Pumps',},
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
        Back = 'Lucent Cape', --'Gigant Mantle',
        Waist = 'Powerful Rope',
        Legs = 'Wonder Braccae', --'Homam Cosciales',
        Feet = 'Wonder Clomps', --'Homam Gambieras',
		},
        LockSet2 = {
	
	Range = 'Halcyon Rod', --'Hume Fishing Rod', --
	Ammo = 'Worm Lure', --OTHER BAIT SWAP 'Insect Ball', 'Fly Lure', --
	Body = 'Angler\'s Tunica',
	Hands = 'Angler\'s Gloves',
	Legs = 'Angler\'s Hose',
	Feet = 'Angler\'s Boots',
	},
    LockSet3 = {},

    TP = {},
    TP_HighAcc = {},
    TP_NIN = {},
    TP_Mjollnir_Haste = {},
    WS = {},
    WS_HighAcc = {},
    WS_Randgrith = {},
	
	Lockstyle = {
		Main = 'Light Staff',
		Head = 'Healer\'s Cap',
		Body = 'Noble\'s Tunic',
		Legs = 'Healer\'s Pantaln.',
		Feet = 'Healer\'s Duckbills',
	
	
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

    local action = gData.GetAction()
    if (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.WS_Randgrith)
    end

    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()

    gcmage.Load()
    profile.SetMacroBook()
	
	AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 018');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !` //release')
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
	gFunc.LockStyle(sets.Lockstyle)
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Skill == 'Enhancing Magic') then
        if (string.match(action.Name, 'Regen')) then
            gFunc.EquipSet('Regen')
        elseif (string.match(action.Name, 'Bar')) then
            gFunc.EquipSet('Barspell')
        end
    elseif (string.match(action.Name, 'Banish')) then
        gFunc.EquipSet('Banish')
    elseif virology_ring and (string.match(action.Name, '.*na$') or (action.Name == 'Erase')) then
        gFunc.Equip(virology_ring_slot, 'Virology Ring')
    end
end

return profile
