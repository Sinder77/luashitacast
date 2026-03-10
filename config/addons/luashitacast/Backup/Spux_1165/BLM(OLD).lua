local profile = {};

gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
	CurrentLevel = 0,
}

local ElementalStaffTable = {
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Dark Staff'

local sets = {
    Resting = {
        Main = 'Pilgrim\'s Wand',--
        Sub = 'Solid Wand',-- 'Yew Wand +1',
		Head = '',
		Body = 'Seer\'s Tunic',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Hands = 'Baron\'s Cuffs',
        Ring1 = 'Ether Ring',
        Ring2 = 'Astral Ring',
        Back = 'Black Cape +1', --'Cotton Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops',
        Feet = '',
    },
	
    Nuke = {
        Main = 'Solid Wand',--'Yew Wand +1',
		Sub = 'Solid Wand',--'Yew Wand +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
		Head = 'Seer\'s Crown +1',
        Body = 'Seer\'s Tunic',--'Ryl.Ftm. Tunic',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Eremite\'s Ring',
        Ring2 = 'Eremite\'s Ring',
        Back = 'Black Cape +1', --'Cotton Cape',
        Waist = 'Mrc.Cpt. Belt', --'Friar\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Seer\'s Pumps',--'Holly Clogs',
    },
	
	Idle = {
		Main ='Solid Wand',--'Yew Wand +1',
		Sub = 'Solid Wand',--'Yew Wand +1',
		Ammo = 'Sweet Sachet',
        Neck = 'Black Neckerchief',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
		Head = 'Seer\'s Crown +1',
        Body = 'Seer\'s Tunic',--'Ryl.Ftm. Tunic',
        Hands = 'Seer\'s Mitts +1',
        Ring1 = 'Wisdom Ring',--'Eremite\'s Ring',
        Ring2 = 'Wisdom Ring',--'Eremite\'s Ring',
        Back = 'Black Cape +1', --'Cotton Cape',
        Waist = 'Mrc.Cpt. Belt', --'Friar\'s Rope',
        Legs = 'Seer\'s Slacks',
        Feet = 'Seer\'s Pumps',--'Holly Clogs',
};
	
	
	Burst = {
	Head = 'Republic Circlet',
	Body = 'Ryl.Sqr. Robe +2',
	
	};
	
	Enfeeble = {
	Main = '',
	Sub = '',
	Ammo = '',
	Neck = '',
	Ear1 = '',
	Ear2 = '',
	Head = '',
	Body = '',
	Hands = '',
	Ring1 = '',
	Ring2 = '',
	Back = '',
	Waist = '',
	Legs = '',
	Feet = '',
	
	
	};
	
	mnd_enfeeble = {
	Main = '',
	Sub = '',
	Ammo = '',
	Neck = '',
	Ear1 = '',
	Ear2 = '',
	Head = '',
	Body = '',
	Hands = '',
	Ring1 = '',
	Ring2 = '',
	Back = '',
	Waist = '',
	Legs = '',
	Feet = '',
	
	
	};
	
	int_enfeeble = {
	Main = '',
	Sub = '',
	Ammo = '',
	Neck = '',
	Ear1 = '',
	Ear2 = '',
	Head = '',
	Body = '',
	Hands = '',
	Ring1 = '',
	Ring2 = '',
	Back = '',
	Waist = '',
	Legs = '',
	Feet = '',
	
	
	};
	
	Town = {},
	Idle_Refresh = {},
	Dt = {},
	Idle_Regen = {},
}
profile.Sets = sets;
profile.Packer = {
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
    gcinclude.settings.RegenGearHPP = 50;
    gcinclude.settings.RefreshGearMPP = 60;
    gcinclude.settings.PetDTGearHPP = 30;
    --[[ Set your job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad1 /elecycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad4 /nukeset');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !f10 /dt');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !` /burst');
	end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    local weather = gData.GetEnvironment();
    local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
	--print("Pet Status: " .. tostring(pet.Status))
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
		
    --elseif (pet ~= nil and pet.Status == 'Engaged') then
       -- gFunc.EquipSet(sets.Pet_Engaged_TP);
		
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
		gFunc.EquipSet(sets.Idle);
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
	if (gcdisplay.GetToggle('Burst') == true) then gFunc.EquipSet(sets.Burst); 
	end
	end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;