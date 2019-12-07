/*
Beispiele: View
Eine Textur auf dem Bildschirm anzeigen

Hier soll eine Textur uber den ganzen Bilschirm angezeigt werden:
func void Example1() {
    var int View; View = View_Create(0, 0, PS_VMax, PS_VMax); // Virtuelle Koordinaten

    View_SetTexture(View, "MyTexture.tga"); // Ganz einfach: Die Textur aktivieren
    // Und den View noch auf dem Bildschirm anzeigen:
    View_Open(View);
};

Damit wurde die Textur permanent (auch nach Laden/Speichern/Neustart) auf dem Bildschirm zu sehen sein.
Wenn sie verschwinden soll mussen wir entweder View_Delete oder View_Close nutzen.
View_Close schlie?t den View nur, er kann danach also mit View_Open wieder geoffnet werden.
View_Delete loscht ihn komplett, damit ist das Handle ebenfalls ungultig
Eine Textur pixelgenau anzeigen

Jetzt soll eine Textur rechts oben angezeigt werden und 256*256 Pixel gro? sein:
func void Example2() {
    Print_GetScreenSize(); // Zuerst brauchen wir die Gro?e des Bildschirms
    var int View;
    View = View_CreatePxl(Print_Screen[PS_X] - 256, // 256 Pixel vom rechten Rand entfernt
                          0,
                          Print_Screen[PS_X], // bis zum rechten Rand
                          256);

    // View_CreatePxl und View_Create sollten nicht verwechselt werden.

    // Ansonsten alles normal:
    View_SetTexture(View, "MYTEXTURE.TGA");
    View_Open(View);
};
/*Um die Gro?e des Screens zu erfahren nutzen wir Interface.*/
var int temp_12;