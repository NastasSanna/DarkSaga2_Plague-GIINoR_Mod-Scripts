/*
Eine Funktion in die AI eines Npcs einreihen

Bevor eine Funktion aufgerufen wird soll ein beliebiger Npc erst seine AI-Queue abschlie?en.
Hier soll der Held zu einem Waypoint laufen, und erst wenn er angekommen ist soll eine Kamerafahrt starten:

func void Example1() {
   Npc_ClearAIQueue(hero);
   AI_GotoWP(hero, "MYWAYPOINT");

   AI_Function_S(hero, Wld_SendTrigger, "CAMERASTART");
};
//Sobald der Held nun den Waypoint erreicht hat wird Wld_SendTrigger("CAMERASTART"); aufgerufen.
/*
AI_Function gibt es mit den folgenden Uberladungen:
S : String
I : Int
SI : String, Int
IS : Int, String
SS : String, String
II : Int, Int

Funktionen mit mehr als zwei Parametern konnen leider nicht aufgerufen werden, allerdings konnen Parameter indirekt uber globale Variablen ubergeben werden.	*/
var int temp_1;