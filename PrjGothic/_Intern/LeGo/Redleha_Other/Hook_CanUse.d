
////////////////// ДВОЙНОЙ ХУК на oCNpc__CanUse \\\\\\\\\\\\\\\\\\\\\
// не забываем выводить сообщения, G_CanNotUse почистить
// закомментить MEM_Debug, сильно тормозят игру!
/////////////////////////////////////////////////////////////////////

//результат проверки через скрипты, объединяется по И с результатом oCNpc__CanUse
var int My_Npc_CanUse_Result;

func void My_Npc_CanUse_before()
// хук ДО вызова функции движка
// здесь доступны все переменные регистров и стек с параметрами
{
//MEM_Debug("My_Npc_CanUse_before");
//MEM_Debug(ConcatStrings("retAddr = ", I2S(retAddr)));
	if(ECX > 0) { //npc
		var c_npc slf; slf = _^(ECX);
//MEM_Debug(slf.name);
	}
	else	{
//MEM_Debug("No NPC in ECX");
		return;
	};
	if(MEM_ReadInt(ESP + 4) > 0) { //item
		var ocItem itm; itm = _^(MEM_ReadInt(ESP + 4));
//MEM_Debug(itm.name);
	}
	else	{
//MEM_Debug("No item in [ESP + 4]");
		return;
	};
	// тут выполянем все проверки и результат записываем в глобальную переменную
	My_Npc_CanUse_Result = TRUE;	//по умолчанию - можно
	// 2 оружия
	if ((itm.weight & ITEM_DAG) == ITEM_DAG)	{	
		if (Npc_GetTalentSkill(slf, NPC_TALENT_2X2H) == 0)	{
			My_Npc_CanUse_Result = FALSE;
			if (Npc_IsPlayer(slf))	{
				Print(PRINT_TALENT_2x2H_MISSING);
			};
		};
	}
	else
	// щит нельзя тому, у кого нет навыка
	if ((itm.flags & ITEM_SHIELD) == ITEM_SHIELD)	{	
		if (!Hlp_IsItem(itm, BUG_Shield))	{//плюшка
			if (Npc_GetTalentSkill(slf, NPC_TALENT_SHIELD) == 0)	{
				My_Npc_CanUse_Result = FALSE;
				if (Npc_IsPlayer(slf))	{
					Print(PRINT_SHIELDTALENT_MISSING);
				};
			};
		};
	};
};

func void My_Npc_CanUse_after()
// хук ПОСЛЕ вызова функции движка
// доступны переменные регистров, но с уже изменившимися значениями. в стеке мусор
// результат вызова функции движка можно узнать/изменить в HookedFunc_Result
{
//MEM_Debug("My_Npc_CanUse_after");
//MEM_Debug(ConcatStrings("HookedFunc_Result = ", I2S(HookedFunc_Result)));
	// здесь можно изменить значение HookedFunc_Result
	HookedFunc_Result = HookedFunc_Result && My_Npc_CanUse_Result;
};

