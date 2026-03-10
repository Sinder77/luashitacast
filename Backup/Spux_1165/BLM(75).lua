-- BLM Luashitacast by Shirtninja

-- commands:

-- /blm                 show current blm configuration status

-- /on                  enables luashitacast commands (default)
-- /off                 disables luashitacast commands

-- /ele                 prefer elemental nuke set
-- /int                 prefer int nuke set (default)

-- /sorc or /sorcon     use FastCastHPDown + Sorc ring (default)
-- /sorcoff             use FastCast + current nuke set (ele or nuke)

-- /mb or /mbon         enable magic burst mode i.e. fafnir, kirin, etc.
-- /mboff               disable magic burst mode i.e. free nuke w/o skillchains (default)

-- /melee or /meleeon   melee set 
-- /meleeoff            disables melee set

-- /craft               equip crafting set
-- /fishy               equip fishing gear

local towns = T{'Tavnazian Safehold','Al Zahbi','Aht Urhgan Whitegate','Nashmau','San d\'Oria-Jeuno Airship','Bastok-Jeuno Airship','Windurst-Jeuno Airship','Kazham-Jeuno Airship','Southern San d\'Oria','Northern San d\'Oria','Port San d\'Oria','Chateau d\'Oraguille','Bastok Mines','Bastok Markets','Port Bastok','Metalworks','Windurst Waters','Windurst Walls','Port Windurst','Windurst Woods','Heavens Tower','Ru\'Lude Gardens','Upper Jeuno','Lower Jeuno','Port Jeuno','Rabao','Selbina','Mhaura','Kazham','Norg','Mog Garden'};

local profile = {};

local Settings = {
    IgnoreAll = false;
    UseNormalNukeSet = true;
    UseFullElementalSet = false;
    SorcMode = true;
    CraftingMode = false;
    FishgMode = false;
    MagicBurstMode = false;
    MeleeMode = false;
};

local ElementalStaffTable = {
    ['Fire'] = 'Vulcan\'s Staff',
    ['Earth'] = 'Terra\'s Staff',
    ['Water'] = 'Aquilo\'s Staff',
    ['Wind'] = 'Auster\'s Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Pluto\'s Staff'
};

local sets = {
    ['Idle'] = {
        Main = 'Terra\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Neck = 'Philomath Stole',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Magnetic Earring',
        Head = 'Demon Helm',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Errant Cuffs',
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Rainbow Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Errant Slops',
        Feet = 'Wood M Ledelsens',
    },
    ['Town'] = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Neck = 'Philomath Stole',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Magnetic Earring',
        Head = 'Sorcerer\'s Petas.',
        Body = 'Ducal Aketon',
        Hands = 'Zenith Mitts',
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Rainbow Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Errant Slops',
        Feet = 'Wood M Ledelsens',
    },
    ['Int'] = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wizard\'s Petasos',
        Neck = 'Philomath Stole',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Igqira Weskit',
        Hands = 'Errant Cuffs',
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Rainbow Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Errant Slops',
        Feet = 'Wood M Ledelsens',
    },
    ['Elemental'] = {
        Main = 'Pluto\'s Staff',
		Ammo = 'Phtm. Tathlum',
        Head = 'Sorcerer\'s Petas.',
        Neck = 'Elemental Torque',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Morion Earring',
        Body = 'Igqira Weskit',
        Hands = 'Wizard\'s Gloves',
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Rainbow Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Errant Slops',
        Feet = 'Wood M Ledelsens',
    },
	['Elemental_Priority'] = {
        Ammo = { 'Phtm. Tathlum', 'Morion Tathlum' },
		Head = 'Wzd. Petasos', --Wzd. Petasos +1 when you get it
        Neck = 'Philomath Stole', --Elemental Torque
        Body = { 'Igqira Weskit', 'Flora Cotehardie' },
        Hands = { 'Errant Cuffs', 'Wood Gauntlets' },
        Ring1 = { 'Omniscient Ring', 'Genius Ring' },
        Ring2 = { 'Omniscient Ring', 'Genius Ring' },
        Ear1 = { 'Magnetic Earring', 'Morion Earring'},
        Ear2 = { 'Moldavite Earring', 'Morion Earring'  },
        Back = { 'Rainbow Cape', 'Red Cape +1' }, --Prism Cape
        Waist = { 'Sorcerer\'s Belt', 'Penitent\'s Rope' },
        Legs = { 'Errant Slops','Magic Slacks' },
        Feet = 'Wood M Ledelsens', --Src. Sabots +1
    },
    ['Rest'] = {
        Main = 'Pluto\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Sorcerer\'s Petas.',
        Neck = 'Philomath Stole', --Checkered Scarf
        Ear1 = 'Moldavite Earring', --Relaxing Earring
        Ear2 = 'Magnetic Earring',
        Body = 'Sorcerer\'s Coat',
        Hands = 'Wood Gauntlets',
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Rainbow Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Errant Slops',
        Feet = 'Wood M Ledelsens',
    },
    ['Enfeeble'] = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Sorcerer\'s Petas.',
        Neck = 'Philomath Stole', --Enfeebling Torque
        Ear1 = 'Morion Earring',
        Ear2 = 'Magnetic Earring', --Loquac. Earring
        Body = 'Wizard\'s Coat',
        Hands = 'Wood Gauntlets',
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Rainbow Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Wizard\'s Sabots',
    },
    ['Dark'] = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wizard\'s Petasos',
        Neck = 'Philomath Stole', --Dark Torque
        Ear1 = 'Morion Earring',
        Ear2 = 'Morion Earring',
        Body = 'Igqira Weskit',
        Hands = 'Sorcerer\'s Gloves',
        Ring1 = 'Omniscient Ring',
        Ring2 = 'Omniscient Ring',
        Back = 'Rainbow Cape',
        Waist = 'Sorcerer\'s Belt',
        Legs = 'Wizard\'s Tonban',
        Feet = 'Wizard\'s Sabots',
    },
    ['Ugga'] = {
        Neck = 'Philomath Stole',
    },
    ['Sorc'] = {
        Ring1 = 'Sorcerer\'s Ring',
    },
    ['ThunderObi'] = {
        Waist = 'Rairin Obi',
    },
    ['IceObi'] = {
        Waist = 'Hyorin Obi',
    },
    ['DarkObi'] = {
        Waist = 'Anrin Obi',
    },
    ['FastCast'] = {
        Feet = 'Rostrum Pumps',
        Ear2 = 'Loquac. Earring',
    },
    ['FastCastHPDown'] = {
		Main = 'Asklepios',
		Sub =  'Astral Aspis',
        Head = 'Zenith Crown',
        Neck = 'Checkered Scarf',
        Ear2 = 'Loquac. Earring',
        Body = 'Flora Cotehardie',
        Hands = 'Zenith Mitts',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
        Back = 'Blue Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Errant Slops',
        Feet = 'Rostrum Pumps',
    },
    ['MagicBurst'] = {
        Hands = 'Sorcerer\'s Gloves',
    },
    ['NukeMatchesDay'] = {
        Legs = 'Sorcerer\'s Tonban',
    },
    ['Melee'] = {
        -- insert gear here
    },
    ['Craft'] = {
        -- insert gear here
    },
    ['Fish'] = {
        Main = 'Warp Cudgel',
		Head = 'remove',
        Body = 'Fisherman\'s Apron',
        Neck = 'remove',
		Hands = 'Fsh. Gloves',
        Ring1 = 'remove',
		Ring2 = 'remove',
		Ear1 = 'remove',
		Ear2 = 'remove',
		Legs = 'Fisherman\'s Hose',
        Back = 'remove',
		Waist = 'remove',
		Feet = 'Waders',
		Range = 'Lu Shang\'s F. Rod',
		Ammo = 'Sinking Minnow',
    },
    ['LockStyle'] = {
        Main = 'Pluto\'s Staff',
		Head = 'Demon Helm',
        Body = 'Igqira Weskit',
        Hands = 'Sorcerer\'s Gloves',
        Legs = 'Sorcerer\'s Tonban',
        Feet = 'Wood M Ledelsens',
    },
    ['Stoneskin'] = {
		Main = 'Kirin\'s Pole',
        Neck = 'Promise Badge', --Enhancing Torque
    },
};
profile.Sets = sets;


profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /on /lac fwd on');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /off /lac fwd off');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /ele /lac fwd ele');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /int /lac fwd int');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sorc /lac fwd sorcon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sorcon /lac fwd sorcon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /sorcoff /lac fwd sorcoff');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mb /lac fwd mbon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mbon /lac fwd mbon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /mboff /lac fwd mboff');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /craft /lac fwd craft');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /melee /lac fwd meleeon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /meleeon /lac fwd meleeon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /meleeoff /lac fwd meleeoff');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /blm /lac fwd blm');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /fishy /lac fwd fishy');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(-1, '/macro set 1');
    AshitaCore:GetChatManager():QueueCommand(-1, '/displayhead on');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /on');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /off');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /ele');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /int');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sorc');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sorcon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /sorcoff');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mb');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mbon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /mboff');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /craft');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /melee');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /meleeon');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /meleeoff');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /blm');
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /fishy');
    AshitaCore:GetChatManager():QueueCommand(-1, '/displayhead on');
end

profile.HandleCommand = function(args)
    -- change mode: normal nuke set
    if (args[1] == 'int') then
        Settings.UseFullElementalSet = false;
        Settings.UseNormalNukeSet = true;
        Settings.MeleeMode = false;
        Settings.CraftingMode = false;
        Settings.FishingMode = false;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM Mode: Int Nuke ON');
    end

    -- change mode: full elemental nukes
    if (args[1] == 'ele') then
        Settings.UseFullElementalSet = true;
        Settings.UseNormalNukeSet = false;
        Settings.CraftingMode = false;
        Settings.FishingMode = false;
        Settings.MeleeMode = false;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM Mode: Elemental Nuke ON');
    end

    -- change mode: crafting gear
    if (args[1] == 'craft') then
        Settings.CraftingMode = true;
        Settings.MeleeMode = false;
        Settings.FishingMode = false;
    end

    -- change mode: fishing gear
    if (args[1] == 'fishy') then
        Settings.FishingMode = true;
        Settings.CraftingMode = false;
        Settings.MeleeMode = false;
	AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM Mode: Fish ON');
    end

    -- ignore all luashitacast commands
    if (args[1] == 'off') then
        Settings.IgnoreAll = true;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo LAC: Disabled');
    end

    -- re-enable luashitacast commands
    if (args[1] == 'on') then
        Settings.IgnoreAll = false;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo LAC: Enabled');
    end

    if (args[1] == 'sorcon') then
        Settings.SorcMode = true;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM: Sorc Ring Enabled');
    end

    if (args[1] == 'sorcoff') then
        Settings.SorcMode = false;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM: Sorc Ring Disabled');
    end

    if (args[1] == 'mbon') then
        Settings.MagicBurstMode = true;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM: Magic Burst Mode Enabled');
    end

    if (args[1] == 'mboff') then
        Settings.MagicBurstMode = false;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM: Magic Burst Mode Disabled');
    end

    if (args[1] == 'meleeon') then
        Settings.MeleeMode = true;
        Settings.CraftingMode = false;
        Settings.StyleMode = false;
        Settings.FishingMode = false;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM: Melee Mode Enabled');
    end

    if (args[1] == 'meleeoff') then
        Settings.MeleeMode = false;
        Settings.CraftingMode = false;
        Settings.FishingMode = false;
        Settings.StyleMode = false;
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM: Melee Mode Disabled');
    end

    if (args[1] == 'blm') then
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo '.. (Settings.CraftingMode == true and 'Crafting' or Settings.UseNormalNukeSet and 'Int Nukes' or 'Elemental Nukes') .. ' | Sorc: ' .. (Settings.SorcMode == true and 'ON' or 'OFF') .. ' | MB: ' .. (Settings.MagicBurstMode == true and 'ON' or 'OFF'));
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()
    local zone = gData.GetEnvironment().Area
	local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        CurrentLevel = myLevel;
    end
    if (Settings.IsStyleLocked == nil) then
        gFunc.LockStyle(sets.LockStyle)
        Settings.IsStyleLocked = true
    end

    if (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Rest)
    else
        if (Settings.CraftingMode == true) then
            gFunc.EquipSet(sets.Craft)
        elseif (Settings.FishingMode == true) then
            gFunc.EquipSet(sets.Fish)
        else
            if towns:contains(zone) then
                gFunc.Equip('body', 'Ducal Aketon')
            else
                gFunc.EquipSet(sets.Idle)
            end
        end
    end
end

profile.HandleAbility = function(ability)
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer();
    local spell = gData.GetAction();

    -- use sorc ring set if in sorc mode and the player has a decent amount of hp to begin with.
    if (spell.Skill == 'Elemental Magic' and Settings.SorcMode == true and player.HP > 300) then
        gFunc.EquipSet(sets.FastCastHPDown);
    else
        gFunc.EquipSet(sets.FastCast); 
    end

end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();

    -- a place to store custom messages
    local state = {
        NukeType = 'Int';
        UggStr = '';
        UseUgg = false;
        SorcStr = '';
        UseSorc = false;
        ObiStr = '';
        MBStr = '';
    };


    -- ELEMENTAL MAGIC --
    if (spell.Skill == 'Elemental Magic') then

        -- check for ugga pendant proc (MP < 51%)
        if (spell.MppAftercast < 51) then
            state.UseUgg = true;
            state.UggStr = ' + Ugga'
        else
            state.UseUgg = false;
            state.UggStr = '';
        end

        if (Settings.SorcMode == true) then
            state.UseSorc = true;
            state.SorcStr = ' + Sorc'
        else
            state.UseSorc = false;
            state.SorcStr = '';
        end

        -- Check if the spell is Stoneskin
        if (spell.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin);
        end

        -- equip elemental or nuke set
        if (Settings.UseFullElementalSet == true) then
            state.NukeType = 'Ele';
            gFunc.EquipSet(sets.Elemental);
        else
            state.NukeType = 'Int';
            gFunc.EquipSet(sets.Int);
        end

        -- equip magic burst set
        if (Settings.MagicBurstMode == true) then
            state.MBStr = 'MB Mode >> ';
            gFunc.EquipSet(sets.MagicBurst);
        end

        -- equip ugg pendant (if activated)
        if (state.UseUgg == true) then
            gFunc.EquipSet(sets.Ugga);
        end

        -- equip sorc ring (if activated)
        if (state.UseSorc == true) then
            gFunc.EquipSet(sets.Sorc);
        end

        -- equip obi based on weather if the day/weather
        local hasIceConditions = weather.DayElement == 'Ice' or weather.WeatherElement == 'Ice';
        local hasThunderConditions = weather.DayElement == 'Thunder' or weather.WeatherElement == 'Thunder'; local hasDarkConditions = weather.DayElement == 'Dark' or weather.WeatherElement == 'Dark'

        if (spell.Element == 'Ice' and hasIceConditions) then
            gFunc.EquipSet(sets.IceObi);
            state.ObiStr = '+ Ice Obi';
        end

        if (spell.Element == 'Thunder' and hasThunderConditions) then
            gFunc.EquipSet(sets.ThunderObi);
            state.ObiStr = '+ Thunder Obi';
        end

        if (spell.Element == 'Dark' and hasDarkConditions) then
            gFunc.EquipSet(sets.DarkObi);
            state.ObiStr = '+ Dark Obi';
        end

        -- equip sorc tonban if nuke matches the day
        local nukeMatchesDay = spell.Element == weather.DayElement;

        if (nukeMatchesDay) then
            gFunc.EquipSet(sets.NukeMatchesDay);
        end

        -- echo a concatenated string with all effects currently in play
        AshitaCore:GetChatManager():QueueCommand(-1, '/echo BLM >> ' .. state.MBStr .. spell.Name .. ' (' .. state.NukeType .. state.UggStr .. state.SorcStr .. state.ObiStr .. ')');
    end

    -- ENFEEBLING MAGIC --
    if (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeeble);
    end

    -- DARK MAGIC --
    if (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Dark);

        local hasDarkConditions = weather.DayElement == 'Dark' or weather.WeatherElement == 'Dark';

        if (hasDarkConditions) then
            gFunc.EquipSet(sets.DarkObi);
        end
    end

    -- HEALING MAGIC --
    if (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Idle);
    end

    -- ENHANCING MAGIC --
    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Idle);
    end

    -- recast
    AshitaCore:GetChatManager():QueueCommand(-1, '/recast "' .. spell.Name .. '"');

    -- equip the appropriate elemental stave
    if (Settings.MeleeMode == false) then
        gFunc.Equip('main', ElementalStaffTable[spell.Element]);
    end
   
end

profile.HandleWeaponskill = function()
end

return profile;