
func void ZS_ReactToDamage()
{
	Perception_Set_Normal();
	B_LookAtNpc(self,other);
	if(Npc_HasEquippedMeleeWeapon(self) == FALSE)
	{
		AI_EquipBestMeleeWeapon(self);
		/*if(Npc_HasItems(self,ITMW_DarkSaga_Shield_ds_06) && Npc_GetTalentSkill(self,NPC_TALENT_SHIELD))
		{
			B_DS_EquipItem(self,ITMW_DarkSaga_Shield_ds_06);
		};*/
	};
	if(Npc_HasEquippedRangedWeapon(self) == FALSE)
	{
		AI_EquipBestRangedWeapon(self);
	};
	B_SelectWeapon(self,other);
	B_TurnToNpc(self,other);
	B_Say(self,other,"$WHATAREYOUDOING");
	self.aivar[AIV_StateTime] = 0;
};

func int ZS_ReactToDamage_Loop()
{
	if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
	{
		if(!Npc_CanSeeNpc(self,other))
		{
			AI_TurnToNPC(self,other);
		};
		self.aivar[AIV_StateTime] = self.aivar[AIV_StateTime] + 1;
	};
	if(Npc_GetStateTime(self) > 10)
	{
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};
};

func void ZS_ReactToDamage_End()
{
	//AI_RemoveWeapon_ds(self);	//сапюмн 3.12.2013
	AI_RemoveWeapon(self);
	B_StopLookAt(self);
};

