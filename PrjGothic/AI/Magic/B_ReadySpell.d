
func void B_ReadySpell(var C_Npc slf,var int spell,var int mana)
{
	if(slf.attribute[ATR_MANA_MAX] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA_MAX,mana);
	};
	if(slf.attribute[ATR_MANA] < mana)
	{
		Npc_ChangeAttribute(slf,ATR_MANA,mana);
	};
	if(Npc_IsDrawingSpell(slf) == spell)
	{
		return;
	};
	if(Npc_GetActiveSpell(slf) == spell)
	{
		return;
	}
	else if(Npc_GetActiveSpell(slf) != -1)
	{
		/*FOR SHIELD*//*	AI_RemoveWeapon_ds(slf);*/AI_RemoveWeapon(self);
	};
	AI_ReadySpell(slf,spell,mana);
};

