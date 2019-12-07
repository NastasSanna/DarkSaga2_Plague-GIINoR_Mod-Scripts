func void b_drinkBloodOfGhoul()
{
	if(Npc_HasItems(hero,ItPo_DS_GhoulGlass300) || Npc_HasItems(hero,ItPo_DS_GhoulGlass350))
	{
		PrintScreen("Склянка упыря опустошена.",-1,15,FONT_Screen,1);
		if(Npc_HasItems(hero,ItPo_DS_GhoulGlass300) == 1)
		{
			Npc_RemoveInvItems(hero,ItPo_DS_GhoulGlass300,1);
			CreateInvItems(hero,ItPo_DS_GhoulGlass,1);
		} 
		else if(Npc_HasItems(hero,ItPo_DS_GhoulGlass350) == 1)
		{
			Npc_RemoveInvItems(hero,ItPo_DS_GhoulGlass350,1);
			CreateInvItems(hero,ItPo_DS_GhoulGlass50,1);
		};
	} 
	else
	{
		Wld_PlayEffect("spellFX_SuckEnergy_BloodFly",hero,hero,0,0,0,FALSE);	
		Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
		if(hero.attribute[ATR_HITPOINTS] <= 50)
		{
			b_endproductiondialog();
			DS_drinkBloodOfGhoul_havedrankGG = true;
			//	AI_PlayAni(hero,"T_DEAD");
			//	Npc_ChangeAttribute(hero,ATR_HITPOINTS,hero,atr[ATR_HITPOINTS_MAX]);
			//	hero.attribute[ATR_HITPOINTS] = 0;
			//	AI_StartState(self,ZS_Dead,0,"");
		}
		else
		{
			hero.attribute[ATR_HITPOINTS_MAX] -= 50;
			hero.attribute[ATR_HITPOINTS] -= 50;
			PrintScreen("Ваше здоровье значительно ухудшилось.",-1,15,FONT_Screen,1);
		};
	};
};
func void teleportsagaworld_s1()
{
  var C_Npc her;
  her = Hlp_GetNpc(PC_Hero);
  if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
  {
    self.aivar[AIV_INVINCIBLE] = TRUE;
    PLAYER_MOBSI_PRODUCTION = MOBSI_teleportsagaworld;
    AI_ProcessInfos(hero);
  };
};

instance PC_teleportsagaworld_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_teleportsagaworld_End_Condition;
	information = PC_teleportsagaworld_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int PC_teleportsagaworld_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_teleportsagaworld)
	{
		return TRUE;
	};
};
func void PC_teleportsagaworld_End_Info()
{
	b_endproductiondialog();
};
