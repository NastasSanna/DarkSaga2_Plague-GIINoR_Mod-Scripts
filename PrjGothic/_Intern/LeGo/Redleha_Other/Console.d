/*
Ich habe mir ein Skript gebaut mit dessen Hilfe ich neue Konsolenbefehle einfuhren kann.

Es ist relativ primitiv: Ich prufe ob die Konsole sich einen neuen Eintrag in ihrer Kommandohistorie gespeichert hat (sie merkt sich ja in Gothic 2 welche Kommandos kamen).

Diesen parse ich dann eben nochmal und schaue, ob er fur mich interessant ist.
Etwas unschon ist dabei, dass die Konsole sich beschwert ein Kommando nicht zu kennen, selbst wenn es dann im Nachhinein skriptseitig behandelt wird. Und die Autovervollstandigung ist naturlich auch nicht auf neue Befehle abgestimmt. Aber seis drum. Zu Debugzwecken ist das ziemlich nutzlich.

Ich habe bisher implementiert:
put var value
setze Skriptvariable var auf Wert value. Implementiert fur Strings und Integer
peek var
gebe aktuellen Wert der Skriptvariable var aus. Implementiert fur Strings und Integer.
xct function
Fuhrt eine (parameterfreie) Daedalusfunktion function aus. Der Name kommt von "execute".
toggle told info
Sucht die oCInfo mit Namen info und schaltet um ob diese Info schon bekannt ist oder nicht.
sleep
Zeigt eine einfache MessageBox an. Sinn: Bis man "ok" klickt, zieht Gothic keine CPU Leistung mehr. So kann man Gothic im Hintergrund laufen lassen ohne dass es das System blockiert. Vor allem fur schlechte Rechner wie meinen Laptop interessant. 


Denkbar sind aber auch andere Befehle jeglicher Art.
Vielleicht nutzt das Skript ja jemandem, auch wenn es sicher nicht pefekt ist.
*/
//#################################################
//
//    Line Lexer
//
//#################################################

/* Init this Lexer with a string.
 * Every time you call "next", the lexer will write
 * the next word (space seperated) into the global
 * variable LLX_tok.
 * next() returns false iff there was no further token in the string.
 
 usage (pseudocode):
 
 LLX_Init (stringWithSpaceSeperatedTokens);
 
 while (LLX_Next()) {
    proccessToken(LLX_Tok);
 }
 
 endOfInput(); 
*/

var string LLX_str;
var int    LLX_pos;
var int    LLX_len;
var string LLX_tok;

func void LLX_Init(var string str) {
	LLX_str = str;
	LLX_pos = 0;
	LLX_tok = "";
	LLX_len = STR_Len(str);
};

func int LLX_next() {
    var int start; start = -1;
    var int loop;
    loop = MEM_StackPos.position;
    
    /* string zu Ende? */
    if (LLX_pos >= LLX_len) {
        if (start != -1) {
            LLX_tok = STR_SubStr(LLX_str, start, LLX_len - start);
            return true;
        };
        return false;
    };
    
    var int isBlank;
    isBlank = STR_GetCharAt(LLX_str, LLX_pos) == 32;
    
    if (isBlank) {
        /* am Anfang uberspringen, spater als Ende vom Wort werten */
        if (start != -1) {
            LLX_tok = STR_SubStr(LLX_str, start, LLX_pos - start);
            return true;
        };
    } else if (start == -1) {
        start = LLX_pos; //wurde schon inkrementiert
    };
    
    LLX_pos += 1;
    MEM_StackPos.position = loop;
};

//#################################################
//
//    Console Observer
//
//#################################################

func void ProcessCommand(var string command) {
	MEM_InitAll();

	var string msg;
	LLX_Init(command);

	if (!LLX_Next()) {
		return;
	};
	if (Hlp_StrCmp ("XCT", LLX_Tok)) {
		/* xct myfunction */
		if(!LLX_Next()) {
			Print("Which script function should I execute?");
			return;
		};
		msg = ConcatStrings("Calling: ", LLX_Tok);
		PrintDebug(msg);
		Print(msg);
		MEM_CallByString(LLX_Tok);
	} 
	else if (Hlp_StrCmp ("PUT", LLX_Tok)	|| Hlp_StrCmp ("PEEK", LLX_Tok)) {
			/* put myVar 42	* peak myVar */
			var int putting; putting = Hlp_StrCmp ("PUT", LLX_Tok);
    
        var string variable; var string value;
        var int succ; succ = 1;
        succ = succ && LLX_Next();
        variable = LLX_Tok;
        
        if (putting) {
            succ = succ && LLX_Next();
            value = LLX_Tok;
        };
        
        if (!succ) {
            if (putting) {
                Print("Usage example: 'put myVar 42'");
            } else {
                Print("Usage example: 'peek myVar'");
            };
            return;
        };
        
        var zCPar_Symbol sym;
        var int ptr;
        ptr = MEM_GetParserSymbol(variable);
        
        if (!ptr) {
            Print("Variable not found.");
            return;
        };
        sym = MEM_PtrToInst (ptr);
        
        var int type;
        type = sym.bitfield & zCPar_Symbol_bitfield_type;
        
        if (type != zPAR_TYPE_INT)
        && (type != zPAR_TYPE_STRING) {
            Print("Only string and integer variables supported!");
            return;
        };
        
        if ((sym.bitfield & zCPar_Symbol_bitfield_ele) != 1) {
            Print("Arrays currently not supported!");
            return;
        };
        
        if (type == zPAR_TYPE_INT) {
            if (putting) {
                var int IntVal;
                IntVal = STR_ToInt(value);
                
                if (!Hlp_StrCmp(IntToString(IntVal), value)) {
                    Print("String to Int conversion failed.");
                    return;
                };
                
                sym.content = IntVal;
                Print("Done.");
            } else {
                msg = ConcatStrings("value of int ", variable);
                msg = ConcatStrings(msg, " is: ");
                msg = ConcatStrings(msg, IntToString(sym.content));
                
                Print(msg);
                PrintDebug(msg);
            };
        } else {
            //type == zPAR_TYPE_STRING
            if (putting) {
                MEM_WriteString(sym.content, value);
                Print("Done.");
            } else {
                msg = ConcatStrings("value of string ", variable);
                msg = ConcatStrings(msg, " is: '");
                msg = ConcatStrings(msg, MEM_ReadString(sym.content));
                msg = ConcatStrings(msg, "'");
                
                Print(msg);
                PrintDebug(msg);
            };
        };
    } 
	 else if (Hlp_StrCmp (LLX_Tok, "TOGGLE")) {
		if (!LLX_Next()) { return; };
		
		if (Hlp_StrCmp (LLX_Tok, "TOLD")) {
			if (!LLX_Next()) {
				Print("Which Dialog (C_INFO) should I tell/untell?");
				return;
			};
            
            var int ID;
            ID = MEM_FindParserSymbol(LLX_Tok);
            
            if (ID == -1) {
                Print("Dialog not found.");
                return;
            };
            
            const int oCInfoManager__GetInformation = 7350544; //0x702910
            CALL_IntParam(ID);
            CALL__thiscall(MEM_Game.infoman, oCInfoManager__GetInformation);
            
            var oCInfo info;
            info = MEM_PtrToInst (CALL_RetValAsPtr());
            info.told = !info.told;
            
            msg = ConcatStrings(LLX_Tok, " is now ");
            
            if (info.told) {
                ConcatStrings(msg, "told.");
            } else {
                ConcatStrings(msg, "not told.");
            };
            PrintDebug(msg);
            Print(msg);
        };
	} 
	else if (Hlp_StrCmp (LLX_Tok, "SLEEP")) {
		MEM_InfoBox ("Sleeping...");
	};
};

func void ObserveConsole() {
    var zCConsole zcon;
    zcon = MEM_PtrToInst (zcon_address);
    
    var int lastcommand_numInArray;
    
    if (lastcommand_numInArray != zcon.lastcommand_numInArray) {
        lastcommand_numInArray = zcon.lastcommand_numInArray;
        
        if (lastcommand_numInArray <= 0) {
            return;
        };
        
        ProcessCommand (MEM_ReadString (zcon.lastcommand_array + (lastcommand_numInArray - 1) * sizeOf_zString));
    };
};
