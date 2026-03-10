local profile = {};

local sets = {
	Divine = {Main = 'Light Staff', Body = 'Blessed Bliaut',},
	Medicine = {Main = 'Light Staff', Ring1 = 'Medicine Ring',},
	Idle_Priority = {
		Main = {'Mythic Wand', 'Solid Wand', 'Yew Wand'},
		Sub = {'Numinous Shield', 'Varlet\'s Targe', 'Tropical Shield'},
		Neck = {'Ajari Necklace', 'Justice Badge'},
		Body = {'Noble\'s Tunic', 'Healer\'s Bliaut', 'Tct.Mgc. Coat', 'Wonder Kaftan', 'Seer\'s Tunic', 'Doublet'},
		Back = {'Rainbow Cape', 'Red Cape', 'White Cape', 'Wizard\'s Mantle'},
		Ring1 = {'Sapphire Ring', 'Saintly Ring'},
		Waist = {'Twinthread Obi', 'Friar\'s Rope'},
		Legs = {'Blessed Trousers', 'Healer\'s Pantaln.', 'Wonder Braccae', 'Martial Slacks', 'Baron\'s Slops'},
		Feet = {'Blessed Pumps', 'Healer\'s Duckbills', 'Seer\'s Pumps', 'Sandals'},
	},
	Resting_Priority = {
		Main = {'Dark Staff', 'Blessed Hammer', 'Pilgrim\'s Wand'},
		Neck = 'Checkered Scarf',
		Body = {'Noble\'s Tunic', 'Seer\'s Tunic'},
		Back = 'Wizard\'s Mantle',
		Waist = 'Hierarch Belt',
		Legs = 'Baron\'s Slops',
	}
};
profile.Sets = sets;

local Settings = {CurrentLevel = 0,};

local function ChatMacro()
	AshitaCore:GetChatManager():QueueCommand(1, '/cm party');
	AshitaCore:GetChatManager():QueueCommand(1, '/localsettings blureffect off');
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
end

profile.OnLoad = function()
	AshitaCore:GetChatManager():QueueCommand(1, '/addon unload chains');
	AshitaCore:GetChatManager():QueueCommand(1, '/drawdistance setmob 10');
	AshitaCore:GetChatManager():QueueCommand(1, '/drawdistance setworld 10');
	ChatMacro:once(5)
end

profile.HandleDefault = function()
	local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
	if (myLevel ~= Settings.CurrentLevel) then gFunc.EvaluateLevels(profile.Sets, myLevel);
	Settings.CurrentLevel = myLevel;
	end

	local player = gData.GetPlayer();
	if (player.Status == 'Resting') then gFunc.EquipSet(sets.Resting);
	else gFunc.EquipSet(sets.Idle);
	end
end

profile.HandlePrecast = function()
	local spell = gData.GetAction();
	if (spell.Skill == 'Healing Magic') then gFunc.Equip('Feet', 'Cure Clogs');
	end
end

profile.HandleMidcast = function()
	local player = gData.GetPlayer();
	local spell = gData.GetAction();
	if (player.HPP < 75) and (spell.Skill == 'Healing Magic') then gFunc.EquipSet(sets.Medicine);
	elseif (spell.Skill == 'Healing Magic') then gFunc.Equip('Main', 'Light Staff');
	elseif (spell.Skill == 'Divine Magic') then gFunc.EquipSet(sets.Divine);
	elseif (spell.Skill == 'Enfeebling Magic') then gFunc.Equip('Body', 'Healer\'s Bliaut');
	elseif (spell.Skill == 'Enhancing Magic') then gFunc.Equip('Body', 'Blessed Bliaut');
	end
end

return profile;