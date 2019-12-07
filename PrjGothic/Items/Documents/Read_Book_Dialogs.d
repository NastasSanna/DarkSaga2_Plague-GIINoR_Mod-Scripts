/**************************************************************************

						������ ��������������� ����
   
  ������� ��� ��������������� ������� � ������� ����������� ����.
  ���������� - ���������� ���� �� ����� ����������� ������ (����� � ����)
� ������������� ����� (������ �������).
  
  ������� ������ �������:
  
	Read_Book = Read_Book_...;
	Read_Book_Page = 0;
	Read_Book_nDocID = Doc_Create();
	Doc_Show(Read_Book_nDocID);
	AI_ProcessInfos(self);
  
 //* NS - 05/02/2013
  
***************************************************************************/

var int Read_Book_nDocID;	//��� ��������, ��������� � ���������� �� ������ �������!
var int Read_Book;		// ����� ������ ������
	const int Read_Book_None 				= 0;
	const int Read_Book_TinkturStr_wenig	= 1;
	const int Read_Book_Botje_01 			= 2;
	const int Read_Book_Botje_02 			= 3;
var int Read_Book_Page;	// �� ����� ��������

// ����� =======================================================

func void PC_Read_Book_Exit()
{
	Read_Book = Read_Book_None;
	AI_StopProcessInfos(self);
};

// "������� ��������" ------------------------------------------

instance PC_Read_Book_TinkturStr_wenig(C_INFO)
{
	npc = PC_Hero;
	condition = PC_Read_Book_TinkturStr_wenig_Condition;
	information = PC_Read_Book_TinkturStr_wenig_Info;
	permanent = TRUE;
	important = TRUE;
};

func int PC_Read_Book_TinkturStr_wenig_Condition()
{
	if (Read_Book == Read_Book_TinkturStr_wenig)
	{
		return TRUE;
	};
};

// ����� ������
func void PC_Read_Book_TinkturStr_wenig_Show()
{
	Doc_SetPages(Read_Book_nDocID,2);
	Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_01_L.TGA",0);
	Doc_SetPage(Read_Book_nDocID,1,"TextBook_Blank_01_R.TGA",0);
	Doc_SetMargins(Read_Book_nDocID,0,230,50,40,50,1);
	Doc_SetMargins(Read_Book_nDocID,1,40,50,230,50,1);
	if (Read_Book_Page == 0)
	{
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_BookHeadline);
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1," ������� ��������");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"       # # #");
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLine(Read_Book_nDocID,1,"          �������");
		Doc_PrintLine(Read_Book_nDocID,1,"    ������������ �����");
	};
	if (Read_Book_Page == 1)
	{
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"�������� ������������ ��� ������� � ������������� ������� ���������� ����������� �������.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"�� ����������� ��������� �������� ����� �������� �������������� �������. �� ������ ��� ��������� ���������� ������ ����������� ����� �����. �� ����� ��� 70 �������� ����� �������� ��������� ���� ���.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"������ ������� ��� ���� ���� �� ����������� ������, �� ������� ���������� � �� ������ ������, �... �������. ");
		Doc_PrintLines(Read_Book_nDocID,1,"����� ������ ������ ����� ��������� ������ ��������, �� ��������� ����� ���������� �� ����. � ��� ��� ������ ������� ������, �������� ���� ������� � ������������� ����� �������. ������ ������ ��������� ��� ���. ");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"��������, ���� �� ����������� �������� �������� ����������� ����������, ��� ���������� ���� �� �����������. �� ���������� ������ �������� ���� ������.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"������� ���� ��������, �������, ����� ������ ������ ����.");
	};
	if (Read_Book_Page == 2)
	{
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"�� ����� ���������� �������� � ���������, ����� �������� ���������� ������������ � �������, ������� �������� �� ������ � ������� ������ ��� ����� � ���� �����. ������ ����������� � ���, ��� ��� ����������� ���������� ������� � ��� ���������� ������� �� �� ��������� ������, � ������ ������ ������� ����� �� ������.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"�������� ��������� ������ �����, ������� ����� ��������� �������� ������������ ��������� ������.");
		Doc_PrintLines(Read_Book_nDocID,1,"������ ���� ������ ��� �� ���� �������� � � ���� ������� ��������� ���, �������� ���������� ��������, ��� ����������� ��������� ��������. ��� ����� ��� ��������� ����, � ������ ��������� �������������.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"����� ���� ���������, � ������� ����� ������ �������� ��� ����������� �����. � ��� ����� ��� ���� ����� ���������� ���� �������. ������� ����� � ��������� ��������, � ������� ��������� ������������ ��� �����������.");
	};
};

func void PC_Read_Book_TinkturStr_wenig_Info()
{
	PC_Read_Book_TinkturStr_wenig_Show();
	Info_ClearChoices(PC_Read_Book_TinkturStr_wenig);
	Info_AddChoice(PC_Read_Book_TinkturStr_wenig,Dialog_Ende,PC_Read_Book_Exit);
	if (Read_Book_Page > 0)
	{
		Info_AddChoice(PC_Read_Book_TinkturStr_wenig, "<- �����",PC_Read_Book_TinkturStr_wenig_Prev);
	};
	if (Read_Book_Page < 2)
	{
		Info_AddChoice(PC_Read_Book_TinkturStr_wenig, "������ ->",PC_Read_Book_TinkturStr_wenig_Next);
	};
};

func void PC_Read_Book_TinkturStr_wenig_Prev()
{
	Read_Book_Page -= 1;
	PC_Read_Book_TinkturStr_wenig_Info();
};
func void PC_Read_Book_TinkturStr_wenig_Next()
{
	Read_Book_Page += 1;
	PC_Read_Book_TinkturStr_wenig_Info();
};

// "�������� �������� ����� (������)" --------------------------------

instance PC_Read_Book_Botje_01(C_INFO)
{
	npc = PC_Hero;
	condition = PC_Read_Book_Botje_01_Condition;
	information = PC_Read_Book_Botje_01_Info;
	permanent = TRUE;
	important = TRUE;
};

func int PC_Read_Book_Botje_01_Condition()
{
	if (Read_Book == Read_Book_Botje_01)
	{
		return TRUE;
	};
};

// ����� ������
func void PC_Read_Book_Botje_01_Show()
{
	if (Read_Book_Page == 0)
	{
		Doc_SetPages(Read_Book_nDocID,2);
		Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_02_part1_L.TGA",0);
		Doc_SetPage(Read_Book_nDocID,1,"TextBook_Blank_02_part1_R.TGA",0);
		Doc_SetMargins(Read_Book_nDocID,0,220,50,40,50,1);
		Doc_SetMargins(Read_Book_nDocID,1,40,50,220,50,1);
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_BookHeadline);
		Doc_PrintLines(Read_Book_nDocID,0,"�������� �������� �����");
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"����������� ��������� ������������ ����� ��������������� �� ��������� ��������, ����� ��� ������� �����, �������� ������, �������� �������. ��� ���� ����� ���� �������� � ��������� ������, ������� ��������� ���� ��������.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"������ ������� �������� ���������� ��������� ������ ������������. � ����� ����� ����������� ��������, �������� ����������, ����������� ���� �� ����, �� ��������� ");
		Doc_PrintLines(Read_Book_nDocID,1,"��������� �������� �������� �����.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"������� �����, ������ ��������� ����� �����, ����������� � ������ ������� ��������� ����� ������ � ������. �� ������ �� ������� �� ������ ���������� �������� �����.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"�� ������ ������� ��������� ������ ��������. ����������� ����� � ���� ������� ��, �������������� �� ����, ������������ � ������ �����, ������ ����������� �� ����� ������������� ���������.");
	};
	if (Read_Book_Page == 1)
	{
		Doc_SetPages(Read_Book_nDocID,1);
		Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_02_part1_Rip.TGA",0);
		Doc_SetMargins(Read_Book_nDocID,0,60,50,210,50,1);
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"�������� �������� ��������� �����, ��������� � ����� ������ ��������. ��������� ���, ������ ���� � ��������� ����������� � ������ �����, ����� ����� ��������� ����������. ��������� ����� �������� ����������� �������� ���� � �������� ���������� ��, �� ���� �� ��������� �����.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"� ����� ����� �������� ����. �� ������� � ������� ����� � � ������ ��������� ��������. ��� � 20 ����� ����� ����� ���������� �������� ����������. ����� �� �� ����� ��������� ");
		if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_wenig] == FALSE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_wenig] = TRUE;
			Snd_Play("LevelUP");
			B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"�������� ����� �������� �������� ���� � ��������. �����������: 1 ����� ����� �����, 1 ��������� ���, 1 ������ ���� � 1 ���������. ��������� ����� �������..");
		};
	};
};

func void PC_Read_Book_Botje_01_Info()
{
	PC_Read_Book_Botje_01_Show();
	Info_ClearChoices(PC_Read_Book_Botje_01);
	Info_AddChoice(PC_Read_Book_Botje_01,Dialog_Ende,PC_Read_Book_Exit);
	if (Read_Book_Page > 0)
	{
		Info_AddChoice(PC_Read_Book_Botje_01, "<- �����",PC_Read_Book_Botje_01_Prev);
	};
	if (Read_Book_Page < 1)
	{
		Info_AddChoice(PC_Read_Book_Botje_01, "������ ->",PC_Read_Book_Botje_01_Next);
	};
};

func void PC_Read_Book_Botje_01_Prev()
{
	Read_Book_Page -= 1;
	PC_Read_Book_Botje_01_Info();
};
func void PC_Read_Book_Botje_01_Next()
{
	Read_Book_Page += 1;
	PC_Read_Book_Botje_01_Info();
};

// "�������� �������� ����� (�����)" ---------------------------------

instance PC_Read_Book_Botje_02(C_INFO)
{
	npc = PC_Hero;
	condition = PC_Read_Book_Botje_02_Condition;
	information = PC_Read_Book_Botje_02_Info;
	permanent = TRUE;
	important = TRUE;
};

func int PC_Read_Book_Botje_02_Condition()
{
	if (Read_Book == Read_Book_Botje_02)
	{
		return TRUE;
	};
};

// ����� ������
func void PC_Read_Book_Botje_02_Show()
{
	if (Read_Book_Page == 0)
	{
		Doc_SetPages(Read_Book_nDocID,1);
		Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_02_part2_Rip.TGA",0);
		Doc_SetMargins(Read_Book_nDocID,0,220,50,55,50,1);
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"������ ����� � ������. ������ �� ������ �������� ����� � ���, ��� ������� ������� ����� ���������� ������������ ����� � ����� �������������. �� ��������� ������������ ��������� � �����������, ��� � �� ������� ���� ����������� �������� �����, ����� ����� ������� ����� � ��������� � ������ � �����.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"��� �� ��������� � ����������� � ������������ ��� ���������� �����, �� ��������� ���� �����, ���������� ������� ��������� ��������������.");
	};
	if (Read_Book_Page == 1)
	{
		Doc_SetPages(Read_Book_nDocID,2);
		Doc_SetPage(Read_Book_nDocID,0,"TextBook_Blank_02_part2_L.TGA",0);
		Doc_SetPage(Read_Book_nDocID,1,"TextBook_Blank_02_part2_R.TGA",0);
		Doc_SetMargins(Read_Book_nDocID,0,220,50,45,50,1);
		Doc_SetMargins(Read_Book_nDocID,1,40,50,220,50,1);
		Doc_SetFont(Read_Book_nDocID,-1,FONT_DSG_Book);
		Doc_PrintLines(Read_Book_nDocID,0,"���� ������ ������ ���� ����� ������ �����, ��� ������ ��������� �������� ��������������. � ���� ������� ������ ������ ���� ���������� ���������, �� ������������� ��������� ���������. � ����� ��������� ��������� �������� � ��������������. ����� ��������� �������� ������� ������������, ������ ���� ������� ������.");
		Doc_PrintLine(Read_Book_nDocID,0,"");
		Doc_PrintLines(Read_Book_nDocID,0,"���, ����� ��������� ��������� �������, ���� �������� ��������� �����������, ���������� � ����� �� ��������� �����.");
		Doc_PrintLines(Read_Book_nDocID,1,"��� � � ����������� ����� �� �����, �� ����������� ��������, �� � ������� ����� ������� ��� ����������� �������� ����, �������� � ��������. ��������� ����������� ����������� �� ����� ��������� �� ����� �������, ��������� ����� � ����������.");
		Doc_PrintLine(Read_Book_nDocID,1,"");
		Doc_PrintLines(Read_Book_nDocID,1,"��������� ��������� ����� ��������� �������� �������� ��������, �� ������� ��� �������� �� �������� �������� ���������������, ��������� ��� ������� ������� ����� �� ����� �������� �����.");
		if(PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_besondere] == FALSE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_DSG_TinkturBotje_besondere] = TRUE;
			Snd_Play("LevelUP");
			B_DSG_Log_OpenClose(TOPIC_TalentAlchemy,LOG_NOTE,-1,"�������� ���������� �������� �������� ����, �������� � ��������. �����������: 1 ����� ����� ���������, 1 ������, 1 �������� ������ � 1 ���������. ��������� ����� �������..");
		};
	};
};

func void PC_Read_Book_Botje_02_Info()
{
	PC_Read_Book_Botje_02_Show();
	Info_ClearChoices(PC_Read_Book_Botje_02);
	Info_AddChoice(PC_Read_Book_Botje_02,Dialog_Ende,PC_Read_Book_Exit);
	if (Read_Book_Page > 0)
	{
		Info_AddChoice(PC_Read_Book_Botje_02, "<- �����",PC_Read_Book_Botje_02_Prev);
	};
	if (Read_Book_Page < 1)
	{
		Info_AddChoice(PC_Read_Book_Botje_02, "������ ->",PC_Read_Book_Botje_02_Next);
	};
};

func void PC_Read_Book_Botje_02_Prev()
{
	Read_Book_Page -= 1;
	PC_Read_Book_Botje_02_Info();
};
func void PC_Read_Book_Botje_02_Next()
{
	Read_Book_Page += 1;
	PC_Read_Book_Botje_02_Info();
};




