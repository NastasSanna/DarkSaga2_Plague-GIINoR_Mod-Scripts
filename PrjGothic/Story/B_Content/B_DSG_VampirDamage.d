func void B_DS2P_VampirDamage(var C_Npc oth,var C_Npc slf)
{
	var C_Item ReadyWeap;
	var int VampirBonus;
	VampirBonus = slf.attribute[ATR_HITPOINTS] / 4;
	ReadyWeap = Npc_GetReadiedWeapon(oth);
	if((slf.guild < GIL_SEPERATOR_HUM ) && (slf.attribute[ATR_HITPOINTS] > 0))
	{
		if(Hlp_IsItem(ReadyWeap,ItMw_DS2P_BeliarHorror))
		{	
			if(oth.attribute[ATR_HITPOINTS_MAX] > (oth.attribute[ATR_HITPOINTS] + VampirBonus))
			{
				oth.attribute[ATR_HITPOINTS] +=VampirBonus;
			}
			else
			{
				oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
			};
		};
		Wld_PlayEffect("spellFX_Skull_Skull1",slf,oth,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_Skull_SPREAD",slf,slf,0,0,0,FALSE);
	};
};
