//DarkSaga
instance SPELLFX_VIOLETFIREARMOR(CFX_BASE_PROTO)
{
	visname_s = "VIOLET_LIGHT_HUMAN";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "=";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "FIRESMALL";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_VIOLETFIREARMOR_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 500;
};

instance SPELLFX_VIOLETFIREBIP_NECK(CFX_BASE_PROTO)
{
	visname_s = "VIOLET_LIGHT_HUMANBIP";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 NECK";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "FIRESMALL";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_VIOLETFIREBIP_NECK_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 500;
};
instance SPELLFX_VIOLETFIREBIP_RIGHTHAND(CFX_BASE_PROTO)
{
	visname_s = "VIOLET_LIGHT_HUMANBIP";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "FIRESMALL";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_VIOLETFIREBIP_RIGHTHAND_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 500;
};

instance SPELLFX_VIOLETFIREBIP_LEFTHAND(CFX_BASE_PROTO)
{
	visname_s = "VIOLET_LIGHT_HUMANBIP";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_LEFTHAND";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "FIRESMALL";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
};

instance SPELLFX_VIOLETFIREBIP_LEFTHAND_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 500;
};

///++++++++++++++++DARKSAGA+++++++++++++++++++++++++++++++
instance SPELLFX_WINDBOLT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Windbolt_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_WINDbolt_COLLIDE";
	emfxcolldyn_s = "spellFX_WINDbolt_COLLIDEDYNFX";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_WINDBOLT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_WINDbolt_INIT";
	scaleduration = 0.5;
};

instance SPELLFX_WINDBOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_WINDbolt_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "mfx_thunderbolt_cast";
	emcheckcollision = 1;
};

instance SPELLFX_WINDBOLT_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
	emcheckcollision = 0;
};

instance SPELLFX_WINDBOLT_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDbolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
};

instance SPELLFX_WINDBOLT_COLLIDEDYNFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderbolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
	sendassessmagic = 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_telekinesis(CFx_Base_Proto)
{
		visname_S 			= "MFX_Telekinesis_INIT";
		emtrjmode_s 		= "TARGET";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 2;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 2.;
		emtrjangleheadvar 	= 0.;
		emtrjeasefunc_s 	= "LINEAR";
		emtrjloopmode_s 	= "HALT";
		emtrjdynupdatedelay = 0.;
		emFXInvestOrigin_S 	= "spellFX_Telekinesis_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_Telekinesis_TARGET";
		//lightPresetname 	= "POISON";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
};

INSTANCE spellFX_telekinesis_KEY_INIT (C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_INIT";
		emtrjeasevel	  	= 0.01;
};

INSTANCE spellFX_telekinesis_KEY_INVEST_1	(C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TARGET";
		emtrjeasevel	  	= 2000;
		sfxid				= "MFX_TELEKINESIS_STARTINVEST";
		sfxisambient		= 1;
};


INSTANCE spellFX_telekinesis_KEY_CAST	(C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TargetEnd";
		
};

/*INSTANCE spellFX_telekinesis_KEY_STOP (C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TargetEnd";
		
};*/

INSTANCE spellFX_telekinesis_Origin		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Telekinesis_BRIDGE";
		emtrjmode_s 		= "TARGET LINE";
		emtrjeasevel	  	= 0.001;
		emTrjOriginNode 	= "BIP01 R Hand";
		emtrjdynupdatedelay = 0.;
		lightPresetname 	= "AURA";
		sfxid				= "MFX_TELEKINESIS_INVEST";
		sfxisambient		= 1;
};

///++++++++++++++++++++++++ DARKSAGA II +++++++++++++++++++++++++++++++

//* NS - 26/06/2013
// экран медленно темнеет
instance BLACK_SCREEN_SLOW(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "100000000000";
	userstring[1] = "0 0 0 255";
	userstring[2] = "0.5";
	visalphablendfunc_s = "BLEND";
	emfxlifespan = 2;
};

//* NS - 27/06/2013
// замедление времени, эффект наступает без задержки
instance SLOW_TIME_IMMEDIAT(CFX_BASE_PROTO)
{
	emfxlifespan = 30;
	visname_s = "morph.fov";
	userstring[0] = "0.8";
	userstring[1] = "1.0";
	userstring[2] = "120";
	userstring[3] = "90";
};


// NS - 2020
// Кристальный дракон
instance SPELLFX_CRYSTAL_DRAGON(CFX_BASE_PROTO)
{
	visname_s = "CRYSTAL_DRAGON";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "=";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	lightpresetname = "JUSTWHITE";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	emfxcreate_s = "SPELLFX_BLUE_DRAGONEYE_LEFT";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_BLUE_DRAGONEYE_LEFT(CFX_BASE_PROTO)
{
	visname_s = "DRAGON_BLUE_EYE_LEFT";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	emfxcreate_s = "SPELLFX_BLUE_DRAGONEYE_RIGHT";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_BLUE_DRAGONEYE_RIGHT(CFX_BASE_PROTO)
{
	visname_s = "DRAGON_BLUE_EYE_RIGHT";
	visalpha = 1;
	visalphablendfunc_s = "ADD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
	emtrjtargetrange = 10;
	emtrjnumkeys = 10;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 2e+006;
	emfxlifespan = -1;
	emselfrotvel_s = "0 0 0";
	secsperdamage = -1;
	emadjustshptoorigin = 1;
	emfxcreatedowntrj = 1;
};

instance SPELLFX_CRYSTAL_DRAGON_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
};

