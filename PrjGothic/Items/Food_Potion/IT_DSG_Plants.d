// Ilot: травки
const string PRINT_PlantsEffect_SteinRoot = "Корень сухой и безвкусный";

const int Value_DSG_Motherwort = 15;
const int HP_DSG_Motherwort = 7;

const int Value_DSG_FichtePilz = 50;
const int HP_DSG_FichtePilz = 10;

const int Value_DSG_SteinRoot = 100;

const int Value_DSG_Baummoos = 50;
const int DSG_Str_Baummoos = 1;
const int DSG_TimeStr_Baummoos = 60;

const int Value_DSG_Tairis = 100;
const int DSG_Str_Tairis = 2;
const int DSG_TimeStr_Tairis = 60;

const int Value_DSG_OrcNut = 100;
const int Value_DSG_SwampClover = 100;
const int Value_DSG_Coltsfoot = 100;
const int Value_DSG_Nameko = 100;
const int HP_DSG_Nameko = 10;
const int Value_DSG_Greasers = 100;
const int HP_DSG_Greasers = 10;
const int Value_DSG_Russula = 100;
const int HP_DSG_Russula = 10;
const int Value_DSG_RussulaQueletii = 100;
const int HP_DSG_RussulaQueletii = 10;

const int MP_MountMoom = 20;//??? Mana или HP
const int Value_MountMoom = 50;

prototype ItPl_DSG_Plant_Proto(C_Item){	visual = "ItPl_DSG_Motherwort.3DS";
	name 		= "Растение"; description = name;
	mainflag 	= ITEM_KAT_FOOD;	flags	 	= ITEM_MULTI;	material 	= MAT_LEATHER;	scemeName 	= "FOOD";
	value 		= Value_DSG_Motherwort;
	on_state[0] = Use_DSG_Motherwort;	
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
//****************************************************
//----------------- Пустырник ------------------------
//****************************************************
instance ItPl_DSG_Motherwort(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_Motherwort.3DS";
	name 		= "Пустырник";	description = name;
	
	value 	= Value_DSG_Motherwort;
	on_state[0] = Use_DSG_Motherwort;

	text[1] 	= NAME_Bonus_HP;	count[1] 	= HP_DSG_Motherwort;
	count[5] 	= value;
};
func void Use_DSG_Motherwort(){
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DSG_Motherwort);
};

//****************************************************
//------------- Каменный корень ----------------------
//****************************************************
instance ItPl_DSG_SteinRoot(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_SteinRoot.3ds";
	name 		= "Каменный корень";	description = name;
	
	value 		= Value_DSG_SteinRoot;	
	on_state[0] = Use_DSG_SteinRoot;
	
	count[5] 	= value;
};
func void Use_DSG_SteinRoot(){
	PrintScreen(PRINT_PlantsEffect_SteinRoot, -1, YPOS_LOGENTRY, FONT_ScreenSmall_Green_HI, 3);
};

//****************************************************
//-------------- Древесный мох -----------------------
//****************************************************
instance ItPl_DSG_Baummoos(ItPl_DSG_Plant_Proto){	visual 	= "ItPl_DSG_Baummoos.3ds";
	name 		= "Древесный мох";	description = name;

	value 		= Value_DSG_Baummoos;
	on_state[0] = Use_DSG_Baummoos;
	
	TEXT[2]		= 	"Бонус сила";	
	COUNT[2]	= 	DSG_Str_Baummoos;
	TEXT[3]		= 	"Время действия, мин";
	COUNT[3]	= 	DSG_TimeStr_Baummoos/60;
	count[5] 	= value;
};
func void Use_DSG_Baummoos(){
	if(self.id == 0){
		UseITPO_DSG_TinkturStr(DSG_Str_Baummoos, DSG_TimeStr_Baummoos);
	};
};

//****************************************************
//----------------- Таирис ---------------------------
//****************************************************
instance ItPl_DSG_Tairis(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_Tairis.3ds";
	name 		= "Таирис";	description = name;

	value 		= Value_DSG_Tairis;
	on_state[0] = Use_DSG_Tairis;
	
	TEXT[2]		= "Бонус сила";
	COUNT[2]	= DSG_Str_Tairis;
	TEXT[3]		= "Время действия, мин";
	COUNT[3]	= DSG_TimeStr_Tairis/60;
	count[5] 	= value;
};
func void Use_DSG_Tairis(){
	if(self.id == 0){
		UseITPO_DSG_TinkturStr(DSG_Str_Tairis, DSG_TimeStr_Tairis);
	};
};
//****************************************************
//-------------Орочий Орех ---------------------------
//****************************************************
instance ItPl_DSG_OrcNut(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_OrcNut.3ds";
	name 		= "Орочий орех";	description = name;

	value 		= Value_DSG_OrcNut;
	on_state[0] = Use_DSG_OrcNut;
	
	count[5] 	= value;
};
func void Use_DSG_OrcNut(){
	if(self.id == 0){	};
};
//****************************************************
//-----------Болотный клевер -------------------------
//****************************************************
instance ItPl_DSG_SwampClover(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_SwampClover.3ds";
	name 		= "Болотный клевер";	description = name;
	
	value 		= Value_DSG_SwampClover;
	on_state[0] = Use_DSG_SwampClover;
	
	count[5] 	= value;
};
func void Use_DSG_SwampClover(){
	if(self.id == 0){	};
};
//****************************************************
//-------------Мать-и-Мачеха -------------------------
//****************************************************
instance ItPl_DSG_Coltsfoot(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_Coltsfoot.3ds";
	name 		= "Мать-и-Мачеха";	description = name;
	
	value 		= Value_DSG_Coltsfoot;
	on_state[0] = Use_DSG_Coltsfoot;
	
	count[5] 	= value;
};
func void Use_DSG_Coltsfoot(){
	if(self.id == 0){	};
};

//-----------------------------------------------------------------------------------
//----------------------------------ГРИБЫ--------------------------------------------

//****************************************************
//-------------- Еловый гриб -------------------------
//****************************************************
instance ItPl_DSG_FichtePilz(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_FichtePilz_Mushroom.3DS";
	name 		= "Еловый гриб";	description = name;
	
	on_state[0] = Use_DSG_FichtePilz;
	value 		= Value_DSG_FichtePilz;
	
	text[1] 	= NAME_Bonus_HP;	count[1] 	= HP_DSG_FichtePilz;
	count[5]	= value;
};
func void Use_DSG_FichtePilz(){
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-HP_DSG_FichtePilz);	//Грыбочек ядовитый!!!
};
//****************************************************
//-------------- ОПЯТА -------------------------
//****************************************************
instance ItPl_DSG_Nameko(ItPl_DSG_Plant_Proto){	visual = "It_DSG_Nameko_Mushroom.3DS";
	name 		= "Опята";	description = name;
	
	on_state[0] = Use_DSG_Nameko;
	value 		= Value_DSG_Nameko;
	
	text[1] 	= NAME_Bonus_HP;	count[1] 	= HP_DSG_Nameko;
	count[5]	= value;
};
func void Use_DSG_Nameko(){
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DSG_Nameko);
};
//****************************************************
//-------------- Маслёнок -------------------------
//****************************************************
instance ItPl_DSG_Greasers(ItPl_DSG_Plant_Proto){	visual = "It_DSG_Greasers_Mushroom.3DS";
	name 		= "Масленок";	description = name;
	
	on_state[0] = Use_DSG_Greasers;
	value 		= Value_DSG_Greasers;
	
	text[1] 	= NAME_Bonus_HP;	count[1] 	= HP_DSG_Greasers;
	count[5]	= value;
};
func void Use_DSG_Greasers(){
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DSG_Greasers);
};
//****************************************************
//----------------- Сыроежка -------------------------
//****************************************************
instance ItPl_DSG_Russula(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_Russula_Mushroom.3DS";
	name 		= "Сыроежка";	description = name;
	
	on_state[0] = Use_DSG_Russula;
	value 		= Value_DSG_Russula;
	
	text[1] 	= NAME_Bonus_HP;	count[1] 	= HP_DSG_Russula;
	count[5]	= value;
};
func void Use_DSG_Russula(){
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DSG_Russula);
};
//****************************************************
//-------------- Сыроежка Келе -----------------------
//****************************************************
instance ItPl_DSG_RussulaQueletii(ItPl_DSG_Plant_Proto){	visual = "ItPl_DSG_RussulaQueletii_Mushroom.3DS";
	name 		= "Сыроежка Келе";	description = name;
	
	on_state[0] = Use_DSG_RussulaQueletii;
	value 		= Value_DSG_RussulaQueletii;
	
	text[1] 	= NAME_Bonus_HP;	count[1] 	= HP_DSG_RussulaQueletii;
	count[5]	= value;
};
func void Use_DSG_RussulaQueletii(){
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DSG_RussulaQueletii);
};
//****************************************************
//-------------- Горный мох -----------------------
//****************************************************
instance ItPl_DSG_Mountmoom(ItPl_DSG_Plant_Proto){	visual 	= "ItPl_DSG_Baummoos.3ds";
	name 		= "Горный мох";	description = name;

	value 		= Value_MountMoom;
	on_state[0] = Use_DSG_MountMoom;
	
	TEXT[2]		= 	NAME_Bonus_Mana;	
	COUNT[2]	= 	MP_MountMoom;
	count[5] 	= value;
};

func void Use_DSG_MountMoom()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_MANA,MP_MountMoom);
	};
};