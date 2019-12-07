/*
Beispiele: Interface
Erweiterter Print

func void Example1() {
    var int i;
    //               x, y, text,   font,        color,                time
    i = Print_ExtPxl(2, 2, "Text", FONT_Screen, RGBA(255, 0, 0, 128), 500);
};
/*
Der Text wird nach einer halben Sekunde wieder verschwinden, da 'time' in Milisekunden angegeben wird.
Der Text ist in der linken oberen Ecke, x und y sind Pixelgenau (Print_Ext ware mit Virtuellen Koordinaten)Der Text ist Rot und halb durchsichtig, da R auf 255 steht und A auf 128

Aber warum i = ..?Print_Ext gibt ein int zuruck. Hier ist aber Vorsicht geboten!
Wenn time == -1 wird der Text fur immer angezeigt bis der User ihn von Hand loscht, deshalb wird in diesem Fall
ein Handle zuruckgegeben. Siehe folgende Funktion.
Da time hier nicht -1 ist kann der Ruckgabewert ignoriert werden. Der Text wird automatisch geloscht.
Falls man doch damit arbeiten mochte: i halt in diesem Fall einen Pointer auf den erzeugten zCViewText, es ist also moglich trotzdem A„nderungen an ihm vorzunehmen.
Einen Print uber zCViewText verwalten

Es ist auch moglich den Text nur uber Print_CreateText zu erstellen und selbst einzustellen.In diesem Beispiel soll ein Text von links nach rechts uber das Bild fliegen und wieder geloscht werden.
Die Bewegung ubernimmt Anim8:

var int MyText;
var int MyAnim8;
func void PrintMyScrollingText(var string text) {
    MyText = Print_CreateText(text, FONT_Screen); // Wir erstellen ein leeres Textitem mit der Schriftart FONT_Screen

    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText); // Jetzt holen wir das leere Textitem in einen zCViewText

    MyTextObject.posx = 1;      // Position einstellen
    MyTextObject.posy = 1;      // ACHTUNG: Diese Werte sind virtuell, sprich: 0 = ganz links, 8192 = ganz rechts (also keine Pixelangabe)
                                // (Wenn ich aber lieber Pixelkoordinaten haben mochte konnte ich zB. Print_ToVirtual verwenden)
    MyTextObject.timed = false; // Der Text soll nicht getimed sein (nicht verschwinden)

    // Da wird zu faul sind die Bewegung von Hand zu animieren lassen wir das von Anim8 erledigen.
    // Zuerst brauchen wir ein neues Anim8 Objekt:
    MyAnim8 = Anim8_New(1, false); // Startposition ist 1 und dieser Wert ist kein Float

    Anim8(MyAnim8, 8192, 2000, A8_Constant); // Zielposition ist 8192, Dauer 2000 Milisekunden und Bewegungsform Konstant

    // Jetzt brauchen wir nur noch eine Schleife die den X-Wert des Textes mit dem Wert von Anim8 abgleicht:
    FF_Apply(ScrollMyText);
};

func void ScrollMyText() {
    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText); // Wieder den Text als Objekt holen

    // Und nun die Werte abgleichen:
    MyTextObject.posx = Anim8_Get(MyAnim8);

    // Wenn Anim8 damit fertig ist beenden wir die Schleife und loschen den Text:
    if(Anim8_Empty(MyAnim8)) {
        Print_DeleteText(MyText);
        FF_Remove(ScrollMyText);
        // Achja: Das Anim8-Objekt muss naturlich auch geloscht werden. Wir brauchen es nicht mehr.
        Anim8_Delete(MyAnim8);
    };
};
/*
Einen Print uber zCViewText mit LeGo 2.2 verwalten

Fur damalige Verhaltnisse war das vielleicht angenehm, heute ist es das nicht mehr.
Anim8 hat mit LeGo 2.2 ein paar Verbesserungen erfahren, mit denen sich der gleiche Effekt wesentlich einfacher erzeugen lasst:

var int MyText;
var int MyAnim8;
func void PrintMyScrollingText(var string text) {
    // Alles wie gehabt. Text erzeugen und einstellen:
    MyText = Print_CreateText(text, FONT_Screen);

    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText);

    MyTextObject.posx = 1;
    MyTextObject.posy = 1;

    MyTextObject.timed = false;

    // Aber jetzt kommt der Clou: Wir verwenden Anim8_NewExt, dieses erlaubt uns einen "Handler" und "Data" einzustellen.
    // Was das ist? Abwarten.
    MyAnim8 = Anim8_NewExt(1, ScrollMyText, MyText, false);

    // Aha. ScrollMyText wird als Handler ubergeben und MyText als Data.
    // Konkret bedeutet das: ScrollMyText wird immer dann aufgerufen,
    // wenn Anim8 die Position neu berechnet hat. Dabei werden dann Data
    // und die neue Position als Parameter ubergeben. Sehen wir wie es weitergeht.

    // Wieder ganz normal die Animation einstellen:
    Anim8(MyAnim8, 8192, 2000, A8_Constant);

    // Und diesmal keine FrameFunction.
    // Stattdessen sagen wir Anim8 dass es gleich von selbst aufraumen soll wenn es fertig ist:
    Anim8_RemoveIfEmpty(MyAnim8, true);

    // Der Text sollte auch von selbst verschwinden:
    Anim8_RemoveDataIfEmpty(MyAnim8, true);

    // Da MyText ein Handle ist wird das funktionieren.
    // Ware MyText ein Pointer durfte RemoveDataIfEmpty nicht aktiviert werden, es wurde zu einer Fehlermeldung fuhren.
};

func void ScrollMyText(var int MyText, var int Position) {
     // Wieder den Text als Objekt holen
    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText);

    // Und nun die Werte abgleichen:
    MyTextObject.posx = Position;

    // Da Anim8 das Loschen selbst ubernimmt brauchen wir uns da weiter keine Gedanken zu machen. Cool, oder? :)
};

// Noch einmal schnell ohne Kommentare um zu zeigen wie kurz dieses Script sein konnte:

func void PrintMyScrollingText(var string text) {
    var int MyText;  MyText  = Print_Ext(1, 1, text, FONT_Screen, COL_White, -1);
    var int MyAnim8; MyAnim8 = Anim8_NewExt(1, ScrollMyText, MyText, false);
    Anim8(MyAnim8, 8192, 2000, A8_Constant);
    Anim8_RemoveIfEmpty(MyAnim8, true);
    Anim8_RemoveDataIfEmpty(MyAnim8, true);
};

func void ScrollMyText(var int MyText, var int Position) {
    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText);
    MyTextObject.posx = Position;
};

// 12 Zeilen. Grandios!*/
var int temp_7;