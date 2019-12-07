
//****************************КОМПЛЕКТ СЛУГИ НЕКРОМАНТА*************************.

var int C_ds_equip_Artefact_Necroman_01;
var int C_ds_equip_Artefact_Necroman_02;
var int C_ds_equip_Artefact_Necroman_03;
var int C_ds_equip_Artefact_Necroman_All;
func int C_ds_equip_Artefact_Necroman()
{ 
	if((C_ds_equip_Artefact_Necroman_01 == TRUE) && (C_ds_equip_Artefact_Necroman_02 == TRUE) 
	&& (C_ds_equip_Artefact_Necroman_03 == TRUE))
	{	
		C_ds_equip_Artefact_Necroman_All = TRUE;
		Print("Ты познал силу Слуги Некроманта!");
		return TRUE;	
	};
	return FALSE;
};
func void b_ds_give_bonus_ArtefactNecroman(var int PlusMinus)
{
	if(PlusMinus == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, 10);
	}
	else
	{
		B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, -10);
	};
};
//-----------------------------------------------------------------------------
//Кольцо Слуги Некроманта
//Местоположение: Башня с нежитью у одного из зомбаков (сделать его посильнее)
//-----------------------------------------------------------------------------
instance ItRi_DS_Artefact_Necroman_01(C_Item)	//вставлено
{
	name 		= NAME_Ring;
	mainflag 	= ITEM_KAT_MAGIC;
	flags 		= ITEM_RING;
	value 		= Value_Ri_HpMana;
	visual 		= "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material 	= MAT_METAL;
	on_equip 	= Equip_ItRi_DS_Artefact_Necroman_01;
	on_unequip 	= UnEquip_ItRi_DS_Artefact_Necroman_01;
	wear 		= WEAR_EFFECT;
	effect 		= "SPELLFX_ITEMGLIMMER_VIOLET";
	description = "Кольцо Слуги Некроманта";
	text[1]		= "Кольцо излучает легкий магический свет";
	text[2] 	= NAME_Bonus_Mana;
	count[2] 	= 10;
	text[3] 	= NAME_Bonus_HP;
	count[3] 	= 40;
	text[5] 	= NAME_Value;
	count[5] 	= value;
	inv_zbias 	= INVCAM_ENTF_RING_STANDARD;
	inv_rotz 	= INVCAM_Z_RING_STANDARD;
	inv_rotx 	= INVCAM_X_RING_STANDARD;
};
func void Equip_ItRi_DS_Artefact_Necroman_01()
{
	Equip_Bonus_Mana(10);
	Equip_Bonus_HP(40);
	C_ds_equip_Artefact_Necroman_01	= TRUE;
	Wld_PlayEffect("SPELLFX_VIOLETFIREBIP_LEFTHAND",self,self,0,0,0,FALSE);
	if(C_ds_equip_Artefact_Necroman())
	{
		//Wld_StopEffect("SPELLFX_VIOLETFIREBIP_NECK");
		b_ds_give_bonus_ArtefactNecroman(TRUE);
		Wld_PlayEffect("SPELLFX_VIOLETFIREARMOR",self,self,0,0,0,FALSE);
	};
};
func void UnEquip_ItRi_DS_Artefact_Necroman_01()
{
	UnEquip_Bonus_HP(40);
	UnEquip_Bonus_Mana(10);
	C_ds_equip_Artefact_Necroman_01	= FALSE;
	if(C_ds_equip_Artefact_Necroman_All == TRUE)
	{
		b_ds_give_bonus_ArtefactNecroman(FALSE);
		C_ds_equip_Artefact_Necroman_All = FALSE;
		Wld_StopEffect("SPELLFX_VIOLETFIREARMOR");
	};
	Wld_StopEffect("SPELLFX_VIOLETFIREBIP_LEFTHAND");
};
//-----------------------------------------------------------------------------
//Перстень Слуги Некроманта
//Местоположение: Старое кладбище (в одной из могил)
//-----------------------------------------------------------------------------
instance ItRi_DS_Artefact_Necroman_02(C_Item)	//всунут
{
	name 		= NAME_Ring;
	mainflag 	= ITEM_KAT_MAGIC;
	flags 		= ITEM_RING;
	value 		= Value_Ri_HpMana;
	visual 		= "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material 	= MAT_METAL;
	on_equip 	= Equip_ItRi_DS_Artefact_Necroman_02;
	on_unequip 	= UnEquip_ItRi_DS_Artefact_Necroman_02;
	wear 		= WEAR_EFFECT;
	effect 		= "SPELLFX_ITEMGLIMMER_VIOLET";
	description = "Перстень Слуги Некроманта";
	text[1]		= "Древний перстень адепта тьмы";
	text[2] 	= NAME_Bonus_Mana;
	count[2] 	= 20;
	text[3] 	= NAME_Bonus_HP;
	count[3] 	= 60;
	text[5] 	= NAME_Value;
	count[5] 	= value;
	inv_zbias 	= INVCAM_ENTF_RING_STANDARD;
	inv_rotz 	= INVCAM_Z_RING_STANDARD;
	inv_rotx 	= INVCAM_X_RING_STANDARD;
};
func void Equip_ItRi_DS_Artefact_Necroman_02()
{
	Equip_Bonus_Mana(20);
	Equip_Bonus_HP(60);
	C_ds_equip_Artefact_Necroman_02	= TRUE;
	Wld_PlayEffect("SPELLFX_VIOLETFIREBIP_RIGHTHAND",self,self,0,0,0,FALSE);
	if(C_ds_equip_Artefact_Necroman())
	{
		//Wld_StopEffect("SPELLFX_VIOLETFIREBIP_NECK");
		b_ds_give_bonus_ArtefactNecroman(TRUE);
		Wld_PlayEffect("SPELLFX_VIOLETFIREARMOR",self,self,0,0,0,FALSE);
	};
};
func void UnEquip_ItRi_DS_Artefact_Necroman_02()
{
	UnEquip_Bonus_HP(60);
	UnEquip_Bonus_Mana(20);
	C_ds_equip_Artefact_Necroman_02	= FALSE;
	if(C_ds_equip_Artefact_Necroman_All == TRUE)
	{
		b_ds_give_bonus_ArtefactNecroman(FALSE);
		C_ds_equip_Artefact_Necroman_All = FALSE;
		Wld_StopEffect("SPELLFX_VIOLETFIREARMOR");
	};
	Wld_StopEffect("SPELLFX_VIOLETFIREBIP_RIGHTHAND");
};
//-----------------------------------------------------------------------------
//Амулет Слуги Некроманта
//Местоположение: В пещере с кровавой королевой
//-----------------------------------------------------------------------------
instance ItAm_DS_Artefact_Necroman_03(C_Item)	//всунут
{
	name 		= NAME_Amulett;
	mainflag 	= ITEM_KAT_MAGIC;
	flags 		= ITEM_AMULET;
	value 		= Value_Am_ProtFire;
	visual 		= "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material 	= MAT_METAL;
	on_equip 	= Equip_ItAm_DS_Artefact_Necroman_03;
	on_unequip 	= UnEquip_ItAm_DS_Artefact_Necroman_03;
	wear 		= WEAR_EFFECT;
	effect 		= "SPELLFX_ITEMGLIMMER_VIOLET";
	description = "Амулет Слуги Некроманта";
	text[1]		= "Амулет немного вибрирует";
	text[2]		= "от темной магии, заключенной в нем.";
	text[4] 	= NAME_DS_Prot_MagicAndFire;
	count[4] 	= 10;
	text[5] 	= NAME_Value;
	count[5] 	= value;
	inv_zbias 	= INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_DS_Artefact_Necroman_03()
{
	B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, 10);
	C_ds_equip_Artefact_Necroman_03	= TRUE;
	Wld_PlayEffect("SPELLFX_VIOLETFIREBIP_NECK",self,self,0,0,0,FALSE);
	if(C_ds_equip_Artefact_Necroman())
	{
		//Wld_StopEffect("SPELLFX_VIOLETFIREBIP_NECK");
		b_ds_give_bonus_ArtefactNecroman(TRUE);
		Wld_PlayEffect("SPELLFX_VIOLETFIREARMOR",self,self,0,0,0,FALSE);
	};	
};
func void UnEquip_ItAm_DS_Artefact_Necroman_03()
{
	B_GiveBonusProt(self,PROT_DS_MAGIC | PROT_DS_FIRE, -10);
	C_ds_equip_Artefact_Necroman_03	= FALSE;
	if(C_ds_equip_Artefact_Necroman_All == TRUE)
	{
		b_ds_give_bonus_ArtefactNecroman(FALSE);
		C_ds_equip_Artefact_Necroman_All = FALSE;
		Wld_StopEffect("SPELLFX_VIOLETFIREARMOR");
	};
	Wld_StopEffect("SPELLFX_VIOLETFIREBIP_NECK");
};

//****************************Комплект Темного Воина*************************.

var int C_ds_equip_Artefact_DarkWarrior_01;
var int C_ds_equip_Artefact_DarkWarrior_02;
var int C_ds_equip_Artefact_DarkWarrior_03;
var int C_ds_equip_Artefact_DarkWarrior_All;
func int C_ds_equip_Artefact_DarkWarrior()
{ 
	if((C_ds_equip_Artefact_DarkWarrior_01 == TRUE) && (C_ds_equip_Artefact_DarkWarrior_02 == TRUE) 
	&& (C_ds_equip_Artefact_DarkWarrior_03 == TRUE))
	{	
		C_ds_equip_Artefact_DarkWarrior_All = TRUE;
		Print("Ты обрел силу Темного Воина!");
		return TRUE;	
	};
	return FALSE;
};
func void b_ds_give_bonus_DarkWarrior(var int PlusMinus)
{
	if(PlusMinus == TRUE)
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, 10);
		self.attribute[ATR_REGENERATEHP] += 5;
	}
	else
	{
		B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -10);
		self.attribute[ATR_REGENERATEHP] -= 5;
	};
};
//-----------------------------------------------------------------------------
//Кольцо Темного Воина
//Местоположение: Древний форт, у глав гада.
//-----------------------------------------------------------------------------
instance ItRi_DS_Artefact_DarkWarrior_01(C_Item)	////всунут
{
	name 		= NAME_Ring;
	mainflag 	= ITEM_KAT_MAGIC;
	flags 		= ITEM_RING;
	value 		= Value_Ri_DexStrg;
	visual 		= "ItRi_Dex_Strg_01.3ds";
	visual_skin = 0;
	material 	= MAT_METAL;
	on_equip 	= Equip_ItRi_DS_Artefact_DarkWarrior_01;
	on_unequip 	= UnEquip_ItRi_DS_Artefact_DarkWarrior_01;
	wear 		= WEAR_EFFECT;
	effect 		= "SPELLFX_ITEMGLIMMER_VIOLET";
	description = "Кольцо Темного Воина";
	text[1]		= "Кольцо испещрено древними надписями";
	text[2]		= "на неизвестном языке.";
	text[4] 	= NAME_DS_Bonus_StrAndDex;
	count[4] 	= 5;
	text[5] 	= NAME_Value;
	count[5] 	= value;
	inv_zbias 	= INVCAM_ENTF_RING_STANDARD;
	inv_rotz 	= INVCAM_Z_RING_STANDARD;
	inv_rotx 	= INVCAM_X_RING_STANDARD;
};
func void Equip_ItRi_DS_Artefact_DarkWarrior_01()
{
	self.attribute[ATR_STRENGTH] += 5;
	self.attribute[ATR_DEXTERITY] += 5;
	C_ds_equip_Artefact_DarkWarrior_01	= TRUE;
	if(C_ds_equip_Artefact_DarkWarrior())
	{
		b_ds_give_bonus_DarkWarrior(TRUE);
		Wld_PlayEffect("SPELLFX_VIOLETFIREARMOR",self,self,0,0,0,FALSE);
	};
};
func void UnEquip_ItRi_DS_Artefact_DarkWarrior_01()
{
	self.attribute[ATR_STRENGTH] -= 5;
	self.attribute[ATR_DEXTERITY] -= 5;
	C_ds_equip_Artefact_DarkWarrior_01	= FALSE;
	if(C_ds_equip_Artefact_DarkWarrior_All == TRUE)
	{
		b_ds_give_bonus_DarkWarrior(FALSE);
		C_ds_equip_Artefact_DarkWarrior_All = FALSE;
		Wld_StopEffect("SPELLFX_VIOLETFIREARMOR");
	};
};
//-----------------------------------------------------------------------------
//Амулет Темного Воина
//Местоположение: В гробнице предков (у одного из скелетов)
//-----------------------------------------------------------------------------
instance ItAm_DS_Artefact_DarkWarrior_02(C_Item)	//всунут
{
	name 		= NAME_Amulett;
	mainflag 	= ITEM_KAT_MAGIC;
	flags 		= ITEM_AMULET;
	value 		= Value_Am_ProtTotal;
	visual 		= "ItAm_Prot_Total_01.3ds";
	visual_skin = 0;
	material 	= MAT_METAL;
	on_equip 	= Equip_ItAm_DS_Artefact_DarkWarrior_02;
	on_unequip 	= UnEquip_ItAm_DS_Artefact_DarkWarrior_02;
	wear 		= WEAR_EFFECT;
	effect 		= "SPELLFX_ITEMGLIMMER_VIOLET";
	description = "Амулет Темного Воина";
	text[1]		= "Древний амулет воина тьмы.";
	text[3] 	= NAME_DS_Bonus_MW_HitChance;
	count[3] 	= 5;
	text[4] 	= NAME_DS_Bonus_RW_HitChance;
	count[4] 	= 5;
	text[5] 	= NAME_Value;
	count[5] 	= value;
	inv_zbias 	= INVCAM_ENTF_AMULETTE_STANDARD;
};
func void Equip_ItAm_DS_Artefact_DarkWarrior_02()
{
	B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_1H | NPC_DS_TALENT_2H | NPC_DS_TALENT_BOW | NPC_DS_TALENT_CROSSBOW, 5);
	C_ds_equip_Artefact_DarkWarrior_02	= TRUE;
	if(C_ds_equip_Artefact_DarkWarrior())
	{
		b_ds_give_bonus_DarkWarrior(TRUE);
		Wld_PlayEffect("SPELLFX_VIOLETFIREARMOR",self,self,0,0,0,FALSE);
	};
};
func void UnEquip_ItAm_DS_Artefact_DarkWarrior_02()
{
	B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_1H | NPC_DS_TALENT_2H | NPC_DS_TALENT_BOW | NPC_DS_TALENT_CROSSBOW, -5);
	C_ds_equip_Artefact_DarkWarrior_02	= FALSE;
	if(C_ds_equip_Artefact_DarkWarrior_All == TRUE)
	{
		b_ds_give_bonus_DarkWarrior(FALSE);
		C_ds_equip_Artefact_DarkWarrior_All = FALSE;
		Wld_StopEffect("SPELLFX_VIOLETFIREARMOR");
	};
};
//-----------------------------------------------------------------------------
//Пояс Темного Воина
//Местоположение: В пещере по квесту Ганса
//-----------------------------------------------------------------------------
instance ItBe_DS_Artefact_DarkWarrior_03(C_Item)	//всунут
{
	name 		= NAME_Addon_Belt;
	mainflag 	= ITEM_KAT_MAGIC;
	flags 		= ITEM_BELT | ITEM_MULTI;
	value 		= Value_ItBE_Addon_Prot_EdgPoi;
	visual 		= "ItMi_Belt_01.3ds";
	visual_skin = 0;
	material 	= MAT_METAL;
	on_equip 	= Equip_ItBe_DS_Artefact_DarkWarrior_03;
	on_unequip 	= UnEquip_ItBe_DS_Artefact_DarkWarrior_03;
	description = "Пояс Темного Воина";
	text[1] 	= "Пояс, некогда принадлежавший";
	text[2] 	= "одному из полководцев армии Некроманта.";
	text[4] 	= NAME_DS_Prot_EdgeAndPoint;
	count[4] 	= 10;
	text[5] 	= NAME_Value;
	count[5] 	= value;
	inv_zbias 	= INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx 	= INVCAM_ENTF_MISC2_STANDARD;
};
func void Equip_ItBe_DS_Artefact_DarkWarrior_03()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, 10);
	C_ds_equip_Artefact_DarkWarrior_03	= TRUE;
	if(C_ds_equip_Artefact_DarkWarrior())
	{
		b_ds_give_bonus_DarkWarrior(TRUE);
		Wld_PlayEffect("SPELLFX_VIOLETFIREARMOR",self,self,0,0,0,FALSE);
	};
};
func void UnEquip_ItBe_DS_Artefact_DarkWarrior_03()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT, -10);
	C_ds_equip_Artefact_DarkWarrior_03	= FALSE;
	if(C_ds_equip_Artefact_DarkWarrior_All == TRUE)
	{
		b_ds_give_bonus_DarkWarrior(FALSE);
		C_ds_equip_Artefact_DarkWarrior_All = FALSE;
		Wld_StopEffect("SPELLFX_VIOLETFIREARMOR");
	};
};


//-----------------------------------------------------------------------------
//Артефакты, продаваемые орком Тараком
//-----------------------------------------------------------------------------

instance ItAm_AmulLuck(ItAm_Proto)
{
	description = "Амулет удачи";	visual = "ItAm_Hp_01.3ds";	value 	= 0;
	material 	= MAT_STONE;
	on_equip 	= Equip_AmulLuck;
	on_unequip 	= UnEquip_AmulLuck; 	
	text[1] 	= NAME_DS_Bonus_MW_HitChance;
	count[1]	= 10;
	text[2] 	= NAME_DS_Bonus_RW_HitChance;
	count[2]	= 10;
};
func void Equip_AmulLuck()
{
	B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_1H | NPC_DS_TALENT_2H | NPC_DS_TALENT_BOW | NPC_DS_TALENT_CROSSBOW, 10);
};
func void UnEquip_AmulLuck()
{
	B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_1H | NPC_DS_TALENT_2H | NPC_DS_TALENT_BOW | NPC_DS_TALENT_CROSSBOW, -10);		
};

instance ItAm_Addon_WispDetector(C_Item)
{
	name = "Амулет ищущего огонька";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_WispDetector;
	on_unequip = UnEquip_WispDetector;
	description = "Рудный амулет блуждающего огонька";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

var int Equip_WispDetector_OneTime;

func void Equip_WispDetector()
{
	var C_Npc DetWsp;
	if(Wld_GetDay() == 0)
	{
		BONUSUSINGDAY = -1;
	};
	if((Wld_GetDay() - BONUSUSINGDAY) < 1)
	{
		PrintScreen(PRINT_WISPISNOTFORUSING,-1,-1,FONT_Screen,2);
	}
	else
	{
		if(Equip_WispDetector_OneTime == FALSE)
		{
			PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE;
			WispSearching = WispSearch_NF;
			Equip_WispDetector_OneTime = TRUE;
		};
		DetWsp = Hlp_GetNpc(Wisp_Detector);
		AI_Teleport(DetWsp,"TOT");
		Wld_SpawnNpcRange(self,Wisp_Detector,1,500);
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",Wisp_Detector,Wisp_Detector,0,0,0,FALSE);
		Snd_Play("MFX_Transform_Cast");
	};
};

func void UnEquip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	if(Npc_IsDead(DetWsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(DetWsp,"TOT");
	B_RemoveNpc(DetWsp);
	AI_Teleport(DetWsp,"TOT");
	if(BONUSWISP == TRUE)
	{
		if(BONUSWISPARMOR == TRUE)
		{
			if(BONUSWISPARMOR01 == TRUE)
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-(hero.attribute[ATR_HITPOINTS_MAX] / 11));
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-(hero.attribute[ATR_HITPOINTS_MAX] / 11));
				B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -1);
				BONUSWISPARMOR01 = FALSE;
			}
			else if(BONUSWISPARMOR02 == TRUE)
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-(hero.attribute[ATR_HITPOINTS_MAX] / 6));
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-(hero.attribute[ATR_HITPOINTS_MAX] / 6));
				B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -2);
				BONUSWISPARMOR02 = FALSE;
			}
			else if(BONUSWISPARMOR03 == TRUE)
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-(hero.attribute[ATR_HITPOINTS_MAX] / 5));
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-(hero.attribute[ATR_HITPOINTS_MAX] / 5));
				B_GiveBonusProt(hero,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -4);
				BONUSWISPARMOR03 = FALSE;
			};
		}
		else if(BONUSWISPATTACK == TRUE)
		{
			if(BONUSWISPATTACK01 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-5);
				Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-5);
				BONUSWISPATTACK01 = FALSE;
			}
			else if(BONUSWISPATTACK02 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-20);
				Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-20);
				BONUSWISPATTACK02 = FALSE;
			}
			else if(BONUSWISPATTACK03 == TRUE)
			{
				Npc_ChangeAttribute(self,ATR_STRENGTH,-40);
				Npc_ChangeAttribute(self,ATR_DEXTERITY,-40);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-80);
				Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-80);
				BONUSWISPATTACK03 = FALSE;
			};
			self.flags = 0;
		}
		else if(BONUSWISPREGENERATIONMANA == TRUE)
		{
			Npc_ChangeAttribute(hero,ATR_REGENERATEMANA,-5);
			BONUSWISPREGENERATIONMANA = FALSE;
		}
		else if(BONUSWISPREGENERATIONHP == TRUE)
		{
			Npc_ChangeAttribute(hero,ATR_REGENERATEHP,-5);
			BONUSWISPREGENERATIONHP = FALSE;
		}
		else if(BONUSWISPLIGHT == TRUE)
		{
			BONUSWISPLIGHT = FALSE;
		}
		else if(BONUSWISPFINDING == TRUE)
		{
			BONUSWISPFINDING = FALSE;
		};
		BONUSWISP = FALSE;
		WISPISCHARGED = FALSE;
	};
	if(GETTAINIK == TRUE)
	{
		GETTAINIK = FALSE;
	};
};  

instance ItBe_DS_TotalProt(ItBE_DS2P_Proto)
{
	description = "Пояс Старейшины";	visual = "ItMi_Belt_09.3ds";	value = 1000;
	material = MAT_METAL;
	on_equip = Equip_ItBe_DS_TotalProt;
	on_unequip = UnEquip_ItBe_DS_TotalProt;	
	text[1] = NAME_DS_Prot_EdgeAndPointAndMagicAndFire;	count[1] = 10;
};
func void Equip_ItBe_DS_TotalProt()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, 10);
};
func void UnEquip_ItBe_DS_TotalProt()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -10);
};

instance ItBe_DS_AncientGuard(ItBE_DS2P_Proto)
{
	description = "Древний пояс стражей";	visual = "ItMI_Belt_10.3ds";	value = 6000;
	material = MAT_METAL;
	on_equip = Equip_ItBe_AncientGuard;
	on_unequip = UnEquip_ItBe_AncientGuard;	
	text[1] = NAME_DS_Prot_EdgeAndPointAndMagicAndFire;	count[1] = 20;
	text[2] = Name_Bonus_Str;	count[2] = 10;
};
func void Equip_ItBe_AncientGuard()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, 20);
	Npc_ChangeAttribute(self,ATR_STRENGTH,10); 
};
func void UnEquip_ItBe_AncientGuard()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -20);
	Npc_ChangeAttribute(self,ATR_STRENGTH,-10); 
};
  
instance ItBe_DS_AncientMight(ItBE_DS2P_Proto)
{
	description = "Древний пояс незримой мощи";	visual = "ItMI_Belt_11.3ds";	value = 4500;
	material = MAT_METAL;
	on_equip = Equip_ItBe_AncientMight;
	on_unequip = UnEquip_ItBe_AncientMight;
	text[1] = NAME_DS_Prot_EdgeAndPointAndMagicAndFire;	count[1] = 15;
	text[2] = Name_Bonus_Dex;	count[2] = 5;
};
func void Equip_ItBe_AncientMight()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, 15);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5); 
};
func void UnEquip_ItBe_AncientMight()
{
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -15);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5); 
};

instance ItRi_EternalMana(ItRi_Proto)
{
	description = "Кольцо вечной маны";	visual = "ItRi_Prot_Fire_02.3ds";	value = 3000;
	on_equip = Equip_ItRi_EternalMana;
	on_unequip = UnEquip_ItRi_EternalMana;
	text[2] = Name_Bonus_RegenMana;
	count[5] = value;
};
func void Equip_ItRi_EternalMana(){
	if(Npc_IsPlayer(self))	{	RegenMana_from_Ring = TRUE;		c_time_RegenerateMana();	};
};
func void UnEquip_ItRi_EternalMana(){
	if(Npc_IsPlayer(self))	{	RegenMana_from_Ring = FALSE;	c_time_RegenerateMana();	};
}; 

instance ItRi_EternalLife(ItRi_Proto)
{
	description = "Кольцо вечной жизни";	visual = "ItRi_Prot_Fire_02.3ds";	value = 3000;
	on_equip = Equip_ItRi_EternalLife;
	on_unequip = UnEquip_ItRi_EternalLife;
	text[2] = Name_Bonus_RegenHP;
	count[5] = value;
};
func void Equip_ItRi_EternalLife(){
	if(Npc_IsPlayer(self))	{	RegenHP_from_Ring = TRUE;		C_Time_RegenerateHP();	};
};
func void UnEquip_ItRi_EternalLife(){
	if(Npc_IsPlayer(self))	{	RegenHP_from_Ring = FALSE;	C_Time_RegenerateHP();	};
}; 
