func void B_DS_ClearGold()
{
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
};
func void B_DS_ClearNugget()
{
	Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
};
func void B_DS_ClearGoldNugget()
{
	B_DS_ClearGold();
	B_DS_ClearNugget();
};

