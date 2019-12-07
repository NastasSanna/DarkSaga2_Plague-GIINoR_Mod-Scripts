// Запускается при попадании на локацию "Сон Лана"


instance DIA_LanSkeleton_SK_Dream(C_Info)
{
	npc = PIR_2071_DS2P_LanSkeleton_SK_Dream;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_LanSkeleton_SK_Dream_condition;	
	information = DIA_LanSkeleton_SK_Dream_info;
	description = " ";
};

func int DIA_LanSkeleton_SK_Dream_condition()
{	
	return TRUE;
};

func void DIA_LanSkeleton_SK_Dream_info()
{
	AI_Output(self,other,"DIA_LanSkeleton_SK_Dream_13_00");	//Что, еще один человек? Откуда?
	AI_Output(other,self,"DIA_LanSkeleton_SK_Dream_15_01");	//Уютненько у тебя здесь. Пожить пустишь?
	AI_Output(self,other,"DIA_LanSkeleton_SK_Dream_13_02");	//Да хоть навсегда. Как только закончу с этим трусливым индивидом, сразу за тебя примусь. Подожди своей очереди.
	AI_Output(other,self,"DIA_LanSkeleton_SK_Dream_15_03");	//Может, сразу решим наши разногласия? Я тут чтобы маленечко тебя убить. Не против?
	AI_Output(self,other,"DIA_LanSkeleton_SK_Dream_13_04");	//О, клоун! Сказал же, жди своей очереди.
	AI_Output(other,self,"DIA_LanSkeleton_SK_Dream_15_05");	//Не, не люблю ждать.
	AI_Output(self,other,"DIA_LanSkeleton_SK_Dream_13_06");	//Что ж, если ты так жаждешь умереть.
	B_Attack(self,other,AR_NONE,0); // Скелет-Лан нападает на ГГ
	AI_StopProcessInfos(self);
};
	

// Запускается, если убили Скелета-Лана, и открыли дверь в клетку


instance DIA_LanSkeleton_HM_Dream(C_Info)
{
	npc = PIR_2072_DS2P_LanSkeleton_HM_Dream;
	nr = 1;
	permanent = FALSE;
	important = TRUE;
	condition = DIA_LanSkeleton_HM_Dream_condition;	
	information = DIA_LanSkeleton_HM_Dream_info;
	description = " ";
};

func int DIA_LanSkeleton_HM_Dream_condition()
{
	if (Npc_IsDead(PIR_2071_DS2P_LanSkeleton_SK_Dream) && (LansDream_CageIsOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_LanSkeleton_HM_Dream_info()
{
	AI_Output(self,other,"DIA_LanSkeleton_HM_Dream_13_00");	//Ох, спасибо тебе, ты меня спас.
	AI_Output(other,self,"DIA_LanSkeleton_HM_Dream_15_01");	//Просыпайся!!!
	// Тут надо обратно сменить уровень
	AI_StopProcessInfos(self);
};
	