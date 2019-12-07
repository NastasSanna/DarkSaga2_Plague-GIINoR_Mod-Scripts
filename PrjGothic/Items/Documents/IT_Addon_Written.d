
instance ITWr_Addon_Health_04(C_Item)
{
	name = "Рецепт лечебного зелья";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "Чистое здоровье";
	text[2] = "Для приготовления этого сильного зелья";
	text[3] = "необходимо знание рецепта лечебного эликсира.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Heilrezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"Также необходимо иметь 1 луговой горец и 3 лечебные эссенции.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание лечебного зелья:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходим один луговой горец и три лечебные эссенции.");
	Doc_PrintLines(nDocID,0,"Перемешать и варить согласно рецепту лечебного эликсира.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это зелье может создать только алхимик, знающий рецепт лечебного эликсира.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Mana_04(C_Item)
{
	name = "Рецепт маны";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = "Чистая мана";
	text[2] = "Для приготовления этого сильного зелья";
	text[3] = "необходимо знание рецепта эликсира маны.";
	text[5] = NAME_Value;
	count[5] = value;
};
func void Use_Manarezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			Snd_Play("LevelUP");
			B_LogEntry(TOPIC_TalentAlchemy,"Также необходимо иметь 1 луговой горец и 3 эссенции маны.");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание зелья маны:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходим один луговой горец и три эссенции маны.");
	Doc_PrintLines(nDocID,0,"Перемешать и варить согласно рецепту эликсира маны.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это зелье может создать только алхимик, знающий рецепт эликсира маны.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Joint_01(C_Item)
{
	name = "Зеленый послушник";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[0] = "В сундуке Фортуно";
};
func void Use_Joint_Rezept_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Зеленый послушник");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(...) Косяки здесь довольно хороши, но в болотном лагере они получались все же лучше.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если я возьму эссенцию двух болотных трав и добавлю луговой горец, получится косяк с эффектом зеленого послушника.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Зеленый послушник помогает от любой боли и просветляет разум.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name = "Рецепт Молота Лу";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 70;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[0] = "Рецепт Молота Лу";
	text[4] = Name_Value;
	count[4] = value;
};
func void UseLouRezept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Рецепт Молота Лу");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ингредиенты для приготовления Молота:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Возьмите бутылку воды, две свеклы и немного болотной травы.");
	Doc_PrintLines(nDocID,0,"Добавьте перемолотый зуб болотной акулы.");
	Doc_PrintLines(nDocID,0,"Поместите все в бутылку, добавьте рома и вскипятите.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Удачи.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Старик, рассказавший мне этот рецепт, предупреждал, что лучше не дышать испарениями этого пойла!");
	Doc_Show(nDocID);
	if(C_ds_Knows_Lou_Rezept == FALSE)
	{ C_ds_Knows_Lou_Rezept = TRUE;
	};
};

instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "Рецепт двойного Молота Лу";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[0] = "Рецепт двойного Молота Лу";
	text[4] = Name_Value;
	count[4] = value;
};
func void UseLouRezept2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Двойной Молот Лу");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Возьмите Молот Лу и перегоните его еще раз.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот напиток способен приготовить только очень опытный винокур.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если за это возьмется дилетант, он рискует ослепнуть и даже лишиться жизни.");
	Doc_Show(nDocID);
	if(C_ds_Knows_Lou_Rezept2 == FALSE)
	{ C_ds_Knows_Lou_Rezept2 = TRUE;
	};
};

instance ITWr_Addon_Piratentod(C_Item)
{
	name = "Быстрая селедка";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[0] = "Рецепт Быстрой селедки.";
	text[4] = Name_Value;
	count[4] = value;
};
func void UseRezeptPiratentod()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Быстрая селедка");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Пойло для настоящих мужчин");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Как всегда, необходима бутылка воды. Добавьте немного рома и свежую рыбу.");
	Doc_PrintLines(nDocID,0,"Как только жидкость станет желтой, выньте рыбу и добавьте пучок");
	Doc_PrintLines(nDocID,0,"свежесорванной снеппер-травы.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Осторожно! Это пойло обладает очень сильным эффектом.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
	if(C_ds_Knows_Piratentod == FALSE)
	{ C_ds_Knows_Piratentod = TRUE;
	};
};

instance Fakescroll_Addon(C_Item)
{
	name = "Клочок бумаги";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "Инструкция изготовления бандитского топора";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[0] = "Инструкция изготовления легкого острого топора.";
};
func void UseAxtAnleitung()
{
	var int nDocID;
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		Knows_Banditenaxt = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Бандитский топор");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Одноручный топор");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот топор может выковать любой, знакомый с основами кузнечного дела.");
	Doc_PrintLines(nDocID,0,"Необходимы два куска раскаленной сырой стали.");
	Doc_PrintLines(nDocID,0,"Один кусок руды и три зуба волка, снеппера или подобного им зверя.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Перекуйте руду и зубы вместе со сталью на наковальне.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Такой топор очень легок и наносит значительный урон.");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};

