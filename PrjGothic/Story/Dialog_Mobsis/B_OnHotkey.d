
func int B_GetBestPlayerMap()
{
	if(CurrentLevel == DSG_PROLOG_ZEN)
	{
		/*Redleha: тело выбора карты*/
	};
	return 0;
};

func int B_GetAnyPlayerMap()
{
	/*Redleha: тело выбора карты*/
	return 0;
};
//-----------------------------------------------------------------
//                  Ѕыстрые клавиши (англ.)
//-----------------------------------------------------------------
//  лавиша 'M'
func int player_hotkey_screen_map()
{
	var int OldInstance;
	var int NewInstance;
	OldInstance = B_GetPlayerMap();
	if((OldInstance > 0) && (Npc_HasItems(hero,OldInstance) < 1))
	{
		OldInstance = 0;
	};
	B_SetPlayerMap(OldInstance);
	NewInstance = OldInstance;
	/*Redleha: тело выбора карты*/
	/*
	if(CurrentLevel != WORLD_DARKSAGA_ZEN)
	{
		if((OldInstance == ItWr_Map_World_DarkSaga) || (OldInstance == ItWr_DS_MAP_InnosShrine) 
		|| (OldInstance == ItWr_DS_Map_Shard_Treasure) || (OldInstance == ItWr_DS_Map_Pirates) || (OldInstance == ItWr_DS_Map_Paladins)
		|| (OldInstance == ITWR_RICKAMULETMAP) || (OldInstance == ITWR_RICKAMULETMAPDRAKA))
		{
			NewInstance = 0;
		};
	};
	*/
	if(NewInstance <= 0)
	{
		NewInstance = B_GetBestPlayerMap();
	};
	if((NewInstance <= 0) && (OldInstance <= 0))
	{
		NewInstance = B_GetAnyPlayerMap();
	};
	if(NewInstance > 0)
	{
		B_SetPlayerMap(NewInstance);
		return NewInstance;
	}
	else
	{
		return OldInstance;
	};
};
func void B_LameSchlork()
{
	Snd_Play("DRINKBOTTLE");
};
var int lllll;
//  лавиша 'P'
func void player_hotkey_lame_potion()
{
	if(ShowTimeOnScreen == FALSE)
	{
		if(Time_Color < 4)
		{
			Time_Color += 1;
		}
		else
		{
			Time_Color = 0;
		};
		ShowTimeOnScreen = TRUE;
	}
	else
	{
		ShowTimeOnScreen = FALSE;
	};
};

//  лавиша 'H'
//instance oCMobContainer_Focus(oCMobContainer);
//instance oCItem_Focus(oCItem);
var int switch;
func string ABCDEF(var func fnc)
{
	var int ESP;
	ESP = MEMINT_FindFrameBoundary(MEMINT_GetESP(), -1);
	ESP += MEMINT_DoStackFrameSize; 
	var int passedMySelf; passedMySelf = 0;
	var int mySelf; mySelf = MEM_GetFuncID(fnc);
	var int funcID;
	
	while(funcID != mySelf);
		var int popPos;
		popPos = MEM_ReadInt(ESP-MEMINT_DoStackPopPosOffset);
		if (passedMySelf) {	
		} 
		else if (popPos < MEM_Parser.stack_stacksize) {
			
			funcID = MEM_GetFuncIDByOffset(popPos);
			passedMySelf = (funcID == mySelf);
		};
		if (MEMINT_IsFrameBoundary(ESP)) {
			ESP += MEMINT_DoStackFrameSize;
			//MEM_SendToSpy(zERR_TYPE_FAULT, "..next");
		};
	end;
	var zCPar_Symbol function;
	function = _^(MEM_GetSymbolByIndex(funcID));
	return function.name;	//"fnc"
};
func void ABCDEF_1(){
	ABCDEF(ABCDEF_1);	//"ABCDEF_1";
};

func void player_hotkey_lame_heal()
{
	var oCNpc her;	her = Hlp_GetNpc(hero);
	var oCMobContainer mobContainer;	//Ќаш сундук;
	var zCListSort ListofItemsofMob;
	var zCListSort ListofItemsofNpc;
	var zCListSort ListSortAll;
	var int mobItemContainer; //oCItemContainer*
	var int NpcItemContainer; //oCItemContainer*
	var oCItem itm;
	var oCItem itm1;
	var int amount;
	
	if(Hlp_Is_oCMobContainer(her.focus_vob))
	{
		mobContainer = _^(her.focus_vob);
	};
	//SetValue_str("TRADE_CURRENCY_INSTANCE","ITRW_ARROW",0);
	//SetValue_str("NAME_Currency","—трелы:",0);
	//«олото
	//var int ItmInst;
	//var int gold_offset;
	//ItmInst = Itm_GetCurrencyInstance();
	//var string xxx;
	//xxx = Itm_GetCurrencyInstanceName();
	//ItmInst = MEM_GetSymbolByIndex(ItmInst);
	//var zCPar_Symbol symbol;	
	//symbol = _^(ItmInst);
	//gold_offset = symbol.offset;
	//itm = _^(symbol.offset);
	//Print(xxx);	
	
	/*if(!switch)
	{
		Npc_OpenInventory(hero,1);
		switch = true;
	}
	else
	{
		Npc_CloseInventory(hero);
		switch = false;
	};*/
	
	Wld_SetTime_dhm(0,11,59);
	//SearchNpcAndCreateSlotsForShields();
	
	if(Npc_GetAniVelocity(hero,"S_1HATTACK") >= mkf(25))
	{
		Npc_SetAniVelocity(hero,"S_1HATTACK",20);
	}
	else if(Npc_GetAniVelocity(hero,"S_1HATTACK") == mkf(20))
	{
		Npc_SetAniVelocity(hero,"S_1HATTACK",15);
	}
	else if(Npc_GetAniVelocity(hero,"S_1HATTACK") == mkf(15))
	{
		Npc_SetAniVelocity(hero,"S_1HATTACK",10);
	};
	/*var oCNpc Npc; Npc = Hlp_GetNpc( hero );
	var int temp;
	temp = oCItem_Focus;
	MEM_AssignInst(temp,Npc.focus_vob);
	MEM_InitGlobalInst();
	//включаем режим ФsleepФ
	//oCMobContainer_Focus._zCVob_bitfield[2]=oCMobContainer_Focus._zCVob_bitfield[2] & ~zCVob_bitfield2_sleepingMode;	
//отключаем физику
	//oCMobContainer_Focus._zCVob_bitfield [0] = oCMobContainer_Focus._zCVob_bitfield [0] & ~zCVob_bitfield0_physicsEnabled;
	//oCMobContainer_Focus._oCMob_bitfield = oCMobContainer_Focus._oCMob_bitfield | oCMob_bitfield_moveable;
	Wld_PlayEffect("spellFX_ItemAusbuddeln",oCMobContainer_Focus,oCMobContainer_Focus,0,0,0,FALSE);
	//oCMobContainer_Focus._oCMob_name = "¬зломаный сундук";
	//oCMobContainer_Focus._oCMobLockable_keyInstance = "ItRu_Telekinesis";
	oCMobContainer_Focus._zCVob_trafoObjToWorld[3]=addf(oCMobContainer_Focus._zCVob_trafoObjToWorld[3],20);   
  oCMobContainer_Focus._zCVob_trafoObjToWorld[7]=addf(oCMobContainer_Focus._zCVob_trafoObjToWorld[7],20);   
  oCMobContainer_Focus._zCVob_trafoObjToWorld[11]=addf(oCMobContainer_Focus._zCVob_trafoObjToWorld[11],20);
  oCMobContainer_Focus._zCVob_bbox3D_mins[0]=addf(oCMobContainer_Focus._zCVob_bbox3D_mins[0],20);
  oCMobContainer_Focus._zCVob_bbox3D_mins[1]=addf(oCMobContainer_Focus._zCVob_bbox3D_mins[1],20);
  oCMobContainer_Focus._zCVob_bbox3D_mins[2]=addf(oCMobContainer_Focus._zCVob_bbox3D_mins[2],20);
  oCMobContainer_Focus._zCVob_bbox3D_maxs[0]=addf(oCMobContainer_Focus._zCVob_bbox3D_maxs[0],20);
  oCMobContainer_Focus._zCVob_bbox3D_maxs[1]=addf(oCMobContainer_Focus._zCVob_bbox3D_maxs[1],20);
  oCMobContainer_Focus._zCVob_bbox3D_maxs[2]=addf(oCMobContainer_Focus._zCVob_bbox3D_maxs[2],20);
	MEM_InitGlobalInst();
	
//отключаем режим ФsleepФ
	oCMobContainer_Focus._zCVob_bitfield[2]=oCMobContainer_Focus._zCVob_bitfield[2] | zCVob_bitfield2_sleepingMode;	
//включаем физику
	oCMobContainer_Focus._zCVob_bitfield [0] = oCMobContainer_Focus._zCVob_bitfield [0] | zCVob_bitfield0_physicsEnabled;
	//oCMobContainer_Focus._oCMob_bitfield = oCMobContainer_Focus._oCMob_bitfield & ~oCMob_bitfield_moveable;
//записываем в activeVobList
	MEM_WriteInt(MEM_World.activeVobList_array+4*(MEM_World.activeVobList_numInArray), Npc.focus_vob);
//сообщаем, что activeVobList стал на 1 элемент длиннее
	MEM_World.activeVobList_numInArray += 1;
	
	temp = oCMobContainer_Focus;
	MEM_AssignInst(temp,Npc.focus_vob);
	
	MEM_InitGlobalInst();*/
};
//  лавиша 'Shift + '1-5''

func void EngineNpc(var int inst)
{
	Wld_InsertNpc(inst,Npc_GetNearestWP(hero));
};
func void EngineItem(var int inst)
{
	CreateInvItem(hero, inst);
};
