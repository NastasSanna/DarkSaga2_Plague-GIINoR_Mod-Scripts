
//MOB
func void Mob__RemoveItem(var int mobPtr)
{
	var oCMobContainer mobContainer;	mobContainer = _^(mobPtr);
	var oCNpc her;	her = Hlp_GetNpc(hero);
	var int herInventory;
	var int mobInventory;
	mobInventory = mobContainer.containList_next;	//zCListSort<oCItem>*
	herInventory = her.inventory2_inventory_next;	//zCListSort<oCItem>*
	
	mobContainer.containList_next = herInventory;
	her.inventory2_inventory_next = mobInventory;
};
func void Mob_RemoveItem(var int mobPtr, var int instanceName, var int howmany)
{
	var oCMobContainer mobContainer;	mobContainer = _^(mobPtr);
	var oCNpc her;	her = Hlp_GetNpc(hero);
	var int herInventory;
	var int mobInventory;
	mobInventory = mobContainer.containList_next;	//zCListSort<oCItem>*
	herInventory = her.inventory2_inventory_next;	//zCListSort<oCItem>*
	
	her.inventory2_inventory_next = mobInventory;
	mobContainer.containList_next = herInventory;
	
	Npc_RemoveInvItems(her,instanceName,howmany);
	
	Mob__RemoveItem(mobPtr);	
};
func void Mob_RemoveItemByMobName(var string mobname, var int instanceName, var int howmany)
{
	var int mobPtr;
	mobPtr = MEM_SearchVobByName(mobname);
	Mob_RemoveItem(mobPtr,instanceName,howmany);
};
func void Mob_Destroy(var int mobPtr)
{
	const int oCMob__Destroy = 7455280;	//0071C230
	CALL__thiscall(mobPtr,oCMob__Destroy);
};
func void MobContainer_Open(var int mobPtr,var C_NPC slf)
{
	const int oCMobContainer__Open = 7496960;	//00726500
	CALL_PtrParam(MEM_InstToPtr(slf));
	CALL__thiscall(mobPtr,oCMobContainer__Open);
};
func void MobContainer_Close(var int mobPtr,var C_NPC slf)
{
	const int oCMobContainer__Close = 7496960;	//7497280
	CALL_PtrParam(MEM_InstToPtr(slf));
	CALL__thiscall(mobPtr,oCMobContainer__Close);
};
func void MobContainer_Reset(var int mobPtr)
{
	const int oCMobContainer__Reset = 7495264;	//00725E60
	CALL__thiscall(mobPtr,oCMobContainer__Reset);
};
