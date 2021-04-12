func int C_NpcHasAlcohol(var C_NPC slf) {
	var int hasAmount; hasAmount = 0; 
	hasAmount += Npc_HasItems(slf, ItFo_Addon_Grog);
	hasAmount += Npc_HasItems(slf, ItFo_Addon_LousHammer);
	hasAmount += Npc_HasItems(slf, ItFo_Addon_Rum);
	hasAmount += Npc_HasItems(slf, ItFo_Addon_SchlafHammer);
	hasAmount += Npc_HasItems(slf, ItFo_Addon_SchnellerHering);
	hasAmount += Npc_HasItems(slf, ItFo_Beer);
	hasAmount += Npc_HasItems(slf, ItFo_Booze);
	hasAmount += Npc_HasItems(slf, ITFO_SAMOGON);
	hasAmount += Npc_HasItems(slf, ItFo_Wine);
	
	hasAmount += Npc_HasItems(slf, ItFo_DS2P_BullSeed);
	hasAmount += Npc_HasItems(slf, ItFo_DS2P_GobboSmile);
	hasAmount += Npc_HasItems(slf, ItFo_DS2P_Berserker);
	hasAmount += Npc_HasItems(slf, ItFo_DS2P_TrollBooze);
	hasAmount += Npc_HasItems(slf, ItFo_DS2P_MagicGrog);
	hasAmount += Npc_HasItems(slf, ItFo_DS2P_Kamikaze);
	return hasAmount;
};