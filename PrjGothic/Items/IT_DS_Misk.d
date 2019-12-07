
instance ITMI_DS_SPADE(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "ItMi_DarkSaga_Shovel.3DS";
	material = MAT_WOOD;
	scemeName = "DIGGER";
	on_state[0] = use_ds_spade;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_ds_spade()
{
};
instance ITMI_DS_HORN(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Broom;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_METAL;
	scemeName = "HORN";
	on_state[0] = use_horn;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_horn()
{
};
instance ITMI_MOP(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "ItMi_Broom.3DS";
	material = MAT_WOOD;
	scemeName = "SCE";
	on_state[0] = use_mop;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
func void use_mop()
{
};
//-----------------------
//�������
instance ITMI_LADLE(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Kovh.3DS";
	material = MAT_METAL;
	description = "��������� ����";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_DARKSAGA_STOCK(C_Item)
{
	name = "�������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Stock.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "��������� ��� ������ ����������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Itmi_DarkSaga_Monetgold(C_Item)
{
	name = "�������� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Monetgold.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "���������� �� �������� ���������.";
	text[2] = Name_DS_ReadyToCoining;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_DS_CHEKAN(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "ItMi_DS_Chekan.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
//--------------���������------------
instance Itmi_DarkSaga_MonetSilver(C_Item)
{
	name = "���������� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "itmi_silver_coin.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "���������� �� ����������� ���������.";
	text[2] = Name_DS_ReadyToCoining;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance Itmi_DarkSaga_MonetMagicOre(C_Item)
{
	name = "��������� �� ���������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Monetgold.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "���������� �� ��������� ���������� ����.";
	text[2] = Name_DS_ReadyToCoining;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance Itmi_DarkSaga_MonetSpellBoundOre(C_Item)
{
	name = "��������� �� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Monetgold.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "���������� �� ����������";
	text[2] = "����������  � ���������� ���.";
	text[3] = Name_DS_ReadyToCoining;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance Itmi_DarkSaga_MonetBlackOre(C_Item)
{
	name = "��������� �� ������ ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Monetgold.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "���������� �� ��������� ������ ����.";
	text[2] = Name_DS_ReadyToCoining;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance Itmi_DarkSaga_MonetIron(C_Item)
{
	name = "�������� ��������� �����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Monetgold.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "���������� �� ��������� �������� ����.";
	text[2] = Name_DS_ReadyToCoining;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
//���� ���������
instance Itmi_Silver(C_Item)
{
	name = "���������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "itmi_silver_coin.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "���������� �� ����������� ���������.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance ItMi_SilverArrowHead(C_Item)
{
	name = "���������� ���������� ��� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2;
	visual = "itmi_arrow_tip_03.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "��������� �� ���������� ���������.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance ItMi_IronArrowHead(C_Item)
{
	name = "�������� ���������� ��� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "itmi_arrow_tip_01.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "��������� �� ���������";
	text[2] = "�� �������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance ItMi_MagicArrowHead(C_Item)
{
	name = "���������� ���������� ��� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2;
	visual = "itmi_arrow_tip_04.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "���������� �� ���������� ����.";
	text[1] = "��������� �� ���������";
	text[2] = "�� ���������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance ItMi_SpellBoundArrowHead(C_Item)
{
	name = "������������ ���������� ��� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2;
	visual = "itmi_arrow_tip_05.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_MANAPOTION";
	description = name;
	text[1] = "��������� �� ��������� �� ������";
	text[2] = "���������� � ���������� ���.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
instance ItMi_BlackArrowHead(C_Item)
{
	name = "������ ���������� ��� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2;
	visual = "itmi_arrow_tip_02.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_MANAPOTION";
	description = "���������� ��� ������ �� ������ ����.";
	text[1] = "��������� �� ���������";
	text[2] = "�� ������ ����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};
//-------
instance ItMi_SilverBoltHead(C_Item)
{
	name = "���������� ���������� ��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2;
	visual = "itmi_bolt_tip_03.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "��������� �� ���������� ���������.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
instance ItMi_IronBoltHead(C_Item)
{
	name = "�������� ���������� ��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "itmi_bolt_tip_01.3DS";
	material = MAT_METAL;
	description = name;
	text[1] = "��������� �� ���������";
	text[2] = "�� �������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
instance ItMi_MagicBoltHead(C_Item)
{
	name = "���������� ���������� ��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2;
	visual = "itmi_bolt_tip_04.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
	text[1] = "��������� �� ���������";
	text[2] = "�� ���������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
instance ItMi_BlackBoltHead(C_Item)
{
	name = "������ ���������� ��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2;
	visual = "itmi_bolt_tip_02.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_MANAPOTION";
	description = "���������� ��� ����� �� ������ ����.";
	text[1] = "��������� �� ���������";
	text[2] = "�� ������ ����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
instance ItMi_SpellBoundBoltHead(C_Item)
{
	name = "������������ ���������� ��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 2;
	visual = "itmi_bolt_tip_05.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	//effect = "SPELLFX_MANAPOTION";
	description = name;
	text[1] = "��������� �� ��������� �� ������";
	text[2] = "���������� � ���������� ���.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};
//---------------�����--------------------------------
instance ITMI_FUSINGGOLDTEMPLATE(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Stock.3DS";
	material = MAT_METAL;
	description = Name_DS_SmithForm;
	text[1] = "����� ��� ������� �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_FUSING_RW_TEMPLATE(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "Itmi_DarkSaga_Stock.3DS";
	material = MAT_METAL;
	description = Name_DS_SmithForm;
	text[1] = "����� ��� ������� ������������.";
	text[5] = NAME_Value;
	count[5] = value;
};

//-------------------------------------------------------------

instance ITMI_DRUMSTICK(C_Item)
{
	name = "���������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "ItMi_Drumstick.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItMi_DS_SteelPlate(C_Item)
{
	name = "�������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "METAL_PLANE.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItMi_WoodRaw(C_Item)
{
	name 			= "���������";
	mainflag 	= ITEM_KAT_NONE;
	flags 		= ITEM_MULTI;
	value 		= 5;
	visual 		= "OC_Firewood_V2.3ds";
	material 	= MAT_WOOD;
	description = "����� ���������";
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
instance ItMi_Wood_Hammer(C_Item)
{
	name 			= "������";
	mainflag 	= ITEM_KAT_NONE;
	flags 		= ITEM_MULTI;
	value 		= 5;
	visual 		= "itmi_wood_hammer.3ds";
	material 	= MAT_WOOD;
	description = name;
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
instance ItMi_ArrowRaw(C_Item)
{
	name 			= "������";
	mainflag 	= ITEM_KAT_NONE;
	flags 		= ITEM_MULTI;
	value 		= 1;
	visual 		= "itmi_arrow_shaft.3ds";
	material 	= MAT_WOOD;
	description = "������ ��� �����";
	text[5] 	= NAME_Value;
	count[5] 	= value;
};
instance ItMi_BoltRaw(C_Item)
{
	name 			= "������";
	mainflag 	= ITEM_KAT_NONE;
	flags 		= ITEM_MULTI;
	value 		= 1;
	visual 		= "itmi_bolt_shaft.3ds";
	material 	= MAT_WOOD;
	description = "������ ��� ������";
	text[5] 	= NAME_Value;
	count[5] 	= value;
};

