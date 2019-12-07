/*
11)void __thiscall zCView::PrintTimed(int int zSTRING const & float zCOLOR *)  	0x007A7D20 = 8027424
12)void __thiscall zCView::PrintTimedCX(int zSTRING const & float struct zCOLOR *)  	0x007A7DB0 = 8027568
*/
/*
HOOK на строки выводимого текста с информацией о вещи, расположенной в инвентаре
12 - это строка description
11 - это все строки text[0..5]
*/
func void Hook_View_11(){

	//"--------------------------АДРЕС zcView элемента ItemWindow");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(ECX));
	
	//"--------------------------int элемент");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+4)));	//координата
	
	//"--------------------------int элемент");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+8)));	//координата
	
	//"--------------------------АДРЕС zString элемента и строка текста ");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+12)));	//адрес строки
	//MEM_SendToSpy(zERR_TYPE_FAULT,MEM_ReadString(MEM_ReadInt(ESP+12)));//строка
	
	//"--------------------------ВРЕМЯ или ХЗ что, типа FLOAT");
	//MEM_SendToSpy(zERR_TYPE_FAULT,Float32ToString(MEM_ReadInt(ESP+16)));
	
	//"--------------------------Адрес, где находится zCOLOR текста и сам цвет");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+20)));//адрес цвета
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToHex(MEM_ReadInt(MEM_ReadInt(ESP+20))));//цвет
	var zColor col;	col = _^(MEM_ReadInt(ESP + 20));
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToHex(col.color));	//цвет
	col.color = COL_WHITE;
	if(Hlp_StrCmp( MEM_ReadString(MEM_ReadInt(ESP+12)), "Урон"))
	{
		col.color = COL_RED;
	};
	if(Str_ToInt( MEM_ReadString( MEM_ReadInt(ESP+12) ) ))
	{
		col.color = COL_Lime;
	};
	if(Hlp_StrCmp( MEM_ReadString(MEM_ReadInt(ESP+12)), "Цена:"))
	{
		col.color = COL_BLUE;
	};
	
};
func void Hook_View_12(){	
	//if(xOnce2<2)
	//{
	/*MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_12");
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------АДРЕС zcView элемента ItemWindow");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(ECX));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------int элемент");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+4)));	//координата
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------АДРЕС zString элемента и строка текста ");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+8)));	//строка
	MEM_SendToSpy(zERR_TYPE_FAULT,MEM_ReadString(MEM_ReadInt(ESP+8)));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------ВРЕМЯ или ХЗ что, типа FLOAT");
	MEM_SendToSpy(zERR_TYPE_FAULT,Float32ToString(MEM_ReadInt(ESP+12)));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------Адрес, где находится цвет диалоговой фразы и Сам цвет");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+16)));//адрес цвета
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToHex(MEM_ReadInt(MEM_ReadInt(ESP+16))));//цвет
	var zColor col;	col = _^(MEM_ReadInt(ESP + 16));	col.color = COL_RED;
	MEM_SendToSpy(zERR_TYPE_FAULT,"---------------------------------------PAUSE");
	//	xOnce2+=1;
	//};
	*/
	var zColor col;	col = _^(MEM_ReadInt(ESP + 16));
	col.color = COL_Fuchsia;
};
func void Hook_View()
{
	//	HookEngineF(8037040,7,Hook_View_2);

	//	HookEngineF(8032832,6,Hook_View_9);
	HookEngineF(8027424,5,Hook_View_11);
	//HookEngineF(8027568,6,Hook_View_12);
};