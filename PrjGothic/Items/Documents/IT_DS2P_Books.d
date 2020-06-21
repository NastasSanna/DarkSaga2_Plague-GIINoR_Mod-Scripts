
instance ItWr_DS2P_ZeddDiary(C_Item)
{
	name = "Учетная книга";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Учетная книга";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_DS2P_ZeddDiary;
};
func void Use_DS2P_ZeddDiary()
{
	// TO DO
	/*if (Hero_IsReadZeddDiary == FALSE)
	{
		B_DSG_Log_OpenClose(TOPIC_DS2P_CompromiseZedd,LOG_MISSION,LOG_Running,TOPIC_DS2P_CompromiseZedd_Diary);
		Hero_IsReadZeddDiary = TRUE;
	};*/
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Бриг «Роза ветров»");
	Doc_PrintLine(nDocID,1,"Добыча на сумму: 13786");
	Doc_PrintLines(nDocID,0,"-------------------------");
	Doc_PrintLines(nDocID,0,"Команда: 5000");
	Doc_PrintLines(nDocID,0,"Капитан: 1000");
	Doc_PrintLines(nDocID,0,"Моя доля: 1560");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Галера «Ходящая по волнам»");
	Doc_PrintLine(nDocID,1,"Добыча на сумму: 7560");
	Doc_PrintLines(nDocID,0,"-------------------------");
	Doc_PrintLines(nDocID,0,"Команда: 5000");
	Doc_PrintLines(nDocID,0,"Капитан: 1000");
	Doc_PrintLines(nDocID,0,"Моя доля: 1560");
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Флейт «Король морей»");
	Doc_PrintLine(nDocID,1,"Добыча на сумму: 23598");
	Doc_PrintLines(nDocID,0,"-------------------------");
	Doc_PrintLines(nDocID,0,"Команда: 15000");
	Doc_PrintLines(nDocID,0,"Капитан: 3000");
	Doc_PrintLines(nDocID,0,"Моя доля: 5598");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Бриг «Западный ветер»");
	Doc_PrintLine(nDocID,1,"Добыча на сумму: 13500");
	Doc_PrintLines(nDocID,0,"-------------------------");
	Doc_PrintLines(nDocID,0,"Команда: 9000");
	Doc_PrintLines(nDocID,0,"Капитан: 2000");
	Doc_PrintLines(nDocID,0,"Моя доля: 2500");
	Doc_Show(nDocID);
};

