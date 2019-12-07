
/******************************************************
  C������ ����� WP 
 ���������� x,y,z � ���������� �������
 ���������� ��������� �� ��������� WP
 
  ����������� !!!
 
  WP ��������� � ����������� � Waynet, ����������� WP ���������
 �������� ������ ����� ����������-��������
 
//*****************************************************/
func int Wld_InsertWP(var int x, var int y, var int z, var string name)
{	
	//insert WP
	var int WP_Ptr; var zCWaypoint WP;
	
	//zCWaypoint * __thiscall zCWayNet::InsertWaypoint(float float float)     	0x007ACFF0
	const int zCWayNet__InsertWaypoint = 8048624;
	CALL_FloatParam(z);
	CALL_FloatParam(y);
	CALL_FloatParam(x);
	CALL__thiscall(_@(MEM_Waynet), zCWayNet__InsertWaypoint);
	WP_Ptr = CALL_RetValAsPtr();
	
	//WP ������� � ��� � WayNet
	if (WP_Ptr != 0)
	{
		//void __thiscall zCWaypoint::SetName(zSTRING &)    	0x007AFBB0
		const int zCWaypoint__SetName = 8059824;
		WP = _^(WP_Ptr);
		CALL_zStringPtrParam(name);
		CALL__thiscall(WP_Ptr, zCWaypoint__SetName);
		WP._zCObject_objectName = name;
		
		//void __thiscall zCWayNet::CreateVobDependencies(zCWorld *)     	0x007ADCF0	0	7
		const int zCWayNet__CreateVobDependencies = 8051952;
		CALL_PtrParam(_@(MEM_World));
		CALL__thiscall(_@(MEM_Waynet), zCWayNet__CreateVobDependencies);
		
		//void __thiscall zCWaypoint::CorrectHeight(zCWorld *) 	0x007B00A0		0	5
		const int zCWaypoint__CorrectHeight = 8061088;
		CALL_PtrParam(_@(MEM_World));
		CALL__thiscall(WP_Ptr, zCWaypoint__CorrectHeight);
		
		MEM_Debug(CS3("WP with name ",Wp.name," inserted"));
		//MEM_Debug(WP._zCObject_objectName);
		//MEM_Debug(ToStringf(WP.pos[0]));
		//MEM_Debug(ToStringf(WP.pos[1]));
		//MEM_Debug(ToStringf(WP.pos[2]));
		//MEM_Debug(IntToString(WP.wpvob));
	}
	else
	{
		MEM_Debug(CS3("WP with name ",name," wasn't inserted"));
	};
	return WP_Ptr;
};

/****************************************************
	������� ��� way, ��������� � ������ WP
 (= �������� ��� �� waynet).
//***************************************************/
func void WP_RemoveAllWays(var int wp_ptr)
{
	//void __thiscall zCWayNet::DeleteWay(zCWaypoint * zCWaypoint *)      	0x007AD4F0
	const int zCWayNet__DeleteWay = 8049904;
	var zCWaypoint WP;	WP = _^(wp_ptr);	//��� WP
	//���� ���� way
	var int loop; loop = MEM_StackPos.position;
	if (WP.wayList_next)	{	//������ �� ����
		var zCList lst;	lst = _^(WP.wayList_next);
		if (lst.data)	{	//� ���� way
			var oCWay way;	 way = _^(lst.data);	//����� way
			//������� way �� waynet �� �������� wp
			CALL_PtrParam(way.left);
			CALL_PtrParam(way.right);
			CALL__thiscall(wp_ptr, zCWayNet__DeleteWay);
			//���������
			MEM_StackPos.position = loop;
		};
	};
};

/****************************************************
	������� ����� way ����� wp1 � wp2
//***************************************************/
//�� ����������
func void WP_CreateWay(var int wp1_ptr, var int wp2_ptr)
{
	//void __thiscall zCWayNet::CreateWay(zCWaypoint * zCWaypoint *)   	0x007AD420
	const int zCWayNet__CreateWay = 8049696;
	CALL_PtrParam(wp2_ptr);
	CALL_PtrParam(wp1_ptr);
	CALL__thiscall(_@(MEM_Waynet), zCWayNet__CreateWay);
};
//�� ������
func void WP_CreateWayByNames(var string WP1, var string WP2)
{
	var int wp1_ptr;	wp1_ptr = zCWayNet_GetWaypoint(WP1);
	var int wp2_ptr;	wp2_ptr = zCWayNet_GetWaypoint(WP2);
	if (wp1_ptr && wp2_ptr)	{
		WP_CreateWay(wp1_ptr, wp2_ptr);
	};
};

/****************************************************
	������ WP ��� �������� ��
  WP ����� ��������� � �����, ��� ��������� npc
 � �������� � ����� ��������� WP. ������ ����� �����
 �������.
  WP ��� ������ ���� � ���� (������� ������ �� ��������)
//***************************************************/
func void B_SetWaitWP(var c_npc npc, var string wpname)
{
	var oCNpc slf;	slf = Hlp_GetNpc(npc);
	var int wp_ptr;	wp_ptr = zCWayNet_GetWaypoint(wpname);
	var zCWaypoint wp;
	var int self_wp_ptr;	self_wp_ptr = zCWayNet_GetWaypoint(Npc_GetNearestWP(npc));
	//���� WP?
	if (wp_ptr != 0)	{
		if (self_wp_ptr == wp_ptr) {
			self_wp_ptr = zCWayNet_GetWaypoint(Npc_GetNextWP(npc));
		};
		//�����������
		wp = _^(wp_ptr);
		wp.pos[0] = slf._zCVob_trafoObjToWorld[3];
		wp.pos[1] = slf._zCVob_trafoObjToWorld[7];
		wp.pos[2] = slf._zCVob_trafoObjToWorld[11];
		//�������� waynet
		WP_RemoveAllWays(wp_ptr);
		WP_CreateWay(wp_ptr, self_wp_ptr);
	}
	else	//��� WP - ��������
	{
		wp_ptr = Wld_InsertWP(slf._zCVob_trafoObjToWorld[3],slf._zCVob_trafoObjToWorld[7],slf._zCVob_trafoObjToWorld[11], wpname);
		//�������� waynet
		WP_CreateWay(wp_ptr, self_wp_ptr);
	};
};


