
//�������� �� ����� � �������

instance Gobbo_DS2P_YahYah(Mst_Default_DS_Gobbo_Berserk)
{
	name[0] = "��-��";
	id = 1904;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin;
	B_SetVisuals_DS_Gobbo_Berserk1();
	// ����������� � ����� ������� ����
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 250;
	aivar[REAL_STRENGTH] = 250;
	Npc_SetToFightMode(self,ItMw_Doppelaxt);
	//����� �������, �������� �����, 50 �������, 3 ������� ������, 2 ����� � ����� ����������
	CreateInvItems(self, ItPl_Dex_Herb_01, 1);
	CreateInvItems(self, ItPo_Health_03, 1);
	CreateInvItems(self, ItMi_Gold, 50);
	CreateInvItems(self, ItMi_GoldRing, 3);
	CreateInvItems(self, ItAt_SharkTeeth, 2);
	CreateInvItems(self, ItAt_SharkSkin, 1);
	
	daily_routine = Rtn_Start_1904;
};

func void Rtn_Start_1904()
{
	TA_Guard_Passage(8,0,21,0,"DP_FOREST_GOBBOVIL_ENTANCE");
	TA_Guard_Passage(21,0,8,0,"DP_FOREST_GOBBOVIL_ENTANCE");
};
func void Rtn_Open_1904()
{
	TA_Guard_Passage(8,0,21,0,"DP_FOREST_GOBBOVIL_ENTANCE_01");
	TA_Guard_Passage(21,0,8,0,"DP_FOREST_GOBBOVIL_ENTANCE_01");
};
