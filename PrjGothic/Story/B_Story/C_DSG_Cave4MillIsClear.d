
// всю ли нежить в склепе по квесту "Старая мельница" перебили
func int C_DSG_GraniteGraveIsClear()
{
	// UNFINISHED вписать всех мертвяков
	if (Npc_IsDead(Skeleton_Lord_DS2P_GraniteGrave)
		&& Npc_IsDead(Skeleton_Ghost_Mage_DS2P_GraniteGrave))
	{	return TRUE;	};
	return FALSE;
};