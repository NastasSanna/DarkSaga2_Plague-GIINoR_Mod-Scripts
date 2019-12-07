func void DRINKMAGICSPRING_s1()
{
  var C_Npc her;
  her = Hlp_GetNpc(PC_Hero);
  if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
  {
    self.aivar[AIV_INVINCIBLE] = TRUE;
    PLAYER_MOBSI_PRODUCTION = MOBSI_DRINKMAGICSPRING;
    AI_ProcessInfos(hero);
  };
};
 
instance PC_drinkmagicspring_Drink(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_drinkmagicspring_Drink_Condition;
	information = PC_drinkmagicspring_Drink_Info;
	permanent = TRUE;
	description = "ќсв€тить ядовитое зелье.";
};
func int PC_drinkmagicspring_Drink_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_DRINKMAGICSPRING)
	{
		return TRUE;
	};
};
func void PC_drinkmagicspring_Drink_Info()
{
	//CreateInvItems(hero,ItPo_PotionPoison_02_Mis,1);
	AI_PrintScreen("«елье осв€щено!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	b_endproductiondialog();
};

instance PC_drinkmagicspring_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_drinkmagicspring_End_Condition;
	information = PC_drinkmagicspring_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int PC_drinkmagicspring_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_DRINKMAGICSPRING)
	{
		return TRUE;
	};
};
func void PC_drinkmagicspring_End_Info()
{
	//CreateInvItems(hero,ItPo_PotionPoison_01_Mis,1);
	b_endproductiondialog();
};
