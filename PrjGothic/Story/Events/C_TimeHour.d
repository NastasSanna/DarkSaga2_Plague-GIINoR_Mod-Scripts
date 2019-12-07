func int C_TimeHour()
{
	if(Wld_IsTime(23,59,1,0))
	{
		return 0;
	}
	else if(Wld_IsTime(0,59,2,0))
	{
		return 1;
	}
	else if(Wld_IsTime(1,59,3,0))
	{
		return 2;
	}
	else if(Wld_IsTime(2,59,4,0))
	{
		return 3;
	}
	else if(Wld_IsTime(3,59,5,0))
	{
		return 4;
	}
	else if(Wld_IsTime(4,59,6,0))
	{
		return 5;
	}
	else if(Wld_IsTime(5,59,7,0))
	{
		return 6;
	}
	else if(Wld_IsTime(6,59,8,0))
	{
		return 7;
	}
	else if(Wld_IsTime(7,59,9,0))
	{
		return 8;
	}
	else if(Wld_IsTime(8,59,10,0))
	{
		return 9;
	}
	else if(Wld_IsTime(9,59,11,0))
	{
		return 10;
	}
	else if(Wld_IsTime(10,59,12,0))
	{
		return 11;
	}
	else if(Wld_IsTime(11,59,13,0))
	{
		return 12;
	}
	else if(Wld_IsTime(12,59,14,0))
	{
		return 13;
	}
	else if(Wld_IsTime(13,59,15,0))
	{
		return 14;
	}
	else if(Wld_IsTime(14,59,16,0))
	{
		return 15;
	}
	else if(Wld_IsTime(15,59,17,0))
	{
		return 16;
	}
	else if(Wld_IsTime(16,59,18,0))
	{
		return 17;
	}
	else if(Wld_IsTime(17,59,19,0))
	{
		return 18;
	}
	else if(Wld_IsTime(18,59,20,0))
	{
		return 19;
	}
	else if(Wld_IsTime(19,59,21,0))
	{
		return 20;
	}
	else if(Wld_IsTime(20,59,22,0))
	{
		return 21;
	}
	else if(Wld_IsTime(21,59,23,0))
	{
		return 22;
	}
	else if(Wld_IsTime(22,59,0,0))
	{
		return 23;
	};
	return -1;
};

func int C_TimeMinute()
{
	var int hour;
	hour = 0;
	hour = c_timehour();
	if(Wld_IsTime(hour-1,59,hour,1))
	{		return 0;
	};
	if(Wld_IsTime(hour,0,hour,2))
	{		return 1;
	};
	if(Wld_IsTime(hour,1,hour,3))
	{		return 2;
	};
	if(Wld_IsTime(hour,2,hour,4))
	{		return 3;
	};
	if(Wld_IsTime(hour,3,hour,5))
	{		return 4;
	};
	if(Wld_IsTime(hour,4,hour,6))
	{		return 5;
	};
	if(Wld_IsTime(hour,5,hour,7))
	{		return 6;
	};
	if(Wld_IsTime(hour,6,hour,8))
	{		return 7;
	};
	if(Wld_IsTime(hour,7,hour,9))
	{		return 8;
	};
	if(Wld_IsTime(hour,8,hour,10))
	{		return 9;
	};
	if(Wld_IsTime(hour,9,hour,11))
	{		return 10;
	};
	if(Wld_IsTime(hour,10,hour,12))
	{		return 11;
	};
	if(Wld_IsTime(hour,11,hour,13))
	{		return 12;
	};
	if(Wld_IsTime(hour,12,hour,14))
	{		return 13;
	};
	if(Wld_IsTime(hour,13,hour,15))
	{		return 14;
	};
	if(Wld_IsTime(hour,14,hour,16))
	{		return 15;
	};
	if(Wld_IsTime(hour,15,hour,17))
	{		return 16;
	};
	if(Wld_IsTime(hour,16,hour,18))
	{		return 17;
	};
	if(Wld_IsTime(hour,17,hour,19))
	{		return 18;
	};
	if(Wld_IsTime(hour,18,hour,20))
	{		return 19;
	};
	if(Wld_IsTime(hour,19,hour,21))
	{		return 20;
	};
	if(Wld_IsTime(hour,20,hour,22))
	{		return 21;
	};
	if(Wld_IsTime(hour,21,hour,23))
	{		return 22;
	};
	if(Wld_IsTime(hour,22,hour,24))
	{		return 23;
	};
	if(Wld_IsTime(hour,23,hour,25))
	{		return 24;
	};
	if(Wld_IsTime(hour,24,hour,26))
	{		return 25;
	};
	if(Wld_IsTime(hour,25,hour,27))
	{		return 26;
	};
	if(Wld_IsTime(hour,26,hour,28))
	{		return 27;
	};
	if(Wld_IsTime(hour,27,hour,29))
	{		return 28;
	};
	if(Wld_IsTime(hour,28,hour,30))
	{		return 29;
	};
	if(Wld_IsTime(hour,29,hour,31))
	{		return 30;
	};
	if(Wld_IsTime(hour,30,hour,32))
	{		return 31;
	};
	if(Wld_IsTime(hour,31,hour,33))
	{		return 32;
	};
	if(Wld_IsTime(hour,32,hour,34))
	{		return 33;
	};
	if(Wld_IsTime(hour,33,hour,35))
	{		return 34;
	};
	if(Wld_IsTime(hour,34,hour,36))
	{		return 35;
	};
	if(Wld_IsTime(hour,35,hour,37))
	{		return 36;
	};
	if(Wld_IsTime(hour,36,hour,38))
	{		return 37;
	};
	if(Wld_IsTime(hour,37,hour,39))
	{		return 38;
	};
	if(Wld_IsTime(hour,38,hour,40))
	{		return 39;
	};
	if(Wld_IsTime(hour,39,hour,41))
	{		return 40;
	};
	if(Wld_IsTime(hour,40,hour,42))
	{		return 41;
	};
	if(Wld_IsTime(hour,41,hour,43))
	{		return 42;
	};
	if(Wld_IsTime(hour,42,hour,44))
	{		return 43;
	};
	if(Wld_IsTime(hour,43,hour,45))
	{		return 44;
	};
	if(Wld_IsTime(hour,44,hour,46))
	{		return 45;
	};
	if(Wld_IsTime(hour,45,hour,47))
	{		return 46;
	};
	if(Wld_IsTime(hour,46,hour,48))
	{		return 47;
	};
	if(Wld_IsTime(hour,47,hour,49))
	{		return 48;
	};
	if(Wld_IsTime(hour,48,hour,50))
	{		return 49;
	};
	if(Wld_IsTime(hour,49,hour,51))
	{		return 50;
	};
	if(Wld_IsTime(hour,50,hour,52))
	{		return 51;
	};
	if(Wld_IsTime(hour,51,hour,53))
	{		return 52;
	};
	if(Wld_IsTime(hour,52,hour,54))
	{		return 53;
	};
	if(Wld_IsTime(hour,53,hour,55))
	{		return 54;
	};
	if(Wld_IsTime(hour,54,hour,56))
	{		return 55;
	};
	if(Wld_IsTime(hour,55,hour,57))
	{		return 56;
	};
	if(Wld_IsTime(hour,56,hour,58))
	{		return 57;
	};
	if(Wld_IsTime(hour,57,hour,59))
	{		return 58;
	};
	if(Wld_IsTime(hour,58,hour+1,0))
	{		return 59;
	}
	else
	{		return 0;
	};
	return -1;
};

/*/

//рекурсивное определение часа
func int TimeHour_Rec(var int h)
{
	if (h <= 0)
	{
		return 0;
	};
	if (Wld_IsTime(h, 0, 0, 0))
	{
		return h;
	};
	var int h0;
	h0 = TimeHour_Rec(h - 1);
	return h0;
};	

// который час?
func int C_TimeHour()
{
	return TimeHour_Rec(23);
};

//рекурсивное определение минуты
func int TimeMinute_Rec(var int h, var int m)
{
	if (m <= 0)
	{
		return 0;
	}
	else if (Wld_IsTime(h, m, 0, 0))
	{
		return m;
	};
	var int m0;
	m0 = TimeMinute_Rec(h, m - 1);
	return m0;
};

// сколько минут?
func int C_TimeMinute()
{
	var int h;
	h = C_TimeHour();
	return TimeMinute_Rec(h, 59);
};
//*/

func void PrintScreen_DS_Time()
{
	var int hour1;
	var int minute1;
	var string Time_on_Screen;
	hour1 = 0;
	minute1 = 0;
	Time_on_Screen = "";
	hour1 = C_TimeHour();
	minute1 = C_TimeMinute();
	if(minute1 < 10)
	{
		Time_On_Screen = ConcatStrings(IntToString(hour1),":0");
	}
	else
	{
		Time_On_Screen = ConcatStrings(IntToString(hour1),":");
	};
	Time_On_Screen = ConcatStrings(Time_On_Screen,IntToString(minute1));
	if(Time_Color == 1)
	{
		PrintScreen(Time_On_Screen,90,2,Font_ScreenSmall,2);
	}
	else if(Time_Color == 2)
	{
		PrintScreen(Time_On_Screen,90,2,FONT_ScreenSmall_HI,2);
	}
	else if(Time_Color == 3)
	{
		PrintScreen(Time_On_Screen,90,2,FONT_ScreenSmall_Green_HI,2);
	}
	else if(Time_Color == 4)
	{
		PrintScreen(Time_On_Screen,90,2,FONT_ScreenSmall_Red_HI,2);
	}
	else if(Time_Color == 0)
	{
		PrintScreen(Time_On_Screen,90,2,FONT_ScreenSmall_Yellow_HI,2);
	};
};
