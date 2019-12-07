
func void B_AddFightSkill(var C_Npc slf,var int talent,var int percent)
{
	var C_ITEM hero_meleeweapon;
	var C_ITEM hero_rangedweapon;
	hero_meleeweapon = Npc_GetEquippedMeleeWeapon(slf);	
	hero_rangedweapon = Npc_GetEquippedRangedWeapon(slf);
	if(talent == NPC_TALENT_1H)
	{
		slf.HitChance[NPC_TALENT_1H] += percent;
		if(slf.HitChance[NPC_TALENT_1H] >= 0)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,0);
			Mdl_RemoveOverlayMds(slf,"humans_1hST1.MDS");
			Mdl_RemoveOverlayMds(slf,"humans_1hST2.MDS");
		};
		if(slf.HitChance[NPC_TALENT_1H] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,1);
			Mdl_ApplyOverlayMds(slf,"humans_1hST1.mds");
		};
		if(slf.HitChance[NPC_TALENT_1H] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_1H,2);
			Mdl_ApplyOverlayMds(slf,"humans_1hST2.mds");
		};
	};
	if(talent == NPC_TALENT_2H)
	{
		slf.HitChance[NPC_TALENT_2H] += percent;
		if(slf.HitChance[NPC_TALENT_2H] >= 0)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,0);
			Mdl_RemoveOverlayMds(slf,"humans_2hST1.MDS");
			Mdl_RemoveOverlayMds(slf,"humans_2hST2.MDS");
		};
		if(slf.HitChance[NPC_TALENT_2H] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,1);
			Mdl_ApplyOverlayMds(slf,"humans_2hST1.mds");
		};
		if(slf.HitChance[NPC_TALENT_2H] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_2H,2);
			Mdl_ApplyOverlayMds(slf,"humans_2hST2.mds");
		};
	};
	if(talent == NPC_TALENT_BOW)
	{
		slf.HitChance[NPC_TALENT_BOW] += percent;
		if(slf.HitChance[NPC_TALENT_BOW] >= 0)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,0);
			Mdl_RemoveOverlayMds(slf,"humans_bowT1.MDS");
			Mdl_RemoveOverlayMds(slf,"humans_bowT2.MDS");
		};
		if(slf.HitChance[NPC_TALENT_BOW] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,1);
			Mdl_ApplyOverlayMds(slf,"humans_bowT1.mds");
		};
		if(slf.HitChance[NPC_TALENT_BOW] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_BOW,2);
			Mdl_ApplyOverlayMds(slf,"humans_bowT2.mds");
		};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		slf.HitChance[NPC_TALENT_CROSSBOW] += percent;
		if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 0)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,0);
			Mdl_RemoveOverlayMds(slf,"humans_cbowT1.MDS");
			Mdl_RemoveOverlayMds(slf,"humans_cbowT2.MDS");
		};
		if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 30)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,1);
			Mdl_ApplyOverlayMds(slf,"humans_cbowT1.mds");
		};
		if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 60)
		{
			Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,2);
			Mdl_ApplyOverlayMds(slf,"humans_cbowT2.mds");
		};
	};
	if(Npc_IsPlayer(slf) && Npc_HasEquippedMeleeWeapon(slf))	//NS (24/02/14)
	{
		if(hero_meleeweapon.weight == 2)	//Экипировано орочье оружие
		{
			if(Npc_GetTalentSkill(slf,NPC_TALENT_ORCWEAPON) == ORCWEAPON_LEVEL_FIRST)
			{
				Mdl_ApplyOverlayMds(slf,"Humans_O2h.MDS");
			}
			else if(Npc_GetTalentSkill(slf,NPC_TALENT_ORCWEAPON) == ORCWEAPON_LEVEL_SECOND)
			{
				Mdl_ApplyOverlayMds(slf,"HUMANS_O2hL2.MDS");
			};
		};
		/*else if((hero_rangedweapon.cond_atr[0] == ATR_REGENERATEMANA) )//&& (hero_rangedweapon.cond_value[1] > 20)) //щиты
		{
			if(Npc_GetTalentSkill(slf,NPC_TALENT_SHIELD) == SHIELD_LEVEL_FIRST)
			{
				Mdl_ApplyOverlayMds(slf,"HUM_SHIELD2.MDS");
			};
		};*/
		If(Hlp_IsItem(hero_meleeweapon,ItMw_DS_Piratensaebel))
		{
			Mdl_ApplyOverlayMds(slf,"Hum_PirSab2.MDS");
		};
	};
	if (Npc_HasEquippedMeleeWeapon(slf))	{	//NS (24/02/14)
		if(hero_rangedweapon.weight == 3)	//Экипирован двумя клинками
		{
			if(Npc_GetTalentSkill(slf,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_FIRST)
			{
				Mdl_ApplyOverlayMds(slf,"Hum_2x2L2.MDS");
			}
			else if(Npc_GetTalentSkill(slf,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_SECOND)
			{
				Mdl_ApplyOverlayMds(slf,"Hum_2x2L3.MDS");
			};
		};
	};
	//Не помогает
	/*
	if(slf.aivar[AIV_ShieldEquipped])
	{
		Mdl_ApplyOverlayMds(slf,"HUM_SHIELD2.MDS");
	};
	*/
};

