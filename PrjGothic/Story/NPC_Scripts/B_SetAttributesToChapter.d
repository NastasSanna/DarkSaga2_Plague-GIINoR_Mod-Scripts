
func void B_SetAttributesToChapter(var C_Npc slf,var int kap)
{
	Npc_SetTalentSkill(slf,NPC_TALENT_MAGE,6);
	if(kap == 0)
	{
		slf.level = 3;
		slf.attribute[ATR_STRENGTH] = 20;
		slf.aivar[REAL_STRENGTH] = 20;
		slf.attribute[ATR_DEXTERITY] = 20;
		slf.aivar[REAL_DEXTERITY] = 20;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 60;
		slf.attribute[ATR_HITPOINTS] = 60;
	};
	if(kap == 1)
	{
		slf.level = 10;
		slf.attribute[ATR_STRENGTH] = 50;
		slf.aivar[REAL_STRENGTH] = 50;
		slf.attribute[ATR_DEXTERITY] = 50;
		slf.aivar[REAL_DEXTERITY] = 50;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 160;
		slf.attribute[ATR_HITPOINTS] = 160;
	};
	if(kap == 2)
	{
		slf.level = 20;
		slf.attribute[ATR_STRENGTH] = 90;
		slf.aivar[REAL_STRENGTH] = 90;
		slf.attribute[ATR_DEXTERITY] = 90;
		slf.aivar[REAL_DEXTERITY] = 90;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 280;
		slf.attribute[ATR_HITPOINTS] = 280;
	};
	if(kap == 3)
	{
		slf.level = 30;
		slf.attribute[ATR_STRENGTH] = 125;
		slf.aivar[REAL_STRENGTH] = 125;
		slf.attribute[ATR_DEXTERITY] = 125;
		slf.aivar[REAL_DEXTERITY] = 125;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 440;
		slf.attribute[ATR_HITPOINTS] = 440;
	};
	if(kap == 4)
	{
		slf.level = 40;
		slf.attribute[ATR_STRENGTH] = 160;
		slf.aivar[REAL_STRENGTH] = 160;
		slf.attribute[ATR_DEXTERITY] = 160;
		slf.aivar[REAL_DEXTERITY] = 160;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 620;
		slf.attribute[ATR_HITPOINTS] = 620;
	};
	if(kap == 5)
	{
		slf.level = 50;
		slf.attribute[ATR_STRENGTH] = 200;
		slf.aivar[REAL_STRENGTH] = 200;
		slf.attribute[ATR_DEXTERITY] = 200;
		slf.aivar[REAL_DEXTERITY] = 200;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 800;
		slf.attribute[ATR_HITPOINTS] = 800;
	};
	if(kap == 6)
	{
		slf.level = 55;
		slf.attribute[ATR_STRENGTH] = 245;
		slf.aivar[REAL_STRENGTH] = 245;
		slf.attribute[ATR_DEXTERITY] = 245;
		slf.aivar[REAL_DEXTERITY] = 245;
		slf.attribute[ATR_MANA_MAX] = 1000;
		slf.aivar[REAL_MANA_MAX] = 1000;
		slf.attribute[ATR_MANA] = 1000;
		slf.attribute[ATR_HITPOINTS_MAX] = 960;
		slf.attribute[ATR_HITPOINTS] = 960;
	};
	if(kap >= 7)
	{
		slf.level = 60;
		slf.attribute[ATR_STRENGTH] = 280;
		slf.aivar[REAL_STRENGTH] = 280;
		slf.attribute[ATR_DEXTERITY] = 280;
		slf.aivar[REAL_DEXTERITY] = 280;
		slf.attribute[ATR_MANA_MAX] = 1500;
		slf.aivar[REAL_MANA_MAX] = 1500;
		slf.attribute[ATR_MANA] = 1500;
		slf.attribute[ATR_HITPOINTS_MAX] = 1560;
		slf.attribute[ATR_HITPOINTS] = 1560;
	};
	slf.exp = 500 * ((slf.level + 1) / 2) * (slf.level + 1);
	slf.exp_next = 500 * ((slf.level + 2) / 2) * (slf.level + 1);
	//Добавлено по сложности.
	slf.attribute[ATR_STRENGTH] = slf.attribute[ATR_STRENGTH] + slf.attribute[ATR_STRENGTH]*ComplexityLevel_Procent/100;
	slf.aivar[REAL_STRENGTH] = slf.aivar[REAL_STRENGTH] + slf.aivar[REAL_STRENGTH]*ComplexityLevel_Procent/100;
	slf.attribute[ATR_DEXTERITY] = slf.attribute[ATR_DEXTERITY] + slf.attribute[ATR_DEXTERITY]*ComplexityLevel_Procent/100;
	slf.aivar[REAL_DEXTERITY] = slf.aivar[REAL_DEXTERITY] + slf.aivar[REAL_DEXTERITY]*ComplexityLevel_Procent/100;
	slf.attribute[ATR_MANA_MAX] = slf.attribute[ATR_MANA_MAX] + slf.attribute[ATR_MANA_MAX]*ComplexityLevel_Procent/100;
	slf.aivar[REAL_MANA_MAX] = slf.aivar[REAL_MANA_MAX] + slf.aivar[REAL_MANA_MAX]*ComplexityLevel_Procent/100;
	slf.attribute[ATR_MANA] = slf.attribute[ATR_MANA] + slf.attribute[ATR_MANA]*ComplexityLevel_Procent/100;
	slf.attribute[ATR_HITPOINTS_MAX] = slf.attribute[ATR_HITPOINTS_MAX] + slf.attribute[ATR_HITPOINTS_MAX]*ComplexityLevel_Procent/100;
	slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS] + slf.attribute[ATR_HITPOINTS]*ComplexityLevel_Procent/100;
};

