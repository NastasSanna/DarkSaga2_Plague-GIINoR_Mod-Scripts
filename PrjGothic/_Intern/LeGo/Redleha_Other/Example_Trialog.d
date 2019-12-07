/*
INSTANCE Info_Mod_Rauber_Ueberfall_Alchi_Hi (C_INFO)
{
	npc		= Mod_162_BDT_Raeuber;
	nr		= 1;
	condition	= Info_Mod_Rauber_Ueberfall_Alchi_Hi_Condition;
	information	= Info_Mod_Rauber_Ueberfall_Alchi_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rauber_Ueberfall_Alchi_Hi_Condition ()
{
	return 1;
};

FUNC VOID Info_Mod_Rauber_Ueberfall_Alchi_Hi_Info ()
{
	var c_npc Raeuber; Raeuber = Hlp_GetNpc(Mod_162_BDT_Raeuber);
	var c_npc Philipp; Philipp = Hlp_GetNpc(Mod_104_BAU_Philipp);

	TRIA_Invite(Philipp);
	TRIA_Start();

	TRIA_Next(Raeuber);

	if (HeroGender == GENDER_MALE)
	{
		AI_Output(self, hero, "Info_Mod_Rauber_Ueberfall_Alchi_Hi_11_00"); //Na, na, na, nicht so schnell, Freundchen!
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Rauber_Ueberfall_Alchi_Hi_11_01"); //Na, na, na, was haben wir denn da fur ein su?es Parchen, das sich ausm Staub machen will?
	};

	AI_Output(self, hero, "Info_Mod_Rauber_Ueberfall_Alchi_Hi_11_02"); //Da haben wir aber auch noch ein Wortchen mitzureden.

	TRIA_Next(Philipp);

	AI_Output(self, hero, "Info_Mod_Rauber_Ueberfall_Alchi_Hi_12_03"); //Was wollt ihr?

	TRIA_Next(Raeuber);

	AI_Output(self, hero, "Info_Mod_Rauber_Ueberfall_Alchi_Hi_11_04"); //Ihr habt 'ne Audienz beim Anfuhrer, Knirps. Und wir passen auf, dass ihr auch wirklich hingeht.

	TRIA_Next(Philipp);

	AI_Output(self, hero, "Info_Mod_Rauber_Ueberfall_Alchi_Hi_12_05"); //Aber wieso?

	TRIA_Next(Raeuber);

	AI_Output(self, hero, "Info_Mod_Rauber_Ueberfall_Alchi_Hi_11_06"); //Er hat euch eine ganze Zeit beobachtet. Ihr habt ihn ordentlich verwirrt. Deshalb will er euch sprechen.
	AI_Output(self, hero, "Info_Mod_Rauber_Ueberfall_Alchi_Hi_11_07"); //Und jetzt Mund halten und mitkommen!
    
	TRIA_Finish();

	AI_StopProcessInfos	(self);

	// Wachen hinters Tor stellen

	B_StartOtherRoutine	(Mod_131_MIL_Wache, "HINTERTOR");
	B_StartOtherRoutine	(Mod_132_MIL_Wache, "HINTERTOR");
	B_StartOtherRoutine	(Mod_137_MIL_Wache, "HINTERTOR");
	B_StartOtherRoutine	(Mod_138_MIL_Wache, "HINTERTOR");
};
*/
var int Example_Trialog_IL_II;