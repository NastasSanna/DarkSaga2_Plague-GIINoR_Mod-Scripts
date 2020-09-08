
//************************************************
//   Weniger Strenger External Test
//************************************************

const int _ExternalAcceptVobsCount = 0;
const int _oCNpcTypeInfo = 8983472;  //0x8913B0
const int _zCVobTypeInfo = 8970208;  //0x88DFE0

func void ExternalAcceptVobs() {
    if (!_ExternalAcceptVobsCount) {
        const int once = 0;

        var int ptr; ptr = 7188726; //0x6DB0F6
        if (!once) { MemoryProtectionOverride(ptr, 4); };
        MEM_WriteInt(ptr, _zCVobTypeInfo); //0x88DFE0

        ptr = 7188773; //0x6DB125
        if (!once) { MemoryProtectionOverride(ptr, 4); };
        MEM_WriteInt(ptr, _zCVobTypeInfo); //0x88DFE0

        once = true;
    };

    _ExternalAcceptVobsCount += 1;
};

func void ExternalDenyVobs() {
   _ExternalAcceptVobsCount -= 1;

   if (!_ExternalAcceptVobsCount) {
		var int ptr; ptr = 7188726; //0x6DB0F6
		MEM_WriteInt(ptr, _oCNpcTypeInfo); //0x88DFE0
		ptr = 7188773; //0x6DB125
      MEM_WriteInt(ptr, _oCNpcTypeInfo); //0x88DFE0
   };
};

var int Topics_CurrentTopic;

const int Topics_MaxTargets = 4;

class gCTopic {
    var string name;
    var string nameUpper;
    var string target;

    // var int marker; // gCSprite(h)
    // var int text; // zCViewText(h)

    var int positionsList; // zCArray<zCVob*>*
};

const string gCTopic_Struct = "auto|3 void";

instance gCTopic@(gCTopic);

func void gCTopic_Delete(var gCTopic this) {
    this.name = "";
    this.nameUpper = "";
    this.target = "";

    if(this.positionsList) {
        MEM_ArrayFree(this.positionsList);
    };
};

const string _Topics_Name = "";
const int _Topics_Handle = 0;

func int _Topics_GetTopic(var int h) {
    var gCTopic t; t = get(h);
    if(!STR_Compare(t.nameUpper, _Topics_Name)) {
        _Topics_Handle = h;
        return rBreak;
    };
};

func int Topics_GetTopic(var string topic) {
    _Topics_Name = STR_Upper(topic);
    _Topics_Handle = 0;

    foreachHndl(gCTopic@, _Topics_GetTopic);

    return _Topics_Handle;
};

func void Topics_SetCurrentTopic(var string topic) {
    if(Topics_GetTopic(topic)) {
        Topics_CurrentTopic = _Topics_Handle;
    };
};

func void _Topics_RemoveTarget(var int handle) {
    if(Topics_CurrentTopic == handle) {
        Topics_CurrentTopic = 0;
    };
    delete(handle);
};

func void Topics_RemoveTarget(var string topic) {
    if(Topics_GetTopic(topic)) {
        _Topics_RemoveTarget(_Topics_Handle);
    };
};

func void Topics_AddTarget(var string topic, var string target) {
    var string topicUpper; topicUpper = STR_Upper(topic);

    if(Topics_GetTopic(topicUpper)) {
        _Topics_RemoveTarget(_Topics_Handle);
    };

    var int h; h = new(gCTopic@);

    var gCTopic t; t = get(h);

    t.name = topic;
    t.nameUpper = topicUpper;
    t.target = STR_Upper(target);
};

func int _Topics_DistCalculator(var int x, var int y) {
    var C_Npc l; var C_Npc r;
    l = _^(x);
    r = _^(y);
    return Npc_GetDistToNpc(hero, l) - Npc_GetDistToNpc(hero, r);
};

func void Topics_UpdateTarget(var int h) {
    var gCTopic t; t = get(h);

    if(t.positionsList) {
        MEM_ArrayFree(t.positionsList);
    };

    t.positionsList = MEM_SearchAllVobsByName(t.target);

    var zCArray p; p = _^(t.positionsList);

    var int l; l = p.numInArray;
    var int i; i = 0;

    while(i < l);
        var int c; c = MEM_ReadIntArray(p.array, i);

        if(Hlp_Is_oCNpc(c)) {
            var oCNpc n; n = _^(c);

            if(!(n._zCVob_bitfield[2] & zCVob_bitfield2_sleepingMode)) {
                var zCWaypoint w; w = _^(zCWayNet_GetWaypoint(n.wpName));

                n._zCVob_trafoObjToWorld[3] = w.pos[0];
                n._zCVob_trafoObjToWorld[11] = w.pos[2];
            };
        };

        i += 1;
    end;


    if(l > Topics_MaxTargets) {
        ExternalAcceptVobs();

        MEM_ArraySortFunc(t.positionsList, _Topics_DistCalculator);

        ExternalDenyVobs();
        p.numInArray = Topics_MaxTargets;
    };

};

func void Topics_UpdateCurrentTarget() {
    if(Topics_CurrentTopic) {
        Topics_UpdateTarget(Topics_CurrentTopic);
    };
};

func void Topics_UpdateAllTargets() {
    foreachHndl(gCTopic@, Topics_UpdateTarget);
};
///

func int Log_GetTopicStatus(var string name) {
	const int logMan = 11191608; //0xaac538
	var zCList list; list = _^(logMan);

	while(list.next);
	  list = _^(list.next);
	  
	  if (list.data) {
		  MEM_Debug(MEM_ReadString(list.data));
			if (Hlp_StrCmp(MEM_ReadString(list.data), name)) {
				return MEM_ReadInt(list.data + 24);
		 };
	  };
	end;
	return 0;	//NS - 31/03/2016 если еще нет открытых миссий
};

