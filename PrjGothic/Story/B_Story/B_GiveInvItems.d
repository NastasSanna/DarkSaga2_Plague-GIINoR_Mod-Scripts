/*Функция для получения падежа и окончания в зависимости от кол-ва итемов*/ /*на будущее*/
func int B_DS_typeAmount_Text(var int amount)
{
	if(((amount == 1) || (amount % 10 == 1)) && ((amount != 11) || (amount % 100 != 11)|| (amount % 1000 != 11)))
	{		
		return 1;	
	}
	else if(	((amount == 2) || (amount == 3) || (amount == 4) || (amount % 10 == 2) || (amount % 10 == 3) || (amount % 10 == 4))
	&& ((amount != 12) || (amount != 13) || (amount != 14) || (amount % 100 != 12) || (amount % 100 != 13) || (amount % 100 != 14)
	|| (amount % 1000 != 12) || (amount % 1000 != 13) || (amount % 1000 != 14))	)
	{		
		return 2;	
	}
	else	{	return 0;	};
	return -1;
};
//---------------------------------------------------------------------------------
//--Функция возвращает строку с информацией о переданном/взятом с кол-вом в штуках
//---------------------------------------------------------------------------------
func string B_DS_GiveInvItems_Str(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount)
{
	var string concatText;
	var string itemname;
	var int x; x = amount;
	concatText = "";
	itemname = "";
	//*NS - был багоюз - если оружие не убрано, то оно не удаляется	
	if (Npc_HasReadiedWeapon(giver))	{
		var C_ITEM weapon;
		weapon = Npc_GetReadiedWeapon(giver);
		if (Hlp_GetInstanceID(weapon) == itemInstance)	{
			//AI_RemoveWeapon_ds(giver);	//УБРАНО 3.12.2013
			AI_RemoveWeapon(giver);
		};
	};
	//*/
	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
	itemname = item.name;
	if(itemInstance == ItMi_Gold)
	{
		if(Npc_IsPlayer(giver))
		{
			concatText = ConcatStrings(PRINT_DS_GoldGiven,IntToString(amount));
		}
		else if(Npc_IsPlayer(taker))
		{
			concatText = ConcatStrings(PRINT_DS_GoldTaken,IntToString(amount));
		};
		concatText = ConcatStrings(concatText,PRINT_DS_GoldShtuk);
	}
	else
	{
		if(Npc_IsPlayer(giver))
		{
			if(x == 1)
			{
				concatText = ConcatStrings(PRINT_DS_Item_1_Give,itemname);
			}
			else
			{
				concatText = ConcatStrings(PRINT_DS_Item_Lot_Give,itemname);
			};
		}
		else if(Npc_IsPlayer(taker))
		{
			if(x == 1)
			{
				concatText = ConcatStrings(PRINT_DS_Item_1_Take,itemname);
			}
			else
			{
				concatText = ConcatStrings(PRINT_DS_Item_Lot_Take,itemname);
			};
		};
		concatText = ConcatStrings(concatText," (");
		concatText = ConcatStrings(concatText,IntToString(amount));
		concatText = ConcatStrings(concatText,PRINT_DS_Shtuk);
		concatText = ConcatStrings(concatText,")");
	};
	return concatText;
};
//-------------------------------------------------
//-Функция проверки условия на наличие предметов
//-------------------------------------------------
func int C_DS_GiveInvItems(var C_Npc giver,var int itemInstance,var int amount)
{
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))	
		{	return FALSE;	};
	};
	return TRUE;
};
//-------------------------------------------------------------------------------------
// Функция передачи предмета с проверкой на наличие и заданием Y-координаты вывода
//-------------------------------------------------------------------------------------
func int B_GiveInvItem_red(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount, var int screenprocent)
{
	var int Y; Y = screenprocent;
	if(Y == 0) {Y = 30;};
	if(C_DS_GiveInvItems(giver,itemInstance,amount))
	{
		if(amount > 0)
		{
			AI_PrintScreen(B_DS_GiveInvItems_Str(giver,taker,itemInstance,amount),30,Y,FONT_ScreenSmall,5);
		};
		return TRUE;
	};
	return FALSE;
};
//-------------------------------------------------------------------------------------
// Функция передачи предмета с проверкой на наличие
//-------------------------------------------------------------------------------------
func int B_GiveInvItems(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount)
{
	var int YPos;	YPos = 0;
	if(C_DS_GiveInvItems(giver,itemInstance,amount))
	{
		if(itemInstance == ItMi_Gold)
		{
			YPos = YPOS_DS_Gold;
		}
		else
		{
			if(Npc_IsPlayer(giver))
			{
				YPos = YPOS_ItemGiven;
			}
			else if(Npc_IsPlayer(taker))
			{
				YPos = YPOS_ItemTaken;
			};
		};
		if(amount > 0)
		{
			AI_PrintScreen(B_DS_GiveInvItems_Str(giver,taker,itemInstance,amount),30,YPos,FONT_ScreenSmall,5);
		};
		return TRUE;
	};
	return FALSE;
};
//-------------------------------------------------------------------------------------
//Передача и удаление итемов из инвентаря берущего: -----------------------------------
//-------------------------------------------------------------------------------------
func int B_DS_GiveRemoveItems(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount)
{
	if(B_GiveInvItems(giver,taker,itemInstance,amount))
	{
		Npc_RemoveInvItems(taker,itemInstance,amount);
		return TRUE;
	};
	return FALSE;
};
//-------------------------------------------------------------------------------------
//Передача и удаление итемов из инвентаря берущего c указанием Y-координаты на экране--
//-------------------------------------------------------------------------------------
func int B_DS_GiveRemoveItems_Red(var C_Npc giver, var C_Npc taker, var int itemInstance, var int amount, var int screenproc)
{
	if(B_GiveInvItem_Red(giver,taker,itemInstance,amount,screenproc))
	{
		Npc_RemoveInvItems(taker,itemInstance,amount);
		return TRUE;
	};
	return FALSE;
};
//-------------------------------------------------------------------------------------
//Удаление и создание итемов в инвентаре НПСа: (нужно для насильственной деэкипировки)-
//-------------------------------------------------------------------------------------
func void Npc_RemoveAndCreateInvItems(var C_NPC npc, var int itemInstance, var int amount)
{
	Npc_RemoveInvItems(npc,itemInstance,amount);
	CreateInvItems(npc,itemInstance,amount);
};
