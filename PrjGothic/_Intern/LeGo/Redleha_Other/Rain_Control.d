func void StartRain_Time (var int start_hr, var int start_min, var int end_hr, var int end_min) {
    /* Globale Instanzen initialisieren: */
    MEM_InitGlobalInst(); /* Hierrunter fallt auch der Skycontroller */
    
    /* Gothic Tage sind um 12 Stunden verschoben, 0 = 12 Uhr, 1 = 12 Uhr des nachtes Tags */
    start_hr = (start_hr + 12) % 24;
    end_hr   = (end_hr   + 12) % 24;
    
    if (start_hr > end_hr) {
        MEM_Warn ("StartRain_Time: Regen um 12 Uhr mittags ist nicht moglich!");
        return;
    };
    
    /* 24 Stunden auf Bereich 0 bis 1 runterskalieren (float) */
    var int start_float; var int end_float;
    start_float = divf(mkf(start_hr*60 + start_min), mkf(24*60));
    end_float   = divf(mkf(end_hr  *60 + end_min)  , mkf(24*60));
    /* Ich rechne hier zunachst die Uhrzeit in vergangene Minuten
    und dann als Anteil eines ganzen Tages aus und addiere anschlie?end
    noch den Anteil eines halben Tages (1/2), da die Floats fur den Regen
    zwischen 12:00 Uhr = 0 und 12:00 Uhr am nachsten Tag = 1 liegen */
    
    /* Start zur Startzeit*/
    MEM_SkyController.rainFX_timeStartRain = start_float;
    /* Ende zur Endzeit */
    MEM_SkyController.rainFX_timeStopRain = end_float;
    
    MEM_SkyController.rainFX_renderLightning = TRUE;
    
    /* Ergebnis: Regen zur gewunschten Zeit! (es sei denn man ist in einer Zone 
    in der es schneit, dann gibt es Schnee) */
};
