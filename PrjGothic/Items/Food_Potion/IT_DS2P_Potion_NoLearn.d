const int	Value_DS2P_Ork_Elixier	=	2000;
const int	DS2P_Str_Elixier				=	4;

const int	Value_DS2P_Str_Elixier	=	1000;
const int	DS2P_Ork_Elixier_str		=	3;
const int DS2P_Ork_Elixier_dex	  = 1;

const int	Value_DS2P_Dex_Elixier	=	2000;
const int	DS2P_Dex_Elixier				=	4;

const int	Value_DS2P_AltPotion		=	3000; 		
const int	DS2P_AltPotion_str			=	3;
const int	DS2P_AltPotion_dex			=	3;

const int	Value_DS2P_Mana_Elixier =	2000;
const int	DS2P_Mana_Elixier			=	10;

const int	Value_DS2P_Health_Elixier	=	2000;
const int	DS2P_Health_Elixier				=	20;

const int	Value_DS2P_Speed					=	150;
const int	DS2P_Time_Speed_01				=	300000;	// 5 min
const int	DS2P_Time_Speed_02				=	360000;	// 6 min
const int	DS2P_Time_Speed_03				=	420000;	// 7 min

/******************************************************************************************/
INSTANCE ITPO_DS2P_Ork_Elixier(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DS2P_Ork_Elixier;	

	visual 			=	"ITPO_DSG_Ork_Elixier.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseITPO_DS2P_Ork_Elixier;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"ќрочье зелье";
	
	TEXT[1]			= 	NAME_Bonus_Str;				
	COUNT[1]		= 	DS2P_Ork_Elixier_str;
	TEXT[2]			= 	NAME_DS_AntiBonus_Dex;				
	COUNT[2]		= 	DS2P_Ork_Elixier_dex;	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

FUNC VOID UseITPO_DS2P_Ork_Elixier()
{ 
	B_RaiseAttribute	(self, ATR_STRENGTH,	 DS2P_Ork_Elixier_str);
	B_RaiseAttribute	(self, ATR_DEXTERITY,	-DS2P_Ork_Elixier_dex);
};
/******************************************************************************************/
INSTANCE ITPO_DS2P_Str_Elixier(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DS2P_Str_Elixier;	

	visual 			=	"ITPO_DSG_Str_Elixier.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseITPO_DS2P_Str_Elixier;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER";

	description		= 	"Ёликсир силы";
	
	TEXT[1]			= 	NAME_Bonus_Str;
	COUNT[1]		= 	DS2P_Str_Elixier;
	
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

FUNC VOID UseITPO_DS2P_Str_Elixier()
{ 
	B_RaiseAttribute	(self, ATR_STRENGTH,	DS2P_Str_Elixier);
};
/******************************************************************************************/
INSTANCE ITPO_DS2P_Dex_Elixier(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DS2P_Dex_Elixier;

	visual 			=	"ITPO_DSG_Dex_Elixier.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseITPO_DS2P_Dex_Elixier;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		= 	"Ёликсир ловкости";
	
	TEXT[1]			= 	NAME_Bonus_Dex;
	COUNT[1]		= 	DS2P_Dex_Elixier;
	
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

FUNC VOID UseITPO_DS2P_Dex_Elixier()
{ 
	B_RaiseAttribute	(self, ATR_DEXTERITY,	DS2P_Dex_Elixier);
};	


/******************************************************************************************/
INSTANCE ITPO_DS2P_AltPotion(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DS2P_AltPotion;	

	visual 			=	"ITPO_DSG_AltPotion.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseITPO_DS2P_AltPotion;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER";

	description		= 	"ƒревнее зелье";
	
	TEXT[1]			= 	NAME_Bonus_Str;
	COUNT[1]		= 	DS2P_AltPotion_str;
	TEXT[2]			= 	NAME_Bonus_Dex;
	COUNT[2]		= 	DS2P_AltPotion_dex;

	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

FUNC VOID UseITPO_DS2P_AltPotion()
{ 
	var string concatText_dexstr;

	concatText_dexstr = ConcatStrings("—ила и Ћовкость + ", IntToString(DS2P_AltPotion_str));
	PrintScreen	(concatText_dexstr, -1, -1, FONT_SCREEN, 3);

	self.attribute[ATR_STRENGTH]  += DS2P_AltPotion_str;
	self.attribute[ATR_DEXTERITY] += DS2P_AltPotion_dex;
	self.aivar[REAL_STRENGTH] += DS2P_AltPotion_str;
	self.aivar[REAL_DEXTERITY] += DS2P_AltPotion_dex;
};

/******************************************************************************************/
INSTANCE ItPo_DS2P_Health_Elixier(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DS2P_Health_Elixier;	

	visual 			=	"ItPo_DSG_Health_Elixier.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_DS2P_Health_Elixier;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION";

	description		= 	"ќсобый эликсир здоровь€";
	
	TEXT[1]			= 	NAME_Bonus_HpMax;
	COUNT[1]		= 	DS2P_Health_Elixier;
	
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

FUNC VOID UseItPo_DS2P_Health_Elixier()
{
	B_RaiseAttribute	(self, ATR_HITPOINTS_MAX,	DS2P_Health_Elixier);	
	Npc_ChangeAttribute	(self, ATR_HITPOINTS,		DS2P_Health_Elixier);
};

/******************************************************************************************/
INSTANCE ItPo_DS2P_Mana_Elixier(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DS2P_Mana_Elixier;	

	visual 			=	"ItPo_DSG_Mana_Elixier.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseItPo_DS2P_Mana_Elixier;
	scemeName		=	"POTIONFAST";

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";

	description		= 	"ќсобый эликсир духа";
	TEXT[1]			= 	NAME_Bonus_ManaMax;
	COUNT[1]		= 	DS2P_Mana_Elixier;

	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

FUNC VOID UseItPo_DS2P_Mana_Elixier()
{
	B_RaiseAttribute	(self, ATR_MANA_MAX,	DS2P_Mana_Elixier);
	Npc_ChangeAttribute	(self, ATR_MANA,		DS2P_Mana_Elixier);
};

/******************************************************************************************/
//	SPEED-POTIONS																	      //
/******************************************************************************************/
prototype ItPo_DS2P_Speed(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DS2P_Speed;	
	visual 			=	"ItPo_DSG_Speed_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear				= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER";
	description	= 	"«елье ускорени€";
	text[1] 		= "¬ременно повышает скорость.";
	TEXT[3]			= 	NAME_Duration;
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};

INSTANCE ItPo_Speed_01(ItPo_DS2P_Speed)
{ visual		= "ItPo_DS2P_Speed_01.3ds";
	on_state[0] =	UseItPo_Speed_01;
	COUNT[3]	= 	DS2P_Time_Speed_01 / 60000;	};
INSTANCE ItPo_Speed_02(ItPo_DS2P_Speed)
{ visual		= "ItPo_DS2P_Speed_02.3ds";
	on_state[0] =	UseItPo_Speed_02;
	COUNT[3]	= 	DS2P_Time_Speed_02 / 60000;	};
INSTANCE ItPo_Speed_03(ItPo_DS2P_Speed)
{ visual		= "ItPo_DS2P_Speed_03.3ds";
	on_state[0] =	UseItPo_Speed_03;
	COUNT[3]	= 	DS2P_Time_Speed_03 / 60000;	};

FUNC VOID UseItPo_Speed_01(){
	Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", DS2P_Time_Speed_01);
};
FUNC VOID UseItPo_Speed_02(){
	Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", DS2P_Time_Speed_02);
};
FUNC VOID UseItPo_Speed_03(){
	Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", DS2P_Time_Speed_03);
};
//*****************************************************************************************
//Ф репость духаФ 
// ƒаЄт крест-нин ^÷имм^ по квесту ^ репость духа^
//******************************************************************************************/
const int Bonus_ItPo_DS2P_Perm_Fortitude_Prot	= 5;
const int Bonus_ItPo_DS2P_Perm_Fortitude_HPMax	= 20;
const int Value_ItPo_DS2P_Perm_Fortitude			= 2000;
instance ItPo_DS2P_Perm_Fortitude(C_Item)
{
	name 	= NAME_Trank;	description = " репость духа";
	visual 	= "ItPo_Perm_STR.3ds";
	
	scemeName 	= "POTIONFAST";
	on_state[0] = Use_ItPo_DS2P_Perm_Fortitude;
	
	text[1] = NAME_Bonus_HpMax;				count[1] = Bonus_ItPo_DS2P_Perm_Fortitude_HPMax;
	text[2] = NAME_DS_Prot_EdgeAndPoint;	count[2] = Bonus_ItPo_DS2P_Perm_Fortitude_Prot;
	
	value 	= Value_ItPo_DS2P_Perm_Fortitude;	
	count[5] = Value_StrElixier;
};
func void Use_ItPo_DS2P_Perm_Fortitude()
{
	/* перенесено в диалог, т.к. эффект должен наступить не сразу
	B_RaiseAttribute(self,ATR_HITPOINTS_MAX,Bonus_ItPo_DS2P_Perm_Fortitude_HPMax);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,Bonus_ItPo_DS2P_Perm_Fortitude_HPMax);
	B_DS_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT,Bonus_ItPo_DS2P_Perm_Fortitude_Prot);
	//*/
};
