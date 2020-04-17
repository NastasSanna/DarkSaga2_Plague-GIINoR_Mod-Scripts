func int C_IsItReveng(var C_Item Weap)
{
	if((Hlp_IsItem(Weap,ItMW_Ds_Punishment) == TRUE)) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_Reveng_ready()
{
	var C_Item EQ_Raveng;
	EQ_Raveng = Npc_GetReadiedWeapon(other);
	if(c_isitReveng(EQ_Raveng))
	{
		return TRUE;
	};
	return FALSE;
}; 

//==========
func int C_IsItOkoBeliar(var C_Item Weap)
{
	if((Hlp_IsItem(Weap,ItMW_Ds_OkoBeliar) == TRUE)) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_OkoBeliar_ready()
{
	var C_Item EQ_OkoBeliar;
	EQ_OkoBeliar = Npc_GetReadiedWeapon(other);
	if(c_isitOkoBeliar(EQ_OkoBeliar))
	{
		return TRUE;
	};
	return FALSE;
}; 

//=========
func int C_IsItOreConqCrusher(var C_Item Weap)
{
	if((Hlp_IsItem(Weap,ItMW_Ds_NuggetSubjugator) == TRUE) || (Hlp_IsItem(Weap,ItMW_Ds_Destruction) == TRUE)) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_OreConqCrusher_ready()
{
	var C_Item EQ_OreConqCrusher;
	EQ_OreConqCrusher = Npc_GetReadiedWeapon(other);
	if(c_isitOreConqCrusher(EQ_OreConqCrusher))
	{
		return TRUE;
	};
	return FALSE;
}; 


//=========
func int C_IsItSecret_Sword(var C_Item Weap)
{
	if(Hlp_IsItem(Weap,ItMw_Secret_Sword) == TRUE) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_Secret_Sword_ready()
{
	var C_Item EQ_Secret_Sword;
	EQ_Secret_Sword = Npc_GetReadiedWeapon(other);
	if(c_isitSecret_Sword(EQ_Secret_Sword))
	{
		return TRUE;
	};
	return FALSE;
}; 

//=========
func int C_IsItPosoh_Zreca(var C_Item Weap)
{
	if(Hlp_IsItem(Weap,ItMw_Posoh_Zreca) == TRUE) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_Posoh_Zreca_ready()
{
	var C_Item EQ_Posoh_Zreca;
	EQ_Posoh_Zreca = Npc_GetReadiedWeapon(other);
	if(c_isitPosoh_Zreca(EQ_Posoh_Zreca))
	{
		return TRUE;
	};
	return FALSE;
}; 

//=================================================
func int C_IsItPosoh_StudentZreca(var C_Item Weap)
{
	if(Hlp_IsItem(Weap,ItMw_Posoh_StudentZreca) == TRUE) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_Posoh_StudentZreca_ready()
{
	var C_Item EQ_Posoh_StudentZreca;
	EQ_Posoh_StudentZreca = Npc_GetReadiedWeapon(other);
	if(c_isitPosoh_StudentZreca(EQ_Posoh_StudentZreca))
	{
		return TRUE;
	};
	return FALSE;
}; 

//=================================================
func int C_IsItPosoh_Necromanta(var C_Item Weap)
{
	if(Hlp_IsItem(Weap,ItMw_Posoh_Necromanta) == TRUE) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_Posoh_Necromanta_ready()
{
	if (!Npc_HasReadiedMeleeWeapon(other))	{return FALSE;};	//NS (24/02/14)
	var C_Item EQ_Posoh_Necromanta;
	EQ_Posoh_Necromanta = Npc_GetReadiedWeapon(other);
	if(c_isitPosoh_Necromanta(EQ_Posoh_Necromanta))
	{
		return TRUE;
	};
	return FALSE;
}; 

//=================================================
func int C_IsItDark_Blade(var C_Item Weap)
{
	if(Hlp_IsItem(Weap,ItMw_Dark_Blade) == TRUE) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_Dark_Blade_ready()
{
	if (!Npc_HasReadiedMeleeWeapon(other))	{return FALSE;};	//NS (24/02/14)
	var C_Item EQ_Dark_Blade;
	EQ_Dark_Blade = Npc_GetReadiedWeapon(other);
	if(c_isitDark_Blade(EQ_Dark_Blade))
	{
		return TRUE;
	};
	return FALSE;
}; 

//=================================================

//****************************
func int C_IsItOrcSlay(var C_Item Weap)
{
	if((Hlp_IsItem(Weap,ItMW_Ds_KillOrks) == TRUE)) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_OrcSlay_ready()
{
	if (!Npc_HasReadiedMeleeWeapon(other))	{return FALSE;};	//NS (24/02/14)
	var C_Item EQ_OrcSlay;
	EQ_OrcSlay = Npc_GetReadiedWeapon(other);
	if(c_isitOrcSlay(EQ_OrcSlay))
	{
		return TRUE;
	};
	return FALSE;
}; 

//==========

//****************************
func int C_IsItUndeadSlay(var C_Item Weap)
{
	if((Hlp_IsItem(Weap,ItMW_Ds_KillZombie) == TRUE)) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_UndeadSlay_ready()
{
	if (!Npc_HasReadiedMeleeWeapon(other))	{return FALSE;};	//NS (24/02/14)
	var C_Item EQ_UndeadSlay;
	EQ_UndeadSlay = Npc_GetReadiedWeapon(other);
	if(c_isitUndeadSlay(EQ_UndeadSlay))
	{
		return TRUE;
	};
	return FALSE;
};


//==========

/****************************
func int C_IsItUndeadSlayFRENSIS(var C_Item Weap)
{
	if((Hlp_IsItem(Weap,ItMw_UndeadSlay_FRENSIS) == TRUE)) 
	{
		return TRUE;
	};
	return FALSE;
};
func int c_UndeadSlayFRENSIS_ready()
{
	if (!Npc_HasReadiedMeleeWeapon(other))	{return FALSE;};	//NS (24/02/14)
	var C_Item EQ_UndeadSlayFRENSIS;
	EQ_UndeadSlayFRENSIS = Npc_GetReadiedWeapon(other);
	if(c_isitUndeadSlay(EQ_UndeadSlayFRENSIS))
	{
		return TRUE;
	};
	return FALSE;
};

//******************************************************************** STONE ***/

var int ItMW_Ds_KillOrks_HIT;
var int ItMW_Ds_KillZombie_HIT;
var int ItMw_UndeadSlay_FRENSIS_HIT;


func void B_MagicWeaponDamage(var C_Npc oth,var C_Npc slf) 
{
//****************************
	if(Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{	
		//тест
		//if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
		//{
		//	Wld_PlayEffect("SPELLFX_SLEEP",self,self,0,0,0,FALSE);
		//	B_MagicHurtNpc(other,self,200);
		//};
		//
		
		// **************************DS**************************
		if(Npc_HasItems(other,ItMW_Ds_Punishment))
		{
			if(c_Reveng_ready() == True)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				B_MagicHurtNpc(other,self,10);
			};
		};
	
		if(Npc_HasItems(other,ItMW_Ds_OkoBeliar))
		{
			if(c_OkoBeliar_ready() == True)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				B_MagicHurtNpc(other,self,15);
			};
		};
		if(Npc_HasItems(other,ItMW_Ds_NuggetSubjugator) || Npc_HasItems(other,ItMW_Ds_Destruction))
		{
			if(c_OreConqCrusher_ready() == True)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				B_MagicHurtNpc(other,self,20);
			};
		};
	
		if(Npc_HasItems(other,ItMw_Secret_Sword))
		{
			if(c_Secret_Sword_ready() == True)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				B_MagicHurtNpc(other,self,35);
			};
		};
	
		if(Npc_HasItems(other,ItMw_Posoh_Zreca))
		{
			if(c_Posoh_Zreca_ready() == True)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				B_MagicHurtNpc(other,self,50);
			};
		};
	
		if(Npc_HasItems(other,ItMw_Posoh_StudentZreca))
		{
			if(c_Posoh_StudentZreca_ready() == True)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				B_MagicHurtNpc(other,self,10);
			};
		};
	
		if(Npc_HasItems(other,ItMw_Posoh_Necromanta))
		{
			if(c_Posoh_Necromanta_ready() == True)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				B_MagicHurtNpc(other,self,30);
			};
		};
	
		if(Npc_HasItems(other,ItMw_Dark_Blade))
		{
			if(c_Dark_Blade_ready() == True)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
				B_MagicHurtNpc(other,self,50);
			};
		};
	
		//-------------------------------------------------------------------------------------------------	
		//*************************орки и нежить**********************************	
	
		if(Npc_HasItems(other,ItMW_Ds_KillOrks))
		{
			if(self.guild >= GIL_SEPERATOR_ORC)
			{
				if(c_OrcSlay_ready() == True)
				{
					ItMW_Ds_KillOrks_HIT += 1;
					if(ItMW_Ds_KillOrks_HIT % 10 == 1)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
						B_MagicHurtNpc(other,self,10);
					};
				};
			};
		};

		if(Npc_HasItems(other,ItMW_Ds_KillZombie))
		{
			if((self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_GOBBO_SKELETON) || (self.guild == GIL_SKELETON) 
			|| (self.guild == GIL_SUMMONED_SKELETON) || (self.guild == GIL_SKELETON_MAGE) || (self.guild == GIL_ZOMBIE) 
			|| (self.guild == GIL_SHADOWBEAST_SKELETON) || (self.guild == GIL_SummonedZombie) || (self.guild == GIL_UNDEADORC))
			{
				If(c_UndeadSlay_ready() == True)
				{
					ItMW_Ds_KillZombie_HIT += 1;
					if(ItMW_Ds_KillZombie_HIT % 10 == 1)
					{	
						Wld_PlayEffect("spellFX_HealShrine",self,self,0,0,0,FALSE);						
					};
					B_MagicHurtNpc(other,self,20);
				};
			};
		};
		/*/
		if(Npc_HasItems(other,ItMw_UndeadSlay_FRENSIS))
		{
			if((self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_GOBBO_SKELETON) || (self.guild == GIL_SKELETON) 
			|| (self.guild == GIL_SUMMONED_SKELETON) || (self.guild == GIL_SKELETON_MAGE) || (self.guild == GIL_ZOMBIE) 
			|| (self.guild == GIL_SHADOWBEAST_SKELETON) || (self.guild == GIL_SummonedZombie) || (self.guild == GIL_UNDEADORC))
			{
				If(c_UndeadSlayFRENSIS_ready() == True)
				{
					ItMw_UndeadSlay_FRENSIS_HIT += 1;
					if(ItMw_UndeadSlay_FRENSIS_HIT % 10 == 1)
					{	
						Wld_PlayEffect("spellFX_HealShrine",self,self,0,0,0,FALSE);						
					};
					B_MagicHurtNpc(other,self,50);
				};
			};
		};
		//*/
	};
};
