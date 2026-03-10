local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local heal_hp_threshold_whm = 859
local heal_hp_threshold_rdm = 869

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local ethereal_earring = {
    --Ear2 = 'Ethereal Earring',
}
local warlocks_mantle = { -- Don't add 2% to fastCastValue for this as it is SJ dependant
    --Back = 'Warlock\'s Mantle',
}

local sets = {
    Idle = {
		Ammo = 'Tiphia Sting', 
        Head = 'Drachen Armet', --'Homam zucchetto',
        Neck = 'Merman\'s Gorget', --'Spike Necklace', --'Love Torque',
        Ear1 = 'Merman\'s Earring', --'Brutal Earring',
        Ear2 = 'Merman\'s Earring', --'Ethereal Earring',
        Body = 'Scorpion Harness',--'Brigandine',--'Mrc.Cpt. Doublet', --'Barone Corazza', 
        Hands = 'Battle Gloves', --'Homam Manopolas',
        Ring1 = 'Woodsman Ring', --'Venerer Ring', --'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring', --'Puissance Ring', --'Woodsman Ring', --'Rajas Ring',
        Back = 'Amemet Mantle', --'Traveler\'s Mantle', --'Boxer\'s Mantle',
        Waist = 'Swift Belt', --'Tilt Belt', --'Sprinter\'s Belt', 
        Legs =  'Drachen Brais', --'Republic Subligar', --'Crimson Cuisses',
        Feet = 'Bounding Boots', --'Homam Gambieras',
		},
		
		
    IdleALT = {},
	
    Resting = {Ammo = 'Happy Egg',
        Head = 'Homam zucchetto',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Sanative Earring',
        Body = 'Barone Corazza',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Wyrm Greaves',
		},
    Town = {
		Ammo = 'Tiphia Sting',
        Head = 'Drachen Armet',  --'Homam zucchetto',
        Neck = 'Merman\'s Gorget', --'Spike Necklace', --'Love Torque',
        Ear1 = 'Spike Earring', --'Brutal Earring',
        Ear2 = 'Spike Earring', --'Beastly Earring',
        Body = 'Scorpion Harness', --'Brigandine',--'Mrc.Cpt. Doublet',  --'Homam Corazza','Brigandine', --
        Hands = 'Battle Gloves', --'Homam Manopolas',
        Ring1 = 'Woodsman Ring', --'Venerer Ring',--'Woodsman Ring', -- --'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring', --'Puissance Ring',--'Woodsman Ring', -- --'Rajas Ring',
        Back = 'Amemet Mantle', --'Traveler\'s Mantle', --'Forager\'s Mantle',
        Waist = 'Swift Belt',  --'Tilt Belt', --'Sprinter\'s Belt', 
        Legs =  'Drachen Brais', --'Republic Subligar',
		Feet = 'Bounding Boots',--'Homam Gambieras',
	},
    Movement = {},

    DT = {},
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
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {
		Ammo = 'Happy Egg',--'Tiphia Sting',/
        Head = 'Empress Hairpin',--'Homam zucchetto',
        Neck = 'Spike Necklace', --'Love Torque',
        Ear1 = 'Spike Earring',
        Ear2 = 'Spike Earring', --'Ethereal Earring',
        Body = 'Brigandine', --'Mrc.Cpt. Doublet', --'Homam Corazza',
        Hands = 'Battle Gloves', --'Homam Manopolas',
        Ring1 = 'Woodsman Ring', --'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring', -- 'Rajas Ring',
        Back = 'Traveler\'s Mantle',--'Forager\'s Mantle',
        Waist = 'Swift Belt', --'Sprinter\'s Belt',
        Legs = 'Drachen Brais', --'Republic Subligar',--'Homam Cosciales',
        Feet = 'Bounding Boots',--'Homam Gambieras',
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
	Ammo = 'Fly Lure', --'Little Worm', --OTHER BAIT SWAP 'Insect Ball',
	Body = 'Angler\'s Tunica',
	Hands = 'Angler\'s Gloves',
	Legs = 'Angler\'s Hose',
	Feet = 'Angler\'s Boots',},

    TP_LowAcc = {
	Ammo = 'Tiphia Sting',
        Head = 'Walkure Mask',  --'Homam zucchetto',
        Neck = 'Merman\'s Gorget', --'Spike Necklace', --'Love Torque', --
        Ear1 = 'Merman\'s Earring', --'Brutal Earring',
        Ear2 = 'Merman\'s Earring', --Beastly
        Body = 'Scorpion Harness',
        Hands = 'Battle Gloves', --'Homam Manopolas',
        Ring1 = 'Woodsman Ring', --'Venerer Ring',--'Woodsman Ring', -- --'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring', --'Puissance Ring',--'Woodsman Ring', -- --'Rajas Ring',
        Back = 'Amemet Mantle', --'Traveler\'s Mantle', --'Forager\'s Mantle',
        Waist = 'Swift Belt', 
        Legs = 'Drachen Brais',--'Republic Subligar',
		Feet = 'Bounding Boots', 
		},
   
   TP_HighAcc = {
		Ammo = 'Tiphia Sting',
        Head = 'Empress Hairpin',  --'Homam zucchetto',
        Neck = 'Merman\'s Gorget', --'Spike Necklace', --'Love Torque',
        Ear1 = 'Merman\'s Earring', --'Spike Earring', --'Brutal Earring',
        Ear2 = 'Merman\'s Earring', --'Spike Earring', --'Beastly Earring',
        Body = 'Scorpion Harness', --'Brigandine',--'Mrc.Cpt. Doublet',  --'Homam Corazza','Brigandine', --
        Hands = 'Battle Gloves', --'Homam Manopolas',
        Ring1 = 'Woodsman Ring', --'Venerer Ring',--'Woodsman Ring', -- --'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring', --'Puissance Ring',--'Woodsman Ring', -- --'Rajas Ring',
        Back = 'Traveler\'s Mantle', --'Forager\'s Mantle',
        Waist = 'Life Belt', --'Tilt Belt', --'Sprinter\'s Belt', 
        Legs =  'Drachen Brais', --'Republic Subligar',
		Feet = 'Bounding Boots',
		},
	
	
	
    TP_Mjollnir_Haste = {},

    MaxHP = {    --+161 = 1114   /2 = 557 Threshold
		Ammo = 'Happy Egg',
        Head = 'Drachen Armet', --+1--12
        Neck = 'Shield Pendant', --20
        Ear1 = 'Pigeon Earring', --'Ethereal Earring', --20
        Ear2 = 'Pigeon Earring', --'Loquac. Earring', --20
        Body = 'Wonder Kaftan', --'Homam Corazza', --36
        Hands = 'Enkelados\'s Brc.', --'Homam Manopolas', --25
        Ring1 = '', --'Toreador\'s Ring',
        Ring2 = 'Bomb Ring', --'Bomb Queen Ring', --15
        Back = '', --'Gigant Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 100 }, --20
        Legs = 'Wonder Braccae', --'Homam Cosciales', --21
        Feet = 'Wonder Clomps', --'Homam Gambieras', --20
		},
    BreathBonus = {
		Head = 'Wym. Armet +1',
		Body = 'Wyvern Mail',
		Hands = 'Ostreger Mitts', 
        Legs =  'Drachen Brais', --'Drn. Brais +1',
		Feet = 'Homam Gambieras',
		},
    BreathBonus_NonMage = {},
    Stoneskin = {},

    ['Ancient Circle'] = {
	Legs = 'Drn. Brais +1',
	},
	
    ['Jump'] = {
		Ammo = 'Happy Egg',
        Head = 'Wym. Armet +1',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Homam Corazza',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs =  'Drachen Brais', --'Drn. Brais +1',
        Feet = 'Drachen Greaves',
		},
		
    ['Jump Accuracy'] = {
		Ammo = 'Happy Egg',
        Head = 'Wym. Armet +1',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Homam Corazza',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs =  'Drachen Brais', --'Drn. Brais +1',
        Feet = 'Volans Greaves',
		},
		
    ['High Jump'] = {Ammo = 'Tiphia Sting',
        Head = 'Wym. Armet +1',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Homam Corazza',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Vaulter\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs =  'Drachen Brais', --'Wyrm Brais',
        Feet = 'Hct. Leggings',
		},
    ['High Jump Accuracy'] = {},
	
    ['Super Jump'] = {},
	
    ['Call Wyvern'] = {
	Body = 'Wyrm Mail',
	},
	
    ['Spirit Link'] = {
	 Head = 'Drn. Armet +1',
		Body = 'Wyvern Mail',
		Hands = 'Ostreger Mitts', 
        Legs = 'Drn. Brais +1',
		Feet = 'Homam Gambieras',
		},

    WS = {
	Ammo = 'Tiphia Sting',
        Head = 'Walkure Mask', --'Wym. Armet +1',
        Neck = 'Spike Necklace', --'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Wonder Kaftan', --'Hecatomb Harness',
        Hands = 'Enkelados\'s Bracelets', --'Gigas Bracelets', --'Hecatomb Mittens',
        Ring1 = 'Puissance Ring',--'Toreador\'s Ring',
        Ring2 = 'Puissance Ring', --'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swordelt +1',--,'Barbarian\'s Belt', --'Wyrm Belt',
        Legs = 'Wonder Braccae', --'Drn. Brais +1',
        Feet = 'Wonder Clomps',
		},
    WS_HighAcc = {},

    ['Penta Thrust'] = {
		Ammo = 'Tiphia Sting',
        Head = 'Walkure Mask', --'Wym Armet +1',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Enkelados\'s Bracelets',--'Hecatomb Mittens',
        Ring1 = '', --'Ruby Ring',
        Ring2 = '', --,'Rajas Ring',
        Back = 'Amemet Mantle', --'Forager\'s Mantle',
        Waist = 'Life Belt', --'Warwolf Belt',
        Legs =  'Drachen Brais', --'Drn. Brais +1',
        Feet = 'Wonder Clomps', --'Hct. Leggings',
		},
		
    ['Wheeling Thrust'] = {},
    ['Impulse Drive'] = {},
    ['Skewer'] = {},
    ['Geirskogul'] = {},


    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
}

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 11')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

sets.ethereal_earring = ethereal_earring
sets.warlocks_mantle = warlocks_mantle
profile.Sets = gcmelee.AppendSets(sets)

local JobAbilities = T{
    'Jump',
    'High Jump',
    'Super Jump',
    'Spirit Link',
    'Call Wyvern',
    'Ancient Circle',
}

local WeaponSkills = T{
    'Impulse Drive',
    'Wheeling Thrust',
    'Skewer',
    'Penta Thrust',
    'Geirskogul',
}

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Steady Wing') then
        gFunc.EquipSet(sets.BreathBonus)
    elseif (JobAbilities:contains(action.Name)) then
        gFunc.EquipSet(sets[action.Name])
    end

    if (gcmelee.GetAccuracyMode() == 'HighAcc') then
        if (action.Name == 'Jump') then
            gFunc.EquipSet('Jump Accuracy')
        elseif (action.Name == 'High Jump') then
            gFunc.EquipSet('High Jump Accuracy')
        end
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
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (WeaponSkills:contains(action.Name)) then
      gFunc.EquipSet(sets[action.Name])
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local isWHM = player.SubJob == 'WHM'
    local isRDM = player.SubJob == 'RDM'
    local isMage = isWHM or isRDM
    local weakened = gData.GetBuffCount('Weakness')

    if (isWHM and player.HP <= heal_hp_threshold_whm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end
    if (isRDM and player.HP <= heal_hp_threshold_rdm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end

    if (isMage) then
        gFunc.EquipSet('ethereal_earring')
    end

    gcmelee.DoDefaultOverride()

    local petAction = gData.GetPetAction()
    if (petAction ~= nil) then
        if (isMage) then
            gFunc.EquipSet(sets.BreathBonus)
        else
            gFunc.EquipSet(sets.BreathBonus_NonMage)
        end
        return
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle.Back) then
        gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.EquipSet('warlocks_mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (player.SubJob == 'WHM' or player.SubJob == 'RDM') then
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        else
            gFunc.EquipSet(sets.MaxHP)
        end
    end
end

return profile
