var int c_Knows_DIA_Jack_Start;
var int c_Knows_DIA_Greg_Start02;
var int c_Knows_DIA_Nikki_KoloHasReturned;

func void B_DS2P_Talk_End(var C_NPC slf, var C_Npc oth)
{
	if(Npc_IsPlayer(oth))
	{
		B_InitNpcGlobals();	//Инициализируем всех НПС
		B_TradeSwapBack(self); //NS - 01/05/15 меням инвентарь торговца на обычный
		
		/* // TO DO
		//Сбрасываем счетчик дней между разговорами c Джеком
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(none_11_Jack))
		{
			DayNumber_LastTalkWithJack = Wld_GetDay();
		};
		
		//После стартового диалога с Джеком идём к пиратам на первую встречу.
		if(Npc_KnowsInfo(oth,DIA_Jack_Start) && (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(none_11_Jack)) && !c_Knows_DIA_Jack_Start)
		{
			B_StartOtherRoutine(none_11_Jack,"GoToPirates");
			B_StartOtherRoutine(none_15_Diego,"GoToPirates");
			B_StartOtherRoutine(none_18_Vatras,"GoToPirates");
			c_Knows_DIA_Jack_Start = TRUE;
		};
		//После стартового диалога с Грегом все занимают свои начальные положения. Пираты идут в деревню, два охраняют корабль.
		if(Npc_KnowsInfo(oth,DIA_Greg_Start02) && (C_NpcIs(slf, PIR_201_DS2P_Greg)) && !c_Knows_DIA_Greg_Start02)
		{
			B_StartOtherRoutine(PIR_201_DS2P_Greg,"START");					//Идут в деревню
			B_StartOtherRoutine(PIR_202_DS2P_Symon,"START");					//Идут в деревню
			B_StartOtherRoutine(Pir_204_DS2P_Karah,"START");					//Идут в деревню
			B_StartOtherRoutine(PIR_206_DS2P_SueBaby,"START");			//Идут в деревню
			B_StartOtherRoutine(PIR_208_DS2P_GrayBeard,"START");		//Идут в деревню
			B_StartOtherRoutine(PIR_207_DS2P_LanSkeleton,"START");	//Охраняют корабль
			B_StartOtherRoutine(PIR_209_DS2P_Vales,"START");					//Охраняют корабль
			Wld_InsertNpc(DS_22_SKIP,"");																	//Вставялем Скипа в трюме корабля
			c_Knows_DIA_Greg_Start02 = TRUE;
		};
		//После триалога (Никки, Тамир, ГГ)
		if(Npc_KnowsInfo(oth,DIA_Nikki_KoloHasReturned) && (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BAU_107_DS2P_Nikki)) && !c_Knows_DIA_Nikki_KoloHasReturned)
		{
			B_StartOtherRoutine(BAU_105_DS2P_Tamir,"START");					//Возвращается на место
			c_Knows_DIA_Nikki_KoloHasReturned = TRUE;
		};
		
		//NS - 09/03/2016 орки: Рак-Тарак лечит Ар-Туша
		if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orc_DS2P_RakTarak))
			&& (ArTush_Healed == -1))
		{
			var C_NPC RakTarak;	RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
			var C_NPC ArTush;	ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
			//все здоровы, нормальный распорядок
			B_StartOtherRoutine(RakTarak,"START");
			B_StartOtherRoutine(ArTush,"START");
			
			//все AI после смены распорядка
			Npc_ClearAIQueue(RakTarak);
			Npc_ClearAIQueue(ArTush);
			//делает лекарство
			CreateInvItem(RakTarak,ItMi_Flask_stand);
			AI_UseItem(RakTarak,ItMi_Flask_stand);
			AI_GotoNpc(RakTarak,ArTush);
			//пьет лекарство
			AI_Wait(ArTush,3);
			AI_StandUp(ArTush);
			CreateInvItem(ArTush,ItFo_DS2P_OrcBooze);
			AI_UseItem(ArTush,ItFo_DS2P_OrcBooze);
		};
		//NS - 20/06/2016 гоблины: после квеста "Защита для маленьких" вождь говорит про задание от шамана
		if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_DS2P_TsaHaNauh))
			&& (MIS_DS2P_Protection4LittleOnes == LOG_SUCCESS) && (MIS_DS2P_FuriousAncestors_Stage == 0))
		{
			MIS_DS2P_FuriousAncestors_Stage = MIS_DS2P_FuriousAncestors_TsaHaNauhRemembered;
		};
		*/
	};
};

