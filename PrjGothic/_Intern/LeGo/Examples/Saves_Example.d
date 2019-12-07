/*
Beispiele: Saves
Eine Highscoreliste speichern

var string MyScoreList[10];

/*
Da strings bekanntlich nicht gespeichert werden legen wir mit den Funktionen aus der Saves.d eine zusatzliche Speicherdatei an die nur uns gehort.Saves.d beinhaltet zu Beginn zwei Funktionen: BW_Savegame und BR_Savegame.Nun werden die BinaryMachines genutzt um die Speicherdatei zu beschreiben oder zu lesen, wir brauchen nichts weiter zu tun als unseren Kram zu sichern, den Rest macht die Saves.d komplett alleine.
(Wir modifizieren also nur die beiden eben genannten Funktionen)

func void BW_Savegame() {
    // Highscoreliste sichern
    BW_String(MyScoreList[0]);
    BW_String(MyScoreList[1]);
    BW_String(MyScoreList[2]);
    BW_String(MyScoreList[3]);
    BW_String(MyScoreList[4]);
    BW_String(MyScoreList[5]);
    BW_String(MyScoreList[6]);
    BW_String(MyScoreList[7]);
    BW_String(MyScoreList[8]);
    BW_String(MyScoreList[9]);
};

func void BR_Savegame() {
    // Genau so auch in die andere Richtung:
    MyScoreList[0] = BR_String();
    MyScoreList[1] = BR_String();
    MyScoreList[2] = BR_String();
    MyScoreList[3] = BR_String();
    MyScoreList[4] = BR_String();
    MyScoreList[5] = BR_String();
    MyScoreList[6] = BR_String();
    MyScoreList[7] = BR_String();
    MyScoreList[8] = BR_String();
    MyScoreList[9] = BR_String();
};
/*
Solche Sachen lassen sich seit LeGo 2 allerdings viel eleganter mit PermMem realisieren.*/
var int temp_9;