
// ������ �����
const int Value_Am_Viola	= 200;
const int Am_Viola_Dex			= 5;
const int Am_Viola_Bow			= 5;
// ������ �����
const int Value_Am_Chaos	= 0;
// ������ ���������
const int Value_Am_SueBaby = 350;
const int Am_SueBaby_HP = 40;
const int AM_SueBaby_Prot = 10;

//-------------//��� DS2
/*"��� �������" - ��������� � ����� �� 5 �������� (����� ����)*/
instance ItAm_DS2P_AdanosGift(ItAm_Proto)
{
	description = "��� �������";	visual = "ItAm_Mana_01.3ds";	value = Value_Am_Mana;
	on_equip = Equip_ItAm_DS2P_AdanosGift;
	on_unequip = UnEquip_ItAm_DS2P_AdanosGift;	
	text[2] = Name_Bonus_RegenMana;
	count[5] = value;	//����
};
func void Equip_ItAm_DS2P_AdanosGift(){
	if(Npc_IsPlayer(self))	{RegenMana_from_Amulet = TRUE;	C_Time_RegenerateMana();	};
};
func void UnEquip_ItAm_DS2P_AdanosGift(){
	if(Npc_IsPlayer(self))	{RegenMana_from_Amulet = FALSE;C_Time_RegenerateMana();	};
};
//-------------------------------------------------------------
/*"��� ������" - ��������� � ����� �� 5 �������� (����� ����)*/
instance ItAm_DS2P_InnosGift(ItAm_Proto)
{
	description = "��� ������";	visual = "ItAm_Hp_01.3ds";	value = Value_Am_HP;
	on_equip = Equip_ItAm_DS2P_InnosGift;
	on_unequip = UnEquip_ItAm_DS2P_InnosGift;
	text[2] = Name_Bonus_RegenHP;
	count[5] = value;	//����
};
func void Equip_ItAm_DS2P_InnosGift(){
	if(Npc_IsPlayer(self))	{RegenHP_from_Amulet = TRUE;		C_Time_RegenerateHP();	};
};
func void UnEquip_ItAm_DS2P_InnosGift(){
	if(Npc_IsPlayer(self))	{RegenHP_from_Amulet = FALSE;	C_time_RegenerateHP();	};
}; 
//-------------------------------------------------------------
//������� ������ +5 � ����� � +5 � ��������,
// �� ������ "������ ��� �����"
// UNFINISHED ����, ������
instance ItAm_DS2P_Viola(ItAm_Proto)
{
	description = "������ �����";	visual = "ItAm_Hp_01.3ds";
	on_equip = Equip_ItAm_DS2P_Viola;
	on_unequip = UnEquip_ItAm_DS2P_Viola;
	text[2] = NAME_Bonus_Dex;	count[5] = Am_Viola_Dex;
	text[3] = ConcatStrings(NAME_ADDON_BONUS_BOW, IntToString(Am_Viola_Bow));
	value = Value_Am_Viola;	count[5] = value;
};
func void Equip_ItAm_DS2P_Viola(){
	Npc_ChangeAttribute(self,ATR_DEXTERITY,Am_Viola_Dex);
	B_AddFightSkill(self,NPC_TALENT_BOW,Am_Viola_Bow);
};
func void UnEquip_ItAm_DS2P_Viola(){
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-Am_Viola_Dex);
	B_AddFightSkill(self,NPC_TALENT_BOW,-Am_Viola_Bow);
}; 
//-------------------------------------------------------------
//������� ��������� +10 � ������ �� ������ �������� ��� � +40 � ��������
// �� ������ "�������� ����� ������"
// UNFINISHED ����, ������
instance ItAm_DS2P_SueBaby(ItAm_Proto)
{
	description = "������ ���������";	visual = "ItAm_Hp_01.3ds";
	on_equip = Equip_ItAm_DS2P_SueBaby;
	on_unequip = UnEquip_ItAm_DS2P_SueBaby;
	text[2] = NAME_Bonus_HP;	count[5] = Am_SueBaby_HP;
	text[3] = ConcatStrings(NAME_Prot_Edge, IntToString(Am_SueBaby_Prot));
	value = Value_Am_SueBaby;	count[5] = value;
};
func void Equip_ItAm_DS2P_SueBaby(){
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,Am_SueBaby_HP);
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT,10);
};
func void UnEquip_ItAm_DS2P_SueBaby(){
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-Am_SueBaby_HP);
	B_GiveBonusProt(self,PROT_DS_EDGE | PROT_DS_BLUNT,-10);
}; 
