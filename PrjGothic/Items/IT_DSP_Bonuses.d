
// ==================== Комплект Ткача ======================
// Печать Ткача (кольцо)
var int Bonus_WeaverRing_Equipped;
// Челнок смерти (одноручник)
var int Bonus_WeaverSword_Equipped;
// Щит паука
var int Bonus_WeaverShield_Equipped;
// бонус +10 к одноручному
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
