
var C_Npc MARIK;
var C_Npc Skip;
var C_Npc Gerard;
// Команда из Г2НВ
var C_Npc Nameless;
var C_Npc Jack;
var C_Npc Lares;
var C_Npc Lee;
var C_Npc Milten;
var C_Npc Diego;
var C_Npc Lester;
var C_Npc Gorn;
var C_Npc Vatras;
// Крестьяне
var C_Npc Kadar;
var C_Npc Harok;
var C_Npc Dil;
var C_Npc Cimm;
var C_Npc Barok;
var C_Npc Tamir;
var C_Npc Maria;
var C_Npc Nikki;
var C_Npc Huno;
var C_Npc Lulu;
var C_Npc Viola;
var C_Npc Narev;
var C_Npc Kara;
var C_Npc Gustav;
var C_Npc Tom;
var C_Npc Jinn;
var C_Npc Fart;
var C_Npc Garon;
// Пираты
var C_Npc Gard;
var C_Npc Greg;
var C_Npc Symon;
var C_Npc Zedd;
var C_Npc Karah;
var C_Npc Joseph;
var C_Npc SueBaby;
var C_Npc LanSkeleton;
var C_Npc GrayBeard;
var C_Npc Vales;
var C_Npc Jorn;
var C_Npc Ado;
var C_Npc Hobo;
// Гоблины
var C_Npc KuLa;
var C_Npc BaBaPo;
var C_Npc RaDaPo;
var C_Npc TsaHaNauh;	
var C_Npc JaAfFar;
var C_Npc YahYah;	
// Прочие
var C_Npc Ekor;
var C_Npc Izmar ;
var C_Npc RakTarak;
var C_Npc ArTush;

func void B_InitNpcGlobals()
{
	if(Kapitel == 0)
	{
		Kapitel = 1;
	};
	MARIK = Hlp_GetNpc(DS_21_MARIK);
	Skip = Hlp_GetNpc(DS_22_SKIP);
	
	// Команда из Г2НВ ====================
	Nameless = Hlp_GetNpc(none_10_Nameless);
	Jack = Hlp_GetNpc(none_11_Jack);
	Lares = Hlp_GetNpc(none_12_Lares);
	Lee = Hlp_GetNpc(none_13_Lee);
	Milten = Hlp_GetNpc(none_14_Milten);
	Diego = Hlp_GetNpc(none_15_Diego);
	Lester = Hlp_GetNpc(none_16_Lester);
	Gorn = Hlp_GetNpc(none_17_Gorn);
	Vatras = Hlp_GetNpc(none_18_Vatras);
	
	// Крестьяне ==========================
	Kadar = Hlp_GetNpc(BAU_100_DS2P_KADAR);
	Harok = Hlp_GetNpc(BAU_101_DS2P_HAROK);
	Dil = Hlp_GetNpc(Bau_102_DS2P_Dil);
	Cimm = Hlp_GetNpc(BAU_103_DS2P_Cimm);
	Barok = Hlp_GetNpc(BAU_104_DS2P_Barok);
	Tamir = Hlp_GetNpc(BAU_105_DS2P_Tamir);
	Maria = Hlp_GetNpc(BAU_106_DS2P_Maria);
	Nikki = Hlp_GetNpc(BAU_107_DS2P_Nikki);
	Huno = Hlp_GetNpc(BAU_108_DS2P_Huno);
	Lulu = Hlp_GetNpc(BAU_109_DS2P_Lulu);
	Viola = Hlp_GetNpc(BAU_110_DS2P_Viola);
	Narev = Hlp_GetNpc(BAU_111_DS2P_Narev);
	Kara = Hlp_GetNpc(BAU_112_DS2P_Kara);
	Gustav = Hlp_GetNpc(BAU_113_DS2P_Gustav);
	Tom = Hlp_GetNpc(BAU_114_DS2P_Tom);
	Jinn = Hlp_GetNpc(BAU_115_DS2P_Jinn);
	Fart = Hlp_GetNpc(BAU_116_DS2P_Fart);
	Garon = Hlp_GetNpc(BAU_117_DS2P_Garon);
	
	// Пираты =============================
	Gard = Hlp_GetNpc(PIR_200_DS2P_GARD);
	Greg = Hlp_GetNpc(PIR_201_DS2P_Greg);
	Symon = Hlp_GetNpc(PIR_202_DS2P_Symon);
	Zedd = Hlp_GetNpc(PIR_203_DS2P_Zedd);
	Karah = Hlp_GetNpc(Pir_204_DS2P_Karah);
	Joseph = Hlp_GetNpc(PIR_205_DS2P_Joseph);
	SueBaby = Hlp_GetNpc(PIR_206_DS2P_SueBaby);
	LanSkeleton = Hlp_GetNpc(PIR_207_DS2P_LanSkeleton);
	GrayBeard = Hlp_GetNpc(PIR_208_DS2P_GrayBeard);
	Vales = Hlp_GetNpc(PIR_209_DS2P_Vales);
	Jorn = Hlp_GetNpc(PIR_210_DS2P_Jorn);
	Ado = Hlp_GetNpc(PIR_211_DS2P_Ado);
	Hobo = Hlp_GetNpc(PIR_215_DS2P_Hobo);
	//Pirat_Guard = Hlp_GetNpc(PIR_220_DS2P_Guard);
	//Pirat_Guard2 = Hlp_GetNpc(PIR_221_DS2P_Guard2);
	
	// Гоблины =============================
	KuLa = Hlp_GetNpc(Gobbo_DS2P_KuLa);
	BaBaPo = Hlp_GetNpc(Gobbo_DS2P_BaBaPo);
	RaDaPo = Hlp_GetNpc(Gobbo_DS2P_RaDaPo);
	TsaHaNauh = Hlp_GetNpc(Gobbo_DS2P_TsaHaNauh);
	JaAfFar = Hlp_GetNpc(Gobbo_DS2P_JaAfFar);
	YahYah = Hlp_GetNpc(Gobbo_DS2P_YahYah);
	
	// Прочие ==============================
	Ekor = Hlp_GetNpc(OUT_400_DS2P_Ekor);
	Izmar = Hlp_GetNpc(OUT_401_DS2P_Izmar);
	
	RakTarak = Hlp_GetNpc(Orc_DS2P_RakTarak);
	ArTush = Hlp_GetNpc(Orc_DS2P_ArTush);
};

