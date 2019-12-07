const int YPos_1 = 1;
const int YPos_3 = 3;
const int YPos_5 = 5;
const int YPos_7 = 7;
const int YPos_9 = 9;
const int YPos_11 = 11;
const int YPos_13 = 13;
const int YPos_15 = 15;
const int YPos_17 = 17;

func int C_Npc_DS_HasItems(var C_NPC owner, var int itemInstance, var int amount)
{
	if(Npc_HasItems(owner,itemInstance) >= amount)
	{
		return TRUE;
	};	
	return FALSE;
};

func int C_Npc_DS_HasItems_Scr(var C_NPC owner, var int itemInstance, var int amount, var int dS_PosY, var int boolShowOnScreen)
{
	var string concatText;
	var string itemname;
	var int realAmount;
	if(boolShowOnScreen == TRUE)
	{	
		realAmount = Npc_HasItems(owner,itemInstance);
		CreateInvItems(owner,itemInstance,1);
		Npc_RemoveInvItems(owner,itemInstance,1);
		itemname = item.name;
		concatText = ConcatStrings(itemname,": ");
		concatText = ConcatStrings(concatText,IntToString(realAmount));
		concatText = ConcatStrings(concatText,"/");
		concatText = ConcatStrings(concatText,IntToString(amount));	
		AI_PrintScreen(concatText,2,dS_PosY,FONT_ScreenSmall,3);
	};
	if(Npc_HasItems(owner,itemInstance) >= amount)
	{
		return TRUE;
	};	
	return FALSE;
};
func void Print_DS_Npc_HasItems(var C_NPC owner, var int itemInstance, var int dS_PosY)
{
	var string concatText;
	var string itemname;
	var int realAmount;
	realAmount = Npc_HasItems(owner,itemInstance);
	CreateInvItems(owner,itemInstance,1);
	Npc_RemoveInvItems(owner,itemInstance,1);
	itemname = item.name;
	concatText = ConcatStrings(itemname,": ");
	concatText = ConcatStrings(concatText,IntToString(realAmount));
	AI_PrintScreen(concatText,2,dS_PosY,FONT_ScreenSmall,3);
};
