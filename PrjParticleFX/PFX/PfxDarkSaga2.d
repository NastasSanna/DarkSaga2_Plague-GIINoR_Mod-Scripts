/////////////////////// DS2 PROLOG ///////////////////////////

prototype DRAGONBRIDGE_MAGIC_GLUE_PROTO(C_PARTICLEFX)
{
	// ��������� ������ �� ������� ----------------------------------
	// ���-�� ������
	ppsValue = 100;		// ������/���.
	// ��������������� ���-�� ������
	ppsScaleKeys_s = "1";	// ���� �� ppsValue � ������ �������
	// ��������� � �����
	ppsIsLooping = 1;	// =0|1
	// ����������
	ppsIsSmooth = 1;	// =0|1
	// �������� ��������������� ppsScaleKeys_s
	ppsFps = 2;
	
	// ���������������� ������������� ������ ------------------------
	// ����� �����������, �� ������� ��������� �������
	shpType_s = "MESH";		// ="point,line,box,circle,sphere,mesh"
	// ������ �� ��������� ��������� �� ��������� �����������
	shpFor_s = "OBJECT";		// ="world,object"
	// ������ �������� ��������� ������� ��������� ��������� ���������
	shpOffsetVec_s = "0 0 0";	// ="x y z"
	// ������������� ���������� ������ �� �����������
	shpDistribType_s = "RAND";	// ="RAND,UNIFORM,WALK"
	// ������ �� ������� ��������� �� ����� ������ (1) ��� ������ �� ����������� (0)
	shpIsVolume = 0;	// =0|1
	// ������ ���������� �����������
	shpDim_s = "1.00";
	// ��� ����� ����������� 
	shpMesh_s = "DP_BrokenBridge_Holes.3DS";		// ="name.3ds"
	// ������������ �� ��������� ����������� ������ � ����������� ���������
	shpMeshRender_b = 0;	// =0|1
	// ��������������� ����������� �� �������
	shpscalekeys_s = "1";
	shpscaleislooping = 1;
	shpscaleissmooth = 1;
	shpscalefps = 2;
	
	// �������� ������ ----------------------------------------------
	// ����������� ������ �������
	dirMode_s = "NONE";			// ="NONE,RAND,DIR,TARGET,MESH"
	// � ���� ��������� ���� ������
	//dirFor_s = "OBJECT";			// ="world,object"
	// dirMode_s = "TARGET"
	dirModeTargetFor_s = "OBJECT";	// ="world,object"
	dirModeTargetPos_s = "0 0 0";	// ="x y z"
	// dirMode_s = "DIR"
	dirAngleHeadVar = 180;	// [0..179]
	dirAngleELev = -90;		// [-90..90]
	// ������� �������� � 
	velAvg = 0.0001;
	// ��������� �������� ������ ������
	//velVar = 0.01;
	
	// ����� ����� ������ -------------------------------------------
	// ������� �����
	lspPartAvg = 4500;
	// ���������
	lspPartVar = 1000;
	
	// ����� ������ -------------------------------------------------
	// ������ ���������� � ������������� ������� ��������� ����
	flyGravity_s = "0 -0.0000001 0";	// ="x y z"
	// ������� ������ ��� ������������
	//var int		flyColldet_b;	// =0|1|2|3|4
	// 0 � �������� �� ������������ �� ����������
	// 1 � ���������� ���������
	// 2 � ���������� ���������
	// 3 � ��������� �������� �������
	// 4 � �������� �������
	
	// ������������ ������ ------------------------------------------
	// ��� ����� ������������ ������
	visName_s = "MFX_MAGICCLOUD.TGA";			// ="NAME.TGA|.3DS"
	// � ����� ����������� ����� ������������� ��������� ������
	visOrientation_s = "VELO";	// ="NONE,VELO,VELO3D"
	// ��� �������� ������������ ��������
	visTexIsQuadPoly = 1;
	// �������� �������� ������
	visTexAniFps = 15;
	// ������ �� ��������������� �������� ������ �� ��������� ������
	visTexAniIsLooping = 2;
	// ���� ������, RGB
	visTexColorStart_s = "0 0 255";	// =[0..255,0..255,0..255]
	visTexColorEnd_s = "0 255 255";	// =[0..255,0..255,0..255]
	// ������ ������
	visSizeStart_s = "70 70";		// ="x y"
	visSizeEndScale = 1;	// ���� �� visSizeStart_s
	// ����� ������� ������
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
	ppsValue = 200;		// ������/���.
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

// ���������� ���� � ������

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

// ���� �� ��������� � ������� ������

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


// ����������� ������
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