/*Beispiele: FrameFunctions
Eine Funktion jeden Frame aufrufen

Eine bestimmte Funktion soll (ohne Trigger) jeden Frame aufgerufen werden:
func void Example1() {
    FF_Apply(MyFunc);
};

func void MyFunc() {
};

Nachdem Example1 aufgerufen wurde kommt diese Funktion jeden Frame dran.Ziemlich billig, oder? :)

Die einfachste Methode eine Funktion von Anfang an laufen zu lassen ist FF_Apply direkt in der Init_Globals (unter LeGo_Init) aufzurufen, dabei tut sich nur ein kleines Problem auf:Wird nun ein Spielstand geladen, Init_Globals also ein zweites Mal aufgerufen, steht die Funktion doppelt in der Liste, und wird somit immer doppelt aufgerufen.

Um diesen Effekt zu vermeiden sollte gepruft werden ob die Funktion bereits aktiv ist:

func void Example1() {
    if(!FF_Active(MyFunc)) {
        FF_Apply(MyFunc);
    };
};
/*Das ist bereits alles.
Seit LeGo 2.2 gibt es aber eine noch angenehmere Methode dieses umzusetzen:
func void Example1() {
    FF_ApplyOnce(MyFunc);
};
/*Letztendlich passiert hier auch nur eine Abfrage auf FF_Active, man hat aber nur eine Zeile zu schreiben.
Eine Funktion verzogert aufrufen

Jetzt machen wir es nach dem gleichen Prinzip, nur soll jetzt eine Funktion einmalig nach drei Sekunden ausgefuhrt werden:
Dank dem neuen FF_ApplyExt (ab LeGo 2.9) ist das ganz einfach. 3000 sind unsere drei Sekunden (3000ms), die 1 die Anzahl an Durchfuhrungen.
func void Example2() {
    FF_ApplyExt(MyFunc2, 3000, 1);
};

func void MyFunc2() {
};

/*Wenn MyFunc2 aufgerufen wird sind die drei Sekunden verstrichen.Damit sind die Trigger offiziell besiegt! :)

Zu FF_ApplyExt gibt es naturlich ebenfalls eine Once-Ausgabe:
func void Example2() {
    FF_ApplyOnceExt(MyFunc2, 3000, 1);
};

/*FF_ApplyExt(MyFunc, 0, -1) entspricht FF_Apply(MyFunc).
Der Timer der dahinter steckt

Seit LeGo 2.2 verwendet FrameFunctions das Paket Timer, damit ist es moglich die FrameFunctions nach belieben zu pausieren:

func void Example3() {
    FF_ApplyOnceExt(MyFunc3, 4000, 2);
};

func void MyFunc3() {
    Timer_SetPaused(!Timer_GetPaused());
};
/*Das wurde den Timer nach 4 Sekunden pausieren und nach 8 Sekunden weiterlaufen lassen.

Falsch!Da der Timer, wenn er pausiert ist, LeGo nicht weiterlaufen lasst, wird dieses Script nicht funktionieren. Wenn der Timer pausiert werden soll, muss es au?erhalb der FrameFunctions passieren.
*/
var int temp_5;