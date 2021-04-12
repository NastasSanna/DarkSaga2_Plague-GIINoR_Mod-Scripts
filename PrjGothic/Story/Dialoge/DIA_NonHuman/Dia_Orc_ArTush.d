instance DIA_ArTush_EXIT(DIA_Proto_End)
{
	npc = Orc_DS2P_ArTush;
};

func int DIA_ArTush_Healed_Cond()
{
	if (ArTush_Healed)	{
		return TRUE;
	};
};

//===================================================
//Появление: вылечен
//Постоянный
instance DIA_ArTush_HowAU(C_Info)
{
	npc = Orc_DS2P_ArTush;								nr = 1;
	condition = DIA_ArTush_Healed_Cond;
	information = DIA_ArTush_Healed_Cond;
	description = "Как дела?";
	permanent = TRUE;
};
func void DIA_ArTush_HowAU_Info()
{
		AI_Output(other,self,"DIA_ArTush_HowAU_15_01");	//Как дела?
	AI_Output(self,other,"DIA_ArTush_HowAU_99_02");	//Морра спасиба.
};


//===================================================
//Появление: вылечен
//Постоянный
instance DIA_ArTush_WhatIsUrName(C_Info)
{
	npc = Orc_DS2P_ArTush;								nr = 2;
	condition = DIA_ArTush_Healed_Cond;
	information = DIA_ArTush_Healed_Cond;
	description = "Тебя ведь зовут Ар-Туш?";
	permanent = TRUE;
};
func void DIA_ArTush_WhatIsUrName_Info()
{
		AI_Output(other,self,"DIA_ArTush_WhatIsUrName_15_01");	//Тебя ведь зовут Ар-Туш?
	AI_Output(self,other,"DIA_ArTush_WhatIsUrName_99_02");	//Шоха, шоха Ар-Туш.
};


//===================================================
//Появление: вылечен
//Постоянный
instance DIA_ArTush_HowIsUrHealth(C_Info)
{
	npc = Orc_DS2P_ArTush;								nr = 3;
	condition = DIA_ArTush_Healed_Cond;
	information = DIA_ArTush_Healed_Cond;
	description = "Как самочувствие?";
	permanent = TRUE;
};
func void DIA_ArTush_HowIsUrHealth_Info()
{
		AI_Output(other,self,"DIA_ArTush_HowIsUrHealth_15_01");	//Как самочувствие?
	AI_Output(self,other,"DIA_ArTush_HowIsUrHealth_99_02");	//Утха, утха караша морра.
};

