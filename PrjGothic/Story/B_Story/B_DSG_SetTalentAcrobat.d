//NS - 31/07/2013
// Нужно из-за бонуса акробатики.
// Может быть так, что пока есть бонус, получим акробатику постоянно,
// а когда снимем бонус, акробатика пропадет.
// Или можно получить несколько бонусов одновременно

// сколько раз включили акробатику
var int HERO_Acrobat_Counter;

// вкл./выкл. акробатику
// Value = TRUE/FALSE
func void B_SetTalentAcrobat(var C_NPC slf, var int Value)
{
	if (Npc_IsPlayer(slf))	{
		//счетчик бонусов
		if (Value > 0)	{
			HERO_Acrobat_Counter += 1;
		}
		else	{
			HERO_Acrobat_Counter -= 1;
		};
		//вкл./выкл.
		if (HERO_Acrobat_Counter > 0)	{
			Npc_SetTalentSkill(slf,NPC_TALENT_ACROBAT,1);
		}
		else	{
			Npc_SetTalentSkill(slf,NPC_TALENT_ACROBAT,0);
		};
	}
	else
	{
		Npc_SetTalentSkill(slf,NPC_TALENT_ACROBAT,Value);
	};
};

// то же самое для спринта
var int HERO_Sprint_Counter;

// вкл./выкл. постоянное ускорение
// Value = TRUE/FALSE
func void B_SetPermSprint(var C_NPC slf, var int Value)
{
	if (Npc_IsPlayer(slf))	{
		//счетчик бонусов
		if (Value > 0)	{
			HERO_Sprint_Counter += 1;
		}
		else	{
			HERO_Sprint_Counter -= 1;
		};
		//вкл./выкл.
		if (HERO_Sprint_Counter > 0)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_SPRINT.MDS");
		}
		else	{
			Mdl_RemoveOverlayMDS(slf,"HUMANS_SPRINT.MDS");
		};
	}
	else
	{
		if (Value > 0)	{
			Mdl_ApplyOverlayMds(slf,"HUMANS_SPRINT.MDS");
		}
		else	{
			Mdl_RemoveOverlayMDS(slf,"HUMANS_SPRINT.MDS");
		};
	};
};

