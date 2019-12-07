/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	
//	SearchWaypointByName  (VAR string wp)
//	-------------------------------------
//  	 
//  Sucht auf der derzeitigen ZEN nach dem Waypoint wp (string) und liefert den Offset (int)
//  des zCWaypoint zuruck.
//  Existiert der gesuchte Waypoint nicht, so wird 0 zuruckgegeben.
//	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

FUNC int SearchWaypointByName1(VAR string wp)
{
   MEM_InitGlobalInst();
   
   //Variablen setzen
   VAR zCWaypoint curWp;
   VAR zCListSort curItem;
   VAR zCListSort lastItem;
   
   //Bereitstellen vom ersten Waypoint-zCListSort
   MEM_AssignInst (curItem, MEM_Waynet.wplist_next); //MEM_Waynet.wplist_data sollte immer leer sein -> nachste (erste) zCListSort holen
   
   //Label initialisieren
   MEM_InitLabels();
   VAR int label;
   label = MEM_StackPos.position;
   //###// "Schleifen"-Anfang 

   iF (!curItem.data)  //Zur Sicherheit (Sollte nur aufgerufen werden, wenn es gar keine WPs gibt)
   {
      //Waypointliste zu Ende (Kein Fund)
      RETURN 0; 
   };

   MEM_AssignInst (curWp, curItem.data);
   
   //"Schleife" verlassen?
	IF (Hlp_StrCmp(curWp.name, wp))    //Ist es der gesuchte WP?
	{
	//Gefunden!
		RETURN MEM_InstGetOffset(curWp);    //MEM_InstGetOffset schien mir eigentlich nicht notwendig, aber es kam ansonsten zu Absturzen
	};
	
	IF (!curItem.next)
	{
		//Waypointliste zu Ende (Kein Fund)
		RETURN 0;  
	};

	//Nachste zCListSort holen
	MEM_AssignInst (lastItem, MEM_InstGetOffset(curItem));  //Etwas verschachtelt, weil es sonst bei mir zu Absturzen kam
	MEM_AssignInst (curItem, lastItem.next);
   
   //###// Zuruck an den "Schleifen"-Anfang
   MEM_StackPos.position = label;   
   
   MEM_Warn("SearchWaypointByName: Schleifenfehler");
   RETURN 0;    //Zur Sicherheit
};
func void SearchWP_Example()
{
	VAR oCNpc her;
    her = Hlp_GetNpc (PC_HERO);
    VAR zCWaypoint meinWp;
    MEM_AssignInst (meinWp, SearchWaypointByName1("EIN_WAYPOINT"));    
    meinWp.pos[ 0] = her._zCVob_trafoObjToWorld[ 3];
    meinWp.pos[ 1] = her._zCVob_trafoObjToWorld[ 7];
    meinWp.pos[ 2] = her._zCVob_trafoObjToWorld[11];
};
FUNC int SearchWaypointByName(VAR string wp)
{
   MEM_InitGlobalInst();
   
   VAR zCWaypoint curWp;
   VAR zCListSort curItem;
   
   curItem = _^(MEM_Waynet.wplist_next);
   while(curItem);		
		curWp = _^(curItem.data);
		IF (Hlp_StrCmp(curWp.name, wp))
		{
			Print("бюионимр мюидем!");
			RETURN MEM_InstToPtr(curWp);
		};
		IF (!curItem.next)
		{
			Print("бюионимр ме мюидем!");
			RETURN 0;
		};
		curItem = _^(curItem.next);
	end;	
};

