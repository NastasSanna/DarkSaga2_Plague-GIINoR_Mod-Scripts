func void c_time_RegenerateMana()
{
	var int x;
	x = RegenMana_from_Ring + RegenMana_from_Amulet + RegenMana_from_Armor;
	If(x == 1)					{		varTime_to_RegenMana = 20;	}
	else if(x == 2)	{		varTime_to_RegenMana = 9;	}
	else if(x == 3)	{		varTime_to_RegenMana = 4;	}
	else if(x==0)		{		varTime_to_RegenMana = 0;	};
};
func void c_time_RegenerateHP()
{
	var int x;
	x = RegenHP_from_Ring + RegenHP_from_Amulet + RegenHP_from_Armor;
	If(x == 1)					{		varTime_to_RegenHP = 20;	}
	else if(x == 2)	{		varTime_to_RegenHP = 9;	}
	else if(x == 3)	{		varTime_to_RegenHP = 4;	}
	else if(x==0)		{		varTime_to_RegenHP = 0;	};
};
