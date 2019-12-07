func void Equip_Bonus_HP(var int bonus)
{
	self.attribute[ATR_HITPOINTS_MAX] += bonus;
	self.attribute[ATR_HITPOINTS] += bonus;
};
func void UnEquip_Bonus_HP(var int antibonus)
{
	self.attribute[ATR_HITPOINTS_MAX] -= antibonus;
	if(self.attribute[ATR_HITPOINTS] > (antibonus + 1))
	{
		self.attribute[ATR_HITPOINTS] -= antibonus;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

func void Equip_Bonus_Mana(var int bonus)
{
	self.attribute[ATR_MANA_MAX] +=bonus;
	self.attribute[ATR_MANA] +=bonus;
};
func void UnEquip_Bonus_Mana(var int antibonus)
{
	self.attribute[ATR_MANA_MAX] -= antibonus;
	if(self.attribute[ATR_MANA] >= antibonus)
	{
		self.attribute[ATR_MANA] -= antibonus;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};
