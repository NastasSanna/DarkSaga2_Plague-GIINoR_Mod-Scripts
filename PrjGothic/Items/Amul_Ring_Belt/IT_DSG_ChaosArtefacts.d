
//*********************** АРТЕФАКТЫ ХАОСА ***************************
// текущий результат зачарования
	//амулет
var int ChaosAmulette_type;		//общий тип (атрибут, навык, защита...)
var int ChaosAmulette_subtype;	//конкретный тип (ловкость, сила...)	
var int ChaosAmulette_value;		//величина, м.б. < 0
	//кольцо с алмазом
var int ChaosRing1_type;	
var int ChaosRing1_subtype;	
var int ChaosRing1_value;	
	//кольцо с сапфиром
var int ChaosRing2_type;	
var int ChaosRing2_subtype;	
var int ChaosRing2_value;
//какой артефакт
	const int Chaos_Amulette = 1;
	const int Chaos_Ring1 = 2;
	const int Chaos_Ring2 = 3;
//общий тип эффекта
	const int ChaosCharge_None		= 0;
	const int ChaosCharge_Atr		= 1;
	const int ChaosCharge_Talent	= 2;
	const int ChaosCharge_Prot		= 3;
	const int ChaosCharge_Acrobat	= 4;
	const int ChaosCharge_Sprint	= 5;
	const int ChaosCharge_Max	= 6;

//-------------------------------------------------------------
// генерируем случайный эффект
func void B_DSG_SetRandomChaosEffect(var int ArtefactInst)
{
	// генерируем эффект
	var int RndEffect_type;
	var int RndEffect_subtype;
	var int RndEffect_value;
	var int rnd;	rnd = C_Random(1000);
	MEM_DEBUG(ConcatStrings("rnd = ",IntToString(rnd)));
	if (rnd < 10)	{	//1% - ускорение
		RndEffect_type = ChaosCharge_Sprint;
	}
	else if (rnd < 60)	{	//5% - акробатика
		RndEffect_type = ChaosCharge_Acrobat;
	}
	else	{	//остальные 94% поровну (на 22 возможных эффекта)
		rnd = (rnd - 60) * 22 / 940;
		if (rnd % 2 == 1)	{	//нечет.
			RndEffect_value = -1;	//=> отриц. эффект
		}
		else	{	//чет.
			RndEffect_value = 1;	//=> положит. эффект
		};
		rnd = rnd / 2;	// сокращаем до 11 вариантов без учета +/-
		//общий тип эффекта
		RndEffect_type = rnd / 4 + 1;	//=1..3
		//конкретный тип эффекта
		if (rnd == 0)	{	RndEffect_subtype = ATR_HITPOINTS_MAX;} else
		if (rnd == 1)	{	RndEffect_subtype = ATR_MANA_MAX;} else
		if (rnd == 2)	{	RndEffect_subtype = ATR_DEXTERITY;} else
		if (rnd == 3)	{	RndEffect_subtype = ATR_STRENGTH;} else
		if (rnd == 4)	{	RndEffect_subtype = NPC_TALENT_1H;} else
		if (rnd == 5)	{	RndEffect_subtype = NPC_TALENT_2H;} else
		if (rnd == 6)	{	RndEffect_subtype = NPC_TALENT_BOW;} else
		if (rnd == 7)	{	RndEffect_subtype = NPC_TALENT_CROSSBOW;} else
		if (rnd == 8)	{	RndEffect_subtype = PROT_EDGE;} else
		if (rnd == 9)	{	RndEffect_subtype = PROT_POINT;} else
		if (rnd == 10)	{	RndEffect_subtype = PROT_MAGIC;};
		//величина эффекта
		if (rnd < 2)	{	RndEffect_value = RndEffect_value * 20;} else	
		if (rnd < 8)	{	RndEffect_value = RndEffect_value * 5;} else	
						{	RndEffect_value = RndEffect_value * 10;};
	};
		MEM_DEBUG(ConcatStrings("RndEffect_type = ",IntToString(RndEffect_type)));
		MEM_DEBUG(ConcatStrings("RndEffect_subtype = ",IntToString(RndEffect_subtype)));
		MEM_DEBUG(ConcatStrings("RndEffect_value = ",IntToString(RndEffect_value)));
	// назначаем то, что получилось, артефакту
	if (ArtefactInst == Chaos_Amulette)	{
		MEM_DEBUG("Set ItAm_DSG_Chaos_Charged");
		ChaosAmulette_type = RndEffect_type;
		ChaosAmulette_subtype = RndEffect_subtype;
		ChaosAmulette_value = RndEffect_value;
	}
	else if (ArtefactInst == Chaos_Ring1)	{
		MEM_DEBUG("Set ItRi_DSG_Chaos1_Charged");
		ChaosRing1_type = RndEffect_type;
		ChaosRing1_subtype = RndEffect_subtype;
		ChaosRing1_value = RndEffect_value;
	}
	else if (ArtefactInst == Chaos_Ring2)	{
		MEM_DEBUG("Set ItRi_DSG_Chaos2_Charged");
		ChaosRing2_type = RndEffect_type;
		ChaosRing2_subtype = RndEffect_subtype;
		ChaosRing2_value = RndEffect_value;
	};
};

//-------------------------------------------------------------
// эффект от артефакта
func void B_DSG_ChaosArtefacts(var int ArtefactInst, var int Action)
{
	if (!Npc_IsPlayer(self))	{	return;	};
	MEM_DEBUG(ConcatStrings("B_DSG_ChaosArtefacts ",IntToString(Action)));
	// эффект от какого артефакта
	var int Effect_type;
	var int Effect_subtype;
	var int Effect_value;
	if (ArtefactInst == Chaos_Amulette)	{
		MEM_DEBUG("Get ItAm_DSG_Chaos_Charged");
		Effect_type = ChaosAmulette_type;
		Effect_subtype = ChaosAmulette_subtype;
		Effect_value = ChaosAmulette_value;
	}
	else if (ArtefactInst == Chaos_Ring1)	{
		MEM_DEBUG("Get ItRi_DSG_Chaos1_Charged");
		Effect_type = ChaosRing1_type;
		Effect_subtype = ChaosRing1_subtype;
		Effect_value = ChaosRing1_value;
	}
	else if (ArtefactInst == Chaos_Ring2)	{
		MEM_DEBUG("Get ItRi_DSG_Chaos2_Charged");
		Effect_type = ChaosRing2_type;
		Effect_subtype = ChaosRing2_subtype;
		Effect_value = ChaosRing2_value;
	};
	MEM_DEBUG(ConcatStrings("Effect_type = ",IntToString(Effect_type)));
	MEM_DEBUG(ConcatStrings("Effect_subtype = ",IntToString(Effect_subtype)));
	MEM_DEBUG(ConcatStrings("Effect_value = ",IntToString(Effect_value)));
	var string msg;
	var int diff;	diff = Action * Effect_value;
	// бонус/штраф к атрибутам
	if (Effect_type == ChaosCharge_Atr)	{
		Npc_ChangeAttribute(self,Effect_subtype, diff);
		if (Effect_subtype == ATR_HITPOINTS_MAX)	{
			Npc_ChangeAttribute(self,ATR_HITPOINTS, diff);
		};
		if (Effect_subtype == ATR_MANA_MAX)	{
			Npc_ChangeAttribute(self,ATR_MANA, diff);
		};
//		if (Action > 0)	{
			if (Effect_value > 0)	{
				msg = MEM_ReadStatStringArr(TXT_Chaos_AtrBounus,Effect_subtype);
			}
			else	{
				msg = MEM_ReadStatStringArr(TXT_Chaos_AtrAntiBounus,Effect_subtype);
			};
			msg = ConcatStrings(msg, IntToString(Effect_value));
//		};
	}
	// бонус/штраф к владению оружием
	else if (Effect_type == ChaosCharge_Talent)	{
		B_AddFightSkill(self,Effect_subtype, diff);
//		if (Action > 0)	{
			if (Effect_value > 0)	{
				msg = MEM_ReadStatStringArr(TXT_Chaos_TalBounus,Effect_subtype-1);
			}
			else	{
				msg = MEM_ReadStatStringArr(TXT_Chaos_TalAntiBounus,Effect_subtype-1);
			};
			msg = ConcatStrings(msg, IntToString(Effect_value));
//		};
	}
	// бонус/штраф к защите
	else if (Effect_type == ChaosCharge_Prot)	{
		B_GiveBonusProt(self,Effect_subtype,diff);
//		if (Action > 0)	{
			if (Effect_value > 0)	{
				if (Effect_subtype == PROT_EDGE)	{
					msg = MEM_ReadStatStringArr(TXT_Chaos_ProtBounus,0);
				}
				else if (Effect_subtype == PROT_POINT)	{
					msg = MEM_ReadStatStringArr(TXT_Chaos_ProtBounus,1);
				}
				else if (Effect_subtype == PROT_MAGIC)	{
					msg = MEM_ReadStatStringArr(TXT_Chaos_ProtBounus,2);
				};	
			}
			else	{
				if (Effect_subtype == PROT_EDGE)	{
					msg = MEM_ReadStatStringArr(TXT_Chaos_ProtAntiBounus,0);
				}
				else if (Effect_subtype == PROT_POINT)	{
					msg = MEM_ReadStatStringArr(TXT_Chaos_ProtAntiBounus,1);
				}
				else if (Effect_subtype == PROT_MAGIC)	{
					msg = MEM_ReadStatStringArr(TXT_Chaos_ProtAntiBounus,2);
				};	
			};
			msg = ConcatStrings(msg, IntToString(Effect_value));
//		};
	}
	// бонус акробатики
	else if (Effect_type == ChaosCharge_Acrobat)	{
		if (Action > 0)	{
			B_SetTalentAcrobat(self,1);
		}
		else	{
			B_SetTalentAcrobat(self,0);
		};
			msg = TXT_Chaos_AcrobatBonus;
	}
	// бонус ускорения
	else if (Effect_type == ChaosCharge_Sprint)	{
		if (Action > 0)	{
			B_SetPermSprint(self,TRUE);
		}
		else	{
			B_SetPermSprint(self,FALSE);
		};
			msg = TXT_Chaos_SprintBonus;
	};
	// выдаем сообщение
	if (Action > 0)	{
		PrintScreen(msg,-1,60,FONT_Screen,3);
	};
		MEM_DEBUG(msg);
};


//===========================================================
// получаем по квесту "Мой дрйг Саймон!"
// UNFINISHED
prototype ItAm_DSG_ChaosProto(C_ITEM)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;	flags = ITEM_AMULET;
	material = MAT_METAL;
	visual = "ItAm_DSG_Chaos.3ds";
	wear = WEAR_EFFECT;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};
instance ItAm_DSG_Chaos_Discharged(ItAm_DSG_ChaosProto)
{
	description = "Железный амулет";
	text[1] = "Странный амулет,";
	text[2] = "подаренный мне Саймоном";
	text[4] = "Бесполезен?";
	
};
instance ItAm_DSG_Chaos_Charged(ItAm_DSG_ChaosProto)
{
	description = "Амулет Хаоса";
	on_equip = ItAm_DSG_Chaos_Equip;
	on_unequip = ItAm_DSG_Chaos_Unequip;
	effect = "SPELLFX_ITEMGLIMMER_VIOLET";
	text[1] = "Амулет заряжен кровью";
	text[4] = "Результат зачарования случаен";
};
func void ItAm_DSG_Chaos_Equip()
{
	B_DSG_ChaosArtefacts(Chaos_Amulette,+1);
};
func void ItAm_DSG_Chaos_Unequip()
{
	B_DSG_ChaosArtefacts(Chaos_Amulette,-1);
};


//-------------------------------------------------------------
//«Кольцо Хаоса» (с алмазом),
// можно найти на локации
// UNFINISHED
prototype ItRi_DSG_ChaosProto1(C_ITEM)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;	flags = ITEM_RING;
	material = MAT_METAL;
	visual = "ItRi_DSG_Chaos1.3ds";
	wear = WEAR_EFFECT;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotx = -30;
	inv_roty = -60;
	inv_rotz = 15;
};
instance ItRi_DSG_Chaos1_Discharged(ItRi_DSG_ChaosProto1)
{
	description = "Кольцо с алмазом";
	text[1] = "Необычное кольцо";
	text[2] = "Неограненный алмаз тусклый и мутный";
	text[4] = "Бесполезно?";
	
};
instance ItRi_DSG_Chaos1_Charged(ItRi_DSG_ChaosProto1)
{
	description = "Алмазное кольцо Хаоса";
	on_equip = Equip_DSG_ChaosRing1;
	on_unequip = Unequip_DSG_ChaosRing1;
	effect = "SPELLFX_WEAKGLIMMER";
	text[1] = "Кольцо заряжено кровью";
	text[2] = "Алмаз сверкает и переливается";
	text[4] = "Результат зачарования случаен";
};
func void Equip_DSG_ChaosRing1()
{
	B_DSG_ChaosArtefacts(Chaos_Ring1,+1);
};
func void Unequip_DSG_ChaosRing1()
{
	B_DSG_ChaosArtefacts(Chaos_Ring1,-1);
};


//-------------------------------------------------------------
//«Кольцо Хаоса» (с сапфиром),
// можно найти на локации
// UNFINISHED
prototype ItRi_DSG_ChaosProto2(C_ITEM)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;	flags = ITEM_RING;
	material = MAT_METAL;
	visual = "ItRi_DSG_Chaos2.3ds";
	wear = WEAR_EFFECT;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotx = -30;
	inv_roty = -60;
	inv_rotz = 15;
};
instance ItRi_DSG_Chaos2_Discharged(ItRi_DSG_ChaosProto2)
{
	description = "Кольцо с сапфиром";
	text[1] = "Необычное кольцо";
	text[2] = "Сапфир в кольце темный";
	text[4] = "Бесполезно?";
	
};
instance ItRi_DSG_Chaos2_Charged(ItRi_DSG_ChaosProto2)
{
	description = "Сапфировое кольцо Хаоса";
	on_equip = Equip_DSG_ChaosRing2;
	on_unequip = Unequip_DSG_ChaosRing2;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	text[1] = "Кольцо заряжено кровью";
	text[2] = "В глубине сапфира сияют звезды";
	text[4] = "Результат зачарования случаен";
};
func void Equip_DSG_ChaosRing2()
{
	B_DSG_ChaosArtefacts(Chaos_Ring2,+1);
};
func void Unequip_DSG_ChaosRing2()
{
	B_DSG_ChaosArtefacts(Chaos_Ring2,-1);
};
