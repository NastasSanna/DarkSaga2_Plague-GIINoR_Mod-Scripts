
/*Настойка воина*/
const int Value_DSG_TinkturStr_wenig = 300;
const int DSG_TinkturStr_wenig_01 = 10;
const int DSG_TinkturStr_wenig_02 = 12;
const int DSG_TinkturStr_wenig_03 = 15;
const int DSG_TimeTinkturStr_wenig_01 = 360;
const int DSG_TimeTinkturStr_wenig_02 = 420;
const int DSG_TimeTinkturStr_wenig_03 = 480;
/*Особая настойка война*/
const int Value_DSG_TinkturStr_besondere = 450;
const int DSG_TinkturStr_besondere_01 = 15;
const int DSG_TinkturStr_besondere_02 = 18;
const int DSG_TinkturStr_besondere_03 = 22;
const int DSG_TimeTinkturStr_besondere_01 = 360;
const int DSG_TimeTinkturStr_besondere_02 = 420;
const int DSG_TimeTinkturStr_besondere_03 = 480;
/*Настойка охотника*/
const int Value_DSG_TinkturDex_wenig = 300;
const int DSG_TinkturDex_wenig_01 = 10;
const int DSG_TinkturDex_wenig_02 = 12;
const int DSG_TinkturDex_wenig_03 = 15;
const int DSG_TimeTinkturDex_wenig_01 = 360;
const int DSG_TimeTinkturDex_wenig_02 = 420;
const int DSG_TimeTinkturDex_wenig_03 = 480;
/*Особая настойка охотника*/
const int Value_DSG_TinkturDex_besondere = 450;
const int DSG_TinkturDex_besondere_01 = 15;
const int DSG_TinkturDex_besondere_02 = 18;
const int DSG_TinkturDex_besondere_03 = 22;
const int DSG_TimeTinkturDex_besondere_01 = 360;
const int DSG_TimeTinkturDex_besondere_02 = 420;
const int DSG_TimeTinkturDex_besondere_03 = 480;
/*Зелье Ботье*/
const int Value_DSG_TinkturBotje_wenig = 600;
const int DSG_TinkturBotje_wenig_str_01 = 10;
const int DSG_TinkturBotje_wenig_str_02 = 12;
const int DSG_TinkturBotje_wenig_str_03 = 15;
const int DSG_TinkturBotje_wenig_dex_01 = 10;
const int DSG_TinkturBotje_wenig_dex_02 = 12;
const int DSG_TinkturBotje_wenig_dex_03 = 15;
const int DSG_TimeTinkturBotje_wenig_01 = 60;//360;
const int DSG_TimeTinkturBotje_wenig_02 = 420;
const int DSG_TimeTinkturBotje_wenig_03 = 480;
/*Настойка могущества*/
const int Value_DSG_TinkturBotje_besondere = 100;
const int DSG_TinkturBotje_besondere_str_01 = 15;
const int DSG_TinkturBotje_besondere_str_02 = 17;
const int DSG_TinkturBotje_besondere_str_03 = 20;
const int DSG_TinkturBotje_besondere_dex_01 = 15;
const int DSG_TinkturBotje_besondere_dex_02 = 17;
const int DSG_TinkturBotje_besondere_dex_03 = 20;
const int DSG_TinkturBotje_besondere_hp_01 = 100;		
const int DSG_TinkturBotje_besondere_hp_02 = 120;
const int DSG_TinkturBotje_besondere_hp_03 = 150;
const int DSG_TimeTinkturBotje_besondere_01 = 360;
const int DSG_TimeTinkturBotje_besondere_02 = 420;
const int DSG_TimeTinkturBotje_besondere_03 = 480;
//Константы Y-координат вывода текста для ловкости, силы, жизни
const int DSG_posY_StrUp = 40;
const int DSG_posY_DexUp = 45;
const int DSG_posY_HpMaxUp = 50;

//--------------------------------------------------------------------------//
//-----Redleha: Прототип функции временного повышения атрибута (сила)-------//
//--------------------------------------------------------------------------//
FUNC VOID UseITPO_DSG_TinkturStr(var int str_up, var int time)
{
	var string concatText_STR; concatText_STR="";
	if(DSG_abholen_atr_str == 0)
	{
		concatText_STR = ConcatStrings(PRINT_DSG_LearnSTR_Plus, IntToString(str_up));
		PrintScreen(concatText_STR, -1, DSG_posY_StrUp, FONT_SCREEN, 3);
		self.attribute[ATR_STRENGTH] += str_up;		
		DSG_abholen_Time_str = time;		//установить время для счетчика
		DSG_abholen_atr_str = str_up;		//установить: атрибут поднят - сила (значение)
	};
};
//--------------------------------------------------------------------------//
//---Redleha: Прототип функции временного повышения атрибута (ловкость)-----//
//--------------------------------------------------------------------------//
FUNC VOID UseITPO_DSG_TinkturDex(var int dex_up, var int time)
{ 
	var string concatText_DEX; concatText_DEX="";
	if(DSG_abholen_atr_dex == 0)
	{
		concatText_DEX = ConcatStrings(PRINT_DSG_LearnDEX_Plus, IntToString(dex_up));
		PrintScreen(concatText_DEX, -1, DSG_posY_DexUp, FONT_SCREEN, 3);
		self.attribute[ATR_DEXTERITY] += dex_up;
		DSG_abholen_Time_dex = time;		//установить время для счетчика
		DSG_abholen_atr_dex = dex_up;		//установить: атрибут поднят - ловкость (значение)
	};	
};
//--------------------------------------------------------------------------//
//---Redleha: Прототип функции временного повышения атрибута (жизнь)--------//
//--------------------------------------------------------------------------//
FUNC VOID UseITPO_DSG_TinkturHPMax(var int hpMax_up, var int time)
{ 
	var string concatText_HPMax; concatText_HPMax="";
	if(DSG_abholen_atr_hp == 0)
	{
		concatText_HPMax = ConcatStrings(PRINT_DSG_LearnHPMax_Plus, IntToString(hpMax_up));
		PrintScreen(concatText_HPMax, -1, DSG_posY_HpMaxUp, FONT_SCREEN, 3);
		self.attribute[ATR_HITPOINTS_MAX] += hpMax_up;
		self.attribute[ATR_HITPOINTS] += hpMax_up;
		DSG_abholen_Time_hpmax = time;		//установить время для счетчика
		DSG_abholen_atr_hp = hpMax_up;		//установить: атрибут поднят - жизнь (значение)
	};	
};
//--------------------------------------------------------------------------//
//-Redleha: Прототип функции временного повышения атрибутов (сила, ловкость)-//
//--------------------------------------------------------------------------//
FUNC VOID UseITPO_DSG_TinkturBotje_wenig(var int str_up, var int dex_up, var int time)
{ 
	if(DSG_abholen_atr_dex == 0)	{	UseITPO_DSG_TinkturDex(dex_up,time);	};
	if(DSG_abholen_atr_str == 0)	{	UseITPO_DSG_TinkturStr(str_up,time);	};
};
//-------------------------------------------------------------------------------//
//-Redleha: Прототип функции временного повышения атрибутов (сила,ловкость,жизнь)-//
//-------------------------------------------------------------------------------//
FUNC VOID UseITPO_DSG_TinkturBotje_besondere(var int str_up, var int dex_up, var int hpMax_up, var int time)
{
	if(DSG_abholen_atr_dex == 0)	{	UseITPO_DSG_TinkturDex(dex_up,time);	};
	if(DSG_abholen_atr_str == 0)	{	UseITPO_DSG_TinkturStr(str_up,time);	};
	if(DSG_abholen_atr_hp == 0)	{	UseITPO_DSG_TinkturHPMax(hpMax_up,time);	};
};
//
/******************************************************************************************/
// Напитки временного эффекта: Настойка воина (%сила%)
/******************************************************************************************/

prototype ITPO_DSG_TinkturStr_wenig(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_TinkturStr_wenig;
	visual 			=	"ITPO_DSG_TinkturStr_wenig_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER";
	description		= 	"Настойка воина";
	TEXT[2]			= 	NAME_Bonus_Str;
	TEXT[3]			= 	NAME_Duration;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};
instance ITPO_DSG_TinkturStr_wenig_01 (ITPO_DSG_TinkturStr_wenig){	visual 		=	"ITPO_DSG_TinkturStr_wenig_01.3ds";
																	on_state[0]	=	UseITPO_DSG_TinkturStr_wenig_01;
																	COUNT[2]	= 	DSG_TinkturStr_wenig_01;
																	COUNT[3]	= 	DSG_TimeTinkturStr_wenig_01/60;};
instance ITPO_DSG_TinkturStr_wenig_02 (ITPO_DSG_TinkturStr_wenig){	visual 		=	"ITPO_DSG_TinkturStr_wenig_02.3ds";
																	on_state[0]	=	UseITPO_DSG_TinkturStr_wenig_02;
																	COUNT[2]	= 	DSG_TinkturStr_wenig_02;
																	COUNT[3]	= 	DSG_TimeTinkturStr_wenig_02/60;};
instance ITPO_DSG_TinkturStr_wenig_03 (ITPO_DSG_TinkturStr_wenig){	visual 		=	"ITPO_DSG_TinkturStr_wenig_03.3ds";
																	on_state[0]	=	UseITPO_DSG_TinkturStr_wenig_03;
																	COUNT[2]	= 	DSG_TinkturStr_wenig_03;
																	COUNT[3]	= 	DSG_TimeTinkturStr_wenig_03/60;
};	
FUNC VOID UseITPO_DSG_TinkturStr_wenig_01(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturStr(DSG_TinkturStr_wenig_01, DSG_TimeTinkturStr_wenig_01);
	};
};
FUNC VOID UseITPO_DSG_TinkturStr_wenig_02(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturStr(DSG_TinkturStr_wenig_02, DSG_TimeTinkturStr_wenig_02);
	};
};
FUNC VOID UseITPO_DSG_TinkturStr_wenig_03(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturStr(DSG_TinkturStr_wenig_03, DSG_TimeTinkturStr_wenig_03);
	};		
};
//
/******************************************************************************************/
// Напитки временного эффекта: Особая настойка война (%сила%)
/******************************************************************************************/

prototype ITPO_DSG_TinkturStr_besondere(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_TinkturStr_besondere;	
	visual 			=	"ITPO_DSG_TinkturStr_besondere_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER";
	description		= 	"Особая настойка война";
	TEXT[2]			= 	NAME_Bonus_Str;
	TEXT[3]			= 	NAME_Duration;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};
instance ITPO_DSG_TinkturStr_besondere_01 (ITPO_DSG_TinkturStr_besondere){	visual 		=	"ITPO_DSG_TinkturStr_besondere_01.3ds";
																			on_state[0]	=	UseITPO_DSG_TinkturStr_besondere_01;
																			COUNT[2]	= 	DSG_TinkturStr_besondere_01;
																			COUNT[3]	= 	DSG_TimeTinkturStr_besondere_01/60;};
instance ITPO_DSG_TinkturStr_besondere_02 (ITPO_DSG_TinkturStr_besondere){	visual 		=	"ITPO_DSG_TinkturStr_besondere_02.3ds";
																			on_state[0]	=	UseITPO_DSG_TinkturStr_besondere_02;
																			COUNT[2]	= 	DSG_TinkturStr_besondere_02;
																			COUNT[3]	= 	DSG_TimeTinkturStr_besondere_02/60;};
instance ITPO_DSG_TinkturStr_besondere_03 (ITPO_DSG_TinkturStr_besondere){	visual 		=	"ITPO_DSG_TinkturStr_besondere_03.3ds";
																			on_state[0]	=	UseITPO_DSG_TinkturStr_besondere_03;
																			COUNT[2]	= 	DSG_TinkturStr_besondere_03;
																			COUNT[3]	= 	DSG_TimeTinkturStr_besondere_03/60;};												
FUNC VOID UseITPO_DSG_TinkturStr_besondere_01(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturStr(DSG_TinkturStr_besondere_01, DSG_TimeTinkturStr_besondere_01);
	};	
};
FUNC VOID UseITPO_DSG_TinkturStr_besondere_02(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturStr(DSG_TinkturStr_besondere_02, DSG_TimeTinkturStr_besondere_02);
	};	
};
FUNC VOID UseITPO_DSG_TinkturStr_besondere_03(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturStr(DSG_TinkturStr_besondere_03, DSG_TimeTinkturStr_besondere_03);
	};
};
//
/******************************************************************************************/
// Напитки временного эффекта: Настойка охотника (%ловкость%)
/******************************************************************************************/

prototype ITPO_DSG_TinkturDex_wenig(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_TinkturDex_wenig;	
	visual 			=	"ITPO_DSG_TinkturDex_wenig_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 
	description		= 	"Настойка охотника";
	TEXT[2]			= 	NAME_Bonus_Dex;
	TEXT[3]			= 	NAME_Duration;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};
instance ITPO_DSG_TinkturDex_wenig_01 (ITPO_DSG_TinkturDex_wenig){	visual 		=	"ITPO_DSG_TinkturDex_wenig_01.3ds";
																	on_state[0]	=	UseITPO_DSG_TinkturDex_wenig_01;
																	COUNT[2]	= 	DSG_TinkturDex_wenig_01;
																	COUNT[3]	= 	DSG_TimeTinkturDex_wenig_01/60;};
instance ITPO_DSG_TinkturDex_wenig_02 (ITPO_DSG_TinkturDex_wenig){	visual 		=	"ITPO_DSG_TinkturDex_wenig_02.3ds";
																	on_state[0]	=	UseITPO_DSG_TinkturDex_wenig_02;
																	COUNT[2]	= 	DSG_TinkturDex_wenig_02;
																	COUNT[3]	= 	DSG_TimeTinkturDex_wenig_02/60;};
instance ITPO_DSG_TinkturDex_wenig_03 (ITPO_DSG_TinkturDex_wenig){	visual 		=	"ITPO_DSG_TinkturDex_wenig_03.3ds";
																	on_state[0]	=	UseITPO_DSG_TinkturDex_wenig_03;
																	COUNT[2]	= 	DSG_TinkturDex_wenig_03;
																	COUNT[3]	= 	DSG_TimeTinkturDex_wenig_03/60;};

FUNC VOID UseITPO_DSG_TinkturDex_wenig_01(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturDex(DSG_TinkturDex_wenig_01, DSG_TimeTinkturDex_wenig_01);
	};
};
FUNC VOID UseITPO_DSG_TinkturDex_wenig_02(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturDex(DSG_TinkturDex_wenig_02, DSG_TimeTinkturDex_wenig_02);
	};	
};
FUNC VOID UseITPO_DSG_TinkturDex_wenig_03(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturDex(DSG_TinkturDex_wenig_03, DSG_TimeTinkturDex_wenig_03);
	};	
};
//
/******************************************************************************************/
// Напитки временного эффекта: Особая настойка охотника (%ловкость%)
/******************************************************************************************/

prototype ITPO_DSG_TinkturDex_besondere(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_TinkturDex_besondere;
	visual 			=	"ITPO_DSG_TinkturDex_besondere_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER";
	description		= 	"Особая настойка война";
	TEXT[2]			= 	NAME_Bonus_Dex;
	TEXT[3]			= 	NAME_Duration;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};
instance ITPO_DSG_TinkturDex_besondere_01 (ITPO_DSG_TinkturDex_besondere){	visual 		=	"ITPO_DSG_TinkturDex_besondere_01.3ds";
																			on_state[0]	=	UseITPO_DSG_TinkturDex_besondere_01;
																			COUNT[2]	= 	DSG_TinkturDex_besondere_01;
																			COUNT[3]	= 	DSG_TimeTinkturDex_besondere_01/60;};
instance ITPO_DSG_TinkturDex_besondere_02 (ITPO_DSG_TinkturDex_besondere){	visual 		=	"ITPO_DSG_TinkturDex_besondere_02.3ds";
																			on_state[0]	=	UseITPO_DSG_TinkturDex_besondere_02;
																			COUNT[2]	= 	DSG_TinkturDex_besondere_02;
																			COUNT[3]	= 	DSG_TimeTinkturDex_besondere_02/60;};
instance ITPO_DSG_TinkturDex_besondere_03 (ITPO_DSG_TinkturDex_besondere){	visual 		=	"ITPO_DSG_TinkturDex_besondere_03.3ds";
																			on_state[0]	=	UseITPO_DSG_TinkturDex_besondere_03;
																			COUNT[2]	= 	DSG_TinkturDex_besondere_03;
																			COUNT[3]	= 	DSG_TimeTinkturDex_besondere_03/60;};												
FUNC VOID UseITPO_DSG_TinkturDex_besondere_01(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturDex(DSG_TinkturDex_besondere_01, DSG_TimeTinkturDex_besondere_01);
	};
};
FUNC VOID UseITPO_DSG_TinkturDex_besondere_02(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturDex(DSG_TinkturDex_besondere_02, DSG_TimeTinkturDex_besondere_02);
	};
};
FUNC VOID UseITPO_DSG_TinkturDex_besondere_03(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturDex(DSG_TinkturDex_besondere_03, DSG_TimeTinkturDex_besondere_03);
	};
};
//
/******************************************************************************************/	
// Напитки временного эффекта: Зелье Ботье (%сила, ловкость%)
/******************************************************************************************/

prototype ITPO_DSG_TinkturBotje_wenig(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_TinkturBotje_wenig;	
	visual 			=	"ITPO_DSG_TinkturBotje_wenig_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 
	description		= 	"Настойка Ботье";
	TEXT[1]			= 	NAME_Bonus_Str;
	TEXT[2]			= 	NAME_Bonus_Dex;
	TEXT[3]			= 	NAME_Duration;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};
INSTANCE ITPO_DSG_TinkturBotje_wenig_01 (ITPO_DSG_TinkturBotje_wenig){ visual 	=	"ITPO_DSG_TinkturBotje_wenig_01.3DS";
																	   on_state[0] =	UseITPO_DSG_TinkturBotje_wenig_01;
																	   COUNT[1]	= 	DSG_TinkturBotje_wenig_str_01;			
																	   COUNT[2]	= 	DSG_TinkturBotje_wenig_dex_01;				
																	   COUNT[3]	= 	DSG_TimeTinkturBotje_wenig_01/60;};
INSTANCE ITPO_DSG_TinkturBotje_wenig_02 (ITPO_DSG_TinkturBotje_wenig){ visual 	=	"ITPO_DSG_TinkturBotje_wenig_02.3DS";
																	   on_state[0] =	UseITPO_DSG_TinkturBotje_wenig_02;
																	   COUNT[1]	= 	DSG_TinkturBotje_wenig_str_02;			
																	   COUNT[2]	= 	DSG_TinkturBotje_wenig_dex_02;								
																	   COUNT[3]	= 	DSG_TimeTinkturBotje_wenig_02/60;};
INSTANCE ITPO_DSG_TinkturBotje_wenig_03 (ITPO_DSG_TinkturBotje_wenig){ visual 	=	"ITPO_DSG_TinkturBotje_wenig_03.3DS";
																	   on_state[0] =	UseITPO_DSG_TinkturBotje_wenig_03;
																	   COUNT[1]	= 	DSG_TinkturBotje_wenig_str_03;			
																	   COUNT[2]	= 	DSG_TinkturBotje_wenig_dex_03;									
																	   COUNT[3]	= 	DSG_TimeTinkturBotje_wenig_03/60;
};
FUNC VOID UseITPO_DSG_TinkturBotje_wenig_01(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturBotje_wenig(DSG_TinkturBotje_wenig_str_01,DSG_TinkturBotje_wenig_dex_01,DSG_TimeTinkturBotje_wenig_01);
	};
};	
FUNC VOID UseITPO_DSG_TinkturBotje_wenig_02(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturBotje_wenig(DSG_TinkturBotje_wenig_str_02,DSG_TinkturBotje_wenig_dex_02,DSG_TimeTinkturBotje_wenig_02);
	};
};

FUNC VOID UseITPO_DSG_TinkturBotje_wenig_03(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturBotje_wenig(DSG_TinkturBotje_wenig_str_03,DSG_TinkturBotje_wenig_dex_03,DSG_TimeTinkturBotje_wenig_03);
	};
};
//
/******************************************************************************************/	
// Напитки временного эффекта: Настойка могущества (%сила, ловкость, макс.жизнь%)
/******************************************************************************************/

prototype ITPO_DSG_TinkturBotje_besondere(C_Item)
{
	name 			=	NAME_Trank;
	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;
	value 			=	Value_DSG_TinkturBotje_besondere;	
	visual 			=	"ITPO_DSG_TinkturBotje_besondere_01.3ds";
	material 		=	MAT_GLAS;
	scemeName		=	"POTIONFAST";
	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 
	description		= 	"Настойка могущества";
	TEXT[1]			= 	NAME_Bonus_Str;
	TEXT[2]			= 	NAME_Bonus_Dex;
	TEXT[3]			= 	NAME_Bonus_HpMax;
	TEXT[4]			= 	NAME_Duration;
	TEXT[5]			= 	NAME_Value;
	COUNT[5]		= 	value;
};
INSTANCE ITPO_DSG_TinkturBotje_besondere_01 (ITPO_DSG_TinkturBotje_besondere){ visual 	=	"ITPO_DSG_TinkturBotje_besondere_01.3DS";
																			   on_state[0] =	UseITPO_DSG_TinkturBotje_besondere_01;
																			   COUNT[1]	= 	DSG_TinkturBotje_besondere_str_01;			
																			   COUNT[2]	= 	DSG_TinkturBotje_besondere_dex_01;				
																			   COUNT[3]	= 	DSG_TinkturBotje_besondere_hp_01;					
																			   COUNT[4]	= 	DSG_TimeTinkturBotje_besondere_01/60;};
INSTANCE ITPO_DSG_TinkturBotje_besondere_02 (ITPO_DSG_TinkturBotje_besondere){ visual 	=	"ITPO_DSG_TinkturBotje_besondere_02.3DS";
																			   on_state[0] =	UseITPO_DSG_TinkturBotje_besondere_02;
																			   COUNT[1]	= 	DSG_TinkturBotje_besondere_str_02;			
																			   COUNT[2]	= 	DSG_TinkturBotje_besondere_dex_02;				
																			   COUNT[3]	= 	DSG_TinkturBotje_besondere_hp_02;					
																			   COUNT[4]	= 	DSG_TimeTinkturBotje_besondere_02/60;};
INSTANCE ITPO_DSG_TinkturBotje_besondere_03 (ITPO_DSG_TinkturBotje_besondere){ visual 	=	"ITPO_DSG_TinkturBotje_besondere_03.3DS";
																			   on_state[0] =	UseITPO_DSG_TinkturBotje_besondere_03;
																			   COUNT[1]	= 	DSG_TinkturBotje_besondere_str_03;			
																			   COUNT[2]	= 	DSG_TinkturBotje_besondere_dex_03;				
																			   COUNT[3]	= 	DSG_TinkturBotje_besondere_hp_03;					
																			   COUNT[4]	= 	DSG_TimeTinkturBotje_besondere_03/60;
};
FUNC VOID UseITPO_DSG_TinkturBotje_besondere_01(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturBotje_besondere(DSG_TinkturBotje_besondere_str_01,DSG_TinkturBotje_besondere_dex_01,DSG_TinkturBotje_besondere_hp_01,DSG_TimeTinkturBotje_besondere_01);
	};
};	
FUNC VOID UseITPO_DSG_TinkturBotje_besondere_02(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturBotje_besondere(DSG_TinkturBotje_besondere_str_02,DSG_TinkturBotje_besondere_dex_02,DSG_TinkturBotje_besondere_hp_02,DSG_TimeTinkturBotje_besondere_02);
	};
};
FUNC VOID UseITPO_DSG_TinkturBotje_besondere_03(){ 
	if(self.id == 0){
		UseITPO_DSG_TinkturBotje_besondere(DSG_TinkturBotje_besondere_str_03,DSG_TinkturBotje_besondere_dex_03,DSG_TinkturBotje_besondere_hp_03,DSG_TimeTinkturBotje_besondere_03);
	};
};
