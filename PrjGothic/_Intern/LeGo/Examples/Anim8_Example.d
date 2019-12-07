/*
Beispiele: Anim8
Eine Zahl hochzahlen

Innerhalb von 10 Sekunden soll von 0 bis 10 gezahlt werden.
Wir nutzen Print_Ext aus Interface um den Text anzuzeigen:	

func void Example1() {
    // Zuerst erstellen wir uns ein Handle auf einen Text:
    var int MyText; MyText = Print_Ext(20, 20, "0", Font_Screen, COL_White, 11000);

    // Danach legen wir ein neues, erweitertes Anim8 Objekt an.
    // Es erhalt einen Handler und das Handle auf den Text als Data:
    MyAnim8 = Anim8_NewExt(0, MyLoop1, MyText, false); // Startwert 1, MyLoop1 als Handler, MyText als Data und kein Float

    // Jetzt der Befehl bis 10 zu zahlen:
    Anim8(MyAnim8, 10, 10000, A8_Constant); // Mit MyAnim8 bis 10 innerhalb von 7500ms mit konstanter Bewegung.

    // Damit der Text und das Anim8-Object nach dem Vorgang geloscht werden muss ich Anim8 noch zwei Sachen sagen:
    Anim8_RemoveIfEmpty(MyAnim8, true);
    Anim8_RemoveDataIfEmpty(MyAnim8, true);
};

func void MyLoop1(var int Number, var int MyText) {
    var zCViewText t; t = _^(myText);

    // Jetzt wird der Text auf den Wert des Anim8-Objektes gesetzt:
    t.text = IntToString(Number);

    // Geloscht wird alles wie gesagt, vollautomatisch
};

/*Ein ahnliches Beispiel findet sich in den Beispielen von Interface.
Ein zCVob rumschieben

Und nun eine etwas Gothic-Spezifischere Anwendung:
Ich mochte dass sich permanent ein Vob hin- und herbewegt (ohne Mover!).Fur die Schleife werden die FrameFunctions genutzt:

var zCVob MyVob;
var int MyVobAni;

func void Example2() {
    // Zuerst zaubern wir uns mit Ikarus das gewunschte Vob in MyVob:
    MyVob = MEM_PtrToInst(MEM_SearchVobByName("MYVOB"));
    // Dazu muss in der Welt naturlich ein Vob mit entsprechendem Namen vorhanden sein.

    // Da die Positionen eines Vobs floats sind, muss Anim8 diesmal auch floats nutzen:
    MyVobAni = Anim8_New(MyVob.trafoObjToWorld[3], true);
    // Als Startwert halt die X-Position des Vobs her.
    // Auf dieser Achse werden wir es auch verschieben.

    // Jetzt noch eine Schleife starten die das Vob immer wieder neu "anschubst":
    FF_Apply(MyVobLoop);
};

func void MyVobLoop() {
    // Sicherheitshalber suchen wir das Vob jedes Mal neu:
    MyVob = MEM_PtrToInst(MEM_SearchVobByName("MYVOB"));

    if(Anim8_Empty(MyVobAni)) {
        // Immer wenn keine Befehle mehr da sind baue ich neue ein:

        // Zuerst um drei Meter verschieben:
        Anim8(MyVobAni, addf(MyVob.trafoObjToWorld[3], mkf(300)), 1000, A8_SlowEnd);
        // Dann eine halbe Sekunde warten:
        Anim8q(MyVobAni, 0, 500, A8_Wait);
        // Und dann wieder zuruck:
        Anim8q(MyVobAni, MyVob.trafoObjToWorld[3], 1000, A8_SlowEnd);
        // Und nochmal ne halbe Sekunde warten:
        Anim8q(MyVobAni, 0, 500, A8_Wait);
        // Man beachte das 'q' bei den Folgebefehlen.
        // Wahrend Anim8 die Befehlsliste komplett zurucksetzt, also neu beginnt, hangt Anim8q den Befehl an.
        // Damit kann man also eine Befehlsfolge basteln.
    };
    // Naturlich mussen wir auch immer schon die Werte abgleichen:
    MyVob.trafoObjToWorld[3] = Anim8_Get(MyVobAni);
};
/*Das wars schon.
Ein paar wenige Zeilen schoner Code und kein Mover.. Herrlich.
Wir verwenden in diesem Fall keinen Handler, da dieser nicht die Moglichkeit bietet auf Anim8_Empty zu prufen.*/
var int temp_2;