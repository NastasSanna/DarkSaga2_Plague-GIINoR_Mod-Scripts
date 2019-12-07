/*
Manche externe Funktionen, die nur Npcs annehmen, konnten eigentlich genauso gut beliebige Vobs annehmen. Dazu fallt mir ein:

WLD_SpawnNpcRange: Spawne Npcs im Radius um Vob
AI_TurnAway: Drehe dich weg von Vob
AI_TurnToNpc: Drehe dich zu Vob
AI_GotoNpc: Gehe zu Vob
Npc_CanSeeNpc: Kann ich ein Vob sehen?
Npc_CanSeeNpcFreeLOS: Konnte ich ein Vob sehen, wenn ich in die richtige Richtung schauen wurde?
Npc_GetDistToNpc: Distanz zwischen zwei Vobs.
Npc_GetHeightToNpc: Hohenunterschied zwischen zwei Vobs.
Problem ist allerdings, dass Gothic nur Npcs zulasst und einfach nichts tut, wenn das ubergebene Objekt zwar ein zCVob aber kein oCNpc ist.

Diese Beschrankung lasst sich folgenderma?en ein- und ausschalten:
*/

//************************************************
//   Weniger Strenger External Test
//************************************************

const int _ExternalAcceptVobsCount = 0;
const int _oCNpcTypeInfo = 8983472;  //0x8913B0
const int _zCVobTypeInfo = 8970208;  //0x88DFE0

/*Example:

	var zCVob vob; vob = MEM_PtrToInst(MEM_SearchVobByName("ALTE_EICHE"));
   
   ExternalAcceptVobs(); //Weniger strikte Bedingung.
   AI_TurnToNpc(self, vob); //Schaue Eiche an.
   AI_Output(self, hero, "OU1"); //Sieh nur, Held! Die alte Eiche! Ich gehe sofort hin.
   AI_GotoNpc(self, vob); //Gehe zur Eiche.
   ExternalDenyVobs(); //Wieder zuruck auf normal.
*/

func void ExternalAcceptVobs() {
    if (!_ExternalAcceptVobsCount) {
        const int once = 0;
    
        var int ptr; ptr = 7188726; //0x6DB0F6
        if (!once) { MemoryProtectionOverride(ptr, 4); };
        MEM_WriteInt(ptr, _zCVobTypeInfo); //0x88DFE0
        
        ptr = 7188773; //0x6DB125
        if (!once) { MemoryProtectionOverride(ptr, 4); };
        MEM_WriteInt(ptr, _zCVobTypeInfo); //0x88DFE0
        
        once = true;
    };
    
    _ExternalAcceptVobsCount += 1;
};

func void ExternalDenyVobs() {
    _ExternalAcceptVobsCount -= 1;
    
    if (!_ExternalAcceptVobsCount) {
        var int ptr; ptr = 7188726; //0x6DB0F6
        MEM_WriteInt(ptr, _oCNpcTypeInfo); //0x88DFE0
        
        ptr = 7188773; //0x6DB125
        MEM_WriteInt(ptr, _oCNpcTypeInfo); //0x88DFE0
    };
};
