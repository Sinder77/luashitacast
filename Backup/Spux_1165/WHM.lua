local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
	CurrentLevel = 0,
}

local useRing = false
local sets = {
    Idle_Priority = {
		Main = {'Terra\'s Staff', 'Blessed Hammer',},
		Sub ='',  --{'Remove', 'Apollo\'s Buckler',},
        Ammo = {'Fortune Egg',},
        Head = {'Vermillion Cloak', 'Blue Ribbon', 'Electrum Hairpin', 'Silver Hairpin',} ,
		Neck = {'Spirit Torque',},
		Ear1 = {'Pigeon Earring',},
		Ear2 = {'Pigeon Earring',},
        Body = { 'Vermillion Cloak', 'Holy Breastplate', },
        Hands = {'Healer\'s Mitts', 'Devotee\'s mitts', 'Baron\'s Cuffs',},
        Ring1 = {'Astral Ring',},
        Ring2 = {'Ether Ring',},
        Waist = {'Friar\'s Rope',},
        Legs = {'Healer\'s Pantaln.', 'Seer\'s Slacks', 'Windurstian Slops',},
        Feet = {'Cure Clogs', 'Healer\'s Duckbills', 'Seer\'s Pumps', 'Apollo\'s Soleas',},
		Back = {'Red Cape', 'White Cape', },
    },
    Resting_Priority = {
		Main = {'Pluto\'s Staff', 'Blessed Hammer', 'Pilgrim\'s Wand',},--{ 'Pluto\'s Staff', 'Kukulcan\'s Staff' },
		Head = { },
        Neck = { 'Checkered Scarf' },
        Ear1 = { },
        Ear2 = { 'Boroka Earring' },
        Body = { 'Vermillion Cloak', 'Seer\'s Tunic' },
        Hands = { },
        Ring1 = { },
        Ring2 = { },
        Back = {'Wizard\'s Mantle', },
        Waist = { 'Reverend Sash' },
        Legs = { 'Baron\'s Slops' },
		Feet = { },
		},
		
    Idle_Regen = {},
    Idle_Refresh = {},
    Town = {},

    Dt = {
		Main = 'Terra\'s Staff',},

    Tp_Default = {
        Main = '', --'Blessed Hammer',--'Kaja Rod',
        Sub = 'Light Buckler',
        Ammo = '',
        Head = 'Empress Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = '',
        Hands = 'Battle Gloves',
        Ring1 = 'Woodsman Ring',
        Ring2 = 'Woodsman Ring',
        Waist = 'Life Belt',
        Legs = 'Cmb.Cst. Slacks',
        Feet = 'Wonder Clomps',
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
        Ear1 = 'Digni. Earring',
        Ring1 = 'Cacoethic Ring +1',
        Ring2 = 'Chirich Ring +1',
    },


    Precast = {
	Body = 'Crow Jupon',
    },
    Cure_Precast = {
        Feet = 'Cure Clogs',
    },
    Enhancing_Precast = {
        Waist = 'Siegel Sash',
    },
    Stoneskin_Precast = {
        Head = 'Umuthi Hat',
        Hands = 'Carapacho Cuffs',
        Waist = 'Siegel Sash',
    },


    Cure = {--I cap is 50, II cap is 30
        Main = 'Apollo\'s Staff',--I 30
        Sub = '',
		Head = 'Healer\'s Cap',
        Ammo = '',
        Neck = 'Justice Badge',--I 5
		Body = 'Crow Jupon',
        Ear1 = '',--I 5
        Ear2 = '',--II 2
        Hands = 'Healer\'s Mitts', --'Crow Bracers', --'Seer\'s Mitts',--I 9
        Ring1 = '', --'Solace Ring',
        Ring2 = '',--'Solace Ring',
        Back = '',
        Waist = 'Quick Belt',
        Legs = 'Crow Hose', --'Wonder Braccae',
        Feet = 'Healer\'s Duckbills', --'Crow Gaiters',
    },
    Self_Cure = {--cap 30
        Waist = 'Gishdubar Sash',
    },
    Regen = {
        Main = 'Bolelabunga',
        Sub = 'Ammurapi Shield',
        Body = 'Telchine Chas.',
        Waist = 'Embla Sash',
        Legs = 'Telchine Braconi',
        Feet = 'Healer\'s Duckbills', --'Telchine Pigaches',
    },
    Cursna = {
        Ring1 = 'Purity Ring',
		Waist = 'Gishdubar Sash',
        Feet = 'Healer\'s Duckbills', --'Vanya Clogs',
    },

    Enhancing = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Head = 'Befouled Crown',
        Neck = 'Incanter\'s Torque',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Andoaa Earring',
        Ring1 = 'Stikini Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Back = 'Solemnity Cape',
        Waist = 'Quick Belt',
        Legs = 'Telchine Braconi',
        Feet = 'Healer\'s Duckbills', --'Telchine Pigaches',
    },
    Self_Enhancing = {},
    Skill_Enhancing = {},
    Stoneskin = {
        Neck = 'Nodens Gorget',
        Waist = 'Siegel Sash',
    },
    Phalanx = {},
    Refresh = {
		Waist = 'Gishdubar Sash',
    },
    Self_Refresh = {},

    Enfeebling = {
        --Main = 'Solid Wand',
        --Sub = 'Ammurapi Shield',
       -- Ammo = 'Pemphredo Tathlum',
        Head = 'Healer\'s Cap',
        Neck = 'Ajari Necklace',
        --Ear1 = 'Regal Earring',
        --Ear2 = 'Malignance Earring',
        Ring1 = 'Solace Ring',
        Ring2 = 'Solace Ring', 
		Legs = 'Wonder Braccae',
		Feet = 'Healer\'s Duckbills',
        Back = 'Red Cape',
        Waist = 'Penitent\'s Rope',
    },
	
	
	
	Devo = {
		Ammo = 'Happy Egg',
        Head = 'Traveler\'s Hat',--'Walkure Mask', --'Drn. Armet +1',
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
Fishing = {
	
	Range = 'Halcyon Rod', --'Hume Fishing Rod', -- 'Halcyon Rod',
	Ammo = 'Insect Ball', --'Little Worm', --OTHER BAIT SWAP 'Insect Ball',
	Body = 'Angler\'s Tunica',
	Hands = 'Angler\'s Gloves',
	Legs = 'Fisherman\'s Hose',
	Feet = 'Angler\'s Boots',
	
	},


    Drain = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Neck = 'Erra Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Malignance Earring',
        Ring1 = 'Kishar Ring',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Fucho-no-Obi',
    },

    Nuke = {
        Main = 'Bunzi\'s Rod',
        Sub = 'Ammurapi Shield',
        Ammo = 'Pemphredo Tathlum',
        Neck = 'Baetyl Pendant',
        Ear1 = 'Regal Earring',
        Ear2 = 'Malignance Earring',
        Ring1 = 'Shiva Ring +1',
        Ring2 = { Name = 'Metamor. Ring +1', AugPath='A' },
        Waist = 'Eschan Stone',
        Feet = 'Healer\'s Duckbills', --'Volte Gaiters',
    },
    NukeACC = {
        Waist = { Name = 'Acuity Belt +1', AugPath='A' },
    },

    Preshot = {
    },
    Midshot = {
        Ear1 = 'Telos Earring',
        Ear2 = 'Crep. Earring',
    },

    Ws_Default = {
        Ammo = 'Voluspa Tathlum',
        Head = 'Nyame Helm',
        Neck = 'Fotia Gorget',
        Ear1 = 'Telos Earring',
        Ear2 = 'Digni. Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Cacoethic Ring +1',
        Ring2 = 'Karieyh Ring +1',
        Back = 'Solemnity Cape',
        Waist = 'Fotia Belt',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Cataclysm_Default = {
        Ammo = 'Pemphredo Tathlum',
        Head = 'Pixie Hairpin +1',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Malignance Earring',
        Ear2 = 'Crematio Earring',
        Body = 'Nyame Mail',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Shiva Ring +1',
        Ring2 = 'Karieyh Ring +1',
        Back = 'Lugh\'s Cape',
        Waist = 'Eschan Stone',
        Legs = 'Nyame Flanchard',
        Feet = 'Nyame Sollerets',
    },
    Cataclysm_Hybrid = {
    },
    Cataclysm_Acc = {
    },

    TH = {
        Ammo = 'Per. Lucky Egg',
		Waist = 'Chaac Belt',
	},
    Movement = {
        Feet = 'Herald\'s Gaiters',
	},
    ['Divine_MAB'] = {
        Main = 'Apollo\'s Staff',
        Sub = '',
        Ammo = 'Fortune Egg',
        Head = 'Bastokan Circlet',
        Neck = 'Justice Badge',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Ryl.Sqr. Robe +2',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Solace Ring',
        Ring2 = 'Solace Ring',
        Back = 'Red Cape',
        Waist = 'Twinthread Obi', --'Friar\'s Rope',
        Legs = 'Wonder Braccae',
        Feet = 'Seer\'s Pumps',
    },


	['precast_hp_down'] = {
		
		Head = 'Empress Hairpin',
		Ear1 = 'Night Earring',
		Ear2 = 'Night Earring',
		
		
},
		
		
		 --  Main = '',
        --Sub = '',
        --Range = '',
        --Head = 'Empress Hairpin', -- -15
		--Neck = 'Checkered Scarf', -- -12
        --Ear1 = '',
        --Ear2 = '',
		--Body = '',
        --Hands = 'Errant Cuffs',--'Battle Gloves', -25
        --Ring1 = 'Ether Ring',  -- -30
        --Ring2 = 'Astral Ring', --'Allure Ring', -- -25
        --Back = 'Cheviot Cape', --'Jester\'s Cape +1'
        --Waist = 'Quick Belt', -- -15
        --Legs = '', 
        --Feet = 'Errant Pigaches', -- -20
		--total 97 +20 +20 w Errant
		
		
	['RingProc'] = { --Combo of FC and +HP. idleHP/.75 = required HP  == 1146   275 HP+ reqd
		Main = 'Apollo\'s Staff', -- +5
        Sub = '',
        Range = '',
        Head = '',
        Neck = 'Shield Pendant', --+20
        Ear1 = 'Pigeon Earring', --+20
        Ear2 = 'Pigeon Earring', --+20
        Body = 'Wonder Kaftan', --+32
        Hands = 'Gigas Bracelets',-- +15 'Ogygos', --+20
        Ring1 = 'Medicine Ring',
        Ring2 = 'Bomb Ring', --+15
        Back = 'Lucent Cape', --+7
        Waist = 'Powerful Rope', --+20
        Legs = 'Wonder Braccae', --+21
        Feet = 'Wonder Clomps',--'Root Sabots', --+35
		--Total 195
		
		--    Precast_Songs = {
        --Main = 'Tutelary’, -- 30
        --Head = 'Genbu\'s Kabuto', -- 50
        --Ear1 = 'Pigeon Earring', -- 20
        --Ear2 = 'Loquac. Earring',
        --Body = 'Sha\'ir Manteel',
        --Hands = 'Seiryu\'s Kote', -- 50
        --Ring1 = 'Minstrel\'s Ring',
        --Ring2 = 'Bomb Queen Ring', -- 75
        --Back = 'Gigant Mantle', -- 80
        --Waist = 'Powerful Rope', -- 20
        --Legs = 'Bard\'s Cannions', -- 17
        --Feet = 'Rostrum Pumps', -- -30
	},
	Sneak = {
		Feet = 'Dream Boots +1',
	},
	Invisible = {
		Hands = 'Dream Mittens +1',
		},
	
};
		
profile.Sets = sets;

profile.Packer = {
    
};



profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcdisplay.Initialize();
	gcdisplay.CreateToggle( 'Devo' , false);
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
	
	--DELETE HERE
	--AshitaCore:GetChatManager():QueueCommand(-1, '/bind !` /lac fwd devoset');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^` /ja Devotion <stpc>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !` /ja Devotion <stpc>');
  
  --END DELETE
end
profile.OnUnload = function() 
--DELETE HERE
-- this section is to clean up all the toggles when swapping to another jobs
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !`');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^` ');
--varhelper.Destroy();
	--END DELETE
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
	
	if (args[1] == 'RingProc') then
    useRing = not useRing
    gFunc.Message('RingProc Toggle: ' .. tostring(useRing))
end
	--DELETE HERE
	if (args[1] == 'devoset') then -- devoset was the name of the toggle from the onload section and for me is bound to ctrl+alt+F4
        gcdisplay.AdvanceToggle('Devo');
   end
   
   if (args[1] == 'idleFishing') then
	if (Settings.UseFishingIdle == true) then
		Settings.UseFishingIdle =  false;
	else	
		Settings.UseFishingIdle = true;
		end
	end
   --END DELETE
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
	local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
	end
    --print("Player Status: " .. tostring(player.Status))

	
	
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default);
		
    --if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
		--gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) 
		--end
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH)
		end
	
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
				
	else 
		gFunc.EquipSet(sets.Idle);
    end
	
	if (Settings.UseFishingIdle == true) then
           gFunc.EquipSet(sets.Fishing);
			--gFunc.Message('Refresh Idle')
   -- else
--		gFunc.EquipSet(sets.Idle);
	end
	
	 if (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
		end
		
	if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) 
	end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) 
	end;
	
	--gFunc.EquipSet('Idle_Default');
	--DELETE HERE
    -- engage logic resting logic  etc etc
	
   if (gcdisplay.GetToggle('Devo') == true) then
       gFunc.EquipSet('Devo');
   end
   --END DEKLETE	
		
    gcinclude.CheckDefault ();
	
    
end

profile.HandleAbility = function()
    local action = gData.GetAction();
	
    if (action.Name == 'Devotion') then
        if (gcdisplay.GetToggle('Devo') == true) then
            (function() AshitaCore:GetChatManager():QueueCommand(1, '/lac fwd devoset'); end):once(3); -- this puts a 3 second delay from after the ability is used before it sets the toggle flag to false 
            gFunc.Message('Devotion set off');
        end
    end
	gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
	gFunc.EquipSet(sets.Precast);

    if (spell.Skill == 'Healing Magic') then
        
	if (useRing == true) then
		gFunc.ForceEquipSet(sets.precast_hp_down)
	else		
		gFunc.EquipSet(sets.Cure_Precast);
    end
   
    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);

    if string.contains(spell.Name, 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin_Precast);
	end
			
	if string.contains (spell.Name, 'Raise') then
				gFunc.EquipSet(sets.Enhancing_Precast);
    end
	
	if string.contains (spell.Name, 'Cur') then
		gFunc.EquipSet(sets.FC_Cure);
	end
	

end
	
	
	--DELETE
	if (gcdisplay.GetToggle('Devo') == true)then
        gFunc.EquipSet('Devo');
    end
	--END DELETE
    gcinclude.CheckCancels();
end
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
	end
        
    if string.match(spell.Name, 'Invisible') then
			gFunc.EquipSet(sets.Invisible);
	end
		
	if string.match(spell.Name, 'Sneak') then
		gFunc.EquipSet(sets.Sneak);
	end
	
		if (spell.Skill == 'Healing Magic') then
           if (useRing == true) then
            gFunc.EquipSet(sets.RingProc);
			else
			gFunc.EquipSet(sets.Cure);
        end
	
	
		
    
	
	--elseif (spell.Skill == 'Healing Magic') then
      --  gFunc.EquipSet(sets.Cure);
       -- if (target.Name == me) then
      --      gFunc.EquipSet(sets.Self_Cure);
      --  end
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
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Enfeebling); -- mostly macc anyways
        if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
            gFunc.EquipSet(sets.Drain);
        end
    end
	if (spell.Skill == 'Divine Magic') then	
		gFunc.EquipSet(sets.Divine_MAB);
	end
	if (gcdisplay.GetToggle('TH') == true) then 
		gFunc.EquipSet(sets.TH) 
	end
	--DELETE
	if (gcdisplay.GetToggle('Devo') == true)then
        gFunc.EquipSet('Devo');
    end
	--END DELETE
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

        if string.match(ws.Name, 'Cataclysm') then
            gFunc.EquipSet(sets.Cataclysm_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Cataclysm_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;
