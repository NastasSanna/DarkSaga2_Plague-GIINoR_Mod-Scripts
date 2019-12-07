/*
...sind nervig, oder? Jedesmal einen Trigger zu erstellen, nur um eine Funktion ein wenig spater aufzurufen? Warum gibt es eigentlich kein 'wait' in Daedalus? Und uberhaupt, die Welt ist scheisse.

Gut, die letzten beiden Probleme kann ich nicht losen, aber um Funktionen verzogert aufzurufen habe ich eine gute Losung gefunden, ich prasentiere:

Delayed Functions
*/
/*
var int NextFuncIndex;
var int DF_Arr;
INSTANCE DFTrigger (oCTriggerScript);

Func void DelayedFuncsStartup()    {
           DF_Arr = Arr_Create();
    var int ptr; ptr = MEM_SearchVobByName("DELAYEDFUNCS");
    DFTrigger.scriptfunc = "DELAYEDFUNCWRAPPER";
    MEM_AssignInst(DFTrigger, ptr);
    DFTrigger._zCTrigger_fireDelaySec = mkf(1);
    DFTrigger._zCTrigger_bitfield = DFTrigger._zCTrigger_bitfield | zCTrigger_bitfield0_reactToOnTrigger;
    NextFuncIndex = -1;
};
FUNC int RegisterDelayedFuncf(VAR string fnc, VAR int delayf )    {
    MEM_InitGlobalInst();
    VAR int ptr; ptr = MEM_SearchVobByName("DELAYEDFUNCS"); MEM_AssignInst(DFTrigger, ptr);
    VAR int Symbol; Symbol = MEM_FindParserSymbol(fnc);
    Arr_Append(DF_Arr, Symbol);
    Arr_Append(DF_Arr, addf(MEM_Timer.totaltimefloat,delayf));
    IF gf(subf(DFTrigger._zCVob_nextontimer, MEM_Timer.totaltimefloat), delayf)    || NextFuncIndex == -1    { 
        
        if NextFuncIndex == -1    {
            Wld_SendTrigger("DELAYEDFUNCS");
        };
        DFTrigger._zCVob_nextontimer = addf(MEM_Timer.totaltimefloat, delayf);
        nextFuncIndex = Arr_High(DF_Arr)-1;
    };
};

func void AssignNextFuncIndex(var int delayf, var int index)    { // Funktion zum finden des kleinsten Wertes und befullen von 'NextFuncIndex' mit dem Offset
    if index > Arr_High(DF_Arr)    { return; }; // Array zu Ende!
    var int i; i = Arr_GetValue(DF_Arr, index+1);
    if (lf(i, delayf) || delayf == FLOATNULL ) && i != NAN    {
        NextFuncIndex = index;
        AssignNextFuncIndex(i, index+2);
    } else    {
        AssignNextFuncIndex(delayf, index+2);
    };
};

func void DELAYEDFUNCWRAPPER()    {
    var int fnc; fnc = Arr_GetValue(DF_Arr, NextFuncIndex);
    var int ptr; ptr = MEM_SearchVobByName("DELAYEDFUNCS"); MEM_AssignInst (DFTrigger, ptr);
    MEM_CallById(fnc);
    
    var int i;     i = Arr_High(DF_Arr); // Letzten Index holen um "nachzufullen"
    if i > 1    { // Wenn uberhaupt noch mehr als die jetzigen vorhanden
        var int j;     j = Arr_GetValue(DF_Arr, i-1); // Werte zwischenspeichern
                    i = Arr_GetValue(DF_Arr, i);
                    
        Arr_SetValue(DF_Arr, NextFuncIndex, j); // Neue Lucke auffullen
        Arr_SetValue(DF_Arr, NextFuncIndex+1, i);
    };
        Arr_SetLength(DF_Arr, Arr_Length(DF_Arr)-2); // Array verkleinern
    
    NextFuncIndex = -1;
    AssignNextFuncIndex(FLOATNULL, 0);
    if NextFuncIndex != -1    {
        i = Arr_GetValue(DF_Arr, NextFuncIndex+1);
        Wld_SendTrigger("DELAYEDFUNCS");
        DFTrigger._zCVob_nextOnTimer = i;
        
    };
    
};

/*
Zur Vorbereitung ist lediglich ein Scripttrigger mit dem Namen "DELAYEDFUNCS" (Bitte alle anderen Einstellungen so lassen!) sowie der Aufruf der Funktion "DelayedFuncsStartup" in der Startup notig. 


Die Nutzung ist denkbar einfach:
*/
/*
Func int RegisterDelayedFunc(var string fnc, var int delay)    {
   RegisterDelayedFuncf(fnc, mkf(delay));
};
*/