/******************************************************************
  ��� ������ �����:
  - ����� ITMI_DS_CHEKAN, �������� � useWithItem
  - ��������� �������� (������ ��������� "�����") ITMI_FUSINGGOLDTEMPLATE, �������� � DS_COININGMONEY_COND
	���
  - ����� ��� ������������ (������ ��������� "�����") ITMI_FUSING_RW_TEMPLATE, �������� � DS_COININGMONEY_COND
  - ���������� ���������:
		��� �����
			�������
			����������
		��� ������������:
			����������
			��������
			�� ������ ����
			�� ���������� ����
			�� ������

  ����� ������ �� �����
  
  �� ������ ��������:
	������ 1:4:
		�������
		����������
    ����������� ��� ����� 1:1:
		�� �����
		�� �������
		�� ������ ����
		�� ���������� ����
		�� ������
    ����������� ��� ������ 1:1:
		�� �����
		�� �������
		�� ������ ����
		�� ���������� ����
  
//NS - ������, �� � ��������� � � ���������� ���������� �������

******************************************************************/

var int COINING_Choise;		//��� � ������ ������ ��������
	const int COINING_Choise_Result = 1;
	const int COINING_Choise_Material = 2;
	const int COINING_Choise_Amount = 3;
	const int COINING_Choise_Finish = 4;

var int COINING_Result;				//��� ��������
	const int COINING_Result_Monet = 1;
	const int COINING_Result_ArrowHead = 2;
	const int COINING_Result_BoltHead = 3;
var int COINING_Material;			//�� ���� ��������
	const int COINING_Material_Gold = 1;
	const int COINING_Material_Silver = 2;
	const int COINING_Material_Iron = 3;
	const int COINING_Material_MagicOre = 4;
	const int COINING_Material_BlackOre = 5;
	const int COINING_Material_SpellBoundOre = 6;	//����� ������� + ���.����
var int COINING_Amount;				//������� �������� ��������

const int XPOS_Coining = 40;
const int YPOS_Coining = 35;

// ===============================================================

//��������� ��� ��������� (� ������!)
// �������, ������� � ��� �������
//                �����������:
//                COINING_Amount COINING_Result-��
//                �� COINING_Material
func void B_Coining_PrintResultString()
{
	AI_PrintScreen(PRINT_Made_Result,XPOS_Coining,YPOS_Coining - 2,FONT_ScreenSmall,2);
	// ������� � ����
	var string txt;	txt = IntToString(COINING_Amount);
	var int RusEndingType;	RusEndingType = C_GetRusEnding(COINING_Amount);

	if (COINING_Result == COINING_Result_Monet)
	{
		if (RusEndingType == 1)			{	txt = ConcatStrings(txt, " ������");	}
		else if (RusEndingType == 2)	{	txt = ConcatStrings(txt, " ������");	}
		else							{	txt = ConcatStrings(txt, " �����");	};
	}
	else if (COINING_Result == COINING_Result_ArrowHead)
	{
		if (RusEndingType == 1)			{	txt = ConcatStrings(txt, " ���������� ��� �����");	}
		else if (RusEndingType == 2)	{	txt = ConcatStrings(txt, " ����������� ��� �����");	}
		else							{	txt = ConcatStrings(txt, " ������������ ��� �����");	};
	}
	else if (COINING_Result == COINING_Result_Monet)
	{
		if (RusEndingType == 1)			{	txt = ConcatStrings(txt, " ���������� ��� ������");	}
		else if (RusEndingType == 2)	{	txt = ConcatStrings(txt, " ����������� ��� ������");	}
		else							{	txt = ConcatStrings(txt, " ������������ ��� ������");	};
	};
	AI_PrintScreen(txt,XPOS_Coining,YPOS_Coining,FONT_ScreenSmall,2);	
	//�� ����
	if (COINING_Material == COINING_Material_Gold)					{	txt = PRINT_MadeFrom_Gold;	}
	else if (COINING_Material == COINING_Material_Silver)			{	txt = PRINT_MadeFrom_Silver;	}
	else if (COINING_Material == COINING_Material_Iron)				{	txt = PRINT_MadeFrom_Iron;	}
	else if (COINING_Material == COINING_Material_MagicOre)			{	txt = PRINT_MadeFrom_MagicOre;	}
	else if (COINING_Material == COINING_Material_BlackOre)			{	txt = PRINT_MadeFrom_BlackOre;	}
	else if (COINING_Material == COINING_Material_SpellBoundOre)	{	txt = PRINT_MadeFrom_SpellBoundOre;	};
	AI_PrintScreen(txt,XPOS_Coining,YPOS_Coining + 2,FONT_ScreenSmall,2);	
};

//������� ���� �������� �� ���������� ���������
func int C_Coining_GetProperMonetAmount()
{
	if (COINING_Material == COINING_Material_Gold)	{
		return Npc_HasItems(self,Itmi_DarkSaga_Monetgold);
	}
	else if (COINING_Material == COINING_Material_Silver)	{
		return Npc_HasItems(self,Itmi_DarkSaga_MonetSilver);
	}
	else if (COINING_Material == COINING_Material_Iron)	{
		return Npc_HasItems(self,Itmi_DarkSaga_MonetIron);
	}
	else if (COINING_Material == COINING_Material_MagicOre)	{
		return Npc_HasItems(self,Itmi_DarkSaga_MonetMagicOre);
	}
	else if (COINING_Material == COINING_Material_BlackOre)	{
		return Npc_HasItems(self,Itmi_DarkSaga_MonetBlackOre);
	}
	else if (COINING_Material == COINING_Material_SpellBoundOre)	{
		return Npc_HasItems(self,Itmi_DarkSaga_MonetSpellBoundOre);
	};
	return 0;
};

//��������� ���������: ������� ���������, ������� ���������, ������� ���������
//������ �� ���������, ��� ������������ ��������� ������ �� �������
func void PC_Coining_DoIt()
{
	// �������
	if (COINING_Result == COINING_Result_Monet)	{
		if (COINING_Material == COINING_Material_Gold)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_Monetgold,COINING_Amount);
			CreateInvItems(self,ItMi_Gold,COINING_Amount * 4);
		}
		else if (COINING_Material == COINING_Material_Silver)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetSilver,COINING_Amount);
			CreateInvItems(self,Itmi_Silver,COINING_Amount * 4);
		};
	};
	// ����������� ��� �����
	if (COINING_Result == COINING_Result_ArrowHead)	{
		if (COINING_Material == COINING_Material_Silver)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetSilver,COINING_Amount);
			CreateInvItems(self,ItMi_SilverArrowHead,COINING_Amount);
		}
		else if (COINING_Material == COINING_Material_Iron)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetIron,COINING_Amount);
			CreateInvItems(self,ItMi_IronArrowHead,COINING_Amount);
		}
		else if (COINING_Material == COINING_Material_MagicOre)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetMagicOre,COINING_Amount);
			CreateInvItems(self,ItMi_MagicArrowHead,COINING_Amount);
		}
		else if (COINING_Material == COINING_Material_BlackOre)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetBlackOre,COINING_Amount);
			CreateInvItems(self,ItMi_BlackArrowHead,COINING_Amount);
		}
		else if (COINING_Material == COINING_Material_SpellBoundOre)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetSpellBoundOre,COINING_Amount);
			CreateInvItems(self,ItMi_SpellBoundArrowHead,COINING_Amount);
		};
	};
	// ����������� ��� ������
	if (COINING_Result == COINING_Result_BoltHead)	{
		if (COINING_Material == COINING_Material_Silver)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetSilver,COINING_Amount);
			CreateInvItems(self,ItMi_SilverBoltHead,COINING_Amount);
		}
		else if (COINING_Material == COINING_Material_Iron)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetIron,COINING_Amount);
			CreateInvItems(self,ItMi_IronBoltHead,COINING_Amount);
		}
		else if (COINING_Material == COINING_Material_MagicOre)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetMagicOre,COINING_Amount);
			CreateInvItems(self,ItMi_MagicBoltHead,COINING_Amount);
		}
		else if (COINING_Material == COINING_Material_BlackOre)
		{
			Npc_RemoveInvItems(self,Itmi_DarkSaga_MonetBlackOre,COINING_Amount);
			CreateInvItems(self,ItMi_BlackBoltHead,COINING_Amount);
		};
	};
	B_Coining_PrintResultString();
};

//============================ ����� ============================

// ��������� -------------------------------------------
func void PC_Coining_Choise_Result()
{
	COINING_Result = 0;
	Info_ClearChoices(PC_Coining);
	Info_AddChoice(PC_Coining, Dialog_Back,PC_Coining_Back);
	if (Npc_HasItems(self,ITMI_FUSING_RW_TEMPLATE))	{
		Info_AddChoice(PC_Coining, "����������� ��� ������...",PC_Coining_BoltHead);
		Info_AddChoice(PC_Coining, "����������� ��� �����...",PC_Coining_ArrowHead);
	};
	if (Npc_HasItems(self,ITMI_FUSINGGOLDTEMPLATE))	{	
		Info_AddChoice(PC_Coining, "������...",PC_Coining_Monet);
	};
};
// ��������� -------------------------------------------
func void PC_Coining_Choise_Material()
{
	COINING_Material = 0;
	Info_ClearChoices(PC_Coining);
	Info_AddChoice(PC_Coining, Dialog_Back,PC_Coining_Back);
	if (COINING_Result == COINING_Result_Monet)
	{
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetSilver))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_Silver, PC_Coining_Silver); };
		if (Npc_HasItems(self,				Itmi_DarkSaga_Monetgold))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_Gold, PC_Coining_Gold); };
	}
	else if (COINING_Result == COINING_Result_ArrowHead)
	{
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetBlackOre))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_BlackOre, PC_Coining_BlackOre); };
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetSpellBoundOre))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_SpellBoundOre, PC_Coining_SpellBoundOre); };
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetMagicOre))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_MagicOre, PC_Coining_MagicOre); };
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetSilver))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_Silver, PC_Coining_Silver); };
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetIron))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_Iron, PC_Coining_Iron); };
	}
	else if (COINING_Result == COINING_Result_BoltHead)
	{
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetBlackOre))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_BlackOre, PC_Coining_BlackOre); };
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetMagicOre))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_MagicOre, PC_Coining_MagicOre); };
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetSilver))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_Silver, PC_Coining_Silver); };
		if (Npc_HasItems(self,				Itmi_DarkSaga_MonetIron))
			{	Info_AddChoice(PC_Coining,		PRINT_MadeFrom_Iron, PC_Coining_Iron); };
	};
};
// ������� -------------------------------------------
func void PC_Coining_Choise_Amount()
{
	COINING_Amount = 0;
	Info_ClearChoices(PC_Coining);
	Info_AddChoice(PC_Coining, Dialog_Back,PC_Coining_Back);
	var int maxAmount;	maxAmount = C_Coining_GetProperMonetAmount();
	if (maxAmount > 1)	{
		Info_AddChoice(PC_Coining, "��������� ��� ���������",PC_Coining_All);
	};
	if (maxAmount >= 10)	{
		Info_AddChoice(PC_Coining, "��������� 10 ���������",PC_Coining_10);
	};
	if (maxAmount >= 5)	{
		Info_AddChoice(PC_Coining, "��������� 5 ���������",PC_Coining_5);
	};
		Info_AddChoice(PC_Coining, "��������� 1 ���������",PC_Coining_1);
};
// �������� ------------------------------------------
func void PC_Coining_Next()
{
	COINING_Choise += 1;
	Info_ClearChoices(PC_Coining);
	if (COINING_Choise == COINING_Choise_Result)	{PC_Coining_Choise_Result();}	else
	if (COINING_Choise == COINING_Choise_Material)	{PC_Coining_Choise_Material();}	else
	if (COINING_Choise == COINING_Choise_Amount)	{PC_Coining_Choise_Amount();} else
	if (COINING_Choise == COINING_Choise_Finish)	{PC_Coining_DoIt();};
};
func void PC_Coining_Back()
{
	COINING_Choise -= 2;
	PC_Coining_Next();
};

//============================ �������� ============================

// ��������� -------------------------------------------
func void PC_Coining_Monet()
{
	COINING_Result = COINING_Result_Monet;
	PC_Coining_Next();
};
func void PC_Coining_ArrowHead()
{
	COINING_Result = COINING_Result_ArrowHead;
	PC_Coining_Next();
};
func void PC_Coining_BoltHead()
{
	COINING_Result = COINING_Result_BoltHead;
	PC_Coining_Next();
};
// ��������� -------------------------------------------
func void PC_Coining_Gold()
{
	COINING_Material = COINING_Material_Gold;
	PC_Coining_Next();
};
func void PC_Coining_Silver()
{
	COINING_Material = COINING_Material_Silver;
	PC_Coining_Next();
};
func void PC_Coining_Iron()
{
	COINING_Material = COINING_Material_Iron;
	PC_Coining_Next();
};
func void PC_Coining_MagicOre()
{
	COINING_Material = COINING_Material_MagicOre;
	PC_Coining_Next();
};
func void PC_Coining_BlackOre()
{
	COINING_Material = COINING_Material_BlackOre;
	PC_Coining_Next();
};
func void PC_Coining_SpellBoundOre()
{
	COINING_Material = COINING_Material_SpellBoundOre;
	PC_Coining_Next();
};
// ������� -------------------------------------------
func void PC_Coining_1()
{
	COINING_Amount = 1;
	PC_Coining_Next();
};
func void PC_Coining_5()
{
	COINING_Amount = 5;
	PC_Coining_Next();
};
func void PC_Coining_10()
{
	COINING_Amount = 10;
	PC_Coining_Next();
};
func void PC_Coining_All()
{
	COINING_Amount = C_Coining_GetProperMonetAmount();
	PC_Coining_Next();
};

// ========================== ������� =====================================

instance PC_COINING_End(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 999;
	condition 	= PC_COINING_End_Condition;
	information = PC_COINING_End_Info;
	permanent 	= TRUE;
	description = Dialog_Ende;
};
func int PC_COINING_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_COININGMONEY)
	{
		return TRUE;
	};
};
func void PC_COINING_End_Info()
{
	b_endproductiondialog();
};
//----------------------------------
instance PC_COINING(C_Info)
{
	npc 		= PC_Hero;
	nr 			= 1;
	condition 	= PC_COINING_Condition;
	information = PC_COINING_Info;
	permanent 	= TRUE;
	description = "��������...";
};
func int PC_COINING_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_COININGMONEY)
	{
		return TRUE;
	};
};
func void PC_COINING_Info()
{
	COINING_Choise = 0;
	PC_Coining_Next();
};

// ============================= MOB ======================================
// �������
func int DS_COININGMONEY_COND()
{
	var int have_no_templates;	have_no_templates = FALSE;
	var int have_no_monets;		have_no_monets = FALSE;
	var int cant_coin_money;	cant_coin_money = FALSE;
	var int cant_coin_heads;	cant_coin_heads = FALSE;
	
	if(Npc_IsPlayer(self))
	{
		// ��� ������� �������
		if(!Npc_HasItems(self,ITMI_FUSINGGOLDTEMPLATE) && !Npc_HasItems(self,ITMI_FUSING_RW_TEMPLATE))
		{
			have_no_templates = TRUE;
			PrintScreen(PRINT_CoiningItemsTemplatesMissing,-1,34,Font_Screen,2);
		};
		// ��� ������� ���������
		if(!Npc_HasItems(self,Itmi_DarkSaga_Monetgold) && !Npc_HasItems(self,Itmi_DarkSaga_MonetSilver)
			&& !Npc_HasItems(self,Itmi_DarkSaga_MonetBlackOre)	&& !Npc_HasItems(self,Itmi_DarkSaga_MonetSpellBoundOre)
			&& !Npc_HasItems(self,Itmi_DarkSaga_MonetIron) && !Npc_HasItems(self,Itmi_DarkSaga_MonetMagicOre))
		{
			have_no_monets = TRUE;
			PrintScreen(PRINT_CoiningItemsMonetsMissing,-1,37,Font_Screen,3);
		};
		// ������ ���
		if((have_no_templates == TRUE) || (have_no_monets == TRUE))
		{	
			return FALSE;
		};
		// �� ����� �������� ������
		if(Npc_HasItems(self,ITMI_FUSINGGOLDTEMPLATE))	{
			if (!Npc_HasItems(self,Itmi_DarkSaga_Monetgold) || !Npc_HasItems(self,Itmi_DarkSaga_MonetSilver))
			{
				cant_coin_money = TRUE;
			};
		};
		// �� ����� �������� �����������
		if(Npc_HasItems(self,ITMI_FUSING_RW_TEMPLATE))	{
			if (!Npc_HasItems(self,Itmi_DarkSaga_MonetSilver) || !Npc_HasItems(self,Itmi_DarkSaga_MonetIron)
				|| !Npc_HasItems(self,Itmi_DarkSaga_MonetMagicOre) || !Npc_HasItems(self,Itmi_DarkSaga_MonetSpellBoundOre)
				|| !Npc_HasItems(self,Itmi_DarkSaga_MonetBlackOre))
			{
				cant_coin_heads = TRUE;
			};
		};
		// ������ �� ������������� ����������
		if((cant_coin_money == TRUE) && (cant_coin_heads == TRUE))
		{
			PrintScreen(PRINT_CoiningItemsTemplatesAndMonetsMissing,-1,34,Font_Screen,3);
			return FALSE;
		};		
	};
	// ����� - ��� ����.
	return TRUE;
};

//������ �������
func void DS_COININGMONEY_S1()
{
	if(Npc_IsPlayer(self))
	{
		if (DS_COININGMONEY_COND())	//NS - �� ���������� � ZEN
		{
			self.aivar[AIV_INVINCIBLE] = TRUE;
			PLAYER_MOBSI_PRODUCTION = MOBSI_COININGMONEY;
			AI_ProcessInfos(self);
		}
		else
		{
			AI_UseMob(self, "MONETANVIL", -1);
		};
	};
};

