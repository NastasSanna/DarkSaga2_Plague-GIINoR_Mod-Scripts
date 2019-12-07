var int Fish_DS2P_Bonus_1;
const int HP_DS2P_Fish_1 = 50;	//кол-во ХП в процентах
const int Value_DS2P_Fish_1 = 20;
instance ItFo_DS2P_FishSea_1(C_Item)
{
	name = "Рыба"; description = "Морская рыба";
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI;material = MAT_LEATHER;
	visual = "ItFo_DSG_FishSea.3DS";
	scemeName = "FOODHUGE";
	on_state[0] = Use_DS2P_FishSea;
	value = Value_DS2P_Fish_1;
	text[1] = "Похожа на съедобную";
	text[3] = NAME_Bonus_HP_DS;	count[3] = HP_DS2P_Fish_1;
	text[5] = NAME_Value;	count[5] = value;
};
instance ItFo_DS2P_FishSea_2(C_Item)
{
	name = "Рыба"; description = "Морская рыба";
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI;material = MAT_LEATHER;
	visual = "ItFo_DSG_FishSea_1.3DS";
	scemeName = "FOODHUGE";
	on_state[0] = Use_DS2P_FishSea;
	value = Value_DS2P_Fish_1;
	text[1] = "Похожа на съедобную";
	text[3] = NAME_Bonus_HP_DS;	count[3] = HP_DS2P_Fish_1;
	text[5] = NAME_Value;	count[5] = value;
};
func void Use_DS2P_FishSea()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]*HP_DS2P_Fish_1/100);
	if(self.id == 0)
	{
		Fish_DS2P_Bonus_1 += 1;
		if(Fish_DS2P_Bonus_1 == 40)
		{
			B_RaiseAttribute(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
			Fish_DS2P_Bonus_1 = 0;
		};
	};
};
/*----------------------------------------------------------------------*/
// СУП МАРИИ
// Дает крест-ка ^Мария^
/*----------------------------------------------------------------------*/
const int HP_DS2P_StewMaria = 10;
instance ItFo_DS2P_StewMaria(C_Item)
{
	name = "Суп"; description = "Суп Марии";
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI;
	value = Value_Stew;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemeName = "RICE";
	on_state[0] = Use_DS2P_StewMaria;	
	text[1] = NAME_Bonus_HPMax;
	count[1] = HP_DS2P_StewMaria;
	text[5] = NAME_Value;
	count[5] = Value_Stew;
};
func void Use_DS2P_StewMaria()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_DS2P_StewMaria);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_DS2P_StewMaria);
};
/*----------------------------------------------------------------------*/
// Выпивка без эффектов
// Для соревнования с пиратом ^Зедд^ом, больше нигде не появляется
/*----------------------------------------------------------------------*/
instance ItFo_DS2P_Booze_Zedd(C_Item)
{
	name = "Выпивка";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	description = name;
	text[1] = "Для соревнования с Зеддом";
};
/*----------------------------------------------------------------------*/
// ВЫПИВКА по рецептам (для ^Зедд^а)
// UNFINISHED
/*----------------------------------------------------------------------*/
const int Value_BullSeed	= 50;
const int Value_GobboSmile	= 50;
const int Value_Berserker	= 50;
const int Value_TrollBooze	= 50;
const int Value_MagicGrog	= 50;
const int Value_Kamikaze	= 50;

prototype ItFo_DS2P_BoozeProto(C_ITEM)
{
	mainflag = ITEM_KAT_FOOD;	flags = ITEM_MULTI;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	text[5] = NAME_Value;
};
// ------------------------------------------------------
instance ItFo_DS2P_BullSeed(ItFo_DS2P_BoozeProto)
{
	name = "Бычье семя";	description = name;
	value = Value_BullSeed;
	on_state[0] = Use_BullSeed;
	count[5] = value;
};
func void Use_BullSeed()
{
	//На 10 минут увеличивает силу на 10, здоровье на 20, уменьшает ловкость на 10 и ману на 20
};
// ------------------------------------------------------
instance ItFo_DS2P_GobboSmile(ItFo_DS2P_BoozeProto)
{
	name = "Улыбка гоблина";	description = name;
	value = Value_GobboSmile;
	on_state[0] = Use_GobboSmile;
	count[5] = value;
};
func void Use_GobboSmile()
{
	//На 5 минут увеличивает ловкость на 10, владение луком на 10%, уменьшает силу на 10
};
// ------------------------------------------------------
instance ItFo_DS2P_Berserker(ItFo_DS2P_BoozeProto)
{
	name = "Берсеркер";	description = name;
	value = Value_Berserker;
	on_state[0] = Use_Berserker;
	count[5] = value;
};
func void Use_Berserker()
{
	//На 5 минут уменьшает защиту от всего на 10, увеличивает владение всем оружием на 15%
};
// ------------------------------------------------------
instance ItFo_DS2P_TrollBooze(ItFo_DS2P_BoozeProto)
{
	name = "Троллиное пойло";	description = name;
	value = Value_TrollBooze;
	on_state[0] = Use_TrollBooze;
	count[5] = value;
};
func void Use_TrollBooze()
{
	//На 10 минут увеличивает здоровье на 50, защиту от оружия на 10, уменьшает ловкость на 10, владение любым оружием на 15%
};
// ------------------------------------------------------
instance ItFo_DS2P_MagicGrog(ItFo_DS2P_BoozeProto)
{
	name = "Магический грог";	description = name;
	value = Value_MagicGrog;
	on_state[0] = Use_MagicGrog;
	count[5] = value;
};
func void Use_MagicGrog()
{
	//На 10 минут увеличивает магию на 20, уменьшает здоровье на 30.
};
// ------------------------------------------------------
instance ItFo_DS2P_Kamikaze(ItFo_DS2P_BoozeProto)
{
	name = "Камикадзе";	description = name;
	value = Value_Kamikaze;
	on_state[0] = Use_Kamikaze;
	count[5] = value;
};
func void Use_Kamikaze()
{
	//На 5 минут увеличивает владение всем оружием на 30%, сила и ловкость повышаются на 5, здоровье падает до 1.
};
/*----------------------------------------------------------------------*/
// Орочий самогон
// Для квеста "Орк в беде". Он же имитирует лекарство
// Людям пить опасно
/*----------------------------------------------------------------------*/
instance ItFo_DS2P_OrcBooze(C_Item)
{
	name = "Орочий самогон";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	on_state[0] = Use_OrcBooze;
	description = name;
	text[1] = "Слишком крепкий для людей";
};
var int Use_OrcBooze_Once;
func void Use_OrcBooze()
{
	//что человеку смерть
	if (self.guild <= GIL_SEPERATOR_HUM)
	{
		//сносит половину здоровья
		if (self.attribute[ATR_HITPOINTS] >=  self.attribute[ATR_HITPOINTS_MAX] / 2)	{
			self.attribute[ATR_HITPOINTS] -= self.attribute[ATR_HITPOINTS_MAX] / 2;
			//у ГГ глюки
			if (Npc_IsPlayer(self))	{
				Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
				// немножко опыта рисковым ребятам
				if (!Use_OrcBooze_Once)	{
					Use_OrcBooze_Once = TRUE;
					B_GivePlayerXP(XP_Ambient);
				};
			};
		}
		else	{// или до смерти
			self.attribute[ATR_HITPOINTS] = 0;
		};
	};
	//то орку - лекарство
	if (C_NpcIs(self, Orc_DS2P_ArTush))
	{
		ArTush_Healed = TRUE;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];	//на всякий
	};
};
