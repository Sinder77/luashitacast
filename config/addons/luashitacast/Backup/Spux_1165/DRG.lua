local profile = {};
local sets = {
    ['Idle'] = {
		Ammo = 'Happy Egg',
        Head = 'Empress Hairpin', --'Homam zucchetto',
        Neck = 'Spike Necklace', --'Love Torque',
        Ear1 = 'Tor. Earring +1', --'Brutal Earring',
        Ear2 = 'Tor. Earring +1', --'Ethereal Earring',
        Body = 'Brigandine',--'Mrc.Cpt. Doublet', --'Barone Corazza', 
        Hands = 'Battle Gloves', --'Homam Manopolas',
        Ring1 = 'Woodsman Ring', --'Venerer Ring', --'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring', --'Puissance Ring', --'Woodsman Ring', --'Rajas Ring',
        Back = 'Traveler\'s Mantle', --'Boxer\'s Mantle',
        Waist = 'Life Belt',--'Tilt Belt', --'Sprinter\'s Belt', 
        Legs =  'Drachen Brais', --'Republic Subligar', --'Crimson Cuisses',
        Feet = 'Bounding Boots', --'Homam Gambieras',
    },
    ['EngagedDD'] = {
		Ammo = 'Happy Egg', --'Tiphia Sting',
        Head = 'Empress Hairpin',  --'Homam zucchetto',
        Neck = 'Spike Necklace', --'Love Torque',
        Ear1 = 'Tor. Earring +1', --'Brutal Earring',
        Ear2 = 'Tor. Earring +1', --'Beastly Earring',
        Body = 'Brigandine',--'Mrc.Cpt. Doublet',  --'Homam Corazza','Brigandine', --
        Hands = 'Battle Gloves', --'Homam Manopolas',
        Ring1 = 'Woodsman Ring', --'Venerer Ring',--'Woodsman Ring', -- --'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring', --'Puissance Ring',--'Woodsman Ring', -- --'Rajas Ring',
        Back = 'Traveler\'s Mantle', --'Forager\'s Mantle',
        Waist = 'Life Belt', --'Tilt Belt', --'Sprinter\'s Belt', 
        Legs =  'Drachen Brais', --'Republic Subligar', --'Homam Cosciales',
        Feet =  'Bounding Boots',--'Homam Gambieras',
    },
    ['EngagedMage'] = {
		Ammo = 'Happy Egg',--'Tiphia Sting',
        Head = 'Empress Hairpin',--'Homam zucchetto',
        Neck = 'Spike Necklace', --'Love Torque',
        Ear1 = 'Tor. Earring +1',
        Ear2 = 'Tor. Earring +1', --'Ethereal Earring',
        Body = 'Brigandine', --'Mrc.Cpt. Doublet', --'Homam Corazza',
        Hands = 'Battle Gloves', --'Homam Manopolas',
        Ring1 = 'Woodsman Ring', --'Toreador\'s Ring',
        Ring2 = 'Woodsman Ring', -- 'Rajas Ring',
        Back = 'Traveler\'s Mantle',--'Forager\'s Mantle',
        Waist = 'Life Belt',--'Tilt Belt',--'Sprinter\'s Belt',
        Legs = 'Drachen Brais', --'Republic Subligar',--'Homam Cosciales',
        Feet = 'Bounding Boots',--'Homam Gambieras',
    },
    ['Resting'] = {
		Ammo = 'Happy Egg',
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
    ['High Jump'] = {
		Ammo = 'Tiphia Sting',
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
    ['Super Jump'] = {

    },
    ['DefaultWeaponSkill'] = {
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
	
	['Penta Thrust'] = {
		Ammo = 'Tiphia Sting',
        Head = 'Walkure Mask', --'Wym Armet +1',
        Neck = 'Love Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = '', --'Ruby Ring',
        Ring2 = '', --,'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Life Belt', --'Warwolf Belt',
        Legs =  'Drachen Brais', --'Drn. Brais +1',
        Feet = 'Wonder Clomps', --'Hct. Leggings',
    },
	
	['Wheeling Thrust'] = {
		Ammo = 'Tiphia Sting',
        Head = 'Wym Armet +1',
        Neck = 'Light Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Enkelados\'s Bracelets', --'Hecatomb Mittens',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Drn. Brais +1',
        Feet = 'Hct. Leggings',
    },
	
	['Impulse Drive'] = {
		Ammo = 'Tiphia Sting',
        Head = 'Wym Armet +1',
        Neck = 'Spike Necklace',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Drn. Brais +1',
        Feet = 'Hct. Leggings',
    },
	
	['Skewer'] = {
		Ammo = 'Tiphia Sting',
        Head = 'Voyager Sallet',
        Neck = 'Light Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Spinel Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Wyrm Brais',
        Feet = 'Hct. Leggings',
    },
	
	['Geirskogul'] = {
		Ammo = 'Tiphia Sting',
        Head = 'Wym. Armet +1',
        Neck = 'Light Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Beastly Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Drn. Brais +1',
        Feet = 'Hct. Leggings',
    },

    ['HPThreshold'] = {
		Ammo = 'Happy Egg',
        Head = 'Walkure Mask', --'Drn. Armet +1',
        Neck = 'Shield Pendant',
        Ear1 = 'Pigeon Earring', --'Ethereal Earring',
        Ear2 = 'Pigeon Earring', --'Loquac. Earring',
        Body = 'Wonder Kaftan', --'Homam Corazza',
        Hands = 'Gigas Bracelets', --'Homam Manopolas',
        Ring1 = '', --'Toreador\'s Ring',
        Ring2 = 'Bomb Ring', --'Bomb Queen Ring',
        Back = '', --'Gigant Mantle',
        Waist = 'Powerful Rope',
        Legs = 'Wonder Braccae', --'Homam Cosciales',
        Feet = 'Wonder Clomps', --'Homam Gambieras',
    },

    ['BreathBonus'] = {
        Head = 'Wym. Armet +1',
		Body = 'Wyvern Mail',
		Hands = 'Ostreger Mitts', 
        Legs =  'Drachen Brais', --'Drn. Brais +1',
		Feet = 'Homam Gambieras',
    },
	
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
};
profile.Sets = sets;

local Status = T{
    'Engaged',
    'Resting',
};
local MageSubs = T{
    'WHM',
    'RDM'
};
local JobAbilities = T{
  'Jump',
  'High Jump',
  'Super Jump',
  'Spirit Link',
  'Call Wyvern', 
  'Ancient Circle',
};
local WeaponSkills = T{
  'Impulse Drive',
  'Wheeling Thrust',
  'Skewer',
  'Penta Thrust',
  'Geirskogul',
};

profile.Packer = {
};

profile.OnLoad = function()

    gSettings.AllowAddSet = true;
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 11');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
	
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local petAction = gData.GetPetAction();
	local player = gData.GetPlayer();
    if (player.Status == 'Resting') then 
        gFunc.EquipSet(sets.Resting);
        goto done;
    end
    if (petAction ~= nil) then
        gFunc.EquipSet(sets.BreathBonus);
        return;
    end
    local player = gData.GetPlayer();
    if (Status:contains(player.Status)) then
        local sub = '';
        if (MageSubs:contains(player.SubJob) and player.Status == 'Engaged') then
          sub = 'Mage';
        else
          sub = 'DD';
        end		
        gFunc.EquipSet(sets[player.Status .. sub]);
        goto done;
    end
    gFunc.EquipSet(sets.Idle);
    ::done::
end

profile.HandleAbility = function()
  local action = gData.GetAction();
  if (action.Name == "Steady Wing") then
	gFunc.EquipSet(sets.BreathBonus);
	return;
  end
  if (JobAbilities:contains(action.Name)) then
    gFunc.EquipSet(sets[action.Name]);
  end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.HPThreshold);
end

profile.HandleMidcast = function()
    gFunc.EquipSet(sets.HPThreshold);
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction();
    if (WeaponSkills:contains(action.Name)) then
      gFunc.EquipSet(sets[action.Name]);
    else
      gFunc.EquipSet(sets.DefaultWeaponSkill);
    end
end

return profile;