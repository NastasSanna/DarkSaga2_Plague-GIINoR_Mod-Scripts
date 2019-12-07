instance none_18_Vatras(Npc_Default)
{
	name[0] = "������";
	guild = GIL_KDW;
	id = 18;
	voice = 5;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Saturas,BodyTex_B,itar_kdw_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	daily_routine = Rtn_PreStart_18;
};
func void Rtn_PreStart_18()	//����� �� �������
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};
func void Rtn_GotoPirates_18()	//��� �� ���� � ������� � ��
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};
 func void Rtn_Start_18()	//����� �� �������, ����� ��������� � ��������, ����� �������������
{
	TA_Stand_WP(8,0,23,0,"");
	TA_Stand_WP(23,0,8,0,"");
};
