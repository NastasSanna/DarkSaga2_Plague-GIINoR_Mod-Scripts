func void ZS_HAIL_INNOS()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_RUN);
	
	if(self.voice == 01)
	{
		ai_wait(self,1);
		AI_Output(self,self,"DIA_HAIL_INNOS_01_00");	//Слава Инносу!
	}
	else if(self.voice == 02)
	{
		ai_wait(self,2);
		AI_Output(self,self,"DIA_HAIL_INNOS_02_00");	//Слава Инносу!
	}
	else if(self.voice == 03)
	{
		ai_wait(self,3);
		AI_Output(self,self,"DIA_HAIL_INNOS_03_00");	//Слава Инносу!
	}
	else if(self.voice == 04)
	{
		ai_wait(self,3);
		AI_Output(self,self,"DIA_HAIL_INNOS_04_00");	//Слава Инносу!
	}
	else if(self.voice == 05)
	{
		ai_wait(self,4);
		AI_Output(self,self,"DIA_HAIL_INNOS_05_00");	//Слава Инносу!
	}
	else if(self.voice == 06)
	{
		ai_wait(self,4);
		AI_Output(self,self,"DIA_HAIL_INNOS_06_00");	//Слава Инносу!
	}
	else if(self.voice == 07)
	{
		ai_wait(self,1);
		AI_Output(self,self,"DIA_HAIL_INNOS_07_00");	//Слава Инносу!
	}
	else if(self.voice == 08)
	{
		ai_wait(self,2);
		AI_Output(self,self,"DIA_HAIL_INNOS_08_00");	//Слава Инносу!
	}
	else if(self.voice == 09)
	{
		AI_Output(self,self,"DIA_HAIL_INNOS_09_00");	//Слава Инносу!
	}
	else if(self.voice == 10)
	{
		ai_wait(self,1);
		AI_Output(self,self,"DIA_HAIL_INNOS_10_00");	//Слава Инносу!
	}
	else if(self.voice == 11)
	{
		ai_wait(self,1);
		AI_Output(self,self,"DIA_HAIL_INNOS_11_00");	//Слава Инносу!
	}
	else if(self.voice == 12)
	{
		AI_Output(self,self,"DIA_HAIL_INNOS_12_00");	//Слава Инносу!
	}
	else if(self.voice == 13)
	{
		AI_Output(self,self,"DIA_HAIL_INNOS_13_00");	//Слава Инносу!
	}
	else if(self.voice == 14)
	{
		AI_Output(self,self,"DIA_HAIL_INNOS_14_00");	//Слава Инносу!
	}
	else if(self.voice == 15)
	{
		AI_Output(self,self,"DIA_HAIL_INNOS_15_00");	//Слава Инносу!
	};	
};

func void ZS_HAIL_INNOS_End()
{
};
