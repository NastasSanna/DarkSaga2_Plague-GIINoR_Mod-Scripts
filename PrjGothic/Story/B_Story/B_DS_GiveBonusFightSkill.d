/*From Constants.d
const int NPC_TALENT_1H = 1;
const int NPC_TALENT_2H = 2;
const int NPC_TALENT_BOW = 3;
const int NPC_TALENT_CROSSBOW = 4; 
*/
const int NPC_DS_TALENT_1H = 1;
const int NPC_DS_TALENT_2H = 2;
const int NPC_DS_TALENT_BOW = 4;
const int NPC_DS_TALENT_CROSSBOW = 8;

func void B_DS_GiveBonusFightSkill(var C_NPC slf, var int NPC_TALENT_TYPE, var int diff_bonus)
{
	if((NPC_TALENT_TYPE & NPC_DS_TALENT_1H) == NPC_DS_TALENT_1H)
	{
		B_AddFightSkill(slf,NPC_TALENT_1H,diff_bonus);
	};
	if((NPC_TALENT_TYPE & NPC_DS_TALENT_2H) == NPC_DS_TALENT_2H)
	{
		B_AddFightSkill(slf,NPC_TALENT_2H,diff_bonus);
	};
	if((NPC_TALENT_TYPE & NPC_DS_TALENT_BOW) == NPC_DS_TALENT_BOW)
	{
		B_AddFightSkill(slf,NPC_TALENT_BOW,diff_bonus);
	};
	if((NPC_TALENT_TYPE & NPC_DS_TALENT_CROSSBOW) == NPC_DS_TALENT_CROSSBOW)
	{
		B_AddFightSkill(slf,NPC_TALENT_CROSSBOW,diff_bonus);
	};
};
