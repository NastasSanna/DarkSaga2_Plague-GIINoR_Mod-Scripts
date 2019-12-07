const int Value_DS2P_Blood_Warg = 15;
const int Value_DS2P_Blood_Shadowbeast = 20;
const int Value_DS2P_Teeth_Warg = 15;
const int Value_DS2P_Heart_SwampGolem = 300;
const int Value_BlackTrollBone = 350;

instance ItAt_DS2P_Blood_Warg(C_Item)
{
	name = "Кровь варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS2P_Blood_Warg;				//15
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_Glas;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
instance ItAt_DS2P_Blood_Shadowbeast(C_Item)
{
	name = "Кровь мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS2P_Blood_Shadowbeast;	//20
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_Glas;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};
instance ItAt_DS2P_Teeth_Warg(C_Item)
{
	name = "Клыки варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS2P_Teeth_Warg;				//15
	visual = "ItAt_Teeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_DS2P_Heart_SwampGolem(C_Item)
{
	name = "Сердце болотного голема";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DS2P_Heart_SwampGolem;			//300
	visual = "ItAt_SwampDragonHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_DS2P_ShadowHorn_Competition(C_Item)
{
	name = "Рог мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ShadowHorn;
	visual = "ItAt_ShadowHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Этот рог добыт в соревновании с Серой Бородой.";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_DS2P_BlackTrollBone(C_Item)
{
	name = "Кость черного тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BlackTrollBone;
	visual = "ItAt_BlackTrollBone.3DS"; //UNFINISHED
	material = MAT_LEATHER;
	description = name;
	text[1] = "Из нее выйдет отличная рукоять для топора.";
	text[5] = NAME_Value;
	count[5] = value;
};
