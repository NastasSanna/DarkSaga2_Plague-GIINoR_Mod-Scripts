
//������ ���� ������� ��-��
instance Wolf_DS2P_TaKoPi(Mst_Default_Wolf)
{
	id = 2801;
	name[0] = "��-��-��";
	guild = GIL_WOLF;	//TEST NEEDED - ����� �� ������� �� ��������
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	B_SetAttitude(self,ATT_FRIENDLY);
	B_SetVisuals_Wolf();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
	attribute[ATR_HITPOINTS] = attribute[ATR_HITPOINTS_MAX] / 2;	//���� �����
	daily_routine = Rtn_Start_2801;
};

const string WP_TaKoPi_Lost = "VILLAGE";	//UNFINISHED - ��� ����� ���������� ��-��-��
const string WP_TaKoPi_Wait = "DP_WAIT_TAKOPI";	//UNFINISHED - ��� ��-��-�� ���� ��
const string WP_TaKoPi_Home = "";	//UNFINISHED - ��� ��-��-�� ����� � ��-��

func void Rtn_Start_2801()
{
	TA(self, 8,22, ZS_MM_Rtn_Roam, WP_TaKoPi_Lost);
	TA(self, 22,8, ZS_MM_Rtn_Roam, WP_TaKoPi_Lost);
};
func void Rtn_Follow_2801()
{
	TA_Follow_Player(8,0,22,0, WP_TaKoPi_Lost);
	TA_Follow_Player(22,0,8,0, WP_TaKoPi_Lost);
};
func void Rtn_Wait_2801()
{
	TA_SitOrk(8,0,22,0, WP_TaKoPi_Wait);
	TA_SitOrk(22,0,8,0, WP_TaKoPi_Wait);
};
//������� ����� - UNFINISHED � ��-��
func void Rtn_Home_2801()
{
	TA(self, 8,22, ZS_MM_Rtn_Roam, WP_TaKoPi_Home);
	TA(self, 22,8, ZS_MM_Rtn_Roam, WP_TaKoPi_Home);
};

