
func void B_RefreshAtInsert()
{
	var C_Npc her;
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		return;
	};
	her = Hlp_GetNpc(PC_Hero);
	
	// для щита и 2 оружий - оверлей, слоты создать
	if (self.aivar[AIV_ShieldEquipped] > 0)	{
		B_CreateShieldSlots(self);
		if (self.aivar[AIV_ShieldEquipped] == ITEM_SHIELD)	{
			Mdl_ApplyOverlayMds(self,"HUM_SHIELD2.MDS");
		}
		else if (self.aivar[AIV_ShieldEquipped] == ITEM_DAG)	{
			if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_SECOND)
			{	Mdl_ApplyOverlayMds(self,"Hum_2x2L3.MDS");
			}
			else if(Npc_GetTalentSkill(self,NPC_TALENT_2X2H) == WEAPON_2X2_LEVEL_FIRST)
			{	Mdl_ApplyOverlayMds(self,"Hum_2x2L2.MDS");
			};
		};
	};
	
	if((self.guild < GIL_SEPERATOR_HUM) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her)))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		if(Npc_HasEquippedWeapon(self) == FALSE)
		{
			if(self.guild == GIL_PIR || self.guild == GIL_PIR2)
			{
				CreateInvItems(self,ItMw_1h_Sld_Sword,1);
			}
			else if(self.guild == GIL_BAU)
			{
				CreateInvItems(self,ItMw_1h_Bau_Axe,1);
			}
			else if(self.guild == GIL_HUN)
			{
				CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
			}
			else 
			{
				CreateInvItems(self,ItMw_1h_Bau_Mace,1);
			};
			// TO DO профессия - кузец
		};
	};
};

