/**************************************************************************

func void Print_DSG_OnMob(var string txt, var string FONT, var int line)
	Вывести сообщение при работе с mob'ом (над окном диалога)

func void Print_DSG_InInventory(var string txt, var string FONT, var int line)
	Вывести сообщение при работе с mob'ом (над окном диалога)

 //* NS
  
***************************************************************************/


// ждем случайное время, от 0.2 до 0.8 сек. (больше - ощутимая пауза)
// вместо B_MM_DeSynchronize(), которая не работает (конкретно AI_Waitms)
func void B_DSG_WaitRandom(var C_NPC slf)
{
	var int rnd;	rnd = Hlp_Random(80);
	if (rnd < 20)	{	AI_Wait(slf,0.2);	}
	else if (rnd < 30)	{	AI_Wait(slf,0.3);	}
	else if (rnd < 40)	{	AI_Wait(slf,0.4);	}
	else if (rnd < 50)	{	AI_Wait(slf,0.5);	}
	else if (rnd < 60)	{	AI_Wait(slf,0.6);	}
	else if (rnd < 70)	{	AI_Wait(slf,0.7);	}
	else				{	AI_Wait(slf,0.8);	};
};

// =========================================================================
// Вывести сообщение при работе с mob'ом
// =========================================================================
// (над окном диалога)
func void Print_DSG_OnMob(var string txt, var string FONT, var int line)
{
	PrintScreen(txt, -1, 75 + 2*line, FONT, 4);
};

// =========================================================================
// Вывести сообщение в инвентаре
// =========================================================================
// не должно налезать ни на инвентарь, ни на обычный Print
func void Print_DSG_InInventory(var string txt, var string FONT, var int line)
{
	PrintScreen(txt, -1, 12 + 2*line, FONT, 4);
};

// =========================================================================
// Время, прошедшее с начала игры (игровых минут)
// =========================================================================
/* текущее =C_GetTime_Plus(0,0,0) =Wld_GetPassedTime(0)
func int C_GetTime_Now()
{
	// Ikarus/LeGo Needed
	return Wld_GetPassedTime(0);
};
//*/
// через h часов m минут от текущего, + случайно rand_min минут
// для проверки, когда что-то будет готово
func int C_GetTime_Plus(var int h, var int m, var int rand_min)
{
	// Ikarus/LeGo Needed
	return Wld_GetPassedTime(0) + h * 60 + m + Hlp_Random(rand_min);
};

// Какой сегодня день, если считать, что он начинается не в 0, а в h часов
func int Wld_GetDay_Plus(var int h)
{
	var int d;	d = Wld_GetDay();
	if ((d > 0) && Wld_IsTime(0,0,h,0))	{
		d -= 1;
	};
	return d;
};

// сколько полных игровых часов прошло с начала игры
func int Wld_GetFullHours()
{
	Wld_GetTime();
	return time_Get[0] * 24 + time_Get[1];
};

// =========================================================================
// Действия в диалогах
// =========================================================================
// действие с мобом (slf - ипользует моб, oth - собеседник, не обязательно как в диалоге)
func void B_DIA_UseMob(var C_NPC slf, var C_NPC oth, var string MobName, var float WaitTime)
{
	AI_StopLookAt(slf);
	AI_UseMob(slf,MobName,1);
	AI_Wait(slf,WaitTime);
	AI_UseMob(slf,MobName,-1);
	AI_GotoNpc(slf, oth);
	AI_TurnToNpc(slf, oth);	AI_LookAtNpc(slf,oth);
	AI_TurnToNpc(oth,slf);
};
// действие с предметом (slf - ипользует предмет, oth - собеседник, не обязательно как в диалоге)
// предмет НЕ удаляется после использования
func void B_DIA_UseItem_Wait(var C_NPC slf, var C_NPC oth, var int ItemInstance, var float WaitTime)
{
	CreateInvItem(slf, ItemInstance);
	AI_StopLookAt(slf);
	AI_UseItemToState(slf,ItemInstance,1);
	AI_Wait(slf,WaitTime);
	AI_UseItemToState(slf,ItemInstance,-1);
	AI_LookAtNpc(slf,oth);
};

// =========================================================================
// Мишени
// NS - 09-10/07/2013 
// Ikarus/LeGo Needed
// =========================================================================
var string AllTargetWPs; //автоматически собирается в B_DSG_InsertAllTargets
	const string AllTargetWPs_delim =";";

/// вставить мишень на WP и сохранить его имя в AllTargetWPs
func void Wld_DSG_InsertTarget(var int tgt_inst, var string WPname)
{
	//MEM_Debug(WPName);
	Wld_InsertNpc(tgt_inst, WPName);
	
	if (Hlp_StrCmp(AllTargetWPs,""))	{
		AllTargetWPs = WPname;
	}
	else 	{
		AllTargetWPs = ConcatStrings(AllTargetWPs, AllTargetWPs_delim);
		AllTargetWPs = ConcatStrings(AllTargetWPs, WPname);
	};
};


// автоматическая вставка мишеней во все подходящие WP
func void B_DSG_InsertAllTargets()
{
	var string WPName;
	VAR zCWaypoint curWp;
	// перебираем все WP
	VAR zCListSort curItem;	curItem = _^(MEM_Waynet.wplist_next);
	
	// while (curItem.data);
	var int label;	label = MEM_StackPos.position;
	if (curItem.data)
	{
		curWp = _^(curItem.data);
		WPName = curWp.name;
		// если имя WP содержит правильный фрагмент - тыкаем туда мишень
		if (STR_IndexOf(WPName, "_TARGETINVIS_POS_") != -1)		{		Wld_DSG_InsertTarget(TargetInvis,WPName);		};
		if (STR_IndexOf(WPName, "_TARGETFACE_POS_") != -1)		{		Wld_DSG_InsertTarget(TargetFace,WPName);		};
		if (STR_IndexOf(WPName, "_TARGETFULL_POS_") != -1)		{		Wld_DSG_InsertTarget(TargetFull,WPName);		};
		curItem = _^(curItem.next);
		MEM_StackPos.position = label;
	};
	//end;
};

// Npc находится на стрельбище ?
// через WP надежнее и проще, чем проверка расстояния до самих NPC-мишеней
func int C_DSG_NpcIsOnTrainingGround_Ranged(var C_NPC npc)
{
	// сюда можно вручную вписать еще какие-то проверки
	// автоматика:
	// выдираем из AllTargetWPs все имена WP
	var int AllTargetWPs_cnt; AllTargetWPs_cnt = STR_SplitCount(AllTargetWPs, AllTargetWPs_delim);
	var int i; i = 0;
	while (i < AllTargetWPs_cnt);
		// если есть совпадения - мы на стрельбище
		If (Npc_GetDistToWP(npc, STR_Split(AllTargetWPs, AllTargetWPs_delim, i)) < FIGHT_DIST_RANGED_OUTER)
		{
			return TRUE;
		};
		i += 1;
	end;
	// не нашлось совпадаений - значит не на стрельбище
	return FALSE;
};


// =========================================================================
// Следовать/вести/ждать ГГ - где?
// Частично решают проблему с пропадающими NPC:
//при загрузке игры ГГ еще не вставлен в мир Npc_GetNearestWP(hero) не сработает
//сохранить string-переменную в явном виде нельзя
// =========================================================================

//следуем за ГГ
func string C_GetFollowPlayerWP(var string DefaultWP)
{
	//если у ГГ есть рядом WP
	if (!Hlp_StrCmp(Npc_GetNearestWP(hero),""))	{
		return Npc_GetNearestWP(hero);
	} 
	//иначе - проверяем, сохранен ли WP у нас
	else if (!Hlp_StrCmp(self.wp,""))	{
		return self.wp;
	};
	//иначе - WP по умолчанию
	return DefaultWP;
};

//ждем ГГ
func string C_GetWaitPlayerWP(var string DefaultWP)
{
	//проверяем, сохранен ли WP у нас
	if (!Hlp_StrCmp(self.wp,""))	{
		return self.wp;
	};
	//иначе - WP рядом с ГГ
	if (!Hlp_StrCmp(Npc_GetNearestWP(hero),""))	{
		return Npc_GetNearestWP(hero);
	}; 
	//иначе - WP по умолчанию
	return DefaultWP;
};

//ведем ГГ
func string C_GetGuidePlayerWP(var string DefaultWP)
{
	//WP рядом с ГГ
	if (!Hlp_StrCmp(Npc_GetNearestWP(hero),""))	{
		return Npc_GetNearestWP(hero);
	}; 
	//иначе - проверяем, сохранен ли WP у нас
	if (!Hlp_StrCmp(self.wp,""))	{
		return self.wp;
	};
	//иначе - WP по умолчанию
	return DefaultWP;
};
