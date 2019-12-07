
func int Spell_ProcessMana_Release(var int manaInvested)
{
	var int activeSpell;
	activeSpell = Npc_GetActiveSpell(self);
	var int x; x=0;
	if(activeSpell == SPL_Pyrokinesis)
	{
		return SPL_SENDCAST;
	};
	if(activeSpell == SPL_ChargeFireball)
	{
		return SPL_SENDCAST;
	};
	if(activeSpell == SPL_ChargeZap)
	{
		return SPL_SENDCAST;
	};
	if(activeSpell == SPL_WindFist)
	{
		return SPL_SENDCAST;
	};
	if(activeSpell == SPL_Telekinesis)
	{
		//return SPL_SENDCAST;	//NS: почему-то не работает (в DSG норм). ???перехватывается экстовской функцией???
		//запускаем вручную:
		Spell_Cast_Telekinesis();
		return SPL_SENDSTOP;
	};
	return SPL_SENDSTOP;
};

