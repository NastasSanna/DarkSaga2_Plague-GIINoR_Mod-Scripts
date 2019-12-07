func void Npc_CreateInvSlotsForShields(var int npcInstance)
{
	var C_NPC npc; npc = Hlp_GetNpc(npcInstance);
	Npc_CreateInvSlot(npc,"ZS_SHIELD");
	Npc_CreateInvSlot(npc,"ZS_LEFTARM");
};
FUNC int SearchNpcAndCreateSlotsForShields()
{
   MEM_InitGlobalInst();
   
   VAR oCNpc curNpc;
   VAR zCListSort curItem;
	var C_NPC npc;
	//var string ConcatString;
   
   curItem = _^(MEM_World.voblist_npcs);
	MEM_DEBUG("Адрес списка НПС:");
	MEM_DEBUG(I2S(MEM_World.voblist_npcs));
	
	while(curItem);
		curNpc = _^(curItem.data);
		MEM_DEBUG(I2S(curNpc.idx));
		npc = Hlp_GetNpc(curNpc);
	
		//Идёт создание слотов
		/*if(curNpc.guild < GIL_SEPERATOR_HUM)
		{
			if(!Npc_IsInvSlotAvailable(npc ,"ZS_LEFTARM"))
			{
				//Npc_CreateInvSlot(npc ,"ZS_LEFTARM");
				MEM_DEBUG(CS4("Slot ZS_LEFTARM is AVAILABLE for NPC: ",curNpc.name," id = ",I2S(curNpc.idx)));
			};
			if(!Npc_IsInvSlotAvailable(npc ,"ZS_SHIELD"))
			{
				//Npc_CreateInvSlot(npc ,"ZS_SHIELD");
				MEM_DEBUG(CS4("Slot ZS_SHIELD is AVAILABLE for NPC: ",curNpc.name," id = ",I2S(curNpc.idx)));
			};
		};*/
		
		IF(!curItem.next)
		{
			RETURN 0;
		};
		curItem = _^(curItem.next);
	end;	
};
