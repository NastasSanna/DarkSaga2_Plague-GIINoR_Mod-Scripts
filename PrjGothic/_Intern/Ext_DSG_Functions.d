
func string CS2(var string str1, var string str2){
	return ConcatStrings(str1,str2);
};
func string CS3(var string str1, var string str2, var string str3){
	return ConcatStrings(ConcatStrings(str1,str2),str3);
};
func string CS4(var string str1, var string str2, var string str3,var string str4){
	return ConcatStrings(ConcatStrings(ConcatStrings(str1,str2), str3),str4);
};
func string CS5(var string str1, var string str2, var string str3,var string str4,var string str5){
	return ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings(str1,str2), str3),str4),str5);
};
func string I2S(var int integer){return IntToString(integer);};
func string F2S(var float floati){return FloatToString(floati);};

//------------------------------------------------------------------------------
//-----Всё, что ВЫШЕ этого текста, перед компиляцией надо закомментить----------
var int Saturas_New_Functions;