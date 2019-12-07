
//использующиеся глобальне константы
instance MEM_zCViewDialogMessage(zCView);
var int MEM_GamePtr;
var int MEM_zCViewDialogChoice_Ptr;


// адреса функций
//oCAniCtrl_Human::DrawWeapon1(int,int,int) 006B2610 2ED 
//oCAniCtrl_Human::DrawWeapon2(void)  006B2CF0 34C 
const int oCAniCtrl_Human__DrawWeapon1                            = 7022096; //006B2610
const int oCAniCtrl_Human__DrawWeapon2                            = 7023856; //006B2610
const int oCNpc__ForceRemoveWeapon = 7662656;	//int __thiscall (oCMsgWeapon *) 0x0074EC40 0 6
const int oCNpc__EV_UnequipWeapons = 7663920;	//int __thiscall (oCMsgWeapon *) 0x0074F130 0 9
const int oCNpc__EV_EquipBestWeapon = 7663408;	//void __thiscall (int) 0x0074EF30 0 7
