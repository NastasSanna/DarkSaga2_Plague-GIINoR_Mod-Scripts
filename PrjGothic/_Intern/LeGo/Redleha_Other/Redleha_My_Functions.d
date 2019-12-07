
func void B_GetContainerItems()
{
	//if(C_BodyStateContains(hero,BS_INVENTORY))
	//{
		var oCNpc her;	her = Hlp_GetNpc(hero);
		var oCMobContainer mobContainer;	//Наш сундук;
	
		if(Hlp_Is_oCMobContainer(her.focus_vob))
		{
			mobContainer = _^(her.focus_vob);
		};
		var zCListSort ListofItemsofMob;
		var oCItem itm;
		
		ListofItemsofMob = _^(mobContainer.containList_next);
		While(ListofItemsofMob);
			itm = _^(ListofItemsofMob.data);
			CreateInvItems(hero,Hlp_GetInstanceID(itm),itm.amount);
			Mob_RemoveItem(her.focus_vob,Hlp_GetInstanceID(itm),itm.amount);
			if(!ListofItemsofMob.next)
			{
				return;
			};
			ListofItemsofMob = _^(mobContainer.containList_next);
		end;
	//};
};
func void B_GetNPCsItems()
{
	var oCNpc her;	her = Hlp_GetNpc(hero);
	if(Hlp_Is_oCNpc(her.focus_vob))
	{
		var oCNpc vict;	//Жертва воровства
		vict = _^(her.focus_vob);
		
		var zCListSort vict_inventar;
		var int vict_inventar_Ptr;
		vict_inventar_Ptr = vict.inventory2_inventory_next;
		vict_inventar = _^(vict.inventory2_inventory_next);
		var oCItem itm;
		
		While(vict_inventar_Ptr);	//сканируем инвентарь
			itm = _^(vict_inventar.data);
			if(itm.flags & ITEM_ACTIVE){}		//экипированное не трогаем ))
			else				{
				CreateInvItems(hero,Hlp_GetInstanceID(itm),itm.amount);
			};
			if(vict_inventar.next)
			{
				vict_inventar_Ptr = vict_inventar.next;
				vict_inventar = _^(vict_inventar.next);
			}
			else	{	vict_inventar_Ptr = 0;	};
		end;
		Npc_ClearInventory(vict);	//После копирования всего инвентаря жертвы себе - очищаем его у жертвы.
	};
};

//////
//========================================
// Instanzfunktion callen
//========================================
const int zCParser__CreateInstance1 = 7941920;//0x00792F20
func int zCParser_CreateInstance1(var string instName, var int ptr) {
    CALL_IntParam(ptr);
    CALL_zStringPtrParam(instName);
    CALL__thiscall(parser, zCParser__CreateInstance1);
    return CALL_RetValAsInt();
};

func void B_ChangeItemBetter(var C_NPC slf)
{
	var oCItem itm;	itm = Npc_GetEquippedMeleeWeapon(slf);
	var int itmID;	itmID = itm.instanz;
	var zCPar_Symbol itmScriptName;
	itmID = MEM_GetSymbolByIndex(itmID);
	itmScriptName = _^(itmID);
	var string oldItmName;
	oldItmName = itmScriptName.name;	//Получили имя в виде "ItMw_Sword"
	
	var string NewName;
	NewName = ConcatStrings(itmScriptName.name,"_BET");	//Получаем имя оружия с окончанием _BET
	var int itmNewID; itmNewID = MEM_FindParserSymbol(NewName);	//Ищем его ID в символьной таблице.
	if(!itmNewID)	{
		MEM_Warn("A new item is missing in the symbol table.");
	}
	else	{
		var int symbID;	symbID = MEM_GetParserSymbol(NewName);
		var zCPar_Symbol itmScriptName1;
		itmScriptName1 = _^(symbID);
		if((itmScriptName1.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_INSTANCE)
		{
			EquipWeapon(slf,itmNewID);
		}
		else
		{
			MEM_Warn("New item is not INSTANCE!");
		};	
	};
};
