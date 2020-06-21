
prototype ITMW_Shield_Proto(C_ITEM)
{
	name 					= "Щит";
	mainflag 				= ITEM_KAT_NF;
	flags 					= ITEM_SHIELD;
	material 				= MAT_METAL;
	damagetype 				= DAM_EDGE;
	damagetotal				= 1;
	range 					= 100;
	on_equip 				= S_Shield_01;
	on_unequip 				= S_Shield_02;
	
	description 			= name;
	text[0] 				= NAME_TalentShield_needed;
	text[1] 				= Name_DS_Prot_EdgeAndPoint;
	text[5] 				= NAME_Value;
};

//=========================
//"Щит Паука" - спрятан в ратуше
//=========================
instance ITMW_DSP_SpiderShield(ITMW_Shield_Proto)
{
	flags = ITEM_MISSION;
	name 					= "Защита Паука";
	visual 					= "Shield_07.3DS";
	description 			= name;
	
	range 					= 130;
	
	protection[PROT_EDGE] 	= 5;
	protection[PROT_BLUNT] 	= 5;
	protection[PROT_POINT] 	= 5;
	count[1] 				= protection[PROT_EDGE];
	
	cond_atr[1] 			= ATR_STRENGTH;		cond_value[1] 		= 25;
	cond_atr[2] 			= ATR_DEXTERITY;	cond_value[2] 		= 35;
	text[3] 				= NAME_Str_needed;	count[3] 			= cond_value[1];
	text[4] 				= NAME_Dex_needed;	count[4] 			= cond_value[2];
	
	value 					= 300;				count[5] 			= value;
	
	on_equip 				= Equip_ITMW_DSP_SpiderShield;
	on_unequip 				= UnEquip_ITMW_DSP_SpiderShield;
};
func void Equip_ITMW_DSP_SpiderShield()
{
	S_Shield_01();
	Bonus_WeaverShield_Equipped = TRUE;
	GiveBonus_WeaverComplect();
};
func void UnEquip_ITMW_DSP_SpiderShield()
{
	S_Shield_02();
	Bonus_WeaverShield_Equipped = FALSE;
	GiveBonus_WeaverComplect();
};