
// полное текущее время в минутах =(24*day + hour)*60 + minute
//для отсчета точного времени по квестам
var int Wld_day;
var int Wld_hour;
var int Wld_minute;
//oCGame::GetTime(int &,int &,int &)  006C4E70 2D
func int Wld_GetFullMinutes()
{
	const int oCGame__GetTime = 7097968;
	CALL_IntParam(_@(Wld_minute));
	CALL_IntParam(_@(Wld_hour));
	CALL_IntParam(_@(Wld_day));
	CALL__thiscall(_@(MEM_Game), oCGame__GetTime);
	return (24*Wld_day + Wld_hour)*60 + Wld_minute;
};

