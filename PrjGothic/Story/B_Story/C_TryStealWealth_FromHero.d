
var int StolenItem;
var int StolenGoldAmount;

func void B_Steal_FromHero(var C_NPC slf, var C_NPC oth, var int itm, var int amount) {
	StolenItem = itm;
	if (itm == ItMi_Gold) {
		StolenGoldAmount = amount;
	};
	B_GiveInvItems(oth, slf, itm, amount);
};


//slf крадет золото (не больше половины) или золотой предмет из инвентаря oth
func void B_TrySteal_FromHero(var C_NPC slf, var C_NPC oth) {
	if (Npc_HasItems(oth, ItMi_Gold) >= 20)	{
		B_Steal_FromHero(slf, oth, ItMi_Gold, 5 + Npc_HasItems(oth, ItMi_Gold) / 10 * 5);
	};
	if (Npc_HasItems(oth, ItMi_GoldRing))	{
		B_Steal_FromHero(slf, oth, ItMi_GoldRing, 1);
	};
	if (Npc_HasItems(oth, ItMi_GoldNecklace))	{
		B_Steal_FromHero(slf, oth, ItMi_GoldNecklace, 1);
	};
	if (Npc_HasItems(oth, ItMi_GoldChest))	{
		B_Steal_FromHero(slf, oth, ItMi_GoldChest, 1);
	};
	if (Npc_HasItems(oth, ItMi_GoldChalice))	{
		B_Steal_FromHero(slf, oth, ItMi_GoldChalice, 1);
	};
	if (Npc_HasItems(oth, ItMi_GoldCup))	{
		B_Steal_FromHero(slf, oth, ItMi_GoldCup, 1);
	};
	if (Npc_HasItems(oth, ItMi_GoldPlate))	{
		B_Steal_FromHero(slf, oth, ItMi_GoldPlate, 1);
	};
	if (Npc_HasItems(oth, ItMi_GoldCandleHolder))	{
		B_Steal_FromHero(slf, oth, ItMi_GoldCandleHolder, 1);
	};
};

func int C_CanStealWealth_FromHero(var C_NPC oth)
{
	if (Npc_HasItems(oth, ItMi_Gold) >= 20)	{
		return TRUE;
	};
	if (Npc_HasItems(oth, ItMi_GoldRing))	{
		return TRUE;
	};
	if (Npc_HasItems(oth, ItMi_GoldNecklace))	{
		return TRUE;
	};
	if (Npc_HasItems(oth, ItMi_GoldChest))	{
		return TRUE;
	};
	if (Npc_HasItems(oth, ItMi_GoldChalice))	{
		return TRUE;
	};
	if (Npc_HasItems(oth, ItMi_GoldCup))	{
		return TRUE;
	};
	if (Npc_HasItems(oth, ItMi_GoldPlate))	{
		return TRUE;
	};
	if (Npc_HasItems(oth, ItMi_GoldCandleHolder))	{
		return TRUE;
	};
	
	return FALSE;
};
