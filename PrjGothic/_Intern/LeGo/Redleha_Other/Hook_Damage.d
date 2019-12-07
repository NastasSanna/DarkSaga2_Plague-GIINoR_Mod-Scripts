func int DMG_OnDmg(var int victimPtr, var int attackerPtr, var int dmg) { 
	// Diese Funktion anpassen, wenn ihr den Schaden verandern wollt! 'dmg' ist der von Gothic berechnete Schaden.
	return dmg;
};
	
	
func void _DMG_OnDmg() {
	EDI = DMG_OnDmg(EBP, MEM_ReadInt(MEM_ReadInt(ESP+644)+8), EDI);
};
func void InitDamage() {
	const int dmg = 0;
	if (dmg) { return; };
	HookEngineF(6736583/*0x66CAC7*/, 5, _DMG_OnDmg);
	dmg = 1;
};
