local profile = {};
local sets = {
    Resting = {
        --Main = 'Bastokan Hammer',
        Sub = 'Tropical Shield',
        Ammo = 'Morion Tathlum',
        Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Seer\'s Tunic',
        Hands = 'Baron\'s Cuffs',
        Ring1 = 'Ascetic\'s Ring',
        Ring2 = 'San d\'Orian Ring',
        Back = {'White Cape', 'Cotton Cape',},
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops',
        Feet = 'Light Soleas',
    },
    Tp = {
        Main = 'Bastokan Hammer',
        Sub = 'Tropical Shield',
        Ammo = 'Morion Tathlum',
        Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Optical Earring',--'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = {'Seer\'s Tunic', 'Cotton Doublet',},
        Hands = 'Baron\'s Cuffs',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Back = {'White Cape', 'Cotton Cape',},
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops',
        Feet = 'Light Soleas',
    },
    Idle = {
        Main = 'Bastokan Hammer',
        Sub = 'Tropical Shield',
        Ammo = 'Morion Tathlum',
        Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = {'Seer\'s Tunic', 'Cotton Doublet',},
       -- Hands = 'Baron\'s Cuffs',
        --Ring1 = 'Ascetic\'s Ring',
        --Ring2 = 'San d\'Orian Ring',
        Back = {'White Cape', 'Cotton Cape',},
        Legs = 'Windurstian Slops',
        --Feet = 'Light Soleas',
    },
};
profile.Sets = sets;
profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()

    local player = gData.GetPlayer();
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);
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

--Green
--Blue
--Yellow
--Purple
--Ice

--Need

--Clear
--Fires