
// ‘ункции движка дл€ поворотов NPC

//*NS - 24/06/13
//поворот на 1 шаг в направлении координат x, y, z
//поворт на очень малый угол, без анимации
func int Npc_Turn(var oCNPC npc, var int /*zREAL*/ x, var int /*zREAL*/ y, var int /*zREAL*/ z)
{
	const int oCNpc__Turn = 6828032; //float __thiscall oCNpc::Turn(zVEC3 &)  	0x00683000
	var int coord[3];
	coord[0] = x;
	coord[2] = y;
	coord[1] = z;
	CALL_PtrParam(_@(coord));
	CALL_RetValIsFloat();
	CALL__thiscall(MEM_InstToPtr(npc),oCNpc__Turn);
	return CALL_RetValAsFloat();
};
//*NS - 24/06/13
//=Npc_Turn
func int Npc_Turning(var oCNPC npc, var int x, var int y, var int z)
{
	const int oCNpc__Turning = 6828320; //float __thiscall oCNpc::Turning(zVEC3 &)  	0x00683120
	var int coord[3];
	coord[0] = x;
	coord[1] = y;
	coord[2] = z;
	CALL_PtrParam(_@(coord));
	CALL_RetValIsFloat();
	CALL__thiscall(MEM_InstToPtr(npc),oCNpc__Turning);
	return CALL_RetValAsFloat();
};
//дл€ вызова через AI_Function_I
func int B_HeroTurning(var int ptr_vec)	
{
	const int oCNpc__Turning = 6828320; //float __thiscall oCNpc::Turning(zVEC3 &)  	0x00683120
	CALL_PtrParam(ptr_vec);
	CALL_RetValIsFloat();
	CALL__thiscall(MEM_InstToPtr(hero),oCNpc__Turning);
	return CALL_RetValAsFloat();
};
//*NS - 25/06/13
//поворот на угол angle по часовой стрелке, x - ??? (в тестах ни на что не вли€л)
func void Npc_TurnDegrees(var oCNPC npc, var int /*zREAL*/ angle, var int x)
{
	const int oCAniCtrl_Human__TurnDegrees = 7006992; //void __thiscall oCAniCtrl_Human::TurnDegrees(float int)  	0x006AEB10
	CALL_IntParam(x);
	CALL_FloatParam(mkf(angle));
	CALL__thiscall(npc.anictrl,oCAniCtrl_Human__TurnDegrees);
};
//*NS - 24/06/13
//повернутьс€ к врагу (если он есть в npc.enemy)
func void Npc_TurnToEnemy(var C_NPC npc)	// not tested
{
	const int oCNpc__TurnToEnemy = 7568592; //void __thiscall oCNpc::TurnToEnemy(void)   	0x00737CD0
	CALL__thiscall(MEM_InstToPtr(npc),oCNpc__TurnToEnemy);
};

// WWWWWWWWWWWWWWWWWWWWWWWWW  ‘ “ќѕ ”!  WWWWWWWWWWWWWWWWWWWWWWWWWWWWW

//float __thiscall oCAniCtrl_Human::Turn(float int)  	0x006AE540
//void __thiscall oCAIHuman::PC_Turn(float int) 	0x00699DD0
//void __thiscall oCAIHuman::PC_Turnings(int)  	0x0069A940

// „то означают все параметры и возвращаемые значени€ - непон€тно
// npc поворачиваетс€ куда хочет, и тоже без анимаций! :!

//void __thiscall oCAniCtrl_Human::StrafeLeft(void)     	0x006B1B40
//void __thiscall oCAniCtrl_Human::StrafeRight(void)     	0x006B1B80

// јнимаци€ проигрываетс€ бесконечно. Ѕесполезны.

// MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

// ћои функции дл€ поворотов NPC. „ерез AI_TurnToSound. TESTED

// повернутьс€ на координаты (x, y, z) //пор€док спейсерный, y - вверх
func void AI_TurnXYZ(var C_NPC npc, var int /*zREAL*/ x,  var int /*zREAL*/ y,  var int /*zREAL*/ z)
{
	var oCNpc npc_t;	npc_t = Hlp_GetNpc(npc);
	npc_t.soundPosition[0] = x;
	npc_t.soundPosition[1] = y;
	npc_t.soundPosition[2] = z;
	AI_TurnToSound(npc);
};

// повернутьс€ в сторону WP с именем wp_name
func void AI_TurnToWP(var C_NPC npc, var string wp_name)
{
	var int wpptr;		wpptr = zCWayNet_GetWaypoint(wp_name);
	if (!wpptr)	{	return;	};
	var zCWaypoint wp;	wp = _^(wpptr);
	//npc_t.soundVob = wp.wpvob;	//не работает, поворот только на координаты
	AI_TurnXYZ(npc, wp.pos[0], wp.pos[1], wp.pos[2]);
};

// повернутьс€ в сторону item
func void AI_TurnToItem(var C_NPC npc, var int itemptr)
{
	if (!Hlp_Is_oCItem(itemptr))	{	return;	};
	var oCItem itm_t;	itm_t = _^(itemptr);
	AI_TurnXYZ(npc, itm_t._zCVob_trafoObjToWorld[3],itm_t._zCVob_trafoObjToWorld[7],itm_t._zCVob_trafoObjToWorld[11]);
};

// повернутьс€ на 90 градусов направо
func void AI_TurnRight(var C_NPC npc)
{
	var oCNpc npc_t;	npc_t = Hlp_GetNpc(npc);
	var int x[3];	//координаты точки, куда будем поворачиватьс€ (на 50см справа от npc)
	//x = M * (50, 0, 0, 1)^T
	x[0] = addf(mulf(mkf(50), npc_t._zCVob_trafoObjToWorld[0]), npc_t._zCVob_trafoObjToWorld[3]);		//= 50*M[0,0] + M[0,3]
	x[1] = addf(mulf(mkf(50), npc_t._zCVob_trafoObjToWorld[4]), npc_t._zCVob_trafoObjToWorld[7]);		//= 50*M[1,0] + M[1,3]
	x[2] = addf(mulf(mkf(50), npc_t._zCVob_trafoObjToWorld[8]), npc_t._zCVob_trafoObjToWorld[11]);		//= 50*M[2,0] + M[2,3]
	AI_TurnXYZ(npc,x[0],x[1],x[2]);
};

// повернутьс€ на 90 градусов налево
func void AI_TurnLeft(var C_NPC npc)
{
	var oCNpc npc_t;	npc_t = Hlp_GetNpc(npc);
	var int x[3];	//координаты точки, куда будем поворачиватьс€ (на 50см слева от npc)
	//x = M * (50, 0, 0, 1)^T
	x[0] = addf(mulf(mkf(-50), npc_t._zCVob_trafoObjToWorld[0]), npc_t._zCVob_trafoObjToWorld[3]);		//= -50*M[0,0] + M[0,3]
	x[1] = addf(mulf(mkf(-50), npc_t._zCVob_trafoObjToWorld[4]), npc_t._zCVob_trafoObjToWorld[7]);		//= -50*M[1,0] + M[1,3]
	x[2] = addf(mulf(mkf(-50), npc_t._zCVob_trafoObjToWorld[8]), npc_t._zCVob_trafoObjToWorld[11]);		//= -50*M[2,0] + M[2,3]
	AI_TurnXYZ(npc,x[0],x[1],x[2]);
};

// повернутьс€ на angle градусов (int) по часовой стрелке
func void AI_TurnDegree(var C_NPC npc, var int angle)
{
	if (angle % 360 == 0)	{	return;	};
	var oCNpc npc_t;	npc_t = Hlp_GetNpc(npc);
	var int a;	a = mulf(fracf(angle, 180), PI);	//переводим градусы в радианы
	//куда будем поворачиватьс€, в лок. коорд. на гориз. плоскости
	var int xi;	xi = mulf(sin(a), mkf(50));
	var int zi;	zi = mulf(cos(a), mkf(50));
	//куда будем поворачиватьс€, в мир. коорд.
	var int x[3];	//x = M * (xi, 0, zi, 1)^T
	x[0] = mulf(xi, npc_t._zCVob_trafoObjToWorld[0]);					//x[0] = xi*M[0,0] +
		x[0] = addf(x[0], mulf(zi,npc_t._zCVob_trafoObjToWorld[2]));	//       + zi*M[0,2]
		x[0] = addf(x[0], npc_t._zCVob_trafoObjToWorld[3]);				//       + M[0,3]
	x[1] = mulf(xi, npc_t._zCVob_trafoObjToWorld[4]);
		x[1] = addf(x[1], mulf(zi,npc_t._zCVob_trafoObjToWorld[6]));
		x[1] = addf(x[1], npc_t._zCVob_trafoObjToWorld[7]);
	x[2] = mulf(xi, npc_t._zCVob_trafoObjToWorld[8]);
		x[2] = addf(x[2], mulf(zi,npc_t._zCVob_trafoObjToWorld[10]));
		x[2] = addf(x[2], npc_t._zCVob_trafoObjToWorld[11]);
	AI_TurnXYZ(npc,x[0],x[1],x[2]);
};


