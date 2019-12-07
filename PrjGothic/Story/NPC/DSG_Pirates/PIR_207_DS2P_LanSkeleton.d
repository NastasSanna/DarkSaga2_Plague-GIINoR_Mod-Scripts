instance PIR_207_DS2P_LanSkeleton(Npc_Default)
{
	name[0] = "���-������";
	guild = GIL_PIR;
	id = 207;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Piratensaebel);
	//B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_NormalBart05,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"Ske_PirSail_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_207;
	
	CreateInvItem(self, ItWr_DS2P_Map_LanSkeleton);//����� ��������
};
func void Rtn_PreStart_207()	//�������� �������������� (�� ����� �������)
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};
func void Rtn_GoToGregToPirs_207()	//���� � ����� ��� ������ � �������� �� ��
{
	TA_STAND_ReadyWeapon(8,0,20,0,"");
	TA_STAND_ReadyWeapon(8,0,20,0,"");
};
func void Rtn_Start_207()	//�������� ������� ��� ��������� - �������� �������
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};
func void Rtn_DEATH_207()
{	//������ ����
	TA_FleeToWP(8,0,22,0,"");
	TA_FleeToWP(22,0,8,0,"");
};

// ��� ��� ������, ������� ����� ����� ������ �� ������� "��� ����"
instance PIR_2071_DS2P_LanSkeleton_SK_Dream(Npc_Default)
{
	name[0] = "������-���";
	guild = GIL_PIR;
	id = 2071;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Piratensaebel);
	//B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_NormalBart05,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"Ske_PirSail_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_2071;
};
func void Rtn_Start_2071()	//����� ����� ������
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};

// ��� ��� �������, ������� ����� � ������ �� ������� ��� ����


instance PIR_2072_DS2P_LanSkeleton_HM_Dream(Npc_Default)
{
	name[0] = "���";
	guild = GIL_PIR;
	id = 2072;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Piratensaebel);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_NormalBart05,BodyTex_N,ITAR_PIR_L_DS);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	//Mdl_SetVisualBody(self,"Ske_PirSail_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_2072;
};
func void Rtn_Start_2072()	//����� � ������
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};

