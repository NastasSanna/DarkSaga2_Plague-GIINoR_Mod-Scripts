/*
Beispiele: Names
Den Namen eines Npcs erst spater anzeigen

instance PAL_100_Friend(c_npc) {
    name = "Paladin";

    // [...]
};

func void Init_Global() {
    SetName(PAL_100_Friend, "Arto");
};
/*
Zum Spielstart wird uber PAL_100_Friend der Name "Paladin" angezeigt.
Wird nun wahrend eines Dialoges oder dergleichen ShowName(PAL_100_Friend) verwendet, ist der Name "Arto" permanent uber dem Npc sichtbar.*/
var int temp_8;