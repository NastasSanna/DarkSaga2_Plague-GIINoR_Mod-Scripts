var int willteachhuntkarakam;
func void b_TeachAnimalTrophy_Karakam()
{
	Info_ClearChoices(DIA_Tamir_TeachHunting);
	Info_AddChoice(DIA_Tamir_TeachHunting,Dialog_Back,DIA_Tamir_TeachHunting_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth,0),DIA_Tamir_TeachHunting_Teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws,0),DIA_Tamir_TeachHunting_Claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin,0),DIA_Tamir_TeachHunting_ReptileSkin);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting,0),DIA_Tamir_TeachHunting_BFSting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing,0),DIA_Tamir_TeachHunting_BFWing);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn,0),DIA_Tamir_TeachHunting_DrgSnapperHorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles,0),DIA_Tamir_TeachHunting_Mandibles);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn,0),DIA_Tamir_TeachHunting_ShadowHorn);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate,0),DIA_Tamir_TeachHunting_CrawlerPlate);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
	{		Info_AddChoice(DIA_Tamir_TeachHunting,b_Ds_buildString_TeachPayment_Talent(other,"",NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue,0),DIA_Tamir_TeachHunting_FireTongue);
	};
};
instance DIA_Tamir_TeachHunting(C_Info)
{
	npc = BAU_105_DS2P_Tamir;
	nr = 140;
	condition = DIA_Tamir_TeachHunting_condition;
	information = DIA_Tamir_TeachHunting_info;
	permanent = true;
	description = "����� ���� �������� ������ � ��������.";
};
func int DIA_Tamir_TeachHunting_condition()
{
	if(Npc_KnowsInfo(other,DIA_Tamir_TeachMeTrophiesAnimals))
	{
		return TRUE;
	};
};
func void DIA_Tamir_TeachHunting_info()
{
	AI_Output(other,self,"DIA_Tamir_TeachHunting_15_00");	//����� ���� �������� ������ � ��������.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) 	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE) 
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) 
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) 	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE))
	{
		AI_Output(self,other,"DIA_Tamir_TeachHunting_12_00");	//��� ������� �� ����, ��� �� ��� ������.
		//AI_Output(self,other,"DIA_Tamir_TeachHunting_12_01");	//��� ����� ���� ����� � �� ��������� �� ��� ������.
		b_TeachAnimalTrophy_Karakam();
	}
	else
	{
		AI_Output(self,other,"DIA_Tamir_TeachHunting_12_01");	//� �� ���� ��� ������� ���� ������, ��� �� ��� �� ������.
	};
};
func void DIA_Tamir_TeachHunting_BACK()
{
	Info_ClearChoices(DIA_Tamir_TeachHunting);
};
func void DIA_Tamir_TeachHunting_Claws()
{
	//var int x;
	//x = 0;
	//x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws);
	//if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	//{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_Claws_03_00");	//����� �� ����� ������������ �� ������ �������. ����� ����� �������� ����� �����.
			AI_Output(self,other,"DIA_Tamir_TeachHunting_Claws_03_01");	//���� ���� ������ ���� ������ ��������. ����� ����� �������� ����� ������� ������.
			AI_Output(self,other,"DIA_Tamir_TeachHunting_Claws_03_02");	//�������� ������ ������ �������� ����������� ����� �� �����.
		};
	//}
	//else
	//{
	//	AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	//};
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_Teeth()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_Teeth_03_00");	//����� ����� �������� ���� ���������. ������ ������� ����� ����� ������ ����� �� ��� ���������.
			AI_Output(self,other,"DIA_Tamir_TeachHunting_Teeth_03_01");	//����� ����� �������� �� �� ������ ������ ������.
		};
	/*}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_ReptileSkin()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_Fur_03_00");	//����� ������� �����, ������ �������� ������ � ������ ������ ���.
			AI_Output(self,other,"DIA_Tamir_TeachHunting_Fur_03_01");	//����� �����, �� ����� ������� ����� �����, �������� �� � ���������.
		};
	/*}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_BFSting()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_BFSting_03_00");	//� ���� ��� ���� ������ ����� �� �����.
			AI_Output(self,other,"DIA_Tamir_TeachHunting_BFSting_03_01");	//���� ������ ���, ���� ���������� ����� ������, � �� ������� �������� ��� ��� ������ ����.
		};
	/*}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_BFWing()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_BFWing_03_00");	//����� ����� �������� ������ �������� ����, ������� �� ������ ������� ���� ��� ����� ����� � ����.
			AI_Output(self,other,"DIA_Tamir_TeachHunting_BFWing_03_01");	//����� ���� ����� ����������, ����� �� ��������� ������ ����� �������. ��� �� ����� ������ ������, ���� �� ��������� ��.
		};
	/*}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_DrgSnapperHorn()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_DrgSnapperHorn_03_01");	//����� �������� ��� ������� � ��� ����� ��������� � ��������� ����������� ���.
			AI_Output(self,other,"DIA_Tamir_TeachHunting_DrgSnapperHorn_03_02");	//���� �� �� ��������� �� ������, ����� ������� ��� ������ ����� � ������ �������.
		};
	/*}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_Mandibles()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_Mandibles_08_00");	//����� ��������� ��� ������� �������� ����� �������� ��� ������ ����� �������� �������������� ������. ��� ����� ������� ����� � ������ ���� ��������.
		};
	/*}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_ShadowHorn()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_ShadowHorn_08_00");	//����� �������� ��� ���������, ������ �� ���� ���� ����� �����, �������� ��� ���� ��������� ������ �����.
		};
	/*}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_CrawlerPlate()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			AI_Output(self,other,"DIA_Tamir_TeachHunting_CrawlerPlate_07_00");	//������� � ��������� ����� �������, �� ��� ��� �� ����� ������� ��� ������ ������� �������� ��������.
		};
	/*}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};
func void DIA_Tamir_TeachHunting_FireTongue()
{
	/*var int x;
	x = 0;
	x = b_ds_GetTeachPaymentAmount(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue);
	if(c_Npc_DS_HasItems_Scr(other,B_DS_GetTeachPaymentType(),x,YPos_5,TRUE))
	{*/
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
		{
			//b_giveInvItems(other,self,B_DS_GetTeachPaymentType(),x);
			//B_DS_ClearGold();
			//AI_Output(self,other,"DIA_Tamir_TeachHunting_CrawlerPlate_07_00");	//������� � ��������� ����� �������, �� ��� ��� �� ����� ������� ��� ������ ������� �������� ��������.
		};
/*	}
	else
	{
		AI_Output(self,other,"DIA_Karakam_NoGold_08_00");	//������� ������.
	};*/
	b_TeachAnimalTrophy_Karakam();
};


