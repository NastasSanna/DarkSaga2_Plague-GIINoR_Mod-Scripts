const int oCViewDialogTrade__OnTransferLeftX = 6863312; //0x68B9D0
//Эту функцию в инит_глобал
//HookEngineF(oCViewDialogTrade__OnTransferLeftX, 6, onTradeLeft);

func void onTradeLeft() {
	var int value;
	value = MEM_ReadInt(ESP+20); // itm.value * multiplier
	MEM_WriteInt(ESP+20, 123); // set new value
	var oCItem itm; itm = _^(EBX); //Get the item
	var oCNpc npc; npc = _^(MEM_InformationMan.npc); // Get the NPC
};
