
func void S_Sword2x2_equip_new()
{
	// при загрузке игры в начале игровой сессии вставка сохраненных npc идет до вызова startup!
	// без инициализации Икаруса - вылет
	INIT_Ikarus_Lego();
	
//	MEM_DEBUG("S_Sword2x2_equip_new");
	if (self.aivar[AIV_ShieldEquipped] == FALSE)	{
//		MEM_DEBUG("aivar[AIV_ShieldEquipped] = TRUE");
		
		B_CreateShieldSlots(self);
		
		if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_SECOND)
		{	Mdl_ApplyOverlayMds(self,"Hum_2x2L3.MDS");
		}
		else if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_FIRST)
		{	Mdl_ApplyOverlayMds(self,"Hum_2x2L2.MDS");
		};
		/*else if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_NONE)
		{
			Print("Я не знаю, как этим пользоваться!");
			AI_UnequipWeapons(self);
		};*/
		self.aivar[AIV_ShieldEquipped] = ITEM_DAG;
	};
};

func void S_Sword2x2_unequip_new()
{
//	MEM_DEBUG("S_Sword2x2_unequip_new");
	if (self.aivar[AIV_ShieldEquipped] >= ITEM_DAG)	{
		MEM_DEBUG("aivar[AIV_ShieldEquipped] = FALSE");
		Mdl_RemoveOverlayMds(self,"Hum_2x2L3.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_2x2L2.MDS");
		self.aivar[AIV_ShieldEquipped] = FALSE;
	};
};

//**************Бой с 2 мечами/меч и клинок*********************
func void S_Sword2x2_equip()
{
	if(Npc_IsPlayer(self) || (self.id == 0))
	{
		if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_SECOND)
		{	Mdl_ApplyOverlayMds(self,"Hum_2x2L3.MDS");
		}
		else if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_FIRST)
		{	Mdl_ApplyOverlayMds(self,"Hum_2x2L2.MDS");
		}
		else if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_NONE)
		{
			Print("Я не знаю, как этим пользоваться!");
			AI_UnequipWeapons(self);
		};
		Second_Melee_Weapon_Equipped = TRUE;
	};	
};
func void S_Sword2x2_unequip()
{
	if(Npc_IsPlayer(self) || (self.id == 0))
	{
		Mdl_RemoveOverlayMds(self,"Hum_2x2L3.MDS");
		Mdl_RemoveOverlayMds(self,"Hum_2x2L2.MDS");
		Second_Melee_Weapon_Equipped = FALSE;
	};	 
};
instance ITMW_DS_FakeSword_2x2_1H(C_Item)	//Фейк для первой руки
{
	name = "Чудо-клинок";description = name;
	mainflag = ITEM_KAT_NF;	flags = ITEM_SWD;
	material = MAT_METAL;
	damagetype = DAM_EDGE;
	value = 40000;
	damageTotal = 530;	
	range = 200;
	on_equip = S_Sword2x2_equip;
	on_unequip = S_Sword2x2_unequip;
};
instance ITMW_DS_FakeSword_2x2(C_Item)	//Фейк для второй руки
{
	name = "Клинок";description = name;
	mainflag = ITEM_KAT_FF;	flags = ITEM_CROSSBOW;
	material = MAT_METAL;
	damagetype = DAM_POINT;
	value = 40000;
	damageTotal = 530;	
	weight = 3;	//range = 40;
	munition = ItRw_Bolt_01;
	visual = "ItMw_DarkSaga_2x2_Dagger_1.3DS";
	on_equip = S_Sword2x2_equip;
	on_unequip = S_Sword2x2_unequip;
};
//-/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/-
//---------РЕАЛЬНЫЕ МЕЧИ ДЛЯ ВТОРОЙ РУКИ В ИГРЕ
//-\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\-

//--------------------------------------------------------------
//Шип. Даёт крестьянин ^Харок^ в награду за квест ^Рыбное дело^
//--------------------------------------------------------------
const int Value_DSG_Sword_2x2_Spike = 400;
const int Damage_DSG_Sword_2x2_Spike = 30;
const int Range_DSG_Sword_2x2_Spike = 40;
const int Cond_STR_DSG_Sword_2x2_Spike = 30;
instance ITMW_DSG_Sword_2x2_01(C_Item)
{
	name = "Шип";description = name;
	damageTotal = Damage_DSG_Sword_2x2_Spike;
	range = Range_DSG_Sword_2x2_Spike;
	cond_value[2] = Cond_STR_DSG_Sword_2x2_Spike;	//ATR_STRENGTH
	value = Value_DSG_Sword_2x2_Spike;
	visual = "ItMw_DarkSaga_2x2_Dagger_1.3DS";		
	count[1] = damageTotal;
	count[2] = cond_value[2];
	count[5] = value;
};

instance ITMW_DarkSaga_Sword_2x2_02(C_Item)
{
	name = "Укус ястреба";description = name;	
	damageTotal = 25;
	range = 50;
	cond_value[2] = 25;	//ATR_STRENGTH
	value = 300;
	visual = "ITMW_DS_2x2L2_01.3DS";	
	count[1] = damageTotal;
	count[2] = cond_value[2];
	count[5] = value;
};
instance ITMW_DarkSaga_Sword_2x2_03(C_Item)
{
	name = "Кровавое жало";description = name;
	damageTotal = 20;
	range = 70;	
	cond_value[2] = 20;	//ATR_STRENGTH
	value = 300;
	visual = "ITMW_DS_2x2_03.3DS";
	count[1] = damageTotal;
	count[2] = cond_value[2];
	count[5] = value;
};
instance ITMW_DarkSaga_Sword_2x2_04(C_Item) //Билли дает
{
	name = "Дар смерти";description = name;
	damageTotal = 20;
	range = 105;
	cond_value[2] = 20;	//ATR_STRENGTH
	value = 300;
	visual = "ITMW_DS_2x2_04.3DS";
	count[1] = damageTotal;
	count[2] = cond_value[2];
	count[5] = value;
};
instance ITMW_DarkSaga_Sword_2x2_05(C_Item) //Билли дает
{
	name = "Улыбка Белиара";description = name;
	damageTotal = 20;
	range = 65;
	cond_value[2] = 20;	//ATR_STRENGTH
	value = 300;
	visual = "ITMW_DS_2x2_05.3DS";
	count[1] = damageTotal;
	count[2] = cond_value[2];
	count[5] = value;
};
