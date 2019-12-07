
func void B_Kapitelwechsel(var int neues_Kapitel,var int aktuelles_Level_Zen)
{
	Kapitel = neues_Kapitel;
	if(neues_Kapitel == 1)
	{
		IntroduceChapter(KapWechsel_DSG_1,KapWechsel_DSG_1_Text,"chapter1.tga","chapter_01.wav",6000);
	}
	else if(neues_Kapitel == 2)
	{
		IntroduceChapter(KapWechsel_DSG_2,KapWechsel_DSG_2_Text,"chapter2.tga","chapter_01.wav",6000);
	}
	else if(neues_Kapitel == 3)
	{
		IntroduceChapter(KapWechsel_DSG_3,KapWechsel_DSG_3_Text,"chapter3.tga","chapter_01.wav",6000);
	};
	B_CheckLog();
	if(Kapitel == 1)
	{
		XP_Ambient = XP_AmbientKap1;
	};
	if(Kapitel == 2)
	{
		XP_Ambient = XP_AmbientKap2;
	};
	if(Kapitel == 3)
	{
		XP_Ambient = XP_AmbientKap3;
	};
};

