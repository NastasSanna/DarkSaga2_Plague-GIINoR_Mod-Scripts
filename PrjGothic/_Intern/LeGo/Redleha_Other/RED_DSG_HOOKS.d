/*
11)void __thiscall zCView::PrintTimed(int int zSTRING const & float zCOLOR *)  	0x007A7D20 = 8027424
12)void __thiscall zCView::PrintTimedCX(int zSTRING const & float struct zCOLOR *)  	0x007A7DB0 = 8027568
*/
/*
HOOK �� ������ ���������� ������ � ����������� � ����, ������������� � ���������
12 - ��� ������ description
11 - ��� ��� ������ text[0..5]
*/
func void Hook_View_11(){

	//"--------------------------����� zcView �������� ItemWindow");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(ECX));
	
	//"--------------------------int �������");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+4)));	//����������
	
	//"--------------------------int �������");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+8)));	//����������
	
	//"--------------------------����� zString �������� � ������ ������ ");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+12)));	//����� ������
	//MEM_SendToSpy(zERR_TYPE_FAULT,MEM_ReadString(MEM_ReadInt(ESP+12)));//������
	
	//"--------------------------����� ��� �� ���, ���� FLOAT");
	//MEM_SendToSpy(zERR_TYPE_FAULT,Float32ToString(MEM_ReadInt(ESP+16)));
	
	//"--------------------------�����, ��� ��������� zCOLOR ������ � ��� ����");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+20)));//����� �����
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToHex(MEM_ReadInt(MEM_ReadInt(ESP+20))));//����
	var zColor col;	col = _^(MEM_ReadInt(ESP + 20));
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToHex(col.color));	//����
	col.color = COL_WHITE;
	if(Hlp_StrCmp( MEM_ReadString(MEM_ReadInt(ESP+12)), "����"))
	{
		col.color = COL_RED;
	};
	if(Str_ToInt( MEM_ReadString( MEM_ReadInt(ESP+12) ) ))
	{
		col.color = COL_Lime;
	};
	if(Hlp_StrCmp( MEM_ReadString(MEM_ReadInt(ESP+12)), "����:"))
	{
		col.color = COL_BLUE;
	};
	
};
func void Hook_View_12(){	
	//if(xOnce2<2)
	//{
	/*MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_12");
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------����� zcView �������� ItemWindow");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(ECX));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------int �������");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+4)));	//����������
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------����� zString �������� � ������ ������ ");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+8)));	//������
	MEM_SendToSpy(zERR_TYPE_FAULT,MEM_ReadString(MEM_ReadInt(ESP+8)));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------����� ��� �� ���, ���� FLOAT");
	MEM_SendToSpy(zERR_TYPE_FAULT,Float32ToString(MEM_ReadInt(ESP+12)));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------�����, ��� ��������� ���� ���������� ����� � ��� ����");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+16)));//����� �����
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToHex(MEM_ReadInt(MEM_ReadInt(ESP+16))));//����
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