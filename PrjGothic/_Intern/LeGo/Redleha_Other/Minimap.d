
const int Minimap_Size = 192;

const int Minimap_PosX = 3;
const int Minimap_PosY = 3;

const int Minimap_Texsize = 512;

const string Minimap_Arrow = "L.tga";
const string Minimap_Marker = "U.tga";

var int Minimap_SpriteHndl;
var int Minimap_SpriteCursorHndl;

var int Minimap_SpriteMarkerHndl;

var int Minimap_minXf;
var int Minimap_minYf;

var int Minimap_distXf;
var int Minimap_distYf;

var int Minimap_Sizef;

var int Minimap_UVDistf;
var int Minimap_UVDistHalff;

var int Minimap_Mode; // 0 = zoomed

var int Minimap_Markers; // zCArray*

var int Minimap_PosXf;
var int Minimap_PosYf;
var int Minimap_MaxXf;
var int Minimap_MaxYf;

func int Minimap_Exists() {
    return Minimap_SpriteHndl;
};

func void Minimap_Destroy() {
    if(Minimap_SpriteHndl) {
        delete(Minimap_SpriteHndl);
        Minimap_SpriteHndl = 0;
    };
    if(Minimap_SpriteCursorHndl) {
        delete(Minimap_SpriteCursorHndl);
        Minimap_SpriteCursorHndl = 0;
    };

    FF_Remove(_Minimap_Loop);
};


func int _Minimap_CreateMarker() {
    if(Minimap_Mode) {
        return Sprite_CreatePxl(0, 0, 8, 8, COL_Red, Minimap_Marker);
    }
    else {
        return Sprite_CreatePxl(0, 0, 16, 16, COL_Red, Minimap_Marker);
    };
};

func void _Minimap_ResizeMarkers(var int x, var int y) {
    var int arr; arr = getPtr(Minimap_Markers);

    var int i; i = 0;
    repeat(i, MEM_ArraySize(arr));
        Sprite_SetDimPxl(MEM_ArrayRead(arr, i), x, y);
    end;
};

func void _Minimap_DestroyMarkers() {
    var int arr; arr = getPtr(Minimap_Markers);

    var int i; i = 0;
    repeat(i, MEM_ArraySize(arr));
        delete(MEM_ArrayRead(arr, i));
    end;

    MEM_ArrayClear(arr);
};

func void _Minimap_AdjustMarkers(var int num) {
    var int arr; arr = getPtr(Minimap_Markers);

    if(MEM_ArraySize(arr) == num) {
        return;
    };

    //TODO: das geht auch sauberer

    _Minimap_DestroyMarkers();

    var int i; i = 0;
    repeat(i, num);
        var int m; m = _Minimap_CreateMarker();
        MEM_ArrayInsert(arr, m);
        Sprite_SetPrio(m, 100);
    end;
};

func void _Minimap_InitCurrentMode() {
    if(Minimap_Mode) { // not zoomed
        Sprite_SetDimPxl(Minimap_SpriteCursorHndl, 8, 8);

        Sprite_SetUV(Minimap_SpriteHndl, floatNull, floatNull, floatEins, floatEins); // reset uv

        _Minimap_ResizeMarkers(8, 8);
    }
    else { // zoomed
        Sprite_SetDimPxl(Minimap_SpriteCursorHndl, 16, 16);

        _Minimap_ResizeMarkers(16, 16);
    };
};

func void _Minimap_Create(var string mapTex) {
    Minimap_SpriteHndl = Sprite_CreatePxl(Minimap_PosX + (Minimap_Size>>1), Minimap_PosY + (Minimap_Size>>1), Minimap_Size, Minimap_Size, COL_White, mapTex);
    Minimap_SpriteCursorHndl = Sprite_CreatePxl(0, 0, 8, 8, COL_White, Minimap_Arrow);

    Sprite_SetPrio(Minimap_SpriteCursorHndl, 100);

    if(!Minimap_Markers) {
        Minimap_Markers = new(zCArray@);
    }
    else {
        _Minimap_DestroyMarkers();
    };

    FF_ApplyOnce(_Minimap_Loop);

    _Minimap_InitCurrentMode();
};

func void Minimap_Init(var int minX, var int maxY, var int maxX, var int minY, var string mapTex) {
    Minimap_Destroy();

    Minimap_minXf = mkf(minX);
    Minimap_minYf = mkf(minY);

    Minimap_distXf = mkf(maxX - minX);
    Minimap_distYf = mkf(maxY - minY);

    Minimap_Sizef = mkf(Minimap_Size);

    Minimap_PosXf = mkf(Minimap_PosX);
    Minimap_PosYf = mkf(Minimap_PosY);

    Minimap_MaxXf = addf(Minimap_PosX, Minimap_Sizef);
    Minimap_MaxYf = addf(Minimap_PosY, Minimap_Sizef);

    Minimap_UVDistf = mulf(fracf(1, Minimap_Texsize), Minimap_Sizef);
    Minimap_UVDistHalff = divf(Minimap_UVDistf, mkf(2));

    _Minimap_Create(mapTex);
};

func void _Minimap_SetSpritePosition(var int sprite, var int posX, var int posY, var int isPlayer) {
    posX = divf(subf(posX, Minimap_minXf), Minimap_distXf);
    posY = subf(floatEins, divf(subf(posY, Minimap_minYf), Minimap_distYf));

    if(lf(posX, floatNull)) { posX = floatNull; };
    if(gf(posX, floatEins)) { posX = floatEins; };

    if(lf(posY, floatNull)) { posY = floatNull; };
    if(gf(posY, floatEins)) { posY = floatEins; };

    if(Minimap_Mode) { // not zoomed
        posX = mulf(posX, Minimap_Sizef);
        posY = mulf(posY, Minimap_Sizef);

        Sprite_SetPosPxlF(sprite, addf(mkf(Minimap_PosX), posX), addf(mkf(Minimap_PosY), posY));
    }
    else { // zoomed
        var int pposX; var int aposX;
        var int pposY; var int aposY;

        if(isPlayer) {
            var int uv[4];
            uv[0] = subf(posX, Minimap_UVDistHalff);
            uv[1] = subf(posY, Minimap_UVDistHalff);
            uv[2] = addf(posX, Minimap_UVDistHalff);
            uv[3] = addf(posY, Minimap_UVDistHalff);

            var int dx; var int dy;

            dx = 0;
            dy = 0;

            aposX = posX;
            aposY = posY;

            if(lf(uv[0], floatNull)) { dx = uv[0]; uv[0] = floatNull; uv[2] = Minimap_UVDistf; };
            if(lf(uv[1], floatNull)) { dy = uv[1]; uv[1] = floatNull; uv[3] = Minimap_UVDistf; };

            if(gf(uv[2], floatEins)) { dx = negf(subf(floatEins, uv[2])); uv[2] = floatEins; uv[0] = subf(floatEins, Minimap_UVDistf); };
            if(gf(uv[3], floatEins)) { dy = negf(subf(floatEins, uv[3])); uv[3] = floatEins; uv[1] = subf(floatEins, Minimap_UVDistf); };

            if(!dx && !dy) {
                pposX = mkf(Minimap_PosX + (Minimap_Size>>1));
                pposY = mkf(Minimap_PosY + (Minimap_Size>>1));
            }
            else {
                pposX = addf(mkf(Minimap_PosX + (Minimap_Size>>1)), mulf(dx, mkf(Minimap_Texsize)));
                pposY = addf(mkf(Minimap_PosY + (Minimap_Size>>1)), mulf(dy, mkf(Minimap_Texsize)));
            };

            Sprite_SetPosPxlF(sprite, pposX, pposY);
            Sprite_SetUV(Minimap_SpriteHndl, uv[0], uv[1], uv[2], uv[3]);
        }
        else {
            dx = addf(pposX, mulf(subf(posX, aposX), mkf(Minimap_Texsize)));
            dy = addf(pposY, mulf(subf(posY, aposY), mkf(Minimap_Texsize)));

            if(lf(dx, Minimap_PosXf)) { dx = Minimap_PosXf; };
            if(lf(dy, Minimap_PosYf)) { dy = Minimap_PosYf; };

            if(gf(dx, Minimap_MaxXf)) { dx = Minimap_MaxXf; };
            if(gf(dy, Minimap_MaxYf)) { dy = Minimap_MaxYf; };

            Sprite_SetPosPxlF(sprite, dx, dy);
        };
    };
};

func void _Minimap_Loop() {
    if(!Minimap_SpriteHndl) { FF_Remove(_Minimap_Loop); return; };

    if(MEM_Keystate(KEY_X) == KEY_PRESSED) {
        Minimap_Mode = !Minimap_Mode;
        _Minimap_InitCurrentMode();
    };

    var zCVob her; her = Hlp_GetNpc(hero);

    Sprite_SetRotationSC(Minimap_SpriteCursorHndl, her.trafoObjToWorld[0], her.trafoObjToWorld[8]);

    _Minimap_SetSpritePosition(Minimap_SpriteCursorHndl, her.trafoObjToWorld[3], her.trafoObjToWorld[11], true);

    if(Topics_CurrentTopic) {
        Topics_UpdateCurrentTarget();

        var gCTopic t; t = get(Topics_CurrentTopic);
        var int numTargets; numTargets = MEM_ArraySize(t.positionsList);

        _Minimap_AdjustMarkers(numTargets);

        var int i; i = 0;
        repeat(i, numTargets);
            her = _^(MEM_ArrayRead(t.positionsList, i));
            _Minimap_SetSpritePosition(MEM_ArrayRead(getPtr(Minimap_Markers), i), her.trafoObjToWorld[3], her.trafoObjToWorld[11], false);
        end;
    }
    else {
        _Minimap_AdjustMarkers(0);
    };
};

func int Minimap_PlayerIsWithin(var int x0, var int y1, var int x1, var int y0) {
    x0 = mkf(x0); y0 = mkf(y0); x1 = mkf(x1); y1 = mkf(y1);
    var int px; var int py;
    var zCVob her; her = Hlp_GetNpc(hero);
    px = her.trafoObjToWorld[3]; py = her.trafoObjToWorld[11];
    return gf(px, x0) && lf(px, x1) && gf(py, y0) && lf(py, y1);
};








