var int thiefDex;
var int theft_victimDex;
const int ds_Divider_TheftFullProcent = 10;		//100%
const int ds_Multiplier_TheftLevel_First = 10;	//100%
const int ds_Multiplier_TheftLevel_Second = 7;	//70%
const int ds_Multiplier_TheftLevel_Third = 4;	//40%
//Все согласно таблицы ТР1.1 от LD3O
var string Theft_Description_Text;
var int Variant_DS_Description;
const int Variant_DS_Description_ORC = 1;
const int Variant_DS_Description_FEMALE = 2;
const int Variant_DS_Description_MALE_ORCMINE = 3;
const int Variant_DS_Description_MALE_MAIN = 4;
const int Variant_DS_Description_MALE_OTHER = 5;

func int C_DS_AssignTheftDialog(var C_NPC thief, var C_NPC theft_victim)
{
	if( (Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) > PICKPOCKET_LEVEL_NONE) 
	&& (theft_victim.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;		
	};
	return FALSE;
};
//*NS - шанс совершить кражу с поправкой на навык воровства
//по факту BaseChance - ловкость жертвы
func int C_DS_GetTheftChanceMultiplier(var C_NPC thief, var int BaseChance)
{
	if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_FIRST)
	{	
		return BaseChance * ds_Multiplier_TheftLevel_First / ds_Divider_TheftFullProcent;
	}
	else if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_SECOND)
	{
		return BaseChance * ds_Multiplier_TheftLevel_Second / ds_Divider_TheftFullProcent;
	}
	else if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_THIRD)
	{
		return BaseChance * ds_Multiplier_TheftLevel_Third / ds_Divider_TheftFullProcent;
	};
	return 0;
};
//*/
func int C_DS_LevelTheft_Chance(var C_NPC thief, var C_NPC theft_victim)
{
	thiefDex = thief.attribute[ATR_DEXTERITY];
	theft_victimDex = theft_victim.attribute[ATR_DEXTERITY];
	var int RandyChance;
	RandyChance = Hlp_Random(100);
	//---------------------------------------------------------------------------------------------------
	if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_FIRST)
	{	//ловкость ГГ > 100% ловкости жертвы
		if(thiefDex >= (theft_victimDex * ds_Multiplier_TheftLevel_First / ds_Divider_TheftFullProcent))
		{	return TRUE;};
	}
	else if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_SECOND)
	{	//ловкость ГГ > 70% ловкости жертвы
		if(thiefDex >= (theft_victimDex * ds_Multiplier_TheftLevel_Second / ds_Divider_TheftFullProcent))
		{	return TRUE;};
	}
	else if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_THIRD)
	{	//ловкость ГГ > 40% ловкости жертвы
		if(thiefDex >= (theft_victimDex * ds_Multiplier_TheftLevel_Third / ds_Divider_TheftFullProcent))
		{	return TRUE;};
	};
	return FALSE;
};
func int C_DS_LevelTheft_RandyChance(var C_NPC thief)
{
	var int RandyChance;
	RandyChance = Hlp_Random(100);
	//---------------------------------------------------------------------------------------------------
	if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_FIRST)
	{if(RandyChance < 20){return TRUE;};}
	else if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_SECOND)
	{if(RandyChance < 40){return TRUE;};}
	else if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_THIRD)
	{if(RandyChance < 60){return TRUE;};};
	return FALSE;
};
func int C_DS_TheftLevel(var C_NPC thief)
{	
	var int Multiplier;
	Multiplier = 1;
	if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_FIRST)
	{	Multiplier = 2;	}
	else if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_SECOND)
	{	Multiplier = 3;	}
	else if(Npc_GetTalentSkill(thief,NPC_TALENT_PICKPOCKET) == PICKPOCKET_LEVEL_THIRD)
	{	Multiplier = 4;	};
	return Multiplier;
};
const string Pickpocket_Apply = "(применить воровство)";
//Мужчины
const string Pickpocket_ds_20 = "(Нет ничего проще, чем украсть его кошелек.)";
const string Pickpocket_DS_40 = "(Украсть его кошелек будет довольно просто.)";
const string Pickpocket_ds_60 = "(Пытаться украсть его кошелек довольно рискованно.)";
const string Pickpocket_ds_80 = "(Украсть его кошелек будет довольно трудно.)";
const string Pickpocket_ds_100 = "(Украсть его кошелек будет чертовски трудно.)";
const string Pickpocket_ds_120 = "(Украсть его кошелек практически невозможно.)";
//Женщины
const string Pickpocket_ds_20_Female = "(Нет ничего проще, чем обворовать ее.)";
const string Pickpocket_ds_40_Female = "(Обворовать ее будет довольно просто.)";
const string Pickpocket_ds_60_Female = "(Пытаться обворовать ее довольно рискованно.)";
const string Pickpocket_ds_80_Female = "(Обворовать ее будет довольно трудно.)";
const string Pickpocket_ds_100_Female = "(Обворовать ее будет чертовски трудно.)";
const string Pickpocket_ds_120_Female = "(Обворовать ее практически невозможно.)";

func string C_DS_Theft_Description_Text(var C_NPC theft_victim)
{
	theft_victimDex = theft_victim.attribute[ATR_DEXTERITY];
	if(theft_victim.aivar[AIV_Gender] == FEMALE)
	{
		Variant_DS_Description = Variant_DS_Description_FEMALE;
		if(theft_victimDex <= 40)				{	Theft_Description_Text = Pickpocket_ds_20_Female;	}
		else if(theft_victimDex <= 60)	{	Theft_Description_Text = Pickpocket_ds_40_Female;	}
		else if(theft_victimDex <= 80)	{	Theft_Description_Text = Pickpocket_ds_60_Female;	}
		else if(theft_victimDex <= 100)	{	Theft_Description_Text = Pickpocket_ds_80_Female;	}
		else if(theft_victimDex <= 120)	{	Theft_Description_Text = Pickpocket_ds_100_Female;	}
		else if(theft_victimDex > 120)	{	Theft_Description_Text = Pickpocket_ds_120_Female;	};
	}
	else if(theft_victim.aivar[AIV_Gender] == MALE)
	{
		if(theft_victim.npcType == NpcType_main)
		{
			Variant_DS_Description = Variant_DS_Description_MALE_MAIN;
			if(theft_victimDex <= 40)				{	Theft_Description_Text = Pickpocket_ds_20;	}
			else if(theft_victimDex <= 60)	{	Theft_Description_Text = Pickpocket_ds_40;	}
			else if(theft_victimDex <= 80)	{	Theft_Description_Text = Pickpocket_ds_60;	}
			else if(theft_victimDex <= 100)	{	Theft_Description_Text = Pickpocket_ds_80;	}
			else if(theft_victimDex <= 120)	{	Theft_Description_Text = Pickpocket_ds_100;	}
			else if(theft_victimDex > 120)	{	Theft_Description_Text = Pickpocket_ds_120;	};
		}
		else
		{
			Variant_DS_Description = Variant_DS_Description_MALE_OTHER;
			if(theft_victimDex <= 40)				{	Theft_Description_Text = Pickpocket_ds_20;	}
			else if(theft_victimDex <= 60)	{	Theft_Description_Text = Pickpocket_ds_40;	}
			else if(theft_victimDex <= 80)	{	Theft_Description_Text = Pickpocket_ds_60;	}
			else if(theft_victimDex <= 100)	{	Theft_Description_Text = Pickpocket_ds_80;	}
			else if(theft_victimDex <= 120)	{	Theft_Description_Text = Pickpocket_ds_100;	}
			else if(theft_victimDex > 120)	{	Theft_Description_Text = Pickpocket_ds_120;	};
		};
	};
	return Theft_Description_Text;
};
//-------------------------***************----------------------------------------------------

instance DIA_Theft(C_Info)
{
	nr 			= 998;
	condition 	= dia_Theft_condition;
	information = dia_Theft_info;
	permanent 	= TRUE;
};
func int dia_Theft_condition()
{
	if(C_DS_AssignTheftDialog(other,self))
	{
		return TRUE;
	};
};
func void dia_Theft_info()
{
	Info_ClearChoices(DIA_Theft);
	Info_AddChoice(DIA_Theft,DIALOG_BACK,DIA_Theft_back);
	Info_AddChoice(DIA_Theft,Pickpocket_Apply,b_DS_Theft);	
};
func void DIA_Theft_back()
{
	Info_ClearChoices(DIA_Theft);
};
func void b_DS_Theft()
{
	var int Randy;
	Randy = Hlp_Random(6) + 1;
	if(C_DS_LevelTheft_Chance(other,self))
	{
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		var int randy_item;
		randy_item = Hlp_random(9);
		/*Доработаем*/
		/*
		if(self.guild == GIL_VLK)	//Любые Орки
		{
			//что даем?
			if(CURRENTLEVEL == ORCMINE_ZEN)
			{
				if(randy_item < 3)
				{		B_GiveInvItems(self,other,ItMi_Nugget,Randy*C_DS_TheftLevel(other));	}
				else if(randy_item < 5)
				{		B_GiveInvItems(self,other,ItMi_Gold,Randy*C_DS_TheftLevel(other));		}
				else if(randy_item < 7)
				{		B_GiveInvItems(self,other,ItFo_Wine,Randy*C_DS_TheftLevel(other) / 2);}
				else if(randy_item < 9)
				{		B_GiveInvItems(self,other,ItPo_Health_01,Randy*C_DS_TheftLevel(other) / 2);};
			}
			else
			{
				if(randy_item < 5)
				{B_GiveInvItems(self,other,ItMi_Gold,Randy*C_DS_TheftLevel(other));}
				else
				{B_GiveInvItems(self,other,ItPo_Health_01,Randy*C_DS_TheftLevel(other) / 2);};
				Snd_Play("Geldbeutel");
			};			
		}
		else //Люди: все из шахты или Мэйны 
		{
			//что даем? уж, наверно, руда
			if(CURRENTLEVEL == ORCMINE_ZEN)
			{
				if(randy_item < 3)
				{B_GiveInvItems(self,other,ItMi_Nugget,Randy*C_DS_TheftLevel(other));}
				else if(randy_item < 4)
				{B_GiveInvItems(self,other,ItFo_Bread,Randy*C_DS_TheftLevel(other));}
				else if(randy_item < 5)
				{B_GiveInvItems(self,other,ItFo_Water,Randy*C_DS_TheftLevel(other));}
				else if(randy_item < 6)
				{B_GiveInvItems(self,other,ItKE_lockpick,Randy*C_DS_TheftLevel(other));}
				else if(randy_item < 7)
				{B_GiveInvItems(self,other,ItPl_Mushroom_01,Randy*C_DS_TheftLevel(other));}
				else if(randy_item < 8)
				{B_GiveInvItems(self,other,ItPl_Mushroom_02,Randy*C_DS_TheftLevel(other));}
				else if(randy_item < 9)
				{B_GiveInvItems(self,other,ItFoMutton,Randy*C_DS_TheftLevel(other));};
			}
			else if(self.npcType == NpcType_main)
			{
				B_GiveInvItems(self,other,ItMi_Gold,Randy*C_DS_TheftLevel(other));
				Snd_Play("Geldbeutel");
			};
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Draks))
			{	B_GiveInvItem_red(self,other,ItPo_Perm_STR,1,40);		
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dorian))
			{	B_GiveInvItem_red(self,other,ItPo_Perm_DEX,1,40);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Timon))
			{	B_GiveInvItem_red(self,other,ItPo_Perm_Health,1,40);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_668_Gerard))
			{	B_GiveInvItem_red(self,other,ItPo_Perm_Mana,1,40);
			};
		};	
		*/
	}
	else if(C_DS_LevelTheft_RandyChance(other))
	{
		B_Say_Overlay(other,other,"$DONTKNOW");
		AI_PlayAni(other,"T_NO");
		Print("Мне повезло, что меня не заметили");
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};	
	AI_StopProcessInfos(self);
	Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
	AI_PlayAni(self,"T_SEARCH");
	AI_PlayAni(self,"T_PLUNDER");
};
func void B_DS_AssignTheftDialog(var C_NPC theft_victim)
{
	DIA_Theft.npc = theft_victim;
	DIA_Theft.description = C_DS_Theft_Description_Text(theft_victim);
};
func void B_DS_AssignTestDialog(var c_NPC slf, var C_NPC oth)
{
	hero_talent_1H = oth.aivar[REAL_TALENT_1H];
	hero_talent_2H = oth.aivar[REAL_TALENT_2H]; 
	hero_talent_bow = oth.aivar[REAL_TALENT_BOW];
	hero_talent_crossbow = oth.aivar[REAL_TALENT_CROSSBOW];		
};
