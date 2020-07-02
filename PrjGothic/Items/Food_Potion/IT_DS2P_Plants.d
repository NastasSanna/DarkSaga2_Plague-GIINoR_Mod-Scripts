

const int Value_DemonTongue = 50;
const int Mana_DemonTongue = 20;
const int HP_DemonTongue = -15;
const int Bomus_DemonTongue_ManaMax = 10;
const int Bomus_DemonTongue_Count = 5;

// ЯЗЫК ДЕМОНА ====================================
// Нужен по квесту 
// Уром здоровью, восст. ману. Бонус маны
instance ItPl_DemonTongue(C_Item)	
{
	name = "Язык демона";
	description = name;
	
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	
	visual = "ItPl_DemonTongue.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DemonTongue;
	scemeName = "FOOD";
	
	value = Value_DemonTongue;
	text[0] = "Лепесток похож на высунутый язык.";

	text[2] = NAME_AntiBonus_HP;
	count[2] = HP_DemonTongue;
	text[3] = NAME_Bonus_Mana;
	count[3] = Mana_DemonTongue;
	
	text[5] = NAME_Value;
	count[5] = Value_DemonTongue;
};
// ---------------------------
var int Bonus_DemonTongue_Counter;
func void Use_DemonTongue()
{
	if (self.attribute[ATR_HITPOINTS] + HP_DemonTongue > 0) {
		self.attribute[ATR_HITPOINTS] += HP_DemonTongue;
	}
	else {
		self.attribute[ATR_HITPOINTS] = 1;
	};
	self.attribute[ATR_MANA] += Mana_DemonTongue;
	// бонус маны
	if (C_NpcIsHero(self)) {
		Bonus_DemonTongue_Counter += 1;
		if (Bonus_DemonTongue_Counter == Bomus_DemonTongue_Count) {
			B_RaiseAttribute(self,ATR_MANA_MAX,Bomus_DemonTongue_ManaMax);
			Npc_ChangeAttribute(self,ATR_MANA,Bomus_DemonTongue_ManaMax);	
		};
	};
};
// ================================================
