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
	
/*56*/	var int pposx;	//��������� � �������� ����� ������� ����
/*60*/  var int pposy;	//��������� � �������� ������� ������� ����
/*64*/  var int psizex;	//������ �� ������ ����
/*68*/  var int psizey;	//������ �� ������ ����
	
/*72*/	var int x11;
/*76*/	var int x12;	//*
/*80*/	var int x13;	//& ?
	
/*84*/	var int x14;
/*88*/	var int x15;
/*92*/	var int x16;
	
/*96*/	var int _font;	//*
/*100*/  var int _fontColor;//zColor
	
/*104*/	var int x19;
	
/*108*/	var int px1;	//����������
/*112*/	var int py1;	//����������
/*116*/	var int px2;	//����������
/*120*/	var int py2;	//����������
	
/*124*/	var int IsShowChoices;	//� ������ ��������� 0 (������-1)
/*128*/	var int IsShowedDialog;	//� ������ ��������� 1 (������-0) ��� 1 - ����� ���������, �� ���� � ���������� �� �����������.
	
/*132*/	var int continueOpen ;    //zBOOL                 
/*136*/   var int continueClose;    //zBOOL
	//����� ��������� � ������� ���� ������� (� ������ ������� �� ������)
	//���� ��� ������� - ����� ������ ��������.
/*140*/	var int timeOpen;   
/*144*/   var int timeClose;
	//2 ��������� - ���������� ����� �� ������ ��������/�������� ���� � ���������� �������
/*148*/	var int resizeOnOpen;
/*152*/	var int resizeOnClose;
	
	//4 ��������� ���� float (������� �(���) ����������)
	//(�������� �� ����� ��������/�������� ���� �������)
/*156*/	var int x32;//float
/*160*/	var int x33;//float
/*164*/	var int x34;//float
/*168*/	var int x35;//float
	
	//zCArray<zSTRING> m_listLines;
/*172*/	var int m_listLines_array;     //zSTRING*
/*176*/	var int m_listLines_numAlloc;  //int //���-�� ����������������� ����� ������    
/*180*/	var int m_listLines_numInArray;//int	//���-�� ������� ����� ������
	
/*184*/	var int x39;
	
/*188*/	var int x40;	//*
/*192*/	var int x41;	//COLOR ?
	
/*196*/	var int x42;
/*200*/	var int x43;
	//��������, ������� ���� �������, �������
/*204*/	var int x44;	//��������
/*208*/	var int x45;	//��������
/*212*/	var int x46;	//posX ������
/*216*/	var int x47;	//posY ������
/*220*/	var int x48;	//����� ������
/*224*/	var int x49;	//������� ������
/*228*/	var int x50;
/*232*/	var int x51;	//������ ��� �������� ������, ������ ���������� ���������
	
/*236*/	var int x52;	//*

/*240*/	var int isOpened;	//������(��������) ���
/*244*/	var int isClosed;	//������(��������) �� ��� (����� �������)
	
/*248*/	var int activeTextColor;		//COLOR	- ���� ������ �������� ������
/*252*/	var int NoActiveTextColor;//COLOR - ���� ������ ���������� ������
	
/*256*/	var int nrInfoInSpisok;		//����� �������� ������
/*260*/	var int maxInfosInSpisok;	//�������� ����� �������
	//[...]
};
