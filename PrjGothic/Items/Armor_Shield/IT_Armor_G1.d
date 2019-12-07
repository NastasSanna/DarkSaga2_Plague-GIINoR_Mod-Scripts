
const int ARMOR_VALUE_MULTIPLIER = 30;
const int VALUE_TPL_ARMOR_L = 1350;
const int VALUE_TPL_ARMOR_M = 1650;
const int VALUE_TPL_ARMOR_H = 2100;
const int VALUE_STT_ARMOR_M = 750;
const int VALUE_STT_ARMOR_H = 1200;
const int VALUE_GRD_ARMOR_L = 1350;
const int VALUE_GRD_ARMOR_M = 1650;
const int VALUE_GRD_ARMOR_H = 2100;
const int VALUE_KDF_ARMOR_L = 1200;
const int VALUE_KDF_ARMOR_H = 1500;
const int VALUE_KDW_ARMOR_L = 1950;
const int VALUE_KDW_ARMOR_H = 2100;
const int VALUE_ORG_ARMOR_L = 750;
const int VALUE_ORG_ARMOR_M = 1050;
const int VALUE_ORG_ARMOR_H = 1200;
const int VALUE_SLD_ARMOR_L = 1350;
const int VALUE_SLD_ARMOR_M = 1650;
const int VALUE_SLD_ARMOR_H = 2100;
const int VALUE_NOV_ARMOR_L = 500;
const int VALUE_NOV_ARMOR_M = 750;
const int VALUE_NOV_ARMOR_H = 1200;
const int VALUE_VLK_ARMOR_L = 250;
const int VALUE_VLK_ARMOR_M = 500;
const int VALUE_SFB_ARMOR_L = 250;

instance VLK_ARMOR_L(ITAR_DS_Proto)
{
	name = "Простые штаны для рудокопа";description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;	protection[PROT_MAGIC] = 0;
	visual = "vlkl.3ds";
	visual_change = "Hum_VLKL_ARMOR.asc";
	value = value_vlk_armor_l;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance STT_ARMOR_M(ITAR_DS_Proto)
{
	name = "Одеяние Призрака";	description = name;
	protection[PROT_EDGE] = 30;	protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 5;	
	protection[PROT_FIRE] = 15;	protection[PROT_MAGIC] = 0;
	visual = "sttm.3ds";
	visual_change = "Hum_STTM_ARMOR.asc";
	value = value_stt_armor_m;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance STT_ARMOR_H(ITAR_DS_Proto)
{
	name = "Доспехи Призрака";description = name;	
	protection[PROT_EDGE] = 40;	protection[PROT_BLUNT] = 40;	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_h;	
	visual = "stth.3ds";
	visual_change = "Hum_STTS_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance GRD_ARMOR_L(ITAR_DS_Proto)
{
	name = "Легкие доспехи стражника";description = name;
	protection[PROT_EDGE] = 45;	protection[PROT_BLUNT] = 45;	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_l;	
	visual = "grdl.3ds";
	visual_change = "Hum_GRDL_ARMOR.asc";
	description = name;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance GRD_ARMOR_M(ITAR_DS_Proto)
{
	name = "Доспехи стражника";description = name;
	protection[PROT_EDGE] = 55;	protection[PROT_BLUNT] = 55;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_m;
	visual = "grdm.3ds";
	visual_change = "Hum_GRDM_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance GRD_ARMOR_H(ITAR_DS_Proto)
{
	name = "Тяжелые доспехи стражника";description = name;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 35;	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_h;	
	visual = "grdh.3ds";
	visual_change = "Hum_GRDS_ARMOR.asc";	
	material = MAT_METAL;
	description = name;	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance EBR_ARMOR_H(ITAR_DS_Proto)
{
	name = "Доспехи Гомеза";description = name;	
	protection[PROT_EDGE] = 85;	protection[PROT_BLUNT] = 85;	protection[PROT_POINT] = 9;
	protection[PROT_FIRE] = 42;	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	visual = "ebrh.3ds";
	visual_change = "Hum_EBRS_ARMOR.asc";	
	material = MAT_METAL;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance EBR_ARMOR_H2(ITAR_DS_Proto)
{
	name = "Тяжелые доспехи Барона";description = name;
	protection[PROT_EDGE] = 80;	protection[PROT_BLUNT] = 80;	protection[PROT_POINT] = 8;
	protection[PROT_FIRE] = 40;	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	visual = "ebrh2.3ds";
	visual_change = "Hum_EBRS_ARMOR2.asc";	
	material = MAT_METAL;
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance SFB_ARMOR_L(ITAR_DS_Proto)
{
	name = "Одеяние рудокопа";description = name;
	protection[PROT_EDGE] = 10;	protection[PROT_BLUNT] = 10;	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;	protection[PROT_MAGIC] = 0;
	value = value_sfb_armor_l;
	visual = "sfbl.3ds";
	visual_change = "Hum_SFBL_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ORG_ARMOR_L(ITAR_DS_Proto)
{
	name = "Легкое одеяние вора";description = name;	
	protection[PROT_EDGE] = 30;protection[PROT_BLUNT] = 30;	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;protection[PROT_MAGIC] = 0;
	value = value_org_armor_l;
	visual = "orgl.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ORG_ARMOR_M(ITAR_DS_Proto)
{
	name = "Одеяние вора";description = name;	
	protection[PROT_EDGE] = 35;protection[PROT_BLUNT] = 35;protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;protection[PROT_MAGIC] = 0;
	value = value_org_armor_m;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_ARMOR.asc";
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ORG_ARMOR_H(ITAR_DS_Proto)
{
	name = "Тяжелое одеяние вора";description = name;	
	protection[PROT_EDGE] = 40;protection[PROT_BLUNT] = 40;protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;protection[PROT_MAGIC] = 0;
	value = value_org_armor_h;
	visual = "orgh.3ds";
	visual_change = "Hum_ORGS_ARMOR.asc";
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance SLD_ARMOR_L(ITAR_DS_Proto)
{
	name = "Легкие доспехи наемника";description = name;	
	protection[PROT_EDGE] = 45;protection[PROT_BLUNT] = 45;	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;protection[PROT_MAGIC] = 0;
	value = value_sld_armor_l;	
	visual = "sldl.3ds";
	visual_change = "Hum_SLDL_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance SLD_ARMOR_M(ITAR_DS_Proto)
{
	name = "Доспехи наемника";description = name;
	protection[PROT_EDGE] = 55;	protection[PROT_BLUNT] = 55;	protection[PROT_POINT] = 10;	
	protection[PROT_FIRE] = 25;	protection[PROT_MAGIC] = 0;
	value = value_sld_armor_m;
	visual = "sldm.3ds";
	visual_change = "Hum_SLDM_ARMOR.asc";
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance SLD_ARMOR_H(ITAR_DS_Proto)
{
	name = "Тяжелые доспехи наемника";description = name;	
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 35;	protection[PROT_MAGIC] = 0;
	value = value_sld_armor_h;	
	visual = "sldh.3ds";
	visual_change = "Hum_SLDS_ARMOR.asc";
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance NOV_ARMOR_L(ITAR_DS_Proto)
{
	name = "Набедренная повязка послушника";description = name;	
	protection[PROT_EDGE] = 15;protection[PROT_BLUNT] = 15;	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;protection[PROT_MAGIC] = 0;
	value = value_nov_armor_l;
	visual = "novl.3ds";
	visual_change = "Hum_NOVL_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance NOV_ARMOR_M(ITAR_DS_Proto)
{
	name = "Легкие доспехи послушника";description = name;
	protection[PROT_EDGE] = 30;protection[PROT_BLUNT] = 30;protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 15;protection[PROT_MAGIC] = 0;
	value = value_nov_armor_m;
	visual = "novm.3ds";
	visual_change = "Hum_NOVM_ARMOR.asc";
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance NOV_ARMOR_H(ITAR_DS_Proto)		//Тоже самое, что и ITAR_Lester
{
	name = "Доспехи послушника";description = name;
	protection[PROT_EDGE] = 40;protection[PROT_BLUNT] = 40;protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;protection[PROT_MAGIC] = 0;
	value = value_nov_armor_h;	
	visual = "novh.3ds";
	visual_change = "Hum_NOVS_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance TPL_ARMOR_L(ITAR_DS_Proto)
{
	name = "Легкие доспехи Стража";description = name;
	protection[PROT_EDGE] = 45;	protection[PROT_BLUNT] = 45;	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_l;	
	visual = "tpll.3ds";
	visual_change = "Hum_TPLL_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance TPL_ARMOR_M(ITAR_DS_Proto)
{
	name = "Доспехи Стража";description = name;
	protection[PROT_EDGE] = 55;	protection[PROT_BLUNT] = 55;	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_m;	
	visual = "tplm.3ds";
	visual_change = "Hum_TPLM_ARMOR.asc";		
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance TPL_ARMOR_H(ITAR_DS_Proto)	//Тоже самое, что и ITAR_CorAngar
{
	name = "Тяжелые доспехи Стража";description = name;
	protection[PROT_EDGE] = 70;	protection[PROT_BLUNT] = 70;	protection[PROT_POINT] = 10;	
	protection[PROT_FIRE] = 35;	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_h;	
	visual = "tplh.3ds";
	visual_change = "Hum_TPLS_ARMOR.asc";
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance GUR_ARMOR_M(ITAR_DS_Proto)
{
	name = "Облачение Гуру";description = name;
	protection[PROT_EDGE] = 71;	protection[PROT_BLUNT] = 71;	protection[PROT_POINT] = 7;
	protection[PROT_FIRE] = 35;	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	visual = "gurm.3ds";
	visual_change = "Hum_GURM_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance GUR_ARMOR_H(ITAR_DS_Proto)
{
	name = "Облачение высших Гуру";description = name;
	protection[PROT_EDGE] = 82;	protection[PROT_BLUNT] = 82;	protection[PROT_POINT] = 8;
	protection[PROT_FIRE] = 41;	protection[PROT_MAGIC] = 4;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	visual = "gurh.3ds";
	visual_change = "Hum_GURS_ARMOR.asc";
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance KDF_ARMOR_L(ITAR_DS_Proto)
{
	name = "Облачение магов огня";description = name;
	protection[PROT_EDGE] = 40;	protection[PROT_BLUNT] = 40;	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 25;	protection[PROT_MAGIC] = 5;
	value = value_kdf_armor_l;
	visual = "kdfl.3ds";
	visual_change = "Hum_KDFL_ARMOR.asc";		
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance KDF_ARMOR_H(ITAR_DS_Proto)
{
	name = "Облачение высших магов огня";description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 30;	protection[PROT_MAGIC] = 10;	
	value = value_kdf_armor_h;
	visual = "kdfh.3ds";
	visual_change = "Hum_KDFS_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance ORE_ARMOR_M(ITAR_DS_Proto)
{
	name = "Древние доспехи из руды";description = name;
	protection[PROT_EDGE] = 95;	protection[PROT_BLUNT] = 95;	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 40;	protection[PROT_MAGIC] = 10;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_ARMOR.asc";
	material = MAT_METAL;
	text[0] = "Эти древние доспехи сделаны из магической руды.";
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

instance GRD_ARMOR_I(ITAR_DS_Proto)
{
	name = "Доспехи королевского стражника";description = name;
	protection[PROT_EDGE] = 50;	protection[PROT_BLUNT] = 50;	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 25;	protection[PROT_MAGIC] = 1;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;	
	visual = "grdi.3ds";
	visual_change = "Hum_GRDI_ARMOR.asc";	
	count[1] = protection[PROT_EDGE];	count[2] = protection[PROT_POINT];
	count[3] = protection[PROT_FIRE];	count[4] = protection[PROT_MAGIC];
	count[5] = value;
};

