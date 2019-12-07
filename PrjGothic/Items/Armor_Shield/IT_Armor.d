
const int VALUE_ITAR_Governor = 1100;
const int VALUE_ITAR_Judge = 0;
const int VALUE_ITAR_Smith = 0;
const int VALUE_ITAR_Barkeeper = 0;
const int VALUE_ITAR_Vlk_L = 120;
const int VALUE_ITAR_Vlk_M = 120;
const int VALUE_ITAR_Vlk_H = 120;
const int VALUE_ITAR_VlkBabe_L = 0;
const int VALUE_ITAR_VlkBabe_M = 0;
const int VALUE_ITAR_VlkBabe_H = 0;
const int VALUE_ITAR_MIL_L = 600;
const int VALUE_ITAR_MIL_M = 2500;
const int VALUE_ITAR_PAL_M = 5000;
const int VALUE_ITAR_PAL_H = 20000;
const int VALUE_ITAR_Bau_L = 80;
const int VALUE_ITAR_Bau_M = 100;
const int VALUE_ITAR_BauBabe_L = 0;
const int VALUE_ITAR_BauBabe_M = 0;
const int VALUE_ITAR_SLD_L = 500;
const int VALUE_ITAR_SLD_M = 1000;
const int VALUE_ITAR_DJG_Crawler = 1500;
const int VALUE_ITAR_SLD_H = 2500;
const int VALUE_ITAR_NOV_L = 280;
const int VALUE_ITAR_KDF_L = 500;
const int VALUE_ITAR_KDF_H = 3000;
const int VALUE_ITAR_Leather_L = 250;
const int VALUE_ITAR_BDT_M = 550;
const int VALUE_ITAR_BDT_H = 2100;
const int VALUE_ITAR_DJG_L = 3000;
const int VALUE_ITAR_DJG_M = 12000;
const int VALUE_ITAR_DJG_H = 20000;
const int VALUE_ITAR_DJG_Babe = 0;
const int VALUE_ITAR_XARDAS = 15000;
const int VALUE_ITAR_LESTER = 300;
const int VALUE_ITAR_Diego = 450;
const int VALUE_ITAR_CorAngar = 600;
const int VALUE_ITAR_Dementor = 500;
const int VALUE_ITAR_KDW_H = 450;
const int VALUE_ITAR_Prisoner = 100;
//-------------------------------------------------------------------
//-----------------------------ОДЕЖДА ГОРОЖАН------------------------
instance ITAR_Governor(ITAR_DS_Proto)
{
	name = "Дублет губернатора";	visual = "ItAr_Governor.3ds";	visual_change = "Armor_Governor.asc";
	description = name;
	protection[PROT_EDGE] = 40;	protection[PROT_BLUNT] = 40;	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Governor;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_Judge(ITAR_DS_Proto)
{
	name = "Мантия судьи";	visual = "ItAr_Governor.3DS";	visual_change = "Armor_Judge.asc";
	description = name; //flags = flags | ITEM_CREATEAMMO | ITEM_DROPPED | ITEM_DRINK | ITEM_TORCH | ITEM_THROW;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Judge;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_Smith(ITAR_DS_Proto)
{
	name = "Одежда кузнеца";	visual = "ItAr_Smith.3DS";	visual_change = "Armor_Smith.asc";
	description = name;	
	protection[PROT_EDGE] = 15;	protection[PROT_BLUNT] = 15;	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 5;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Smith;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_Barkeeper(ITAR_DS_Proto)
{
	name = "Одежда горожанина";	visual = "ItAr_Wirt.3DS";	visual_change = "Armor_Barkeeper.asc";
	description = name;	
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Barkeeper;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_Vlk_L(ITAR_DS_Proto)
{
	name = "Одежда горожанина";	visual = "ItAr_VLK_L.3DS";	visual_change = "Armor_Vlk_L.asc";
	description = name;	
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_L;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_Vlk_M(ITAR_DS_Proto)
{
	name = "Одежда горожанина";	visual = "ItAr_VLK_M.3DS";	visual_change = "Armor_Vlk_M.asc";
	description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_M;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];	
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_Vlk_H(ITAR_DS_Proto)
{
	name = "Одежда горожанина";	visual = "ItAr_VLK_H.3DS";	visual_change = "Armor_Vlk_H.asc";
	description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Vlk_H;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_VlkBabe_L(ITAR_DS_Proto)
{
	name = "Одежда горожанина 1";	visual = "ItAr_VLKBabe.3DS";	visual_change = "Armor_VlkBabe_L.asc";
	description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_VlkBabe_L;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_VlkBabe_M(ITAR_DS_Proto)
{
	name = "Одежда горожанина 2";	visual = "ItAr_VLKBabe.3DS";	visual_change = "Armor_VlkBabe_M.asc";
	description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_VlkBabe_M;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_VlkBabe_H(ITAR_DS_Proto)
{
	name = "Одежда горожанина 3";	visual = "ItAr_VLKBabe.3DS";	visual_change = "Armor_VlkBabe_H.asc";
	description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_VlkBabe_H;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
//----------------------------------------------------------------------
//-----------------------------ДОСПЕХИ ОПОЛЧЕНИЯ------------------------
instance ITAR_Mil_L(ITAR_DS_Proto)
{
	name = "Легкие доспехи ополчения";	visual = "ItAr_MIL_L.3DS";	visual_change = "Armor_Mil_L.asc";
	description = name;
	protection[PROT_EDGE] = 40;	protection[PROT_BLUNT] = 40;	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = value_itar_mil_l;
	on_equip = Equip_ITAR_MIL_L;
	on_unequip = UnEquip_ITAR_MIL_L;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_MIL_L()
{
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = TRUE;
		if(MIL01_Equipped == TRUE)
		{	
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);	
		};
	};
};
func void UnEquip_ITAR_MIL_L()
{
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = FALSE;
		if(MIL01_Equipped == TRUE)
		{	
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};		
	};
};
instance ItAr_MIL_M(ITAR_DS_Proto)
{
	name = "Тяжелые доспехи ополчения";	visual = "ItAr_MIL_M.3DS";	visual_change = "Armor_MIL_M.asc";
	description = name;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;	protection[PROT_MAGIC] = 10;
	value = value_itar_mil_m;
	on_equip = Equip_ITAR_MIL_M;
	on_unequip = UnEquip_ITAR_MIL_M;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_MIL_M()
{
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = TRUE;
		if(MIL01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_MIL_M()
{
	if(Npc_IsPlayer(self))
	{
		MILArmor_Equipped = FALSE;
		if(MIL01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};
//----------------------------------------------------------------------
//-----------------------------ДОСПЕХИ ПАЛОВ----------------------------
instance ItAr_PAL_M(ITAR_DS_Proto)
{
	name = "Доспехи рыцаря";	visual = "ItAr_Pal_M.3ds";	visual_change = "Armor_Pal_M.asc";
	description = name;	
	material = MAT_METAL;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;	
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 25;
	value = value_itar_pal_m;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_PAL_M_Blood(ITAR_DS_Proto)
{
	name = "Окровавленные доспехи рыцаря";	visual = "ItAr_Pal_M.3ds";	visual_change = "Armor_Pal_M_Blood.asc";
	description = name;	
	material = MAT_METAL;	
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;	
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 25;
	value = value_itar_pal_m;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_PAL_ML(ITAR_DS_Proto)	//Доспех рыцаря без шлема
{
	name = "Легкие доспехи рыцаря";	visual = "ItAr_Pal_M.3ds";	visual_change = "Armor_Pal_ML.asc";
	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 25;
	value = value_itar_pal_m;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_PAL_ML_Blood(ITAR_DS_Proto)	//Доспех рыцаря без шлема
{
	name = "Окровавленные легкие доспехи рыцаря";	visual = "ItAr_Pal_M.3ds";	visual_change = "Armor_Pal_ML_Blood.asc";
	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 25;
	value = value_itar_pal_m;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_PAL_HL(ITAR_DS_Proto)	//Доспехи Равена с текстурой паладина - являются доспехами пала без шлема
{
	name = "Легкие доспехи паладина";	visual = "ItAr_Pal_H.3ds";	visual_change = "Armor_Pal_HL.asc";
	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 25;
	value = value_itar_pal_m;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_PAL_HL_Blood(ITAR_DS_Proto)	//Доспехи Равена с текстурой паладина - являются доспехами пала без шлема
{
	name = "Окровавленные легкие доспехи паладина";	visual = "ItAr_Pal_H.3ds";	visual_change = "Armor_Pal_HL_Blood.asc";
	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 25;
	value = value_itar_pal_m;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_PAl_H(ITAR_DS_Proto)
{
	name = "Доспехи паладина";	visual = "ItAr_Pal_H.3ds";	visual_change = "Armor_Pal_H.asc";
	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 150;	protection[PROT_BLUNT] = 150;	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 100;	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_h;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_PAl_H_Blood(ITAR_DS_Proto)
{
	name = "Окровавленные доспехи паладина";	visual = "ItAr_Pal_H.3ds";	visual_change = "Armor_Pal_H_Blood.asc";
	material = MAT_METAL;
	description = name;
	protection[PROT_EDGE] = 150;	protection[PROT_BLUNT] = 150;	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 100;	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_h;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
//------------------------------------------------------------------------
//-----------------------ОДЕЖДА ФЕРМЕРОВ----------------------------------
instance ITAR_Bau_L(ITAR_DS_Proto)
{
	name = "Одежда фермера 1";	visual = "ItAr_Bau_L.3DS";	visual_change = "Armor_Bau_L.asc";
	description = name;
	protection[PROT_EDGE] = 15;	protection[PROT_BLUNT] = 15;	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Bau_L;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_Bau_M(ITAR_DS_Proto)
{
	name = "Одежда фермера 2";	visual = "ItAr_Bau_M.3DS";	visual_change = "Armor_Bau_M.asc";
	description = name;
	protection[PROT_EDGE] = 15;	protection[PROT_BLUNT] = 15;	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Bau_M;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_BauBabe_L(ITAR_DS_Proto)
{
	name = "Женская фермерская одежда 1";	visual = "ItAr_VLKBabe.3DS";	visual_change = "Armor_BauBabe_L.asc";
	description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BauBabe_L;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_BauBabe_M(ITAR_DS_Proto)
{
	name = "Женская фермерская одежда 2";	visual = "ItAr_VLKBabe.3DS";	visual_change = "Armor_BauBabe_M.asc";
	description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_BauBabe_M;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
//------------------------------------------------------------------------
//-----------------------ОДЕЖДА НАЕМНИКОВ---------------------------------
instance ItAr_Sld_L(ITAR_DS_Proto)
{
	name = "Легкие доспехи наемника";	visual = "ItAr_Sld_L.3ds";	visual_change = "Armor_Sld_L.asc";
	description = name;
	protection[PROT_EDGE] = 30;	protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = value_itar_sld_l;
	on_equip = Equip_ITAR_SLD_L;
	on_unequip = UnEquip_ITAR_SLD_L;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_SLD_L()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_SLD_L()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};

instance itar_sld_M(ITAR_DS_Proto)
{
	name = "Средние доспехи наемника";	visual = "ItAr_Sld_M.3ds";	visual_change = "Armor_Sld_M.asc";
	description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 5;
	value = value_itar_sld_m;
	on_equip = Equip_ITAR_SLD_M;
	on_unequip = UnEquip_ITAR_SLD_M;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_SLD_M()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_SLD_M()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};

instance ItAr_Sld_H(ITAR_DS_Proto)
{
	name = "Тяжелые доспехи наемника";	visual = "ItAr_Sld_H.3ds";	visual_change = "Armor_Sld_H.asc";
	description = name;
	protection[PROT_EDGE] = 80;	protection[PROT_BLUNT] = 80;	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 5;	protection[PROT_MAGIC] = 10;
	value = value_itar_sld_h;
	on_equip = Equip_ITAR_SLD_H;
	on_unequip = UnEquip_ITAR_SLD_H;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_SLD_H()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;
		if(SLD01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_SLD_H()
{
	if(Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;
		if(SLD01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};

instance ITAR_DJG_Crawler(ITAR_DS_Proto)
{
	name = "Доспехи из панцирей ползунов";	visual = "ItAr_Djg_Crawler.3ds";	visual_change = "Armor_Djg_Crawler.asc";
	description = name;material = MAT_WOOD;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_DJG_Crawler;
	on_equip = Equip_ITAR_DJG_Crawler;
	on_unequip = UnEquip_ITAR_DJG_Crawler;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_DJG_Crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCArmor_Equipped = TRUE;
		if(MC_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_DJG_Crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCArmor_Equipped = FALSE;
		if(MC_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};

instance ITAR_DJG_L(ITAR_DS_Proto)
{
	name = "Легкие доспехи охотника на драконов";	visual = "ItAr_Djg_L.3ds";	visual_change = "Armor_Djg_L.asc";
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 25;
	value = value_itar_djg_l;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_DJG_M(ITAR_DS_Proto)
{
	name = "Средние доспехи охотника на драконов";	visual = "ItAr_Djg_M.3ds";	visual_change = "Armor_Djg_M.asc";
	description = name;
	protection[PROT_EDGE] = 120;	protection[PROT_BLUNT] = 120;	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 75;		protection[PROT_MAGIC] = 35;
	value = value_itar_djg_m;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_DJG_H(ITAR_DS_Proto)
{
	name = "Тяжелые доспехи охотника на драконов";	visual = "ItAr_Djg_H.3ds";	visual_change = "Armor_Djg_H.asc";
	description = name;
	protection[PROT_EDGE] = 150;	protection[PROT_BLUNT] = 150;	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 100;	protection[PROT_MAGIC] = 50;
	value = value_itar_djg_h;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_DJG_Babe(ITAR_DS_Proto)
{
	name = "Женские доспехи охотника на драконов";	visual = "ItAr_Djg_L.3DS";	visual_change = "Armor_Djg_Babe.asc";
	description = name;
	protection[PROT_EDGE] = 60;	protection[PROT_BLUNT] = 60;	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_DJG_Babe;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
//-----------------------------------------------------------------------
//-----------------------ОДЕЖДА МАГОВ ОГНЯ-------------------------------
instance ItAr_NOV_L(ITAR_DS_Proto)
{
	name = "Роба послушника";	visual = "ItAr_Nov_L.3ds";	visual_change = "Armor_Nov_L.asc";
	description = name;
	protection[PROT_EDGE] = 25;	protection[PROT_BLUNT] = 25;	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 10;
	value = value_itar_nov_l;
	on_equip = Equip_ITAR_NOV_L;
	on_unequip = UnEquip_ITAR_NOV_L;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_NOV_L()
{
	if(Npc_IsPlayer(self))
	{
		NOVArmor_Equipped = TRUE;
		if(NOV01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_NOV_L()
{
	if(Npc_IsPlayer(self))
	{
		NOVArmor_Equipped = FALSE;
		if(NOV01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};

instance ItAr_KDF_L(ITAR_DS_Proto)
{
	name = "Мантия мага огня";	visual = "ItAr_KdF_L.3ds";	visual_change = "Armor_Kdf_L.asc";
	description = name;
	protection[PROT_EDGE] = 40;	protection[PROT_BLUNT] = 40;	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;	protection[PROT_MAGIC] = 20;
	value = value_itar_kdf_l;
	on_equip = Equip_ITAR_KDF_L;
	on_unequip = UnEquip_ITAR_KDF_L;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_KDF_L()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = TRUE;
		if(KDF01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_KDF_L()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = FALSE;
		if(KDF01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};
instance ItAr_KDF_H(ITAR_DS_Proto)
{
	name = "Тяжелая огненная мантия";	visual = "ItAr_KdF_H.3ds";	visual_change = "Armor_Kdf_H.asc";
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 50;
	value = value_itar_kdf_h;
	on_equip = Equip_ITAR_KDF_H;
	on_unequip = UnEquip_ITAR_KDF_H;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_KDF_H()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = TRUE;
		if(KDF01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_KDF_H()
{
	if(Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = FALSE;
		if(KDF01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};
//----------------------------------------------------------------------
//-----------------------ОСТАЛЬНАЯ ОДЕЖДА-------------------------------
instance ITAR_Leather_L(ITAR_DS_Proto)
{
	name = "Кожаные доспехи";	visual = "ItAr_Leather_L.3ds";	visual_change = "Armor_Leather_L.asc";
	description = name;
	protection[PROT_EDGE] = 25;	protection[PROT_BLUNT] = 25;	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 5;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Leather_L;
	on_equip = Equip_ITAR_Leather_L;
	on_unequip = UnEquip_ITAR_Leather_L;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
func void Equip_ITAR_Leather_L()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = TRUE;
		if(Leather01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, BA_Bonus01);
		};
	};
};
func void UnEquip_ITAR_Leather_L()
{
	if(Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = FALSE;
		if(Leather01_Equipped == TRUE)
		{
			B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -BA_Bonus01);
		};
	};
};

instance ItAr_BDT_M(ITAR_DS_Proto)
{
	name = "Средние доспехи бандита";	visual = "ItAr_Bdt_M.3ds";	visual_change = "Armor_Bdt_M.asc";
	description = name;
	protection[PROT_EDGE] = 35;	protection[PROT_BLUNT] = 35;	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = value_itar_bdt_m;
	text[0] = PRINT_Addon_BDTArmor;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_BDT_H(ITAR_DS_Proto)
{
	name = "Тяжелые доспехи бандита";	visual = "ItAr_Bdt_H.3ds";	visual_change = "Armor_Bdt_H.asc";
	description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = value_itar_bdt_h;
	text[0] = PRINT_Addon_BDTArmor;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_Xardas(ITAR_DS_Proto)
{
	name = "Мантия черной магии";	visual = "ItAr_Xardas.3ds";	visual_change = "Armor_Xardas.asc";
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 50;
	value = value_itar_xardas;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_Lester(ITAR_DS_Proto)
{
	name = "Роба Лестера";	visual = "ItAr_Lester.3ds";	visual_change = "Armor_Lester.asc";
	description = name;
	protection[PROT_EDGE] = 25;	protection[PROT_BLUNT] = 25;	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = value_itar_lester;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_Diego(ITAR_DS_Proto)
{
	name = "Доспехи Диего";	visual = "ItAr_Diego.3ds";	visual_change = "Armor_Diego.asc";
	description = name;
	protection[PROT_EDGE] = 30;	protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Diego;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_CorAngar(ITAR_DS_Proto)
{
	name = "Доспехи Ангара";	visual = "ItAr_CorAngar.3ds";	visual_change = "Armor_CorAngar.asc";
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 25;
	value = VALUE_ITAR_CorAngar;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_Dementor(ITAR_DS_Proto)
{
	name = "Мантия тьмы";	visual = "ItAr_Xardas.3ds";	visual_change = "Armor_Dementor.asc";
	description = name;
	protection[PROT_EDGE] = 130;	protection[PROT_BLUNT] = 130;	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 65;		protection[PROT_MAGIC] = 65;
	value = VALUE_ITAR_Dementor;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_KDW_H(ITAR_DS_Proto)
{
	name = "Мантия мага воды";	visual = "ItAr_KdW_H.3ds";	visual_change = "Armor_KdW_H.asc";
	description = name;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 50;
	value = value_itar_kdw_h;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_Prisoner(ITAR_DS_Proto)
{
	name = "Одежда каторжника";	visual = "ItAr_Prisoner.3ds";	visual_change = "Armor_Prisoner.asc";
	description = name;
	protection[PROT_EDGE] = 20;	protection[PROT_BLUNT] = 20;	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Prisoner;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
//-----------------------------ПЕРЕНЕСЕНО-----------------
//ИЗ ФАЙЛА IT_Addon_Armor.d -->> IT_Armor.d *27.04.2012
const int VALUE_ITAR_Thorus_Addon = 1300;
const int VALUE_ITAR_Raven_Addon = 1300;
const int VALUE_Itar_OreBaron_Addon = 1300;
const int VALUE_ITAR_RANGER_Addon = 1300;
const int VALUE_ITAR_KDW_L_Addon = 1300;
const int VALUE_ITAR_Bloodwyn_Addon = 1300;

instance ITAR_Thorus_Addon(ITAR_DS_Proto)
{
	name = "Тяжелые доспехи стражника";	description = "Доспехи стражи Ворона";	
	visual = "ItAr_Thorus_ADDON.3ds";		visual_change = "Armor_Thorus_ADDON.asc";
	material = MAT_METAL;	
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Thorus_Addon;	
	text[0] = PRINT_Addon_BDTArmor;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_Raven_Addon(ITAR_DS_Proto)
{
	name = "Доспехи Ворона";	visual = "ItAr_Raven_ADDON.3ds";	visual_change = "Armor_Raven_ADDON.asc";
	description = name;
	material = MAT_METAL;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;	protection[PROT_MAGIC] = 100;
	value = VALUE_ITAR_Raven_Addon;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_OreBaron_Addon(ITAR_DS_Proto)
{
	name = "Доспехи рудного барона";	visual = "ItAr_CHAOS_ADDON.3ds";	visual_change = "Armor_CHAOS_ADDON.asc";
	description = name;
	material = MAT_METAL;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 70;	
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_Itar_OreBaron_Addon;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_RANGER_Addon(ITAR_DS_Proto)
{
	name = "Доспехи ”Кольца Воды”";	visual = "ItAr_Ranger_ADDON.3ds";	visual_change = "Armor_Ranger_ADDON.asc";
	description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 10;
	value = VALUE_ITAR_RANGER_Addon;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ITAR_Fake_RANGER(C_ITEM)
{
	name = "Разбитые доспехи";	visual = "ItAr_Ranger_ADDON.3ds";	visual_change = "Armor_Ranger_ADDON.asc";
	description = name;
	mainflag = ITEM_KAT_ARMOR;	flags = 0;	wear = WEAR_TORSO;	visual_skin = 0;	material = MAT_LEATHER;
	protection[PROT_EDGE] = 0;	protection[PROT_BLUNT] = 0;		protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_RANGER_Addon;	
	text[5] = NAME_Value;				count[5] = value;
};
instance ITAR_KDW_L_Addon(ITAR_DS_Proto)
{
	name = "Облачение магов воды";	visual = "ItAr_KDW_L_ADDON.3ds";	visual_change = "Armor_KDW_L_ADDON.asc";
	description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 50;	
	protection[PROT_FIRE] = 25;	protection[PROT_MAGIC] = 25;
	value = VALUE_ITAR_KDW_L_Addon;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_Bloodwyn_Addon(ITAR_DS_Proto)
{
	name = "Доспехи Бладвина";	visual = "ItAr_Bloodwyn_ADDON.3ds";	visual_change = "Armor_Bloodwyn_ADDON.asc";
	description = name;
	material = MAT_METAL;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_Bloodwyn_Addon;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ITAR_MayaZombie_Addon(ITAR_DS_Proto)
{
	name = "Старые доспехи";	visual = "ItAr_Raven_ADDON.3ds";	visual_change = "Armor_MayaZombie_Addon.asc";
	description = name;
	material = MAT_METAL;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;	protection[PROT_MAGIC] = 50;
	value = 0;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};
instance ItAr_FireArmor_Addon(ITAR_DS_Proto)
{
	name = "Магические доспехи";	effect = "SPELLFX_FIREARMOR";	visual = "ItAr_Xardas.3ds";	visual_change = "Armor_Xardas.asc";
	description = name;
	wear = WEAR_TORSO | WEAR_EFFECT;
	protection[PROT_EDGE] = 100;	protection[PROT_BLUNT] = 100;	protection[PROT_POINT] = 100;	
	protection[PROT_FIRE] = 50;		protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_XARDAS;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

