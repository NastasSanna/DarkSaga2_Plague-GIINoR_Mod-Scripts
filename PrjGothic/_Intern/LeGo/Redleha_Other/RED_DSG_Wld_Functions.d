
const int Ptr_StructureLevelClippingFactor = 10071180; //0099AC8C
const int Adr_StructureLevelClippingFactor_offset = 1436;
const int Ptr_StructureVOBClippingFactor = 9235648; 	//008CECC0
const int Adr_StructureVOBClippingFactor_offset = 156;
	
func void Get_ClippingFactor()	//float (= LEVELFARCLIPZSCALER)
{
	var int clippingFactor;	//float
	clippingFactor = MEM_ReadInt(MEM_ReadInt(Ptr_StructureLevelClippingFactor) + Adr_StructureLevelClippingFactor_offset);
	//For_TEST:
	Print(Float32ToString(clippingFactor));
};
func void Get_VOBFARCLIPZSCALER()	//float (=VOBFARCLIPZSCALER
{
	var int clippingFactor;	//float
	clippingFactor = MEM_ReadInt(MEM_ReadInt(Ptr_StructureVOBClippingFactor) + Adr_StructureVOBClippingFactor_offset);
	Print(Float32ToString(clippingFactor));
};
func void Set_ClippingFactor(var float factorValue)	//float
{
	MEM_WriteInt(MEM_ReadInt(Ptr_StructureLevelClippingFactor) + Adr_StructureLevelClippingFactor_offset, castToIntf(factorValue));
	//FOR_TEST:
	Print(Float32ToString(MEM_ReadInt(MEM_ReadInt(Ptr_StructureLevelClippingFactor) + Adr_StructureLevelClippingFactor_offset)));
};

func void Get_LODFactor()	//float
{
	const int LODparametr = 9065268; 	// this is the number of type float. //008A5334
	Print(Float32ToString(MEM_ReadInt(LODparametr)));
};

func void Set_LODFactor(var float factorValue)	//float
{
	const int LODparametr = 9065268; 	// this is the number of type float. //008A5334
	MEM_WriteInt(LODparametr, castToIntf(factorValue));
	Print(Float32ToString(MEM_ReadInt(LODparametr)));
};


//////Работа в World, Time
//
/*
oCWorldTimer::AddTime(int &,int &,int,int)00781390 53 
oCWorldTimer::GetDay(void) 00780DD0 04 
oCWorldTimer::GetFullTime(void)  00780E80 0C 
oCWorldTimer::GetPassedTime(float)  00781220 1D 
oCWorldTimer::GetSkyTime(void)00781240 35 
oCWorldTimer::GetTime(int &,int &)  00780DF0 4A 
oCWorldTimer::GetTimeString(void)00780EC0 24C 
oCWorldTimer::IsDay(void)  00781280 7B 
oCWorldTimer::IsLater(int,int)00781110 3A 
oCWorldTimer::IsLaterEqual(int,int) 00781150 3A 
oCWorldTimer::IsNight(void)00781300 8D 
oCWorldTimer::IsTimeBetween(int,int,int,int) 00781190 85 
oCWorldTimer::SetDay(int)  00780DE0 A 
oCWorldTimer::SetFullTime(float) 00780E90 2F 
oCWorldTimer::SetTime(int,int)00780E40 3D
*/
//

func int Wld_Get_oCWorldTimer()	//return oCWorldTimer *  (alias: MEM_Game.wldTimer)
{
	const int Wld_Get__oCWorldTimer = 7089280;	//0x006C2C80
	CALL__thiscall(MEM_InstToPtr(MEM_Game), Wld_Get__oCWorldTimer);
	return CALL_RetValAsPtr();
};

const int time_GetDay = 0;
const int time_GetHour = 1;
const int time_GetMinute = 2;
var int time_Get[3];	//time_Get[0] - day; time_Get[1] - hour; time_Get[2] - minute.

func void Wld_GetTimeHM()	//return: hour in time_Get[1] and minute in time_Get[2]
{
	const int WldTimer__GetTime = 7867888; //00780DF0
	var int hour;
	var int minute;
	CALL_IntParam(_@(minute));
	CALL_IntParam(_@(hour));
	CALL__thiscall(MEM_Game.wldTimer, WldTimer__GetTime);
	time_Get[time_GetHour] = MEM_ReadInt(_@(hour));
	time_Get[time_GetMinute] = MEM_ReadInt(_@(minute));
};
func void Wld_GetTime()		//return: day in time_Get[0], hour in time_Get[1], minute in time_Get[1]
{
	//oCGame::GetTime(int &,int &,int &)  006C4E70 2D
	const int oCGame__GetTime = 7097968;
	var int day;
	var int hour;
	var int minute;
	CALL_IntParam(_@(minute));
	CALL_IntParam(_@(hour));
	CALL_IntParam(_@(day));
	CALL__thiscall(MEM_GamePtr, oCGame__GetTime);
	time_Get[time_GetDay] = MEM_ReadInt(_@(day));
	time_Get[time_GetHour] = MEM_ReadInt(_@(hour));
	time_Get[time_GetMinute] = MEM_ReadInt(_@(minute));
};
/*
Example in script
var int x;var int y;
...
Wld_GetTime();
x = time_Get[time_GetHour];
y = time_Get[time_GetMinute];
*/

//func void Wld_SetTime(var int hour,var int minute){};	//Standart

func int Wld_GetPassedTime(var int src_timeTicks)	//src_timeTicks (float as hex) - parametr as FullTime. return - minutes. See example.
{
	const int WldTimer__GetPassedTime = 7868960; //00781220
	CALL_FloatParam(src_timeTicks);
	CALL__thiscall(MEM_Game.wldTimer, WldTimer__GetPassedTime);
	return CALL_RetValAsInt();
};
/*
Example:
Wld_SetFullTime(500000);
var int x;
x = Wld_GetPassedTime(249999);
Print(IntToString(x)); // = 60

Example 2:
Wld_SetFullTime(500000);
var int x;
x = Wld_GetPassedTime(250000);
Print(IntToString(x)); // = 59

Example 3:
var int x; x = Wld_GetFullTime();			//x = 250000
...
var int y; y = Wld_GetFullTime();			//y = 500001
var int z; z = Wld_GetPassedTime(x);//z = 60
*/

//Return timeTicks from 0:00 of first day. (1 hour = 250000 Ticks)
//const int oCWorldTimer_TicksPerHour		  = 250000; <-> Misc.d in Ikarus Packet.
func int Wld_GetFullTime()	//float
{
	const int WldTimer__GetFullTime = 7868032; //00780E80
	CALL_RetValIsFloat();
	CALL__thiscall(MEM_Game.wldTimer, WldTimer__GetFullTime);
	return CALL_RetValAsFloat();
};
func void Wld_SetFullTime(var int fullTime)
{
	const int WldTimer__SetFullTime = 7868048; //00780E90
	CALL_FloatParam(mkf(fullTime));
	CALL__thiscall(MEM_Game.wldTimer,WldTimer__SetFullTime);
};

func string Wld_GetTimeString()	//Return time as string. Example: "8:07"
{
	const int WldTimer__GetTimeString = 7868096; //00780EC0
	CALL_RetValIszString();
	CALL__thiscall(MEM_Game.wldTimer, WldTimer__GetTimeString);
	return CALL_RetValAszString();
};

func void Wld_AddTime(var int addHour, var int addMinute)
{
	var int hour;
	var int minute;
	Wld_GetTime();
	hour = time_Get[0];
	minute = time_Get[1];
	//minute: 30 minut + 40 minut = 10 minut (hour not +1; 60minut -> nil)
	if((minute+addMinute) >= 60)	{	hour += (minute+addMinute) / 60;	};
	hour += addHour;
	minute += addMinute;	//alias: minute += (minute+addMinute) % 60;
	Wld_SetTime(hour,minute);
};

func int Wld_IsLater(var int dst_hour, var int dst_minute)	//return: TRUE/FALSE
{
	const int WldTimer__IsLater = 7868688;	//00781110
	CALL_IntParam(dst_minute);
	CALL_IntParam(dst_hour);
	CALL__thiscall(MEM_Game.wldTimer, WldTimer__IsLater);
	return CALL_RetValAsInt();
};

func void Wld_SetDay(var int dst_day)	//dst_Day (in playermenu Day = dst_Day+1). When start game , day = 0 (and in Playermenu DAY=1).
{
	const int WldTimer__SetDay = 7867872;	//00780DE0
	CALL_IntParam(dst_day);
	CALL__thiscall(MEM_Game.wldTimer, WldTimer__SetDay);
};
func void Wld_AddDays(var int add_Days)
{
	Wld_SetDay(Wld_GetDay() + add_Days);
};
func void Wld_SetTime_dhm(var int dd,var int hh, var int mm)	//dd (in playermenu Day = dd+1). When start game , day = 0 (and in Playermenu DAY=1).
{
	//oCGame::SetTime(int,int,int)  006C4DE0 8E
	const int oCGame__SetDay = 7097824;
	CALL_IntParam(mm);
	CALL_IntParam(hh);
	CALL_IntParam(dd);
	CALL__thiscall(MEM_GamePtr, oCGame__SetDay);
};

//
//This two functions needs for choice music (I think so)	(7:00 - 18:00 Day; 18:00 - 7:00 Night)
//
func int Wld_IsNight()	//return: TRUE/FALSE
{
	const int WldTimer__IsNight = 7869184;	//00781300
	CALL__thiscall(MEM_Game.wldTimer, WldTimer__IsNight);
	return CALL_RetValAsInt();
};
func int Wld_IsDay()	//return: TRUE/FALSE
{
	const int WldTimer__IsDay = 7869056;	//00781280
	CALL__thiscall(MEM_Game.wldTimer, WldTimer__IsDay);
	return CALL_RetValAsInt();
};
