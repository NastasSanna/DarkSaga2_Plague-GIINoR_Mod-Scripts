
//функция введена из-за вылетов со щитами, чтобы каждый раз не править все вызовы
// отсюда можно запустить и стандартный EquipItem, и EquipItem_DS
func void B_DS_EquipItem(var C_NPC npc, var int ItemInst)
{
	EquipItem(npc, ItemInst);
	//S_Shield_01();	//UNFINISHED - проверить, что ItemInst - это щит! пока вызывается только для щитов
};
//
//Функция призвана деэкипировать оружие со щитом после нокдауна или смерти, если щит не был вытащен из-за спины.
//
func void B_DS_UnequipWeapons(var C_NPC slf)
{
	AI_UnequipWeapons(slf);
	if(!Npc_IsSlotFree(slf,"ZS_SHIELD"))
	{
		var int shield_ptr;
		shield_ptr = Npc_GetSlotItem(slf,"ZS_SHIELD");
		oCNpc_UnequipItem(slf, shield_ptr);
	};
};

