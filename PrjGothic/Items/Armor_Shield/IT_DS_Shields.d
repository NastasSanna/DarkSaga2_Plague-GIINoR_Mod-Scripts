//-------------------------
instance BUG_Shield(C_Item)
{
	name = "Антибагощит";	description = name;
	mainflag = ITEM_KAT_NF;	flags = ITEM_SHIELD;
	visual = "Shield_01.3DS";
	material = MAT_METAL;
	value = 0;
	cond_atr[0] = ATR_DEXTERITY;	cond_value[0] = 10;
	protection[PROT_EDGE] 	= 0;
	protection[PROT_BLUNT] 	= 0;
	protection[PROT_POINT] 	= 0;
	damagetype  = DAM_EDGE;	damagetotal = 0;	range = 0;
	on_equip = equip_BUG_Shield;		on_unequip = unequip_BUG_Shield;
	text[1] 	= "Бонус: защита от насекомых";
	text[3] 	= "Навык владения щитом не требуется";
	text[5] 	= NAME_Value;			count[5] = -500;
};

instance ITMW_DarkSaga_Shield_01(C_Item)
{
	name 					= "Щит";
	mainflag 				= ITEM_KAT_NF;
	flags 					= ITEM_SHIELD;
	material 				= MAT_METAL;
	value 					= 100;
	protection[PROT_EDGE] 	= 10;
	protection[PROT_BLUNT] 	= 10;
	protection[PROT_POINT] 	= 10;
	damagetype 				= DAM_EDGE;
	damagetotal			= 2;
	range 					= 130;
//	cond_atr[0] 			= ATR_REGENERATEMANA;
//	cond_value[0] 			= 20;
	cond_atr[2] 			= ATR_STRENGTH;
	cond_value[2] 			= 20;
	//munition = ITRW_DS_FAKEBOLT;
	visual 					= "Shield_01.3DS";
	//visual 					= "Shield_03.3DS";
	on_equip 				= S_Shield_01;
	on_unequip 				= S_Shield_02;
	description 			= name;
	text[1] 				= NAME_Prot_Edge;
	count[1] 				= protection[PROT_EDGE];
	text[2] 				= NAME_Prot_Point;
	count[2] 				= protection[PROT_POINT];
	text[3] 				= NAME_TalentShield_needed;
	text[4] 				= NAME_Str_needed;
	count[4] 				= cond_value[2];
	text[5] 				= NAME_Value;
	count[5] 				= value;
};

//======================================================

func void S_Shield_01()
{
	// при загрузке игры в начале игровой сессии вставка сохраненных npc идет до вызова startup!
	// без инициализации Икаруса - вылет
	INIT_Ikarus_Lego();
	
	//MEM_DEBUG("S_Shield_01");
	if (self.aivar[AIV_ShieldEquipped] == FALSE)	{
		//MEM_DEBUG("aivar[AIV_ShieldEquipped] = TRUE");
		B_CreateShieldSlots(self);
		Mdl_ApplyOverlayMds(self,"HUM_SHIELD2.MDS");
		self.aivar[AIV_ShieldEquipped] = ITEM_SHIELD;
	};
};

func void S_Shield_02()
{
	//MEM_DEBUG("S_Shield_02");
	if (self.aivar[AIV_ShieldEquipped] >= ITEM_SHIELD)	{
		//MEM_DEBUG("aivar[AIV_ShieldEquipped] = FALSE");
		Mdl_RemoveOverlayMds(self,"HUM_SHIELD2.MDS");
		self.aivar[AIV_ShieldEquipped] = FALSE;
	};
};
func void equip_BUG_Shield()
{
	S_Shield_01();
};
func void unequip_BUG_Shield()
{
	S_Shield_02();
};

// Щит Френсиса
// -- -----------------закончен
instance ITMW_Frensis_Shield(C_Item)	//Старый щит паладина - Щит Френсиса
{
	name 					= "Старый щит паладина";
	mainflag 				= ITEM_KAT_NF;
	flags 					= ITEM_SHIELD;
	material 				= MAT_WOOD;
	value 					= 1000;
	protection[PROT_EDGE] 	= 10;
	protection[PROT_BLUNT] 	= 10;
	protection[PROT_POINT] 	= 10;
	protection[PROT_FIRE] 	= 10;
	damagetype 				= DAM_EDGE;
	damagetotal			= 4;
	range 					= 130;
//	cond_atr[0] 			= ATR_REGENERATEMANA;
//	cond_value[0] 			= 20;
	cond_atr[1] 			= ATR_STRENGTH;
	cond_value[1] 			= 30;
	cond_atr[2] 			= ATR_DEXTERITY;
	cond_value[2] 			= 20;
	//munition = ITRW_DS_FAKEBOLT;
	on_equip 				= Equip_FrensisShield;
	on_unequip 				= UnEquip_FrensisShield;
	visual 					= "Shield_02.3DS";
	//visual 					= "Shield_03.3DS";
	description 			= name;
	text[0] 				= NAME_TalentShield_needed;
	text[1] 				= NAME_DS_Prot_EdgeAndPointAndFire;
	count[1] 				= protection[PROT_EDGE];
	text[2] 				= NAME_Str_needed;
	count[2] 				= cond_value[1];
	text[3] 				= NAME_Dex_needed;
	count[3] 				= cond_value[2];
	//text[4] 				= NAME_ADDON_BONUS_1H;
	//count[4] 				= 5;
	text[5] 				= NAME_Value;
	count[5] 				= value;
};
func void Equip_FrensisShield()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
	S_Shield_01();
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,false);
};
func void UnEquip_FrensisShield()
{
	S_Shield_02();
	B_AddFightSkill(self,NPC_TALENT_1H,-5);	
};
//----------
instance ITMW_DarkSaga_Shield_ds_03(C_Item)	//Щит Теней - Можно найти в Лавовой Локе
{
	name 					= "Щит Теней";
	mainflag 				= ITEM_KAT_NF;
	flags 					= ITEM_SHIELD;
	material 				= MAT_METAL;
	value 					= 2000;
	protection[PROT_EDGE] 	= 20;
	protection[PROT_BLUNT] 	= 20;
	protection[PROT_POINT] 	= 20;
	protection[PROT_FIRE] 	= 20;
	damagetype 				= DAM_EDGE;
	damagetotal			= 6;
	range 					= 130;
//	cond_atr[0] 			= ATR_REGENERATEMANA;
//	cond_value[0] 			= 20;
	cond_atr[1] 			= ATR_STRENGTH;
	cond_value[1] 			= 50;
	cond_atr[2] 			= ATR_DEXTERITY;
	cond_value[2] 			= 30;
	//munition = ITRW_DS_FAKEBOLT;
	on_equip 				= S_Shield_01;
	on_unequip 				= S_Shield_02;
	visual 					= "Shield_03.3DS";
	description 			= name;
	text[0] 				= NAME_TalentShield_needed;
	text[1] 				= Name_DS_Prot_EdgeAndPoint ;
	count[1] 				= protection[PROT_EDGE];
	text[2] 				= Name_Prot_Fire ;
	count[2] 				= protection[PROT_FIRE];
	text[3] 				= NAME_Str_needed;
	count[3] 				= cond_value[1];
	text[4] 				= NAME_Dex_needed;
	count[4] 				= cond_value[2];
	text[5] 				= NAME_Value;
	count[5] 				= value;
};
instance ITMW_DarkSaga_Shield_ds_04(C_Item)	//Ржавый щит - для скелетов с оверлеем щита
{
	name 					= "Ржавый щит";	
	mainflag 				= ITEM_KAT_NF;
	flags 					= ITEM_SHIELD;
	material 				= MAT_METAL;
	value 					= 200;
	protection[PROT_EDGE] 	= 5;
	protection[PROT_BLUNT] 	= 5;
	protection[PROT_POINT] 	= 5;
	protection[PROT_FIRE] 	= 0;
	damagetype 				= DAM_POINT;
	damagetotal			= 0;
	range 					= 130;
//	cond_atr[0] 			= ATR_REGENERATEMANA;
//	cond_value[0] 			= 20;
	cond_atr[1] 			= ATR_STRENGTH;
	cond_value[1] 			= 20;
	cond_atr[2] 			= ATR_DEXTERITY;
	cond_value[2] 			= 10;
	//munition = ITRW_DS_FAKEBOLT;
	on_equip 				= S_Shield_01;
	on_unequip 				= S_Shield_02;
	visual 					= "Shield_04.3DS";
	description 			= name;
	text[0] 				= NAME_TalentShield_needed;
	text[1] 				= Name_DS_Prot_EdgeAndPoint ;
	count[1] 				= protection[PROT_EDGE];
	//text[2] 				= Name_Prot_Fire ;
	//count[2] 				= protection[PROT_FIRE];
	text[3] 				= NAME_Str_needed;
	count[3] 				= cond_value[1];
	text[4] 				= NAME_Dex_needed;
	count[4] 				= cond_value[2];
	text[5] 				= NAME_Value;
	count[5] 				= value;
};

instance ITMW_DarkSaga_Shield_ds_05(C_Item)	//Щит Гнева - Можно найти в Храме Черепа (неподалеку от входа)
{
	name 					= "Щит Гнева";
	mainflag 				= ITEM_KAT_NF;
	flags 					= ITEM_SHIELD;
	material 				= MAT_METAL;
	value 					= 3000;
	protection[PROT_EDGE] 	= 25;
	protection[PROT_BLUNT] 	= 25;
	protection[PROT_POINT] 	= 25;
	protection[PROT_FIRE] 	= 25;
	damagetype 				= DAM_EDGE;
	damagetotal			= 8;
	range 					= 130;
//	cond_atr[0] 			= ATR_REGENERATEMANA;
//	cond_value[0] 			= 20;
	cond_atr[1] 			= ATR_STRENGTH;
	cond_value[1] 			= 60;
	cond_atr[2] 			= ATR_DEXTERITY;
	cond_value[2] 			= 35;
	//munition = ITRW_DS_FAKEBOLT;
	on_equip 				= S_Shield_01;
	on_unequip 				= S_Shield_02;
	visual 					= "Shield_05.3DS";
	description 			= name;
	text[0] 				= NAME_TalentShield_needed;
	text[1] 				= Name_DS_Prot_EdgeAndPoint ;
	count[1] 				= protection[PROT_EDGE];
	text[2] 				= Name_Prot_Fire ;
	count[2] 				= protection[PROT_FIRE];
	text[3] 				= NAME_Str_needed;
	count[3] 				= cond_value[1];
	text[4] 				= NAME_Dex_needed;
	count[4] 				= cond_value[2];
	text[5] 				= NAME_Value;
	count[5] 				= value;
};
 instance ITMW_DarkSaga_Shield_ds_06(C_Item)	//Щит Доблести - металл. щит паладина \\ Можно найти в старом форте, в подземелье
{
	name 					= "Щит Доблести";
	mainflag 				= ITEM_KAT_NF;
	flags 					= ITEM_SHIELD;
	material 				= MAT_METAL;
	value 					= 800;
	protection[PROT_EDGE] 	= 15;
	protection[PROT_BLUNT] 	= 15;
	protection[PROT_POINT] 	= 15;
	protection[PROT_FIRE] 	= 15;
	damagetype 				= DAM_EDGE;
	damagetotal			= 5;
	range 					= 130;
//	cond_atr[0] 			= ATR_REGENERATEMANA;
//	cond_value[0] 			= 20;
	cond_atr[1] 			= ATR_STRENGTH;
	cond_value[1] 			= 40;
	cond_atr[2] 			= ATR_DEXTERITY;
	cond_value[2] 			= 25;
	//munition = ITRW_DS_FAKEBOLT;
	on_equip 				= S_Shield_01;
	on_unequip 				= S_Shield_02;
	visual 					= "Shield_06.3DS";
	description 			= name;
	text[0] 				= NAME_TalentShield_needed;
	text[1] 				= Name_DS_Prot_EdgeAndPoint ;
	count[1] 				= protection[PROT_EDGE];
	text[2] 				= Name_Prot_Fire ;
	count[2] 				= protection[PROT_FIRE];
	text[3] 				= NAME_Str_needed;
	count[3] 				= cond_value[1];
	text[4] 				= NAME_Dex_needed;
	count[4] 				= cond_value[2];
	text[5] 				= NAME_Value;
	count[5] 				= value;
};
instance ITMW_DarkSaga_Shield_ds_07(C_Item)	//Щит Стражника - Можно найти в одной из пещер на острове
{
	name 					= "Щит Стражника";
	mainflag 				= ITEM_KAT_NF;
	flags 					= ITEM_SHIELD;
	material 				= MAT_METAL;
	value 					= 500;
	protection[PROT_EDGE] 	= 5;
	protection[PROT_BLUNT] 	= 5;
	protection[PROT_POINT] 	= 5;
	damagetype 				= DAM_EDGE;
	damagetotal			= 1;
	range 					= 130;
//	cond_atr[0] 			= ATR_REGENERATEMANA;
//	cond_value[0] 			= 20;
	cond_atr[1] 			= ATR_STRENGTH;
	cond_value[1] 			= 25;
	cond_atr[2] 			= ATR_DEXTERITY;
	cond_value[2] 			= 15;
	//munition = ITRW_DS_FAKEBOLT;
	on_equip 				= S_Shield_01;
	on_unequip 				= S_Shield_02;
	visual 					= "Shield_07.3DS";
	description 			= name;
	text[0] 				= NAME_TalentShield_needed;
	text[1] 				= Name_DS_Prot_EdgeAndPoint ;
	count[1] 				= protection[PROT_EDGE];
	text[3] 				= NAME_Str_needed;
	count[3] 				= cond_value[1];
	text[4] 				= NAME_Dex_needed;
	count[4] 				= cond_value[2];
	text[5] 				= NAME_Value;
	count[5] 				= value;
};
