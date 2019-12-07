
func void B_MagicHurtNpc(var C_Npc slf,var C_Npc oth,var int damage)	//slf-атакующий, oth - жертва
{
	if(oth.protection[PROT_MAGIC] != -1)
	{
		damage -= oth.protection[PROT_MAGIC];
		if(damage > 0)
		{
			if(damage < oth.attribute[ATR_HITPOINTS])
			{
				Npc_ChangeAttribute(oth,ATR_HITPOINTS,-damage);
			}
			else
			{
				oth.attribute[ATR_HITPOINTS] = 1;
				if(oth.attribute[ATR_HITPOINTS] == 1)
				{
					if(oth.aivar[AIV_Spell_4_Uncon] == FALSE)
					{
						oth.aivar[AIV_Spell_4_Uncon] = TRUE;
						if((oth.guild > GIL_SEPERATOR_HUM) || (oth.guild == GIL_DMT) || (oth.guild == GIL_BDT) || (oth.aivar[AIV_DropDeadAndKill] == TRUE))
						{
							Wld_PlayEffect("SPELLFX_DS_DAMEDGE",slf,oth,1,500,DAM_MAGIC,0);
						}
						else
						{
							Wld_PlayEffect("SPELLFX_DS_DAMEDGE",slf,oth,1,5,DAM_EDGE,0);
						};
					};
				};
			};
		} 
		else
		{
			Npc_ChangeAttribute(oth,ATR_HITPOINTS,-1);
		};
	};
	if(Npc_IsDead(oth))
	{
		if((Npc_IsPlayer(slf) || (slf.aivar[AIV_PARTYMEMBER] == TRUE)) && (oth.aivar[AIV_VictoryXPGiven] == FALSE))
		{
			B_GivePlayerXP(self.level * XP_PER_VICTORY);
			oth.aivar[AIV_VictoryXPGiven] = TRUE;
		};
	};
};

