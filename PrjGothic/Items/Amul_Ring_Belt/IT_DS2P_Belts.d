
//Удачный выстрел
const int Value_Be_DS2P_GoodShot = 3000;
const int Bonus_Be_DS2P_GoodShot_BowCbow = 15;

//Пояс истинной магии
const int Value_Be_DS2P_TrueMagic = 3000;
const int Bonus_Be_DS2P_TrueMagic_ManaMax = 30;

//Пояс Гарона
const int Value_Be_DS2P_Garon = 1500;
const int Bonus_Be_DS2P_Garon_HPMax = 20;


instance ItBe_DS2P_GoodShot(ItBE_DS2P_Proto)
{
	value = Value_Be_DS2P_GoodShot;
	visual = "ItMi_Belt_02.3ds";	visual_skin = 0;
	on_equip = Equip_ItBe_DS2P_GoodShot;
	on_unequip = UnEquip_ItBe_DS2P_GoodShot;
	description = "Удачный выстрел";
	text[1] = NAME_DS_Bonus_RW_HitChance;
	count[1] = Bonus_Be_DS2P_GoodShot_BowCbow;
	count[5] = value;
};
func void Equip_ItBe_DS2P_GoodShot(){
	B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_BOW | NPC_DS_TALENT_CROSSBOW, Bonus_Be_DS2P_GoodShot_BowCbow);
};
func void UnEquip_ItBe_DS2P_GoodShot(){
	B_DS_GiveBonusFightSkill(self,NPC_DS_TALENT_BOW | NPC_DS_TALENT_CROSSBOW, -Bonus_Be_DS2P_GoodShot_BowCbow);
};

// ========================================
// «Пояс истинной магии» мана +30
// ========================================
instance ItBe_DS2P_TrueMagic(ItBE_DS2P_Proto)
{
	description = "Пояс истинной магии";
	visual = "ItMi_Belt_02.3ds";
	
	on_equip = Equip_ItBe_DS2P_TrueMagic;
	on_unequip = UnEquip_ItBe_DS2P_TrueMagic;
	
	text[1] = NAME_Bonus_ManaMax;	count[1] = Bonus_Be_DS2P_TrueMagic_ManaMax;

	value = Value_Be_DS2P_TrueMagic;
	count[5] = value;
};
func void Equip_ItBe_DS2P_TrueMagic()
{	Equip_Bonus_Mana(Bonus_Be_DS2P_TrueMagic_ManaMax);};
func void UnEquip_ItBe_DS2P_TrueMagic()
{	UnEquip_Bonus_Mana(Bonus_Be_DS2P_TrueMagic_ManaMax);};

// ========================================
// «Пояс Гарона» + 20 к жизни
// ========================================
instance ItBe_DS2P_Garon(ItBE_DS2P_Proto)
{
	description = "Пояс Гарона";
	visual = "ItMi_Belt_06.3ds";
	
	on_equip = Equip_ItBe_DS2P_Garon;
	on_unequip = UnEquip_ItBe_DS2P_Garon;
	
	text[1] = NAME_Bonus_HpMax;	count[1] = Bonus_Be_DS2P_Garon_HPMax;

	value = Value_Be_DS2P_TrueMagic;
	count[5] = value;
};
func void Equip_ItBe_DS2P_Garon()
{	Equip_Bonus_Mana(Bonus_Be_DS2P_Garon_HPMax);};
func void UnEquip_ItBe_DS2P_Garon()
{	UnEquip_Bonus_Mana(Bonus_Be_DS2P_Garon_HPMax);};
