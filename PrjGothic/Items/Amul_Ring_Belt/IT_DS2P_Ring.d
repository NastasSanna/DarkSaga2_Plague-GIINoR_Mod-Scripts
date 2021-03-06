const int Ri_DS2P_GobboEnergy_Dex = 15;
const int Value_Ri_DS2P_GobboEnergy = 1000;
const int Ri_DS2P_Fortitude_ManaMax = 15;
const int Value_Ri_DS2P_Fortitude = 1000;
const int Ri_DS2P_HuntersProtection_ManaMax = 10;
const int Value_Ri_DS2P_HuntersProtection = 350;
const int Ri_DS2P_HuntersProtection_Prot = 10;
const int Value_Ri_DSP_SpiderRing = 250;
const int Ri_DSP_SpiderRing = 5;

// ==========================
// ������ "���������� �����" + 15 � ��������
// ==========================
instance ItRi_DS2P_GobboEnergy(ItRi_Proto)
{
	name = Name_Ring;
	value = Value_Ri_DS2P_GobboEnergy;
	visual = "ItRi_Dex_02.3ds";
	on_equip = Equip_ItRi_DS2P_GobboEnergy;
	on_unequip = UnEquip_ItRi_DS2P_GobboEnergy;
	description = "���������� �����";
	text[2] = NAME_Bonus_Dex;	count[2] = Ri_DS2P_GobboEnergy_Dex;
	count[5] = value;
};
func void Equip_ItRi_DS2P_GobboEnergy()
{	Npc_ChangeAttribute(self,ATR_DEXTERITY,Ri_DS2P_GobboEnergy_Dex);};
func void UnEquip_ItRi_DS2P_GobboEnergy()
{	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Ri_DS2P_GobboEnergy_Dex);};

// ==========================
// ������ ��������� ���� +15 � ����
// ==========================
instance ItRi_DS2P_Fortitude(ItRi_Proto)
{
	name = Name_Ring;	description = "�������� ����";
	visual = "ItRi_Dex_02.3ds";
	
	on_equip = Equip_ItRi_DS2P_Fortitude;
	on_unequip = UnEquip_ItRi_DS2P_Fortitude;
	
	text[2] = NAME_Bonus_ManaMax;	count[2] = Ri_DS2P_Fortitude_ManaMax;
	
	value = Value_Ri_DS2P_Fortitude;
	count[5] = value;
};
func void Equip_ItRi_DS2P_Fortitude()
{	Equip_Bonus_Mana(Ri_DS2P_Fortitude_ManaMax);};
func void UnEquip_ItRi_DS2P_Fortitude()
{	UnEquip_Bonus_Mana(Ri_DS2P_Fortitude_ManaMax);};
// ==========================
// ������ �������� +10 � ������ � ������� ���
// ==========================
instance ItRi_DS2P_HuntersProtection(ItRi_Proto)
{
	name = Name_Ring;	description = "������ ��������";
	visual = "ItRi_Dex_02.3ds";
	
	on_equip = Equip_ItRi_DS2P_HuntersProtection;
	on_unequip = UnEquip_ItRi_DS2P_HuntersProtection;
	
	text[2] = NAME_Prot_Edge;	count[2] = Ri_DS2P_HuntersProtection_Prot;
	
	value = Value_Ri_DS2P_HuntersProtection;
	count[5] = value;
};
func void Equip_ItRi_DS2P_HuntersProtection()
{	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT,Ri_DS2P_HuntersProtection_Prot);};
func void UnEquip_ItRi_DS2P_HuntersProtection()
{	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT,-Ri_DS2P_HuntersProtection_Prot);};

// ==========================
// ������ ����� 
// ==========================
instance ItRi_DSP_SpiderRing(ItRi_Proto)
{
	flags = ITEM_MISSION;
	name = Name_Ring;	description = "������ �����";
	visual = "ItRi_DSP_SpiderRing.3ds";
	
	text[2] = NAME_DS_Prot_EdgeAndPointAndMagicAndFire;	count[2] = Ri_DS2P_HuntersProtection_Prot;
	
	value = Value_Ri_DSP_SpiderRing;	count[5] = value;
	
	on_equip = Equip_ItRi_DSP_SpiderRing;
	on_unequip = UnEquip_ItRi_DSP_SpiderRing;
};
func void Equip_ItRi_DSP_SpiderRing()
{
	B_GiveBonusProt(self, PROT_DS_ALL, Ri_DSP_SpiderRing);
	Bonus_WeaverRing_Equipped = TRUE;
	GiveBonus_WeaverComplect();
};
func void UnEquip_ItRi_DSP_SpiderRing()
{
	B_GiveBonusProt(self, PROT_DS_ALL, -Ri_DSP_SpiderRing);
	Bonus_WeaverRing_Equipped = FALSE;
	GiveBonus_WeaverComplect();
};

