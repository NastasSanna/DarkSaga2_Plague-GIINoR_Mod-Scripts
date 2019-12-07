class RespawnObject {
   var int inst; //Die Monsterinstanz
   var string wp; //Der Wegpunkt
   var int respawnDay; // Der Tag des Respawns, wobei der erste Tag den Wert 0 hat... Genau wie Gothic.
};
instance RespawnObject@(RespawnObject);

var RespawnObject myRespawnObject;
func void AddToRespawnArray(var c_npc slf) {
	var int hndl; hndl = new(RespawnObject@);     
	var RespawnObject myRespawnObject; myRespawnObject = get(hndl);
	myRespawnObject.inst = Hlp_GetInstanceID(slf);
	myRespawnObject.wp = slf.spawnPoint;
	myRespawnObject.respawnDay = Wld_GetDay() + (slf.level/10)+2; // Irgendeine Formel
};
func int MeetsRespawnCondition(var c_npc slf) { 
   return (slf.guild > GIL_SEPERATOR_HUM); // Uberpruft bisher blo?, ob 'slf' nicht menschlich ist 
};
//Example:
func void _ZS_Dead_Example () // ->> ZS_Dead()
{    
   if (MeetsRespawnCondition(self)) {
      AddToRespawnArray(self);
   };
   //[...]
};
func void RemoveRespawnObject(var int hndl) {
  delete(hndl); // Alles weitere macht PM dann selber. Unter anderem wird versucht, Respawn_Object_Delete() aufzurufen
};

func void CheckRespawns() {
	ForEachHndl(RespawnObject@, _CheckRespawns);/* Dieser Part bedarf vielleicht einer kurzen Erklarung:
    Mit ForEachHndl() fuhre ich eine angegebene Funktion (2. Parameter) fur alle Objekte/Handles 
    einer angegebenen Ursprungsinstanz (1. Parameter) aus. So kann ich ganz einfach
    alle RespawnObjects uberprufen :) */
  };
func int _CheckRespawns(var int hndl) { // In diesem Parameter steht, fur welches Handle die Funktion gerade ausgefuhrt wird
   var RespawnObject myRespawnObject; myRespawnObject = get(hndl);
   //Jetzt haben wir unser Objekt!
   
	if (myRespawnObject.respawnDay <= Wld_GetDay()) { // Der Tag des Respawns ist gekommen! \o/
		Wld_InsertNpc(myRespawnObject.inst, myRespawnObject.wp); // Daher fugen wir einfach den NPC an seinem WP ein :)
		// Allerdings mussen wir nun unser Objekt auch entfernen, sonst wurde es ja beim nachsten Mal wieder eingefugt!
		// Ich werde daher einfach mal die Funktion RemoveRespawnObject() aufrufen - wie die aussehen muss, schauen wir spater.
		RemoveRespawnObject(hndl);
	};
	return rContinue; // Wir wollen schlie?lich weiterhin alle Handles durchlaufen - bis wir alle haben
};

func void _PC_Sleep_Example (var int t)	//	-->> PC_Sleep()
{
	AI_StopProcessInfos(self);        // [SK] ->muss hier stehen um das update zu gewahrleisten

	PLAYER_MOBSI_PRODUCTION    =    MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE]=FALSE;
	if(Wld_IsTime(00,00,t,00))
	{
		Wld_SetTime(t,00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t,00);
	};
   CheckRespawns();
   //[...]
};
