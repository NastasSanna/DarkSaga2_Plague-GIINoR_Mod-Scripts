//****************************************************************************
//**************************Кузнечное дело************************************
//****************************************************************************

//-----------------Прад (рабы)-----------------------------
const int Condition_ds_Stick_01 = 15;
const int Damage_ds_Stick_01 = 20;
const int Value_ds_Stick_01 = 55;
const int Bonus_ds_Stick_01 = 5;

instance ItMW_Ds_Stick_01(C_Item)	//Палка с шипами
{
	name 				= "Палка с шипами";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_AXE;
	material 		= MAT_WOOD;
	value 			= Value_ds_Stick_01;
	damageTotal = Damage_ds_Stick_01;
	damagetype 	= DAM_BLUNT;
	range 			= 60;
	on_equip 		= equip_ds_Stick_01;
	on_unequip 	= unequip_ds_Stick_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_Stick_01;
	visual 			= "ItMw_012_1h_Nailmace_01.3DS";
	description = name;
	text[2] 		= NAME_Damage;
	count[2] 		= damageTotal;
	text[3] 		= NAME_Str_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= Bonus_ds_Stick_01;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_Stick_01()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_ds_Stick_01);	};
};
func void unequip_ds_Stick_01()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_ds_Stick_01);	};
};

const int Condition_ds_ToothWolf = 15;
const int Damage_ds_ToothWolf = 25;
const int Value_ds_ToothWolf = 150;
const int Bonus_ds_ToothWolf = 5;

instance ItMW_Ds_ToothWolf(C_Item)	//Зуб волка
{
	name 				= "Зуб волка";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_SWD;
	material 		= MAT_METAL;
	value 			= Value_ds_ToothWolf;
	damageTotal = Damage_ds_ToothWolf;
	damagetype 	= DAM_EDGE;
	range 			= 30;
	on_equip 		= equip_ds_ToothWolf;
	on_unequip 	= unequip_ds_ToothWolf;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_ToothWolf;
	visual 			= "ItMw_012_1H_Knife_02.3DS";
	description = name;
	text[2] 		= NAME_Damage;
	count[2] 		= damageTotal;
	text[3] 		= NAME_Str_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= Bonus_ds_ToothWolf;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_ToothWolf()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_ds_ToothWolf);	};
};
func void unequip_ds_ToothWolf()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_ds_ToothWolf);	};
};

const int Damage_ds_BloodSword = 35;
const int Condition_ds_BloodSword = 20;
const int Value_ds_BloodSword = 200;
const int Bonus_ds_BloodSword = 5;

instance ItMW_Ds_BloodSword(C_Item)	//Кровопускатель
{
	name 				= "Кровопускатель";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_SWD;
	material 		= MAT_METAL;
	value 			= Value_ds_BloodSword;
	damageTotal = Damage_ds_BloodSword;
	damagetype 	= DAM_EDGE;
	range 			= 50;
	on_equip 		= equip_ds_BloodSword;
	on_unequip 	= unequip_ds_BloodSword;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_BloodSword;
	visual 			= "ItMw_010_1H_Sword_Short_01.3DS";
	description = name;
	text[2] 		= NAME_Damage;
	count[2] 		= damageTotal;
	text[3] 		= NAME_Str_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= Bonus_ds_BloodSword;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};

func void equip_ds_BloodSword()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_ds_BloodSword);	};
};
func void unequip_ds_BloodSword()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_ds_BloodSword);	};
};

//----------------------------Тобиас (охотники)------------------------------
const int Damage_ds_Star = 75;
const int Condition_ds_Star = 60;
const int Value_ds_Star = 550;
const int Bonus_Star = 5;

instance ItMW_Ds_Star(C_Item)	//Звезда
{
	name 				= "Звезда";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_SWD;
	material 		= MAT_METAL;
	value 			= Value_ds_Star;
	damageTotal = Damage_ds_Star;
	damagetype 	= DAM_EDGE;
	range 			= Range_ShortSword2;
	on_equip 		= equip_ds_Star;
	on_unequip 	= unequip_ds_Star;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_Star;
	visual 			= "ItMw_040_2h_PAL_Sword_03.3DS";
	description = name;
	text[2] 		= NAME_Damage;
	count[2] 		= damageTotal;
	text[3] 		= NAME_Str_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= Bonus_Star;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_Star()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_Star);	};
};
func void unequip_ds_Star()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_Star);	};
};

const int Damage_ds_Subjugator = 85;
const int Condition_ds_Subjugator = 70;
const int Value_ds_Subjugator = 650;
const int Bonus_Subjugator = 5;

instance ItMW_Ds_Subjugator(C_Item)	//Покоритель
{
	name = "Покоритель";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = Value_ds_Subjugator;
	damageTotal = Damage_ds_Subjugator;
	damagetype = DAM_EDGE;
	range = 110;
	on_equip = equip_ds_Subjugator;
	on_unequip = unequip_ds_Subjugator;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_Subjugator;
	visual = "ItMw_ds_sword_07.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Bonus_Subjugator;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_Subjugator()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_Subjugator);	};
};
func void unequip_ds_Subjugator()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_Subjugator);	};
};

const int Damage_ds_Punishment = 120;
const int Condition_ds_Punishment = 115;
const int Value_ds_Punishment = 1200;
const int Bonus_Punishment = 6;
// урон магией ++++++++++++ +10
instance ItMW_Ds_Punishment(C_Item)	//Возмездие
{
	name = "Возмездие";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_ds_Punishment;
	damageTotal = Damage_ds_Punishment;
	damagetype = DAM_EDGE;
	range = 130;
	on_equip = equip_ds_Punishment;
	on_unequip = unequip_ds_Punishment;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_Punishment;
	visual = "ItMw_075_2h_sword_heavy_03.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dam_Magic;
	count[2] = 10; 
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Bonus_Punishment;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_Punishment()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_Punishment);	};
};
func void unequip_ds_Punishment()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_Punishment);	};
};

const int Damage_ds_Destruction = 140;
const int Condition_ds_Destruction = 140;
const int Value_ds_Destruction = 3000;
const int Bonus_Destruction = 10;
// урон магией ++++++++++++ +20
instance ItMW_Ds_Destruction(C_Item)	//Крушитель
{
	name = "Крушитель";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = Value_ds_Destruction;
	damageTotal = Damage_ds_Destruction;
	damagetype = DAM_BLUNT;
	range = 110;
	on_equip = equip_ds_Destruction;
	on_unequip = unequip_ds_Destruction;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_Destruction;
	visual = "ItMw_065_2H_WarHammer_04_new.3DS";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Dam_Magic;
	count[2] = 20; 
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = Bonus_Destruction;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_Destruction()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_Destruction);
	};
};
func void unequip_ds_Destruction()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_Destruction);
	};
};

const int Damage_ds_KillOrks = 65;
const int Condition_ds_KillOrks = 40;
const int Value_ds_KillOrks = 400;
const int Bonus_KillOrks = 10;
// урон оркам ++++++++++++
instance ItMW_Ds_KillOrks(C_Item)	//Убийца орков
{
	name 				= "Убийца орков";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_AXE;
	material 		= MAT_METAL;
	value 			= Value_ds_KillOrks;
	damageTotal = Damage_ds_KillOrks;
	damagetype 	= DAM_BLUNT;
	range 			= 50;
	on_equip 		= equip_ds_KillOrks;
	on_unequip 	= unequip_ds_KillOrks;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_KillOrks;
	visual 			= "ItMw_050_1H_Mace_War_03.3DS";
	description = name;
	text[1] 		= NAME_Damage;
	count[1] 		= damageTotal;
	text[2] = "Дополнительный урон оркам";
	count[2] = 10; 
	text[3] 		= NAME_Str_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= Bonus_KillOrks;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_KillOrks()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_KillOrks);
	};
};
func void unequip_ds_KillOrks()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_KillOrks);
	};
};
//----------------------------------------------------------
//----------------Ганс (пираты)---------------------------
const int Damage_ds_RevengePirates = 65;
const int Condition_ds_RevengePirates = 40;
const int Value_ds_RevengePirates = 450;
const int Bonus_RevengePirates = 10;

instance ItMW_Ds_RevengePirates(C_Item)	//Месть пирата
{
	name 				= "Месть пирата";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_SWD;
	material 		= MAT_METAL;
	value 			= Value_ds_RevengePirates;
	damageTotal = Damage_ds_RevengePirates;
	damagetype 	= DAM_EDGE;
	range 			= Range_ShortSword2;
	on_equip 		= equip_ds_RevengePirates;
	on_unequip 	= unequip_ds_RevengePirates;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ds_RevengePirates;
	visual 			= "ItMw_030_1h_sword_03.3DS";
	description = name;
	text[2] 		= NAME_Damage;
	count[2] 		= damageTotal;
	text[3] 		= NAME_Dex_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= Bonus_RevengePirates;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_RevengePirates()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_RevengePirates);
	};
};
func void unequip_ds_RevengePirates()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_RevengePirates);
	};
};

const int Damage_ds_SwordMaster = 70;
const int Condition_ds_SwordMaster = 45;
const int Value_ds_SwordMaster = 500;
const int Bonus_SwordMaster = 10;

instance ItMW_Ds_SwordMaster(C_Item)	//Клинок мастера
{
	name 				= "Клинок мастера";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_SWD;
	material 		= MAT_METAL;
	value 			= Value_ds_SwordMaster;
	damageTotal = Damage_ds_SwordMaster;
	damagetype 	= DAM_EDGE;
	range 			= 105;
	on_equip 		= equip_ds_SwordMaster;
	on_unequip 	= unequip_ds_SwordMaster;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ds_SwordMaster;
	visual 			= "ItMw_ds_sword_04.3DS";
	description = name;
	text[2] 		= NAME_Damage;
	count[2] 		= damageTotal;
	text[3] 		= NAME_Dex_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= Bonus_SwordMaster;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_SwordMaster()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_SwordMaster);
	};
};
func void unequip_ds_SwordMaster()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_SwordMaster);
	};
};

const int Damage_ds_Volnorez = 90;
const int Condition_ds_Volnorez = 75;
const int Value_ds_Volnorez = 700;
const int Bonus_Volnorez = 5;

instance ItMW_Ds_Volnorez(C_Item)	//Волнорез
{
	name 				= "Волнорез";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_2HD_SWD;
	material 		= MAT_METAL;
	value 			= Value_ds_Volnorez;
	damageTotal = Damage_ds_Volnorez;
	damagetype 	= DAM_EDGE;
	range 			= 135;
	on_equip 		= equip_ds_Volnorez;
	on_unequip 	= unequip_ds_Volnorez;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_Volnorez;
	visual 			= "ItMw_2H_Machete_02.3DS";
	description = name;
	text[2] 		= NAME_Damage;
	count[2] 		= damageTotal;
	text[3] 		= NAME_Str_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= Bonus_Volnorez;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_Volnorez()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_Volnorez);
	};
};
func void unequip_ds_Volnorez()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_Volnorez);
	};
};

const int Damage_ds_KillZombie = 80;
const int Condition_ds_KillZombie = 65;
const int Value_ds_KillZombie = 600;
const int Bonus_KillZombie = 5;

instance ItMW_Ds_KillZombie(C_Item)	//Убийца нежити
{
	name 				= "Убийца нежити";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_AXE;
	material 		= MAT_METAL;
	value 			= Value_ds_KillZombie;
	damageTotal = Damage_ds_KillZombie;
	damagetype 	= DAM_BLUNT;
	range 			= 55;
	on_equip 		= equip_ds_KillZombie;
	on_unequip 	= unequip_ds_KillZombie;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_KillZombie;
	visual 			= "ItMw_060_1H_Mace_War_04.3DS";
	description = name;
	text[1] 		= NAME_Damage;
	count[1] 		= damageTotal;
	text[2] = "Дополнительный урон нежити";
	count[2] = 20; 
	text[3] 		= NAME_Str_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_1H;
	count[4] 		= Bonus_KillZombie;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_KillZombie()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,Bonus_KillZombie);
	};
};
func void unequip_ds_KillZombie()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-Bonus_KillZombie);
	};
};

//-------------------
//---------Пак (орки)
func void S_Topor_ds_Orks_01()
{
  if(Npc_IsPlayer(self))
  {
		If(Npc_GetTalentSkill(self,NPC_TALENT_ORCWEAPON) == ORCWEAPON_LEVEL_SECOND)
		{
			Mdl_ApplyOverlayMds(self,"HUMANS_O2hL2.MDS");
    }
	  else if(Npc_GetTalentSkill(self,NPC_TALENT_ORCWEAPON) == ORCWEAPON_LEVEL_FIRST)
	  {
			Mdl_ApplyOverlayMds(self,"Humans_O2h.MDS");
    }
	  else if(Npc_GetTalentSkill(self,NPC_TALENT_ORCWEAPON) == ORCWEAPON_LEVEL_NONE)
	  {
			Print("Недостаточно навыков");
			AI_UnequipWeapons(self);	
			//Пока идет анэквип, потом снять коммент на оверлей и повесить коммент на анэквип.
			//Mdl_ApplyOverlayMds(self,"Humans_O2hNo.MDS");
    };
	};	
};

func void S_Topor_ds_Orks_02()
{
  if(Npc_IsPlayer(self))
  {
		If(Npc_GetTalentSkill(self,NPC_TALENT_ORCWEAPON) == ORCWEAPON_LEVEL_SECOND)
		{
			Mdl_RemoveOverlayMds(self,"HUMANS_O2h.MDS");
			Mdl_RemoveOverlayMds(self,"HUMANS_O2hL2.MDS");	
		}
	  else if(Npc_GetTalentSkill(self,NPC_TALENT_ORCWEAPON) == ORCWEAPON_LEVEL_FIRST)
	  {
			Mdl_RemoveOverlayMds(self,"HUMANS_O2h.MDS");
			Mdl_RemoveOverlayMds(self,"HUMANS_O2hL2.MDS");
	  };	
	};	
};

const int Damage_ds_KrashAgar = 95;
const int Condition_ds_KrashAgar = 80;
const int Value_ds_KrashAgar = 750;
const int Bonus_KrashAgar = 5;

instance ItMW_Ds_KrashAgar(C_Item)
{
	name 				= "Краш Агар";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_2HD_AXE;
	material 		= MAT_METAL;
	value 			= Value_ds_KrashAgar;
	damageTotal = Damage_ds_KrashAgar;
	damagetype 	= DAM_EDGE;
	range 			= Range_Orkaxt_03;
	on_equip 		= equip_ds_KrashAgar;
	on_unequip 	= unequip_ds_KrashAgar;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_KrashAgar;
	visual 			= "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[1] 		= NAME_Damage;
	count[1] 		= damageTotal;
	text[2] 		= NAME_Str_needed;
	count[2] 		= cond_value[2];
	text[3] 		= NAME_ADDON_BONUS_2H;
	count[3] 		= Bonus_KrashAgar;
	text[4] 		= NAME_TalentOrcWeapon_needed;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_KrashAgar()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_KrashAgar);
	};
	S_Topor_ds_Orks_01();
};
func void unequip_ds_KrashAgar()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_KrashAgar);
	};
	S_Topor_ds_Orks_02();
};

const int Damage_ds_KrashDargot = 100;
const int Condition_ds_KrashDargot = 85;
const int Value_ds_KrashDargot = 800;
const int Bonus_KrashDargot = 5;

instance ItMW_Ds_KrashDargot(C_Item)	//Краш Даргот
{
	name 				= "Краш Даргот";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_2HD_AXE;
	material 		= MAT_METAL;
	value 			= Value_ds_KrashDargot;
	damageTotal = Damage_ds_KrashDargot;
	damagetype 	= DAM_EDGE;
	range 			= Range_Orkaxt_04;
	on_equip 		= equip_ds_KrashDargot;
	on_unequip 	= unequip_ds_KrashDargot;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_KrashDargot;
	visual 			= "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[1] 		= NAME_Damage;
	count[1] 		= damageTotal;
	text[2] 		= NAME_Str_needed;
	count[2] 		= cond_value[2];
	text[3] 		= NAME_ADDON_BONUS_2H;
	count[3] 		= Bonus_KrashAgar;
	text[4] 		= NAME_TalentOrcWeapon_needed;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_KrashDargot()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_KrashDargot);
	};
	S_Topor_ds_Orks_01();
};
func void unequip_ds_KrashDargot()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_KrashDargot);
	};
	S_Topor_ds_Orks_02();
};
//
const int Damage_ds_AngerOrk = 110;
const int Condition_ds_AngerOrk = 95;
const int Value_ds_AngerOrk = 900;
const int Bonus_AngerOrk = 5;

instance ItMW_Ds_AngerOrk(C_Item)	//Гнев орка
{
	name 				= "Гнев орка";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_2HD_AXE;
	material 		= MAT_METAL;
	value 			= Value_ds_AngerOrk;
	damageTotal = Damage_ds_AngerOrk;
	damagetype 	= DAM_EDGE;
	range 			= Range_Orkaxt_03;
	on_equip 		= equip_ds_AngerOrk;
	on_unequip 	= unequip_ds_AngerOrk;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_AngerOrk;
	visual 			= "ItMw_DS_OrcAxe_02.3DS";
	description = name;
	text[1] 		= NAME_Damage;
	count[1] 		= damageTotal;
	text[2] 		= NAME_Str_needed;
	count[2] 		= cond_value[2];
	text[3] 		= NAME_ADDON_BONUS_2H;
	count[3] 		= Bonus_AngerOrk;
	text[4] 		= NAME_TalentOrcWeapon_needed;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_AngerOrk()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_AngerOrk);
	};
	S_Topor_ds_Orks_01();
};
func void unequip_ds_AngerOrk()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_AngerOrk);
	};
	S_Topor_ds_Orks_02();
};
//
const int Damage_ds_OkoBeliar = 130;
const int Condition_ds_OkoBeliar = 130;
const int Value_ds_OkoBeliar = 2500;
const int Bonus_OkoBeliar = 7;

instance ItMW_Ds_OkoBeliar(C_Item)	//Око Белиара
{
	name 				= "Око Белиара";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_2HD_AXE;
	material 		= MAT_METAL;
	value 			= Value_ds_OkoBeliar;
	damageTotal = Damage_ds_OkoBeliar;
	damagetype 	= DAM_EDGE;
	range 			= Range_Orkaxt_03;
	on_equip 		= equip_ds_OkoBeliar;
	on_unequip 	= unequip_ds_OkoBeliar;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_OkoBeliar;
	visual 			= "ItMw_DS_OrcAxe_03.3DS";
	description = name;
	text[0] 		= NAME_Damage;
	count[0] 		= damageTotal;
	text[1] = NAME_Dam_Magic;
	count[1] = 15; 
	text[2] 		= NAME_Str_needed;
	count[2] 		= cond_value[2];
	text[3] 		= NAME_ADDON_BONUS_2H;
	count[3] 		= Bonus_OkoBeliar;
	text[4] 		= NAME_TalentOrcWeapon_needed;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_OkoBeliar()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_OkoBeliar);
	};
	S_Topor_ds_Orks_01();
};

func void unequip_ds_OkoBeliar()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_OkoBeliar);
	};
	S_Topor_ds_Orks_02();
};
//
const int Damage_ds_NuggetSubjugator = 145;
const int Condition_ds_NuggetSubjugator = 145;
const int Value_ds_NuggetSubjugator = 3500;
const int Bonus_NuggetSubjugator = 10;

instance ItMW_Ds_NuggetSubjugator(C_Item)		//Рудный покоритель
{
	name 				= "Рудный покоритель";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_2HD_AXE;
	material 		= MAT_METAL;
	value 			= Value_ds_NuggetSubjugator;
	damageTotal = Damage_ds_NuggetSubjugator;
	damagetype 	= DAM_EDGE | DAM_FLY;
	range 			= Range_Orkaxt_03;
	on_equip 		= equip_ds_NuggetSubjugator;
	on_unequip 	= unequip_ds_NuggetSubjugator;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_NuggetSubjugator;
	visual 			= "ItMw_DS_OrcAxe_04.3DS";
	description = name;
	text[0] 		= NAME_Damage;
	count[0] 		= damageTotal;
	text[1] = NAME_Dam_Magic;
	count[1] = 20;
	text[2] 		= NAME_Str_needed;
	count[2] 		= cond_value[2];
	text[3] 		= NAME_ADDON_BONUS_2H;
	count[3] 		= Bonus_NuggetSubjugator;
	text[4] 		= NAME_TalentOrcWeapon_needed;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_NuggetSubjugator()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_NuggetSubjugator);
	};
	S_Topor_ds_Orks_01();
};
func void unequip_ds_NuggetSubjugator()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_NuggetSubjugator);
	};
	S_Topor_ds_Orks_02();
};
//
const int Damage_ds_BearingDeath_Edge = 160;
const int Damage_ds_BearingDeath_Magic = 25;
const int Damage_ds_BearingDeath_Fire = 25;
const int Condition_ds_BearingDeath = 200;
const int Value_ds_BearingDeath = 4000;
const int Bonus_BearingDeath = 10;

instance ItMW_Ds_BearingDeath(C_Item)		//Гуррум Шатар
{
	name 				= "Гуррум Шатар";
	mainflag 		= ITEM_KAT_NF;
	flags 			= ITEM_2HD_AXE;
	material 		= MAT_METAL;
	value 			= Value_ds_BearingDeath;
	damagetype 	= DAM_EDGE | DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = Damage_ds_BearingDeath_Edge;
	damage[DAM_INDEX_FIRE] = Damage_ds_BearingDeath_Fire;
	damage[DAM_INDEX_MAGIC] = Damage_ds_BearingDeath_Magic;
	damagetype 	= DAM_EDGE;
	range 			= 140;
	on_equip 		= equip_ds_BearingDeath;
	on_unequip 	= unequip_ds_BearingDeath;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_BearingDeath;
	visual 			= "ItMw_DS_OrcAxe_01.3DS";
	description = name;
	text[0] 		= NAME_Dam_Edge;
	count[0] 		= damage[DAM_INDEX_EDGE];
	text[1] 		= NAME_Dam_Magic;
	count[1] 		= damage[DAM_INDEX_MAGIC];
	text[2] 		= NAME_Dam_Fire;
	count[2] 		= damage[DAM_INDEX_FIRE];
	text[3] 		= NAME_Str_needed;
	count[3] 		= cond_value[2];
	text[4] 		= NAME_ADDON_BONUS_2H;
	count[4] 		= Bonus_BearingDeath;
	text[5] 		= NAME_Value;
	count[5] 		= value;
};
func void equip_ds_BearingDeath()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,Bonus_BearingDeath);
	};
	S_Topor_ds_Orks_01();
};
func void unequip_ds_BearingDeath()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Bonus_BearingDeath);
	};
	S_Topor_ds_Orks_02();
};

//*****************************Луки******************************************

const int Damage_ds_Bow_Hunter = 45;
const int Condition_ds_Bow_Hunter = 35;
const int Value_ds_Bow_Hunter = 300;
const int Bonus_Hunter = 10;

instance ItRw_Ds_Bow_Hunter(C_Item)
{
	name = "Лук охотника";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_ds_Bow_Hunter;
	damageTotal = Damage_ds_Bow_Hunter;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	on_equip = equip_ds_Bow_Hunter;
	on_unequip = unequip_ds_Bow_Hunter;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ds_Bow_Hunter;
	visual = "ITRW_BOW_L_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOW;
	count[4] = Bonus_Hunter;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_Bow_Hunter()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_BOW,Bonus_Hunter);	};
};
func void unequip_ds_Bow_Hunter()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_BOW,-Bonus_Hunter);	};
};

const int Damage_ds_Bow_Wind = 65;
const int Condition_ds_Bow_Wind = 65;
const int Value_ds_Bow_Wind = 500;
const int Bonus_Wind = 10;

instance ItRw_Ds_Bow_Wind(C_Item)
{
	name = "Рассекающий ветер";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_ds_Bow_Wind;
	damageTotal = Damage_ds_Bow_Wind;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	on_equip = equip_ds_Bow_Wind;
	on_unequip = unequip_ds_Bow_Wind;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ds_Bow_Wind;
	visual = "ITRW_BOW_M_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOW;
	count[4] = Bonus_Wind;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_Bow_Wind()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_BOW,Bonus_Wind);	};
};
func void unequip_ds_Bow_Wind()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_BOW,-Bonus_Wind);	};
};

const int Damage_ds_Bow_Rush_Point = 80;
const int Damage_ds_Bow_Rush_Magic = 5;
const int Condition_ds_Bow_Rush = 70;
const int Value_ds_Bow_Rush = 650;
const int Bonus_Rush = 7;

instance ItRw_Ds_Bow_Rush(C_Item)
{
	name = "Порыв";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_ds_Bow_Rush;
	damagetype = DAM_POINT | DAM_MAGIC;
	damage[DAM_INDEX_POINT] = Damage_ds_Bow_Rush_Point;
	damage[DAM_INDEX_MAGIC] = Damage_ds_Bow_Rush_Magic;
	munition = ItRw_Arrow;
	on_equip = equip_ds_Bow_Rush;
	on_unequip = unequip_ds_Bow_Rush;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ds_Bow_Rush;
	visual = "ITRW_BOW_M_02.mms";
	description = name;
	text[0] 		= NAME_Dam_Point;
	count[0] 		= damage[DAM_INDEX_POINT];
	text[1] 		= NAME_Dam_Magic;
	count[1] 		= damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOW;
	count[4] = Bonus_Rush;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_Bow_Rush()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_BOW,Bonus_Rush);	};
};
func void unequip_ds_Bow_Rush()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_BOW,-Bonus_Rush);	};
};

const int Damage_ds_Bow_HunterWisdom_Point = 100;
const int Damage_ds_Bow_HunterWisdom_Magic = 10;
const int Condition_ds_Bow_HunterWisdom = 85;
const int Value_ds_Bow_HunterWisdom = 900;
const int Bonus_HunterWisdom = 8;

instance ItRw_Ds_Bow_HunterWisdom(C_Item)
{
	name = "Мудрость охотника";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_ds_Bow_HunterWisdom;
	damagetype = DAM_POINT | DAM_MAGIC;
	damage[DAM_INDEX_POINT] = Damage_ds_Bow_HunterWisdom_Point;
	damage[DAM_INDEX_MAGIC] = Damage_ds_Bow_HunterWisdom_Magic;
	munition = ItRw_Arrow;
	on_equip = equip_ds_Bow_Rush;
	on_unequip = unequip_ds_Bow_Rush;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ds_Bow_HunterWisdom;
	visual = "ITRW_BOW_M_04.mms";
	description = name;
	text[0] 		= NAME_Dam_Point;
	count[0] 		= damage[DAM_INDEX_POINT];
	text[1] 		= NAME_Dam_Magic;
	count[1] 		= damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOW;
	count[4] = Bonus_HunterWisdom;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_Bow_HunterWisdom()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_BOW,Bonus_HunterWisdom);
	};
};
func void unequip_ds_Bow_HunterWisdom()
{
	if(Npc_IsPlayer(self))
	{
		B_AddFightSkill(self,NPC_TALENT_BOW,-Bonus_HunterWisdom);
	};
};

const int Damage_ds_Bow_MorningDawn_Point = 120;
const int Damage_ds_Bow_MorningDawn_Magic = 15;
const int Condition_ds_Bow_MorningDawn = 100;
const int Value_ds_Bow_MorningDawn = 1100;
const int Bonus_MorningDawn = 10;

instance ItRw_Ds_Bow_MorningDawn(C_Item)
{
	name = "Утренняя заря";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = Value_ds_Bow_MorningDawn;
	damagetype = DAM_POINT | DAM_MAGIC;
	damage[DAM_INDEX_POINT] = Damage_ds_Bow_MorningDawn_Point;
	damage[DAM_INDEX_MAGIC] = Damage_ds_Bow_MorningDawn_Magic;
	munition = ItRw_Arrow;
	on_equip = equip_ds_Bow_Rush;
	on_unequip = unequip_ds_Bow_Rush;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_ds_Bow_MorningDawn;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[0] 		= NAME_Dam_Point;
	count[0] 		= damage[DAM_INDEX_POINT];
	text[1] 		= NAME_Dam_Magic;
	count[1] 		= damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOW;
	count[4] = Bonus_MorningDawn;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_Bow_MorningDawn()
{
	if(Npc_IsPlayer(self))
	{	B_AddFightSkill(self,NPC_TALENT_BOW,Bonus_MorningDawn); };
};
func void unequip_ds_Bow_MorningDawn()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_BOW,-Bonus_MorningDawn);	};
};

//*****************************Арбалеты***************************************

const int Damage_ds_CrossBow_Purpose = 50;
const int Condition_ds_CrossBow_Purpose = 45;
const int Value_ds_CrossBow_Purpose = 400;
const int Bonus_Purpose = 10;

instance ItRw_Ds_CrossBow_Purpose(C_Item)
{
	name = "Поражающий цель";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_ds_CrossBow_Purpose;
	damageTotal = Damage_ds_CrossBow_Purpose;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	on_equip = equip_ds_CrossBow_Purpose;
	on_unequip = unequip_ds_CrossBow_Purpose;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_CrossBow_Purpose;
	visual = "ItRw_Crossbow_L_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_CROSSBOW;
	count[4] = Bonus_Purpose;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_CrossBow_Purpose()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_CROSSBOW,Bonus_Purpose);	};
};
func void unequip_ds_CrossBow_Purpose()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_CROSSBOW,-Bonus_Purpose);	};
};

const int Damage_ds_CrossBow_LucklyTroll = 70;
const int Condition_ds_CrossBow_LucklyTroll = 60;
const int Value_ds_CrossBow_LucklyTroll = 550;
const int Bonus_LucklyTroll = 10;

instance ItRw_Ds_CrossBow_LucklyTroll(C_Item)
{
	name = "Удача тролля";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_ds_CrossBow_LucklyTroll;
	damageTotal = Damage_ds_CrossBow_LucklyTroll;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	on_equip = equip_ds_CrossBow_LucklyTroll;
	on_unequip = unequip_ds_CrossBow_LucklyTroll;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_CrossBow_LucklyTroll;
	visual = "ItRw_Crossbow_M_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_CROSSBOW;
	count[4] = Bonus_LucklyTroll;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_CrossBow_LucklyTroll()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_CROSSBOW,Bonus_LucklyTroll);	};
};
func void unequip_ds_CrossBow_LucklyTroll()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_CROSSBOW,-Bonus_LucklyTroll);	};
};

const int Damage_ds_CrossBow_Dawn_Point = 100;
const int Damage_ds_CrossBow_Dawn_Magic = 5;
const int Condition_ds_CrossBow_Dawn = 85;
const int Value_ds_CrossBow_Dawn = 800;
const int Bonus_Dawn = 7;

instance ItRw_Ds_CrossBow_Dawn(C_Item)
{
	name = "Рассвет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_ds_CrossBow_Dawn;
	damagetype = DAM_POINT | DAM_MAGIC;
	damage[DAM_INDEX_POINT] = Damage_ds_CrossBow_Dawn_Point;
	damage[DAM_INDEX_MAGIC] = Damage_ds_CrossBow_Dawn_Magic;
	munition = ItRw_Bolt_01;
	on_equip = equip_ds_CrossBow_Dawn;
	on_unequip = unequip_ds_CrossBow_Dawn;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_CrossBow_Dawn;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[0] 		= NAME_Dam_Point;
	count[0] 		= damage[DAM_INDEX_POINT];
	text[1] 		= NAME_Dam_Magic;
	count[1] 		= damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_CROSSBOW;
	count[4] = Bonus_Dawn;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_CrossBow_Dawn()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_CROSSBOW,Bonus_Dawn);	};
};
func void unequip_ds_CrossBow_Dawn()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_CROSSBOW,-Bonus_Dawn);	};
};

const int Damage_ds_CrossBow_StarSong_Point = 140;
const int Damage_ds_CrossBow_StarSong_Magic = 10;
const int Condition_ds_CrossBow_StarSong = 120;
const int Value_ds_CrossBow_StarSong = 2500;
const int Bonus_StarSong = 10;

instance ItRw_Ds_CrossBow_StarSong(C_Item)
{
	name = "Песнь звезды";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = Value_ds_CrossBow_StarSong;
	damagetype = DAM_POINT | DAM_MAGIC;
	damage[DAM_INDEX_POINT] = Damage_ds_CrossBow_StarSong_Point;
	damage[DAM_INDEX_MAGIC] = Damage_ds_CrossBow_StarSong_Magic;
	munition = ItRw_Bolt_01;
	on_equip = equip_ds_CrossBow_StarSong;
	on_unequip = unequip_ds_CrossBow_StarSong;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_ds_CrossBow_StarSong;
	visual = "ItRw_Crossbow_H_02.mms";
	description = name;
	text[0] 		= NAME_Dam_Point;
	count[0] 		= damage[DAM_INDEX_POINT];
	text[1] 		= NAME_Dam_Magic;
	count[1] 		= damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_CROSSBOW;
	count[4] = Bonus_StarSong;
	text[5] = NAME_Value;
	count[5] = value;
};
func void equip_ds_CrossBow_StarSong()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_CROSSBOW,Bonus_StarSong);	};
};
func void unequip_ds_CrossBow_StarSong()
{
	if(Npc_IsPlayer(self))
	{		B_AddFightSkill(self,NPC_TALENT_CROSSBOW,-Bonus_StarSong);	};
};
