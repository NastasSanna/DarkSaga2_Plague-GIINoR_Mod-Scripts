
/**********************************************************

  ��������� Ikarus.

  ��������� �������� ����� ��������� ��������, � ����������
npc. ������ ���������� �������� ����� ������� ��� �������
B_GiveTraderInv_...(). � ���� �������� ������ ��������� 
��������, ��� AIVAR � �.�. - � �������� npc.
  � B_DSG_Talk_End() �������� ����� B_TradeSwapBack().
  �������� B_GiveTraderInv(). ����� B_ClearJunkTradeInv(slf);
��������� � B_GiveTraderInv_...().

  ������ ��������:
  - ���������� ������, ������� ������ �����������
  - ������� ���
  - �������/�������������� ��������� ��� �������� ��������
  - ����� B_ClearDeadTrader ������ �� �����, 
    ��������� ��������� ����� ������� ����� � ��������� npc


                        ������ 
               B_GiveTraderInv_<name>.d

//��������� �������� - � ���� ���� �����������
instance TRADER_<name>(TRADER_Proto); 

func void b_givetradeinv_<name>(var C_Npc slf)
{
	//���� ����, ������� ������ ���������� ��������
	if (!Hlp_IsValidNpc(TRADER_<name>))	{
		var C_NPC self_bkup;	self_bkup = Hlp_GetNpc(self);
		Wld_InsertNpc(TRADER_<name>,MEM_FARFARAWAY);
		self = Hlp_GetNpc(self_bkup);
	};
	//������� ���������
	B_TradeSwap(slf, TRADER_<name>);
	//������� ��������� � ������ �����
	B_ClearJunkTradeInv(slf);

	//����� ��������� ��������� ��� ������
};
***********************************************************/

//�������� ���������� ��������
prototype TRADER_Proto(C_NPC)
{
	name[0] = "��������";
	guild = GIL_MEATBUG;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_HITPOINTS_MAX] = 10;
	npcType = npctype_main;
    Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
	start_aistate = ZS_Stand_WP;
};

//��������� �� ����. ��������, � ������� ������ ���������� ����������
var int TRADER_Swapback_ptr;

//�������� � ������ ��������� � oCNpc
const int Inventory_Npc_offset = 1640;   // 0x0668
const int Inventory_words = 51;   // (0x0734 - 0x0668) / 4

//=======================================================
// �������� ������� ��������� ���� npc
func void B_NpcSwapInventory(var int slf_ptr, var int oth_ptr)
{
	if (!Hlp_Is_oCNpc(slf_ptr) || !Hlp_Is_oCNpc(oth_ptr))	{ return;};
	MEM_Swap(slf_ptr + Inventory_Npc_offset, oth_ptr + Inventory_Npc_offset, Inventory_words);
};

//=======================================================
// ������� ��������� ��������
func void B_TradeSwap(var C_NPC slf, var C_NPC trader)
{
	if (TRADER_Swapback_ptr != _@(trader))	{	//NS - ���. 2014 ��������, ��� ����� ��� �� ����
		TRADER_Swapback_ptr = _@(trader);
		B_NpcSwapInventory(_@(slf), TRADER_Swapback_ptr);
	};
};

// ������� �������� ���������
// �������� ������ � ������ ����� ������!
func void B_TradeSwapBack(var C_NPC slf)
{
	if (TRADER_Swapback_ptr != 0)	{
		B_NpcSwapInventory(_@(slf), TRADER_Swapback_ptr);
		TRADER_Swapback_ptr = 0;
	};
};



