
func void B_SetMonsterAttitude(var int fromGuild,var int attitude,var int toGuild)
{
	if(toGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(fromGuild,attitude,0);
		Wld_SetGuildAttitude(fromGuild,attitude,1);
		Wld_SetGuildAttitude(fromGuild,attitude,2);
		Wld_SetGuildAttitude(fromGuild,attitude,3);
		Wld_SetGuildAttitude(fromGuild,attitude,4);
		Wld_SetGuildAttitude(fromGuild,attitude,5);
		Wld_SetGuildAttitude(fromGuild,attitude,6);
		Wld_SetGuildAttitude(fromGuild,attitude,7);
		Wld_SetGuildAttitude(fromGuild,attitude,8);
		Wld_SetGuildAttitude(fromGuild,attitude,9);
		Wld_SetGuildAttitude(fromGuild,attitude,10);
		Wld_SetGuildAttitude(fromGuild,attitude,11);
		Wld_SetGuildAttitude(fromGuild,attitude,12);
		Wld_SetGuildAttitude(fromGuild,attitude,13);
	}
	else if(fromGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(0,attitude,toGuild);
		Wld_SetGuildAttitude(1,attitude,toGuild);
		Wld_SetGuildAttitude(2,attitude,toGuild);
		Wld_SetGuildAttitude(3,attitude,toGuild);
		Wld_SetGuildAttitude(4,attitude,toGuild);
		Wld_SetGuildAttitude(5,attitude,toGuild);
		Wld_SetGuildAttitude(6,attitude,toGuild);
		Wld_SetGuildAttitude(7,attitude,toGuild);
		Wld_SetGuildAttitude(8,attitude,toGuild);
		Wld_SetGuildAttitude(9,attitude,toGuild);
		Wld_SetGuildAttitude(10,attitude,toGuild);
		Wld_SetGuildAttitude(11,attitude,toGuild);
		Wld_SetGuildAttitude(12,attitude,toGuild);
		Wld_SetGuildAttitude(13,attitude,toGuild);
	}
	else
	{
		Wld_SetGuildAttitude(fromGuild,attitude,toGuild);
	};
};

