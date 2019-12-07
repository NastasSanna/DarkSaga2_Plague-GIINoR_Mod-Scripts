
func int c_UnblessedCursedSpell()
{
	return SPL_SENDCAST;	
};

func void b_UnblessedCursedSpell()
{
	/*if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if((CanUseMagic == true) || (ShrinesHealed > 6))
		{
			return;
		}
		else
		{
			PrintScreen("Вы чувствуете легкое недомогание",-1,33,FONT_ScreenSmall,3);
			Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
			self.attribute[ATR_HITPOINTS] -= (self.attribute[ATR_HITPOINTS] / 2);						
		};
	};*/
};
