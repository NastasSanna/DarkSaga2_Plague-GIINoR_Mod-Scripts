
const int STAT_A_X1 = 850;	//500
const int STAT_A_X2 = 2950;
const int STAT_A_X3 = 3250;
const int STAT_A_X4 = 4000;
//const int STAT_B_X1 = 3600;
//const int STAT_B_X2 = 5800;
const int STAT_B_X1 = 4200;	//4500
const int STAT_B_X2 = 6600;//3600
const int STAT_B_X3 = 7000;	//7350
const int STAT_B_X4 = 7350;
const int STAT_PLYHEAD_Y = 400;
const int STAT_PLY_Y = 1100;
const int STAT_ATRHEAD_Y = 3300;
const int STAT_ATR_Y = 3700;
const int STAT_ARMHEAD_Y = 5600;
const int STAT_ARM_Y = 6000;
const int STAT_TALHEAD_Y = 400;
const int STAT_TAL_Y = 1000;
const int STAT_DY = 350;	//300
const int STAT_TAL_DY = 280;
const int STAT_SEPARATOR_HEAD_PLY_Y = 700;
const int STAT_SEPARATOR_PLY_ATR_Y = 2900;
const int STAT_SEPARATOR_ATR_ARM_Y = 5200;

instance MENU_ITEM_SWITCH_HANDICRAFT(C_MENU_ITEM_DEF)
{
	//posx = STAT_A_X1;
	//posy = STAT_TALHEAD_Y + STAT_ARMHEAD_Y + 1200;
	posx = STAT_B_X1 - 700;
	posy = STAT_TALHEAD_Y + 40;
	//dimx = STAT_A_X4 - STAT_A_X1;
	dimx = STAT_B_X4 - STAT_B_X1;
	dimy = STAT_DY;
	text[0] = "<>";
	text[1] = "Выберите клавишами 'LEFT'-'RIGHT' требуемый тип навыков и нажмите 'Enter'";
	fontname = MENU_FONT_DEFAULT;
//	onselaction[0] = SEL_ACTION_UNDEF;
//	oneventaction[1] = Change_Talents;
	//onselaction[0] = SEL_ACTION_CLOSE;
	onselaction[0] = SEL_ACTION_STARTMENU;
	//onselaction_s[0] = "MENU_DSSTATUS_HANDICRAFT";
	onselaction_s[0] = "MENU_STATUS";
	onselaction[1] = SEL_ACTION_BACK;
	onselaction[2] = SEL_ACTION_CLOSE;
	flags = flags | IT_EFFECTS_NEXT | IT_TXT_CENTER;
};
instance MENU_ITEM_SWITCH_HANDICRAFT_CHOICE(C_MENU_ITEM_DEF)
{
	//backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "Ремесло|Боевые";
	fontname = STAT_FONT_SAGA_20;
	posx = STAT_B_X1;
	posy = STAT_TALHEAD_Y;
	dimx = STAT_B_X4 - STAT_B_X1;
	dimy = STAT_DY;
	//posx = STAT_B_X1;//STAT_A_X1;
	//posy = STAT_TALHEAD_Y;// + STAT_ARMHEAD_Y + 1500;
	//dimx = 2000;
	//dimy = MENU_CHOICE_DY;
	onchgsetoptionsection = "DARKSAGA";
	onchgsetoption = "showBattleCraft";
	//oneventaction[6] = update_gameoptions;	
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};
func int update_gameoptions()
{
	Apply_Options_Game();
//	Update_ChoiceBox("MENU_STATUS");
	return 0;
};

//Главный герой_информация
instance MENU_ITEM_STATUS_HEADING(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_PLYHEAD_Y;dimx = STAT_A_X4 - STAT_A_X1;dimy = STAT_DY;text[0] = "Аластер";
	fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};
	
instance MENU_ITEM_SEPARATOR_HEAD_PLY(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_SEPARATOR_HEAD_PLY_Y;dimx = STAT_A_X4 - STAT_A_X1;dimy = STAT_DY;text[0] = "~~~~~~~~~~~~~~~~~~~~~~~~~";
	fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};

instance MENU_ITEM_PLAYERGUILD_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_PLY_Y + STAT_DY*0 - 150;text[0] = "Гильдия:";fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};	
instance MENU_ITEM_PLAYERGUILD(C_MENU_ITEM_DEF)
{posx = STAT_A_X2 - 850;posy = STAT_PLY_Y + STAT_DY*0 - 150;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_LEVEL_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_PLY_Y + STAT_DY*1;text[0] = "Уровень";fontname = STAT_FONT_SAGA_20;
	flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_LEVEL(C_MENU_ITEM_DEF)
{posx = STAT_A_X3;posy = STAT_PLY_Y + STAT_DY*1;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_EXP_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_PLY_Y + STAT_DY*2;text[0] = "Опыт";fontname = STAT_FONT_SAGA_20;
	flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_EXP(C_MENU_ITEM_DEF)
{posx = STAT_A_X3;posy = STAT_PLY_Y + STAT_DY*2;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_LEVEL_NEXT_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_PLY_Y + STAT_DY*3;text[0] = "След. уровень";fontname = STAT_FONT_SAGA_20;
	flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_LEVEL_NEXT(C_MENU_ITEM_DEF)
{posx = STAT_A_X3;posy = STAT_PLY_Y + STAT_DY*3;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_LEARN_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_PLY_Y + STAT_DY*4;text[0] = "Ед. опыта";fontname = STAT_FONT_SAGA_20;
	flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_LEARN(C_MENU_ITEM_DEF)
{posx = STAT_A_X3;posy = STAT_PLY_Y + STAT_DY*4;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};

instance MENU_ITEM_SEPARATOR_STATUS_ATR(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_SEPARATOR_PLY_ATR_Y;dimx = STAT_A_X4 - STAT_A_X1;dimy = STAT_DY;text[0] = "~~~~~~~~~~~~~~~~~~~~~~~~~";
	fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};

//ХАРАКТЕРИСТИКИ
instance MENU_ITEM_ATTRIBUTE_HEADING(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ATRHEAD_Y;dimx = STAT_A_X4 - STAT_A_X1;dimy = STAT_DY;text[0] = "ХАРАКТЕРИСТИКИ";
fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};
instance MENU_ITEM_ATTRIBUTE_1_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ATR_Y + STAT_DY*0;text[0] = "Сила";fontname = STAT_FONT_SAGA_20;
flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ATTRIBUTE_1(C_MENU_ITEM_DEF)
{posx = STAT_A_X2;posy = STAT_ATR_Y + STAT_DY*0;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ATTRIBUTE_2_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ATR_Y + STAT_DY*1;text[0] = "Ловкость";fontname = STAT_FONT_SAGA_20;
flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ATTRIBUTE_2(C_MENU_ITEM_DEF)
{posx = STAT_A_X2;posy = STAT_ATR_Y + STAT_DY*1;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ATTRIBUTE_3_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ATR_Y + STAT_DY*2;text[0] = "Мана";fontname = STAT_FONT_SAGA_20;
flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ATTRIBUTE_3(C_MENU_ITEM_DEF)
{posx = STAT_A_X2;posy = STAT_ATR_Y + STAT_DY*2;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ATTRIBUTE_4_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ATR_Y + STAT_DY*3;text[0] = "Очки жизни";fontname = STAT_FONT_SAGA_20;
flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ATTRIBUTE_4(C_MENU_ITEM_DEF)
{posx = STAT_A_X2;posy = STAT_ATR_Y + STAT_DY*3;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};

instance MENU_ITEM_SEPARATOR_ATR_ARM(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_SEPARATOR_ATR_ARM_Y;dimx = STAT_A_X4 - STAT_A_X1;dimy = STAT_DY;text[0] = "~~~~~~~~~~~~~~~~~~~~~~~~~";
	fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};
	
//ЗАЩИТА
instance MENU_ITEM_ARMOR_HEADING(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ARMHEAD_Y;dimx = STAT_A_X4 - STAT_A_X1;dimy = STAT_DY;text[0] = "ЗАЩИТА";
fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};
instance MENU_ITEM_ARMOR_1_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ARM_Y + STAT_DY*0;text[0] = "от Оружия";fontname = STAT_FONT_SAGA_20;
	flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ARMOR_1(C_MENU_ITEM_DEF)
{posx = STAT_A_X3;posy = STAT_ARM_Y + STAT_DY*0;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ARMOR_2_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ARM_Y + STAT_DY*1;text[0] = "от Стрел";fontname = STAT_FONT_SAGA_20;
	flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ARMOR_2(C_MENU_ITEM_DEF)
{posx = STAT_A_X3;posy = STAT_ARM_Y + STAT_DY*1;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ARMOR_3_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ARM_Y + STAT_DY*2;text[0] = "от Огня";fontname = STAT_FONT_SAGA_20;
	flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ARMOR_3(C_MENU_ITEM_DEF)
{posx = STAT_A_X3;posy = STAT_ARM_Y + STAT_DY*2;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ARMOR_4_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_A_X1;posy = STAT_ARM_Y + STAT_DY*3;text[0] = "от Магии";fontname = STAT_FONT_SAGA_20;
	flags = flags & ~IT_SELECTABLE;};
instance MENU_ITEM_ARMOR_4(C_MENU_ITEM_DEF)
{posx = STAT_A_X3;posy = STAT_ARM_Y + STAT_DY*3;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;};

//НАВЫКИ
//instance MENU_ITEM_TALENTS_HEADING(C_MENU_ITEM_DEF)
//{posx = STAT_B_X1;posy = STAT_TALHEAD_Y;dimx = STAT_B_X4 - STAT_B_X1;dimy = STAT_DY;text[0] = "НАВЫКИ";fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};
//instance MENU_ITEM_TALENTS_HEADING(C_MENU_ITEM_DEF)
//{posx = STAT_A_X1;posy = STAT_TALHEAD_Y + STAT_ARMHEAD_Y + 600;dimx = STAT_A_X4 - STAT_A_X1;dimy = STAT_DY;
//	text[0] = "НАВЫКИ";fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};
instance MENU_ITEM_SEPARATOR_TALHEAD_TAL(C_MENU_ITEM_DEF)
{	posx = STAT_B_X1;	posy = STAT_SEPARATOR_HEAD_PLY_Y;dimx = STAT_B_X4 - STAT_B_X1;	dimy = STAT_DY;	text[0] = "~~~~~~~~~~~~~~~~~~~~~~~~~";
	fontname = STAT_FONT_SAGA_20;flags = (flags & ~IT_SELECTABLE) | IT_TXT_CENTER;};

instance MENU_ITEM_TALENT_1_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 0*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_1_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 0*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~ IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_1(C_MENU_ITEM_DEF)
{posx = STAT_B_X3;posy = STAT_TAL_Y + 0*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_2_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 2*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_2_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 2*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_2(C_MENU_ITEM_DEF)
{posx = STAT_B_X3;posy = STAT_TAL_Y + 2*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_3_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 4*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_3_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 4*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_3(C_MENU_ITEM_DEF)
{posx = STAT_B_X3;posy = STAT_TAL_Y + 4*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_4_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 6*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_4_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 6*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
instance MENU_ITEM_TALENT_4(C_MENU_ITEM_DEF)
{posx = STAT_B_X3;posy = STAT_TAL_Y + 6*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;};
//
//ADVANCED TALENTS***************************
//
	//BATTLE : Боевые
// -------2x2 sword-------Два клинка
INSTANCE MENU_ITEM_TALENT_10_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 8*STAT_TAL_DY;fontName = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE; 
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;
	};
instance MENU_ITEM_TALENT_10_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 8*STAT_TAL_DY;fontName = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE; 
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;
	};
// -------Shield Talent--Щит
INSTANCE MENU_ITEM_TALENT_9_TITLE(C_MENU_ITEM_DEF) 
{posx = STAT_B_X1;posy = STAT_TAL_Y + 10*STAT_TAL_DY;fontName = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE; 
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;
	};
instance MENU_ITEM_TALENT_9_SKILL(C_MENU_ITEM_DEF) 
{posx = STAT_B_X2;posy = STAT_TAL_Y + 10*STAT_TAL_DY;fontName = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE; 
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;
	};
// ------ ORCs WEAPON----
INSTANCE MENU_ITEM_TALENT_21_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 12*STAT_TAL_DY;fontName = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE; 
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;
	};
instance MENU_ITEM_TALENT_21_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 12*STAT_TAL_DY;fontName = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE; 
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 0;
	};
//---------------------------------------------
	//Ремесло : HandiCraft
//+++++	
// ------ Sneak ------Talent 8//подкрадывание
instance MENU_ITEM_TALENT_8_TITLE(C_MENU_ITEM_DEF) 
{posx = STAT_B_X1;posy = STAT_TAL_Y + 0*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_8_SKILL(C_MENU_ITEM_DEF) 
{posx = STAT_B_X2;posy = STAT_TAL_Y + 0*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// ------ Picklock ------ // Talent 5//отмычки
instance MENU_ITEM_TALENT_5_TITLE(C_MENU_ITEM_DEF) 
{posx = STAT_B_X1;posy = STAT_TAL_Y + 2*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_5_SKILL(C_MENU_ITEM_DEF) 
{posx = STAT_B_X2;posy = STAT_TAL_Y + 2*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// ------ Pickpocket (NEW) ------ // Talent 12//воровство
instance MENU_ITEM_TALENT_12_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 4*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_12_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 4*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// ------ Runes : Руны------ // Talent 14
instance MENU_ITEM_TALENT_14_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 6*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_14_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 6*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;};
// ------ Alchemy : Алхимия-----// Talent 15
instance MENU_ITEM_TALENT_15_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 8*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_15_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 8*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// ------ Smith : Кузнечное дело.ковка------ // Talent 13
instance MENU_ITEM_TALENT_13_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 10*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_13_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 10*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// ------ Fusing : Плавка------ // Talent 20
instance MENU_ITEM_TALENT_20_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 12*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_20_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 12*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// ------ Добыча трофеев животных ------ // Talent 16
instance MENU_ITEM_TALENT_16_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 14*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;};
instance MENU_ITEM_TALENT_16_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 14*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// ------ Обработка шкур----Talent 17
INSTANCE MENU_ITEM_TALENT_17_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 16*STAT_TAL_DY;fontName = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE; 
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_17_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 16*STAT_TAL_DY;fontName = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE; 
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// ------ PickOre : Рудное дело------// Talent 6
instance MENU_ITEM_TALENT_6_TITLE(C_MENU_ITEM_DEF) 
{posx = STAT_B_X1;posy = STAT_TAL_Y + 18*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_6_SKILL(C_MENU_ITEM_DEF) 
{posx = STAT_B_X2;posy = STAT_TAL_Y + 18*STAT_TAL_DY;fontname = STAT_FONT_DEFAULT;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
// -------PickOre : Навык в %%----
instance MENU_ITEM_TALENT_19_TITLE(C_MENU_ITEM_DEF)
{posx = STAT_B_X1;posy = STAT_TAL_Y + 20*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;
	};
instance MENU_ITEM_TALENT_19_SKILL(C_MENU_ITEM_DEF)
{posx = STAT_B_X2;posy = STAT_TAL_Y + 20*STAT_TAL_DY;fontname = STAT_FONT_SAGA_20;flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "DARKSAGA";
	hideifoptionset = "showBattleCraft";
	hideonvalue = 1;	
};

instance MENU_STATUS(C_MENU_DEF)
{
	backpic = STAT_BACK_PIC;
	items[0] = "MENU_ITEM_STATUS_HEADING";
	items[1] = "MENU_ITEM_PLAYERGUILD_TITLE";
	items[2] = "MENU_ITEM_PLAYERGUILD";
	items[3] = "MENU_ITEM_LEVEL_TITLE";
	items[4] = "MENU_ITEM_LEVEL";
	items[7] = "MENU_ITEM_EXP_TITLE";
	items[8] = "MENU_ITEM_EXP";
	items[9] = "MENU_ITEM_LEVEL_NEXT_TITLE";
	items[10] = "MENU_ITEM_LEVEL_NEXT";
	items[11] = "MENU_ITEM_LEARN_TITLE";
	items[12] = "MENU_ITEM_LEARN";
	items[13] = "MENU_ITEM_ATTRIBUTE_HEADING";
	items[14] = "MENU_ITEM_ATTRIBUTE_1_TITLE";
	items[15] = "MENU_ITEM_ATTRIBUTE_2_TITLE";
	items[16] = "MENU_ITEM_ATTRIBUTE_3_TITLE";
	items[17] = "MENU_ITEM_ATTRIBUTE_4_TITLE";
	items[18] = "MENU_ITEM_ATTRIBUTE_1";
	items[19] = "MENU_ITEM_ATTRIBUTE_2";
	items[20] = "MENU_ITEM_ATTRIBUTE_3";
	items[21] = "MENU_ITEM_ATTRIBUTE_4";
	items[22] = "MENU_ITEM_ARMOR_HEADING";
	items[23] = "MENU_ITEM_ARMOR_1_TITLE";
	items[24] = "MENU_ITEM_ARMOR_2_TITLE";
	items[25] = "MENU_ITEM_ARMOR_3_TITLE";
	items[26] = "MENU_ITEM_ARMOR_4_TITLE";
	items[28] = "MENU_ITEM_ARMOR_1";
	items[29] = "MENU_ITEM_ARMOR_2";
	items[30] = "MENU_ITEM_ARMOR_3";
	items[31] = "MENU_ITEM_ARMOR_4";
	//items[32] = "MENU_ITEM_SWITCH_LOG";
	items[33] = "MENU_ITEM_SWITCH_HANDICRAFT";
	items[34] = "MENU_ITEM_SWITCH_HANDICRAFT_CHOICE";
	items[35] = "MENU_ITEM_TALENT_19_TITLE";
	items[36] = "MENU_ITEM_TALENT_19_SKILL";
	items[37] = "MENU_ITEM_TALENT_1_TITLE";
	items[38] = "MENU_ITEM_TALENT_1_SKILL";
	items[39] = "MENU_ITEM_TALENT_1";
	items[40] = "MENU_ITEM_TALENT_2_TITLE";
	items[41] = "MENU_ITEM_TALENT_2_SKILL";
	items[42] = "MENU_ITEM_TALENT_2";
	items[43] = "MENU_ITEM_TALENT_3_TITLE";
	items[44] = "MENU_ITEM_TALENT_3_SKILL";
	items[45] = "MENU_ITEM_TALENT_3";
	items[46] = "MENU_ITEM_TALENT_4_TITLE";
	items[47] = "MENU_ITEM_TALENT_4_SKILL";
	items[48] = "MENU_ITEM_TALENT_4";	
	items[49] = "MENU_ITEM_TALENT_8_TITLE";
	items[50] = "MENU_ITEM_TALENT_8_SKILL";
	items[51] = "MENU_ITEM_TALENT_5_TITLE";
	items[52] = "MENU_ITEM_TALENT_5_SKILL";
	items[53] = "MENU_ITEM_TALENT_12_TITLE";
	items[54] = "MENU_ITEM_TALENT_12_SKILL";
	items[55] = "MENU_ITEM_TALENT_6_TITLE";
	items[56] = "MENU_ITEM_TALENT_6_SKILL";
	items[57] = "MENU_ITEM_TALENT_14_TITLE";
	items[58] = "MENU_ITEM_TALENT_14_SKILL";
	items[59] = "MENU_ITEM_TALENT_15_TITLE";
	items[60] = "MENU_ITEM_TALENT_15_SKILL";
	items[61] = "MENU_ITEM_TALENT_13_TITLE";
	items[62] = "MENU_ITEM_TALENT_13_SKILL";
	items[63] = "MENU_ITEM_TALENT_16_TITLE";
	items[64] = "MENU_ITEM_TALENT_16_SKILL";
	items[65] = "MENU_ITEM_TALENT_20_TITLE";
	items[66] = "MENU_ITEM_TALENT_20_SKILL";	
	items[67] = "MENU_ITEM_TALENT_9_TITLE";
	items[68] = "MENU_ITEM_TALENT_9_SKILL";
	items[69] = "MENU_ITEM_TALENT_10_TITLE";
	items[70] = "MENU_ITEM_TALENT_10_SKILL";
	items[71] = "MENU_ITEM_TALENT_21_TITLE";
	items[72] = "MENU_ITEM_TALENT_21_SKILL";
	items[75] = "MENU_ITEM_TALENT_17_TITLE";
	items[76] = "MENU_ITEM_TALENT_17_SKILL";
	
	items[99] = "MENU_ITEM_SEPARATOR_HEAD_PLY";
	items[100] = "MENU_ITEM_SEPARATOR_STATUS_ATR";
	items[101] = "MENU_ITEM_SEPARATOR_ATR_ARM";
	items[102] = "MENU_ITEM_SEPARATOR_TALHEAD_TAL";
	//items[34] = "MENU_ITEM_SWITCH_HANDICRAFT";
	//items[101] = "MENU_ITEM_SWITCH_CRAFT_CHOICE";
	
	dimx = 12692;
	dimy = 12692;
	//flags = flags //| MENU_OVERTOP ;//| MENU_NOANI;//| MENU_SHOW_INFO;
	flags = flags | MENU_SHOW_INFO;
	//flags = flags & ~MENU_EXCLUSIVE;	
};
