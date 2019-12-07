
//������-��� �� ������
//����� ������� ���� � �������� � �������
instance Gobbo_DS2P_JaAfFar(Mst_Default_Gobbo_Green)
{
	name[0] = "���-��-���";
	id = 1906;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_Gobbo_Green();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
	daily_routine = Rtn_Start_1906;
};

const string WP_JaAfFar_Wait = "DP_WAIT_JaAfFar";	//UNFINISHED - ��� ���-��-��� ���� ��
const string WP_JaAfFar_Mill = "DP_";	//UNFINISHED - ��� ���-��-��� �������� � ��������

func void Rtn_Start_1906()
{
	TA_SitOrk(8,0,22,0, "");
	TA_SitOrk(22,0,8,0, "");
};
func void Rtn_Follow_1906()
{
	TA_Follow_Player(8,0,22,0, WP_JaAfFar_Wait);
	TA_Follow_Player(22,0,8,0, WP_JaAfFar_Wait);
};
func void Rtn_Wait_1906()
{
	TA_Stand_WP(8,0,22,0, WP_JaAfFar_Wait);
	TA_Stand_WP(22,0,8,0, WP_JaAfFar_Wait);
};
//���� 
func void Rtn_Mill_1906()
{
	TA_Stand_WP(8,0,22,0, WP_JaAfFar_Mill);
	TA_Stand_WP(22,0,8,0, WP_JaAfFar_Mill);
};
