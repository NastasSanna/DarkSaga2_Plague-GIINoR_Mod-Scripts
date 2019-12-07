instance BAU_117_DS2P_Garon(Npc_Default)
{
	name[0] = "�����";
	guild = GIL_BAU;
	id = 117;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,ItMw_1h_Bau_Mace);	//�������� ������ ������
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Mordrag,BodyTex_N,ITAR_Bau_L);
	Mdl_SetModelFatness(self,0.7);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,40);
	daily_routine = Rtn_Start_117;
	
	CreateInvItem(self, ItBe_DS2P_Garon);
};
func void Rtn_Start_117()	//����� � ������ � ������
{
	TA_Sit_Campfire(8,0,22,0,"");
	TA_Sit_Campfire(22,0,8,0,"");
};
func void Rtn_RunAway_117()	//����� � ������ �� ������
{
	TA_RunToWP(8,0,22,0,"");
	TA_RunToWP(22,0,8,0,"");
};
func void Rtn_PrePirat_117()	//� ������, ��������� ����� �������
{
	TA_Stand_WP(8,0,22,0,"");
	TA_Stand_WP(22,0,8,0,"");
};
func void Rtn_Pirat_117()	//���� �������
{
};
func void Rtn_GoHome_117()	//������������ � ����, ��� ���� ��������
{
	TA_Stand_WP(8,0,22,0,"");
	TA_Stand_WP(22,0,8,0,"");
};
func void Rtn_Home_117()	//������� ����, �� ����� �� ������� ������� � �������
{
};
func void Rtn_GoForest_117()	//������ � ��� � ��� �����
{
	TA_Stand_WP(8,0,22,0,"");
	TA_Stand_WP(22,0,8,0,"");
};
func void Rtn_WithHunters_117()	//����� ���� � ��� � ��������� (����� �����)
{
};
