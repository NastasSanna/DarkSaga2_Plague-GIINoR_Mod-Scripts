//
//Ïîëó÷àåì êîë-âî òðåáóåìûõ î÷êîâ îïûòà äëÿ ïîâûøåíèÿ õàðàêòåðèñòèê
//
func int B_GetLearnCostAttribute(var C_Npc oth,var int attribut,var int points)
{
	var int kosten;
	kosten = 0;
	//
	//---------ÎÁÓ×ÅÍÈÅ: ÑÈËÀ
	//
	if(attribut == ATR_STRENGTH)
	{
		if(oth.aivar[REAL_STRENGTH] >= 130)
		{
			kosten = 5 * points;
		}
		else if(oth.aivar[REAL_STRENGTH] >= 100)
		{
			if((oth.aivar[REAL_STRENGTH] + points) > 130)
			{
				kosten = 5 * points + oth.aivar[REAL_STRENGTH] - 130;
			}
			else
			{
				kosten = 4 * points;
			};
		}
		else if(oth.aivar[REAL_STRENGTH] >= 65)
		{
			if((oth.aivar[REAL_STRENGTH] + points) > 100)
			{
				kosten = 4 * points + oth.aivar[REAL_STRENGTH] - 100;
			}
			else
			{
				kosten = 3 * points;
			};
		}
		else if(oth.aivar[REAL_STRENGTH] >= 35)
		{
			if((oth.aivar[REAL_STRENGTH] + points) > 65)
			{
				kosten = 3 * points + oth.aivar[REAL_STRENGTH] - 65;
			}
			else
			{
				kosten = 2 * points;
			};
		}
		else
		{
			if((oth.aivar[REAL_STRENGTH] + points) > 35)
			{
				kosten = 2 * points + oth.aivar[REAL_STRENGTH] - 35;
			}
			else
			{
				kosten = 1 * points;
			};
		};	
	};
	//
	//---------ÎÁÓ×ÅÍÈÅ: ËÎÂÊÎÑÒÜ
	//
	if(attribut == ATR_DEXTERITY)
	{
		if(oth.aivar[REAL_DEXTERITY] >= 130)
		{
			kosten = 5 * points;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 100)
		{
			if((oth.aivar[REAL_DEXTERITY] + points) > 130)
			{
				kosten = 5 * points + oth.aivar[REAL_DEXTERITY] - 130;
			}
			else
			{
				kosten = 4 * points;
			};
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 65)
		{
			if((oth.aivar[REAL_DEXTERITY] + points) > 100)
			{
				kosten = 4 * points + oth.aivar[REAL_DEXTERITY] - 100;
			}
			else
			{
				kosten = 3 * points;
			};
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 35)
		{
			if((oth.aivar[REAL_DEXTERITY] + points) > 65)
			{
				kosten = 3 * points + oth.aivar[REAL_DEXTERITY] - 65;
			}
			else
			{
				kosten = 2 * points;
			};
		}
		else
		{
			if((oth.aivar[REAL_DEXTERITY] + points) > 35)
			{
				kosten = 2 * points + oth.aivar[REAL_DEXTERITY] - 35;
			}
			else
			{
				kosten = 1 * points;
			};
		};
	};
	//
	//---------ÎÁÓ×ÅÍÈÅ: ÌÀÊÑ.ÌÀÍÀ
	//
	if(attribut == ATR_MANA_MAX)
	{
		if(oth.aivar[REAL_MANA_MAX] >= 130)
		{
			kosten = 5 * points;
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 100)
		{
			if((oth.aivar[REAL_MANA_MAX] + points) > 130)
			{
				kosten = 5 * points + oth.aivar[REAL_MANA_MAX] - 130;
			}
			else
			{
				kosten = 4 * points;
			};
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 65)
		{
			if((oth.aivar[REAL_MANA_MAX] + points) > 100)
			{
				kosten = 4 * points + oth.aivar[REAL_MANA_MAX] - 100;
			}
			else
			{
				kosten = 3 * points;
			};
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 35)
		{
			if((oth.aivar[REAL_MANA_MAX] + points) > 65)
			{
				kosten = 3 * points + oth.aivar[REAL_MANA_MAX] - 65;
			}
			else
			{
				kosten = 2 * points;
			};
		}
		else
		{
			if((oth.aivar[REAL_MANA_MAX] + points) > 35)
			{
				kosten = 2 * points + oth.aivar[REAL_MANA_MAX] - 35;
			}
			else
			{
				kosten = 1 * points;
			};
		};
	};
	//
	//---------ÎÁÓ×ÅÍÈÅ: ÌÀÊÑ.ÆÈÇÍÜ
	//
	if(attribut == ATR_HITPOINTS_MAX)
	{
		if(oth.attribute[ATR_HITPOINTS_MAX] >= 550)
		{
			kosten = 5 * points;
		}
		else if(oth.attribute[ATR_HITPOINTS_MAX] >= 450)
		{
			if((oth.attribute[ATR_HITPOINTS_MAX] + points) > 550)
			{
				kosten = 5 * points + oth.attribute[ATR_HITPOINTS_MAX] - 550;
			}
			else
			{
				kosten = 4 * points;
			};
		}
		else if(oth.attribute[ATR_HITPOINTS_MAX] >= 350)
		{
			if((oth.attribute[ATR_HITPOINTS_MAX] + points) > 450)
			{
				kosten = 4 * points + oth.attribute[ATR_HITPOINTS_MAX] - 450;
			}
			else
			{
				kosten = 3 * points;
			};
		}
		else if(oth.attribute[ATR_HITPOINTS_MAX] >= 250)
		{
			if((oth.attribute[ATR_HITPOINTS_MAX] + points) > 350)
			{
				kosten = 3 * points + oth.attribute[ATR_HITPOINTS_MAX] - 350;
			}
			else
			{
				kosten = 2 * points;
			};
		}
		else
		{
			if((oth.attribute[ATR_HITPOINTS_MAX] + points) > 250)
			{
				kosten = 2 * points + oth.attribute[ATR_HITPOINTS_MAX] - 250;
			}
			else
			{
				kosten = 1 * points;
			};
		};
		kosten = kosten / 10;
	};
	
	return kosten;
};

