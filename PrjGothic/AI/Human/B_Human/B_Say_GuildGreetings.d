
func void B_Say_GuildGreetings(var C_Npc slf,var C_Npc oth)
{
	var int zufall; zufall = Hlp_Random(100);
	if((zufall <= 10) && Wld_IsRaining())
	{
		B_Say_Overlay(slf,oth,"$WEATHER");
		return;
	};
};

