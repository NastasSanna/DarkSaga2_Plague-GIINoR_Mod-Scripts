//==================================================
// Trade_ChangeSellMultiplier
// ----
// - mul have to be zfloat value
// - function should be refreshed atleast every trade 
//   for simplify you can add it in ZS_TALK
//==================================================
func void Trade_ChangeSellMultiplier(var int mul)
{
	var int ptr;
	ptr = MEMINT_oCInformationManager_Address;
	ptr = MEM_ReadInt(ptr+24);//oCInformationManager.dlgTrade
	ptr = MEM_ReadInt(ptr+260);     //dlgTrade.oCViewDialogItemContainer
	MEM_WriteInt(ptr+268,mul);//oCViewDialogItemContainer.Multiplier = mul
};

//==================================================
// Trade_ChangeBuyMultiplier
// ----
// - mul have to be zfloat value
// - function should be refreshed atleast every trade 
//   for simplify you can add it in ZS_TALK
//==================================================
func void Trade_ChangeBuyMultiplier(var int mul)
{
	var int ptr;
	ptr = MEMINT_oCInformationManager_Address;
	ptr = MEM_ReadInt(ptr+24);//oCInformationManager.dlgTrade
	ptr = MEM_ReadInt(ptr+252);     //dlgTrade.oCViewDialogStealContainer
	MEM_WriteInt(ptr+268,mul);//oCViewDialogStealContainer.Multiplier = mul 
};
