/** oCInfo::AddChoice(zSTRING int)
 *  __thiscall(0x00703B20)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @param b zSTRING
 *  @param c int
 *  @return void
 */
func void Info__AddChoice(var C_INFO a, var string b, var int c) {
  CALL_StructParam(MEM_InstToPtr(b), sizeof(b));
  CALL_IntParam(c);
  CALL__thiscall(MEM_InstToPtr(a), 7355168);
};

func int Hook_oCInfo__AddChoice(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7355168, NextFullInstrSize(7355168), b.name);
    return !(1 < 0);
};

/** virtual oCInfo::Archive(zCArchiver &)
 *  __thiscall(0x00703990)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @param b zCArchiver &
 *  @return void
 */
func void Info__Archive(var C_INFO a, var zCPar_Symbol b) {
  CALL_RefParam(b);
  CALL__thiscall(MEM_InstToPtr(a), 7354768);
};

func int Hook_oCInfo__Archive(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354768, NextFullInstrSize(7354768), b.name);
    return !(1 < 0);
};

/** oCInfo::DoCheck(void)
 *  __thiscall(0x007036F0)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return int
 */
func int Info__DoCheck(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354096);
  Call_RetValAsInt();
};

func int Hook_oCInfo__DoCheck(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354096, NextFullInstrSize(7354096), b.name);
    return !(1 < 0);
};

/** oCInfo::GetConditionFunc(void)
 *  __thiscall(0x007038F0)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return int
 */
func int Info__GetConditionFunc(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354608);
  Call_RetValAsInt();
};

func int Hook_oCInfo__GetConditionFunc(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354608, NextFullInstrSize(7354608), b.name);
    return !(1 < 0);
};

/** oCInfo::GetDataAdr(void)
 *  __thiscall(0x00703930)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return void *
 */
func C_VOID Info__GetDataAdr(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354672);
  Call_RetValAsPtr();
};

func int Hook_oCInfo__GetDataAdr(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354672, NextFullInstrSize(7354672), b.name);
    return !(1 < 0);
};

/** oCInfo::GetDataSize(void)
 *  __thiscall(0x00703920)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return int
 */
func int Info__GetDataSize(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354656);
  Call_RetValAsInt();
};

func int Hook_oCInfo__GetDataSize(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354656, NextFullInstrSize(7354656), b.name);
    return !(1 < 0);
};

/** oCInfo::GetInstance(void)
 *  __thiscall(0x007036E0)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return int
 */
func int Info__GetInstance(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354080);
  Call_RetValAsInt();
};

func int Hook_oCInfo__GetInstance(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354080, NextFullInstrSize(7354080), b.name);
    return !(1 < 0);
};

/** oCInfo::GetNpcID(void)
 *  __thiscall(0x007038E0)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return int
 */
func int Info__GetNpcID(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354592);
  Call_RetValAsInt();
};

func int Hook_oCInfo__GetNpcID(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354592, NextFullInstrSize(7354592), b.name);
    return !(1 < 0);
};

/** oCInfo::GetText(void)
 *  __thiscall(0x00703940)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return zSTRING &
 */
func zCPar_Symbol Info__GetText(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354688);
  Call_RetValAsRef();
};

func int Hook_oCInfo__GetText(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354688, NextFullInstrSize(7354688), b.name);
    return !(1 < 0);
};

/** oCInfo::Info(void)
 *  __thiscall(0x00703970)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return void
 */
func void Info__Info(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354736);
};

func int Hook_oCInfo__Info(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354736, NextFullInstrSize(7354736), b.name);
    return !(1 < 0);
};

/** oCInfo::InfoConditions(void)
 *  __thiscall(0x00703950)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return int
 */
func int Info__InfoConditions(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354704);
  Call_RetValAsInt();
};

func int Hook_oCInfo__InfoConditions(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354704, NextFullInstrSize(7354704), b.name);
    return !(1 < 0);
};

/** oCInfo::RemoveAllChoices(void)
 *  __thiscall(0x00703D70)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return void
 */
func void Info__RemoveAllChoices(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7355760);
};

func int Hook_oCInfo__RemoveAllChoices(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7355760, NextFullInstrSize(7355760), b.name);
    return !(1 < 0);
};

/** oCInfo::RemoveChoice(zSTRING)
 *  __thiscall(0x00703C20)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @param b zSTRING
 *  @return void
 */
func void Info__RemoveChoice(var C_INFO a, var string b) {
  CALL_StructParam(MEM_InstToPtr(b), sizeof(b));
  CALL__thiscall(MEM_InstToPtr(a), 7355424);
};

func int Hook_oCInfo__RemoveChoice(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7355424, NextFullInstrSize(7355424), b.name);
    return !(1 < 0);
};

/** virtual oCInfo::RestoreParserInstance(void)
 *  __thiscall(0x00703B00)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return void
 */
func void Info__RestoreParserInstance(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7355136);
};

func int Hook_oCInfo__RestoreParserInstance(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7355136, NextFullInstrSize(7355136), b.name);
    return !(1 < 0);
};

/** oCInfo::SetInstance(int)
 *  __thiscall(0x00703540)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @param b int
 *  @return void
 */
func void Info__SetInstance(var C_INFO a, var int b) {
  CALL_IntParam(b);
  CALL__thiscall(MEM_InstToPtr(a), 7353664);
};

func int Hook_oCInfo__SetInstance(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7353664, NextFullInstrSize(7353664), b.name);
    return !(1 < 0);
};

/** oCInfo::SetTold(int)
 *  __thiscall(0x00703910)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @param b int
 *  @return void
 */
func void Info__SetTold(var C_INFO a, var int b) {
  CALL_IntParam(b);
  CALL__thiscall(MEM_InstToPtr(a), 7354640);
};

func int Hook_oCInfo__SetTold(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354640, NextFullInstrSize(7354640), b.name);
    return !(1 < 0);
};

/** virtual oCInfo::Unarchive(zCArchiver &)
 *  __thiscall(0x007039D0)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @param b zCArchiver &
 *  @return void
 */
func void Info__Unarchive(var C_INFO a, var zCPar_Symbol b) {
  CALL_RefParam(b);
  CALL__thiscall(MEM_InstToPtr(a), 7354832);
};

func int Hook_oCInfo__Unarchive(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354832, NextFullInstrSize(7354832), b.name);
    return !(1 < 0);
};

/** oCInfo::WasTold(void)
 *  __thiscall(0x00703900)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return int
 */
func int Info__WasTold(var C_INFO a) {
  CALL__thiscall(MEM_InstToPtr(a), 7354624);
  Call_RetValAsInt();
};

func int Hook_oCInfo__WasTold(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7354624, NextFullInstrSize(7354624), b.name);
    return !(1 < 0);
};

/** virtual oCInfoManager::Archive(zCArchiver &)
 *  __thiscall(0x007031E0)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @param b zCArchiver &
 *  @return void
 */
func void oCInfoManager__Archive(var oCInfoManager a, var zCPar_Symbol b) {
  CALL_RefParam(b);
  CALL__thiscall(MEM_InstToPtr(a), 7352800);
};

func int Hook_oCInfoManager__Archive(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7352800, NextFullInstrSize(7352800), b.name);
    return !(1 < 0);
};

/** static oCInfoManager::CompareInfos(oCInfo * oCInfo *)
 *  __cdecl(0x007026F0)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @param b oCInfo *
 *  @return int
 */
func int oCInfoManager__CompareInfos(var C_INFO a, var C_INFO b) {
  CALL_PtrParam(a);
  CALL_PtrParam(b);
  CALL__cdecl(7350000);
  Call_RetValAsInt();
};

func int Hook_oCInfoManager__CompareInfos(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7350000, NextFullInstrSize(7350000), b.name);
    return !(1 < 0);
};

/** oCInfoManager::GetInfoCount(oCNpc * oCNpc *)
 *  __thiscall(0x00702940)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @param b oCNpc *
 *  @param c oCNpc *
 *  @return int
 */
func int oCInfoManager__GetInfoCount(var oCInfoManager a, var C_NPC b, var C_NPC c) {
  CALL_PtrParam(b);
  CALL_PtrParam(c);
  CALL__thiscall(MEM_InstToPtr(a), 7350592);
  Call_RetValAsInt();
};

func int Hook_oCInfoManager__GetInfoCount(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7350592, NextFullInstrSize(7350592), b.name);
    return !(1 < 0);
};

/** oCInfoManager::GetInfoCountImportant(oCNpc * oCNpc *)
 *  __thiscall(0x00702AA0)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @param b oCNpc *
 *  @param c oCNpc *
 *  @return int
 */
func int oCInfoManager__GetInfoCountImportant(var oCInfoManager a, var C_NPC b, var C_NPC c) {
  CALL_PtrParam(b);
  CALL_PtrParam(c);
  CALL__thiscall(MEM_InstToPtr(a), 7350944);
  Call_RetValAsInt();
};

func int Hook_oCInfoManager__GetInfoCountImportant(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7350944, NextFullInstrSize(7350944), b.name);
    return !(1 < 0);
};

/** oCInfoManager::GetInfoCountUnimportant(oCNpc * oCNpc *)
 *  __thiscall(0x00702C00)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @param b oCNpc *
 *  @param c oCNpc *
 *  @return int
 */
func int oCInfoManager__GetInfoCountUnimportant(var oCInfoManager a, var C_NPC b, var C_NPC c) {
  CALL_PtrParam(b);
  CALL_PtrParam(c);
  CALL__thiscall(MEM_InstToPtr(a), 7351296);
  Call_RetValAsInt();
};

func int Hook_oCInfoManager__GetInfoCountUnimportant(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7351296, NextFullInstrSize(7351296), b.name);
    return !(1 < 0);
};

/** oCInfoManager::GetInformation(int)
 *  __thiscall(0x00702910)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @param b int
 *  @return oCInfo *
 */
func C_INFO oCInfoManager__GetInformation(var oCInfoManager a, var int b) {
  CALL_IntParam(b);
  CALL__thiscall(MEM_InstToPtr(a), 7350544);
  Call_RetValAsPtr();
};

func int Hook_oCInfoManager__GetInformation(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7350544, NextFullInstrSize(7350544), b.name);
    return !(1 < 0);
};

/** oCInfoManager::GetInformation(oCNpc * oCNpc * int)
 *  __thiscall(0x007027B0)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @param b oCNpc *
 *  @param c oCNpc *
 *  @param d int
 *  @return oCInfo *
 */
func C_INFO oCInfoManager__GetInformation(var oCInfoManager a, var C_NPC b, var C_NPC c, var int d) {
  CALL_PtrParam(b);
  CALL_PtrParam(c);
  CALL_IntParam(d);
  CALL__thiscall(MEM_InstToPtr(a), 7350192);
  Call_RetValAsPtr();
};

func int Hook_oCInfoManager__GetInformation(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7350192, NextFullInstrSize(7350192), b.name);
    return !(1 < 0);
};

/** oCInfoManager::GetInfoUnimportant(oCNpc * oCNpc * int)
 *  __thiscall(0x00703030)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @param b oCNpc *
 *  @param c oCNpc *
 *  @param d int
 *  @return oCInfo *
 */
func C_INFO oCInfoManager__GetInfoUnimportant(var oCInfoManager a, var C_NPC b, var C_NPC c, var int d) {
  CALL_PtrParam(b);
  CALL_PtrParam(c);
  CALL_IntParam(d);
  CALL__thiscall(MEM_InstToPtr(a), 7352368);
  Call_RetValAsPtr();
};

func int Hook_oCInfoManager__GetInfoUnimportant(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7352368, NextFullInstrSize(7352368), b.name);
    return !(1 < 0);
};

/** oCInfoManager::InformationTold(int)
 *  __thiscall(0x007031A0)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @param b int
 *  @return int
 */
func int oCInfoManager__InformationTold(var oCInfoManager a, var int b) {
  CALL_IntParam(b);
  CALL__thiscall(MEM_InstToPtr(a), 7352736);
  Call_RetValAsInt();
};

func int Hook_oCInfoManager__InformationTold(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7352736, NextFullInstrSize(7352736), b.name);
    return !(1 < 0);
};

/** virtual oCInfoManager::RestoreParserInstances(void)
 *  __thiscall(0x00703390)
 *  Beschreibung hier.
 *  @param a oCInfoManager *
 *  @return void
 */
func void oCInfoManager__RestoreParserInstances(var oCInfoManager a) {
  CALL__thiscall(MEM_InstToPtr(a), 7353232);
};

func int Hook_oCInfoManager__RestoreParserInstances(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(7353232, NextFullInstrSize(7353232), b.name);
    return !(1 < 0);
};

/** oCInformationManager::CameraRefresh(void)
 *  __fastcall(0x00661590)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__CameraRefresh() {
  CALL__fastcall(0, 0, 6690192);
};

func int Hook_oCInformationManager__CameraRefresh(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6690192, NextFullInstrSize(6690192), b.name);
    return !(1 < 0);
};

/** oCInformationManager::CameraStart(void)
 *  __fastcall(0x006613A0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__CameraStart() {
  CALL__fastcall(0, 0, 6689696);
};

func int Hook_oCInformationManager__CameraStart(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6689696, NextFullInstrSize(6689696), b.name);
    return !(1 < 0);
};

/** oCInformationManager::CameraStop(void)
 *  __fastcall(0x00661520)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__CameraStop() {
  CALL__fastcall(0, 0, 6690080);
};

func int Hook_oCInformationManager__CameraStop(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6690080, NextFullInstrSize(6690080), b.name);
    return !(1 < 0);
};

/** oCInformationManager::CollectChoices(oCInfo *)
 *  __fastcall(0x00661CD0)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return int
 */
func int oCInformationManager__CollectChoices(var C_INFO a) {
  CALL__fastcall(a, 0, 6692048);
  Call_RetValAsInt();
};

func int Hook_oCInformationManager__CollectChoices(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6692048, NextFullInstrSize(6692048), b.name);
    return !(1 < 0);
};

/** oCInformationManager::CollectInfos(void)
 *  __fastcall(0x00661AA0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__CollectInfos() {
  CALL__fastcall(0, 0, 6691488);
};

func int Hook_oCInformationManager__CollectInfos(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6691488, NextFullInstrSize(6691488), b.name);
    return !(1 < 0);
};

/** oCInformationManager::Exit(void)
 *  __fastcall(0x00661240)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__Exit() {
  CALL__fastcall(0, 0, 6689344);
};

func int Hook_oCInformationManager__Exit(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6689344, NextFullInstrSize(6689344), b.name);
    return !(1 < 0);
};

/** static oCInformationManager::GetInformationManager(void)
 *  __cdecl(0x0065F790)
 *  Beschreibung hier.
 *  @return oCInformationManager &
 */
func zCPar_Symbol oCInformationManager__GetInformationManager() {
  CALL__cdecl(6682512);
  Call_RetValAsRef();
};

func int Hook_oCInformationManager__GetInformationManager(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6682512, NextFullInstrSize(6682512), b.name);
    return !(1 < 0);
};

/** oCInformationManager::HasFinished(void)
 *  __fastcall(0x006609D0)
 *  Beschreibung hier.
 *  @return int
 */
func int oCInformationManager__HasFinished() {
  CALL__fastcall(0, 0, 6687184);
  Call_RetValAsInt();
};

func int Hook_oCInformationManager__HasFinished(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6687184, NextFullInstrSize(6687184), b.name);
    return !(1 < 0);
};

/** oCInformationManager::InfoWaitForEnd(void)
 *  __fastcall(0x00661990)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__InfoWaitForEnd() {
  CALL__fastcall(0, 0, 6691216);
};

func int Hook_oCInformationManager__InfoWaitForEnd(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6691216, NextFullInstrSize(6691216), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnChoice(int)
 *  __fastcall(0x00662780)
 *  Beschreibung hier.
 *  @param a int
 *  @return void
 */
func void oCInformationManager__OnChoice(var int a) {
  CALL__fastcall(a, 0, 6694784);
};

func int Hook_oCInformationManager__OnChoice(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6694784, NextFullInstrSize(6694784), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnChoice(oCInfoChoice *)
 *  __fastcall(0x006629A0)
 *  Beschreibung hier.
 *  @param a oCInfoChoice *
 *  @return void
 */
func void oCInformationManager__OnChoice(var oCInfoChoice a) {
  CALL__fastcall(a, 0, 6695328);
};

func int Hook_oCInformationManager__OnChoice(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6695328, NextFullInstrSize(6695328), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnChoiceBegin(void)
 *  __fastcall(0x00662570)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnChoiceBegin() {
  CALL__fastcall(0, 0, 6694256);
};

func int Hook_oCInformationManager__OnChoiceBegin(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6694256, NextFullInstrSize(6694256), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnChoiceEnd(void)
 *  __fastcall(0x00662B90)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnChoiceEnd() {
  CALL__fastcall(0, 0, 6695824);
};

func int Hook_oCInformationManager__OnChoiceEnd(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6695824, NextFullInstrSize(6695824), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnExit(void)
 *  __fastcall(0x006630D0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnExit() {
  CALL__fastcall(0, 0, 6697168);
};

func int Hook_oCInformationManager__OnExit(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6697168, NextFullInstrSize(6697168), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnImportantBegin(void)
 *  __fastcall(0x00661DB0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnImportantBegin() {
  CALL__fastcall(0, 0, 6692272);
};

func int Hook_oCInformationManager__OnImportantBegin(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6692272, NextFullInstrSize(6692272), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnImportantEnd(void)
 *  __fastcall(0x00661E90)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnImportantEnd() {
  CALL__fastcall(0, 0, 6692496);
};

func int Hook_oCInformationManager__OnImportantEnd(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6692496, NextFullInstrSize(6692496), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnInfo(int)
 *  __fastcall(0x006620B0)
 *  Beschreibung hier.
 *  @param a int
 *  @return void
 */
func void oCInformationManager__OnInfo(var int a) {
  CALL__fastcall(a, 0, 6693040);
};

func int Hook_oCInformationManager__OnInfo(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6693040, NextFullInstrSize(6693040), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnInfo(oCInfo *)
 *  __fastcall(0x00662290)
 *  Beschreibung hier.
 *  @param a oCInfo *
 *  @return void
 */
func void oCInformationManager__OnInfo(var C_INFO a) {
  CALL__fastcall(a, 0, 6693520);
};

func int Hook_oCInformationManager__OnInfo(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6693520, NextFullInstrSize(6693520), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnInfoBegin(void)
 *  __fastcall(0x00661FF0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnInfoBegin() {
  CALL__fastcall(0, 0, 6692848);
};

func int Hook_oCInformationManager__OnInfoBegin(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6692848, NextFullInstrSize(6692848), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnInfoEnd(void)
 *  __fastcall(0x00662CF0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnInfoEnd() {
  CALL__fastcall(0, 0, 6696176);
};

func int Hook_oCInformationManager__OnInfoEnd(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6696176, NextFullInstrSize(6696176), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnTermination(void)
 *  __fastcall(0x006631A0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnTermination() {
  CALL__fastcall(0, 0, 6697376);
};

func int Hook_oCInformationManager__OnTermination(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6697376, NextFullInstrSize(6697376), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnTradeBegin(void)
 *  __fastcall(0x00662E60)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnTradeBegin() {
  CALL__fastcall(0, 0, 6696544);
};

func int Hook_oCInformationManager__OnTradeBegin(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6696544, NextFullInstrSize(6696544), b.name);
    return !(1 < 0);
};

/** oCInformationManager::OnTradeEnd(void)
 *  __fastcall(0x00662F60)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__OnTradeEnd() {
  CALL__fastcall(0, 0, 6696800);
};

func int Hook_oCInformationManager__OnTradeEnd(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6696800, NextFullInstrSize(6696800), b.name);
    return !(1 < 0);
};

/** oCInformationManager::PrintStatus(void)
 *  __fastcall(0x0065FF70)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__PrintStatus() {
  CALL__fastcall(0, 0, 6684528);
};

func int Hook_oCInformationManager__PrintStatus(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6684528, NextFullInstrSize(6684528), b.name);
    return !(1 < 0);
};

/** oCInformationManager::ProcessImportant(void)
 *  __fastcall(0x006615B0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__ProcessImportant() {
  CALL__fastcall(0, 0, 6690224);
};

func int Hook_oCInformationManager__ProcessImportant(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6690224, NextFullInstrSize(6690224), b.name);
    return !(1 < 0);
};

/** oCInformationManager::ProcessNextImportant(void)
 *  __fastcall(0x006617B0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__ProcessNextImportant() {
  CALL__fastcall(0, 0, 6690736);
};

func int Hook_oCInformationManager__ProcessNextImportant(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6690736, NextFullInstrSize(6690736), b.name);
    return !(1 < 0);
};

/** oCInformationManager::SetNpc(oCNpc *)
 *  __fastcall(0x006609F0)
 *  Beschreibung hier.
 *  @param a oCNpc *
 *  @return void
 */
func void oCInformationManager__SetNpc(var C_NPC a) {
  CALL__fastcall(a, 0, 6687216);
};

func int Hook_oCInformationManager__SetNpc(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6687216, NextFullInstrSize(6687216), b.name);
    return !(1 < 0);
};

/** oCInformationManager::ToggleStatus(void)
 *  __fastcall(0x0065FF20)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__ToggleStatus() {
  CALL__fastcall(0, 0, 6684448);
};

func int Hook_oCInformationManager__ToggleStatus(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6684448, NextFullInstrSize(6684448), b.name);
    return !(1 < 0);
};

/** oCInformationManager::Update(void)
 *  __fastcall(0x00660BB0)
 *  Beschreibung hier.
 *  @return void
 */
func void oCInformationManager__Update() {
  CALL__fastcall(0, 0, 6687664);
};

func int Hook_oCInformationManager__Update(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6687664, NextFullInstrSize(6687664), b.name);
    return !(1 < 0);
};

/** oCInformationManager::UpdateViewSettings(void)
 *  __thiscall(0x0065F7E0)
 *  Beschreibung hier.
 *  @param a oCInformationManager *
 *  @return void
 */
func void oCInformationManager__UpdateViewSettings(var oCInformationManager a) {
  CALL__thiscall(MEM_InstToPtr(a), 6682592);
};

func int Hook_oCInformationManager__UpdateViewSettings(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6682592, NextFullInstrSize(6682592), b.name);
    return !(1 < 0);
};

/** oCInformationManager::WaitingForEnd(void)
 *  __fastcall(0x006609E0)
 *  Beschreibung hier.
 *  @return int
 */
func int oCInformationManager__WaitingForEnd() {
  CALL__fastcall(0, 0, 6687200);
  Call_RetValAsInt();
};

func int Hook_oCInformationManager__WaitingForEnd(var func a) {
    var zCPar_Symbol b;
    if Assigned(b) { return 1 < 0; };
    b = Symbol(b - 1 /* a */);
    b = Symbol(b.content);
    HookEngine(6687200, NextFullInstrSize(6687200), b.name);
    return !(1 < 0);
};
