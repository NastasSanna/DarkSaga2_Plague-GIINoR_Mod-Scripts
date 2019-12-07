//**********************************
//“ут был I.C.
//**********************************
func void PonyMode()
{
	Wld_SetTime	(00,00);
	Wld_SpawnNpcRange(hero,Pony_Mode_Zombie,10,500);
	Snd_Play ("MFX_GhostVoice"); 
	Snd_Play ("MFX_Firestorm_Cast"); 
};
