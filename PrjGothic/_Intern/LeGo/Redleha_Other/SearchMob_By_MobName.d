func int Search_MobByMobname(var string mobname)	//return mobPtr
{
	//
	//Scan MEM_World.voblist
	//
	var zCListSort ListVob;	//AllVob
	var zCVob anyVob;			//Any Vob in VobList
	var int vob_vtbl;
	
	var oCMob mob;	//if Vob is oCMobContainer
	
	/*
	const int oCMobFire_vtbl        = 8638876;
	const int zCMover_vtbl          = 8627324;
	const int oCMob_vtbl            = 8639700;
	const int oCMobInter_vtbl       = 8639884;
	const int oCMobLockable_vtbl    = 8637628;
	const int oCMobContainer_vtbl   = 8637284;
	const int oCMobDoor_vtbl        = 8638548;
	*/
	
	ListVob = _^(MEM_World.voblist);
	while(ListVob);
		
		vob_vtbl = ListVob.data;
		
		if(Hlp_Is_oCMob(vob_vtbl))
		{
			mob = _^(vob_vtbl);
			if( Hlp_StrCmp(mob._zCObject_objectName, mobname) )
			{
				return vob_vtbl; //mobPtr
			};
		};
		ListVob = _^(ListVob.next);
	end;
	MEM_Warn("Search_MobByMobname: 'Not Found'");
	RETURN 0;
};
