
// ==================== �������� ����� ======================
// ������ ����� (������)
var int Bonus_WeaverRing_Equipped;
// ������ ������ (����������)
var int Bonus_WeaverSword_Equipped;
// ��� �����
var int Bonus_WeaverShield_Equipped;
// ����� +10 � �����������
const int Bonus_Weaver_1H = 10;

func int GiveBonus_WeaverComplect() 
{
	if (Bonus_WeaverRing_Equipped && Bonus_WeaverSword_Equipped && Bonus_WeaverShield_Equipped) 
	{
		
		B_AddFightSkill(self, NPC_TALENT_1H, Bonus_Weaver_1H);
	}
	else
	{
		B_AddFightSkill(self, NPC_TALENT_1H, -Bonus_Weaver_1H);
	};
};
