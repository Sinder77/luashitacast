local profile = {};
function job_setup()
    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith", "Siren"}
    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
	spirit_of = {['Light']="Light Spirit", ['Dark']="Dark Spirit", ['Fire']="Fire Spirit", ['Earth']="Earth Spirit",
        ['Water']="Water Spirit", ['Wind']="Air Spirit", ['Ice']="Ice Spirit", ['Lightning']="Thunder Spirit"}

    magicalRagePacts = S{
		'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen','Clarsach Call','Impact',
		'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
		'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
		'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
		'Meteor Strike','Conflag Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
		'Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Tornado II','Sonic Buffet'}

    pacts = {}
    pacts.cure = {['Carbuncle']='Healing Ruby'}
    pacts.curaga = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water'}
    pacts.buffoffense = {['Carbuncle']='Glittering Ruby', ['Ifrit']='Crimson Howl', ['Garuda']='Hastega II', ['Ramuh']='Rolling Thunder',
		['Fenrir']='Ecliptic Growl', ['Siren']='Katabatic Blades'}
    pacts.buffdefense = {['Carbuncle']='Shining Ruby', ['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Ward',
		['Ramuh']='Lightning Armor', ['Fenrir']='Ecliptic Howl', ['Diabolos']='Noctoshield', ['Cait Sith']='Reraise II', ['Siren']="Wind's Blessing"}
    pacts.buffspecial = {['Ifrit']='Inferno Howl', ['Garuda']='Fleet Wind', ['Titan']='Earthen Armor', ['Diabolos']='Dream Shroud',
		['Carbuncle']='Soothing Ruby', ['Fenrir']='Heavenward Howl', ['Cait Sith']='Raise II', ['Siren']='Chinook'}
	pacts.buffspecial2 = {['Carbuncle']='Pacifying Ruby',['Leviathan']='Soothing Current',['Shiva']='Crystal Blessing'}
    pacts.debuff1 = {['Shiva']='Diamond Storm', ['Ramuh']='Shock Squall', ['Leviathan']='Tidal Roar', ['Fenrir']='Lunar Cry',
		['Diabolos']='Pavor Nocturnus', ['Cait Sith']='Eerie Eye', ['Siren']='Lunatic Voice'}
    pacts.debuff2 = {['Shiva']='Sleepga', ['Leviathan']='Slowga', ['Fenrir']='Lunar Roar', ['Diabolos']='Somnolence', ['Ramuh']='Thunderspark',
		['Siren']='Bitter Elegy'}
    pacts.sleep = {['Shiva']='Sleepga', ['Diabolos']='Nightmare', ['Cait Sith']='Mewing Lullaby'}
    pacts.nuke2 = {['Ifrit']='Fire II', ['Shiva']='Blizzard II', ['Garuda']='Aero II', ['Titan']='Stone II',
		['Ramuh']='Thunder II', ['Leviathan']='Water II', ['Siren']='Tornado II'}
    pacts.nuke4 = {['Ifrit']='Fire IV', ['Shiva']='Blizzard IV', ['Garuda']='Aero IV', ['Titan']='Stone IV',
		['Ramuh']='Thunder IV', ['Leviathan']='Water IV', ['Siren']='Torando II'}
    pacts.bp70 = {['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Garuda']='Predator Claws', ['Titan']='Mountain Buster',
		['Ramuh']='Chaotic Strike', ['Leviathan']='Spinning Dive', ['Carbuncle']='Meteorite', ['Fenrir']='Eclipse Bite',
		['Diabolos']='Nether Blast',['Cait Sith']='Regal Scratch'}
    pacts.bp75 = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Geocrush',
		['Ramuh']='Thunderstorm', ['Leviathan']='Grand Fall', ['Carbuncle']='Holy Mist', ['Fenrir']='Lunar Bay',
		['Diabolos']='Night Terror', ['Cait Sith']='Level ? Holy'}
	pacts.bp99 = {['Ifrit']='Conflag Strike',['Titan']='Crag Throw',['Ramuh']='Volt Strike', ['Siren']='Hysteric Assault'}
    pacts.astralflow = {['Ifrit']='Inferno', ['Shiva']='Diamond Dust', ['Garuda']='Aerial Blast', ['Titan']='Earthen Fury',
		['Ramuh']='Judgment Bolt', ['Leviathan']='Tidal Wave', ['Carbuncle']='Searing Light', ['Fenrir']='Howling Moon',
		['Diabolos']='Ruinous Omen', ['Cait Sith']="Altana's Favor"}
	
	--Most commonly used offensive pacts by avatar split into two categories.
	pacts.physical = {['Carbuncle']='Poison Nails',['Fenrir']='Eclipse Bite',['Ifrit']='Flaming Crush',['Titan']='Mountain Buster',
		['Leviathan']='Spinning Dive',['Garuda']='Predator Claws',['Shiva']='Rush',['Ramuh']='Volt Strike',['Diabolos']='Blindside',
		['Cait Sith']='Regal Gash',['Siren']='Hysteric Assault'}
	pacts.magical = {['Carbuncle']='Holy Mist',['Fenrir']='Lunar Bay',['Ifrit']='Meteor Strike',['Titan']='Geocrush',
		['Leviathan']='Grand Fall',['Garuda']='Wind Blade',['Shiva']='Heavenly Strike',['Ramuh']='Thunderstorm',['Diabolos']='Nether Blast',
		['Cait Sith']='Level ? Holy',['Siren']='Sonic Buffet'}
		
		pacts.tier1 = {['Carbuncle']='Poison Nails',['Ifrit']='Punch',['Garuda']='Claw',}
end
		
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
        Back = 'Cotton Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops',
        Feet = 'Light Soleas',
    },
    Tp = {
        --Main = 'Hermit\'s Wand', --'Bastokan Hammer',
        Sub = 'Tropical Shield',
        Ammo = 'Morion Tathlum',
        Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Optical Earring',
        Body = 'Nomad\'s Tunica',--'Seer\'s Tunic',--Body = 'Cotton Doublet',
        Hands = 'Baron\'s Cuffs',
        Ring1 = 'Ascetic\'s Ring',
        Ring2 ='San d\'Orian Ring',
        Back = 'Cotton Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops', --Windurstian Slops
        Feet = 'Light Soleas',
    },
				
		--Main = 'Bastokan Hammer',
        --Sub = 'Tropical Shield',
        --Ammo = 'Morion Tathlum',
        --Head = 'Silver Hairpin',
        --Neck = 'Justice Badge',
        --Ear1 = 'Optical Earring',--'Onyx Earring',
        --Ear2 = 'Onyx Earring',
        --Body = 'Seer\'s Tunic',
        --Hands = 'Baron\'s Cuffs',
        --Ring1 = 'Saintly Ring',
        --Ring2 = 'Saintly Ring',
        --Back = 'Cotton Cape',
        --Waist = 'Friar\'s Rope',
        --Legs = 'Baron\'s Slops',
        --Feet = 'Light Soleas',
    
    Idle = {
        Main = 'Lgn. Staff',
        Sub = 'Tropical Shield',
        Ammo = 'Morion Tathlum',
        Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Nomad\'s Tunica',--'Seer\'s Tunic',--Body = 'Cotton Doublet',
        Hands = 'Baron\'s Cuffs',
        --Ring1 = 'Ascetic\'s Ring',
        --Ring2 = 'San d\'Orian Ring',
        Back = 'Cotton Cape',
        Waist = 'Friar\'s Rope',
        Legs = 'Baron\'s Slops', --Windurstian Slops
        Feet = 'Light Soleas',
    },
};
profile.Sets = sets;
profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias /rdm /lac fwd');
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^F1 /lac fwd idlerefresh');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad1 /ma "Carbuncle" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad2 /ma "Titan" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad3 /ma "Garuda" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad4 /ma "Shiva" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad5 /ma "Ifrit" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad6 /ma "Leviathan" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind ^numpad7 /ma "Ramuh" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind numpad0 /ja Assault <stnpc>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind !numpad0 /ja Release <me>');
end

profile.OnUnload = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/alias delete /rdm');
    AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^F1');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind !numpad0 /ja Release <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind numpad0 /ja Assault <stnpc>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad1 /ma "Carbuncle" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad2 /ma "Titan" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad3 /ma "Garuda" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad4 /ma "Shiva" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad5 /ma "Ifrit" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad6 /ma "Leviathan" <me>');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind ^numpad7 /ma "Ramuh" <me>'); 
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