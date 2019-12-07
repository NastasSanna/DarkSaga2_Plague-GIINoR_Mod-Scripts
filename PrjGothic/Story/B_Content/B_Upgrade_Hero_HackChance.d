/*
func void B_Upgrade_Hero_HackChance(var int Wert)
{
	var string concatText;
	concatText = ConcatStrings(PRINT_ADDON_HACKCHANCE,IntToString(Wert));
	concatText = ConcatStrings(concatText,")");
	PrintScreen(concatText,-1,34,FONT_ScreenSmall,2);
	Hero_HackChance = Hero_HackChance + Wert;
	Snd_Play("Geldbeutel");
};
*/
func void b_upgrade_hero_magicorehackchance(var int procent)
{
	var string concatText;
	concatText = ConcatStrings(PRINT_ADDON_HACKCHANCE,IntToString(procent));
	concatText = ConcatStrings(concatText,")");
	PrintScreen(concatText,-1,20,FONT_Screen,4);
	HERO_MAGICOREHACKCHANCE = HERO_MAGICOREHACKCHANCE + procent;
	Snd_Play("Geldbeutel");
	if(HERO_MAGICOREHACKCHANCE < 25)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_PICKORE,0);
	};
	if(HERO_MAGICOREHACKCHANCE >= 25)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_PICKORE,1);
	};
	if(HERO_MAGICOREHACKCHANCE >= 40)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_PICKORE,2);
	};
	if(HERO_MAGICOREHACKCHANCE >= 60)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_PICKORE,3);
	};
	if(HERO_MAGICOREHACKCHANCE >= 80)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_PICKORE,4);
	};
	if(HERO_MAGICOREHACKCHANCE >= 90)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_PICKORE,5);
	};
	Npc_SetTalentSkill(hero,NPC_TALENT_C,HERO_MAGICOREHACKCHANCE);
};

