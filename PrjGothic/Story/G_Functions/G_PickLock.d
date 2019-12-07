var int varG_Picklock_pos_Y;
func void G_PickLock(var int bSuccess,var int bBrokenOpen)
{
	var int rnd;
	if(varG_Picklock_pos_Y == 0)
	{
		varG_Picklock_pos_Y = 2;
	}
	else
	{
		varG_Picklock_pos_Y = 0;
	};
	if(bSuccess)
	{
		if(bBrokenOpen)
		{
			Snd_Play3d(self,"PICKLOCK_UNLOCK");
			//Print(PRINT_PICKLOCK_UNLOCK);
			PrintScreen(PRINT_PICKLOCK_UNLOCK,-1,42,FONT_ScreenSmall_Green_HI,3);
			B_GivePlayerXP(50);
		}
		else
		{
			Snd_Play3d(self,"PICKLOCK_SUCCESS");
			//Print(PRINT_PICKLOCK_SUCCESS);
			PrintScreen(PRINT_PICKLOCK_SUCCESS,-1,36,FONT_ScreenSmall_Yellow_HI,1);
			//PrintScreen(PRINT_PICKLOCK_SUCCESS,-1,34,FONT_ScreenSmall_Yellow_HI,1);
		};
	}
	else if(bBrokenOpen)
	{
		Snd_Play3d(self,"PICKLOCK_BROKEN");
		//Print(PRINT_PICKLOCK_BROKEN);
		PrintScreen(PRINT_PICKLOCK_BROKEN,-1,38,FONT_ScreenSmall_Red_HI,1);
		//PrintScreen(PRINT_PICKLOCK_BROKEN,-1,38,FONT_ScreenSmall_Red_HI,1);
		rnd = Hlp_Random(100);
		if(rnd <= 25)
		{
			Npc_SendPassivePerc(hero,PERC_ASSESSQUIETSOUND,hero,hero);
		};
	}
	else
	{
		Snd_Play3d(self,"PICKLOCK_FAILURE");
		//Print(PRINT_PICKLOCK_FAILURE);
		PrintScreen(PRINT_PICKLOCK_FAILURE,-1,40,FONT_ScreenSmall_Yellow_HI,1);
		//PrintScreen(PRINT_PICKLOCK_FAILURE,-1,40,FONT_ScreenSmall_Yellow_HI,1);
	};
};

