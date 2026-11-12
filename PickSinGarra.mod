MODULE PickSinGarra
    !***************************************************************
    ! TALLER DE PICK & PLACE SIN GARRA: ABB IRB 1200 + IRC5
    ! Prof. Julio Cesar Frantz (UNIFEBE, Brasil)
    ! Evento Mechanica Movet Mundum, Escuela de Mecanica, UTEM, 2026
    !
    ! Es el programa de la Hoja 2 (robot real) y de la Hoja 4
    ! (RobotStudio). Sin garra: el robot visita la pieza y espera 1 s.
    !
    ! Puntos con tool0 y wobj0 (base del robot). Coordenadas [mm]
    ! iguales a la tabla de la Hoja 4. En el robot real, regrabar
    ! cada punto con Modify Position.
    !***************************************************************

    ! Orientacion [0,0,1,0] = herramienta apuntando hacia abajo
    CONST robtarget p_home:=[[350,0,450],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_sobre_origen:=[[400,-150,250],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_origen:=[[400,-150,150],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_sobre_destino:=[[400,150,250],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_destino:=[[400,150,150],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC main()
        MoveJ p_home,v500,fine,tool0;
        ! --- ORIGEN: tomar ---
        MoveJ p_sobre_origen,v500,z20,tool0;
        MoveL p_origen,v100,fine,tool0;
        WaitTime 1;
        MoveL p_sobre_origen,v100,z10,tool0;
        ! --- DESTINO: dejar ---
        MoveJ p_sobre_destino,v500,z20,tool0;
        MoveL p_destino,v100,fine,tool0;
        WaitTime 1;
        MoveL p_sobre_destino,v100,z10,tool0;
        MoveJ p_home,v500,fine,tool0;
    ENDPROC
ENDMODULE
