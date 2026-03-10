local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local towns = {
    T{'Port Bastok','Bastok Mines','Bastok Markets','Metalworks','Northern San d\'Oria','Southern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Heavens Tower','Windurst Walls','Windurst Woods','Windurst Waters','Port Jeuno','Lower Jeuno','Upper Jeuno','Ru\'Lude Gardens'};
};

local sets = {
    Idle_Priority = {
        Main = {'Terra\'s Staff','Rose Wand +1', 'Solid Wand',},
		Sub = {'Rose Wand +1', 'Solid Wand',},
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet',},                                                                               
        Head = { displaced, 'Seer\'s Crown +1',}, --'Demon Helm +1',
        Neck = {'Elemental Torque', 'Checkered Scarf', 'Black Neckerchief',},                                         
        Ear1 = {'Moldavite Earring'},
        Ear2 = {'Novio Earring', 'Morion Earring',},
        Body = {'Genie Weskit', 'Vermillion Cloak', 'Ryl.Sqr. Robe +2',},
        Hands = {'Zenith Mitts','Wizard\'s Gloves', 'Seer\'s Mitts +1',},                                                                          
        Ring1 = {'Genius Ring', 'Wisdom Ring',}, --                                                                                            
        Ring2 = {'Genius Ring', 'Wisdom Ring',}, --'Snow Ring', 'Genius Ring', 
        Back = {'Prism Cape', 'Black Cape +1',},                          
        Waist = {'Penitent\'s Rope', 'Mrc.Cpt. Belt',},          --'Penitent\'s Rope',                                                   
        Legs = { 'Druid\'s Slops', 'Wizard\'s Tonban', 'Seer\'s Slacks',},        --  'Mahatma Slops',
        Feet = {'Rostrum Pumps', 'Wizard\'s Sabots',  'Seer\'s Pumps',}, 
	},
	
	
	Resting_Priority = {
		Main = {'Dark Staff', 'Pilgrim\'s Wand',},
        --Ammo = 'Sweet Satchet',
        Head = 'Wizard\'s Petasos',
        Neck = 'Checkered Scarf',
        Body = {'Errant Hpl.', 'Seer\'s Tunic',},
        Hands = '',
        Ring1 = 'Astral Ring',
        Ring2 = 'Ether Ring',
		--Ear1 = 'Relaxing Earring',
        Back = '',
        Waist = {'Hierarch Belt','Reverend Sash'},
        Legs = 'Baron\'s Slops',
        Feet = '',
	},
	Refresh_Priority = {
		Body = {'Demon\'s Cloak', 'Vermillion Cloak',},
	},
    Elemental_Standard_Priority = {
		--Main = {'Rose Wand +1', 'Solid Wand',},
		Sub = {'Rose Wand +1', 'Solid Wand',},
        Ammo = {'Phtm. Tathlum', 'Sweet Sachet',},
        Head = {'Demon Helm +1', 'Wizard\'s Petasos', 'Seer\'s Crown +1', }, --Head = 'Sorc Hat',
        Neck = {'Elemental Torque', 'Checkered Scarf', 'Black Neckerchief',},
        Ear1 = {'Moldavite Earring'},
        Ear2 = {'Novio Earring', 'Morion Earring',},
        Body = {'Genie Weskit', 'Black Cotehardie', 'Ryl.Sqr. Robe +2',},
        Hands = {'Zenith Mitts', 'Wizard\'s Gloves','Seer\'s Mitts +1',},
        Ring1 = {'Genius Ring', 'Wisdom Ring',},
        Ring2 = {'Snow Ring', 'Genius Ring', 'Tamas Ring', 'Wisdom Ring',},
        Back = {'Prism Cape', 'Black Cape +1',},
        Waist = {'Penitent\'s Rope', 'Mrc.Cpt. Belt',},  --Waist = 'Sorcerer\'s Belt', 'Penitent\'s Rope',
        Legs = {'Mahatma Slops', 'Druid\'s Slops',  'Seer\'s Slacks', },
        Feet = {'Rostrum Pumps', 'Wizard\'s Sabots', 'Seer\'s Pumps',},
    },
    Elemental_Accuracy_Priority = {
	    Ammo = {},
        Head = {}, --Head = 'Nashira Turban',
        Neck = {'Elemental Torque'},
        Ear1 = {},
        Ear2 = {},
        Body = {'Genie Weskit'},
        Hands = {'Wizard\'s Gloves'}, --Hands = 'Wzd. Gloves +1',
        Ring1 = {},
        Ring2 = {},
        Back = {},
        Waist = {},  --Waist = 'Sorcerer\'s Belt',
        Legs = {},
        Feet = {},	
    },
    Dark_Priority = {
        Ammo = {'Phtm. Tathlum'},
        --Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        --Ear2 = 'Abyssal Earring',
        --Body = 'Nashira Manteel',
        --Hands = 'Sorcerer\'s Gloves',
        --Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        --Waist = 'Sorcerer\'s Belt',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Genie Huaraches',
    },
    Stun_Priority = {
        Ammo = {'Phtm. Tathlum'},
        --Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Dark Earring',
        --Ear2 = 'Abyssal Earring',
        --Body = 'Nashira Manteel',
        --Hands = 'Sorcerer\'s Gloves',
        --Ring1 = '',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Swift Belt',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Genie Huaraches',
    },
    Healing_Priority = {
        --Ammo = 'Hedgehog Bomb',
        --Head = 'Errant Hat',
        --Neck = 'Promise Badge',
        --Ear1 = 'Geist Earring',
        --Ear2 = 'Geist Earring',
        --Body = 'Nashira Manteel',
        --Hands = 'Devotee\'s Mitts',
        --Ring1 = 'Tamas Ring',
        --Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },
    Enhancing_Priority = {
        --Ammo = 'Hedgehog Bomb',
        --Head = 'Demon Helm',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        --Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        --Hands = 'Devotee\'s Mitts',
        --Ring1 = 'Tamas Ring',
        Ring2 = 'Ether Ring',
        Back = 'Prism Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },
    Stoneskin_Priority = {
        --Ammo = 'Hedgehog Bomb',
        --Head = 'Errant Hat',
        Neck = 'Enhancing Torque',
        --Ear1 = 'Geist Earring',
        --Ear2 = 'Geist Earring',
        Body = 'Errant Hpl.',
        --Hands = 'Devotee\'s Mitts',
        --Ring1 = 'Tamas Ring',
        --Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },
    Enfeeb_Mind_Priority = {
        --Ammo = 'Hedgehog Bomb',
        Head = 'Igqira Tiara',
        Neck = 'Enfeebling Torque',
        --Ear1 = 'Geist Earring',
        --Ear2 = 'Geist Earring',
        Body = {'Errant Hpl.',  'Wizard\'s Coat',},
        --Hands = 'Devotee\'s Mitts',
        --Ring1 = '',
        --Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Igqira Lappas',
        Feet = 'Mahatma Pigaches',
    },
    Enfeeb_INT_Priority = {
        Ammo = {'Phtm. Tathlum'},
        Head = {'Igqira Tiara', 'Wizard\'s Petasos'},
        Neck = 'Enfeebling Torque',
        Ear1 = 'Morion Earring +1',
        --Ear2 = 'Abyssal Earring',
        Body = {'Errant Hpl.', 'Wizard\'s Coat',},
        Hands = 'Errant Cuffs',
        --Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        --Waist = 'Sorcerer\'s Belt',
        Legs = 'Igqira Lappas',
        Feet = 'Rostrum Pumps',
    },
    MaxINT_Priority = {
        Ammo = {'Phtm. Tathlum'},
        --Head = 'Demon Helm',
        --Neck = 'Philomath Stole',
        Ear1 = 'Morion Earring +1',
        --Ear2 = 'Abyssal Earring',
        Body = 'Errant Hpl.',
        Hands = 'Errant Cuffs',
        --Ring1 = 'Tamas Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        --Waist = 'Sorcerer\'s Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Rostrum Pumps',
    },
    FastCast_Priority = {
		Ear1 = 'Loquac. Earring',
		Feet = 'Rostrum Pumps',
    },
    Haste_Priority = {
        Waist = 'Swift Belt',
		--Head = 'Nashira Turban',
		--Body = 'Nashira Manteel',
		--Legs = 'Nashira Seraweels',
		--Feet = 'Nashira Crackows',
    },
    MaxMP_Priority = {
	
    },
    TP_Priority = {
	
    },
	Sneak = {
		Feet = 'Dream Boots +1',
	},
	Invisible = {
		Hands = 'Dream Mittens +1',
	},
	DiabolosEarringL = {
		--Ear1 = 'Diabolos\'s Earring',
	},
	DiabolosEarringR = {
		--Ear2 = 'Diabolos\'s Earring',
	},
	DiabolosPole = {
		Main = 'Diabolos\'s Pole',
	},
	ShivaRing = {
		--Ring2 = 'Ice Ring',
	},
	DarkRing = {
		--Ring2 = 'Diabolos\'s Ring',
	},
	UggPendant = {
		Neck = 'Uggalepih Pendant',
	},
	FenrirTorque = {
		--Neck = 'Fenrir\'s Torque',
	},
	HPDown_Priority = {
		--Main = 'Ivory Sickle',
		--Sub = 'Astral Aspis', -- 25
		--Ammo = '-',-
		--Head = '-',-
		Neck = 'Star Necklace', -- Convert 15
		Body = 'Black Cotehardie', -- Convert 25
		Legs = 'Zenith Slacks', -- Convert 50
		--Feet = 'Rostrum Pumps',
		Ring1 = 'Serket Ring', -- Convert 50
		Ring2 = 'Ether Ring', -- Convert 30
		Ear1 = 'Astral Earring', -- Convert 25
		--Back = 'Blue Cape',
		--Hands = 'Zenith Mitts',
		--Waist = 'Penitent\'s Rope',
	},
	SorcRing = {
		Ring1 = 'Sorcerer\'s Ring',
	},
	SorcPants = {
		--Legs = 'Sorcerer\'s Tonban',
	},
	MABHead = {
		Head = 'Republic Circlet',
	},
	MagicBurst = {
		Head = 'Republic Circlet',
		Body = 'Ryl.Sqr. Robe +2',
		
		
		--Hands = 'Sorcerer\'s Gloves',
	}
};

local ElementalStaff = {
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Terra\'s Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Jupiter\'s Staff',
    ['Light'] = 'Apollo\'s Staff',
    ['Dark'] = 'Pluto\'s Staff'
};

local ElementalObi = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light'] = 'Korin Obi',
    ['Dark'] = 'Anrin Obi'
};

local Elemental = {
	[1] = 'Standard',
	[2] = 'Accuracy',
}

local SorcRing = {
	[1] = 'False',
	[2] = 'True',
}

local MagicBurst = {
	[1] = 'False',
	[2] = 'True',
}

local Settings = {
	Idle = 1,
	Elemental = 1,
	Mode = 1,
	OutsideNation = 1,
	InsideNation = 1,
	SorcRing = 1,
	MagicBurst = 1,
	CurrentLevel = 0,
	MPP = 95,
};


local MndDebuffs = T{ 'Slow', 'Paralyze', 'Silence' };
local IntDebuffs = T{ 'Blind','Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Bind', 'Gravity', 'Dispel', 'Poison', 'Poison II' };
local ElementalDebuffs = T{ 'Burn', 'Choke', 'Shock', 'Rasp', 'Drown', 'Frost' };

local DayElementTable = {
    ['Firesday'] = 'Fire',
    ['Earthsday'] = 'Earth',
    ['Watersday'] = 'Water',
    ['Windsday'] = 'Wind',
    ['Iceday'] = 'Ice',
    ['Lightningday'] = 'Thunder',
    ['Lightsday'] = 'Light',
    ['Darksday'] = 'Dark'
};

function ObiCheck(spell)
    local element = spell.Element;
    local zone = gData.GetEnvironment();
    
    local badEle = {
        ['Fire'] = 'Water',
        ['Earth'] = 'Wind',
        ['Water'] = 'Thunder',
        ['Wind'] = 'Ice',
        ['Ice'] = 'Fire',
        ['Thunder'] = 'Earth',
        ['Light'] = 'Dark',
        ['Dark'] = 'Light'
    };
    
    local weight = 0;
    
    --Day Comparison
    if (DayElementTable[zone.Day] == element) then
        weight = weight + 1;
    elseif (DayElementTable[zone.Day] == badEle[element]) then
        weight = weight - 1;
    end
    
    --Weather Comparison
    if string.find(zone.Weather, element) then
        if string.find(zone.Weather, 'x2') then
            weight = weight + 2;
        else
            weight = weight + 1;
        end
    elseif string.find(zone.Weather, badEle[element]) then
        if string.find(zone.Weather, 'x2') then
            weight = weight - 2;
        else
            weight = weight - 1;
        end
    end    
    
    return weight;
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
	(function() AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 5'); end):once(3);
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /nukes /lac fwd nukes');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mp /lac fwd mp');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sorc /lac fwd sorc');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mb /lac fwd mb');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias /st /ma Stone <t>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !` /mb');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^` /nukes');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind +` /sorc');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !END /item "Wizard Cookie" <me>');
	
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /nukes');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mp');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sorc');
	AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mb');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !END');
end

profile.HandleCommand = function(args)
	
	if (args[1] == 'nukes') then
		if (Settings.Elemental == 1) then
			Settings.Elemental = 2;
			gFunc.Message('Elemental Magic Set: Accuracy');
		else
			Settings.Elemental = 1;
			gFunc.Message('Elemental Magic Set: Standard');
		end
	end	

	if (args[1] == 'sorc') then
		if (Settings.SorcRing == 1) then
			Settings.SorcRing = 2;
			gFunc.Message('Sorcerer\'s Ring: Enabled');
		else
			Settings.SorcRing = 1;
			gFunc.Message('Sorcerer\'s Ring: Disabled');
		end
	end	

	if (args[1] == 'mb') then
		if (Settings.MagicBurst == 1) then
			Settings.MagicBurst = 2;
			gFunc.Message('Magic Burst Set To: True');
		else
			Settings.MagicBurst = 1;
			gFunc.Message('Magic Burst Set To: False');
		end
	end	
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
	local environ= gData.GetEnvironment();
	local myLevel = player.MainJobSync;
	local env = gData.GetEnvironment();
	
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end
	
	if (player.Status == 'Engaged') then
		gFunc.EquipSet(sets.TP);
	elseif (player.Status =='Resting') then
			gFunc.EquipSet(sets.Resting);
	elseif (player.IsMoving == true) then
        if (env.Area == 'Port Bastok' or env.Area == 'Bastok Markets' or env.Area == 'Metalworks' or env.Area == 'Bastok Mines') then  
            gFunc.Equip('body', 'Republic Aketon');

        elseif (env.Area == 'Port San d\'Oria' or env.Area == 'Chateau d\'Oraguille' or env.Area == 'Northern San d\'Oria' or env.Area == 'Southern San d\'Oria') then
            gFunc.Equip('body', 'Kingdom Aketon');

        elseif (env.Area == 'Port Windurst' or env.Area == 'Windurst Waters' or env.Area == 'Windurst Woods'or env.Area == 'Windurst Walls'or env.Area == 'Heaven\'s Tower') then
            gFunc.Equip('body', 'Federation Aketon');
        end
	else
		gFunc.EquipSet(sets.Idle);
		if (environ.Time < 18.00 and environ.Time > 6.00) then
			gFunc.EquipSet(sets.FenrirTorque);
		end
		if (player.MPP <= Settings.MPP) then
			gFunc.EquipSet(sets.Refresh);
		end
	end
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
	local action = gData.GetAction();
	
	
	gFunc.EquipSet(sets.FastCast);
	if (action.Skill == 'Elemental Magic') then
		if (ElementalDebuffs:contains(action.Name)) then
			gFunc.EquipSet(sets.FastCast);		
		elseif (Settings.SorcRing == 2) then
		gFunc.EquipSet(sets.HPDown);
		end
	end
end

profile.HandleMidcast = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();
	local environ= gData.GetEnvironment();
	
	if (action.Skill == 'Enfeebling Magic') then
        if	(MndDebuffs:contains(action.Name)) then
			gFunc.EquipSet(sets.Enfeeb_Mind);
			gFunc.Equip('main', ElementalStaff[action.Element]);
			if (environ.WeatherElement == 'Dark' or environ.WeatherElement == 'Darkx2') then
				gFunc.EquipSet(sets.DiabolosEarringL);
			end
        end

        if	(IntDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Enfeeb_INT);
            gFunc.Equip('main', ElementalStaff[action.Element]);
			if (environ.WeatherElement == 'Dark' or environ.WeatherElement == 'Darkx2') then
				gFunc.EquipSet(sets.DiabolosEarringL);
			end
        end
		
		if ObiCheck(action) >= 1 then
			gFunc.Equip('waist', ElementalObi[action.Element]);
		end
	
	elseif (action.Skill == 'Elemental Magic') then
		if (ElementalDebuffs:contains(action.Name)) then	
			gFunc.EquipSet(sets.MaxINT);
			gFunc.Equip('main', ElementalStaff[action.Element]);
		else
			gFunc.EquipSet('Elemental_' .. Elemental[Settings.Elemental]);
			gFunc.Equip('main', ElementalStaff[action.Element]);
			if (Settings.Elemental == 3) then
				if (environ.WeatherElement == 'Dark' or environ.WeatherElement == 'Darkx2') then
					gFunc.EquipSet(sets.DiabolosEarringL);
				end
				if (environ.DayElement == 'Ice' and gData.GetAction().MppAftercast <= 84) then
					gFunc.EquipSet(sets.ShivaRing);
				end
			end
			if (Settings.Elemental == 1 or Settings.Elemental == 2) then
				if (gData.GetAction().MppAftercast <= 50) then
					gFunc.EquipSet(sets.UggPendant);
				end
				if (environ.DayElement == action.Element) then
					gFunc.EquipSet(sets.SorcPants);
				end
				if (Settings.SorcRing == 2) then
					gFunc.EquipSet(sets.SorcRing);
				end
				if (Settings.MagicBurst == 2) then
					gFunc.EquipSet(sets.MagicBurst);
				end
			end
		end
		if ObiCheck(action) >= 1 then
			gFunc.Equip('waist', ElementalObi[action.Element]);
		end
	elseif (action.Skill == 'Dark Magic') then
		if (action.Name == 'Stun') then
			gFunc.EquipSet(sets.Stun);
		else
			gFunc.EquipSet(sets.Dark);
		end
        gFunc.Equip('main', ElementalStaff[action.Element]);			
		if (environ.WeatherElement == 'Dark' or environ.WeatherElement == 'Darkx2') then
			if (action.Name == 'Drain' or action.Name == 'Aspir') then
				gFunc.EquipSet(sets.DiabolosPole);
			end
		end
		if (environ.DayElement == 'Dark' and gData.GetAction().MppAftercast <= 84) then
			gFunc.EquipSet(sets.DarkRing);
		end
		if ObiCheck(action) >= 1 then
			gFunc.Equip('waist', ElementalObi[action.Element]);
		end
	
	elseif string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga') then
		gFunc.EquipSet(sets.Healing);
			if ObiCheck(action) >= 1 then
				gFunc.Equip('waist', ElementalObi[action.Element]);
			end
		if (environ.Time < 18.00 and environ.Time > 6.00) then
			gFunc.EquipSet(sets.FenrirTorque);
		end
		
	elseif (action.Skill == 'Enhancing Magic') then
		if (action.Name == 'Stoneskin') then
			gFunc.EquipSet(sets.Stoneskin);
		elseif (action.Name == 'Sneak') then
			gFunc.EquipSet(sets.Sneak);
		elseif (action.Name == 'Invisible') then
			gFunc.EquipSet(sets.Invisible);
		elseif (action.Name == 'Phalanx') or string.match(action.Name, 'Bar') then
			gFunc.EquipSet(sets.Enhancing);
		else
			gFunc.EquipSet(sets.Haste);
		end
	end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
end


profile.Sets = sets;
return profile;