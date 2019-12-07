
func void Use_Bookstand_Rune_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"�������� 1");
		Doc_PrintLine(nDocID,0,"������ �����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"�������� 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Rune_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"�������� 1");
		Doc_PrintLine(nDocID,0,"���� � �����������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"�������� 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"�������� 1");
		Doc_PrintLine(nDocID,0,"������ ������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"�������� 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Innos_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"�������� 1");
		Doc_PrintLine(nDocID,0,"�������� ������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"�������� 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

var int Bookstand_Kreise_01_RedOnce;

func void Use_Bookstand_Kreise_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"������ ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� 1-�� ����� � �����������, ����������� ��� �� ��������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����");
		Doc_PrintLine(nDocID,0,"������� ������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"�������� ������");
		Doc_PrintLine(nDocID,0,"����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����� ������");
		Doc_PrintLine(nDocID,0,"������ ��������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"������ �������");
		Doc_PrintLine(nDocID,0,"����� �������");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"������� ������ �������");
//		Doc_PrintLine(nDocID,0,"�������� �����");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����� ������� ����, ������ ��������� ���� �� ����������������� ������������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.");
		Doc_Show(nDocID);
		/*Redleha: ��������� �������� �� ����
		if(Bookstand_Kreise_01_RedOnce == false)
		{
			B_TeachPlayerTalentRunesBook(hero,SPL_LIGHT);
			B_TeachPlayerTalentRunesBook(hero,SPL_Firebolt);
			B_TeachPlayerTalentRunesBook(hero,SPL_Zap);
			//B_TeachPlayerTalentRunesBook(hero,SPL_LightHeal);
			B_TeachPlayerTalentRunesBook(hero,SPL_SummonGoblinSkeleton);
			Bookstand_Kreise_01_RedOnce = true;
		};
		*/
	};
};

var int Bookstand_Kreise_02_RedOnce;
func void Use_Bookstand_Kreise_02_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"������ ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� 2-�� ����� � �����������, ����������� ��� �� ��������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"�������� ���");
		Doc_PrintLine(nDocID,0,"�����");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"������� ������");
//		Doc_PrintLine(nDocID,0,"������� �����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����� �����");
		Doc_PrintLine(nDocID,0,"����� �����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����� �����");
		Doc_PrintLine(nDocID,0,"�����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"���");
		Doc_PrintLine(nDocID,0,"�������� �����");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����� ������� ����, ������ ��������� ���� �� ����������������� ������������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.");
		Doc_Show(nDocID);
		/*Redleha: ��������� �������� �� ����
		if(Bookstand_Kreise_02_RedOnce == false)
		{
			B_TeachPlayerTalentRunesBook(hero,SPL_InstantFireball);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Icebolt);
			B_TeachPlayerTalentRunesBook(hero,SPL_SummonWolf);
			B_TeachPlayerTalentRunesBook(hero,SPL_WINDFIST);
			B_TeachPlayerTalentRunesBook(hero,SPL_Sleep);
			B_TeachPlayerTalentRunesBook(hero,SPL_SummonGoblinSkeleton);
			Bookstand_Kreise_02_RedOnce = true;
		};
		*/
	};
};

var int Bookstand_Kreise_03_RedOnce;
func void Use_Bookstand_Kreise_03_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"������ ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� 3-�� ����� � �����������, ����������� ��� �� ��������.");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"������� ������� �������");
//		Doc_PrintLine(nDocID,0,"�������� ��������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����� �������� ����");
		Doc_PrintLine(nDocID,0,"�����");
		Doc_PrintLine(nDocID,0,"����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"�������� �������");
		Doc_PrintLine(nDocID,0,"����� �������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"�����");
		Doc_PrintLine(nDocID,0,"������ ������");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"������� ����");
//		Doc_PrintLine(nDocID,0,"������� �����");
//		Doc_PrintLine(nDocID,0,"���������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"������� ������");
		Doc_PrintLine(nDocID,0,"������ ��������");
		Doc_PrintLine(nDocID,0,"����");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,0,"�������� ���");
		Doc_PrintLine(nDocID,0,"�����");
		Doc_PrintLine(nDocID,0,"����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,1,"����� ������� ����, ������ ��������� ���� �� ����������������� ������������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.");
		Doc_Show(nDocID);
		/*Redleha: ��������� �������� �� ����
		if(Bookstand_Kreise_03_RedOnce == false)
		{
			//B_TeachPlayerTalentRunesBook(hero,SPL_MediumHeal);
			B_TeachPlayerTalentRunesBook(hero,SPL_SummonSkeleton);
			B_TeachPlayerTalentRunesBook(hero,SPL_Fear);
			//B_TeachPlayerTalentRunesBook(hero,SPL_IceCube);
			B_TeachPlayerTalentRunesBook(hero,SPL_ChargeZap);
			B_TeachPlayerTalentRunesBook(hero,SPL_Firestorm);
			Bookstand_Kreise_03_RedOnce = true;
		};
		*/
	};
};


var int Bookstand_Kreise_04_RedOnce;

func void Use_Bookstand_Kreise_04_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"��������� ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� 4-�� ����� � �����������, ����������� ��� �� ��������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"������� �������� ���");
		Doc_PrintLine(nDocID,0,"����");
		Doc_PrintLine(nDocID,0,"�����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"������");
		Doc_PrintLine(nDocID,0,"������ ��������");
		Doc_PrintLine(nDocID,0,"������� �����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����������� ������");
		Doc_PrintLine(nDocID,0,"������ ��������� ������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����������� ������");
		Doc_PrintLine(nDocID,0,"������ ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����� ������� ����, ������ ��������� ���� �� ����������������� ������������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.");
		Doc_Show(nDocID);
		/*Redleha: ��������� �������� �� ����
		if(Bookstand_Kreise_04_RedOnce == false)
		{
			B_TeachPlayerTalentRunesBook(hero,SPL_SummonGolem);
			B_TeachPlayerTalentRunesBook(hero,SPL_DestroyUndead);
			B_TeachPlayerTalentRunesBook(hero,SPL_ChargeFireball);
			B_TeachPlayerTalentRunesBook(hero,SPL_LightningFlash);
			Bookstand_Kreise_04_RedOnce = true;
		};
		*/
	};
};

var int Bookstand_Kreise_05_RedOnce;

func void Use_Bookstand_Kreise_05_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"����� ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� 5-�� ����� � �����������, ����������� ��� �� ��������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		//Doc_PrintLine(nDocID,0,"������� �����");
		//Doc_PrintLine(nDocID,0,"������� �����");
		//Doc_PrintLine(nDocID,0,"���������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"������� �������� ����");
		Doc_PrintLine(nDocID,0,"����");
		Doc_PrintLine(nDocID,0,"�������� ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����� ������");
		Doc_PrintLine(nDocID,0,"������ ������");
		Doc_PrintLine(nDocID,0,"");
		//Doc_PrintLine(nDocID,0,"������� ������� �������");
		//Doc_PrintLine(nDocID,0,"�������� ������");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����� ������� ����, ������ ��������� ���� �� ����������������� ������������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.");
		Doc_Show(nDocID);
		/*Redleha: ��������� �������� �� ����
		if(Bookstand_Kreise_05_RedOnce == false)
		{
			//B_TeachPlayerTalentRunesBook(hero,SPL_IceWave);
			B_TeachPlayerTalentRunesBook(hero,SPL_SummonDemon);
			//B_TeachPlayerTalentRunesBook(hero,SPL_FullHeal);
			B_TeachPlayerTalentRunesBook(hero,SPL_Pyrokinesis);
			Bookstand_Kreise_05_RedOnce = true;
		};
		*/
		
	};
};

var int Bookstand_Kreise_06_RedOnce;

func void Use_Bookstand_Kreise_06_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"������ ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"���� 6-�� ����� � �����������, ����������� ��� �� ��������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"�������� �����");
		Doc_PrintLine(nDocID,0,"�����");
		Doc_PrintLine(nDocID,0,"����");
		Doc_PrintLine(nDocID,0,"�������� ����");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"������� ������");
		Doc_PrintLine(nDocID,0,"�����");
		Doc_PrintLine(nDocID,0,"������ ������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����� ������");
		Doc_PrintLine(nDocID,0,"����� �������");
		Doc_PrintLine(nDocID,0,"������ ������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"����� ����");
		Doc_PrintLine(nDocID,0,"����� �������");
		Doc_PrintLine(nDocID,0,"������ ������");
		Doc_PrintLine(nDocID,0,"������ ��������� ������");
		Doc_PrintLine(nDocID,0,"������ ������");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"����������� �������");
		Doc_PrintLine(nDocID,1,"����� �������");
		Doc_PrintLine(nDocID,1,"���� ������");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"����� ������� ����, ������ ��������� ���� �� ����������������� ������������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ������ ����� ������� ���������� � ������ ����� ������ ������ ������ � ������ ��������� ����������.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"������ ��� ���������� ���� ������� �� ����� ���������� � ������ �� ������ ������.");
		Doc_Show(nDocID);
		/*Redleha: ��������� �������� �� ����
		if(Bookstand_Kreise_06_RedOnce == false)
		{
			B_TeachPlayerTalentRunesBook(hero,SPL_Firerain);
			B_TeachPlayerTalentRunesBook(hero,SPL_BreathOfDeath);
			B_TeachPlayerTalentRunesBook(hero,SPL_MassDeath);
			B_TeachPlayerTalentRunesBook(hero,SPL_ArmyOfDarkness);
			B_TeachPlayerTalentRunesBook(hero,SPL_Shrink);
			Bookstand_Kreise_06_RedOnce = true;
		};
		*/
	};
};

func void Use_Bookstand_Rules_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,FONT_Book);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"�������� 1");
		Doc_PrintLine(nDocID,0,"�������");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"�������� 2");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1," ");
		Doc_Show(nDocID);
	};
};

// DS *********************

func void Use_Bookstand_Cave_Sekret_01_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	var int nDocID;
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[ORC_LANGUAGE_1] == false)
		{
			nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,FONT_Book);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_Show(StPl_nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else if(PLAYER_TALENT_FOREIGNLANGUAGE[ORC_LANGUAGE_1] == true)
		{
			//SEKRETCAVESWORD1book = true;
			nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,FONT_Book);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"����� ��������� �������, ������� ������� ����� �������.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_Show(StPl_nDocID);
		};
	};
};

func void Use_Bookstand_Cave_Sekret_02_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	var int nDocID;
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (self.id == 0) || Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_FOREIGNLANGUAGE[ORC_LANGUAGE_1] == false)
		{			
			nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,FONT_Book);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_Show(StPl_nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else if(PLAYER_TALENT_FOREIGNLANGUAGE[ORC_LANGUAGE_1] == true)
		{
			//SEKRETCAVESWORD2book = true;
			nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,FONT_Book);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"����� ����� �������, ������ ���-�� ���������, �� ��������� ������� ����� ����� �����: ���� ����� ������. ��� ��� ����� �������?");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_Show(nDocID);
		};
	};
};






