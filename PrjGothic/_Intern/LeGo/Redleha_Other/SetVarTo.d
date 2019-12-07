func void SetVarTo (var string variableName, var int value) {
    var int symPtr;
    symPtr = MEM_GetParserSymbol (variableName);
    
    if (symPtr) { //!= 0 
        var zCPar_Symbol sym;
        sym = MEM_PtrToInst (symPtr);
        
        if ((sym.bitfield & zCPar_Symbol_bitfield_type)
                                      == zPAR_TYPE_INT) {
            sym.content = value;
        } else {
            MEM_Error ("SetVarTo: Die Variable ist kein Integer!");
        };
    } else {
        MEM_Error ("SetVarTo: Das Symbol existiert nicht!");
    };
};
