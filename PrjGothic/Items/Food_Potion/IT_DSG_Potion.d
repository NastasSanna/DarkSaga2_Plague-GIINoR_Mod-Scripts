const int	Value_DSG_Health_low		=	50;
const int	Value_DSG_Health_Mittel		=	100;
const int	Value_DSG_Health_hight		=	200;
const int	Value_DSG_Mana_low			=	50;
const int	Value_DSG_Mana_Mittel		=	100;
const int	Value_DSG_Mana_hight		=	200;

var int dsgPotion_Variable;

const int DSG_Health_low_01 = 25;
const int DSG_Health_low_02 = 30;
const int DSG_Health_low_03 = 40;

const int DSG_Health_Mittel_01 = 50;
const int DSG_Health_Mittel_02 = 60;
const int DSG_Health_Mittel_03 = 80;

const int DSG_Health_hight_01 = 75;
const int DSG_Health_hight_02 = 90;
const int DSG_Health_hight_03 = 120;

const int DSG_Mana_low_01 = 25;
const int DSG_Mana_low_02 = 30;
const int DSG_Mana_low_03 = 40;

const int DSG_Mana_Mittel_01 = 50;
const int DSG_Mana_Mittel_02 = 60;
const int DSG_Mana_Mittel_03 = 80;

const int DSG_Mana_hight_01 = 75;
const int DSG_Mana_hight_02 = 90;
const int DSG_Mana_hight_03 = 120;

const int Value_DSG_StrElixier = 1000;
const int Value_DSG_DexElixier = 1000;

const int DSG_STR_Elixier_01 = 2;
const int DSG_STR_Elixier_02 = 3;
const int DSG_STR_Elixier_03 = 4;

const int DSG_Dex_Elixier_01 = 2;
const int DSG_Dex_Elixier_02 = 3;
const int DSG_Dex_Elixier_03 = 4;

const int Value_DSG_HpMaxElixier = 1000;
const int Value_DSG_ManaMaxElixier = 1000;

const int DSG_HpMaxElixier_01 = 10;
const int DSG_HpMaxElixier_02 = 12;
const int DSG_HpMaxElixier_03 = 15;

const int DSG_ManaMaxElixier_01 = 5;
const int DSG_ManaMaxElixier_02 = 7;
const int DSG_ManaMaxElixier_03 = 10;
////////////////////////////////////////////////////////////////////////////////////////////
//						Эссенции    													 //
///////////////////////////////////////////////////////////////////////////////////////////

/******************************************************************************************/
// Напитки здоровья 
/******************************************************************************************/
prototype ItPo_DSG_Health_low(C_Item)
{
	name 				=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_Health_low;	
	visual 			=	"ItPo_Health_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 
	description		= 	"Эссенция здоровья";
	TEXT[2]			= 	"Слабый лечебный эффект";				
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};
INSTANCE ItPo_DSG_Health_low_01 (ItPo_DSG_Health_low) 
{	on_state[0]	=	UseItPo_DSG_Health_low_01; 
	visual 	=	"ItPo_DSG_Health_low_01.3ds";   };
INSTANCE ItPo_DSG_Health_low_02 (ItPo_DSG_Health_low) 
{	on_state[0]	=	UseItPo_DSG_Health_low_02; 
	visual 	=	"ItPo_DSG_Health_low_02.3ds";   };
INSTANCE ItPo_DSG_Health_low_03 (ItPo_DSG_Health_low) 
{	on_state[0]	=	UseItPo_DSG_Health_low_03; 
	visual 	=	"ItPo_DSG_Health_low_03.3ds";   };
FUNC VOID UseItPo_DSG_Health_low_01()
{
	if ((self.attribute[ATR_HITPOINTS_MAX] / 10) < DSG_Health_low_01)
	{ dsgPotion_Variable = DSG_Health_low_01; } 
	else
	{ dsgPotion_Variable = self.attribute[ATR_HITPOINTS_MAX] / 10; };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};	
FUNC VOID UseItPo_DSG_Health_low_02()
{
	if (((self.attribute[ATR_HITPOINTS_MAX] * 3) / 20) < DSG_Health_low_02)
	{ dsgPotion_Variable = DSG_Health_low_02; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_HITPOINTS_MAX] * 3) / 20; };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};
FUNC VOID UseItPo_DSG_Health_low_03()
{
	if ((self.attribute[ATR_HITPOINTS_MAX] / 4) < DSG_Health_low_03)
	{ dsgPotion_Variable = DSG_Health_low_03; } 
	else
	{ dsgPotion_Variable = self.attribute[ATR_HITPOINTS_MAX] / 4; };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};

/******************************************************************************************/
// Напитки маны
/******************************************************************************************/	
prototype ItPo_DSG_Mana_low(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_Mana_low;	
	visual 			=	"ItPo_Mana_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";
	description		= 	"Эссенция маны";
	TEXT[1]			= 	"Малое восстановление маны";				
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};
INSTANCE ItPo_DSG_Mana_low_01 (ItPo_DSG_Mana_low) 
{	on_state[0]	=	UseItPo_DSG_Mana_low_01; 
	visual 	=	"ItPo_DSG_Mana_low_01.3ds";   };
INSTANCE ItPo_DSG_Mana_low_02 (ItPo_DSG_Mana_low) 
{	on_state[0]	=	UseItPo_DSG_Mana_low_02; 
	visual 	=	"ItPo_DSG_Mana_low_02.3ds";   };
INSTANCE ItPo_DSG_Mana_low_03 (ItPo_DSG_Mana_low) 
{	on_state[0]	=	UseItPo_DSG_Mana_low_03; 
	visual 	=	"ItPo_DSG_Mana_low_03.3ds";   };
FUNC VOID UseItPo_DSG_Mana_low_01()
{
	if ((self.attribute[ATR_MANA_MAX] /10) < DSG_Mana_low_01)
	{ dsgPotion_Variable = DSG_Mana_low_01; } 
	else
	{ dsgPotion_Variable = self.attribute[ATR_MANA_MAX] /10; };
	
	if ((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};	
FUNC VOID UseItPo_DSG_Mana_low_02()
{
	if (((self.attribute[ATR_MANA_MAX] * 3) / 20) < DSG_Mana_low_02)
	{ dsgPotion_Variable = DSG_Mana_low_02; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_MANA_MAX] * 3)/20; };
	
	if ((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};
FUNC VOID UseItPo_DSG_Mana_low_03()
{
	if ((self.attribute[ATR_MANA_MAX] / 4) < DSG_Mana_low_03)
	{ dsgPotion_Variable = DSG_Mana_low_03; } 
	else
	{ dsgPotion_Variable = self.attribute[ATR_MANA_MAX] / 4; };
	
	if ((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};

////////////////////////////////////////////////////////////////////////////////////////////
//						Экстракты														 //
///////////////////////////////////////////////////////////////////////////////////////////

/******************************************************************************************/
// Напитки здоровья 
/******************************************************************************************/
prototype ItPo_DSG_Health_Mittel(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_Health_Mittel;	
	visual 			=	"ItPo_Health_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 
	description		= 	"Экстракт здоровья";
	TEXT[2]			= 	"Средний лечебный эффект";				
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};
INSTANCE ItPo_DSG_Health_Mittel_01 (ItPo_DSG_Health_Mittel)
{	on_state[0]	=	UseItPo_DSG_Health_Mittel_01;
	visual 	=	"ItPo_DSG_Health_Mittel_01.3ds";   };
INSTANCE ItPo_DSG_Health_Mittel_02 (ItPo_DSG_Health_Mittel)
{	on_state[0]	=	UseItPo_DSG_Health_Mittel_02;
	visual 	=	"ItPo_DSG_Health_Mittel_02.3ds";   };
INSTANCE ItPo_DSG_Health_Mittel_03 (ItPo_DSG_Health_Mittel)
{	on_state[0]	=	UseItPo_DSG_Health_Mittel_03;
	visual 	=	"ItPo_DSG_Health_Mittel_03.3ds";   };

FUNC VOID UseItPo_DSG_Health_Mittel_01()
{
	if ((self.attribute[ATR_HITPOINTS_MAX] / 5) < DSG_Health_Mittel_01)
	{ dsgPotion_Variable = DSG_Health_Mittel_01; } 
	else
	{ dsgPotion_Variable = self.attribute[ATR_HITPOINTS_MAX] / 5; };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};	
FUNC VOID UseItPo_DSG_Health_Mittel_02()
{
	if (((self.attribute[ATR_HITPOINTS_MAX] * 3) / 10) < DSG_Health_Mittel_02)
	{ dsgPotion_Variable = DSG_Health_Mittel_02; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_HITPOINTS_MAX] * 3) / 10; };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};
FUNC VOID UseItPo_DSG_Health_Mittel_03()
{
	if (((self.attribute[ATR_HITPOINTS_MAX] * 9 ) / 20) < DSG_Health_Mittel_03)
	{ dsgPotion_Variable = DSG_Health_Mittel_03; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_HITPOINTS_MAX] * 9 ) / 20; };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};

/******************************************************************************************/
// Напитки маны
/******************************************************************************************/	
prototype ItPo_DSG_Mana_Mittel(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_Mana_Mittel;	
	visual 			=	"ItPo_Mana_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";
	description		= 	"Экстракт маны";
	TEXT[1]			= 	"Среднее восстановление маны";				
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};
INSTANCE ItPo_DSG_Mana_Mittel_01 (ItPo_DSG_Mana_Mittel) 
{	on_state[0]	=	UseItPo_DSG_Mana_Mittel_01; 
	visual 	=	"ItPo_DSG_Mana_Mittel_01.3ds";   };
INSTANCE ItPo_DSG_Mana_Mittel_02 (ItPo_DSG_Mana_Mittel) 
{	on_state[0]	=	UseItPo_DSG_Mana_Mittel_02; 
	visual 	=	"ItPo_DSG_Mana_Mittel_02.3ds";   };
INSTANCE ItPo_DSG_Mana_Mittel_03 (ItPo_DSG_Mana_Mittel) 
{	on_state[0]	=	UseItPo_DSG_Mana_Mittel_03; 
	visual 	=	"ItPo_DSG_Mana_Mittel_03.3ds";   };

FUNC VOID UseItPo_DSG_Mana_Mittel_01()
{
	if ((self.attribute[ATR_MANA_MAX] / 5) < DSG_Mana_Mittel_01)
	{ dsgPotion_Variable = DSG_Mana_Mittel_01; } 
	else
	{ dsgPotion_Variable = self.attribute[ATR_MANA_MAX] / 5; };
	
	if ((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};	
FUNC VOID UseItPo_DSG_Mana_Mittel_02()
{
	if (((self.attribute[ATR_MANA_MAX] * 3) / 10) < DSG_Mana_Mittel_02)
	{ dsgPotion_Variable = DSG_Mana_Mittel_02; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_MANA_MAX] * 3) / 10; };
	
	if ((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};
FUNC VOID UseItPo_DSG_Mana_Mittel_03()
{
	if (((self.attribute[ATR_MANA_MAX] * 9 ) / 20) < DSG_Mana_Mittel_03)
	{ dsgPotion_Variable = DSG_Mana_Mittel_03; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_MANA_MAX] * 9 ) / 20; };
	
	if ((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};

////////////////////////////////////////////////////////////////////////////////////////////
//						Эликсиры														 //
///////////////////////////////////////////////////////////////////////////////////////////

/******************************************************************************************/
// Напитки здоровья 
/******************************************************************************************/
prototype ItPo_DSG_Health_hight(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_Health_hight;	
	visual 			=	"ItPo_Health_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 
	description		= 	"Эликсир здоровья";
	TEXT[2]			= 	"Сильный лечебный эффект";				
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};
INSTANCE ItPo_DSG_Health_hight_01 (ItPo_DSG_Health_hight) 
{	on_state[0]	=	UseItPo_DSG_Health_hight_01; 
	visual 	=	"ItPo_DSG_Health_hight_01.3ds";   };

INSTANCE ItPo_DSG_Health_hight_02 (ItPo_DSG_Health_hight) 
{	on_state[0]	=	UseItPo_DSG_Health_hight_02; 
	visual 	=	"ItPo_DSG_Health_hight_02.3ds";   };

INSTANCE ItPo_DSG_Health_hight_03 (ItPo_DSG_Health_hight) 
{	on_state[0]	=	UseItPo_DSG_Health_hight_03; 
	visual 	=	"ItPo_DSG_Health_hight_03.3ds";   };

FUNC VOID UseItPo_DSG_Health_hight_01()
{
	if (((self.attribute[ATR_HITPOINTS_MAX] * 3 ) / 10) < DSG_Health_hight_01)
	{ dsgPotion_Variable = DSG_Health_hight_01; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_HITPOINTS_MAX] * 3 ); };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};	
FUNC VOID UseItPo_DSG_Health_hight_02()
{
	if (((self.attribute[ATR_HITPOINTS_MAX] * 9 ) / 20) < DSG_Health_hight_02)
	{ dsgPotion_Variable = DSG_Health_hight_02; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_HITPOINTS_MAX] * 9 ) / 20; };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};
FUNC VOID UseItPo_DSG_Health_hight_03()
{
	if (((self.attribute[ATR_HITPOINTS_MAX] * 13 ) / 20) < DSG_Health_hight_03)
	{ dsgPotion_Variable = DSG_Health_hight_03; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_HITPOINTS_MAX] * 13 ) / 20; };
	
	if ((self.attribute[ATR_HITPOINTS]  + dsgPotion_Variable) > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];				
	}
	else
	{
		self.attribute[ATR_HITPOINTS] += dsgPotion_Variable;
	};
};

/******************************************************************************************/
// Напитки маны
/******************************************************************************************/	
prototype ItPo_DSG_Mana_hight(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_Mana_hight;	
	visual 			=	"ItPo_Mana_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION";
	description		= 	"Эликсир маны";
	TEXT[1]			= 	"Большое восстановление маны";				
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	value;
};
INSTANCE ItPo_DSG_Mana_hight_01 (ItPo_DSG_Mana_hight) 
{	on_state[0]	=	UseItPo_DSG_Mana_hight_01; 
	visual 	=	"ItPo_DSG_Mana_hight_01.3ds";   };
INSTANCE ItPo_DSG_Mana_hight_02 (ItPo_DSG_Mana_hight) 
{	on_state[0]	=	UseItPo_DSG_Mana_hight_02; 
	visual 	=	"ItPo_DSG_Mana_hight_02.3ds";   };
INSTANCE ItPo_DSG_Mana_hight_03 (ItPo_DSG_Mana_hight) 
{	on_state[0]	=	UseItPo_DSG_Mana_hight_03; 
	visual 	=	"ItPo_DSG_Mana_hight_03.3ds";   };

FUNC VOID UseItPo_DSG_Mana_hight_01()
{
	if (((self.attribute[ATR_MANA_MAX] * 3 ) / 10) < DSG_Mana_hight_01)
	{ dsgPotion_Variable = DSG_Mana_hight_01; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_MANA_MAX] * 3 ) / 10; };
	
	if ((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};	
FUNC VOID UseItPo_DSG_Mana_hight_02()
{
	if (((self.attribute[ATR_MANA_MAX] * 9 ) / 20) < DSG_Mana_hight_02)
	{ dsgPotion_Variable = DSG_Mana_hight_02; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_MANA_MAX] * 9 ) / 20; };
	
	if ((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};
FUNC VOID UseItPo_DSG_Mana_hight_03()
{
	if(((self.attribute[ATR_MANA_MAX] * 13) / 20) < DSG_Mana_hight_03)
	{ dsgPotion_Variable = DSG_Mana_hight_03; } 
	else
	{ dsgPotion_Variable = (self.attribute[ATR_MANA_MAX] * 13 ) / 20; };
	
	if((self.attribute[ATR_MANA]  + dsgPotion_Variable) > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];				
	}
	else
	{
		self.attribute[ATR_MANA] += dsgPotion_Variable;
	};
};

/******************************************************************************************/
/******************************************************************************************/
//					ЗЕЛЬЯ ПОСТОЯННОГО ДЕЙСТВИЯ
/******************************************************************************************/
/******************************************************************************************/

/******************************************************************************************/
// 					Зелья силы
/******************************************************************************************/	
prototype ITPO_DSG_Str_prototype (C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_StrElixier;	
	visual 			=	"ItPo_Perm_STR.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 
	description		= 	"Зелье силы";
	TEXT[1]			= 	NAME_Bonus_Str;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

INSTANCE ITPO_DSG_Str_01(ITPO_DSG_Str_prototype)
{ visual      = "ITPO_DSG_Str_01.3ds";
	on_state[0] =	UseITPO_DSG_Str_01;
	COUNT[1]    = DSG_STR_Elixier_01;       };
INSTANCE ITPO_DSG_Str_02(ITPO_DSG_Str_prototype)
{ visual      = "ITPO_DSG_Str_02.3ds";
	on_state[0] =	UseITPO_DSG_Str_02;	
	COUNT[1]    = DSG_STR_Elixier_02;       };
INSTANCE ITPO_DSG_Str_03(ITPO_DSG_Str_prototype)
{ visual      = "ITPO_DSG_Str_03.3ds";
	on_state[0] =	UseITPO_DSG_Str_03;
	COUNT[1]    = DSG_STR_Elixier_03;       };								  

FUNC VOID UseITPO_DSG_Str_01()
{ 
	B_RaiseAttribute	(self, ATR_STRENGTH,	DSG_STR_Elixier_01);
};								  
FUNC VOID UseITPO_DSG_Str_02()
{ 
	B_RaiseAttribute	(self, ATR_STRENGTH,	DSG_STR_Elixier_02);
};
FUNC VOID UseITPO_DSG_Str_03()
{ 
	B_RaiseAttribute	(self, ATR_STRENGTH,	DSG_STR_Elixier_03);
};

/******************************************************************************************/
// 					Зелья ловкости
/******************************************************************************************/	
prototype ITPO_DSG_Dex_prototype (C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_DexElixier;	
	visual 			=	"ItPo_Perm_Dex.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER";
	description		= 	"Зелье ловкости";
	TEXT[1]			= 	NAME_Bonus_Dex;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

INSTANCE ITPO_DSG_Dex_01(ITPO_DSG_Dex_prototype)
{ visual      = "ITPO_DSG_Dex_01.3ds";
	on_state[0] =	UseITPO_DSG_Dex_01;
	COUNT[1]    = DSG_Dex_Elixier_01;       };
INSTANCE ITPO_DSG_Dex_02(ITPO_DSG_Dex_prototype)
{ visual      = "ITPO_DSG_Dex_02.3ds";
	on_state[0] =	UseITPO_DSG_Dex_02;	
	COUNT[1]    = DSG_Dex_Elixier_02;       };
INSTANCE ITPO_DSG_Dex_03(ITPO_DSG_Dex_prototype)
{ visual      = "ITPO_DSG_Dex_03.3ds";
	on_state[0] =	UseITPO_DSG_Dex_03;
	COUNT[1]    = DSG_Dex_Elixier_03;       };								  

FUNC VOID UseITPO_DSG_Dex_01()
{ 
	B_RaiseAttribute	(self, ATR_DEXTERITY,	DSG_Dex_Elixier_01);
};								  
FUNC VOID UseITPO_DSG_Dex_02()
{ 
	B_RaiseAttribute	(self, ATR_DEXTERITY,	DSG_Dex_Elixier_02);
};
FUNC VOID UseITPO_DSG_Dex_03()
{ 
	B_RaiseAttribute	(self, ATR_DEXTERITY,	DSG_Dex_Elixier_03);
};
/******************************************************************************************/
// 					Зелья HP
/******************************************************************************************/
INSTANCE ItPo_DSG_Perm_Health(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_HpMaxElixier;	
	visual 			=	"ItPo_Perm_Health.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_HEALTHPOTION"; 
	description		= 	"Зелье жизни";
	TEXT[1]			= 	NAME_Bonus_HpMax;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

INSTANCE ItPo_DSG_Perm_Health_01(C_Item)
{	
	visual 		=	"ItPo_DSG_Perm_Health_01.3ds";
	on_state[0]	=	UseItPo_DSG_Perm_Health_01;
	COUNT[1]	= 	DSG_HpMaxElixier_01;			
};
INSTANCE ItPo_DSG_Perm_Health_02(C_Item)
{	
	visual 		=	"ItPo_DSG_Perm_Health_02.3ds";
	on_state[0]	=	UseItPo_DSG_Perm_Health_02;
	COUNT[1]	= 	DSG_HpMaxElixier_02;			
};
INSTANCE ItPo_DSG_Perm_Health_03(C_Item)
{	
	visual 		=	"ItPo_DSG_Perm_Health_03.3ds";
	on_state[0]	=	UseItPo_DSG_Perm_Health_03;
	COUNT[1]	= 	DSG_HpMaxElixier_03;			
};
FUNC VOID UseItPo_DSG_Perm_Health_01()
{
	B_RaiseAttribute	(self, ATR_HITPOINTS_MAX,	DSG_HpMaxElixier_01);	
	Npc_ChangeAttribute	(self, ATR_HITPOINTS,		DSG_HpMaxElixier_01);
};
FUNC VOID UseItPo_DSG_Perm_Health_02()
{
	B_RaiseAttribute	(self, ATR_HITPOINTS_MAX,	DSG_HpMaxElixier_02);	
	Npc_ChangeAttribute	(self, ATR_HITPOINTS,		DSG_HpMaxElixier_02);
};
FUNC VOID UseItPo_DSG_Perm_Health_03()
{
	B_RaiseAttribute	(self, ATR_HITPOINTS_MAX,	DSG_HpMaxElixier_03);	
	Npc_ChangeAttribute	(self, ATR_HITPOINTS,		DSG_HpMaxElixier_03);
};
/******************************************************************************************/
// 					Зелья маны
/******************************************************************************************/
INSTANCE ItPo_DSG_Perm_Mana(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_ManaMaxElixier;	
	visual 			=	"ItPo_Perm_Mana.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION"; 
	description		= 	"Зелье духа";
	TEXT[1]			= 	NAME_Bonus_ManaMax;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};

INSTANCE ItPo_DSG_Perm_Mana_01(C_Item)
{	
	visual 		=	"ItPo_DSG_Perm_Mana_01.3ds";
	on_state[0]	=	UseItPo_DSG_Perm_Mana_01;
	COUNT[1]	= 	DSG_ManaMaxElixier_01;
};
INSTANCE ItPo_DSG_Perm_Mana_02(C_Item)
{	
	visual 		=	"ItPo_DSG_Perm_Mana_02.3ds";
	on_state[0]	=	UseItPo_DSG_Perm_Mana_02;
	COUNT[1]	= 	DSG_ManaMaxElixier_02;
};
INSTANCE ItPo_DSG_Perm_Mana_03(C_Item)
{	
	visual 		=	"ItPo_DSG_Perm_Mana_03.3ds";
	on_state[0]	=	UseItPo_DSG_Perm_Mana_03;
	COUNT[1]	= 	DSG_ManaMaxElixier_03;
};

FUNC VOID UseItPo_DSG_Perm_Mana_01()
{
	B_RaiseAttribute(self, ATR_MANA_MAX,	DSG_ManaMaxElixier_01);	
	Npc_ChangeAttribute(self, ATR_MANA,	DSG_ManaMaxElixier_01);	
};
FUNC VOID UseItPo_DSG_Perm_Mana_02()
{
	B_RaiseAttribute(self, ATR_MANA_MAX,	DSG_ManaMaxElixier_02);	
	Npc_ChangeAttribute(self, ATR_MANA,	DSG_ManaMaxElixier_02);	
};
FUNC VOID UseItPo_DSG_Perm_Mana_03()
{
	B_RaiseAttribute(self, ATR_MANA_MAX,	DSG_ManaMaxElixier_03);	
	Npc_ChangeAttribute(self, ATR_MANA,	DSG_ManaMaxElixier_03);	
};

/******************************************************************************************/
// 					Другое
/******************************************************************************************/

INSTANCE ItPo_DSG_LansPotion(C_Item) // ГГ выпивает его в диалоге с Ланом
{	
	visual 		=	"ItMi_Flask.3ds";
	on_state[0]	=	UseItPo_DSG_LansPotion;
	COUNT[1]	= 	0;
};

func void UseItPo_DSG_LansPotion()
{
};