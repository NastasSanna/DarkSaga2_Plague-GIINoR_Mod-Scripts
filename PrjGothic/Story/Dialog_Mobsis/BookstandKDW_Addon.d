var int Runemaking_KDW_CIRC1_RedOnce;
var int Runemaking_KDW_CIRC2_RedOnce;
var int Runemaking_KDW_CIRC3_RedOnce;
var int Runemaking_KDW_CIRC4_RedOnce;
var int Runemaking_KDW_CIRC5_RedOnce;
func void Use_Runemaking_KDW_CIRC1_S1()
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
		Doc_PrintLine(nDocID,0,"Круги Воды");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны Воды и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечение легких ранений");
		Doc_PrintLine(nDocID,0,"Лечебная трава");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Гейзер");
//		Doc_PrintLine(nDocID,0,"Аквамарин");
//		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Буря");
//		Doc_PrintLine(nDocID,0,"Ледяной кварц");
//		Doc_PrintLine(nDocID,0,"Крылья кровавой мухи");
//		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Кулак воды");
//		Doc_PrintLine(nDocID,0,"Аквамарин");
//		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
		/*Redleha: Отключено обучение от книг
		if(Runemaking_KDW_CIRC1_RedOnce == false)
		{
			Runemaking_KDW_CIRC1_RedOnce = true;
			//B_TeachPlayerTalentRunesBook(hero,SPL_Whirlwind);
			//B_TeachPlayerTalentRunesBook(hero,SPL_IceLance);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Geyser);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Thunderstorm);
			//B_TeachPlayerTalentRunesBook(hero,SPL_WaterFist);
			B_TeachPlayerTalentRunesBook(hero,SPL_LightHeal);
		};
		*/

	};
};

func void Use_Runemaking_KDW_CIRC2_S1()
{
//	Use_Runemaking_KDW_CIRC1_S1();
	
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
		Doc_PrintLine(nDocID,0,"Круги Воды");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны Воды и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Смерч");
		Doc_PrintLine(nDocID,0,"Крылья кровавой мухи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ледяное копье");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ледяная стрела");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Буря");
//		Doc_PrintLine(nDocID,0,"Ледяной кварц");
//		Doc_PrintLine(nDocID,0,"Крылья кровавой мухи");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Кулак воды");
//		Doc_PrintLine(nDocID,0,"Аквамарин");
//		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
		/*Redleha: Отключено обучение от книг
		if(Runemaking_KDW_CIRC2_RedOnce == false)
		{
			Runemaking_KDW_CIRC2_RedOnce = true;
			B_TeachPlayerTalentRunesBook(hero,SPL_Whirlwind);
			B_TeachPlayerTalentRunesBook(hero,SPL_IceLance);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Geyser);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Thunderstorm);
			//B_TeachPlayerTalentRunesBook(hero,SPL_WaterFist);
			B_TeachPlayerTalentRunesBook(hero,SPL_Icebolt);
		};
	*/

	};
	
	
};

func void Use_Runemaking_KDW_CIRC3_S1()
{
//	Use_Runemaking_KDW_CIRC1_S1();
	
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
		Doc_PrintLine(nDocID,0,"Круги Воды");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны Воды и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ледяной блок");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечение средних ранений");
		Doc_PrintLine(nDocID,0,"Лечебное растение");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Гейзер");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Буря");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Крылья кровавой мухи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
		/*Redleha: Отключено обучение от книг
		if(Runemaking_KDW_CIRC3_RedOnce == false)
		{
			Runemaking_KDW_CIRC3_RedOnce = true;
			//B_TeachPlayerTalentRunesBook(hero,SPL_Whirlwind);
			//B_TeachPlayerTalentRunesBook(hero,SPL_IceLance);
			B_TeachPlayerTalentRunesBook(hero,SPL_Geyser);
			B_TeachPlayerTalentRunesBook(hero,SPL_Thunderstorm);
			//B_TeachPlayerTalentRunesBook(hero,SPL_WaterFist);
			B_TeachPlayerTalentRunesBook(hero,SPL_IceCube);
			B_TeachPlayerTalentRunesBook(hero,SPL_MediumHeal);
		};
		*/
	};
};

func void Use_Runemaking_KDW_CIRC4_S1()
{
//	Use_Runemaking_KDW_CIRC1_S1();
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
		Doc_PrintLine(nDocID,0,"Круги Воды");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны Воды и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Смерч");
//		Doc_PrintLine(nDocID,0,"Крылья кровавой мухи");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Ледяное копье");
//		Doc_PrintLine(nDocID,0,"Ледяной кварц");
//		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Гейзер");
//		Doc_PrintLine(nDocID,0,"Аквамарин");
//		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Буря");
//		Doc_PrintLine(nDocID,0,"Ледяной кварц");
//		Doc_PrintLine(nDocID,0,"Крылья кровавой мухи");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Кулак воды");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
		/*Redleha: Отключено обучение от книг
		if(Runemaking_KDW_CIRC4_RedOnce == false)
		{
			Runemaking_KDW_CIRC4_RedOnce = true;
			//B_TeachPlayerTalentRunesBook(hero,SPL_Whirlwind);
			//B_TeachPlayerTalentRunesBook(hero,SPL_IceLance);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Geyser);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Thunderstorm);
			B_TeachPlayerTalentRunesBook(hero,SPL_WaterFist);
		};
		*/
	};	
};

func void Use_Runemaking_KDW_CIRC5_S1()
{
//	Use_Runemaking_KDW_CIRC1_S1();
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
		Doc_PrintLine(nDocID,0,"Круги Воды");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Руны Воды и ингредиенты, необходимые для их создания.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ледяная волна");
		Doc_PrintLine(nDocID,0,"Ледяной кварц");
		Doc_PrintLine(nDocID,0,"Аквамарин");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лечение тяжелых ранений");
		Doc_PrintLine(nDocID,0,"Лечебный корень");
		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Гейзер");
//		Doc_PrintLine(nDocID,0,"Аквамарин");
//		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Буря");
//		Doc_PrintLine(nDocID,0,"Ледяной кварц");
//		Doc_PrintLine(nDocID,0,"Крылья кровавой мухи");
//		Doc_PrintLine(nDocID,0,"");
//		Doc_PrintLine(nDocID,0,"Кулак воды");
//		Doc_PrintLine(nDocID,0,"Аквамарин");
//		Doc_PrintLine(nDocID,0,"Горный хрусталь");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Чтобы создать руну, всегда необходим ОДИН из вышеперечисленных ингредиентов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Маг должен знать формулу заклинания и должен иметь чистый рунный камень и свиток желаемого заклинания.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Только при выполнении этих условий он может приступить к работе за рунным столом.");
		Doc_Show(nDocID);
		/*Redleha: Отключено обучение от книг
		if(Runemaking_KDW_CIRC5_RedOnce == false)
		{
			Runemaking_KDW_CIRC5_RedOnce = true;
			//B_TeachPlayerTalentRunesBook(hero,SPL_Whirlwind);
			//B_TeachPlayerTalentRunesBook(hero,SPL_IceLance);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Geyser);
			//B_TeachPlayerTalentRunesBook(hero,SPL_Thunderstorm);
			//B_TeachPlayerTalentRunesBook(hero,SPL_WaterFist);
			B_TeachPlayerTalentRunesBook(hero,SPL_IceWave);
			B_TeachPlayerTalentRunesBook(hero,SPL_FullHeal);
		};
		*/
	};	
};

func void Use_Runemaking_KDW_CIRC6_S1()
{
	Use_Runemaking_KDW_CIRC1_S1();
};
