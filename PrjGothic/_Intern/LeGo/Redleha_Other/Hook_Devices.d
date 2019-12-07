/** CCapsFile::Create2D(unsigned long _DDCAPS_DX7 * char *)
 *  __thiscall(0x007C23E9)
 *  Beschreibung hier.
 *  @param b unsigned long
 *  @param c _DDCAPS_DX7 *
 *  @param d char *
 *  @return unsigned long
 */
 /*
func int CCapsFile__Create2D(var CCapsFile a, var int b, var _DDCAPS_DX7 * c, var string d) {
  CALL_intParam(b);
  CALL_StructPtrParam(c);
  CALL_cStringPtrParam(d);
  CALL__thiscall(a, 8135657);
  CallRetValAsint();
};

/** CCapsFile::CreateFormat(CSurfaceFormatNode *)
 *  __thiscall(0x007C22AD)
 *  Beschreibung hier.
 *  @param b CSurfaceFormatNode *
 *  @return unsigned long
 */
 /*
func int CCapsFile__CreateFormat(var CCapsFile a, var CSurfaceFormatNode * b) {
  CALL_StructPtrParam(b);
  CALL__thiscall(a, 8135341);
  CallRetValAsint();
};

/** CCapsFile::CreateString(char *)
 *  __thiscall(0x007C21B1)
 *  Beschreibung hier.
 *  @param b char *
 *  @return unsigned long
 */
 /*
func int CCapsFile__CreateString(var CCapsFile a, var string b) {
  CALL_cStringPtrParam(b);
  CALL__thiscall(a, 8135089);
  CallRetValAsint();
};

/** CCapsFile::CreateVersion(void)
 *  __thiscall(0x007C208D)
 *  Beschreibung hier.
 *  @return unsigned long
 */
 /*
func int CCapsFile__CreateVersion(var CCapsFile a) {
  CALL__thiscall(a, 8134797);
  CallRetValAsint();
};

/** CCapsFile::FindVersion(void)
 *  __thiscall(0x007C206F)
 *  Beschreibung hier.
 *  @return unsigned long
 */
 /*
func int CCapsFile__FindVersion(var CCapsFile a) {
  CALL__thiscall(a, 8134767);
  CallRetValAsint();
};

/** CCapsFile::LoadHardwareCaps(CDDrawDeviceNode * CVideoModeNode *)
 *  __thiscall(0x007C2B48)
 *  Beschreibung hier.
 *  @param b CDDrawDeviceNode *
 *  @param c CVideoModeNode *
 *  @return long
 */
 /*
func int CCapsFile__LoadHardwareCaps(var CCapsFile a, var CDDrawDeviceNode * b, var CVideoModeNode * c) {
  CALL_StructPtrParam(b);
  CALL_StructPtrParam(c);
  CALL__thiscall(a, 8137544);
  CallRetValAsint();
};

/** CCapsFile::LoadSoftwareCaps(CHelInfo *)
 *  __thiscall(0x007C2DE6)
 *  Beschreibung hier.
 *  @param b CHelInfo *
 *  @return long
 */
 
 /*
func int CCapsFile__LoadSoftwareCaps(var CCapsFile a, var CHelInfo * b) {
  CALL_StructPtrParam(b);
  CALL__thiscall(a, 8138214);
  CallRetValAsint();
};

/** CCapsFile::Open(void)
 *  __thiscall(0x007C1FEA)
 *  Beschreibung hier.
 *  @return long
 */
 /*
func int CCapsFile__Open(var CCapsFile a) {
  CALL__thiscall(a, 8134634);
  CallRetValAsint();
};

/** CCapsFile::Parse2D(unsigned long _DDCAPS_DX7 * char * *)
 *  __thiscall(0x007C20F6)
 *  Beschreibung hier.
 *  @param b unsigned long
 *  @param c _DDCAPS_DX7 *
 *  @param d char * *
 *  @return long
 */
 /*
func int CCapsFile__Parse2D(var CCapsFile a, var int b, var _DDCAPS_DX7 * c, var char * * d) {
  CALL_intParam(b);
  CALL_StructPtrParam(c);
  CALL_StructPtrParam(d);
  CALL__thiscall(a, 8134902);
  CallRetValAsint();
};

/** CCapsFile::SaveHardwareCaps(CDDrawDeviceNode * CVideoModeNode *)
 *  __thiscall(0x007C2714)
 *  Beschreibung hier.
 *  @param b CDDrawDeviceNode *
 *  @param c CVideoModeNode *
 *  @return long
 */
 /*
func int CCapsFile__SaveHardwareCaps(var CCapsFile a, var CDDrawDeviceNode * b, var CVideoModeNode * c) {
  CALL_StructPtrParam(b);
  CALL_StructPtrParam(c);
  CALL__thiscall(a, 8136468);
  CallRetValAsint();
};

/** CCapsFile::SaveSoftwareCaps(CHelInfo *)
 *  __thiscall(0x007C2570)
 *  Beschreibung hier.
 *  @param b CHelInfo *
 *  @return long
 */
 /*
func int CCapsFile__SaveSoftwareCaps(var CCapsFile a, var CHelInfo * b) {
  CALL_StructPtrParam(b);
  CALL__thiscall(a, 8136048);
  CallRetValAsint();
};

/** CD3duContext::_ChooseZBuffer(unsigned long unsigned long)
 *  __thiscall(0x007B8DCE)
 *  Beschreibung hier.
 *  @param b unsigned long
 *  @param c unsigned long
 *  @return void
 */
/*func int CD3duContext___ChooseZBuffer(var CD3duContext a, var int b, var int c) {
  CALL_intParam(b);
  CALL_intParam(c);
  CALL__thiscall(a, 8097230);
};

/** CD3duContext::_Create3DDevice(void)
 *  __thiscall(0x007B8D03)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___Create3DDevice(var CD3duContext a) {
  CALL__thiscall(a, 8097027);
};

/** CD3duContext::_CreateDeviceWindow(void)
 *  __thiscall(0x007B8968)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___CreateDeviceWindow(var CD3duContext a) {
  CALL__thiscall(a, 8096104);
};

/** CD3duContext::_CreateDXBuffers(void)
 *  __thiscall(0x007B9A80)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___CreateDXBuffers(var CD3duContext a) {
  CALL__thiscall(a, 8100480);
};

/** CD3duContext::_CreateFullscreenBuffers(void)
 *  __thiscall(0x007B9690)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___CreateFullscreenBuffers(var CD3duContext a) {
  CALL__thiscall(a, 8099472);
};

/** CD3duContext::_CreateOffScreenBuffers(void)
 *  __thiscall(0x007B98D9)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___CreateOffScreenBuffers(var CD3duContext a) {
  CALL__thiscall(a, 8100057);
};

/** CD3duContext::_CreatePalette(void)
 *  __thiscall(0x007B8B0C)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___CreatePalette(var CD3duContext a) {
  CALL__thiscall(a, 8096524);
};

/** CD3duContext::_CreateWindowedBuffers(void)
 *  __thiscall(0x007B9779)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___CreateWindowedBuffers(var CD3duContext a) {
  CALL__thiscall(a, 8099705);
};

/** CD3duContext::_CreateZBuffer(void)
 *  __thiscall(0x007B8F3E)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___CreateZBuffer(var CD3duContext a) {
  CALL__thiscall(a, 8097598);
};

/** CD3duContext::_DestroyDeviceWindow(void)
 *  __thiscall(0x007B8AD2)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___DestroyDeviceWindow(var CD3duContext a) {
  CALL__thiscall(a, 8096466);
};

/** CD3duContext::_DestroyDXBuffers(int)
 *  __thiscall(0x007B9057)
 *  Beschreibung hier.
 *  @param b int
 *  @return void
 */
/*func int CD3duContext___DestroyDXBuffers(var CD3duContext a, var int b) {
  CALL_intParam(b);
  CALL__thiscall(a, 8097879);
};

/** static CD3duContext::_EnumSurfacesCallback2(IDirectDrawSurface7 * _DDSURFACEDESC2 * void *)
 *  __stdcall(0x007B9170)
 *  Beschreibung hier.
 *  @param a IDirectDrawSurface7 *
 *  @param b _DDSURFACEDESC2 *
 *  @param c void *
 *  @return long
 */
/*func int CD3duContext___EnumSurfacesCallback2(var IDirectDrawSurface7 * a, var _DDSURFACEDESC2 * b, var void * c) {
  CALL_StructPtrParam(a);
  CALL_StructPtrParam(b);
  CALL_StructPtrParam(c);
  CALL__stdcall(8098160);
  CallRetValAsint();
};

/** CD3duContext::_InitCooperativeLevel(void)
 *  __thiscall(0x007B8AE7)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___InitCooperativeLevel(var CD3duContext a) {
  CALL__thiscall(a, 8096487);
};

/** CD3duContext::_InitViewport(void)
 *  __thiscall(0x007B8C86)
 *  Beschreibung hier.
 *  @return void
 */
/*func int CD3duContext___InitViewport(var CD3duContext a) {
  CALL__thiscall(a, 8096902);
};

/** virtual CD3duContext::AddRef(void)
 *  __stdcall(0x007B83C7)
 *  Beschreibung hier.
 *  @return unsigned long
 */
/*func int CD3duContext__AddRef() {
  CALL__stdcall(8094663);
  CallRetValAsint();
};

/** virtual CD3duContext::Clear(unsigned long)
 *  __stdcall(0x007B885C)
 *  Beschreibung hier.
 *  @param a unsigned long
 *  @return long
 */
/*func int CD3duContext__Clear(var int a) {
  CALL_intParam(a);
  CALL__stdcall(8095836);
  CallRetValAsint();
};

/** virtual CD3duContext::DrawDebugText(float float unsigned long char *)
 *  __stdcall(0x007B94AC)
 *  Beschreibung hier.
 *  @param a float
 *  @param b float
 *  @param c unsigned long
 *  @param d char *
 *  @return long
 */
/*func int CD3duContext__DrawDebugText(var int a, var int b, var int c, var string d) {
  CALL_floatParam(a);
  CALL_floatParam(b);
  CALL_intParam(c);
  CALL_cStringPtrParam(d);
  CALL__stdcall(8098988);
  CallRetValAsint();
};

/** virtual CD3duContext::GetBufferSize(unsigned long * unsigned long *)
 *  __stdcall(0x007B9295)
 *  Beschreibung hier.
 *  @param a unsigned long *
 *  @param b unsigned long *
 *  @return long
 */
/*func int CD3duContext__GetBufferSize(var unsigned long * a, var unsigned long * b) {
  CALL_intParam(a);
  CALL_intParam(b);
  CALL__stdcall(8098453);
  CallRetValAsint();
};

/** virtual CD3duContext::GetCreationFlags(void)
 *  __stdcall(0x007B92ED)
 *  Beschreibung hier.
 *  @return unsigned long
 */
/*func int CD3duContext__GetCreationFlags() {
  CALL__stdcall(8098541);
  CallRetValAsint();
};

/** virtual CD3duContext::GetDeviceIndex(unsigned long * unsigned long *)
 *  __stdcall(0x007B922C)
 *  Beschreibung hier.
 *  @param a unsigned long *
 *  @param b unsigned long *
 *  @return long
 */
/*func int CD3duContext__GetDeviceIndex(var unsigned long * a, var unsigned long * b) {
  CALL_intParam(a);
  CALL_intParam(b);
  CALL__stdcall(8098348);
  CallRetValAsint();
};

/** virtual CD3duContext::GetNumBackBuffers(void)
 *  __stdcall(0x007B924F)
 *  Beschreibung hier.
 *  @return unsigned long
 */
/*func int CD3duContext__GetNumBackBuffers() {
  CALL__stdcall(8098383);
  CallRetValAsint();
};

/** virtual CD3duContext::GetNumBits(unsigned long * unsigned long * unsigned long * unsigned long *)
 *  __stdcall(0x007B9259)
 *  Beschreibung hier.
 *  @param a unsigned long *
 *  @param b unsigned long *
 *  @param c unsigned long *
 *  @param d unsigned long *
 *  @return long
 */
/*func int CD3duContext__GetNumBits(var unsigned long * a, var unsigned long * b, var unsigned long * c, var unsigned long * d) {
  CALL_intParam(a);
  CALL_intParam(b);
  CALL_intParam(c);
  CALL_intParam(d);
  CALL__stdcall(8098393);
  CallRetValAsint();
};

/** virtual CD3duContext::GetRefreshRate(void)
 *  __stdcall(0x007B92B8)
 *  Beschreibung hier.
 *  @return unsigned long
 */
/*func int CD3duContext__GetRefreshRate() {
  CALL__stdcall(8098488);
  CallRetValAsint();
};

/** virtual CD3duContext::QueryInterface(_GUID const & void * *)
 *  __stdcall(0x007B93CC)
 *  Beschreibung hier.
 *  @param a _GUID const &
 *  @param b void * *
 *  @return long
 */
/*func int CD3duContext__QueryInterface(var int a, var void * * b) {
  CALL__GUID const &Param(a);
  CALL_StructPtrParam(b);
  CALL__stdcall(8098764);
  CallRetValAsint();
};

/** virtual CD3duContext::Release(void)
 *  __stdcall(0x007B83D4)
 *  Beschreibung hier.
 *  @return unsigned long
 */
/*func int CD3duContext__Release() {
  CALL__stdcall(8094676);
  CallRetValAsint();
};

/** virtual CD3duContext::Resize(unsigned long unsigned long)
 *  __stdcall(0x007B9AF2)
 *  Beschreibung hier.
 *  @param a unsigned long
 *  @param b unsigned long
 *  @return long
 */
/*func int CD3duContext__Resize(var int a, var int b) {
  CALL_intParam(a);
  CALL_intParam(b);
  CALL__stdcall(8100594);
  CallRetValAsint();
};

/** virtual CD3duContext::RestoreSurfaces(void)
 *  __stdcall(0x007B84E3)
 *  Beschreibung hier.
 *  @return long
 */
/*func int CD3duContext__RestoreSurfaces() {
  CALL__stdcall(8094947);
  CallRetValAsint();
};

/** virtual CD3duContext::SetClearColor(unsigned long)
 *  __stdcall(0x007B88FF)
 *  Beschreibung hier.
 *  @param a unsigned long
 *  @return long
 */
/*func int CD3duContext__SetClearColor(var int a) {
  CALL_intParam(a);
  CALL__stdcall(8095999);
  CallRetValAsint();
};

/** virtual CD3duContext::SetClearDepth(float)
 *  __stdcall(0x007B8912)
 *  Beschreibung hier.
 *  @param a float
 *  @return long
 */
/*func int CD3duContext__SetClearDepth(var int a) {
  CALL_floatParam(a);
  CALL__stdcall(8096018);
  CallRetValAsint();
};

/** virtual CD3duContext::SetClearStencil(unsigned long)
 *  __stdcall(0x007B8925)
 *  Beschreibung hier.
 *  @param a unsigned long
 *  @return long
 */
/*func int CD3duContext__SetClearStencil(var int a) {
  CALL_intParam(a);
  CALL__stdcall(8096037);
  CallRetValAsint();
};

/** virtual CD3duContext::UpdateFrame(unsigned long)
 *  __stdcall(0x007B8562)
 *  Beschreibung hier.
 *  @param a unsigned long
 *  @return long
 */
/*func int CD3duContext__UpdateFrame(var int a) {
  CALL_intParam(a);
  CALL__stdcall(8095074);
  CallRetValAsint();
};

/** CD3duContextList::DestroyD3duContext(CD3duContext *)
 *  __thiscall(0x007B8074)
 *  Beschreibung hier.
 *  @param b CD3duContext *
 *  @return void
 */
/*func int CD3duContextList__DestroyD3duContext(var CD3duContextList a, var CD3duContext * b) {
  CALL_StructPtrParam(b);
  CALL__thiscall(a, 8093812);
};
*/
var int temp_240;