//Only for Melee Weapon, need reinit in init_global

const int oCNpc__GetDamageMultiplier = 7729904;//0075F2F0
const int oCNpc__SetDamageMultiplier = 7729920;//0075F300
const int oCNpc__DoDie = 7563104;//00736760
const int oCNpc__DropAllInHand = 7566816; //oCNpc::DropAllInHand(void) 007375E0
const int oCNpc__DoModelSwapMesh = 7617984;	//virtual int __thiscall oCNpc::DoModelSwapMesh(zSTRING const & zSTRING const &)	0x00743DC0
const int oCNpc__CreateInvSlot = 7641088;	//void __thiscall oCNpc::CreateInvSlot(zSTRING const &)	0x00749800
const int oCNpc__GetSlotItem = 7544720;	//oCItem * __thiscall oCNpc::GetSlotItem(zSTRING const &) 0x00731F90
const int oCNpc__IsSlotFree = 7640720;	//int __thiscall oCNpc::IsSlotFree(class zSTRING const &)	0x00749690
const int oCNpc__IsInvSlotAvailable = 7642080;	//int __thiscall oCNpc::IsInvSlotAvailable(zSTRING const &)00749BE0
const int oCNpc__DropFromSlot = 7644560;	//oCVob * __thiscall oCNpc::DropFromSlot(zSTRING const &)  0x0074A590
const int oCNpc__CanUse = 7543216;	//int __thiscall oCNpc::CanUse(oCItem *)  	0x007319B0

//========================================
// Item ablegen
//========================================
func void Npc_UnequipItemByFlag(var c_npc slf, var int mainflag) {
   var int oCItemPtr;
	var oCItem itm;
	if(mainflag == ITEM_KAT_NF)
	{
		itm = Npc_GetEquippedMeleeWeapon(slf);		
	}
	else if(mainflag == ITEM_KAT_FF)
	{
		itm = Npc_GetEquippedRangedWeapon(slf);
	};
	oCItemPtr = Hlp_GetInstanceID(itm);
	CALL_PtrParam(oCItemPtr);
   CALL__thiscall(MEM_InstToPtr(slf), oCNpc__UnequipItem);
};
//
//-----Делает свап мешей указанных слотов. Аналог mds-эвенттэга *eventTag(DEF_SWAP_MESH ...)
//
func int Npc_DoModelSwapMesh(var C_NPC slf, var string slot_src, var string slot_dst)	//WORK!!!
{
	CALL_zStringPtrParam(slot_dst);
	CALL_zStringPtrParam(slot_src);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__DoModelSwapMesh);
	return CALL_RetValAsInt();	//return int
};
//
//-----Создаёт(активирует) слот на теле человека
//
func void Npc_CreateInvSlot(var C_NPC slf,var string slotName)	//WORK!!!
{
	CALL_zStringPtrParam(slotName);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__CreateInvSlot);
};
//
//-----Даёт ссылку на предмет, находящийся в указанном слоте.
//
func int Npc_GetSlotItem(var C_NPC slf,var string slotName)	//WORK
{
	CALL_zStringPtrParam(slotName);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__GetSlotItem);
	return CALL_RetValAsInt();	//return oCItem *
};
//
//-----Проверка занятости слота чем(кем)-либо (экипированный арбалет в слоте "ZS_Crossbow")
//
func int Npc_IsSlotFree(var C_NPC slf,var string slotName)	//WORK
{
	CALL_zStringPtrParam(slotName);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__IsSlotFree);
	return CALL_RetValAsInt();	//return TRUE/FALSE
};
//
//-----Проверка наличия активного слота в теле (например, изначально у человека нет "ZS_SHIELD")
//
func int Npc_IsInvSlotAvailable(var C_NPC slf,var string slotName)	//WORK
{
	CALL_zStringPtrParam(slotName);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__IsInvSlotAvailable);
	return CALL_RetValAsInt();	//return TRUE/FALSE
};
func int Npc_GetInvSlot(var C_NPC slf,var string slotName)	//NOT WORK???
{
	//struct TNpcSlot * __thiscall oCNpc::GetInvSlot(zSTRING const &)	0x00749AE0
	const int oCNpc__GetInvSlot = 7641824;
	CALL_RetValIsStruct(sizeof_zString);
	CALL_zStringPtrParam(/*MEM_InstToPtr(*/slotName/*)*/);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__GetInvSlot);
	return CALL_RetValAsPtr();	//return struct TNpcSlot *
};
//
//-----Отделение предмета от слота и сброс на землю (меч роняется из рук при поражении в бою)
//
func int Npc_DropFromSlot(var C_NPC slf,var string slotName) 	//WORK
{
	CALL_zStringPtrParam(slotName);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__DropFromSlot);
	return CALL_RetValAsPtr();	//return oCVob *
};
//
//-----Возможность экипировки итема (в скриптах отзывом есть G_CanNotUse)
//
func int Npc_CanUse(var C_NPC slf, var int itm_ptr)
{
	CALL_PtrParam(itm_ptr);
	CALL__thiscall(_@(slf), oCNpc__CanUse);
	return CALL_RetValAsInt();	//return TRUE/FALSE
};
//
func int Npc_GetDamageMultiplier(var C_NPC slf)	//alias oCNpc.damageMul	//work
{
	CALL_RetValIsFloat();
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__GetDamageMultiplier);
	return CALL_RetValAsFloat();	//return hex (float32). Need to convert to float
};
func void Npc_SetDamageMultiplier(var C_NPC slf, var int multiplier)	//alias oCNpc.damageMul = multiplier	//work
{
	CALL_FloatParam(mkf(multiplier));
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__SetDamageMultiplier);
};
//
//-----Убивается НПС vict, как если бы это в игре сделал сам НПС slf.
//
func void Npc_DoDie(var C_NPC vict, var C_NPC slf)	//work
{
	CALL_PtrParam(MEM_InstToPtr(slf));
	CALL__thiscall(MEM_InstToPtr(vict),oCNpc__DoDie);
};
//
//-----Переводится в нокдаун НПС vict, как если бы это в игре сделал сам НПС slf.
//
func void Npc_DropUnconscious(var C_NPC vict,var int xxx, var C_NPC killer) //What is xxx (float) ? //work
{
	const int oCNpc__DropUnconscious = 7560880; //oCNpc::DropUnconscious(float,oCNpc *)  00735EB0
	CALL_PtrParam(MEM_InstToPtr(killer));
	CALL_FloatParam(mkf(xxx));	
	CALL__thiscall(MEM_InstToPtr(vict),oCNpc__DropUnconscious);
};
//
//-----Проверка - находится ли НПС slf в нокдауне.
//
func int Npc_IsUnconscious(var C_NPC slf)	//work
{
	const int oCNpc__IsUnconscious = 7563088; //oCNpc::IsUnconscious(void) 00736750 0E
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__IsUnconscious);
	return CALL_RetValAsInt();
};
//
//-----Визуально поджигает НПС slf
//
func void Npc_Burn(var C_NPC slf, var int OnOff, var int y) //What is Y?
{
	const int oCNpc__Burn = 7558432; //oCNpc::Burn(int,float)  00735520 277 
	CALL_FloatParam(mkf(y));
	CALL_IntParam(OnOff);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__Burn);
};
//
//-----Восстанавливает полностью HP
//
func void Npc_CompeteHeal(var C_NPC slf) 	//work
{
	const int oCNpc__CompleteHeal = 7563040; //oCNpc::CompleteHeal(void)  00736720
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__CompleteHeal);
};
func void Npc_DropInventory(var C_NPC slf)	//not work
{
	const int oCNpc__DropInventory = 7566160; //oCNpc::DropInventory(void) 00737350
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__DropInventory);
};
//
//-------------------------------------------------------------------------
//******* РАБОТА с oCAniCtrl_Human
//-------------------------------------------------------------------------
//
const int oCNpc__GetAniCtrl = 7555904;	//oCAniCtrl_Human * __thiscall oCNpc::GetAnictrl(void)  0x00734B40
const int oCAniCtrl_Human__Reset = 6967424;	//void __thiscall oCAniCtrl_Human::Reset(void)  0x006A5080
const int oCAniCtrl_Human__CheckWaterLevel = 6992176;	//int __thiscall oCAniCtrl_Human::CheckWaterLevel(void) 0x006AB130
const int oCAniCtrl_Human__GetWaterLevel = 7047632;	//int __thiscall oCAniCtrl_Human::GetWaterLevel(void) 	0x006B89D0
const int oCAniCtrl_Human__IsInWater = 7047744;	//int __thiscall oCAniCtrl_Human::IsInWater(void) 0x006B8A40
const int oCAniCtrl_Human__IsDefending = 7008640;	//oCAniCtrl_Human::IsDefending(void)  006AF180 54
const int oCAniCtrl_Human__IsFallen = 7003184;	//oCAniCtrl_Human::IsFallen(void)  006ADC30 108
const int oCAniCtrl_Human__IsInCastAni = 7047264;	//oCAniCtrl_Human::IsInCastAni(void)  006B8860 CF
const int oCAniCtrl_Human__IsRunning = 7004672;	//oCAniCtrl_Human::IsRunning(void) 006AE200 202
const int oCAniCtrl_Human__IsStanding = 7003872;	//oCAniCtrl_Human::IsStanding(void)006ADEE0 194
const int oCAniCtrl_Human__IsWalking = 7004384;	//oCAniCtrl_Human::IsWalking(void) 006AE0E0 11F
const int oCAniCtrl_Human__JumpForward = 7021024;	//int __thiscall oCAniCtrl_Human::JumpForward(void) 0x006B21E0
const int oCAniCtrl_Human__StartStandAni = 6967392;	//virtual void __thiscall oCAniCtrl_Human::StartStandAni(void) 0x006A5060
const int oCNpc__ExitFightAI = 6801264;	//static void __cdecl oCNpc::ExitFightAI(void) 0x0067C770
const int oCAniCtrl_Human__SetFightAnis = 6990400;	//void __thiscall oCAniCtrl_Human::SetFightAnis(int) 0x006AAA40

func int Npc_GetAniCtrl(var C_NPC slf)	//work
{
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__GetAniCtrl);
	CALL_RetValAsPtr();	//return oCAniCtrl_Human *
};
func void Npc_Reset(var C_NPC slf)	//work ?
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__Reset);
};
func int Npc_CheckWaterLevel(var C_NPC slf)	
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__CheckWaterLevel);
	return CALL_RetValAsInt();
};
func int Npc_GetWaterLevel(var C_NPC slf)	
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__GetWaterLevel);
	return CALL_RetValAsInt();
};
func int Npc_IsInWater(var C_NPC slf)	
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__IsInWater);
	return CALL_RetValAsInt();
};
func int Npc_IsDefending(var C_NPC slf)	//work ?
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__IsDefending);
	return CALL_RetValAsInt();
};
func int Npc_IsFallen(var C_NPC slf)	//work ?
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__IsFallen);
	return CALL_RetValAsInt();
};
func int Npc_IsInCastAni(var C_NPC slf)	//work ?
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__IsInCastAni);
	return CALL_RetValAsInt();
};
func int Npc_IsRunning(var C_NPC slf)	//work ?
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__IsRunning);
	return CALL_RetValAsInt();
};
func int Npc_IsStanding(var C_NPC slf)	//work ?
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__IsStanding);
	return CALL_RetValAsInt();
};
func int Npc_IsWalking(var C_NPC slf)	//work ?
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__IsWalking);
	return CALL_RetValAsInt();
};
func int Npc_JumpForward(var C_NPC slf)	//work ?
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__JumpForward);
	return CALL_RetValAsInt();
};
func void Npc_StartStandAni(var C_NPC slf)	//
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL__thiscall(x,oCAniCtrl_Human__StartStandAni);
};
 func void Npc_ExitFightAI(var C_NPC slf)	// --> shit
{
	CALL_PtrParam(MEM_InstToPtr(slf));
	CALL__cdecl(oCNpc__ExitFightAI);
};
func void Npc_SetFightAnis(var C_NPC slf,var int FIGHT_MODE)	//work
{
	var int x;	x = Npc_GetAniCtrl(slf);
	CALL_IntParam(FIGHT_MODE);
	CALL__thiscall(x,oCAniCtrl_Human__SetFightAnis);
};
//---------------------------------------------------------------------------
func void Npc_DropAllInHand(var C_NPC slf)	//work
{
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__DropAllInHand);
};
func void Npc_DropWeaponAndTransToFist(var C_NPC slf)	//work
{
	Npc_DropAllInHand(slf);
	Npc_Reset(slf);
	Npc_SetToFistMode(slf);
	Npc_SetFightAnis(slf,FMODE_FIST);
	Npc_PlayAni(slf,"T_FISTRUN_2_FIST");
};
//---------------------------------------------------------------------------

//
//***NPC_INVENTORY
//
func void Npc_OpenInventory(var C_NPC slf,var int XZ)	//work
{
	//oCNpc::OpenInventory(int)  00762250 1B1 
	const int oCNpc__OpenInventory = 7742032;
	CALL_IntParam(XZ);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__OpenInventory);
};
func void Npc_CloseInventory(var C_NPC slf)	//work
{
	//void __thiscall oCNpc::CloseInventory(void)  	0x00762410 
	const int oCNpc__CloseInventory = 7742480;
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__CloseInventory);
};
func void Npc_OpenTradeContainer(var C_NPC slf,var C_Item itm, var int intX)	//?
{
	//void __thiscall oCNpc::OpenTradeContainer(oCItem * oCNpc * int)	0x006BD590
	const int oCNpc__OpenTradeContainer = 7067024;
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__OpenTradeContainer);
};
func void Npc_CloseTradeContainer(var C_NPC slf)	//?
{
	//void __thiscall oCNpc::CloseTradeContainer(void)  	0x006BD770
	const int oCNpc__CloseTradeContainer = 7067504;
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__CloseTradeContainer);
};
//
//**************   РАБОТА с zCModel   ****************
//
func int Npc_GetModel(var C_NPC slf)	//?
{
	//zCModel * __thiscall oCNpc::GetModel(void)  	0x00738720
	const int oCNpc__GetModel = 7571232;
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__GetModel);
	return CALL_RetValAsPtr();	//zCModel *
};
func int /*BOOL*/ Npc_GetOverlay(var C_NPC slf, var string mdsName)	//Overlay is Applied
{
	//int __thiscall oCNpc::GetOverlay(class zSTRING &)	0x00730010
	const int oCNpc__GetOverlay = 7536656;
	CALL_zStringPtrParam(mdsName);
	CALL__thiscall(MEM_InstToPtr(slf),oCNpc__GetOverlay);
	return CALL_RetValAsInt();
};
//
//*********************************************************
				//zCModelPrototype::
//*********************************************************
//
func int zCModelPrototype_GetModelPrototype(var string modelName)	//HUMANS.MDS
{
	//static zCModelPrototype * __cdecl zCModelPrototype::SearchName(zSTRING) 0x00589A30
	const int zCModelPrototype__GetModelPrototype = 5806640;
	var zString str;	str = _^(_@s(modelName));
	CALL_StructParam(MEM_InstToPtr(str), sizeof(str));
	CALL__cdecl(zCModelPrototype__GetModelPrototype);
	return CALL_RetValAsPtr();	//static zCModelPrototype *
};
func int zCModelPrototype_SearchAni(var string aniName, var string modelName)
{
	//zCModelAni * __thiscall zCModelPrototype::SearchAni(zSTRING const &)const 0x0058A090
	const int zCModelPrototype__SearchAni = 5808272;
	var int ModelProto_Ptr;
	ModelProto_Ptr = zCModelPrototype_GetModelPrototype(modelName); //HUMANS.MDS
	CALL_zStringPtrParam(aniName);
	CALL__thiscall(ModelProto_Ptr,zCModelPrototype__SearchAni);
	return CALL_RetValAsPtr();	//zCModelAni *
};
//
//*********************************************************
				//zCModel::
//*********************************************************
//
func int zCModel_GetAniIDFromAniName(var C_NPC slf, var string AniName)
{
	//int __thiscall zCModel::GetAniIDFromAniName(zSTRING const &)const   	0x00612070
	const int zCModel__GetAniIDFromAniName = 6365296;
	var int zcModel_Ptr;	zcModel_Ptr = Npc_GetModel(slf);
	CALL_zStringPtrParam(AniName);
	CALL__thiscall(zcModel_Ptr,zCModel__GetAniIDFromAniName);
	return CALL_RetValAsInt();	//int (ID)
};
func int zCModel_GetAniFromAniID(var C_NPC slf, var int AniID)
{
	//zCModelAni * __thiscall zCModel::GetAniFromAniID(int)const   0x00472F50
	const int zCModel__GetAniFromAniID = 4665168;
	var int zcModel_Ptr;	zcModel_Ptr = Npc_GetModel(slf);
	CALL_IntParam(AniID);
	CALL__thiscall(zcModel_Ptr,zCModel__GetAniFromAniID);
	return CALL_RetValAsInt();	//zCModelAni *
};
func int zCModel_GetMaterial(var C_NPC slf, var int nr_Material)
{
	//zCMaterial * __thiscall zCModel::GetMaterial(int)  0x005794F0
	const int zCModel__GetMaterial = 5739760;
	var int zcModel_Ptr;	zcModel_Ptr = Npc_GetModel(slf);
	CALL_IntParam(nr_Material);
	CALL__thiscall(zcModel_Ptr,zCModel__GetMaterial);
	return CALL_RetValAsInt();	//zCMaterial *
};
//
//*********************************************************
				//zCModelAni::
//*********************************************************
//
func int zCModelAni_GetAniVelocity(var int modelAni_Ptr)	// -->> shit
{
	//float __thiscall zCModelAni::GetAniVelocity(void)const    0x00585600
	const int zCModelAni__GetAniVelocity = 5789184;
	CALL_RetValIsFloat();
	CALL__thiscall(modelAni_Ptr,zCModelAni__GetAniVelocity);
	return CALL_RetValAsFloat();	//float (const)
};
		//--------------------------------------
				//Работа со скоростью анимаций.
		//--------------------------------------
 func int Npc_GetAniVelocity(var C_NPC slf, var string AniName)	//float as hex
{
	var int zcModelAni_ptr;
	zcModelAni_ptr = zCModel_GetAniFromAniID(slf, zCModel_GetAniIDFromAniName(slf,AniName));
	MEM_SendToSpy(zERR_TYPE_FAULT,CS4("Get aniVelocity (", AniName, " , FPS):", Float32ToString(MEM_ReadInt(zcModelAni_ptr + 176))));
	return MEM_ReadInt(zcModelAni_ptr + 176);	//zcModelAni.velocity	
};
 func void Npc_SetAniVelocity(var C_NPC slf, var string AniName, var float newValue)	//float as hex
{
	var int zcModel_Ptr;
	zcModel_Ptr = Npc_GetModel(slf);
	var int zcModelAni_ptr;
	zcModelAni_ptr = zCModel_GetAniFromAniID(slf, zCModel_GetAniIDFromAniName(slf,AniName));
	MEM_WriteInt(zcModelAni_ptr + 176,castToIntf(newValue));	//zcModelAni.velocity
	MEM_SendToSpy(zERR_TYPE_FAULT,CS4("Set aniVelocity (", AniName, " , FPS):", Float32ToString(MEM_ReadInt(zcModelAni_ptr + 176))));
};

 func int/*float*/ Npc_GetAniVelocity_Alt(var C_NPC slf, var string AniName)	//For test - Reading from ModelPrototype
{
	var int zCModelPrototype_Ptr;	zCModelPrototype_Ptr = zCModelPrototype_GetModelPrototype("HUMANS.MDS");
	MEM_SendToSpy(zERR_TYPE_FAULT,ConcatStrings("zCModelPrototype_Ptr: ", IntToString(zCModelPrototype_Ptr)));
	
	var int zcModelAni_ptr;	zcModelAni_ptr = zCModelPrototype_SearchAni(AniName, "HUMANS.MDS");
	MEM_SendToSpy(zERR_TYPE_FAULT,ConcatStrings("zcModelAni_ptr: ", IntToString(zcModelAni_ptr)));
	
	var int aniVelocity;	aniVelocity = zCModelAni_GetAniVelocity(zcModelAni_ptr);
	MEM_SendToSpy(zERR_TYPE_FAULT,ConcatStrings("aniVelocity: ", Float32ToString(aniVelocity)));
	return aniVelocity;
};
//
//Проверка, проигрывается анимация "aniName" сейчас.
//
func int Npc_IsStateAniActive(var C_NPC slf,var string aniName)	//work ?
{
	//oCAniCtrl_Human::IsStateAniActive(int) 006ADE10 79
	const int oCAniCtrl_Human__IsStateAniActive = 7003664;
	var int x;	x = Npc_GetAniCtrl(slf);
	var int y; y = zCModel_GetAniIDFromAniName(slf,aniName);
	CALL_IntParam(y);
	CALL__thiscall(x,oCAniCtrl_Human__IsStateAniActive);
	return CALL_RetValAsInt();
};

///ПРОВЕРКА ИМУЩЕСТВА и ПОИСК ИТЕМА
/* мож еще пригодится
func int Npc_SearchInvItem_ByInst(var C_NPC slf, var int ItmInst)	//ptr (C_NPC int)
{
	var oCNpc npc;	npc = Hlp_GetNpc(slf);
	if (!npc.inventory2_inventory_next)	{return 0;};
	var zCListSort itm_list;	itm_list = _^(npc.inventory2_inventory_next);
	var oCItem itm;	var int itm_ptr;
	var int loop;	loop = MEM_StackPos.position;
	if (itm_list.data)	{
		itm_ptr = itm_list.data;
		itm = _^(itm_ptr);
		if (Hlp_GetInstanceID(itm) == ItmInst)	{
			MEM_Debug(ConcatStrings("Npc_SearchInvItem_ByInst: Found ",itm._zCObject_objectName));
			return itm_ptr;
		};
	};
	if (itm_list.next)	{
		itm_list = _^(itm_list.next);
		MEM_StackPos.position = loop;
	};
	return 0;
};*/
func int Npc_SearchInvItem_ByFlag(var c_npc slf, var int flag)	//ptr (C_NPC int)
{
	//Функция возвращает первый, подходящий итем.
	//Поэтому правильно его использовать для конкретного флага, например: ITEM_RING | ITEM_ACTIVE
	var oCNpc npc;	npc = Hlp_GetNpc(slf);
	if (!npc)	{return 0;};
	if (!npc.inventory2_inventory_next)	{return 0;};
	var zCListSort itm_list;	itm_list = _^(npc.inventory2_inventory_next);
	var oCItem itm;	var int itm_ptr;
	var int loop;	loop = MEM_StackPos.position;
	if (itm_list.data)	{
		itm_ptr = itm_list.data;
		itm = _^(itm_ptr);
		if ((itm.flags & flag) == flag)	{
			return itm_ptr;
		};
	};
	if (itm_list.next)	{
		itm_list = _^(itm_list.next);
		MEM_StackPos.position = loop;
	};
	return 0;
};

func int Npc_SearchBestShield(var c_npc slf)
{
	//Функция возвращает лучший по защите(субъективно) щит.
	//
	//MEM_Debug("Npc_SearchBestShield:");
	var oCNpc npc;	npc = Hlp_GetNpc(slf);
	if (!npc)	{return 0;};
	if (!npc.inventory2_inventory_next)	{return 0;};
	var zCListSort itm_list;	itm_list = _^(npc.inventory2_inventory_next);
	var oCItem itm;	var int itm_ptr;	itm_ptr = 0;	var int itm_prot;	itm_prot = 0;
	var oCItem BestShield;	var int BestShield_ptr;	BestShield_ptr = 0;	var int BestShield_prot;	BestShield_prot = 0;
	var int loop;	loop = MEM_StackPos.position;
	if (itm_list.data)	{
		itm_ptr = itm_list.data;
		itm = _^(itm_ptr);
		if (((itm.flags & ITEM_SHIELD) == ITEM_SHIELD) && (itm.weight & ITEM_DAG == 0))	{
			//MEM_Debug(ConcatStrings("Shield found: ", itm.name));
			//учитываем все 8 типов защиты
			itm_prot = itm.protection[0] + itm.protection[1] + itm.protection[2] + itm.protection[3]
						+ itm.protection[4] + itm.protection[5] + itm.protection[6] + itm.protection[7];
			//MEM_Debug(I2S(itm_prot));
			if (BestShield_prot < itm_prot)	{	//если щит лучше, чем прежний
				//MEM_Debug("Best");
				if (Npc_CanUse(slf, itm_ptr))	{	//и его можно надеть
					//MEM_Debug("Can use");
					BestShield_ptr = itm_ptr;
					BestShield = _^(BestShield_ptr);
					BestShield_prot = itm_prot;
				};
			};
		};
	};
	if (itm_list.next)	{
		itm_list = _^(itm_list.next);
		MEM_StackPos.position = loop;
	};
	//MEM_Debug(ConcatStrings("Best Shield: ", BestShield.name));
	return BestShield_ptr;
};
