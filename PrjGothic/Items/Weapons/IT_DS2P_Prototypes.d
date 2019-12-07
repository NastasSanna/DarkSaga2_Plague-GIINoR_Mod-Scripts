
//--------------------------------------------------------------
//œ–Œ“Œ“»œ  ŒÀ‹÷¿
//--------------------------------------------------------------
const int Value_Ri_DS2P_Proto = 500;
Prototype ItRi_Proto(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;	flags = ITEM_RING;
	visual = "ItRi_Str_02.3ds"; effect = "SPELLFX_ITEMGLIMMER";
	visual_skin = 0;	material = MAT_METAL;	wear = WEAR_EFFECT; value = Value_Ri_DS2P_Proto;
	text[5] = NAME_Value;	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
//--------------------------------------------------------------
//œ–Œ“Œ“»œ ¿Ã”À≈“¿
//--------------------------------------------------------------
const int Value_Am_DS2P_Proto = 500;
prototype ItAm_Proto(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;	flags = ITEM_AMULET;material = MAT_METAL;
	visual = "ItAm_Prot_Fire_01.3ds";	visual_skin = 0;	wear = WEAR_EFFECT;	effect = "SPELLFX_ITEMGLIMMER";
	value = Value_Am_DS2P_Proto;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
//--------------------------------------------------------------
//œ–Œ“Œ“»œ œŒﬂ—¿
//--------------------------------------------------------------
const int Value_BE_DS2P_Proto = 300;
prototype ItBE_DS2P_Proto(C_Item)
{
	name = NAME_Addon_Belt; description = name;
	mainflag = ITEM_KAT_MAGIC;	flags = ITEM_BELT | ITEM_MULTI;
	material = MAT_LEATHER;
	visual = "ItMI_Belt_01.3ds";	visual_skin = 0;
	value = Value_BE_DS2P_Proto;
	text[5] = NAME_Value;	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};
//--------------------------------------------------------------
//œ–Œ“Œ“»œ ¿–¡¿À≈“¿
//--------------------------------------------------------------
//*NS - 27/06/13
const int Value_Rw_DS2P_Crossbow_Proto = 500;
const int Damage_Rw_DS2P_Crossbow_Proto = 50;
const int Condition_Rw_DS2P_Crossbow_Proto = 50;
prototype ItRw_DS2P_Crossbow_Proto(C_Item)
{
	name = "¿·‡ÎÂÚ";	description = name;	visual = "ItRw_Mil_Crossbow.mms";
	mainflag = ITEM_KAT_FF;	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	
	damageTotal = Damage_Rw_DS2P_Crossbow_Proto;	damagetype = DAM_POINT;
	munition = ItRw_Bolt_01;
	
	cond_atr[2] = ATR_STRENGTH;	cond_value[2] = Condition_Rw_DS2P_Crossbow_Proto;

	value = Value_Rw_DS2P_Crossbow_Proto;
	text[2] = NAME_Damage;			count[2] = damageTotal;
	text[3] = NAME_Str_needed;		count[3] = cond_value[2];
	text[5] = NAME_Value;			count[5] = value;
};
