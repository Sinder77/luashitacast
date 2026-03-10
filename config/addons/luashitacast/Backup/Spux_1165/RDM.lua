local profile = {};

gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
	CurrentLevel = 0,
}

local sets = {
    Resting = {
        Main = 'Pilgrim\'s wand', --'Yew Wand +1',
        Sub = '','Yew Wand +1',
		Head = '',
		Body = '',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Hands = 'Baron\'s Cuffs',
         Ring1 = 'Astral Ring',
        Ring2 = 'Bomb Ring',
        Back = 'Black Cape +1', --'Cotton Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops',
        Feet = '',
    },
	
    Nuke = {
        Main = 'Solid Wand',-- 'Yew Wand +1',
		Sub = 'Solid Wand',--'Yew Wand +1',
        Neck = 'Black Neckerchief',
        Ear1 = 'Morion Earring',
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
	
	Idle = { --Standard Nuke/Int set
		Main = 'Solid Wand', --'Yew Wand +1',
		Sub = 'Tropical Shield',
		Ammo = 'Morion Tathlum', --'Fortune Egg',--'Sweet Sachet',
        Neck = 'Black Neckerchief',
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
		Head = 'Silver hairpin', --'Seer\'s Crown +1',
        Body = 'Beetle Harness +1',--'Seer\'s Tunic',--'Ryl.Ftm. Tunic',
        Hands = 'Devotee\'s Mitts',
		Ring1 = 'Astral Ring',
        Ring2 = 'Bomb Ring',
        Back = 'Black Cape +1', --'Cotton Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Windurstian Slops',--'Seer\'s Slacks',
        Feet = 'Light Soleas',
},

	Cure = {--I cap is 50, II cap is 30
        Main = '',--I 30
        Sub = '',
		Head = 'Pumpkin Head',
        Ammo = '',
        Neck = 'Justice Badge',--I 5
        Ear1 = '',--I 5
        Ear2 = '',--II 2
        Hands = '',--'Seer\'s Mitts',--I 9
        Ring1 = 'Saintly Ring',--'Solace Ring',
        Ring2 = 'Saintly Ring',--'Solace Ring',
        Back = '',
        Waist = 'Quick Belt',
        Legs = '', --'Wonder Braccae',
        Feet = '',
	},
	
	INT_Enfeebling ={
	Main = 'Solid Wand',
	Sub = '',
	Head = '',
	Ammo = '',
	Neck = 'Black Neckerchief',
	Ear1 = '',
	Ear2 = '',
	Head = '', 
	Body = '',
	Hands = '',
	Ring1 = 'Eremite\'s Ring',
	Ring2 = 'Eremite\'s Ring',
	Back = 'Black Cape +1',
	Waist = '',
	Legs = '',
	Feet = '',
	},
	
	MND_Enfeebling = {
	Main = 'Solid Wand',
	Sub = '',
	Head = 'Traveler\'s Hat',
	Ammo = '',
	Neck = 'Justice Badge',
	Ear1 = '',
	Ear2 = '',
	Head = '', 
	Body = '',
	Hands = 'Devotee\'s mitts',
	Ring1 = 'Saintly Ring',
	Ring2 = 'Saintly Ring',
	Back = 'White Cape',
	Waist = '',
	Legs = '',
	Feet = '',

	},
	
	Town = {},
	Idle_Refresh = {},
	Dt = { --Utilize as MP+ for main healing
		Main ='Yew Wand +1',
		Sub = 'Tropical Shield',
		Ammo = '', --'Sweet Sachet', 
        Neck = 'Black Neckerchief',
        Ear1 = 'Onyx Earring',--'Morion Earring',
        Ear2 = 'Onyx Earring',--'Morion Earring',
		Head = 'Silver Hairpin',
        Body = 'Beetle Harness +1',--'Seer\'s Tunic',--'Ryl.Ftm. Tunic',
        Hands = 'Baron\'s Cuffs',--'Seer\'s Mitts +1',
        Ring1 = 'Astral Ring',
        Ring2 = 'Bomb Ring',
        Back = 'Traveler\'s Mantle',
        Waist = 'Friar\'s Rope',
        Legs = 'Windurstian Slops',--'Seer\'s Slacks',
        Feet = 'Seer\'s Pumps',--'Holly Clogs',
	
	
	
	
	},
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
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad7 /burst');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !` /dt');
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 13');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
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
	end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Enhancing);
        end

        if string.match(spell.Name, 'Phalanx') then
            gFunc.EquipSet(sets.Phalanx);
        elseif string.match(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, 'Regen') then
            gFunc.EquipSet(sets.Regen);
        elseif string.contains(spell.Name, 'Refresh') then
            gFunc.EquipSet(sets.Refresh);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Refresh);
            end
        end
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Cure);
        end
        if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
        end
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);

        if (gcdisplay.GetCycle('NukeSet') == 'Macc') then
            gFunc.EquipSet(sets.NukeACC);
        end
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip('Waist', 'Hachirin-no-Obi');
        end
    elseif (string.contains(spell.Name, 'Paralyze') or string.contains(spell.Name, 'Slow') or string.contains(spell.Name, 'Dia') or string.contains(spell.Name, 'Silence')) then
        gFunc.EquipSet(sets.MND_Enfeebling);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Enfeebling); -- mostly macc anyways
        if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
            gFunc.EquipSet(sets.Drain);
        end
    end
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end

return profile;