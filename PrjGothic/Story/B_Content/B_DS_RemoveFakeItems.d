

//NS - 26/10/2013 
//удаление вспомогательных предметов. вызывать при торговле, смерти, бессознанке
// еще ???
func void B_DS_RemoveFakeItems(var C_NPC slf)
{
	Npc_RemoveInvItems(slf,ITRW_DS_FAKEBOLT,Npc_HasItems(slf,ITRW_DS_FAKEBOLT));	//я не понимаю, откуда они берутся!
	
	Npc_RemoveInvItems(slf,ItMw_2H_Axe_L_02,Npc_HasItems(slf,ItMw_2H_Axe_L_02));
	
	Npc_RemoveInvItems(slf,ItMw_DS_VakKastet,Npc_HasItems(slf,ItMw_DS_VakKastet));
	Npc_RemoveInvItems(slf,ItMw_DS_MonWeapon,Npc_HasItems(slf,ItMw_DS_MonWeapon));
	Npc_RemoveInvItems(slf,ItMw_DS_MW_Karakus,Npc_HasItems(slf,ItMw_DS_MW_Karakus));
};