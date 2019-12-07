func string B_Build_TrdString(var string text, var int itemInstance)
{
	var string concatString;
	concatString = "";
	concatString = ConcatStrings(" Всего: ",IntToString(Npc_HasItems(other,itemInstance)));
	concatString = ConcatStrings(concatString," штук.");
	concatString = ConcatStrings(text,concatString);
	return concatString;
};
