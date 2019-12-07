
func void B_SetFightSkills(var C_Npc slf,var int percent)
{
	B_RaiseFightTalent(slf,NPC_TALENT_1H,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_2H,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_BOW,percent);
	B_RaiseFightTalent(slf,NPC_TALENT_CROSSBOW,percent);
};

func void B_DS_SetFightSkills(var C_Npc slf,var int percent)
{
	slf.aivar[REAL_TALENT_1H] = percent;
	slf.aivar[REAL_TALENT_2H] = percent;
	slf.aivar[REAL_TALENT_BOW] = percent;
	slf.aivar[REAL_TALENT_CROSSBOW] = percent;
	slf.HitChance[NPC_TALENT_1H] = percent;
	slf.HitChance[NPC_TALENT_2H] = percent;
	slf.HitChance[NPC_TALENT_BOW] = percent;
	slf.HitChance[NPC_TALENT_CROSSBOW] = percent;
	if(slf.HitChance[NPC_TALENT_1H] >= 0)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_1H,0);	};
	if(slf.HitChance[NPC_TALENT_1H] >= 30)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_1H,1);	};
	if(slf.HitChance[NPC_TALENT_1H] >= 60)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_1H,2);	};
	
	if(slf.HitChance[NPC_TALENT_2H] >= 0)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_2H,0);	};
	if(slf.HitChance[NPC_TALENT_2H] >= 30)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_2H,1);	};
	if(slf.HitChance[NPC_TALENT_2H] >= 60)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_2H,2);	};
	
	if(slf.HitChance[NPC_TALENT_BOW] >= 0)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_BOW,0);	};
	if(slf.HitChance[NPC_TALENT_BOW] >= 30)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_BOW,1);	};
	if(slf.HitChance[NPC_TALENT_BOW] >= 60)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_BOW,2);	};
	
	if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 0)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,0);	};
	if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 30)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,1);	};
	if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{		Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,2);	};
};
