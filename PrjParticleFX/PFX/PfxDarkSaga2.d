/////////////////////// DS2 PROLOG ///////////////////////////

prototype DRAGONBRIDGE_MAGIC_GLUE_PROTO(C_PARTICLEFX)
{
	// Поведение частиц во времени ----------------------------------
	// кол-во частиц
	ppsValue = 100;		// частиц/сек.
	// масштабирование кол-ва частиц
	ppsScaleKeys_s = "1";	// доли от ppsValue в каждую секунду
	// повторять в цикле
	ppsIsLooping = 1;	// =0|1
	// сглаживать
	ppsIsSmooth = 1;	// =0|1
	// скорость воспроизведения ppsScaleKeys_s
	ppsFps = 2;
	
	// Пространственное распределение частиц ------------------------
	// форма поверхности, на которой создаются частицы
	shpType_s = "MESH";		// ="point,line,box,circle,sphere,mesh"
	// должно ли излучение следовать за поворотом поверхности
	shpFor_s = "OBJECT";		// ="world,object"
	// вектор смещения локальной системы координат источника излучения
	shpOffsetVec_s = "0 0 0";	// ="x y z"
	// распределение излучаемых частиц по поверхности
	shpDistribType_s = "RAND";	// ="RAND,UNIFORM,WALK"
	// должны ли частицы рождаться на всему объему (1) или только по поверхности (0)
	shpIsVolume = 0;	// =0|1
	// размер излучаемой поверхности
	shpDim_s = "1.00";
	// имя файла поверхности 
	shpMesh_s = "DP_BrokenBridge_Holes.3DS";		// ="name.3ds"
	// производится ли рендеринг поверхности вместе с излучаемыми частицами
	shpMeshRender_b = 0;	// =0|1
	// масштабирование поверхности во времени
	shpscalekeys_s = "1";
	shpscaleislooping = 1;
	shpscaleissmooth = 1;
	shpscalefps = 2;
	
	// Движение частиц ----------------------------------------------
	// направление полета частицы
	dirMode_s = "NONE";			// ="NONE,RAND,DIR,TARGET,MESH"
	// к чему относится угол полета
	//dirFor_s = "OBJECT";			// ="world,object"
	// dirMode_s = "TARGET"
	dirModeTargetFor_s = "OBJECT";	// ="world,object"
	dirModeTargetPos_s = "0 0 0";	// ="x y z"
	// dirMode_s = "DIR"
	dirAngleHeadVar = 180;	// [0..179]
	dirAngleELev = -90;		// [-90..90]
	// средняя скорость и 
	velAvg = 0.0001;
	// дисперсия скорости полета частиц
	//velVar = 0.01;
	
	// Время жизни частиц -------------------------------------------
	// среднее время
	lspPartAvg = 4500;
	// дисперсия
	lspPartVar = 1000;
	
	// Полет частиц -------------------------------------------------
	// вектор гравитации в относительной системе координат мира
	flyGravity_s = "0 -0.0000001 0";	// ="x y z"
	// реакция частиц при столкновении
	//var int		flyColldet_b;	// =0|1|2|3|4
	// 0 – проверка на столкновение не проводится
	// 1 – тормозящее отражение
	// 2 – ускоряющее отражение
	// 3 – обнуление скорости частицы
	// 4 – удаление частицы
	
	// Визуализация частиц ------------------------------------------
	// имя файла визуализации частиц
	visName_s = "MFX_MAGICCLOUD.TGA";			// ="NAME.TGA|.3DS"
	// с какой ориентацией будет производиться рендеринг частиц
	visOrientation_s = "VELO";	// ="NONE,VELO,VELO3D"
	// тип анимации визуализации текстуры
	visTexIsQuadPoly = 1;
	// скорость анимации частиц
	visTexAniFps = 15;
	// должна ли останавливаться анимация частиц на последнем фрейме
	visTexAniIsLooping = 2;
	// цвет частиц, RGB
	visTexColorStart_s = "0 0 255";	// =[0..255,0..255,0..255]
	visTexColorEnd_s = "0 255 255";	// =[0..255,0..255,0..255]
	// размер частиц
	visSizeStart_s = "70 70";		// ="x y"
	visSizeEndScale = 1;	// доля от visSizeStart_s
	// альфа функция частиц
	visAlphaFunc_s = "ADD";	// ="NONE,BLEND,ADD,MUL"
	visAlphaStart = 255;	// =[0..255]
	//visAlphaEnd = 255;	// =[0..255]
};

instance DRAGONBRIDGE_MAGIC_GLUE(DRAGONBRIDGE_MAGIC_GLUE_PROTO)
{
	ppsCreateEm_S = "DRAGONBRIDGE_MAGIC_GLUE_CHILD";
};

instance DRAGONBRIDGE_MAGIC_GLUE_CHILD(DRAGONBRIDGE_MAGIC_GLUE_PROTO)
{
	//ppsValue = 15;
	ppsValue = 200;		// частиц/сек.
	shpIsVolume = 0;
	shpMesh_s = "DP_BrokenBridge_Composed.3DS";
	shpDim_s = "1.01";
	//flygravity_s = "0 0.00001 0";
	velavg = 0.01;
	visName_s = "ELECTRICBLUE0000.TGA";
	lspPartAvg = 2500;
	vistexcolorend_s = "255 255 255";
	visSizeStart_s = "20 20";
	visSizeEndScale = 1;
};

// Магический свет в руинах

instance MAGICLAMP_LIGHT(C_PARTICLEFX)
{
	ppsvalue = 30;
	ppsIsLooping = 1;	// =0|1
	ppsscalekeys_s = "1 0.9 0.8 1.0 1.1";
	ppsfps = 0.2;
	shptype_s = "POINT";
	shpfor_s = "object";
	shpoffsetvec_s = "0 0 0";
	shpdistribtype_s = "RAND";
	shpdim_s = "30";
	shpmeshrender_b = 1;
	shpscalekeys_s = "1";
	shpscaleissmooth = 1;
	dirmode_s = "RAND";
	dirfor_s = "object";
	dirmodetargetfor_s = "OBJECT";
	dirmodetargetpos_s = "0 0 0";
	dirangleheadvar = 180;
	dirangleelevvar = 180;
	velavg = 0.01;
	lsppartavg = 1000;
	lsppartvar = 100;
	flygravity_s = "0 0 0";
	visname_s = "HEAVENLIGHT.TGA";
	visorientation_s = "VELO3D";
	vistexisquadpoly = 1;
	vistexanifps = 18;
	vistexaniislooping = 1;
	vistexcolorstart_s = "255 100 100";
	vistexcolorend_s = "100 255 255";
	vissizestart_s = "5 20";
	vissizeendscale = 4;
	visalphafunc_s = "ADD";
	visalphastart = 255;
	useemittersfor = 1;
};

// Свет из отверстия в потолке пещеры

instance CEILING_HOLE_LIGHT(C_PARTICLEFX)
{
	ppsvalue = 50;
	ppsscalekeys_s = "1";
	ppsislooping = 1;
	ppsissmooth = 1;
	ppsfps = 2;
	shptype_s = "BOX";
	shpfor_s = "OBJECT";
	shpoffsetvec_s = "0 500 0";
	shpdistribtype_s = "RAND";
	shpisvolume = 1;
	shpdim_s = "500 10 500";
	shpscalekeys_s = "1";
	shpscaleislooping = 1;
	shpscaleissmooth = 1;
	shpscalefps = 2;
	dirmode_s = "DIR";
	dirfor_s = "WORLD";
	dirmodetargetfor_s = "OBJECT";
	dirmodetargetpos_s = "0 0 0";
	diranglehead = 85;
	dirangleelev = 85;
	velavg = 0.001;
	lsppartavg = 8000;
	lsppartvar = 2000;
	flygravity_s = "0 0 0";
	visname_s = "HEAVENLIGHT.TGA";
	visorientation_s = "VELO3D";
	vistexisquadpoly = 1;
	vistexanifps = 18;
	vistexaniislooping = 2;
	vistexcolorstart_s = "150 225 200";
	vistexcolorend_s = "150 225 200";
	vissizestart_s = "4 100";
	vissizeendscale = 25;
	visalphafunc_s = "ADD";
	visalphastart = 200;
	m_bisambientpfx = 1;
};


// Кристальный дракон
instance CRYSTAL_DRAGON(C_PARTICLEFX)
{
	ppsvalue = 300;
	ppsscalekeys_s = "1.0";
	ppsislooping = 1;
	ppsfps = 1;
	shptype_s = "MESH";
	shpfor_s = "OBJECT";
	shpoffsetvec_s = "0 0 0";
	shpdistribtype_s = "WALK";
	shpdistribwalkspeed = 100;
	shpdim_s = "7";
	shpscalekeys_s = "1";
	shpscaleislooping = 1;
	shpscaleissmooth = 1;
	shpscalefps = 2;
	dirmode_s = "NONE";
	velavg = 1e-011;
	lsppartavg = 1000;
	flygravity_s = "0 0.000 0";
	visname_s = "MFX_SLEEP_STAR.TGA";
	visorientation_s = "VELO";
	vistexisquadpoly = 1;
	vistexanifps = 0;
	vistexaniislooping = 2;
	vistexcolorstart_s = "220 240 220";
	vistexcolorend_s = "50 100 180";
	vissizestart_s = "25 25";
	vissizeendscale = 5;
	visalphafunc_s = "ADD";
	visalphastart = 200;
};

instance DRAGON_BLUE_EYE_LEFT(C_PARTICLEFX)
{
	ppsvalue = 50;
	ppsscalekeys_s = "1 1 1";
	ppsislooping = 1;
	ppsissmooth = 1;
	ppsfps = 1;
	shptype_s = "POINT";
	shpfor_s = "OBJECT";
	shpoffsetvec_s = "80 20 -13";
	shpdistribtype_s = "UNIFORM";
	shpisvolume = 1;
	shpdim_s = "4";
	shpscalekeys_s = "1";
	shpscaleissmooth = 1;
	dirmode_s = "RAND";
	dirfor_s = "WORLD";
	dirmodetargetfor_s = "OBJECT";
	dirmodetargetpos_s = "0 0 0";
	velavg = 0.0001;
	lsppartavg = 300;
	lsppartvar = 100;
	flygravity_s = "0 0 0";
	visname_s = "ZFLARE1.TGA";
	visorientation_s = "VELO";
	vistexisquadpoly = 1;
	vistexcolorstart_s = "40 80 180";
	vistexcolorend_s = "40 120 100";
	vissizestart_s = "7 7";
	vissizeendscale = 10;
	visalphafunc_s = "ADD";
	visalphastart = 150;
	useemittersfor = 0;
};

instance DRAGON_BLUE_EYE_RIGHT(C_PARTICLEFX)
{
	ppsvalue = 50;
	ppsscalekeys_s = "1 1 1";
	ppsislooping = 1;
	ppsissmooth = 1;
	ppsfps = 1;
	shptype_s = "POINT";
	shpfor_s = "OBJECT";
	shpoffsetvec_s = "80 -20 -13";
	shpdistribtype_s = "UNIFORM";
	shpisvolume = 1;
	shpdim_s = "4";
	shpscalekeys_s = "1";
	shpscaleissmooth = 1;
	dirmode_s = "RAND";
	dirfor_s = "WORLD";
	dirmodetargetfor_s = "OBJECT";
	dirmodetargetpos_s = "0 0 0";
	velavg = 0.0001;
	lsppartavg = 300;
	lsppartvar = 100;
	flygravity_s = "0 0 0";
	visname_s = "ZFLARE1.TGA";
	visorientation_s = "VELO";
	vistexisquadpoly = 1;
	vistexcolorstart_s = "40 120 100";
	vistexcolorend_s = "40 80 180";
	vissizestart_s = "7 7";
	vissizeendscale = 10;
	visalphafunc_s = "ADD";
	visalphastart = 150;
	useemittersfor = 0;
};


// Магический свет в библиотеке

instance MAGICLAMP_RED(C_PARTICLEFX)
{
	ppsvalue = 25;
	ppsscalekeys_s = "1";
	ppsislooping = 1;
	ppsissmooth = 1;
	ppsfps = 1;
	shptype_s = "SPHERE";
	shpfor_s = "object";
	shpoffsetvec_s = "0 -0.0002 0";
	shpdistribtype_s = "RAND";
	shpisvolume = 1;
	shpdim_s = "22";
	shpscalekeys_s = "1";
	shpscaleislooping = 1;
	shpscaleissmooth = 1;
	shpscalefps = 1;
	dirmode_s = "OBJECT";
	dirfor_s = "object";
	dirmodetargetfor_s = "OBJECT";
	dirmodetargetpos_s = "0 0 0";
	dirangleheadvar = 180;
	dirangleelevvar = 180;
	velavg = 0.001;
	velvar = 0.01;
	lsppartavg = 500;
	lsppartvar = 100;
	flygravity_s = "0 0 0";
	flycolldet_b = 0;
	visname_s = "FIREFLARE.TGA";
	visorientation_s = "NONE";
	vistexanifps = 12;
	vistexaniislooping = 1;
	vistexcolorstart_s = "255 60 60";
	vistexcolorend_s = "220 0 0";
	vissizestart_s = "25 25";
	vissizeendscale = 2;
	visalphafunc_s = "ADD";
	visalphastart = 200;
};

// Ядовитый туман

PROTOTYPE POISONFOG(C_PARTICLEFX)
{
	ppsvalue = 10;
	ppsscalekeys_s = "1.0 1.1 1.1 1.0 0.9 1.0 0.9";
	ppsislooping = 1;
	ppsissmooth = 1;
	shptype_s = "BOX";
	shpfor_s = "WORLD";
	shpoffsetvec_s = "0 0 0";
	shpdistribtype_s = "WALK";
	shpdistribwalkspeed = 0.1;
	shpisvolume = 1;
	shpdim_s = "1000 30 1000";
	shpscalekeys_s = "1";
	shpscaleislooping = 1;
	shpscaleissmooth = 1;
	shpscalefps = 2;
	dirmode_s = "DIR";
	dirangleheadvar = 50;
	dirangleelev = 0;
	dirangleelevvar = 20;
	velavg = 0;
	lsppartavg = 5500;
	lsppartvar = 800;
	flygravity_s = "0 -0.000001 0";
	visname_s = "GREENSMOKE.TGA";
	visorientation_s = "NONE";
	vistexisquadpoly = 1;
	vistexanifps = 5;
	vistexaniislooping = 2;
	vistexcolorstart_s = "140 150 145";
	vistexcolorend_s = "255 255 255";
	vissizestart_s = "50 50";
	vissizeendscale = 3;
	visalphafunc_s = "BLEND";
	visalphastart = 150;
	visalphaend = 100;
};

instance POISONFOG_SOURCE(POISONFOG)
{
	ppsvalue = 10;
	ppsscalekeys_s = "1.0";
	shpdim_s = "50 50 50";
	flygravity_s = "0 -0.000003 0";
};

instance POISONFOG_LIGHT(POISONFOG)
{
	ppsvalue = 90;
	shpdim_s = "1000 30 1000";
};

instance POISONFOG_HEAVY(POISONFOG)
{
	ppsvalue = 30;
	shpdim_s = "200 40 200";
};

// Головоломка с 4 цветами - огоньки


prototype PUZZLE_COLORS(C_PARTICLEFX)
{
	ppsvalue = 5;
	ppsscalekeys_s = "1.0";
	ppsissmooth = 1;
	ppsislooping = 1;
	ppsfps = 1;
	shptype_s = "SPHERE";
	shpfor_s = "OBJECT";
	shpoffsetvec_s = "0 0 0";
	shpisvolume = 1;
	shpdim_s = "20";
	// Движение частиц ----------------------------------------------
	// направление полета частицы
	dirMode_s = "TARGET";			// ="NONE,RAND,DIR,TARGET,MESH"
	// к чему относится угол полета
	dirModeTargetFor_s = "WORLD";	// ="world,object"
	// Центр колеса. Четко привязаны к месту!
	dirModeTargetPos_s = "8000 -270 34000";	// ="x y z"
	// средняя скорость и дисперсия скорости
	velAvg = 0.015;
	velVar = 0.001;
	lsppartavg = 9500;
	lsppartvar = 500;
	flygravity_s = "0 0 0";
	visname_s = "FlareStar.tga";
	visorientation_s = "NONE";
	vistexisquadpoly = 1;
	vistexanifps = 10;
	vistexaniislooping = 1;
	vissizestart_s = "60 60";
	vissizeendscale = 0.1;
	visalphafunc_s = "ADD";
	visalphastart = 255;
};
instance PUZZLE_COLORS_RED(PUZZLE_COLORS)
{
	vistexcolorstart_s = "200 0 0";
	vistexcolorend_s = "100 0 0";
};
instance PUZZLE_COLORS_YELLOW(PUZZLE_COLORS)
{
	vistexcolorstart_s = "200 200 0";
	vistexcolorend_s = "100 100 0";
};
instance PUZZLE_COLORS_AZURE(PUZZLE_COLORS)
{
	vistexcolorstart_s = "0 200 200";
	vistexcolorend_s = "0 100 100";
};
instance PUZZLE_COLORS_VIOLET(PUZZLE_COLORS)
{
	vistexcolorstart_s = "100 0 200";
	vistexcolorend_s = "50 0 100";
};
