MODULE PickGarraBasico
    !***************************************************************
    ! PICK & PLACE CON GARRA, NIVEL BASICO: todo en main, linea por linea
    ! Prof. Julio Cesar Frantz (UNIFEBE, Brasil)
    ! Licencia CC BY-NC-SA 4.0: https://creativecommons.org/licenses/by-nc-sa/4.0/
    ! Evento Mechanica Movet Mundum, Escuela de Mecanica, UTEM, 2026
    !
    ! Cinco puntos (MoveJ/MoveL) + la garra con Set y Reset.
    ! Salidas (probadas el 12/11/2026): ES_S02 CIERRA, ES_S01 ABRE.
    !   Set   = salida en 1      Reset = salida en 0   (lista Common)
    ! Valvula biestable: SIEMPRE apagar una antes de encender la otra.
    !
    ! Puntos con tool0: regrabar cada uno con Modify Position.
    ! El "fine" antes de cada Set es obligatorio: el robot se detiene
    ! por completo y SOLO despues la garra cierra o abre.
    !***************************************************************

    ! Orientacion [0,0,1,0] = herramienta apuntando hacia abajo (PROVISIONALES)
    CONST robtarget p_home:=[[350,0,450],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_sobre_origen:=[[400,-150,250],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_origen:=[[400,-150,150],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_sobre_destino:=[[400,150,250],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_destino:=[[400,150,150],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC main()
        ! --- INICIO: garra abierta, robot en home ---
        Reset ES_S02;
        Set ES_S01;
        WaitTime 0.5;
        MoveJ p_home,v500,fine,tool0;
        ! --- ORIGEN: tomar la pieza ---
        MoveJ p_sobre_origen,v500,z20,tool0;
        MoveL p_origen,v100,fine,tool0;
        Reset ES_S01;
        Set ES_S02;
        WaitTime 0.5;
        MoveL p_sobre_origen,v100,z10,tool0;
        ! --- DESTINO: dejar la pieza ---
        MoveJ p_sobre_destino,v500,z20,tool0;
        MoveL p_destino,v100,fine,tool0;
        Reset ES_S02;
        Set ES_S01;
        WaitTime 0.5;
        MoveL p_sobre_destino,v100,z10,tool0;
        MoveJ p_home,v500,fine,tool0;
    ENDPROC
ENDMODULE
