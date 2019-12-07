/*Beispiele: StringBuilder
Grundfunktionalitat

Der Zweck ist bekannt: Strings bauen. Was hei?t das konkret? Mit wenig Aufwand viele Strings miteinander verknupfen.
Ich habe versucht das Paket so leicht benutzbar wie moglich zu machen, dennoch ist das Prinzip erst einmal nicht ganz leicht zu durchschauen. 

Am besten hilft hier ein Beispiel. Losen wir dieses Problem erst einmal auf die koventionelle Art und Weise:
func void PrintMyNumbers(var int x0, var int x1, var int x2) {
    var string res;
    res = ConcatStrings(IntToString(x0), ", ");
    res = ConcatStrings(res, IntToString(x1));
    res = ConcatStrings(res, ", ");
    res = ConcatStrings(res, IntToString(x2));
    PrintS(res);
};
/*Jeder durfte das Problem kennen. Eine nervige Angelegenheit.
Machen wir es nun mit dem StringBuilder:
func void PrintMyNumbers(var int x0, var int x1, var int x2) {
    var int s; s = SB_New();  // StringBuilder erzeugen
    SBi(x0);                  // Int anhangen
    SB (", ");                // String anhangen
    SBi(x1);                  // Int anhangen
    SB (", ");                // String anhangen
    SBi(x2);                  // Int anhangen
    PrintS(SB_ToString());    // Als String ausgeben
    SB_Destroy();             // StringBuilder zerstoren
};
/*
Sieht doch gleich viel angenehmer aus, oder? Aber warum erzeugen wir einen StringBuilder und benutzen ihn dann nicht?
Die Idee ist die folgende: Es wird ein StringBuilder mit SB_New() erzeugt und im Hintergrund als aktiver StringBuilder gesetzt. Das Paket unterstutzt immer nur einen StringBuilder zur selben Zeit, den Pointer behalten wird falls wir zwischendurch einen anderen StringBuilder verwenden wollen.

Das nachste Beispiel wird diesen Vorgang verdeutlichen.
Mehr als nur einer

Einfaches Beispiel. Wir wollen zwei StringBuilder gleichzeitig befullen und danach kombiniert zuruckgeben:

func string Example2() {
    // Zwei StringBuilder erzeugen:
    var int s0; s0 = SB_New();
    var int s1; s1 = SB_New();

    // Den ersten StringBuilder als aktiv setzen und befullen.
    SB_Use(s0);
    SB("Hallo ");
    SB("Welt!");

    // Den zweiten StringBuilder als aktiv setzen und befullen.
    SB_Use(s1);
    SB("Hier spricht ");
    SB("der Held!");

    // Jetzt wollen wir die beiden StringBuilder kombinieren.
    // Das System sieht so eine Operation eigentlich nicht vor, aber uber einen Hilfsstring geht es trotzdem:
    var string str; str = SB_ToString(); // In diesem String steht nun "Hier spricht der Held!"

    SB_Use(s0);
    SB(" ");
    SB(str);

    str = SB_ToString(); // Nun sollte "Hallo Welt! Hier spricht der Held!" in dem String stehen.

    // Der Rest ist bereits bekannt: StringBuilder wieder zerstoren
    SB_Destroy();
    SB_Use(s1);
    SB_Destroy();

    return str;
};*/
var int temp_10;