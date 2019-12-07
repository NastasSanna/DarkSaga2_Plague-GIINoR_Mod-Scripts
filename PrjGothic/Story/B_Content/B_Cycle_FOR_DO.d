/*---------------------------------------------------------------------------
-------------�������� ������� ��������� �����--------------------------------
----------------------------------------------------------------------------*/

//
//������� ���� ���������� ��� �� ���������� �����
//
func void B_Cycle_Wld_InsertNpc(var int npcInstance, var string PointName, var int count)
{
	var string point;	//����� ������� ���
	var int i;				//���������� ��� ��������
	if(count <= 1) {return;};
	count -= 1;
	POINT = ConcatStrings(PointName,IntToString(count+1));
	Wld_InsertNpc(npcInstance,POINT);
	B_Cycle_Wld_InsertNpc(npcInstance,PointName,count);
};
//������� ������� ����������� ����������� �� ������ "����� ������"
const int npc_Count_TamirScavengers = 10;	//���-�� �����������. ����� ���� �������� �� ���������.
const string npc_point_TamirScavengers = "FP_ROAM_SCAVENGER_Q_TAMIR_0";	//����� ������� �����������

func void B_DSG_Insert_TamirScavengers()
{
	B_Cycle_Wld_InsertNpc(Scavenger_Demon,npc_point_TamirScavengers,npc_Count_TamirScavengers);
};

//������� ������� ������ �� ������ "����� ������"
const int npc_Count_TamirWargs= 10;	//���-�� ������. ����� ���� �������� �� ���������.
const string npc_point_TamirWargs = "FP_ROAM_WARG_Q_TAMIR_0";	//����� ������� ������

func void B_DSG_Insert_TamirWargs()	//���-�� ������. ����� ���� �������� �� ���������! �����������!
{
	B_Cycle_Wld_InsertNpc(Scavenger_Demon,npc_point_TamirWargs,npc_Count_TamirWargs);
};
