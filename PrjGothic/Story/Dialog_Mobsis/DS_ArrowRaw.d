
func void DS_ARROWRAW_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_ARROWRAW;
		if((Weapon_Ds_Arrow == True) || (Weapon_Ds_Bolt == True))
		{
			AI_ProcessInfos(hero);
		}
		else
		{
			B_Say_Overlay(hero,hero,"$DONTKNOW");
			PrintScreen("Я не знаю, что мне с этим делать",-1,-1,FONT_ScreenSmall,3);
			b_endproductiondialog();
		};
	};
};

instance PC_ARROWRAW_End(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 999;
	condition 	= PC_ARROWRAW_End_Condition;
	information = PC_ARROWRAW_End_Info;
	permanent 	= TRUE;
	description = Dialog_Ende;
};
func int PC_ARROWRAW_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_ARROWRAW)
	{
		return TRUE;
	};
};
func void PC_ARROWRAW_End_Info()
{
	b_endproductiondialog();
};
//***************-----------------------------------------
const int ds_raw_arrow = 1;
const int ds_raw_bolt = 2;

func void b_ArrowRaw_arrow_choice()
{
	Info_ClearChoices(PC_ArrowRaw);
	Info_AddChoice(PC_ArrowRaw,Dialog_Back,PC_ArrowRaw_Back);
	if(Npc_HasItems(hero,ItMi_WoodRaw) > 0)
	{
		Info_AddChoice(PC_ArrowRaw,"(обработать всю имеющуюся древесину)",PC_ArrowRaw_All);
		Info_AddChoice(PC_ArrowRaw,"(10 штук)",PC_ArrowRaw_10);
	};	
	if(Npc_HasItems(hero,ItMi_WoodRaw) >= 10)
	{
		Info_AddChoice(PC_ArrowRaw,"(100 штук)",PC_ArrowRaw_100);
	};	
};
//---------------------------------------------------------------
//------------------Древки для стрел
//---------------------------------------------------------------
instance PC_ArrowRaw(C_Info)
{
	npc 				= PC_Hero;
	condition 	= PC_ArrowRaw_Condition;
	information = PC_ArrowRaw_Info;
	permanent 	= TRUE;
	description = "Изготовить древки для стрел.";
};
func int PC_ArrowRaw_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ARROWRAW) && (Weapon_Ds_Arrow == True))
	{
		return TRUE;
	};
};
func void PC_ArrowRaw_Info()
{
  if(!Npc_HasItems(hero,ItMi_WoodRaw))
	{
		Print(PRINT_DS_WoodRawItemsMissing);
		b_endproductiondialog();
	}
	else
	{
		b_ArrowRaw_arrow_choice();
	};
};
func void PC_ArrowRaw_Back()
{
	Info_ClearChoices(PC_ArrowRaw);
};
func void PC_ArrowRaw_10()
{
	Npc_RemoveInvItem(hero,ItMi_WoodRaw);
	CreateInvItems(hero,ItMi_ArrowRaw,10);
	Print(PRINT_DS_ArrowRaw_ArrowSuccess);
	b_ArrowRaw_arrow_choice();
};
func void PC_ArrowRaw_100()
{
	Npc_RemoveInvItems(hero,ItMi_WoodRaw,5);
	CreateInvItems(hero,ItMi_ArrowRaw,50);
	Print(PRINT_DS_ArrowRaw_ArrowSuccess);
	b_ArrowRaw_arrow_choice();
};
func void PC_ArrowRaw_All()
{
	var int amount_woodraw;
	amount_woodraw = Npc_HasItems(hero,ItMi_WoodRaw);
	Npc_RemoveInvItems(hero,ItMi_WoodRaw,amount_woodraw);
	CreateInvItems(hero,ItMi_ArrowRaw,amount_woodraw*10);
	Print(PRINT_DS_ArrowRaw_ArrowSuccess);
	b_ArrowRaw_arrow_choice();
};
//---------------------------------------------------------------
//------------------Древки для болтов
//---------------------------------------------------------------
func void b_BoltRaw_Bolt_choice()
{
	Info_ClearChoices(PC_BoltRaw);
	Info_AddChoice(PC_BoltRaw,Dialog_Back,PC_BoltRaw_Back);
	if(Npc_HasItems(hero,ItMi_WoodRaw) > 0)
	{
		Info_AddChoice(PC_BoltRaw,"(обработать всю имеющуюся древесину)",PC_BoltRaw_All);
		Info_AddChoice(PC_BoltRaw,"(10 штук)",PC_BoltRaw_10);
	};	
	if(Npc_HasItems(hero,ItMi_WoodRaw) >= 10)
	{
		Info_AddChoice(PC_BoltRaw,"(100 штук)",PC_BoltRaw_100);
	};	
};

instance PC_BoltRaw(C_Info)
{
	npc 				= PC_Hero;
	condition 	= PC_BoltRaw_Condition;
	information = PC_BoltRaw_Info;
	permanent 	= TRUE;
	description = "Изготовить древки для болтов.";
};
func int PC_BoltRaw_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ARROWRAW) && (Weapon_Ds_Bolt == True))
	{
		return TRUE;
	};
};
func void PC_BoltRaw_Info()
{
  if(!Npc_HasItems(hero,ItMi_WoodRaw))
	{
		Print(PRINT_DS_WoodRawItemsMissing);
		b_endproductiondialog();
	}
	else
	{
		b_BoltRaw_Bolt_choice();
	};
};
func void PC_BoltRaw_Back()
{
	Info_ClearChoices(PC_BoltRaw);
};
func void PC_BoltRaw_10()
{
	Npc_RemoveInvItem(hero,ItMi_WoodRaw);
	CreateInvItems(hero,ItMi_BoltRaw,10);
	Print(PRINT_DS_ArrowRaw_BoltSuccess);
	b_BoltRaw_Bolt_choice();
};
func void PC_BoltRaw_100()
{
	Npc_RemoveInvItems(hero,ItMi_WoodRaw,5);
	CreateInvItems(hero,ItMi_BoltRaw,50);
	Print(PRINT_DS_ArrowRaw_BoltSuccess);
	b_BoltRaw_Bolt_choice();
};
func void PC_BoltRaw_All()
{
	var int amount_woodraw;
	amount_woodraw = Npc_HasItems(hero,ItMi_WoodRaw);
	Npc_RemoveInvItems(hero,ItMi_WoodRaw,amount_woodraw);
	CreateInvItems(hero,ItMi_BoltRaw,amount_woodraw*10);
	Print(PRINT_DS_ArrowRaw_BoltSuccess);
	b_BoltRaw_Bolt_choice();
};
