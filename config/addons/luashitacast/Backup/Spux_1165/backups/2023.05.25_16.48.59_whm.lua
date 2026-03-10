local profile = {};
profile.Sets = {
    Resting = {
        Main = 'Bastokan Hammer',
        Sub = 'Tropical Shield',
        Ammo = 'Morion Tathlum',
        Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Cotton Doublet',
        Hands = 'Worker Gloves',
        Ring1 = 'Ascetic\'s Ring',
        Ring2 = 'San d\'Orian Ring',
        Back = 'Cotton Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops',
        Feet = 'Holly Clogs',
    },
    Tp = {
        Main = 'Bastokan Hammer',
        Sub = 'Tropical Shield',
        Ammo = 'Morion Tathlum',
        Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Cotton Doublet',
        Hands = 'Worker Gloves',
        Ring1 = 'Ascetic\'s Ring',
        Ring2 = 'San d\'Orian Ring',
        Back = 'Cotton Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Linen Slops',
        Feet = 'Holly Clogs',
    },
};

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