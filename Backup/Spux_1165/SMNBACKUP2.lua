local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
	CurrentLevel = 0,
}

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
    --Add more as needed depending on era, spirits, etc..|
};

local ElementalStaffTable = {
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Dark Staff'
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
    Idle_Priority = {
        Head = { },
        Neck = { },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { },
        Body = { 'Vermillion Cloak', 'Austere Robe' },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { 'Evoker\'s Ring' },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { },
	},
    Pet_Idle_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { },
        Body = { 'Vermillion Cloak', },
        Hands = { 'Summoner\'s Brcr.' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { },
	},
    Carby_Idle_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { 'Vermillion Cloak', },
        Hands = { 'Carbuncle Mitts' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { },
	},
	Resting_Priority = {
		Main = { 'Dark Staff', 'Kukulcan\'s Staff' },
		Head = { },
        Neck = { 'Checkered Scarf' },
        Ear1 = { },
        Ear2 = { 'Boroka Earring' },
        Body = { 'Vermillion Cloak', 'Seer\'s Tunic' },
        Hands = { },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { 'Reverend Sash' },
        Legs = { 'Baron\'s Slops' },
		Feet = { },
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
	
	Dt_Priority = {},
    Pet_Dt_Priority = {},
	
	Tp_Default_Priority = {},
	Tp_Hybrid_Priority = {},
	Tp_Acc_Priority = {},
	
--Pet engaged sets
	
    Pet_Engaged_Tp_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { },
        Body = { 'Vermillion Cloak', },
        Hands = { 'Summoner\'s Brcr.' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Summoner\'s Pgch.' },
	},	
    Carby_Engaged_Tp_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { },
        Body = { 'Vermillion Cloak', },
        Hands = { 'Carbuncle Mitts' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Summoner\'s Pgch.' },
	},
    Pet_Engaged_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { 'Vermillion Cloak', },
        Hands = { 'Summoner\'s Brcr.' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Summoner\'s Pgch.' },
	},	
    Carby_Engaged_Priority = {
		Head = { },
        Neck = { },
        Ear1 = { },
        Ear2 = { },
        Body = { 'Vermillion Cloak', },
        Hands = { 'Carbuncle Mitts' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Summoner\'s Pgch.' },
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
		Main = { 'Light Staff' },
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
    Stoneskin_Precast_Priority = {
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

    Cure_Priority = {},
    Regen_Priority = {},
    Cursna_Priority = {},

    Enhancing_Priority = {},
    Stoneskin_Priority = {},
    Refresh_Priority = {},

    SIR_Priority = {},

    Drain_Priority = {},

	Ws_Default_Priority = {},
    Ws_Hybrid_Priority = {},
    Ws_Acc_Priority = {},
	
    BP_Priority = {
		Main = { },
		Head = { 'Summoner\'s Horn', 'Austere Hat' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { },
        Body = { 'Summoner\'s Dblt.', 'Austere Robe' },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Summoner\'s Pgch.' },
	},
    Siphon_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { },
        Ear2 = { 'Smn. Earring' },
        Body = { 'Austere Robe' },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},

	SmnPhysical_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Austere Sabots' },
	},
	SmnMagical_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
	SmnSkill_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
    SmnAttributes_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
    SmnHealing_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
	SmnEnfeebling_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { },
		Feet = { 'Austere Sabots' },
	},
    SmnHybrid_Priority = {
		Main = { },
		Head = { 'Evoker\'s Horn' },
        Neck = { 'Smn. Torque' },
        Ear1 = { 'Beastly Earring' },
        Ear2 = { 'Smn. Earring' },
        Body = { },
        Hands = { 'Summoner\'s Brcr.', 'Austere Cuffs' },
        Ring1 = { },
        Ring2 = { },
        Back = { },
        Waist = { },
        Legs = { 'Evoker\'s Spats' },
		Feet = { 'Austere Sabots' },
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
    --[[ Set you job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 8');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
	gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    local weather = gData.GetEnvironment();
    local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
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
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
		if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
    -- elseif (pet ~= nil and pet.Status == 'Engaged') then
        -- gFunc.EquipSet(sets.Pet_Engaged_TP);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
		gFunc.EquipSet(sets.Idle);
    end

    -- if (pet ~= nil) and (pet.Status == 'Idle') then
        -- gFunc.EquipSet(sets.Pet_Idle);
	-- end
	
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
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
	
	if (pet ~= nil) then
		local petElement = avatarToElement[pet.Name];
		if (petElement ~= nil) then
			gFunc.Equip('main', ElementalStaffTable[petElement]);
		end
		if (pet.Status == 'Idle') then
			gFunc.EquipSet(sets.Pet_Idle);
			if (petElement == weather.WeatherElement) then
				gFunc.EquipSet(sets.Perp_Weather);
			end
			if (petElement == weather.DayElement) then
				gFunc.EquipSet(sets.Perp_Day);
			end
			if (pet.Name == 'Carbuncle') then
				gFunc.EquipSet(sets.Carby_Idle); end
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
				gFunc.EquipSet(sets.Carby_Engaged); end	
		end
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
    local ac = gData.GetBuffCount('Astral Conduit');
    if ac > 0 then return end

    if (ability.Name == 'Release') or (ability.Name == 'Avatar\'s Favor') or (ability.Name == 'Assault') or (ability.Name == 'Retreat') or (ability.Name == 'Apogee') then return end

    gFunc.EquipSet(sets.BP);

    if (ability.Name == 'Elemental Siphon') then
        gFunc.EquipSet(sets.Siphon);
    end

    gcinclude.CheckCancels();
end

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