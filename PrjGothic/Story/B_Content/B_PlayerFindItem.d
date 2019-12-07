
func void B_PlayerFindItem(var int itm,var int amount)
{
	var string concatText;
	var string itemname;
	if(Npc_IsPlayer(self))
	{
		CreateInvItems(self,itm,amount);
		itemname = item.name;
		if(itm == ItMi_Gold)
		{
			concatText = ConcatStrings(PRINT_DS_GoldTaken,IntToString(amount));
			concatText = ConcatStrings(concatText,PRINT_DS_GoldShtuk);
			Print(concatText);
			Snd_Play("Geldbeutel");
		}
		else
		{
			if(amount == 1)
			{
				concatText = ConcatStrings(PRINT_DS_Item_1_Take,itemname);
				Print(concatText);
			}
			else
			{
				concatText = ConcatStrings(PRINT_DS_Item_Lot_Take,itemname);
				Print(concatText);
			};
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,IntToString(amount));
			concatText = ConcatStrings(concatText,PRINT_DS_Shtuk);
			concatText = ConcatStrings(concatText,")");
		};
	};
};

