
func string B_BuildLearnString(var string text,var int kosten)
{
	var string concatText;
	concatText = ConcatStrings(text,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	return concatText;
};

func string B_DS_BuildLearnString(var string text,var int kosten)
{
	var string concatText;
	concatText = ConcatStrings(text,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_DS_LP);
	return concatText;
};

