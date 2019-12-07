instance PIR_208_DS2P_GrayBeard(Npc_Default)
{
	name[0] = "����� ������";
	guild = GIL_PIR;
	id = 208;
	voice = 13;
	flags = 0;
	npcType = npctype_pir_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_Addon_PIR2hAxe);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_ToughBart01,BodyTex_N,ITAR_PIR_L_DS);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_PreStart_208;
};
func void Rtn_PreStart_208()	//�������� �������������� (�� ����� �������)
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};
func void Rtn_GoToGregToPirs_208()	//���� � ����� ��� ������ � �������� �� ��
{
	TA_STAND_ReadyWeapon(8,0,20,0,"");
	TA_STAND_ReadyWeapon(8,0,20,0,"");
};
func void Rtn_Start_208()	//�������� ������� ��� ��������� � �������
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};

func void Rtn_SueAttack_208()	//����� ����� ��, ��� ������� �� ���
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};

func void Rtn_Comp_ShadowBeast_01_208()	//����� � ���� ����� ���������� (�� �������)
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};

func void Rtn_GoToCamp_208()	//���� �� ����� � ������
{
	TA_STAND_WP(8,0,20,0,"");
	TA_STAND_WP(8,0,20,0,"");
};