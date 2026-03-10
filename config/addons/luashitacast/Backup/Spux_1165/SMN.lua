local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
	
	CurrentLevel = 0,
	 UseMDTIdle = false  -- Add this line
}
--local useMDTIdle = false
local lastAvatar;
----------- Custom Pet Action Check---------
--local lastPetActionName = ''
----------- Custom Pet Action Check---------
local macroSets = {
    ['Ifrit'] = { Book=2, Set=2 },
    ['Shiva'] = { Book=2, Set=3 },
	['Garuda'] = { Book=2, Set=7 },
	['Titan'] =  { Book=2, Set=4 },
	['Ramuh'] = { Book=2, Set=5 },
	['Leviathan'] = {Book=2, Set=6},
	['Carbuncle'] = {Book=2, Set=9},
	['Fenrir'] = {Book=2, Set=8},
	['Diabolos'] = {Book=2, Set=10},
	
};


local avatarToElement = {
    ['Ifrit'] = 'Fire',
    ['Titan'] = 'Earth',
    ['Leviathan'] = 'Water',
    ['Garuda'] = 'Wind',
    ['Shiva'] = 'Ice',
    ['Ramuh'] = 'Thunder',
    ['Carbuncle'] = 'Light',
    ['Fenrir'] = 'Dark',
    ['Diabolos'] = 'Dark',
	['LightSpirit'] = 'Light',
	['DarkSpirit'] = 'Dark',
	['EarthSpirit'] = 'Earth',
	['WaterSpirit'] = 'Water',
	['FireSpirit'] = 'Fire',
	['IceSpirit'] = 'Ice',
	['AirSpirit'] = 'Wind',
	['ThunderSpirit'] = 'Thunder',
    --Add more as needed depending on era, spirits, etc..|
};

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

local sets = {
	-- Example oh how to setup priority.
    -- Idle_Priority = {
        -- Head = { 'Emperor Hairpin' },
        -- Neck = { 'Peacock Amulet', 'Spike Necklace' },
        -- Ear1 = { 'Coral Earring', 'Wing Earring', 'Beetle Earring +1' },
        -- Ear2 = { 'Coral Earring', 'Wing Earring', 'Beetle Earring +1' },
        -- Body = { 'Mrc.Cpt. Doublet' },
        -- Hands = { 'Battle Gloves' },
        -- Ring1 = { 'Venerer Ring', 'Balance Ring' },
        -- Ring2 = { 'Spinel Ring', 'Balance Ring' },
        -- Back = { 'Amemet Mantle', 'Rabbit Mantle' },
        -- Waist = { 'Swift Belt', 'Brave Belt' },
        -- Legs = { 'Bastokan Subligar', 'Lizard Jerkin' },
		-- Feet = { 'Savage Gaiters' },
	-- },
    Idle = {
		Main = 'Terra\'s Staff',
		Ammo =  'Fortune Egg',
        Head = '',
        Neck = 'Jeweled Collar', --'Torque',--'Spirit Torque',
        Ear1 = 'Beastly Earring',
        Ear2 = 'Pigeon Earring',
        Body = 'Vermillion Cloak',
        Hands = 'Summoner\'s Brcr.', --'Austere Cuffs', 
        Ring1 = 'Ether Ring',--'Electrum Ring',
        Ring2 = 'Evoker\'s Ring',--'Electrum Ring', 
        Back = 'Gigant Mantle', --'Hexerei Cape',
        Waist = 'Hierarch Belt',--'Powerful Rope', 
        Legs = 'Summoner\'s Spats',
		Feet = 'Root Sabots',
	},
	
	
	
	Fishing = {
	
	Range = 'Halcyon Rod', --'Hume Fishing Rod', -- 'Halcyon Rod',
	Ammo = 'Fly Lure', --'Little Worm', --OTHER BAIT SWAP 'Insect Ball',
	Body = 'Angler\'s Tunica',
	Hands = 'Angler\'s Gloves',
	Legs = 'Fisherman\'s Hose',
	Feet = 'Angler\'s Boots',
	
	},
	
	MDT = {
		
		Main = 'Kirin\'s Pole',
		Head = 'Green Ribbon +1', --'Blue Ribbon',
		Neck = 'Jeweled Collar',
		Body = 'Black Cotehardie',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
		Legs = 'Errant Slops',
		Waist = 'Powerful Rope',
		Back = 'Hexerei Cape',
	
	},
	
	['Field'] = {
	
	Main = 'Earth Staff',
		Ammo =  'Fortune Egg',
        Head = '',
        Neck = 'Jeweled Collar', --'Torque',--'Spirit Torque',
        Ear1 = 'Beastly Earring',
        Ear2 = 'Pigeon Earring',
        Body = 'Field Tunica',
        Hands = 'Worker Gloves', 
        Ring1 = 'Ether Ring',--'Electrum Ring',
        Ring2 = 'Evoker\'s Ring',--'Electrum Ring', 
        Back = 'Hexerei Cape',
        Waist = 'Gigant Mantle', --'Hierarch Belt',--'Powerful Rope', 
        Legs = 'Evoker\'s Spats',
		Feet = 'Worker Boots',
	
	},
	
    Elemental_Idle_Priority = {
	
		Main = { },
		Head = { 'Evoker\'s Horn',  'Austere Hat', }, --'Summoner\'s Horn',
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = {'Austere Robe', },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' }, --'Summoner\'s Brcr.',
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = {'Summoner\'s Spats', },
		Feet = { 'Austere Sabots' },
		
	},
		
	
	Pet_Idle_Priority = {
		
		Head = {},
        Neck = { },
        Ear1 = {'Beastly Earring' },
        Ear2 = { },
        Body = { 'Austere Robe'}, --'Vermillion Cloak',
        Hands = {  }, --'Summoner\'s Brcr.'
        Ring1 = {}, --{'Ether Ring',},--'Electrum Ring',
        Ring2 = {'Evoker\'s Ring',},--'Electrum Ring', 
        Back = { },
        Waist = { },
        Legs = { },--{ 'Evoker\'s Spats' },
		Feet = { },
	},
    Carby_Idle_Priority = {
		
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { 'Vermillion Cloak', 'Austere Robe'},
        Hands = { 'Carbuncle Mitts' },
        Ring1 = {'Ether Ring',},--'Electrum Ring',
        Ring2 = {'Evoker\'s Ring',},--'Electrum Ring', 
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { },
	},
	Resting_Priority = {
		Main = { 'Pluto\'s Staff', 'Kukulcan\'s Staff' },
		Head = { },
        Neck = { 'Checkered Scarf' },
        Ear1 = { },
        Ear2 = { 'Boroka Earring' },
        Body = { 'Errant Hpl.', 'Vermillion Cloak','Seer\'s Tunic' },
        Hands = { 'Crow Bracers',},
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { 'Hierarch Belt','Reverend Sash' },
        Legs = { 'Baron\'s Slops' },
		Feet = {'Crow Gaiters', },
	},
    Idle_Regen_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { },
        Hands = { },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { },
	},
    Idle_Refresh_Priority = {},
	Town = {},
	
	Dt_Priority = {Main = 'Terra\'s Staff',
        Sub = '',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Empty',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Vermillion Cloak',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Ether Ring',
        Ring2 = {Name = "Evoker\'s Ring", Priority = 100},
        Back = 'Hexerei Cape',
        Waist = {Name = "Hierarch Belt", Priority = 100},
        Legs = 'Summoner\'s Spats',
        Feet = 'Evk. Pgch. +1',},
		
    Pet_Dt_Priority = {},
	
	Tp_Default_Priority = {},
	Tp_Hybrid_Priority = {},
	Tp_Acc_Priority = {},
	
--Pet engaged sets
	
    Pet_Engaged_Tp_Priority = {
		Head = {'Evoker\'s Horn', 'Austere Hat', },
        Neck = { },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { },
        Body = { 'Austere Robe', },
        Hands = { 'Summoner\'s Brcr.'}, -- 
        Ring1 = {'Evoker\'s Ring', },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = {  'Summoner\'s Pgch.' }, 
	},	
    Carby_Engaged_Tp_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { },
        Body = { 'Vermillion Cloak', },
        Hands = { 'Carbuncle Mitts' },
        Ring1 = {'Evoker\'s Ring', },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Summoner\'s Pgch.'}, 
	},
    Pet_Engaged_Priority = {
		Head ={},-- { 'Evoker\'s Horn',},
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = {'Austere Robe', }, -- { 'Vermillion Cloak', },
        Hands = {'Summoner\'s Brcr.' }, --'Summoner\'s Brcr.' 
        Ring1 = {'Evoker\'s Ring', },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = {  'Summoner\'s Pgch.'}, --'Summoner\'s Pgch.',
	},	
    Carby_Engaged_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { 'Vermillion Cloak', },
        Hands = { 'Carbuncle Mitts' },
        Ring1 = {'Evoker\'s Ring', },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Summoner\'s Pgch.'}, --'Summoner\'s Pgch.',
	},
	
--element perp
	Perp_Weather = { Head = 'Summoner\'s Horn', },
	Perp_Day = { Body = 'Summoner\'s Dblt.', },
	
--precast sets

    Precast_Priority = {
		Ammo = { 'Hedgehog Bomb' },
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { },
        Hands = { },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Rostrum Pumps' },
	},
    Cure_Precast_Priority = {
		Main = { 'Apollo\'s Staff' },
		Ammo = { 'Hedgehog Bomb' },
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { },
        Hands = { },
        Ring1 = { },
        Ring2 = { },
        Back = { 'Skulker\'s Cape' },
        Waist = { },
        Legs = { },
		Feet = { },
	},
    Enhancing_Precast_Priority = {
		Main = { 'Light Staff' },
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { },
        Hands = { },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { },
	},
    Stoneskin_Precast_Priority =  {
	},

    Cure_Priority = {},
    Regen_Priority = {},
    Cursna_Priority = {},

    Enhancing_Priority = {},
    Stoneskin_Priority = {
	 --Need 145 total MND to hit cap with /WHM enhancing skill
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
        Waist = {Name = "Friar\'s Rope", Priority = -1}, --"Penitent\'s Rope",
        Legs = 'Errant Slops',
        Feet = 'Errant Pgch.'
		},
		
	precast_hp_down = { -- -80 = 584/.75=777
        Main = '',
        Sub = '',
        Range = '',
        Head = 'Emperor Hairpin', -- -15
		Neck = 'Spirit Torque',
        Ear1 = '',
        Ear2 = '',
		Body = 'Austere Robe',
        Hands = 'Errant Cuffs',--'Battle Gloves', -20
        Ring1 = 'Ether Ring', 
        Ring2 = 'Astral Ring', --'Loyalty Ring', -25
        Back = '', --'Jester\'s Cape +1'
        Waist = 'Quick Belt', 
        Legs = '', 
        Feet = 'Errant Pgch.', -- -20
		},
		
	RingProc = { --Combo of FC and +HP. idleHP/.75 = required HP HP GOAL 498
		Main = '',
        Sub = '',
        Range = 'Happy Egg',
        Head = 'Evoker\'s Horn', --'Walkure Mask', --+15
        Neck = 'Shield Pendant', --+20
        Ear1 = 'Pigeon Earring', --+20
        Ear2 = 'Pigeon Earring', --+20
        Body = 'Austere Robe',--'Wonder Kaftan', --+32
        Hands = 'Austere Cuffs',-- +15 'Ogygos', --+20 Wonder Mitts, RSE 60 mitts, 
        Ring1 = 'Conjurer\'s Ring',
        Ring2 = 'Evoker\'s Ring', 
        Back = 'Hexerei Cape', --+7
        Waist = 'Powerful Rope', --+20
        Legs = 'Wonder Braccae', --+21
        Feet = 'Wonder Clomps', --+20
    },
		
    Refresh_Priority = {},

    SIR_Priority = {
		Legs = 'Summoner\'s Spats',},

    Drain_Priority = {},

	Ws_Default_Priority = {},
    Ws_Hybrid_Priority = {},
    Ws_Acc_Priority = {},
	
    BP_Priority = {
		Main = { },
		Head = { 'Austere Hat',}, --'Summoner\'s Horn',  },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { },
        Body = {  'Austere Robe' },--'Summoner\'s Dblt.',
        Hands = {'Summoner\'s Brcr.', 'Austere Cuffs' }, --'Summoner\'s Brcr.', 
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = {'Summoner\'s Spats', 'Crow Hose', },
		Feet = {'Summoner\'s Pgch.'  }, --'Summoner\'s Pgch.'
	},
    Siphon_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { },
        Ear2 = { 'Smn. Earring' },
        Body = { 'Austere Robe' },
        Hands = {'Summoner\'s Brcr.', 'Austere Cuffs' }, --
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},

	SmnPhysical_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn', 'Austere Hat'}, -- 'Summoner\'s Horn',
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = {'Summoner\'s Brcr.', 'Austere Cuffs' },-- 'Summoner\'s Brcr.',
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Summoner\'s Pgch.', 'Austere Sabots' },
	},
	SmnMagical_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn', }, --'Summoner\'s Horn'
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' }, --'Summoner\'s Brcr.',
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
	SmnSkill_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn',  'Austere Hat', }, --'Summoner\'s Horn',
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = {'Austere Robe', },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' }, --'Summoner\'s Brcr.',
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
    SmnAttributes_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn', 'Summoner\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = {'Summoner\'s Brcr.', 'Austere Cuffs' }, --'Summoner\'s Brcr.', 
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
    SmnHealing_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' }, --'Summoner\'s Horn'
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring'}, 
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' }, --'Summoner\'s Brcr.',
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
	SmnEnfeebling_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn'  }, --'Summoner\'s Horn'
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = {'Summoner\'s Brcr.', 'Austere Cuffs' }, --'Summoner\'s Brcr.', 
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
    SmnHybrid_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn',  }, --'Summoner\'s Horn'
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = {'Summoner\'s Brcr.', 'Austere Cuffs' }, --'Summoner\'s Brcr.', 
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Summoner\'s Pgch.', 'Austere Sabots' },
	},
	
	Cuffs = {
	Hands = 'Crow Bracers',
	},
	Sneak = {
		Feet = 'Dream Boots +1',
	},
	Invisible = {
		Hands = 'Dream Mittens +1',
		},
	
    TH = {},
	Movement = {},
};
profile.Sets = sets;

profile.Packer = {};

local function HandlePetAction(PetAction)
	if (gcinclude.SmnSkill:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnSkill);
        if PetAction.Name == 'Wind\'s Blessing' then
            gFunc.EquipSet(sets.SmnAttributes);
        end
	elseif (gcinclude.SmnMagical:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnMagical);
    elseif (gcinclude.SmnHybrid:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnHybrid);
	elseif (gcinclude.SmnHealing:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnHealing);
    elseif (gcinclude.SmnEnfeebling:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnEnfeebling);
    	
	elseif petAction == 'Shining Ruby' then	
		gFunc.EquipSet(sets.Cuffs);
		
	else
        gFunc.EquipSet(sets.SmnPhysical);
end		
    
end



profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
    gcinclude.settings.RegenGearHPP = 50;
    gcinclude.settings.RefreshGearMPP = 60;
    gcinclude.settings.PetDTGearHPP = 30;
    --[[ Set your job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 10');
	(function() AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 07'); end):once(3);
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /rdm /lac fwd');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^F1 /lac fwd idlerefresh');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind F11 /lac fwd field');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad1 /ma "Carbuncle" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad5 /ma "Titan" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad4 /ma "Garuda" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad3 /ma "Shiva" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad2 /ma "Ifrit" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad6 /ma "Leviathan" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad7 /ma "Ramuh" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad8 /ma "Fenrir" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad9 /ma "Diabolos" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind numpad0 /ja Assault <stnpc>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !` /ja Release <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !HOME /warpstaff');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !END /item "Wizard Cookie" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !DELETE /ma "Mage\'s Ballad" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !INSERT /lac fwd PerpRing'); --AltInsert
	
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !END');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad1');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad5');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad4');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad3');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad2');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad6');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad7');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad8');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad9');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind numpad0');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !`');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !HOME');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !END');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !DELETE');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !INSERT');
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args);
	
	if (args[1] == 'field') then
		gFunc.Message('HELM Set');
		usefield = (not usefield)
	end	
	


if (args[1] == 'idleMDT') then
	useMDTIdle = not useMDTIdle
	gFunc.Message('MDT Toggle: ' ..tostring(useMDTIdle))
end
	
	
	
	--if (Settings.UseMDTIdle == true) then
	--	Settings.UseMDTIdle =  false;
--	else	
--		Settings.UseMDTIdle = true;
	--	end
--	end

if (args[1] == 'idleFishing') then
	if (Settings.UseFishingIdle == true) then
		Settings.UseFishingIdle =  false;
	else	
		Settings.UseFishingIdle = true;
		end
	end
 -- Custom Pet Action Check
   -- local petAction = gData.GetPetAction()
   -- if (petAction ~= nil and string.match(petAction.Name, 'Rolling')) then
    --    AshitaCore:GetChatManager():QueueCommand(-1, '/tt custom "Rolling Thunder" 1m')        -- You can replace the /echo with any command you'd like, e.g.:
        -- AshitaCore:GetChatManager():QueueCommand(1, '/input /jobability "Wild Card" <me>')
   -- end
end




local function ChangeMacroSet(data)
    AshitaCore:GetChatManager():QueueCommand(1, string.format('/macro book %u', data.Book));
    coroutine.sleep(2);
    AshitaCore:GetChatManager():QueueCommand(1, string.format('/macro set %u', data.Set));
end

local function UpdateMacroSet(petName)
    if (petName == lastAvatar) then
        return;
    end
	
    lastAvatar = petName;
    local macroData = macroSets[petName];
    if (macroData ~= nil) then
        local boundFunction = ChangeMacroSet:bind1(macroData);
        boundFunction:oncef(1);
    end
end



profile.HandleDefault = function()
    local weather = gData.GetEnvironment();
		--if (env.DayElement == petElement) then
		--gFunc.Equip('body','Summoner\'s Dblt.');
	--end
    local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
							--print("Pet Status: " .. tostring(pet.Status))
							
	 ----------- Custom Pet Action Check---------
    
	 --if (petAction ~= nil and string.match(petAction.Name, 'Rolling Thunder')) then
     --   if (lastPetActionName ~= petAction.Name) then
     --       AshitaCore:GetChatManager():QueueCommand(1, '/tt custom "Rolling Thunder" 1m');
	 --   lastPetActionName = petAction.Name;
	 --end
		
  
	--elseif (petAction == nil) then
    --    lastPetActionName = '';  -- Reset if no pet action is happening
    --end	   
    --------------- end Custom Pet Action Check --------------------
    if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end


	local player = gData.GetPlayer();
	
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end
	
	
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default);
	end	
		
    if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet'))
			end
	if (gcdisplay.GetToggle('TH') == true) then 
			gFunc.EquipSet(sets.TH); 

		
    elseif (pet ~= nil and pet.Status == 'Engaged') then
       gFunc.EquipSet(sets.Pet_Engaged_TP);
	  --Handl
		
    end
	
	
	if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
	else	
	
	--if (usefield) then
	--		gFunc.EquipSet(sets.Field);
	--else		
	if (useMDTIdle == true) then
           gFunc.EquipSet(sets.MDT);
			--gFunc.Message('Refresh Idle')
    else
		gFunc.EquipSet(sets.Idle);
	end
	
	if (Settings.UseFishingIdle == true) then
           gFunc.EquipSet(sets.Fishing);
			--gFunc.Message('Refresh Idle')
   -- else
--		gFunc.EquipSet(sets.Idle);
	end
	end
	
    --if (pet ~= nil) and (pet.Status == 'Idle') then
       -- gFunc.EquipSet(sets.Pet_Idle);
	--end
	
	if (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
	end
	
	gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle('DTset') == true) then
		gFunc.EquipSet(sets.Dt);
        if (pet ~= nil) then
            gFunc.EquipSet(sets.Pet_Dt);
		end
	end
	
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement); 
	end
	
	if (pet ~= nil) then
        UpdateMacroSet(pet.Name);
	
	
	
		if (gcdisplay.GetToggle('PerpRing') == true) then gFunc.EquipSet(sets.RingProc);
			end
	local petElement = avatarToElement[pet.Name];

			if (petElement ~= nil) then
			gFunc.Equip('Main', ElementalStaffTable[petElement]);
		end
		
		--if (gcdisplay.GetToggle('PerpRing') == true) then gFunc.EquipSet(sets.RingProc); 
		if (pet.Name == 'LightSpirit') then
			gFunc.EquipSet(sets.Elemental_Idle);
		end
		if (pet.Status == 'Idle') then
			gFunc.EquipSet(sets.Pet_Idle);
		end
			if (petElement == weather.WeatherElement) then
				gFunc.EquipSet(sets.Perp_Weather);
			end
			if (petElement == weather.DayElement) then
				gFunc.EquipSet(sets.Perp_Day);
			end
		if (pet.Name == 'Carbuncle') then
			
			--if (usefield) then
			--gFunc.EquipSet(sets.Field);
			---else
			
			gFunc.EquipSet(sets.Carby_Idle); 
		end
			
		if (pet.Status == 'Engaged') then
			gFunc.EquipSet(sets.Pet_Engaged);
			if (petElement == weather.WeatherElement) then
				gFunc.EquipSet(sets.Perp_Weather);
			end
			if (petElement == weather.DayElement) then
				gFunc.EquipSet(sets.Perp_Day);
			end
			if (pet.Name == 'Carbuncle') then
				gFunc.EquipSet(sets.Carby_Engaged); 
				end	
		end
	end
end
	
	
	




profile.HandleAbility = function()
	local action = gData.GetAction();
	if action.Type:contains('Blood Pact') then
		gFunc.EquipSet(profile.Sets.BP);
	end
end

--profile.HandleAbility = function()
	--local action = gData.GetAction();
	--if action.Type:contains('Blood Pact') then
	--	gFunc.EquipSet(profile.Sets.BP);
	--end
   -- local ac = gData.GetBuffCount('Astral Conduit');
    --if ac > 0 then return end
--
  --  if (ability.Name == 'Release') or (ability.Name == 'Avatar\'s Favor') or (ability.Name == 'Assault') or (ability.Name == 'Retreat') or (ability.Name == 'Apogee') then return end
--
  --  gFunc.EquipSet(sets.BP);
--
  --  if (ability.Name == 'Elemental Siphon') then
    --    gFunc.EquipSet(sets.Siphon);
    --end

    --gcinclude.CheckCancels();
--end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);
	
    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);

        if string.contains(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin_Precast);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end
if (gcdisplay.GetToggle('PerpRing') == true) then gFunc.EquipSet(sets.precast_hp_down); 
	end
    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.SIR);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);

        if string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Regen') then
            gFunc.EquipSet(sets.Regen);
        elseif string.contains(spell.Name, 'Refresh') then
            gFunc.EquipSet(sets.Refresh);
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        end
    elseif (spell.Skill == 'Summoning Magic') then
        gFunc.EquipSet(sets.SIR);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Drain);
    end
	
	
	if string.match(spell.Name, 'Invisible') then
			gFunc.EquipSet(sets.Invisible);
	end
		
	if string.match(spell.Name, 'Sneak') then
		gFunc.EquipSet(sets.Sneak);
	end
	
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
	local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
    end
end


return profile;
