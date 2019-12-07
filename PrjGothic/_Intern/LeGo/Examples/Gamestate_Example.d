/*Beispiele: Gamestate
Die Variable

Es ist moglich mit diesem Paket den Gamestate abzuprufen. (Das hat der Name fast erahnen lassen, nicht?)

Dabei gibt es nun zwei Moglichkeiten: Entweder man schmiert sich direkt die Init_Global voll, oder man macht es lassig mit dem EventHandler.
Auch wenn ich zweifellos letztere Methode bevorzuge seien beide erwahnt und erlautert.

Beginnen wir mit Nummer 1:
func void Init_Global() {
    // [...]

    LeGo_Init(LeGo_All); // Ein wahrer Fan initialisiert alles!

    if(Gamestate == Gamestate_NewGame) {
        MEM_Info("Neues Spiel gestartet.");
    }
    else if(Gamestate == Gamestate_Loaded) {
        MEM_Info("Spiel geladen.");
    }
    else if(Gamestate == Gamestate_WorldChange) {
        MEM_Info("Weltenwechsel.");
    }
    else {
        MEM_Info("Ich passiere nie.");
    };
};
/*Das war schon alles was das Paket kann. 
Der Sinn ist erkennbar, hoffe ich: Sachen die man zB. mit PermMem machen mochte, also das ganze Spiel uber existieren kann man im ersten Block abhandeln. Ein PermMem-Objekt braucht nach einem geladenen Spiel nicht neu erzeugt werden.. Das ist ja genau nicht der Sinn der Sache.

Ebenso kann man sich so etwas erdenken:
func void Init_Global() {
    // [...]

    LeGo_Init(LeGo_All); // Ein wahrer Fan initialisiert IMMER alles!

    if(Gamestate == Gamestate_NewGame) {
        FF_Apply(MyLoop);
        FF_Apply(My2ndLoop);
    };
};
/*Das hatte den gleichen Effekt wie:
func void Init_Global() {
    // [...]

    LeGo_Init(LeGo_All);

    FF_ApplyOnce(MyLoop);
    FF_ApplyOnce(My2ndLoop);
};
/*Ist aber einen Tick schneller, und sieht au?erdem (meiner Meinung nach) besser aus. Das ist aber Geschmackssache.

Achja.. Den zweiten Punkt hatte ich fast vergessen:
Der EventHandler

Der ist schnell erklart:
func void Init_Global() {
    // [...]

    LeGo_Init(LeGo_All);

    Gamestate_AddListener(MyGamestateListener);
};

func void MyGamestateListener(var int state) {
    if(state == Gamestate_NewGame) {
        MEM_Info("Neues Spiel gestartet.");
    }
    else if(state == Gamestate_Loaded) {
        MEM_Info("Spiel geladen.");
    }
    else if(state == Gamestate_WorldChange) {
        MEM_Info("Weltenwechsel.");
    }
    else {
        MEM_Info("Ich passiere nie.");
    };
};
/*Bis auf das der Listener ausgelagert ist ist alles beim Alten.
Vorteil: Es sieht besser aus. Mehr eigentlich nicht.*/
var int temp_6;