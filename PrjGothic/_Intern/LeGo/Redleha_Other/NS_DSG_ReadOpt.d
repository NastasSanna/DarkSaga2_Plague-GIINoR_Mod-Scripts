//NS - июнь 2013

// считать настройки из INI
// вызывать из Startup

//		main							secondary
var int OPT_KEY_Left;			var int OPT_KEY_Left2;			//keyLeft
var int OPT_KEY_Right;			var int OPT_KEY_Right2;			//keyRight
var int OPT_KEY_StrafeLeft;		var int OPT_KEY_StrafeLeft2;	//keyStrafeLeft
var int OPT_KEY_StrafeRight;	var int OPT_KEY_StrafeRight2;	//keyStrafeRight
var int OPT_KEY_Up;				var int OPT_KEY_Up2;			//keyUp
var int OPT_KEY_Down;			var int OPT_KEY_Down2;			//keyDown
var int OPT_KEY_Slow;			var int OPT_KEY_Slow2;			//keySlow

// считать настройки клавиш перемещения
func void B_ReadOpt_MoveKeys()
{
	OPT_KEY_Left = MEM_GetKey("keyLeft");
		OPT_KEY_Left2 = MEM_GetSecondaryKey("keyLeft");
	OPT_KEY_Right = MEM_GetKey("keyRight");
		OPT_KEY_Right2 = MEM_GetSecondaryKey("keyRight");
	OPT_KEY_StrafeLeft = MEM_GetKey("keyStrafeLeft");
		OPT_KEY_StrafeLeft2 = MEM_GetSecondaryKey("keyStrafeLeft");
	OPT_KEY_StrafeRight = MEM_GetKey("keyStrafeRight");
		OPT_KEY_StrafeRight2 = MEM_GetSecondaryKey("keyStrafeRight");
	OPT_KEY_Up = MEM_GetKey("keyUp");
		OPT_KEY_Up2 = MEM_GetSecondaryKey("keyUp");
	OPT_KEY_Down = MEM_GetKey("keyDown");
		OPT_KEY_Down2 = MEM_GetSecondaryKey("keyDown");
	OPT_KEY_Slow = MEM_GetKey("keySlow");
		OPT_KEY_Slow2 = MEM_GetSecondaryKey("keySlow");
};
