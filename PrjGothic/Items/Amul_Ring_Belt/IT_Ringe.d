
const int Value_Ri_ProtFire = 250;		const int Ri_ProtFire = 3;
const int Value_Ri_ProtEdge = 250;		const int Ri_ProtEdge = 3;
const int Value_Ri_ProtMage = 250;		const int Ri_ProtMage = 3;
const int Value_Ri_ProtPoint = 250;	const int Ri_ProtPoint = 3;
const int Value_Ri_ProtFire02 = 500;	const int Ri_ProtFire02 = 5;
const int Value_Ri_ProtEdge02 = 500;	const int Ri_ProtEdge02 = 5;
const int Value_Ri_ProtMage02 = 500;	const int Ri_ProtMage02 = 5;
const int Value_Ri_ProtPoint02 = 500;const int Ri_ProtPoint02 = 5;
const int Value_Ri_ProtTotal = 600;	
const int Ri_TProtFire = 2;					const int Ri_TProtEdge = 3;	const int Ri_TProtMage = 2;	const int Ri_TProtPoint = 3;
const int Value_Ri_ProtTotal02 = 1000;
const int Ri_TProtFire02 = 3;				const int Ri_TProtEdge02 = 5;const int Ri_TProtMage02 = 3;const int Ri_TProtPoint02 = 5;
const int Value_Ri_Dex = 300;			const int Ri_Dex = 3;
const int Value_Ri_Dex02 = 500;		const int Ri_Dex02 = 5;
const int Value_Ri_Mana = 500;			const int Ri_Mana = 5;
const int Value_Ri_Mana02 = 1000;	const int Ri_Mana02 = 10;
const int Value_Ri_Strg = 300;			const int Ri_Strg = 3;
const int Value_Ri_Strg02 = 500;		const int Ri_Strg02 = 5;
const int Value_Ri_Hp = 200;				const int Ri_Hp = 20;
const int Value_Ri_Hp02 = 400;			const int Ri_Hp02 = 40;
const int Value_Ri_HpMana = 1300;	const int Ri_HpMana_Hp = 30;	const int Ri_HpMana_Mana = 10;
const int Value_Ri_DexStrg = 800;	const int Ri_DexStrg_Dex = 4;	const int Ri_DexStrg_Strg = 4;

instance ItRi_Shield(ItRi_Proto)
{
	on_equip = Equip_ItRi_Shield;
	on_unequip = UnEquip_ItRi_Shield;
	description = "Кольцо щита";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Strg02;
};
func void Equip_ItRi_Shield()
{
	var int tal_shield;	tal_shield = Npc_GetTalentSkill(self,NPC_TALENT_SHIELD);
	Npc_SetTalentSkill(self,NPC_TALENT_SHIELD, tal_shield + 1);
	/*NS - 20/12/13
	//Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	var C_ITEM hero_rangedweapon;
//	hero_rangedweapon = Npc_GetEquippedRangedWeapon(self);
	if(Npc_GetTalentSkill(self,NPC_TALENT_SHIELD) == SHIELD_LEVEL_NONE)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_SHIELD,1);
		}
		else if(Npc_GetTalentSkill(self,NPC_TALENT_SHIELD) == SHIELD_LEVEL_FIRST)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_SHIELD,0);
		};
		
	If(Npc_GetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE) == 0)
	{Npc_SetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE,1);}
	else If(Npc_GetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE) == 1)
	{Npc_SetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE,2);}
	else If(Npc_GetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE) == 2)
	{Npc_SetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE,3);}
	else If(Npc_GetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE) == 3)
	{Npc_SetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE,4);}
	else If(Npc_GetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE) == 4)
	{Npc_SetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE,5);}
	else If(Npc_GetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE) == 5)
	{Npc_SetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE,6);}
	else If(Npc_GetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE) == 6)
	{Npc_SetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE,7);}
	else If(Npc_GetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE) == 7)
	{Npc_SetTalentSkill(self,NPC_TALENT_FOREIGNLANGUAGE,0);};*/
	
	/*	if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_NoNE)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_2X2H,1);
		}
		else if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_FIRST)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_2X2H,2);
			if(hero_rangedweapon.weight == 3)
			{
				Mdl_ApplyOverlayMds(self,"Hum_2x2L3.MDS");
			};
		}
		else if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_SECOND)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_2X2H,0);
			AI_UnequipWeapons(self);
			Mdl_RemoveOverlayMds(self,"Hum_2x2L2.MDS");
			Mdl_RemoveOverlayMds(self,"Hum_2x2L3.MDS");
		};
		
	if(Npc_GetTalentSkill(self,NPC_TALENT_ORCWEAPON) == WEAPON_2X2_LEVEL_NoNE)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ORCWEAPON,1);
		}
		else if(Npc_GetTalentSkill(self,NPC_TALENT_ORCWEAPON) == WEAPON_2X2_LEVEL_FIRST)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ORCWEAPON,2);
		}
		else if(Npc_GetTalentSkill(self,NPC_TALENT_ORCWEAPON) == WEAPON_2X2_LEVEL_SECOND)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ORCWEAPON,0);
		};
	//AI_Teleport(hero,"SW_WATER_BARRIER_01");*
	*/
};
func void UnEquip_ItRi_Shield()
{
	//ГГ возвращаем рельно изученный уровень, остальным -1
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Hero))	{
		Npc_SetTalentSkill(self,NPC_TALENT_SHIELD,HERO_TALENT_SHIELD);
	}
	else	{
		var int tal_shield;	tal_shield = Npc_GetTalentSkill(self,NPC_TALENT_SHIELD);
		Npc_SetTalentSkill(self,NPC_TALENT_SHIELD,tal_shield-1);
	};
	//self.attribute[ATR_REGENERATEMANA] = 0;
	//Npc_ChangeAttribute(self,ATR_TALENTSHIELD,-1);
};

instance ItRi_Prot_Fire_01(ItRi_Proto)
{
	value = Value_Ri_ProtFire;
	visual = "ItRi_Prot_Fire_01.3ds";
	on_equip = Equip_ItRi_Prot_Fire_01;
	on_unequip = UnEquip_ItRi_Prot_Fire_01;
	description = "Кольцо защиты от пламени";
	text[2] = NAME_Prot_Fire;	count[2] = Ri_ProtFire;
	count[5] = value;
};
func void Equip_ItRi_Prot_Fire_01(){	B_GiveBonusProt(self,PROT_FIRE,Ri_ProtFire);};
func void UnEquip_ItRi_Prot_Fire_01(){	B_GiveBonusProt(self,PROT_FIRE,-Ri_ProtFire);};

instance ItRi_Prot_Fire_02(ItRi_Proto)
{
	value = Value_Ri_ProtFire02;
	visual = "ItRi_Prot_Fire_02.3ds";
	on_equip = Equip_ItRi_Prot_Fire_02;
	on_unequip = UnEquip_ItRi_Prot_Fire_02;
	description = "Кольцо огня";
	text[2] = NAME_Prot_Fire;
	count[2] = Ri_ProtFire02;
	count[5] = value;
};
func void Equip_ItRi_Prot_Fire_02(){	B_GiveBonusProt(self,PROT_FIRE,Ri_ProtFire02);};
func void UnEquip_ItRi_Prot_Fire_02(){	B_GiveBonusProt(self,PROT_FIRE,-Ri_ProtFire02);};

instance ItRi_Prot_Point_01(ItRi_Proto)
{
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	on_equip = Equip_ItRi_Prot_Point_01;
	on_unequip = UnEquip_ItRi_Prot_Point_01;
	description = "Кольцо деревянной кожи";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	count[5] = value;
};
func void Equip_ItRi_Prot_Point_01(){	B_GiveBonusProt(self,PROT_POINT,Ri_ProtPoint);};
func void UnEquip_ItRi_Prot_Point_01(){	B_GiveBonusProt(self,PROT_POINT,-Ri_ProtPoint);};

instance ItRi_Prot_Point_02(ItRi_Proto)
{
	value = Value_Ri_ProtPoint02;
	visual = "ItRi_Prot_Point_02.3ds";
	on_equip = Equip_ItRi_Prot_Point_02;
	on_unequip = UnEquip_ItRi_Prot_Point_02;
	description = "Кольцо каменной кожи";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint02;
	count[5] = value;
};
func void Equip_ItRi_Prot_Point_02(){	B_GiveBonusProt(self,PROT_POINT,Ri_ProtPoint02);};
func void UnEquip_ItRi_Prot_Point_02(){	B_GiveBonusProt(self,PROT_POINT,-Ri_ProtPoint02);};

instance ItRi_Prot_Edge_01(ItRi_Proto)
{
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	on_equip = Equip_ItRi_Prot_Edge_01;
	on_unequip = UnEquip_ItRi_Prot_Edge_01;
	description = "Кольцо железной кожи";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	count[5] = value;
};
func void Equip_ItRi_Prot_Edge_01(){	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT, Ri_ProtEdge);};
func void UnEquip_ItRi_Prot_Edge_01(){	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT, -Ri_ProtEdge);};

instance ItRi_Prot_Edge_02(ItRi_Proto)
{
	value = Value_Ri_ProtEdge02;
	visual = "ItRi_Prot_Edge_02.3ds";
	on_equip = Equip_ItRi_Prot_Edge_02;
	on_unequip = UnEquip_ItRi_Prot_Edge_02;
	description = "Кольцо рудной кожи";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge02;
	count[5] = value;
};
func void Equip_ItRi_Prot_Edge_02(){	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT, Ri_ProtEdge02);};
func void UnEquip_ItRi_Prot_Edge_02(){	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT, -Ri_ProtEdge02);};

instance ItRi_Prot_Mage_01(ItRi_Proto)
{
	value = Value_Ri_ProtMage;
	visual = "ItRi_Prot_Mage_01.3ds";
	on_equip = Equip_ItRi_Prot_Mage_01;
	on_unequip = UnEquip_ItRi_Prot_Mage_01;
	description = "Кольцо силы духа";
	text[2] = NAME_Prot_Magic;
	count[2] = Ri_ProtMage;
	count[5] = value;
};
func void Equip_ItRi_Prot_Mage_01(){	B_GiveBonusProt(self,PROT_MAGIC,Ri_ProtMage);};
func void UnEquip_ItRi_Prot_Mage_01(){	B_GiveBonusProt(self,PROT_MAGIC,-Ri_ProtMage);};

instance ItRi_Prot_Mage_02(ItRi_Proto)
{
	value = Value_Ri_ProtMage02;
	visual = "ItRi_Prot_Mage_02.3ds";
	on_equip = Equip_ItRi_Prot_Mage_02;
	on_unequip = UnEquip_ItRi_Prot_Mage_02;
	description = "Кольцо защиты";
	text[2] = NAME_Prot_Magic;
	count[2] = Ri_ProtMage02;
	count[5] = value;
};
func void Equip_ItRi_Prot_Mage_02(){	B_GiveBonusProt(self,PROT_MAGIC,Ri_ProtMage02);};
func void UnEquip_ItRi_Prot_Mage_02(){	B_GiveBonusProt(self,PROT_MAGIC,-Ri_ProtMage02);};

instance ItRi_Prot_Total_01(ItRi_Proto)
{
	value = Value_Ri_ProtTotal;
	visual = "ItRi_Prot_Total_01.3ds";
	on_equip = Equip_ItRi_Prot_Total_01;
	on_unequip = UnEquip_ItRi_Prot_Total_01;
	description = "Кольцо непобедимости";
	text[1] = NAME_DS_Prot_EdgeAndPointAndMagicAndFire;
	count[1] = Ri_TProtEdge;
	count[5] = value;
};
func void Equip_ItRi_Prot_Total_01(){
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, Ri_TProtEdge);
};
func void UnEquip_ItRi_Prot_Total_01(){
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -Ri_TProtEdge);
};

instance ItRi_Prot_Total_02(ItRi_Proto)
{
	value = Value_Ri_ProtTotal02;
	visual = "ItRi_Prot_Total_02.3ds";
	on_equip = Equip_ItRi_Prot_Total_02;
	on_unequip = UnEquip_ItRi_Prot_Total_02;
	description = "Кольцо неуязвимости";
	text[1] = NAME_DS_Prot_EdgeAndPointAndMagicAndFire;
	count[1] = Ri_TProtEdge02;
	count[5] = value;
};
func void Equip_ItRi_Prot_Total_02(){
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, Ri_TProtEdge02);
};
func void UnEquip_ItRi_Prot_Total_02(){
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT | PROT_DS_POINT | PROT_DS_MAGIC | PROT_DS_FIRE, -Ri_TProtEdge02);
};

instance ItRi_Dex_01(ItRi_Proto)
{
	value = Value_Ri_Dex;
	visual = "ItRi_Dex_01.3ds";
	on_equip = Equip_ItRi_Dex_01;
	on_unequip = UnEquip_ItRi_Dex_01;
	description = "Кольцо мастерства";
	text[2] = NAME_Bonus_Dex;	count[2] = Ri_Dex;
	count[5] = value;
};
func void Equip_ItRi_Dex_01()		{	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex);};
func void UnEquip_ItRi_Dex_01()	{	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex);};

instance ItRi_Dex_02(ItRi_Proto)
{
	value = Value_Ri_Dex02;
	visual = "ItRi_Dex_02.3ds";
	on_equip = Equip_ItRi_Dex_02;
	on_unequip = UnEquip_ItRi_Dex_02;
	description = "Кольцо ловкости";
	text[2] = NAME_Bonus_Dex;	count[2] = Ri_Dex02;
	count[5] = value;
};
func void Equip_ItRi_Dex_02()		{	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_Dex02);};
func void UnEquip_ItRi_Dex_02()	{	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_Dex02);};

instance ItRi_HP_01(ItRi_Proto)
{
	value = Value_Ri_Hp;
	visual = "ItRi_Hp_01.3ds";
	on_equip = Equip_ItRi_Hp_01;
	on_unequip = UnEquip_ItRi_Hp_01;
	description = "Кольцо жизни";
	text[2] = NAME_Bonus_HP;	count[2] = Ri_Hp;
	count[5] = value;
};
func void Equip_ItRi_Hp_01(){	Equip_Bonus_HP(Ri_Hp);};
func void UnEquip_ItRi_Hp_01(){UnEquip_Bonus_HP(Ri_Hp);};

instance ItRi_Hp_02(ItRi_Proto)
{
	value = Value_Ri_Hp02;
	visual = "ItRi_Hp_02.3ds";
	on_equip = Equip_ItRi_Hp_02;
	on_unequip = UnEquip_ItRi_Hp_02;
	description = "Кольцо живости";
	text[2] = NAME_Bonus_HP;	count[2] = Ri_Hp02;
	count[5] = value;
};
func void Equip_ItRi_Hp_02(){	Equip_Bonus_HP(Ri_Hp02);};
func void UnEquip_ItRi_Hp_02(){UnEquip_Bonus_HP(Ri_Hp02);};

instance ItRi_Str_01(ItRi_Proto)
{
	value = Value_Ri_Strg;
	visual = "ItRi_Str_01.3ds";
	on_equip = Equip_ItRi_Str_01;
	on_unequip = UnEquip_ItRi_Str_01;
	description = "Кольцо  силы";
	text[2] = NAME_Bonus_Str;	count[2] = Ri_Strg;
	count[5] = value;
};
func void Equip_ItRi_Str_01(){	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Strg);};
func void UnEquip_ItRi_Str_01(){Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Strg);};

instance ItRi_Str_02(ItRi_Proto)
{
	value = Value_Ri_Strg02;
	visual = "ItRi_Str_02.3ds";
	on_equip = Equip_ItRi_Str_02;
	on_unequip = UnEquip_ItRi_Str_02;
	description = "Кольцо силы";
	text[2] = NAME_Bonus_Str;
	count[2] = Ri_Strg02;
	count[5] = value;
};
func void Equip_ItRi_Str_02(){	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_Strg02);};
func void UnEquip_ItRi_Str_02(){Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_Strg02);};

instance ItRi_Mana_01(ItRi_Proto)
{
	value = Value_Ri_Mana;
	visual = "ItRi_Mana_01.3ds";
	on_equip = Equip_ItRi_Mana_01;
	on_unequip = UnEquip_ItRi_Mana_01;
	description = "Кольцо магии";
	text[2] = NAME_Bonus_Mana;	count[2] = Ri_Mana;
	count[5] = value;
};
func void Equip_ItRi_Mana_01(){	Equip_Bonus_Mana(Ri_Mana);};
func void UnEquip_ItRi_Mana_01(){UnEquip_Bonus_Mana(Ri_Mana);};

instance ItRi_Mana_02(ItRi_Proto)
{
	value = Value_Ri_Mana02;
	visual = "ItRi_Mana_02.3ds";
	on_equip = Equip_ItRi_Mana_02;
	on_unequip = UnEquip_ItRi_Mana_02;
	description = "Кольцо астральной силы";
	text[2] = NAME_Bonus_Mana;	count[2] = Ri_Mana02;
	count[5] = value;
};
func void Equip_ItRi_Mana_02(){	Equip_Bonus_Mana(Ri_Mana02);};
func void UnEquip_ItRi_Mana_02(){UnEquip_Bonus_Mana(Ri_Mana02);};

instance ItRi_Hp_Mana_01(ItRi_Proto)
{
	value = Value_Ri_HpMana;
	visual = "ItRi_Hp_Mana_01.3ds";
	on_equip = Equip_ItRi_Hp_Mana_01;
	on_unequip = UnEquip_ItRi_Hp_Mana_01;
	description = "Кольцо просвещения";
	text[2] = NAME_Bonus_Mana;	count[2] = Ri_HpMana_Mana;
	text[3] = NAME_Bonus_HP;		count[3] = Ri_HpMana_Hp;
	count[5] = value;
};
func void Equip_ItRi_Hp_Mana_01(){
	Equip_Bonus_Mana(Ri_HpMana_Mana);
	Equip_Bonus_HP(Ri_HpMana_Hp);	
};
func void UnEquip_ItRi_Hp_Mana_01(){
	UnEquip_Bonus_HP(Ri_HpMana_Hp);
	UnEquip_Bonus_Mana(Ri_HpMana_Mana);
};

instance ItRi_Dex_Strg_01(ItRi_Proto)
{
	value = Value_Ri_DexStrg;
	visual = "ItRi_Dex_Strg_01.3ds";
	on_equip = Equip_ItRi_Dex_Strg_01;
	on_unequip = UnEquip_ItRi_Dex_Strg_01;
	description = "Кольцо власти";
	text[2] = NAME_Bonus_Str;	count[2] = Ri_DexStrg_Strg;
	text[3] = NAME_Bonus_Dex;	count[3] = Ri_DexStrg_Dex;
	count[5] = value;
};
func void Equip_ItRi_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_DexStrg_Strg);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_DexStrg_Dex);
};
func void UnEquip_ItRi_Dex_Strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_DexStrg_Strg);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_DexStrg_Dex);
};

const int VALUE_RI_TROLLSTR = 1000;
const int RI_TROLLSTR_STR = 15;
const int RI_TROLLSTR_HP = 40;
const int RI_TROLLSTR_DEX = -5;

instance ITRI_TROLLSTR(ItRi_Proto)
{
	value = VALUE_RI_TROLLSTR;
	visual = "ItRi_Str_01.3ds";
	on_equip = equip_itri_trollstr;
	on_unequip = unequip_itri_trollstr;
	description = "Сила Тролля";
	text[2] = NAME_Bonus_Str;	count[2] = RI_TROLLSTR_STR;
	text[3] = NAME_Bonus_HP;		count[3] = RI_TROLLSTR_HP;
	text[4] = NAME_Bonus_Dex;	count[4] = RI_TROLLSTR_DEX;
	count[5] = value;
};
func void equip_itri_trollstr()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,RI_TROLLSTR_STR);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,RI_TROLLSTR_DEX);
	Equip_Bonus_HP(RI_TROLLSTR_HP);
};
func void unequip_itri_trollstr()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-RI_TROLLSTR_STR);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-RI_TROLLSTR_DEX);
	UnEquip_Bonus_HP(RI_TROLLSTR_HP);
};

instance ITRI_IMMORTAL_01(ItRi_Proto)
{
	value = 100;
	visual = "ItAm_Strg_01.3ds";
	on_equip = equip_itri_immortal_01;
	on_unequip = unequip_itri_immortal_01;
	description = "Кольцо бессмертия";
	text[2] = NAME_Bonus_Str;
	count[2] = 100;
	count[5] = value;
};
func void equip_itri_immortal_01(){	self.flags = NPC_FLAG_IMMORTAL;};
func void unequip_itri_immortal_01(){self.flags = 0;};