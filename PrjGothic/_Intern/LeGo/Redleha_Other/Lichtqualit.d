/*
//------------------------------------------------
//  Exodus: Lichtqualitat
//------------------------------------------------

INSTANCE MENUITEM_EXT_LIGHT(C_MENU_ITEM_DEF)
{
    backpic     =   MENU_ITEM_BACK_PIC;
    text[0]     =   "Lichtqualitat";
    text[1]     =   "Licht in Portalraumen / Laternen. Vorsicht: sehr CPU lastig!"; // Kommentar
    // Position und Dimension   
    posx        =   1000;   posy        =   MENUEXT_START_Y + MENU_DY*7;
    dimx        =   3000;   dimy        =   750;
    // Aktionen
    onSelAction[0]  = SEL_ACTION_UNDEF;
    // Weitere Eigenschaften
    flags       = flags | IT_EFFECTS_NEXT;      
};

instance MENUITEM_EXT_LIGHT_CHOICE(C_MENU_ITEM_DEF)
{
    backPic     =   MENU_CHOICE_BACK_PIC;
    type        =   MENU_ITEM_CHOICEBOX;        
    text[0]     =   "aus|niedrig|hoch";
    fontName    =   MENU_FONT_SMALL;
    // Position und Dimension   
    posx        = 5000;     posy        =   MENUEXT_START_Y + MENU_DY*7 + MENU_CHOICE_YPLUS;
    dimx = MENU_SLIDER_DX;  dimy        =   MENU_CHOICE_DY;
    // Aktionen
    onChgSetOption                      = "exLightingQuality";
    onChgSetOptionSection               = "EXODUS";
    // Weitere Eigenschaften    
    flags       = flags & ~IT_SELECTABLE;   
    flags       = flags  | IT_TXT_CENTER;
};
*/
var int temp_224;