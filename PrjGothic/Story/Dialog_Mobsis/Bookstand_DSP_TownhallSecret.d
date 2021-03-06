//***************************************************
//*                   ������� �����                 *
//***************************************************

const int WeaverBook_Page = 0;
const int WeaverBook_MaxPage = 5;


func void Show_WeaverBook(var int docID, var int page) 
{
	Doc_SetPages(docID,2);
	Doc_SetPage(docID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(docID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(docID,-1,FONT_DSG_Book);
	Doc_SetMargins(docID,0,275,50,30,30,1);
	Doc_SetMargins(docID,1,30,50,275,30,1);
	
	if (page == 0) 
	{
		Doc_SetFont(docID,0,FONT_DSG_BookHeadline);
		Doc_PrintLine(docID,0,"������� �����");
		Doc_SetFont(docID,-1,FONT_DSG_Book);
		Doc_PrintLine(docID,0,"");
		Doc_PrintLines(docID,0,"��� � ������ ���� �������� ������������ �������� � ���������� �����, ��������� � ������� �� ���������� ���� � ������. ��� ��� ���� ��������, ��� ��� ����� ��� ������ ������. ��� ����� ������ ���������� �������� �����, � ��� ������� ���� �������� ������ ������. ");
	
		Doc_PrintLines(docID,1,"����� ������������ ���� ������ ��� ���������� ������� �����, ��� ������ ������� ������ �������, ����� ��� �� ������� �� ���� ������. ���� ������ ����� �������, �� �������� ��� ������� � �������� ���������� � ��������� � �����.");
	}
	else if (page == 1)
	{
		Doc_PrintLines(docID,0,"��� ����� ���������� �� ����� ������, ����� ������ �� ������ ������� � ��������������� ���������� ��������. �� � ��� ���� ������ ����� ����� ��� ����������� �������. ��� ���, ����� ���� �������� ����� ����� ��� ����������, �� ������ ������� ����. ���� �� ����������-���������� ����� ������ ����������� ����.");
	
		Doc_PrintLines(docID,1,"� �������� ����� ������� ������ ����������, � �������� � ��� � ����� �� ������� ������. ������ �����, ��� ������ ����, � ������ �� ������ ���� �����. � ��������� ������, ���� ������, ��� �� ������ ��� ��������� ��� ����� ����. ���� ������� ��� ������ � ����� �� ����� ��������. ����� �� ���� ������ � ��� �������, ���� ��-�� ������� ��� ���������, ����� �� �� ��������� ��� ������ ����.");
	}
	else if (page == 2)
	{
		Doc_PrintLines(docID,0,"� ������� ������� �����, �� �������� ���� ������ �������� ������, � ����� �������� ��� � ���, ����� �� ����������. ��� �������� ���� ���� � ����� ������ ������ �������� �����, ��� �������� ������� � ������. ���������� ����� � ��� ���� ���� ������� �����.");
	
		Doc_PrintLines(docID,1,"� ���� ������� �������� � ������ � ��� �� ������. � ����� ���� ���� �� �����. ����� � ������ ������������ ������, �� ����� ����� � ��� � ���������� �������� ���. ��� � ���� ����� �������� ����� �� �����, ��� ������� ������. �� ���� ������ � �������, ����� �� ������. ������� ������ �� ����� ������ �������� �� ���� ����� � ������, � ������ ��� ������� ���� �����������.");
	}
	else if (page == 3)
	{
		Doc_PrintLines(docID,0,"����� ������� ������ ���� ���� ����� � ������ ��� ������� ������. � ��� �� �������� ��� � ������ � �������� ������������ �����. �� ���� ���� ���� ��������, ����������, �����. ������ ���� ������ ���� �����, ��� ����������� � ���������� � ������� ������ ����� � ���������.");
	
		Doc_PrintLines(docID,1,"���� � ������ ��� �� ���� ����� ��������� �� ������, � ����� �������� �����������, ������� ������������ ��� � ���������� ��������. ������� �� �� ����������� ������ �������� � ����� ���� ������� � ������ ������. ��������� ����� ��������� � ������ �������� ��� ����� � ��������� ������, � � ����� ������ ������ ������� ������ ���� � ������������ ������� � ������.");
	}
	else if (page == 4)
	{
		Doc_PrintLines(docID,0,"��� ���� �� ��������� ������ ���� ������������� ������ � ���������� �������� ������. ��� ��� ���������� ������� ���� �� ������ ��������, � ����, ������������� �� ����� � ������, ��������� � ������ ����. ����� �� �������� ��� � ��� ��� �������� ������.");
	
		Doc_PrintLines(docID,1,"��� �� ��������, �������� �� � ���� �� ����� �����, �� �� ���� ����� �� ��������� �� �������.");
		Doc_PrintLine(docID,1,"");
		Doc_PrintLine(docID,1,"o o o");
		Doc_PrintLine(docID,1,"o o o");
		Doc_PrintLine(docID,1,"o o o");
		Doc_PrintLine(docID,1,"o o O");
		Doc_PrintLine(docID,1,"o O");
		Doc_PrintLine(docID,1,"O");
	};
	
	Doc_Show(docID);
	WeaverBook_Page = page;
};

// ==============================================================================

func void Use_Bookstand_DSP_TownhallSecret_S1()
{
	if(Npc_IsPlayer(self))
	{
		MultiBook_Start(WeaverBook_Page, WeaverBook_MaxPage, Show_WeaverBook);
	};
};
