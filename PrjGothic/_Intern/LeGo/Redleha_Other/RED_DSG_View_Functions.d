/*
	ptr = MEM_InformationMan.DlgTrade;	//oCViewDialogTrade*
	ptr = MEM_ReadInt(ptr+260);     //oCViewDialogTrade*.oCViewDialogItemContainer*
	//oCViewDialogItemContainer*.Multiplier (+268 - offset)
	MEM_WriteInt(ptr+268,mul);//oCViewDialogItemContainer.Multiplier = mul
	
	ptr = MEM_InformationMan.DlgTrade;	//oCViewDialogTrade*
	ptr = MEM_ReadInt(ptr+252);     //oCViewDialogTrade*.oCViewDialogStealContainer
	//oCViewDialogStealContainer*.Multiplier (+268 - offset)
	MEM_WriteInt(ptr+268,mul);//oCViewDialogStealContainer.Multiplier = mul 
	*/

//var int DlgTrade				;  //oCViewDialogTrade*	 //das sind Views. Das heiЯt vermutlich nur Anzeige
//void __fastcall oCViewDialogTrade::AllDialogsDisable(void) 	0x0068B160

func void ViewDialogTrade_AllDialogsDisable()	//Пока мусор
{
	var int oCViewDialogTrade_Ptr;	oCViewDialogTrade_Ptr = MEM_InformationMan.DlgTrade;
	const int oCViewDialogTrade__AllDialogsDisable = 6861152;	const int null = 0;	
	CALL__fastcall(oCViewDialogTrade_Ptr,_@(null),oCViewDialogTrade__AllDialogsDisable);
};
func void ViewDialogTrade_AllDialogsStop()	//Пока мусор
{
	var int oCViewDialogTrade_Ptr;	oCViewDialogTrade_Ptr = MEM_InformationMan.DlgTrade;
	const int oCViewDialogTrade__AllDialogsStop = 6861120;	const int null = 0;	
	CALL__fastcall(oCViewDialogTrade_Ptr,_@(null),oCViewDialogTrade__AllDialogsStop);
};

func void zCView_SetPos(var int zCView_Ptr,var int x,var int y)
{
	//zCView::SetPos(int,int) 007A75B0 AB
	const int zCView__SetPos = 8025520;
	CALL_IntParam(y);	CALL_IntParam(x);
	CALL__thiscall(zCView_Ptr,zCView__SetPos);
};
func void zCView_SetSize(var int zCView_Ptr,var int x,var int y)
{
	//zCView::SetSize(int,int)007A77A0 6E
	const int zCView__SetSize = 8026016;
	CALL_IntParam(y);	CALL_IntParam(x);
	CALL__thiscall(zCView_Ptr,zCView__SetSize);
};
var int View_GetSize[2];
func void zCView_GetSize(var int zCView_Ptr)
{
	//void __thiscall zCView::GetSize(int & int &)    	0x007A7810
	const int zCView__GetSize = 8026128;
	var int xadr; var int yadr;
	CALL_IntParam(_@(yadr));	CALL_IntParam(_@(xadr));
	CALL__thiscall(zCView_Ptr,zCView__GetSize);
	View_GetSize[0] = xadr;	View_GetSize[1] = yadr;
};
//------------------------------------------------------------------

/*
zCViewText * __thiscall zCView::CreateText(int int zSTRING const & float zCOLOR & int int)	0x007A7AB0 = 8026800
			class zCViewText * __thiscall zCView::CreateText(int int zSTRING const &)      	0x007AA2B0 = 8037040
void __thiscall zCView::DefPrintwin(int int int int)       	0x007AA730 = 8038192
void __thiscall zCView::Dialog(int int class zSTRING const & float zCOLOR *)  	0x007A8D40 = 8031552
void __thiscall zCView::DialogCX(int zSTRING const & float zCOLOR *)    	0x007A8E10 = 8031760
void __thiscall zCView::DialogCXY(zSTRING const & float struct zCOLOR *)    	0x007A8F60 = 8032096
void __thiscall zCView::DialogCY(int zSTRING const & float zCOLOR *)    	0x007A8E70 = 8031856
void __thiscall zCView::DialogMessage(zSTRING const & zSTRING const & float zCOLOR &)  	0x007A8FB0 = 8032176
			void __thiscall zCView::DialogMessageCXY(class zSTRING const &    zSTRING const &    float    zCOLOR &) 	0x007A9240 = 8032832
void __thiscall zCView::DialogSelection(zSTRING const & zSTRING const & zCOLOR & zCOLOR & float)	0x007A94D0 = 8033488
*/

const int COLOR_DIA_MESSAGE_HERO_adr = 11214812;	//AB1FDC
const int COLOR_DIA_MESSAGE_SELF_adr = 11214480;	//AB1E90
const int COLOR_INV_MENU_adr = 11210944;	//AB10C0
const int COLOR_XXX = 11211052;//00AB112C
//Hero to SELF
//const int zStringAdr_DIA_MESSAGE_STRING_HERO_NAME = 20314608;	//Стековое
//const int zStringAdr_DIA_MESSAGE_STRING_HERO_TEXT = 20314556;	//Стековое
//SELF to HERO
//const int zStringAdr_DIA_MESSAGE_STRING_SELF_NAME = 20314556;	//Стековое
//const int zStringAdr_DIA_MESSAGE_STRING_SELF_TEXT = 20314588;	//Стековое
var int xOnce;
var int xOnce1;
var int xOnce2;

func void Hook_View_1(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_1");};
func void Hook_View_2(){	
	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_2");
};
func void Hook_View_3(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_3");};
func void Hook_View_4(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_4");};
func void Hook_View_5(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_5");};
func void Hook_View_6(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_6");};
func void Hook_View_7(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_7");};
func void Hook_View_8(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_8");};
func void Hook_View_9(){	
	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_9");
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------АДРЕС zcView элемента DialogWindow");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(ECX));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------АДРЕС zString элемента и Имя человека говорящего");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+4)));	//строка
	MEM_SendToSpy(zERR_TYPE_FAULT,MEM_ReadString(MEM_ReadInt(ESP+4)));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------АДРЕС zString элемента и строка произнесённого текста ");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+8)));	//строка
	MEM_SendToSpy(zERR_TYPE_FAULT,MEM_ReadString(MEM_ReadInt(ESP+8)));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------ВРЕМЯ или ХЗ что, типа FLOAT");
	MEM_SendToSpy(zERR_TYPE_FAULT,Float32ToString(MEM_ReadInt(ESP+12)));
	
	MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------Адрес, где находится цвет диалоговой фразы и Сам цвет");
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+16)));//адрес цвета
	MEM_SendToSpy(zERR_TYPE_FAULT,IntToHex(MEM_ReadInt(MEM_ReadInt(ESP+16))));//цвет
	MEM_SendToSpy(zERR_TYPE_FAULT,"---------------------------------------PAUSE");
};
func void Hook_View_10(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_10");};

func void Hook_View_13(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_13");};
func void Hook_View_14(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_14");};
func void Hook_View_15(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_15");};


func void Hook_ocViewDialogItem_1(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_ocViewItem_1");};

func void Hook_View_Text1(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text1");};
func void Hook_View_Text2(){	
	
	//MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------Адрес, где находится цвет диалоговой фразы и Сам цвет");
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+4)));//адрес цвета
	//MEM_SendToSpy(zERR_TYPE_FAULT,IntToHex(MEM_ReadInt(MEM_ReadInt(ESP+4))));//цвет
	
	MEM_WriteInt(MEM_ReadInt(ESP+4),COL_AQUA);
	MEM_WriteInt(COLOR_XXX,COL_RED);
	//MEM_SendToSpy(zERR_TYPE_FAULT,"---------------------------------------PAUSE");
	//MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text2");
};
func void Hook_View_Text3(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text3");};
func void Hook_View_Text4(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text4");};
func void Hook_View_Text5(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text5");};
func void Hook_View_Text6(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text6");};
func void Hook_View_Text7(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text7");};
func void Hook_View_Text8(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text8");};
func void Hook_View_Text9(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text9");};
func void Hook_View_Text10(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text10");};
func void Hook_View_Text11(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text11");};
func void Hook_View_Text12(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text12");};
func void Hook_View_Text13(){	MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_View_Text13");};

var int EDX;
func void Hook_ocViewDialogItem_Render(){	
	if(!xOnce)
	{
		MEM_SendToSpy(zERR_TYPE_FAULT,"Hook_ocViewItem_1");
		MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(EDX));
		MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(ECX));
	
		MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------АДРЕС");
		MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+4)));	//строка
		MEM_SendToSpy(zERR_TYPE_FAULT,MEM_ReadString(MEM_ReadInt(ESP+4)));
		
		MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------АДРЕС");
		MEM_SendToSpy(zERR_TYPE_FAULT,IntToString(MEM_ReadInt(ESP+8)));	//строка
		MEM_SendToSpy(zERR_TYPE_FAULT,MEM_ReadString(MEM_ReadInt(ESP+8)));
	
		MEM_SendToSpy(zERR_TYPE_FAULT,"--------------------------ВРЕМЯ или ХЗ что, типа FLOAT");
		MEM_SendToSpy(zERR_TYPE_FAULT,Float32ToString(MEM_ReadInt(ESP+12)));
		MEM_SendToSpy(zERR_TYPE_FAULT,"---------------------------------------PAUSE");
		xOnce = TRUE;
	};
};

func void Hook_View1()
{
//	HookEngineF(8026800,6,Hook_View_1);
						//	HookEngineF(8037040,7,Hook_View_2);
//	HookEngineF(8038192,6,Hook_View_3);
//	HookEngineF(8031552,6,Hook_View_4);
//	HookEngineF(8031760,6,Hook_View_5);
//	HookEngineF(8032096,6,Hook_View_6);
//	HookEngineF(8031856,6,Hook_View_7);
//	HookEngineF(8032176,6,Hook_View_8);
						//	HookEngineF(8032832,6,Hook_View_9);
		
//	HookEngineF(8033488,6,Hook_View_10);
	

	HookEngineF(7420608,7,Hook_ocViewDialogItem_Render);
	
	//HookEngineF(8034880,6,Hook_View_1);
	//HookEngineF(8035088,6,Hook_View_2);
	//HookEngineF(8035920,6,Hook_View_3);
	//HookEngineF(8036400,6,Hook_View_4);
	//HookEngineF(8036160,6,Hook_View_5);
	//HookEngineF(8043152,6,Hook_View_6);
	//HookEngineF(8028480,6,Hook_View_7);
	//HookEngineF(8029264,6,Hook_View_8);
	
	//HookEngineF(8031152,6,Hook_View_10);
	HookEngine(8027424,5,"Hook_View_11");
	HookEngine(8027568,6,"Hook_View_12");
	//HookEngineF(8028096,6,Hook_View_13);
	//HookEngineF(8027904,6,Hook_View_14);
	//HookEngineF(8038608,6,Hook_View_15);
	HookEngineF(8020096,6,Hook_View_Text1);
	//HookEngineF(8034576,6,Hook_View_Text2);
};
//
/*
void __thiscall zCView::Print(int int zSTRING const &)     	0x007A9A40 = 8034880
void __thiscall zCView::PrintChars(int int zSTRING const &)     	0x007A9B10 = 8035088
void __thiscall zCView::PrintCX(int zSTRING const &)      	0x007A9E50 = 8035920
void __thiscall zCView::PrintCXY(class zSTRING const &)      	0x007AA030 = 8036400
void __thiscall zCView::PrintCY(int zSTRING const &)      	0x007A9F40 = 8036160
static void __cdecl zCView::PrintDebug(zSTRING const &)       	0x007ABA90 = 8043152
void __thiscall zCView::PrintMessage(zSTRING const & zSTRING const & float zCOLOR &) 	0x007A8140 = 8028480
void __thiscall zCView::PrintMessageCXY(zSTRING const & zSTRING const & float zCOLOR &) 	0x007A8450 = 8029264

10)void __thiscall zCView::PrintSelection(zSTRING const & zSTRING const & zCOLOR & zCOLOR &)	0x007A8BB0 = 8031152
11)void __thiscall zCView::PrintTimed(int int zSTRING const & float zCOLOR *)  	0x007A7D20 = 8027424
12)void __thiscall zCView::PrintTimedCX(int zSTRING const & float struct zCOLOR *)  	0x007A7DB0 = 8027568
13)void __thiscall zCView::PrintTimedCXY(zSTRING const & float zCOLOR *)    	0x007A7FC0 = 8028096
14)void __thiscall zCView::PrintTimedCY(int zSTRING const & float struct zCOLOR *)  	0x007A7F00 = 8027904
15)void __thiscall zCView::Printwin(class zSTRING const &)      	0x007AA8D0 = 8038608
*/
/*
void __thiscall zCView::SetColor(zCOLOR const &)   	0x007A6080 = 8020096
void __thiscall zCView::SetFontColor(zCOLOR const &)   	0x007A9910 = 8034576
*/

