
func void B_MilarSwordSpecialDamage(var C_Npc oth,var C_Npc slf)
{
	if (!Npc_HasReadiedMeleeWeapon(oth))	{return;};	//NS (24/02/14)
  var C_Item ReadyWeap;
	ReadyWeap = Npc_GetReadiedWeapon(oth);
	if((slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MILAR) && (slf.attribute[ATR_HITPOINTS] > 0))
	{
		if(Hlp_IsItem(ReadyWeap,ITMW_PRADSWORDPOISON))
		{	
			if(slf.attribute[ATR_HITPOINTS] > 20)
			{
				slf.attribute[ATR_HITPOINTS] -= 20;
			}
			else
			{
				slf.attribute[ATR_HITPOINTS] = -1;
			};
		};
	};
};

func void B_TestDamage(var C_Npc oth,var C_Npc slf)
{
  var C_Item ReadyWeap;
	ReadyWeap = Npc_GetReadiedWeapon(oth);
	var int x;
	x = slf.attribute[ATR_HITPOINTS] + slf.protection[PROT_MAGIC]- 1;
	if((slf.flags & NPC_FLAG_IMMORTAL) == 0)
	{
		if((slf.guild == GIL_PIR) && (slf.attribute[ATR_HITPOINTS] > 0))
		{
			if(Hlp_IsItem(ReadyWeap,ItMw_1h_Shpaga))
			{	
				if(slf.attribute[ATR_HITPOINTS] > 100)
				{
					Npc_ChangeAttribute(slf,ATR_HITPOINTS,-100);
				}
				else
				{
					slf.attribute[ATR_HITPOINTS] = 1;
				};
				if(slf.attribute[ATR_HITPOINTS] == 1)
				{
					if(slf.aivar[AIV_Spell_4_Uncon] == FALSE)
					{
						slf.aivar[AIV_Spell_4_Uncon] = TRUE;
						PrintScreen("ÊÎÑß×ÎÊ",60,10,Font_Screen,10);
						Wld_PlayEffect("SPELLFX_DS_DAMEDGE",oth,slf,1,5,DAM_EDGE,0);						
					};
				};
			};
		};
	};
};

