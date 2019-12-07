//If I use a prefix "_" I am not assured that the field has correctly a logical name.
class zCViewDialogChoice
{
/*0*/	var int x1;	//*
/*4*/	var int x2;
/*8*/	var int x3;
/*12*/	var int x4;
/*16*/	var int x5;	//_vtbl
/*20*/	var int x6;
/*24*/	var int x7;
/*28*/	var int x8;
/*32*/	var int x9;
/*36*/	var int _backTex;	//*
	
/*40*/	var int vposx;
/*44*/	var int vposy;
/*48*/	var int vsizex;
/*52*/	var int vsizey;
	
/*56*/	var int pposx;	//положение в пикселях левой границы окна
/*60*/  var int pposy;	//положение в пикселях верхней границы окна
/*64*/  var int psizex;	//размер по высоте окна
/*68*/  var int psizey;	//размер по высоте окна
	
/*72*/	var int x11;
/*76*/	var int x12;	//*
/*80*/	var int x13;	//& ?
	
/*84*/	var int x14;
/*88*/	var int x15;
/*92*/	var int x16;
	
/*96*/	var int _font;	//*
/*100*/  var int _fontColor;//zColor
	
/*104*/	var int x19;
	
/*108*/	var int px1;	//координата
/*112*/	var int py1;	//координата
/*116*/	var int px2;	//координата
/*120*/	var int py2;	//координата
	
/*124*/	var int IsShowChoices;	//В режиме разговора 0 (топики-1)
/*128*/	var int IsShowedDialog;	//В режиме разговора 1 (топики-0) при 1 - выбор действует, но окно с разговором не открывается.
	
/*132*/	var int continueOpen ;    //zBOOL                 
/*136*/   var int continueClose;    //zBOOL
	//Время появления и скрытия окна диалога (с учетом времени на эффект)
	//Если нет эффекта - будет просто задержка.
/*140*/	var int timeOpen;   
/*144*/   var int timeClose;
	//2 параметра - определяют будет ли эффект открытия/закрытия окна с изменением размера
/*148*/	var int resizeOnOpen;
/*152*/	var int resizeOnClose;
	
	//4 параметра типа float (размеры и(или) координаты)
	//(меняются во время открытия/закрытия окна диалога)
/*156*/	var int x32;//float
/*160*/	var int x33;//float
/*164*/	var int x34;//float
/*168*/	var int x35;//float
	
	//zCArray<zSTRING> m_listLines;
/*172*/	var int m_listLines_array;     //zSTRING*
/*176*/	var int m_listLines_numAlloc;  //int //кол-во зарезервированных строк выбора    
/*180*/	var int m_listLines_numInArray;//int	//кол-во видимых строк выбора
	
/*184*/	var int x39;
	
/*188*/	var int x40;	//*
/*192*/	var int x41;	//COLOR ?
	
/*196*/	var int x42;
/*200*/	var int x43;
	//габариты, отступы окна диалога, текстов
/*204*/	var int x44;	//габариты
/*208*/	var int x45;	//габариты
/*212*/	var int x46;	//posX текста
/*216*/	var int x47;	//posY текста
/*220*/	var int x48;	//левый отступ
/*224*/	var int x49;	//верхний отступ
/*228*/	var int x50;
/*232*/	var int x51;	//высота для активной ячейки, дальше начинается скроллинг
	
/*236*/	var int x52;	//*

/*240*/	var int isOpened;	//Диалог(разговор) идёт
/*244*/	var int isClosed;	//Диалог(разговор) не идёт (выбор топиков)
	
/*248*/	var int activeTextColor;		//COLOR	- цвет текста активной строки
/*252*/	var int NoActiveTextColor;//COLOR - цвет текста НЕактивной строки
	
/*256*/	var int nrInfoInSpisok;		//номер активной строки
/*260*/	var int maxInfosInSpisok;	//максимум строк диалога
	//[...]
};
