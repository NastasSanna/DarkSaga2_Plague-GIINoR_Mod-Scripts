func void Sleep(var int ms) {
	var int adr;
	adr = GetProcAddress (LoadLibrary ("KERNEL32.DLL"), "Sleep");
	CALL_IntParam(ms);
	CALL__stdcall(adr); //0x007B47E6
};
