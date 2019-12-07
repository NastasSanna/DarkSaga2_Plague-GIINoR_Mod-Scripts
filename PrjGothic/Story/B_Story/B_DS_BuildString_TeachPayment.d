//Получение множителя для установления цены обучения за навыки владения оружием (зависит от %-а )\\
func int b_DS_GetPaymentTalentMultiplier(var C_NPC her, var int talent, var int points)
{
	var int Multiplier;
	if(talent == NPC_TALENT_1H)
	{
		if((her.aivar[REAL_TALENT_1H] + points) > 120)			{	Multiplier = 5;	}
		else if((her.aivar[REAL_TALENT_1H] + points) > 90)	{	Multiplier = 4;	}
		else if((her.aivar[REAL_TALENT_1H] + points) > 70)	{	Multiplier = 3;	}
		else if((her.aivar[REAL_TALENT_1H] + points) > 40)	{	Multiplier = 2;	}
		else																								{	Multiplier = 1;	};
	}
	else if(talent == NPC_TALENT_2H)
	{
		if((her.aivar[REAL_TALENT_2H] + points) > 120)			{	Multiplier = 5;	}
		else if((her.aivar[REAL_TALENT_2H] + points) > 90)	{	Multiplier = 4;	}
		else if((her.aivar[REAL_TALENT_2H] + points) > 70)	{	Multiplier = 3;	}
		else if((her.aivar[REAL_TALENT_2H] + points) > 40)	{	Multiplier = 2;	}
		else																								{	Multiplier = 1;	};
	}
	else if(talent == NPC_TALENT_BOW)
	{
		if((her.aivar[REAL_TALENT_BOW] + points) > 120)		{	Multiplier = 5;	}
		else if((her.aivar[REAL_TALENT_BOW] + points) > 90){	Multiplier = 4;	}
		else if((her.aivar[REAL_TALENT_BOW] + points) > 70){	Multiplier = 3;	}
		else if((her.aivar[REAL_TALENT_BOW] + points) > 40){	Multiplier = 2;	}
		else																								{	Multiplier = 1;	};
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		if((her.aivar[REAL_TALENT_CROSSBOW] + points) > 120)			{	Multiplier = 5;	}
		else if((her.aivar[REAL_TALENT_CROSSBOW] + points) > 90)	{	Multiplier = 4;	}
		else if((her.aivar[REAL_TALENT_CROSSBOW] + points) > 70)	{	Multiplier = 3;	}
		else if((her.aivar[REAL_TALENT_CROSSBOW] + points) > 40)	{	Multiplier = 2;	}
		else																											{	Multiplier = 1;	};
	}
	else
	{		Multiplier = 1;
	};
	return Multiplier;
};
//Получение множителя для установления цены обучения за параметры (зависит от уровня параметра )\\
func int b_DS_GetPaymentAtrMultiplier(var C_NPC her, var int attribut, var int points)
{
	var int Multiplier;
	Multiplier = 0;
	if(attribut == ATR_STRENGTH)
	{
		if((her.aivar[REAL_STRENGTH] + points) > 120)			{	Multiplier = 5;	}
		else if((her.aivar[REAL_STRENGTH] + points) > 90)	{	Multiplier = 4;	}
		else if((her.aivar[REAL_STRENGTH] + points) > 70)	{	Multiplier = 3;	}
		else if((her.aivar[REAL_STRENGTH] + points) > 40)	{	Multiplier = 2;	}
		else																								{	Multiplier = 1;	};
	}
	else if(attribut == ATR_DEXTERITY)
	{
		if((her.aivar[REAL_DEXTERITY] + points) > 120)			{	Multiplier = 5;	}
		else if((her.aivar[REAL_DEXTERITY] + points) > 90)	{	Multiplier = 4;	}
		else if((her.aivar[REAL_DEXTERITY] + points) > 70)	{	Multiplier = 3;	}
		else if((her.aivar[REAL_DEXTERITY] + points) > 40)	{	Multiplier = 2;	}
		else																								{	Multiplier = 1;	};
	}
	else if(attribut == ATR_MANA_MAX)
	{
		if((her.aivar[REAL_MANA_MAX] + points) > 120)			{	Multiplier = 5;	}
		else if((her.aivar[REAL_MANA_MAX] + points) > 90)	{	Multiplier = 4;	}
		else if((her.aivar[REAL_MANA_MAX] + points) > 70)	{	Multiplier = 3;	}
		else if((her.aivar[REAL_MANA_MAX] + points) > 40)	{	Multiplier = 2;	}
		else																								{	Multiplier = 1;	};
	}
	else
	{	Multiplier = 1;	
	};
	return Multiplier;
};
//
//
//Получение кол-ва денег/руды за обучения навыкам-талантам
func int b_ds_GetTeachPaymentAmount(var C_NPC her, var int talent, var int points)
{
	var int kosten;		//цена за обучение
	kosten = 0;				//начальная инициализация
	var int temp_x;
	temp_x = 0;
	var int payment_talent_multiplier_before;	//множитель на стоимость обучения
	var int payment_talent_multiplier_after;	//множитель на стоимость обучения
	payment_talent_multiplier_before = 0;			//начальная инициализация
	payment_talent_multiplier_after = 0;			//начальная инициализация
	payment_talent_multiplier_after = b_DS_GetPaymentTalentMultiplier(her,talent,points);		//получения множителя от %
	payment_talent_multiplier_before = b_DS_GetPaymentTalentMultiplier(her,talent,0);		//получения множителя от %
	
	if(talent == NPC_TALENT_MAGE)
	{	};
	if(talent == NPC_TALENT_1H)
	{
			kosten = 100;	
			if(((her.aivar[REAL_TALENT_1H] + points) > 40) && (her.aivar[REAL_TALENT_1H] <= 40)){temp_x = 40;};
			if(((her.aivar[REAL_TALENT_1H] + points) > 70) && (her.aivar[REAL_TALENT_1H] <= 70)){temp_x = 70;};
			if(((her.aivar[REAL_TALENT_1H] + points) > 90) && (her.aivar[REAL_TALENT_1H] <= 90)){temp_x = 90;};		
			//если при обучении идёт пересечение границы изменения стоимости обучения
			if(((her.aivar[REAL_TALENT_1H] + points) > temp_x)	&& (her.aivar[REAL_TALENT_1H] <= temp_x))
			{
				//ввиду того, что при пересечении границы множитель увеличивается на 1, то в итоге получаем такую формулу:
				kosten = kosten * (payment_talent_multiplier_after * points + her.aivar[REAL_TALENT_1H] - temp_x);
			}
			else
			{
				kosten = kosten * payment_talent_multiplier_before * points;
			};
	};
	if(talent == NPC_TALENT_2H)
	{
			kosten = 100;	
			if(((her.aivar[REAL_TALENT_2H] + points) > 40) && (her.aivar[REAL_TALENT_2H] <= 40)){temp_x = 40;};
			if(((her.aivar[REAL_TALENT_2H] + points) > 70) && (her.aivar[REAL_TALENT_2H] <= 70)){temp_x = 70;};
			if(((her.aivar[REAL_TALENT_2H] + points) > 90) && (her.aivar[REAL_TALENT_2H] <= 90)){temp_x = 90;};		
			//если при обучении идёт пересечение границы изменения стоимости обучения
			if(((her.aivar[REAL_TALENT_2H] + points) > temp_x)	&& (her.aivar[REAL_TALENT_2H] <= temp_x))
			{
				//ввиду того, что при пересечении границы множитель увеличивается на 1, то в итоге получаем такую формулу:
				kosten = kosten * (payment_talent_multiplier_after * points + her.aivar[REAL_TALENT_2H] - temp_x);
			}
			else
			{
				kosten = kosten * payment_talent_multiplier_before * points;
			};	
	};
	if(talent == NPC_TALENT_BOW)
	{
		kosten = 100;	
			if(((her.aivar[REAL_TALENT_BOW] + points) > 40) && (her.aivar[REAL_TALENT_BOW] <= 40)){temp_x = 40;};
			if(((her.aivar[REAL_TALENT_BOW] + points) > 70) && (her.aivar[REAL_TALENT_BOW] <= 70)){temp_x = 70;};
			if(((her.aivar[REAL_TALENT_BOW] + points) > 90) && (her.aivar[REAL_TALENT_BOW] <= 90)){temp_x = 90;};		
			//если при обучении идёт пересечение границы изменения стоимости обучения
			if(((her.aivar[REAL_TALENT_BOW] + points) > temp_x)	&& (her.aivar[REAL_TALENT_BOW] <= temp_x))
			{
				//ввиду того, что при пересечении границы множитель увеличивается на 1, то в итоге получаем такую формулу:
				kosten = kosten * (payment_talent_multiplier_after * points + her.aivar[REAL_TALENT_BOW] - temp_x);
			}
			else
			{
				kosten = kosten * payment_talent_multiplier_before * points;
			};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
			kosten = 100;	
			if(((her.aivar[REAL_TALENT_CROSSBOW] + points) > 40) && (her.aivar[REAL_TALENT_CROSSBOW] <= 40)){temp_x = 40;};
			if(((her.aivar[REAL_TALENT_CROSSBOW] + points) > 70) && (her.aivar[REAL_TALENT_CROSSBOW] <= 70)){temp_x = 70;};
			if(((her.aivar[REAL_TALENT_CROSSBOW] + points) > 90) && (her.aivar[REAL_TALENT_CROSSBOW] <= 90)){temp_x = 90;};		
			//если при обучении идёт пересечение границы изменения стоимости обучения
			if(((her.aivar[REAL_TALENT_CROSSBOW] + points) > temp_x)	&& (her.aivar[REAL_TALENT_CROSSBOW] <= temp_x))
			{
				//ввиду того, что при пересечении границы множитель увеличивается на 1, то в итоге получаем такую формулу:
				kosten = kosten * (payment_talent_multiplier_after * points + her.aivar[REAL_TALENT_CROSSBOW] - temp_x);
			}
			else
			{
				kosten = kosten * payment_talent_multiplier_before * points;
			};
	};
	if(talent == NPC_TALENT_PICKORE)
	{
		kosten = 1;
		kosten = kosten * points;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		kosten = 400;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		kosten = 400;
	};
	if(talent == NPC_TALENT_PICKLOCK)
	{
		kosten = 700;		
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		kosten = 700;	
	};
	if(talent == NPC_TALENT_SMITH)
	{	};
	if(talent == NPC_TALENT_ALCHEMY)
	{
		if((points == POTION_Perm_STR) || (points == POTION_Perm_DEX) || (points == POTION_Perm_Mana) || (points == POTION_Perm_Health))
		{
			kosten = 800;
		}
		else
		{
			kosten = 500;
		};
	};
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if((points == TROPHY_Fur) || (points == TROPHY_ShadowHorn) || (points == TROPHY_Heart) 
		|| (points == TROPHY_Mandibles))
		{
			kosten = 500;
		}
		else if( (points == TROPHY_BFWing) || (points == TROPHY_BFSting) || (points == TROPHY_Mandibles)        
		|| (points == TROPHY_CrawlerPlate) || (points == TROPHY_DrgSnapperHorn) || (points == TROPHY_FireTongue)	
		|| (points == TROPHY_Claws) || (points == TROPHY_Teeth) )
		{
			kosten = 200;
		};		
	};
	if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{	};
	if(talent == NPC_TALENT_WISPDETECTOR)
	{	};
	if(talent == NPC_TALENT_RUNES)
	{	};
	if(talent == NPC_TALENT_FUSING)
	{	};
	if(talent == NPC_TALENT_ORCWEAPON)
	{
		if(points == 1)	{	kosten = 600;	}
		if(points == 2)	{	kosten = 1200;};		
	};
	if(talent == NPC_TALENT_2X2H)
	{
		if(points == 1)	{	kosten = 600;	}
		if(points == 2)	{	kosten = 1200;};		
	};
	if(talent == NPC_TALENT_SHIELD)
	{	kosten = 800;
	};
	if(talent == NPC_DS_PROTECTION)
	{	};
	if(talent == NPC_DS_SKIN)
	{	};
	//kosten = kosten * payment_talent_multiplier_before;
	return kosten;	//итоговая цена
};
//Получение кол-ва денег/руды за прокачку характеристик (сила, ловкость, макс.мана)
func int b_ds_GetTeachAtrPaymentAmount(var C_NPC her, var int attribut, var int points)
{
	var int kosten;		//цена за обучение
	kosten = 0;				//начальная инициализация
	var int temp_y;
	temp_y = 0;
	var int payment_attribut_multiplier_before;	//множитель на стоимость обучения
	var int payment_attribut_multiplier_after;	//множитель на стоимость обучения
	payment_attribut_multiplier_before = 0;			//начальная инициализация
	payment_attribut_multiplier_after = 0;			//начальная инициализация
	payment_attribut_multiplier_after = b_DS_GetPaymentAtrMultiplier(her,attribut,points);		//получения множителя от параметра
	payment_attribut_multiplier_before = b_DS_GetPaymentAtrMultiplier(her,attribut,0);		//получения множителя от параметра

	if(attribut == ATR_STRENGTH)
	{	
			kosten = 80;	
			if(((her.aivar[REAL_STRENGTH] + points) > 40) && (her.aivar[REAL_STRENGTH] <= 40)){temp_y = 40;};
			if(((her.aivar[REAL_STRENGTH] + points) > 70) && (her.aivar[REAL_STRENGTH] <= 70)){temp_y = 70;};
			if(((her.aivar[REAL_STRENGTH] + points) > 90) && (her.aivar[REAL_STRENGTH] <= 90)){temp_y = 90;};		
			//если при обучении идёт пересечение границы изменения стоимости обучения
			if(((her.aivar[REAL_STRENGTH] + points) > temp_y)	&& (her.aivar[REAL_STRENGTH] <= temp_y))
			{
				//ввиду того, что при пересечении границы множитель увеличивается на 1, то в итоге получаем такую формулу:
				kosten = kosten * (payment_attribut_multiplier_after * points + her.aivar[REAL_STRENGTH] - temp_y);
			}
			else
			{
				kosten = kosten * payment_attribut_multiplier_before * points;
			};
	};
	if(attribut == ATR_DEXTERITY)
	{
		kosten = 80;	
			if(((her.aivar[REAL_DEXTERITY] + points) > 40) && (her.aivar[REAL_DEXTERITY] <= 40)){temp_y = 40;};
			if(((her.aivar[REAL_DEXTERITY] + points) > 70) && (her.aivar[REAL_DEXTERITY] <= 70)){temp_y = 70;};
			if(((her.aivar[REAL_DEXTERITY] + points) > 90) && (her.aivar[REAL_DEXTERITY] <= 90)){temp_y = 90;};		
			//если при обучении идёт пересечение границы изменения стоимости обучения
			if(((her.aivar[REAL_DEXTERITY] + points) > temp_y)	&& (her.aivar[REAL_DEXTERITY] <= temp_y))
			{
				//ввиду того, что при пересечении границы множитель увеличивается на 1, то в итоге получаем такую формулу:
				kosten = kosten * (payment_attribut_multiplier_after * points + her.aivar[REAL_DEXTERITY] - temp_y);
			}
			else
			{	kosten = kosten * payment_attribut_multiplier_before * points;
			};
	};
	if(attribut == ATR_MANA_MAX)
	{	
		kosten = 80;	
			if(((her.aivar[REAL_MANA_MAX] + points) > 40) && (her.aivar[REAL_MANA_MAX] <= 40)){temp_y = 40;};
			if(((her.aivar[REAL_MANA_MAX] + points) > 70) && (her.aivar[REAL_MANA_MAX] <= 70)){temp_y = 70;};
			if(((her.aivar[REAL_MANA_MAX] + points) > 90) && (her.aivar[REAL_MANA_MAX] <= 90)){temp_y = 90;};		
			//если при обучении идёт пересечение границы изменения стоимости обучения
			if(((her.aivar[REAL_MANA_MAX] + points) > temp_y)	&& (her.aivar[REAL_MANA_MAX] <= temp_y))
			{
				//ввиду того, что при пересечении границы множитель увеличивается на 1, то в итоге получаем такую формулу:
				kosten = kosten * (payment_attribut_multiplier_after * points + her.aivar[REAL_MANA_MAX] - temp_y);
			}
			else
			{	kosten = kosten * payment_attribut_multiplier_before * points;
			};
	};
	return kosten;
};
//
//
//получение строки вида оплаты (зависит от вида оплаты, кол-ва)
func string b_Ds_buildString_TeachPayment_ItemPayment(var int amount)
{
	var string strItemPayment;
	/*Redleha:временно изменен зен*/
	if((CURRENTLEVEL == OldWorld_Zen))
	{
		if(((amount == 1) || (amount % 10 == 1)) && ((amount != 11) || (amount % 100 != 11)))
		{
			strItemPayment = " кусок руды.";
		}
		else if(	((amount == 2) || (amount == 3) || (amount == 4) || (amount % 10 == 2) || (amount % 10 == 3) || (amount % 10 == 4))
		&& ((amount != 12) || (amount != 13) || (amount != 14) || (amount % 100 != 12) || (amount % 100 != 13) || (amount % 100 != 14))	)
		{
			strItemPayment = " куска руды.";
		}
		else
		{	strItemPayment = " кусков руды.";
		};
	}
	else
	{		strItemPayment = " золота.";
	};
	return strItemPayment;
};
//
//Определение типа оплаты (зависит от локации : шахта - руда, осн.лока - золото)
func int B_DS_GetTeachPaymentType()
{
	var int itemInstance;
	/*Redleha:временно изменен зен*/
	if((CURRENTLEVEL == DSG_PREPROLOG_Zen) || (CURRENTLEVEL == DSG_PROLOG_Zen))
	{	return ItMi_Gold;
	}
	else
	{	return ItMi_Nugget;
	};
	return 0;
};
//
//Получение строки для отображения в диалоге обучения талантам
func string b_Ds_buildString_TeachPayment_Talent(var C_NPC her, var string text, var int talent, var int points, var int Value_force)
{
	var int kosten;		//итоговая стоимость обучения
	var string returnString;
	var string Print_talent_value;
	kosten = 0;
	if(Value_force == -1)
	{		kosten = b_ds_GetTeachPaymentAmount(her,talent,points);	}	//если force_value = -1, то цена определяется функцией 
	else
	{		kosten = Value_force;	};																		//если force_value != -1, то цена = force_value
	returnString = "";
	Print_talent_value = text;
	if(talent == NPC_TALENT_MAGE)
	{	};
	if(talent == NPC_TALENT_1H)
	{
		if(points == 5)				{	Print_talent_value = PRINT_Learn1h5;}		
		else if(points == 1)	{	Print_talent_value = PRINT_Learn1h1;};
	};
	if(talent == NPC_TALENT_2H)
	{
		if(points == 5)				{	Print_talent_value = PRINT_Learn2h5;}
		else if(points == 1)	{	Print_talent_value = PRINT_Learn2h1;};
	};
	if(talent == NPC_TALENT_BOW)
	{
		if(points == 5)				{	Print_talent_value = PRINT_LearnBow5;	}
		else if(points == 1)	{	Print_talent_value = PRINT_LearnBow1;	};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(points == 5)				{	Print_talent_value = PRINT_LearnCrossBow5;}
		else if(points == 1)	{	Print_talent_value = PRINT_LearnCrossBow1;};
	};
	if(talent == NPC_TALENT_PICKORE)
	{
		if(points == 5)				{	Print_talent_value = PRINT_LearnPickOre10;}
		else if(points == 1)	{	Print_talent_value = PRINT_LearnPickOre2;	};		
	};
	if(talent == NPC_TALENT_SNEAK)
	{		Print_talent_value = "Подкрадывание";
	};
	if(talent == NPC_TALENT_ACROBAT)
	{		Print_talent_value = "Акробатика";
	};
	if(talent == NPC_TALENT_PICKLOCK)
	{		Print_talent_value = "Взлом замков";
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		if(points == 1)				{	Print_talent_value = PRINT_LearnPickPocket1;	}
		else if(points == 2)	{	Print_talent_value = PRINT_LearnPickPocket2;	}
		else if(points == 3)	{	Print_talent_value = PRINT_LearnPickPocket3;	};
	};
	if(talent == NPC_TALENT_SMITH)
	{		//Print_talent_value = "Кузнечное дело";
	};
	if(talent == NPC_TALENT_ALCHEMY)
	{		Print_talent_value = B_DS_GetAlchemyPotionName(points);
	};
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{		Print_talent_value = B_DS_GetAnimalTrophyName(points);
	};
	if(talent == NPC_TALENT_FOREIGNLANGUAGE)
	{	};
	if(talent == NPC_TALENT_WISPDETECTOR)
	{	};
	if(talent == NPC_TALENT_RUNES)
	{	};
	if(talent == NPC_TALENT_FUSING)
	{	};
	if(talent == NPC_TALENT_ORCWEAPON)
	{
		if(points == 1)		{	Print_talent_value = PRINT_LearnOrcWeapon1;	}
		if(points == 2)		{	Print_talent_value = PRINT_LearnOrcWeapon2;	};
		//Print_talent_value = "Орочье оружие";
	};
	if(talent == NPC_TALENT_2X2H)
	{
		if(points == 1)		{	Print_talent_value = PRINT_Learn2x2H1;	}
		if(points == 2)		{	Print_talent_value = PRINT_Learn2x2H2;	};
		//Print_talent_value = "Два клинка";
	};
	if(talent == NPC_TALENT_SHIELD)
	{		//Print_talent_value = "Владение щитом";
	};
	if(talent == NPC_DS_PROTECTION)
	{	};
	if(talent == NPC_DS_SKIN)
	{	};
	//Получаем "$Талант$. Цена: "
	Print_talent_value = ConcatStrings(Print_talent_value,PRINT_Kosten);
	//Получаем "$Талант$. Цена: $числоLP$"
	Print_talent_value = ConcatStrings(Print_talent_value,IntToString(B_GetLearnCostTalent(her,talent,points)));
	if(kosten > 0)
	{
		//Получаем "$число$"
		returnString = ConcatStrings(IntToString(kosten),"");	
		//Получаем "$число_оплаты$ $вид_оплаты$"
		returnString = ConcatStrings(returnString,b_Ds_buildString_TeachPayment_ItemPayment(kosten));
		//Получаем "$Талант$. Цена: $числоLP$ LP, "
		Print_talent_value = ConcatStrings(Print_talent_value,PRINT_DS_LP);
	}
	else
	{
		Print_talent_value = ConcatStrings(Print_talent_value,PRINT_LP);
	};		
	//Получаем "$Талант$. Цена: $числоLP$, LP, $число_оплаты$ $вид_оплаты$"
	returnString = ConcatStrings(Print_talent_value,returnString);
	return returnString;
};
//Получение строки для отображения в диалоге обучения характеристикам.
func string b_Ds_buildString_TeachPayment_Attr(var C_NPC her, var string text, var int attribut, var int points, var int Value_force)
{
	var string returnString;
	var int kosten;
	kosten = 0;
	if(Value_force == -1)
	{		kosten = b_ds_GetTeachAtrPaymentAmount(her,attribut,points);	}	//если force_value = -1, то цена определяется функцией 
	else
	{		kosten = Value_force;	};																		//если force_value != -1, то цена = force_value
	returnString = "";
	var string Print_talent_value;
	Print_talent_value = text;	
	if(attribut == ATR_STRENGTH)
	{
		if(points == 5)				{	Print_talent_value = PRINT_LearnSTR5;	}
		else if(points == 1)	{	Print_talent_value = PRINT_LearnSTR1;	};
	};
	if(attribut == ATR_DEXTERITY)
	{
		if(points == 5)				{	Print_talent_value = PRINT_LearnDEX5;	}
		else if(points == 1)	{	Print_talent_value = PRINT_LearnDEX1;	};
	};
	if(attribut == ATR_MANA_MAX)
	{	
		if(points == 5)				{	Print_talent_value = PRINT_LearnMana5;}
		else if(points == 1)	{	Print_talent_value = PRINT_LearnMana1;};
	};
	if(attribut == ATR_HITPOINTS_MAX)
	{	
		if(points == 50)				{	Print_talent_value = PRINT_LearnHITPOINTS50;}
		else if(points == 20)	{	Print_talent_value = PRINT_LearnHITPOINTS20;}
		else if(points == 10)	{	Print_talent_value = PRINT_LearnHITPOINTS10;};
	};
	//Получаем "$Параметр$. Цена: "
	Print_talent_value = ConcatStrings(Print_talent_value,PRINT_Kosten);
	//Получаем "$Параметр$. Цена: $числоLP$"
	Print_talent_value = ConcatStrings(Print_talent_value,IntToString(B_GetLearnCostAttribute(her,attribut,points)));
	if(kosten > 0)
	{
		//Получаем "$число$"
		returnString = ConcatStrings(IntToString(kosten),"");	
		//Получаем "$число_оплаты$ $вид_оплаты$"
		returnString = ConcatStrings(returnString,b_Ds_buildString_TeachPayment_ItemPayment(kosten));
		//Получаем "$Параметр$. Цена: $числоLP$ LP, "
		Print_talent_value = ConcatStrings(Print_talent_value,PRINT_DS_LP);
	}
	else
	{
		Print_talent_value = ConcatStrings(Print_talent_value,PRINT_LP);
	};		
	//Получаем "$Параметр$. Цена: $числоLP$, LP, $число_оплаты$ $вид_оплата$"
	returnString = ConcatStrings(Print_talent_value,returnString);
	return returnString;
};
