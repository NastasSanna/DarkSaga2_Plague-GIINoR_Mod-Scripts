
func void B_SetVisuals_Dragon_Crystal()
{
	Mdl_SetVisual(self,"Dragon.mds");
	Mdl_SetVisualBody(self,"Dragon_CRYSTAL_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};
instance Dragon_Talan(Mst_Default_Dragon_Undead)
{
	name[0] = "Талан";
	B_SetVisuals_Dragon_Crystal();
	Npc_SetToFistMode(self);
	flags = NPC_FLAG_IMMORTAL;
	effect = "spellfx_crystal_dragon";
	aivar[AIV_EnemyOverride] = TRUE;
};
