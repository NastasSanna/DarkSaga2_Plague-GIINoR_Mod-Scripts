
const int SPL_Cost_Telekinesis = 1;
const int STEP_Telekinesis = 1;

instance oCItem_Telekinesis(oCItem);

// IKARUS ==============================================================

//NS - май-июнь 2013
// варианты направлени€ перемещени€
const int TELEKINESIS_DIR_Left		= 1;
const int TELEKINESIS_DIR_Right		= 2;
const int TELEKINESIS_DIR_Toward	= 4;
const int TELEKINESIS_DIR_Away		= 8;
const int TELEKINESIS_DIR_Up		= 16;
const int TELEKINESIS_DIR_Down		= 32;

//перемещение предмета в направлении direction, на step см (float)
func void Telekinesis_MoveItem(var int direction, var int step)
{
	var oCNpc Npc; Npc = Hlp_GetNpc(self);
	Vob_BeginMovement(MEM_InstToPtr(oCItem_Telekinesis));
	//вверх/вниз - просто мен€ем (z)
	if (direction == TELEKINESIS_DIR_Up)
	{
		Vob_Move(MEM_InstToPtr(oCItem_Telekinesis), mkf(0), mkf(0), step);
	}
	else if (direction == TELEKINESIS_DIR_Down)
	{
		Vob_Move(MEM_InstToPtr(oCItem_Telekinesis), mkf(0), mkf(0), negf(step));
	}
	// остальные направлени€ по горизонтали, с учетом угла (x, y)
	else
	{
		//координаты игрока
		var int x0;	var int y0;
		x0 = Npc._zCVob_trafoObjToWorld[3];
		y0 = Npc._zCVob_trafoObjToWorld[11];
		//координаты предмета
		var int x1;	var int y1; 
		x1 = oCItem_Telekinesis._zCVob_trafoObjToWorld[3];
		y1 = oCItem_Telekinesis._zCVob_trafoObjToWorld[11];
		//рассто€ние от игрока до предмета по горизонтали
		var int r;	
		r = sqrtf(addf(sqrf(subf(x1, x0)), sqrf(subf(y1, y0))));		// r = sqrt((x0-x1)^2 + (y0-y1)^2)
		//изменение координат предмета
		var int dx;	var int dy;
		// направление
		if (direction == TELEKINESIS_DIR_Toward)		//к себе
		{
			dx = mulf(step, divf(subf(x0, x1), r));			//dx = -step * (x1-x0)/r
			dy = mulf(step, divf(subf(y0, y1), r));			//dy = -step * (y1-y0)/r
		}
		else if (direction == TELEKINESIS_DIR_Away)		//от себ€
		{
			dx = mulf(step, divf(subf(x1, x0), r));			//dx = step * (x1-x0)/r
			dy = mulf(step, divf(subf(y1, y0), r));			//dy = step * (y1-y0)/r
		}
		else if (direction == TELEKINESIS_DIR_Left)		//влево
		{
			dx = mulf(step, divf(subf(y0, y1), r));			//dx = -step * (y1-y0)/r
			dy = mulf(step, divf(subf(x1, x0), r));			//dy =  step * (x1-x0)/r
		}
		else if (direction == TELEKINESIS_DIR_Right)	//вправо
		{
			dx = mulf(step, divf(subf(y1, y0), r));			//dx =  step * (y1-y0)/r
			dy = mulf(step, divf(subf(x0, x1), r));			//dy = -step * (x1-x0)/r
		};
		
		// выполнить перемещение
		Vob_Move(MEM_InstToPtr(oCItem_Telekinesis), dx, dy, mkf(0));
	};
	// если вызывает коллизию - отменить перемещение
	//контроль только положени€ центра, без учета габаритов
	if (Vob_IsColliding(MEM_InstToPtr(oCItem_Telekinesis)))
	{
		Vob_ResetToOldMovementState(MEM_InstToPtr(oCItem_Telekinesis));
	}
	// иначе - расход маны маны Ц 1п. на 5 шагов (~15-25см)                
	else if(self.aivar[AIV_SpellLevel] % 5 == 0)
	{
		self.attribute[ATR_MANA] -= STEP_Telekinesis;
		if(self.attribute[ATR_MANA] < 0)
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
	Vob_EndMovement(MEM_InstToPtr(oCItem_Telekinesis), 0);
		// поворачиваем √√ к предмету
		if ((direction == TELEKINESIS_DIR_Left) || (direction == TELEKINESIS_DIR_Right))
		{
			Npc_Turning(npc, oCItem_Telekinesis._zCVob_trafoObjToWorld[3],
							 oCItem_Telekinesis._zCVob_trafoObjToWorld[7],
							 oCItem_Telekinesis._zCVob_trafoObjToWorld[11]);
		};
	//наложение эффекта
	Wld_PlayEffect("spellFX_ItemAusbuddeln",oCItem_Telekinesis,oCItem_Telekinesis,0,0,0,FALSE);
};

// ==========================================================

instance Spell_Telekinesis(C_Spell_Proto)
{
	time_per_mana = 10;	//не исп., расход маны за перемещение
	spelltype = SPELL_NEUTRAL;
	targetCollectRange = 10000; 
	targetCollectAlgo = TARGET_COLLECT_FOCUS;
	targetCollectType = TARGET_TYPE_ITEMS;
	canTurnDuringInvest = FALSE;
	canChangeTargetDuringInvest = false;
};

func int Spell_Logic_Telekinesis(var int manaInvested)
{
	if(c_UnblessedCursedSpell() == SPL_SENDSTOP)
	{
		return SPL_SENDSTOP;
	};
	
	var oCNpc Npc; Npc = Hlp_GetNpc(self);
	if(self.aivar[AIV_SpellLevel] == 0)
	{
		//прив€зка предмета в фокусе к инстанции oCItem_Telekinesis
		var int temp;	temp = oCItem_Telekinesis;
		MEM_AssignInst(temp, Npc.focus_vob);
		//вкл. обнаружение коллизий
		Vob_SetCollDet(MEM_InstToPtr(oCItem_Telekinesis), TRUE);
		//Vob_SetDrawBBox3D(MEM_InstToPtr(oCItem_Telekinesis), TRUE);
	};

	if(self.attribute[ATR_MANA] < STEP_Telekinesis) 
	{
		return SPL_DONTINVEST;
	};

	if(manaInvested <= STEP_Telekinesis)
	{
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else
	{
		B_ReadOpt_MoveKeys();
		//приподн€ть при захвате
		if(self.aivar[AIV_SpellLevel] == 0)
		{
			Telekinesis_MoveItem(TELEKINESIS_DIR_Up, mkf(10));
		};
		// выбор направлени€ (можно одновременно - по диагонали)
		//влево-вправо
		if (MEM_KeyPressed(OPT_KEY_Left) || MEM_KeyPressed(OPT_KEY_Left2)
			|| MEM_KeyPressed(OPT_KEY_StrafeLeft) || MEM_KeyPressed(OPT_KEY_StrafeLeft2))
		{	Telekinesis_MoveItem(TELEKINESIS_DIR_Left, mkf(3)); }
		else if (MEM_KeyPressed(OPT_KEY_Right) || MEM_KeyPressed(OPT_KEY_Right2)
			|| MEM_KeyPressed(OPT_KEY_StrafeRight) || MEM_KeyPressed(OPT_KEY_StrafeRight2))
		{	Telekinesis_MoveItem(TELEKINESIS_DIR_Right, mkf(3)); };
		//вверх/вниз
		if (MEM_KeyPressed(OPT_KEY_Slow) || MEM_KeyPressed(OPT_KEY_Slow2))
		{
			if (MEM_KeyPressed(OPT_KEY_Down) || MEM_KeyPressed(OPT_KEY_Down2))
			{	Telekinesis_MoveItem(TELEKINESIS_DIR_Down, mkf(3));	}
			else if (MEM_KeyPressed(OPT_KEY_Up) || MEM_KeyPressed(OPT_KEY_Up2))
			{	Telekinesis_MoveItem(TELEKINESIS_DIR_Up, mkf(3));	};
		}
		//к себе/от себ€
		else
		{
			if (MEM_KeyPressed(OPT_KEY_Down) || MEM_KeyPressed(OPT_KEY_Down2))
			{	Telekinesis_MoveItem(TELEKINESIS_DIR_Toward, mkf(5));	}
			else if (MEM_KeyPressed(OPT_KEY_Up) || MEM_KeyPressed(OPT_KEY_Up2))
			{	Telekinesis_MoveItem(TELEKINESIS_DIR_Away, mkf(5)); 	};
		};
		self.aivar[AIV_SpellLevel] += 1;
		return SPL_NEXTLEVEL;
	};
	return SPL_STATUS_CANINVEST_NO_MANADEC;
};

func void Spell_Cast_Telekinesis()
{
	//Vob_SetDrawBBox3D(MEM_InstToPtr(oCItem_Telekinesis), FALSE);
	var oCNpc Npc; Npc = Hlp_GetNpc(self);
//	MEM_InitAll(); в Startup.d
	//включаем физику
	oCItem_Telekinesis._zCVob_bitfield[0] = oCItem_Telekinesis._zCVob_bitfield[0] | zCVob_bitfield0_physicsEnabled;
	//отключаем режим ФsleepФ
	oCItem_Telekinesis._zCVob_bitfield[2] = oCItem_Telekinesis._zCVob_bitfield[2] | zCVob_bitfield2_sleepingMode;
	//записываем в activeVobList
	MEM_WriteInt(MEM_World.activeVobList_array + 4*(MEM_World.activeVobList_numInArray),MEM_InstToPtr(oCItem_Telekinesis));
	//сообщаем, что activeVobList стал на 1 элемент длиннее
	MEM_World.activeVobList_numInArray += 1;
	
	// сброс фокуса и счетчика циклов
	Npc.focus_vob = 0;
	self.aivar[AIV_SpellLevel] = 0;

	b_UnblessedCursedSpell();
	self.aivar[AIV_SelectSpell] += 1;
};

