--I've built this from scratch to use on HorizonXI. I am in no way an expert with
--this stuff but after reading about it and asking questions of my own, I have been
--able to create this which lets me play Bard the way I enjoy it. Hope it helps you
--in your journey and see you out there! --Heather
local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local sets = {
--This is your Default Idle set. You'll be in this when not doing anything.
--Type or macro "/lac fwd mp" to swap between the two idle sets.
	Idle_Default = {
        Main = 'Terra\'s Staff',
        Sub = '',
        Range = 'Traversiere +1',
        Head = 'Darksteel Cap +1',--'Empress Hairpin',
		Neck = 'Jeweled Collar', --'Spirit Torque',
        Ear1 = 'Melody Earring', --'Pigeon Earring', 
        Ear2 = 'Beastly Earring', --'Pigeon Earring', 
		Body = 'Sha\'ir Manteel', --CRow Jupon --
        Hands = 'Dst. Mittens +1',--'Battle Gloves',
        Ring1 = 'Allure Ring',
        Ring2 = 'Allure Ring',
        Back = 'Gigant Mantle', -- --'Jester\'s Cape +1'
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
		},
		
		
		
	Idle_DT = {
	
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
	
	Idle_MDT = {
		
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
	
	Idle_RefreshMDT = {
		
		Main = 'Terra\'s Staff',
		Head = 'Displace',
		Body = 'Vermillion Cloak',
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
	
	Powder = 
	{
		Feet = 'Powder Boots',
	},
       
--This is your second Idle Set. I use it for Refresh when /mage.
--This gear needs to be the same as the Idle Set above minus the Gaudy Harness
--in order for it to swap back properly after casting. Or any other Refresh gear
--that you might have instead of the harness.
	Idle_Refresh = {
         Main = 'Terra\'s Staff',
        Sub = '',
        Range = 'Traversiere +1',
        Head = '', --'Empress Hairpin',
		Neck = 'Jeweled Collar', --'Spirit Torque',
        Ear1 = 'Melody Earring',
        Ear2 = 'Beastly Earring',
		Body = 'Vermillion Cloak', --'Scorpion Harness', --CRow Jupon --
        Hands = 'Dst. Mittens +1',--'Battle Gloves',
        Ring1 = 'Ether Ring',
        Ring2 = 'Astral Ring',
        Back = 'Cheviot Cape', --'Traveler\'s Mantle', --'Jester\'s Cape +1'
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
	
	Harp = 
	{
		Range = 'Sorrowful Harp',
	},
	
	Field = {
         Main = 'Terra\'s Staff',
        Sub = '',
        Range = 'Traversiere +1',
        Head = '', --'Empress Hairpin',
		Neck = 'Jeweled Collar', --'Spirit Torque',
        Ear1 = 'Melody Earring',
        Ear2 = 'Beastly Earring',
		Body = 'Field Tunica', --'Scorpion Harness', --CRow Jupon --
        Hands = 'Worker Gloves',--'Battle Gloves',
        Ring1 = 'Allure Ring',
        Ring2 = 'Allure Ring',
        Back = 'Cheviot Cape', --'Traveler\'s Mantle', --'Jester\'s Cape +1'
        Waist = 'Corsette +1',
        Legs = 'Dst. Subligar +1',
        Feet = 'Worker Boots',
    },
	
--Stack Resting MP+ Gear here if you want.
	['Resting'] = {
        Main = 'Pluto\'s Staff', --rMP+10
        Body = 'Errant Hpl.', --rMP+5
    },
	
	['precast_hp_down'] = { --As HP merits come in, HP down will require more HP down. 2/8
		--Head = 'Empress Hairpin', -- -15
		Hands = 'Errant Cuffs', -- -25
		Back = 'Cheviot Cape',
		Feet = 'Errant Pigaches', -- -20
		Ring1 = 'Ether Ring',  -- -30
		
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
		
		
		
----------------------Melee Builds----------------------
--You need to disable main and sub if you don't want your TP to be reset when you
--cast, sing or put your weapons away. Type "/lac disable main" and "/lac disable sub"
--to prevent weapon swaps and then just type "/lac load" to get it to go back to swaping.
	['Daggers'] = {
		Main = 'Misericorde',
		Sub = 'Misericorde',
	
	},
	
	
	['TP'] = {
        --Main = 'Joyeuse',
		--Sub = 'Genbu\'s Shield',
        Range = 'Angel Lyre',
        Head = 'Empress Hairpin',--'Optical Hat',
        Neck = 'Spike Necklace', --'Peacock Amulet',
        Ear1 = 'Coral Earring', --'Brutal Earring',
        Ear2 = 'Coral Earring', --'Ethereal Earring',
        Body = 'Scorpion Harness',--'Bard\'s Jstcorps',
        Hands = 'Dusk Gloves',
        Ring1 = 'Woodsman Ring', --'Rajas Ring',
        Ring2 = 'Woodsman Ring',--'Toreador\'s Ring',
        Back = 'Amemet Mantle',
        Waist = 'Life Belt', --'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Sha\'ir Crackows', --'Dusk Ledelsens',
    },
	['DefaultWeaponskill'] = {
        Range = 'Frenzy Fife',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Life Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Hct. Leggings',
    },
	['Evisceration'] = {
        Range = 'Frenzy Fife',
        Head = 'Optical Hat',
        Neck = 'Light Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Bard\'s Jstcorps',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Life Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Hct. Leggings',
    },
----------------------Song Builds----------------------
--This is your Precast set that proc's your Minstrel's Ring.
--You want as much HP+ gear as you need to break that 75% on cast.
--The higher base HP you have the more HP+ gear you will need.
--You don't need all this gear either, just enough to get below that
--75% from what your HP is while in your idle set.
	['RingProc'] = { --Combo of FC and +HP. idleHP/.75 = required HP  == 1213 @910IDLE   275 HP+ reqd 
		Main = 'Legionnaire\'s Staff', -- +5
        Sub = '',
        Range = '',
        Head = 'Walkure Mask', --+15
        Neck = 'Shield Pendant', --+20
        Ear1 = 'Pigeon Earring', --+20
        Ear2 = 'Pigeon Earring', --+20
        Body = 'Sha\'ir Manteel', --'Wonder Kaftan', --+32
        Hands = 'Gigas Bracelets',-- +15 'Ogygos', --+20
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Bomb Ring', --+15
        Back = 'Gigant Mantle', --+7
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
        --Main = 'Tutelary', --HP+30
        --Range = 'Angel Lyre', --Need Shofar (HP+15)
        --Head = 'Genbu\'s Kabuto', --HP+50
        --Neck = 'Shield Pendant', --HP+20
        --Ear1 = 'Pigeon Earring', --HP+20 / Use Loquacious Earring if you can still hit the 75% on cast.
        --Ear2 = 'Pigeon Earring', --HP+20
        --Body = 'Magna Bodice', --HP+24 / Need Sha'ir Manteel (Cast Speed -12%)
        --Hands = 'Seiryu\'s Kote', --HP+50
        --Ring1 = 'Minstrel\'s Ring', --Cast Speed -25%
        --Ring2 = 'Bomb Queen Ring', --HP+75
        --Back = 'Gigant Mantle', --HP+80
        --Waist = 'Koenigs Belt', --HP+20 / Need Forest Sash (HP+30) (Elvaan Only)
        --Legs = 'Bard\'s Cannions', --HP+17 / Need Dusk Trousers (HP+35)
        --Feet = 'Root Sabots', --HP+35 / Use Rostrum Pumps if you can still hit the 75% on cast.
----------------------Party Buffs----------------------
--CHR does nothing for PT buff songs. Put only Skill+ in these sets.
    ['WindBuff'] = {
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
		Waist = 'Quick Belt',
        Legs = 'Dst. Subligar +1', --'Choral Cannions', -- +1 Wind+8
        Feet = 'Sha\'ir Crackows',
		
		
    },
    ['StringBuff'] = {
        Main = 'Chanter\'s Staff', --Singing+4,
        Head = 'Demon Helm', -- 'Bard\'s Roundlet', --Singing+5,
		Neck = 'String Torque', --String+7
        Ear1 = 'String Earring',--'Singing Earring', --Singing+3 (Place Holder)
        Ear2 = 'Beastly Earring',--'Musical Earring', --String+5, Wind+5
		Ring1 = 'Allure Ring',
		Ring2 = 'Allure Ring',
        Body = 'Choral Jstcorps', --String+3
		Hands = 'Choral Cuffs', --Singing+10,
        Back = 'Cheviot Cape', --'Astute Cape', --Singing+5 (Place Holder)
		Waist = 'Quick Belt',
        Legs = 'Dst. Subligar +1', --'Choral Cannions', -- +1 Wind+8
        Feet = 'Bard\'s Slippers', --String+3
    },
----------------------Mob Debuffs----------------------
--You want Skill+ then CHR+ in spots you can't put Skill+ gear in for the most part.
--I'm playing around with the Luftpause Mark so you can swap it with something else.
    ['WindDebuff'] = { --225 wind
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
    ['StringDebuff'] = { -- 238 string
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
----------------------Spells----------------------
--I use this for a few spells. It's not perfect but gives you an idea.
--The spells are listed in the Midcast section of this lua.
    ['MND'] = { --Base 64 @75 Current +49 goal +50 114total MND
	
        --Main = 'Water Staff', --MND+6
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
	
	['Cure'] = {
	
        Main = 'Apollo\'s Staff', --MND+5
		Head = 'Crow Beret',
        Body = 'Crow Jupon',--'Kirin\'s Osode', --MND+10
		Hands = 'Crow Bracers',
        Ring1 = 'Solace Ring', --MND+4
        Ring2 = 'Solace Ring', --MND+4
        Waist = 'Friar\'s Rope', --MND+1 / Need Penitent's Rope
        Legs = 'Crow Hose', --'Bard\'s Cannions', --MND+8
        Feet = 'Crow Gaiters', --'Suzaku\'s Sune-Ate', --MND+15
	
	},
	
	
	['WS'] = { 
        Range = '',
        Head = 'Optical Hat',
        Neck = 'Peacock Charm',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Toreador\'s Ring',
        Ring1 = 'Toreador\'s Ring',
        Back = 'Bard\'s Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Coral cannions',
        Feet = 'Choral Slippers',
},

	--['TP'] = {
		--Head = 'Optical Hat',
        --Neck = 'Peacock Charm',
        --Ear1 = 'Brutal Earring',
        --Ear2 = 'Stealth earring',
        --Body = 'Scp. Harness +1',
        --Hands = 'Tarasque Mitts',
        --Ring1 = 'Toreador\'s ring',
        --Ring2 = 'Toreador\'s ring',
        --Back = 'Bard\'s Cape',
        --Waist = 'Swift Belt',
        --Legs = 'Choral Cannions',
        --Feet = 'Dance Shoes', 
	--},
	
	Sneak = {
		Feet = 'Dream Boots +1',
	},
	Invisible = {
		Hands = 'Dream Mittens +1',},
    
};
profile.Sets = {
};   

profile.Packer = {
};


local Settings = {};
local useHarp = false
local useDagger = false
local useField = false
local usePowder = false
	--UseRefreshIdle = true,
	--UseMDTIdle = true,
	--UseHarp = true,


------------------------------------

local IdleModes = { "Default", "DT", "MDT", "Refresh", "RefreshMDT"}
local currentIdleIndex = 1  -- Start with the first mode

local function CycleIdleMode()
    currentIdleIndex = currentIdleIndex + 1
    if currentIdleIndex > #IdleModes then
        currentIdleIndex = 1
    end

    local mode = IdleModes[currentIdleIndex]
    gFunc.Message("Idle Mode: " .. mode)
end

local function EquipIdleMode()
    local mode = IdleModes[currentIdleIndex]
    local setName = "Idle_" .. mode
    gFunc.EquipSet(sets[setName])
end
--------------------------------------
--local usemp = false;

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
(function() AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 017'); end):once(3);
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 10');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind f12 /lac disable Main');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !f12 /lac enable Main');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind f11 /lac fwd idlerefresh');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^f11 /lac fwd idle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind f10 /lac fwd field');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind f9 /lac fwd Harp');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^f12  /lac equip Main "Misericorde"');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind @m /map');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !z /jump');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !DELETE /ma "Chocobo Mazurka" <me>');
end

profile.OnUnload = function()

end

profile.HandleCommand = function(args)
	
	if (args[1] == 'idlecycle') then
    CycleIdleMode()
	end
	
    --if (args[1] == 'idlerefresh') then
	--if (Settings.UseRefreshIdle == true) then
--		Settings.UseRefreshIdle =  false;
--	else	
--		Settings.UseRefreshIdle = true;
--end






--if (args[1] == 'idleMDT') then
--	if (Settings.UseMDTIdle == true) then
--		Settings.UseMDTIdle =  false;
--	else	
--		Settings.UseMDTIdle = true;
--end

	--if (args[1] == 'Harp') then	
	--		if (Settings.UseHarp == true) then
	--			Settings.UseHarp = false;
	--		else
	--			Settings.UseHarp = true;
	--		end
	--	end
		

	--if (args[1] == 'Harp') then
		--gFunc.Message('Harp');
        --usemp = (not useharp);
	--end
	
--	if (args[1] == 'field') then
--		gFunc.Message('HELM Set');
--		usefield = (not usefield)
--	end	
	
	if (args[1] == 'harp') then
    useHarp = not useHarp
    gFunc.Message('Harp Toggle: ' .. tostring(useHarp))
end

	if (args[1] == 'Powder') then
		usePowder = not usePowder
		gFunc.Message('Powder Boots: ' .. tostring(usePowder))
end		
	
	if (args[1] == 'dagger') then
    useDagger = not useDagger
    gFunc.Message('Dagger Toggle: ' .. tostring(useDagger))
end

if (args[1] == 'field') then
    useField = not useField
    gFunc.Message('Field Toggle: ' .. tostring(useField))
end
end




profile.HandleDefault = function()
	local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.TP);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
	
	--if (Settings.UseMDTIdle == true) then   REQUIRES TABLE
      --      gFunc.EquipSet(sets.Idle_MDT); REQUIRES TABLE
	--else
    if (Settings.UseRefreshIdle == true) then
            gFunc.EquipSet(sets.Idle_MP);
	else
		EquipIdleMode()		--	gFunc.EquipSet(sets.Idle_Default); --
	end
	
	if (useHarp == true) then
    gFunc.EquipSet(sets.Harp)
	end
	if (usePowder == true) then
	gFunc.EquipSet(sets.Powder)
	end
	
	if (useDagger == true) then
	gFunc.EquipSet(sets.Daggers)
	end
	
	if (useField == true) then
	gFunc.EquipSet(sets.Field)
	end
	--end
			--gFunc.Message('Refresh Idle')
   
		
	
	--else
		--	gFunc.EquipSet(sets.Idle_Default);
			--gFunc.Message('Default Idle')
	
	
	
	
	
	
	
	--if (Settings.UseHarp == true) then	
	--	gFunc.EquipSet(sets.Harp);
	--	else
	--	gFunc.Equipset(sets.Idle_Default);
--end
		--if (usefield) then
			--gFunc.EquipSet(sets.Idle_Field);
		--else
		--if (useharp) then
	--		gFunc.EquipSet(sets.Harp);
		---else
          --  gFunc.EquipSet(sets.Idle_Default);
        --end
    --end
end
if (useHarp == true) then
    gFunc.EquipSet(sets.Harp)
    return
end
end



profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    if (spell.Skill == 'Singing') then
            gFunc.ForceEquipSet(sets.precast_hp_down);
            gFunc.EquipSet(sets.RingProc);
        end
    end

--profile.HandlePrecast = function()
  --  gFunc.EquipSet(sets.RingProc);
--end

--Midcast is where I have all my Instruments and Staff's added to the
--gear sets that are listed above. I have all but a few that give the
--songs their +2 to song played. Seeing how you'll always want to use
--the +2 song Instruments they will most likely never change. Thus why
--I added them down here and only need to worry about 4 song sets up top.

profile.HandleMidcast = function()
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
    local action = gData.GetAction();
    local spell = gData.GetAction();
--WindBuff------------------------------------------------------------------
	 if (useHarp == true) then
        gFunc.EquipSet(sets.Harp)
        return -- Prevent further gear swapping
    end
	
	if (useDagger == true) then
        gFunc.EquipSet(sets.Daggers)
        return -- Prevent further gear swapping
    end
	if string.match(action.Name, 'Ballad') then
		gFunc.EquipSet(sets.WindBuff);
		gFunc.Equip('Main', 'Terra\'s Staff');
		gFunc.Equip('Range', 'Cornette +1'); --Place Holder/Need Ghorn
	elseif string.match(action.Name, 'Carol') then
		gFunc.EquipSet(sets.WindBuff);
		gFunc.Equip('Range', 'Crumhorn +1');
	elseif string.match(action.Name, 'Madrigal') then
		gFunc.EquipSet(sets.WindBuff);
		gFunc.Equip('Range', 'Traversiere +1');
	elseif string.match(action.Name, 'Mambo') then
		gFunc.EquipSet(sets.WindBuff);
		gFunc.Equip('Range', 'Gemshorn +1');
	elseif string.match(action.Name, 'March') then
		gFunc.EquipSet(sets.WindBuff);
		gFunc.Equip('Range', 'Faerie Piccolo');
	elseif string.match(action.Name, 'Mazurka') then
		gFunc.EquipSet(sets.WindBuff);
		gFunc.Equip('Range', 'Harlequin\'s Horn');
    elseif string.match(action.Name, 'Minuet') then
		gFunc.EquipSet(sets.WindBuff);
		gFunc.Equip('Range', 'Cornette +1');
	elseif string.match(action.Name, 'Prelude') then
		gFunc.EquipSet(sets.WindBuff);
		gFunc.Equip('Range', 'Angel\'s Flute +1'); --Place Holder/Who cares.
--StringBuff------------------------------------------------------------------
	elseif string.match(action.Name, 'Etude') then
		gFunc.EquipSet(sets.StringBuff);
		gFunc.Equip('Range', 'Rose Harp +1'); --Mythic Harp
	elseif string.match(action.Name, 'Hymnus') then
		gFunc.EquipSet(sets.StringBuff);
		gFunc.Equip('Range', 'Angel Lyre');
	elseif string.match(action.Name, 'Minne') then
		gFunc.EquipSet(sets.StringBuff);
		gFunc.Equip('Range', 'Harp +1');
	elseif string.match(action.Name, 'Paeon') then
		gFunc.EquipSet(sets.StringBuff);
		gFunc.Equip('Range', 'Ebony Harp +1');
--WindDebuff------------------------------------------------------------------
    elseif string.match(action.Name, 'Elegy') then
		gFunc.EquipSet(sets.WindDebuff);
		gFunc.Equip('Main', 'Terra\'s Staff');
		gFunc.Equip('Range', 'Horn +1');
	elseif string.match(action.Name, 'Finale') then
		gFunc.EquipSet(sets.WindDebuff);
		gFunc.Equip('Main', 'Apollo\'s Staff');
		gFunc.Equip('Range', 'Cornette +1'); --Place Holder/Need Military Harp
    elseif string.match(action.Name, 'Requiem') then
		gFunc.EquipSet(sets.WindDebuff);
		gFunc.Equip('Main', 'Apollo\'s Staff');
		gFunc.Equip('Range', 'Flute +1');
	elseif string.match(action.Name, 'Threnody') then
		gFunc.EquipSet(sets.StringDebuff);
		gFunc.Equip('main', ElementalStaffTable[action.Element]);
		gFunc.Equip('Range', 'Sorrowful Harp'); 		--);
--StringDebuff------------------------------------------------------------------
    elseif string.match(action.Name, 'Lullaby') then
		gFunc.EquipSet(sets.StringDebuff);
		gFunc.Equip('Main', 'Apollo\'s Staff');
		gFunc.Equip('Range', 'Rose Harp +1') --'Cyt. Anglica +1'); --Place Holder/Need Nursemaid Harp
	elseif string.match(action.Name, 'Virelai') then
		gFunc.EquipSet(sets.StringDebuff);
		gFunc.Equip('Main', 'Apollo\'s Staff');
		gFunc.Equip('Range', 'Cyt. Anglica'); --+1
--MND---------------------------------------------------------------------------
	elseif string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga') then
        gFunc.EquipSet(sets.Cure);
		gFunc.Equip('Main', 'Apollo\'s Staff');
	elseif string.match(action.Name, 'Invisible') then
        gFunc.EquipSet(sets.MND);
		gFunc.Equip('Hands', 'Dream Mittens +1');
		elseif string.match(action.Name, 'Tonko') then
        gFunc.EquipSet(sets.MND);
		gFunc.Equip('Hands', 'Dream Mittens +1');
	elseif string.match(action.Name, 'Silence') then
        gFunc.EquipSet(sets.MND);
		gFunc.Equip('Main', 'Wind Staff');
	elseif string.match(action.Name, 'Sneak') then
        gFunc.EquipSet(sets.MND);
		gFunc.Equip('Feet', 'Dream Boots +1');
	elseif string.match(action.Name, 'Stoneskin') then
        gFunc.EquipSet(sets.MND);
		gFunc.Equip('Main', 'Chanter\'s Staff');
	else
		gFunc.EquipSet(sets.Idle);
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
	local action = gData.GetAction();
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.Evisceration);
    else
        gFunc.EquipSet(sets.DefaultWeaponskill);
    end
end



return profile;