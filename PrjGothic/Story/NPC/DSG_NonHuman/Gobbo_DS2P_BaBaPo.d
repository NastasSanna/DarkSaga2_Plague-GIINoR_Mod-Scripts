
//������� �� �������, ���������� ����������
//����� ������� ��������� ������
//����� ������������ �� ������

instance Gobbo_DS2P_BaBaPo(Mst_Default_Gobbo_Black)
{
	name[0] = "��-��-��";
	id = 1903;
	npcType = NPCTYPE_MAIN;
	aivar[AIV_EnemyOverride] = TRUE;
	//aivar[AIV_StoryFlags] = AIV_StoryFlag_SwampGoblin; ������ ����� ������!
	B_SetVisuals_Gobbo_Black();
	Npc_SetToFightMode(self,ItMw_1h_Bau_Mace);
};
