func void B_Play_RandomAni(var int BS_STATE)
{
	var int randomani;
	randomani = Hlp_Random(25);
	if((randomani == 0) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"T_FORGETIT",BS_STATE);
	}
	else if((randomani == 1) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"T_DONTKNOW",BS_STATE);
	}
	else if((randomani == 2) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"T_YES",BS_STATE);
	}
	else if((randomani == 3) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"T_NO",BS_STATE);
	}
	else if((randomani == 4) && (BS_STATE == BS_STAND) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"T_GREETGRD",BS_STATE);
	}
	else if((randomani == 5) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"R_SCRATCHEGG",BS_STATE);
	}
	else if((randomani == 6) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"R_SCRATCHHEAD",BS_STATE);
	}
	else if((randomani == 7) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"R_SCRATCHRSHOULDER",BS_STATE);
	}
	else if((randomani == 8) )//&& (BS_STATE != BS_LIE))
	{
		AI_PlayAniBS(self,"R_SCRATCHLSHOULDER",BS_STATE);
	};	
};
func void B_Say_Smalltalk(var int BS_STATE)
{
	var int random;
	var int Choice;	
	var int Choice_DS;
	random = Hlp_Random(105);
	if(random < 5)
	{
		B_Say(self,self,"$SMALLTALK01");
	}
	else if(random < 10)
	{
		B_Say(self,self,"$SMALLTALK02");
	}
	else if(random < 15)
	{
		B_Say(self,self,"$SMALLTALK03");
	}
	else if(random < 20)
	{
		B_Say(self,self,"$SMALLTALK04");
	}
	else if(random < 25)
	{
		B_Say(self,self,"$SMALLTALK05");
	}
	else if(random < 30)
	{
		B_Say(self,self,"$SMALLTALK06");
	}
	else if(random < 35)
	{
		B_Say(self,self,"$SMALLTALK07");
	}
	else if(random < 40)
	{
		B_Say(self,self,"$SMALLTALK08");
	}
	else if(random < 45)
	{
		B_Say(self,self,"$SMALLTALK09");
	}
	else if(random < 50)
	{
		B_Say(self,self,"$SMALLTALK10");
	}
	else if(random < 55)
	{
		B_Say(self,self,"$SMALLTALK11");
	}
	else if(random < 60)
	{
		B_Say(self,self,"$SMALLTALK12");
	}
	else if(random < 65)
	{
		B_Say(self,self,"$SMALLTALK13");
	}
	else if(random < 70)
	{
		B_Say(self,self,"$SMALLTALK14");
	}
	else if(random < 75)
	{
		B_Say(self,self,"$SMALLTALK15");
	}
	else if(random < 80)
	{
		B_Say(self,self,"$SMALLTALK16");
	}
	else if(random < 85)
	{
		B_Say(self,self,"$SMALLTALK17");
	}
	else if(random < 90)
	{
		B_Say(self,self,"$SMALLTALK18");
	}
	else if(random < 95)
	{
		B_Say(self,self,"$SMALLTALK19");
	}
	else if(random < 100)
	{
		B_Say(self,self,"$SMALLTALK20");
	}
	else if(random < 105)
	{
		B_Say(self,self,"$SMALLTALK21");
	};
	B_Play_RandomAni(BS_STATE);
};
