/*
Beispiele: Trialoge
Ein einfacher Trialog

Ein Dialog sagt mehr als tausend Worte. Naja, in diesem Falle sind es nur ungefahr 45, aber ein Beispieldialog ist sicher sinnvoller als die Funktionen einzeln zu erlautern.

Folgendes Gesprach wird uber die Trialoge gelost:
Arto: Tut mir leid Held, aber hier darfst du nicht passieren
Held: Warum nicht?
Horka: Die Stadt wurde verriegelt
Held: Ich habe ein wenig Gold dabei, kommen wir damit ins Geschaft?
Squelto: Nein. Wir sind nicht bestechlich.
Held: Sicher?
Arto: Ich muss dich nun bitten zu gehen
Held: Nun gut...
instance TRIA_Test (C_INFO)
{
    npc         = PAL_100_Friend;
    nr          = 10;
    condition   = TRIA_Test_condition;
    information = TRIA_Test_info;
    important   = FALSE;
    permanent   = 1;
    description = "TRIALOGTEST";
};

func int TRIA_Test_condition()
{
    return TRUE;
};

func void TRIA_Test_info()
{
    var c_npc Arto;    Arto = Hlp_GetNpc(PAL_100_Friend); // Ihm gehort der Dialog
    var c_npc Horka;   Horka = Hlp_GetNpc(PAL_101_Horka);
    var c_npc Squelto; Squelto = Hlp_GetNpc(PAL_102_Squelto);

    TRIA_Invite(Horka);   // Lade Horka in diesen Dialog ein
    TRIA_Invite(Squelto); // Lade Squelto in diesen Dialog ein
    TRIA_Start();         // Starte das Gesprach
    // Der Held und Arto mussen/durfen nicht eingeladen werden. Sie sind sowieso im Dialog.

    // Held redet nun mit Arto (self = Arto, other = Hero)
    TRIA_Next(Arto);

    DIAG_Reset();

    AI_Output (self, other, "TRIA_TEST_00"); //Tut mir leid Held, aber hier darfst du nicht passieren

    // Held redet nun mit Horka (self = Horka, other = Hero)
    TRIA_Next(Horka);

    AI_Output (other, self, "TRIA_TEST_01"); //Warum nicht?

    AI_GotoNpc(self, other);
    AI_TurnToNpc(other, self);

    AI_Output (self, other, "TRIA_TEST_02"); //Die Stadt wurde verriegelt

    // Held soll sich wahrend des nachsten Satzes verschworerisch umsehen
    DIAG("Nervous", 1, 2);

    AI_Output (other, self, "TRIA_TEST_03"); //Ich habe ein wenig Gold dabei, kommen wir damit ins Geschaft?

    // Held soll sich jetzt wieder normal bewegen
    DIAG_Reset();

    // Starte Kamerafahrt
    TRIA_Cam("CAMERASTART");

    // Held redet nun mit Squelto (self = Squelto, other = Hero)
    TRIA_Next(Squelto);

    AI_TurnToNpc(other, self);

    DIAG("No", 0, 1);
    AI_Output (self, other, "TRIA_TEST_04"); //Nein. Wir sind nicht bestechlich.

    // Held redet nun wieder mit Arto (self = Arto, other = Hero)
    TRIA_Next(Arto);

    // Held soll sich jetzt fragend Artikulieren
    DIAG("NotSure", 0, 1);

    AI_Output (other, self, "TRIA_TEST_05"); //Sicher?

    AI_TurnToNpc(other, self);

    // Kamerafahrt Ende
    TRIA_Cam("");

    // Arto soll zornig reagieren
    DIAG("Angry", 0, 4);

    AI_Output (self, other, "TRIA_TEST_06"); //Ich muss dich nun bitten zu gehen

    // Held soll sich jetzt wieder normal bewegen
    DIAG_Reset();

    AI_Output (other, self, "TRIA_TEST_07"); //Nun gut...

    TRIA_Finish(); // und Ende
};
/*
Zusatzlich werden hier noch Dialoggestures genutzt. Ich empfehle hierzu ebenfalls die Beispiele einzusehen.*/
var int temp_11;