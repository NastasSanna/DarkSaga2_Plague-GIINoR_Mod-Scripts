/*
Beispiele: Cursor
Einen Button anklicken

Wir benutzen einen View um einen Button anzuzeigen der angeklickt werden soll. Die Schleife zum uberprufen ob geklickt wurde ubernehmen die FrameFunctions:

var int Button;
func void Example1() {
    // Wir zeigen den Cursor und gleichzeitig einen Button an der geklickt werden soll:
    Cursor_Show();

    // Neuen View:
    Button = View_CreatePxl(5, 5, 125, 50);
    View_SetTexture(Button, "BUTTONTEX.TGA");
    View_Open(Button);

    // Optional kann ich die Maus fur die Engine auch noch abschalten:
    Cursor_NoEngine = true; // -> Die Engine reagiert dann nicht mehr auf Bewegungen, bewegt also auch die Kamera nicht

    // Und Loopfunktion aktivieren:
    FF_ApplyOnce(Button_Click);
};

func void Button_Click() {
    if(Cursor_Left != KEY_PRESSED) { return; }; // Wenn die linke Maustaste nicht gedruckt wurde die Funktion verlassen

    if(Cursor_X >= 5 && Cursor_X <= 125
    && Cursor_Y >= 5 && Cursor_Y <= 50) { // Ganz einfach die Koordinaten des Views ubernehmen
        // Hier wurde der Button angeklickt.
        // Button entfernen und Loop beenden:
        View_Close(Button);
        View_Delete(Button);
        Button = 0;

        // Der Engine erlauben weiterzuarbeiten:
        Cursor_NoEngine = false;

        FF_Remove(Button_Click);

        // Maus auch noch verstecken:
        Cursor_Hide();
    };
};
/*
Wem das zu viel Aufwand ist.. Seht euch das Beispiel zu den Buttons an. Gleiches Prinzip, 102% weniger Code zu schreiben.
Effektivere Verwendung mit dem EventHandler

Seit LeGo 2.2 ist auch im Cursorpaket ein EventHandler vorhanden. Dieses Beispiel soll knapp erlautern wie er funktioniert:

func void Example2() {
    // Wir registrieren MyCursorListener als Handler/Listener des Cursor_Events:
    Event_Add(Cursor_Event, MyCursorListener);

    // Ab jetzt wird MyCursorListener immer dann aufgerufen wenn der Cursor etwas zu melden hat.
};

func void MyCursorListener(var int state) {
    // Der Rest ist wohl selbsterklarend:

    if(state == CUR_WheelUp) {
        PrintS("Wheel up!");
    };
    if(state == CUR_WheelDown) {
        PrintS("Wheel down!");
    };
    if(state == CUR_LeftClick) {
        PrintS("Leftclick!");
    };
    if(state == CUR_RightClick) {
        PrintS("Rightclick!");
    };
    if(state == CUR_MidClick) {
        PrintS("Wheelclick!");
    };
};
/*Die benutzen Konstanten sind wie alle Konstanten des LeGo-Paketes in den Userkonstanten zu finden. Frohes Klicken!*/
var int temp_4;