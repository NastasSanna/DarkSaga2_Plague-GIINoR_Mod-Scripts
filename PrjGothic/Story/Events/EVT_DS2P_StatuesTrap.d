
/************************************************
                ������� ������
  ��� ������ (������, ���, ������), ��� ������.
  ��������� ����� � �������� ������.
  ��� �������, ������ ������.
/************************************************/

// ���� ��������� ������
const string EVT_StatuesTrap_InsertPoint = "DP_DRAGONPEAK_WAYDOWN_CAVE_02";

// ������
func void EVT_STATUESTRAP_KNIGHT()
{
	Wld_InsertNpc(Skeleton_Lord, EVT_StatuesTrap_InsertPoint);
};

// ���
func void EVT_STATUESTRAP_ORC()
{
	Wld_InsertNpc(UndeadOrcWarrior, EVT_StatuesTrap_InsertPoint);
};

// ������
func void EVT_STATUESTRAP_GOBBO()
{
	Wld_InsertNpc(Gobbo_BerserkSkeleton, EVT_StatuesTrap_InsertPoint);
};
