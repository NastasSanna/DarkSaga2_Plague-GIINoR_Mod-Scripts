
func void B_DSG_StartConspiracy()
{
	if (!Npc_IsDead(Symon))
	{
		B_StartOtherRoutine(Symon,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(SueBaby))
	{
		B_StartOtherRoutine(SueBaby,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Karah))
	{
		B_StartOtherRoutine(Karah,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Greg))
	{
		B_StartOtherRoutine(Greg,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Gard))
	{
		B_StartOtherRoutine(Gard,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Vales))
	{
		B_StartOtherRoutine(Vales,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Joseph))
	{
		B_StartOtherRoutine(Joseph,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Zedd))
	{
		B_StartOtherRoutine(Zedd,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Jorn))
	{
		B_StartOtherRoutine(Jorn,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Ado))
	{
		B_StartOtherRoutine(Ado,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(Hobo))
	{
		B_StartOtherRoutine(Hobo,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(LanSkeleton))
	{
		B_StartOtherRoutine(LanSkeleton,"PUBLIC_MEETING");
	};
	if (!Npc_IsDead(GrayBeard))
	{
		B_StartOtherRoutine(GrayBeard,"PUBLIC_MEETING");
	};
	if (Skip_InConspiracy == TRUE && !Npc_IsDead(Skip))
	{
		B_StartOtherRoutine(Skip,"PUBLIC_MEETING");
	};
	Conspiracy_IsStarted = TRUE;
};

func void B_DSG_StopConspiracy()
{
	AI_PlayAni(Ado,"T_SLESHOOT");
	AI_PlayAni(Karah,"T_SLESHOOT");
	if (!Npc_IsDead(GrayBeard))
	{
		AI_PlayAni(GrayBeard,"T_SLESHOOT");
		B_StartOtherRoutine(GrayBeard,"START");
	};
	if (!Npc_IsDead(Jorn))
	{
		AI_PlayAni(Jorn,"T_SLESHOOT");
		B_StartOtherRoutine(Jorn,"START");
	};
	AI_PlayAni(SueBaby,"T_SLESHOOT");
	AI_PlayAni(Symon,"T_SLESHOOT");
	AI_PlayAni(Zedd,"T_SLESHOOT");
	AI_PlayAni(Vales,"T_SLESHOOT");
	AI_PlayAni(Joseph,"T_SLESHOOT");
	AI_PlayAni(Ado,"T_SLESHOOT");
	AI_PlayAni(Hobo,"T_SLESHOOT");
	AI_PlayAni(LanSkeleton,"T_SLESHOOT");
	B_StartOtherRoutine(LanSkeleton,"START");
	B_StartOtherRoutine(Ado,"START");
	B_StartOtherRoutine(Joseph,"START");
	B_StartOtherRoutine(Symon,"START");
	B_StartOtherRoutine(SueBaby,"START");
	B_StartOtherRoutine(Karah,"START");
	if (Skip_InConspiracy == TRUE)
	{
		B_StartOtherRoutine(Skip,"AFTERQUEST");
	};
};
	
	
	