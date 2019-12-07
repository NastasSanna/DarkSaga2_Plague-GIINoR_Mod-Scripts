/**********************************************************
					ИЗМЕНЕНИЕ АТРИБУТОВ
		с проверкой условий на ношение брони/оружия

   !!!  НЕ вызывать из on_equip/on_unequip  !!!
 
 ==========================================================

  1. Само по себе изменение атрибутов не приводит к проверке
условий на ношение оружия и брони.

  2. Если в момент деэкипировки условие на ношение предмета
не выполняется, то возникнет БАГ "двойного снятия" - дважды
вызовется on_unequip, снизится защита брони и т.п.

  Это может произойти при снижении атрибутов НЕ в (де-)экипировке
или, когда предмет повышает атрибут, который одновременно
является условием для его ношения.

  Возникает при ЯВНОЙ деэкипировке через инвентарь, экипировке
другого предмета через инвентарь или скрипты, при использовании
AI_Unequip, и НЕ возникает при НЕЯВНОЙ - удалении экипированного
предмета из инвентаря и при автоматической деэкипировке (см. п.3).
  
  3. Явная (де-)экипировка чего угодно вызывает автоматическую
проверку условий ВСЕХ экипированных предметов, а неявная
не вызвает.
 
//* NS - 26/01/2013

************************************************************/

// проверить, можно ли использовать предмет, если атрибут atr изменится на val
func void B_DSG_CheckEquippedItem(var C_NPC npc, var C_ITEM itm, var int atr, var int val)
{
	if (atr == 0)
	{
		return;
	};
	// чему будет равен атрибут после изменения
	var int NewValue; NewValue = 0;
	if (atr == ATR_DEXTERITY)
	{
		NewValue = npc.attribute[ATR_DEXTERITY] + val;
	}
	else if (atr == ATR_STRENGTH)
	{
		NewValue = npc.attribute[ATR_STRENGTH] + val;
	}
	else if (atr == ATR_MANA_MAX)
	{
		NewValue = npc.attribute[ATR_MANA_MAX] + val;
	}
	else if (atr == ATR_HITPOINTS_MAX)
	{
		NewValue = npc.attribute[ATR_HITPOINTS_MAX] + val;
	};
	// проверка всех условий
	var int CanUse; CanUse = TRUE;
	if ((itm.cond_atr[0] == atr) && (itm.cond_value[0] > NewValue))
	{
		G_CanNotUse(true, atr, itm.cond_value[0] - val);
		CanUse = FALSE;
	};
	if ((itm.cond_atr[1] == atr) && (itm.cond_value[1] > NewValue)) 
	{
		G_CanNotUse(true, atr, itm.cond_value[1] - val);
		CanUse = FALSE;
	};
	if ((itm.cond_atr[2] == atr) && (itm.cond_value[2] > NewValue))
	{
		G_CanNotUse(true, atr, itm.cond_value[2] - val);
		CanUse = FALSE;
	};
	// если какое-то условие нарушено
	if (CanUse == FALSE)
	{
		// моментальное снятие через удаление предмета
		var int ItmInstance;	ItmInstance = Hlp_GetInstanceID(itm);
		var int cnt;			cnt = Npc_HasItems(npc, ItmInstance);
		Npc_RemoveInvItems(npc,ItmInstance, cnt);
		CreateInvItems(npc,ItmInstance, cnt);
	};
};

// изменить атрибут с проверкой условий на ношение оружия/брони
func void B_DSG_ChangeAttribute(var C_NPC npc, var int Attribute, var int Value)
{
	// проверка
	var C_ITEM itm;
	// экипированная броня
	if (Npc_HasEquippedArmor(npc))
	{
		itm = Npc_GetEquippedArmor(npc);
		B_DSG_CheckEquippedItem(npc, itm, Attribute, Value);
	};
	// ближний бой
	if (Npc_HasEquippedMeleeWeapon(npc))
	{
		itm = Npc_GetEquippedMeleeWeapon(npc);
		B_DSG_CheckEquippedItem(npc, itm, Attribute, Value);
	};
	// дальний бой
	if (Npc_HasEquippedRangedWeapon(npc))
	{
		itm = Npc_GetEquippedRangedWeapon(npc);
		B_DSG_CheckEquippedItem(npc, itm, Attribute, Value);
	};
	
	// собственно изменение атрибутов
	Npc_ChangeAttribute(npc,Attribute,Value);
};

/*********************************************************
				СПОСОБ 2 - Танцы с бубном :)

  Проверка выполняется движком через одевание брони.

  Преимущество - движок сам проверит ВСЕ.

 !!! НЕЛЬЗЯ вызывать эту функцию в (де-)экипировке БРОНИ !!!

  Протестировано на разных сочетаниях брони/оружия. Все
переодевания ГГ совершенно незаметны глазу. FAKEARMOR
удаляется своевременно.

********************************************************/

/*/

// никакая это не броня
// будем ее экипировать, чтобы вызвать автоматическую проверку всех условий
instance FAKEARMOR(C_ITEM)
{
	name = "FAKEARMOR";	visual_change = "hum_body_Naked0.asc";
	mainflag = ITEM_KAT_ARMOR;	wear = WEAR_TORSO | WEAR_EFFECT;	material = MAT_LEATHER;
	on_equip = Equip_FAKEARMOR;
};
// при экипировке самоуничтожается
func void Equip_FAKEARMOR()
{
	Npc_RemoveInvItem(self,FAKEARMOR);
};

func void B_DSG_ChangeAttribute(var C_NPC npc, var int Attribute, var int Value)
{
	// текущая экипированная броня
	var C_ITEM Armor;		
	var int ArmorInstance;	ArmorInstance = -1;
	var int cnt;
	// если она есть
	if (Npc_HasEquippedArmor(npc))
	{
		Armor = Npc_GetEquippedArmor(npc);
		ArmorInstance = Hlp_GetInstanceID(Armor);
		cnt = Npc_HasItems(npc, ArmorInstance);
		
		// снимаем броню без явного вызова AI_Unequip
		Npc_RemoveInvItems(npc,ArmorInstance, cnt);
		CreateInvItems(npc,ArmorInstance, cnt);
	};
	
	// собственно изменение параметров (обязательно после того, как сняли-удалили броню)
	Npc_ChangeAttribute(npc,Attribute,Value);
	
	// надеваем что угодно, чтобы вызвалась проверка оружия
	// FAKEARMOR самоуничтожается при надевании и выглядит как кожа ГГ
	CreateInvItem(npc,FAKEARMOR);
	AI_EquipArmor(npc,FAKEARMOR);
//	Npc_RemoveInvItem(hero,FAKEARMOR);
	
	// пытаемся надеть прежнюю броньку, если она была
	if (ArmorInstance > -1)
	{
		AI_EquipArmor(npc,ArmorInstance);
	};
};

//*/