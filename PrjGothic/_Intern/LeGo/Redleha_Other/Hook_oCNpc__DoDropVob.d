func void Hook_oCNpc__DoDropVob() {
   const int oCNpc__DoDropVob = 7622096; //0x744DD0
   HookEngine(oCNpc__DoDropVob, 6, "EVT_NPCDROPVOB");
};

func void EVT_NpcDropVob() {
   var c_npc slf; slf = MEM_PtrToInst(ECX);
   var c_item itm; itm = MEM_PtrToInst(MEM_ReadInt(ESP + 4));
	/*NS - 26/05/2013 несуществующая cs4 заменена на обычную ConcatStrings
   PrintS(cs4(slf.name, " lies'", itm.name, "' fallen"));
	/*/
	var string txt;
	txt = ConcatStrings(slf.name, " lies'");
	txt = ConcatStrings(txt, itm.name);
	txt = ConcatStrings(txt, "' fallen");
	PrintS(txt);
	//*/
};

//	----- Item einsammeln -----
func void Hook_oCNpc__DoTakeVob() {
	const int oCNpc__DoTakeVob = 7621056; //0x7449C0
	HookEngine(oCNpc__DoTakeVob, 6, "EVT_NPCTAKEVOB");
};

func void EVT_NpcTakeVob()
{
	//	----- an den NPC und das item kommen -----
	var c_npc slf; slf = MEM_PtrToInst(ECX);				// der NPC, der das Item einsammelt
	var C_ITEM itm; itm = MEM_PtrToInst(MEM_ReadInt(ESP + 4));		// Pointer auf das Item
	//	----- an den NPC und das item kommen -----
	
	//	----- stimmt das item? -----
	if (!Hlp_IsValidItem (itm))
	{
		return;
	};
};