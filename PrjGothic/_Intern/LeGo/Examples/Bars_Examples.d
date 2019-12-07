/*
Beispiele: Bars
Eine simple Bar anzeigen lassen

Zuerst erstellen wir nur eine Bar die nichts tut.
Sie soll nur halb voll (oder etwa leer?) auf dem Bildschirm angezeigt werden.
Info: Die Bars setzen ein gewisses Grundverstandnis von PermMem vorraus. Wer hier etwas nicht nachvollziehen kann sollte ein Blick in selbige Beispiele werfen.

func void Example_1() {
    var int bar; bar = Bar_Create(GothicBar@); // Eine neue Bar erstellen
    Bar_SetPercent(bar, 50);                   // Und den Wert auf 50% setzen
};
/*
Fertig. Ganz ohne Einstellungen? Und was ist GothicBar@? Werfen wir einen Blick hinter die Kulissen:
Ein eigener Erfahrungsbalken

Bars bietet die Klasse 'Bar' fur den Nutzer an. Die sieht so aus:
class Bar {
    var int x;          // X-Position auf dem Bildschirm (Mittelpunkt der Bar)
    var int y;          // Y-Position auf dem Bildschirm (Mittelpunkt der Bar)
    var int barTop;     // Abstand Balken - Hintergrund oben/unten
    var int barLeft;    // Abstand Balken - Hintergrund links/rechts
    var int width;      // Breite
    var int height;     // Hohe
    var string backTex; // Hintergrundtextur
    var string barTex;  // Eigentliche Balkentextur
    var int value;      // Startwert
    var int valueMax;   // Hochstwert
};
/*
Damit konnte ich jetzt eine Instanz erstellen die meine Wunsche erfullt.Zusatzlich dazu beinhaltet Bars aber noch einen 
Prototypen: 
prototype GothicBar(Bar) {
    x = Print_Screen[PS_X] / 2;
    y = Print_Screen[PS_Y] - 20;
    barTop = 3;
    barLeft = 7;
    width = 180;
    height = 20;
    backTex = "Bar_Back.tga";
    barTex = "Bar_Misc.tga";
    value = 100;
    valueMax = 100;
};
/*
Von diesem lasst sich viel besser eine Instanz ableiten.GothicBar ohne Veranderungen ist als GothicBar@-Instanz zu finden, damit haben wir im obigen Beispiel die Bar erstellt.
GothicBar befindet sich in der Mitte des Bildschirms und sieht genau so aus wie die Gothic-Unter-Wasser-Bar.


Nun aber ans Eingemachte: Eine Bar die links oben im Bild hangt und die Erfahrungspunkte anzeigt.

Wieder von GothicBar ableiten und nur die Position andern.Dazu naturlich noch eine Schleife mithilfe der FrameFunctions:

instance Bar_1(GothicBar) {
    x = 100;
    y = 20;
};

func void Example_1() {
    // Example_1 konnte damit zB. in Init_Global aufgerufen werden
    FF_ApplyOnce(Loop_1);
};

func void Loop_1() {
    // Example_1 bringt diese Schleife zum laufen. Hier soll die Bar einmalig konstruiert und dann an die EXP des Helden angepasst werden:
    var int MyBar;
    if(!Hlp_IsValidHandle(MyBar)) {
        MyBar = Bar_Create(Bar_1); // Unsere Bar_1
    };

    // Der Rest ist wohl selbsterklarend:
    Bar_SetMax(MyBar, hero.exp_next);
    Bar_SetValue(MyBar, hero.exp);
};
/*Gut, wer mitdenkt merkt: Diese Bar ist nicht optimal. Nach einem Levelup zeigt sie immer die absolute Anzahl an Erfahrungspunkten an, nicht den Fortschritt des aktuellen Levels. Nachdenken und besser schreiben ;)

Schon fertig. Eine eigene EXP-Bar.*/
var int temp_3;