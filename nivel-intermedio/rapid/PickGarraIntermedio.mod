MODULE MainModule
    !***************************************************************
    ! PICK & PLACE CON GARRA, NIVEL INTERMEDIO: rutinas rCerrar y rAbrir
    ! Prof. Julio Cesar Frantz (UNIFEBE, Brasil)
    ! Licencia CC BY-NC-SA 4.0: https://creativecommons.org/licenses/by-nc-sa/4.0/
    ! Escuela de Mecanica, UTEM, 2026
    !
    ! Copia del programa basico (PickGarraBasico) con el par Reset/Set
    ! escrito UNA sola vez, en dos rutinas. Probado en el robot de la
    ! UTEM el 12/11/2026.
    ! Salidas: ES_S02 CIERRA, ES_S01 ABRE (valvula biestable).
    !
    ! Puntos con tool0 (PROVISIONALES aqui: los reales quedan en el
    ! programa guardado en el robot, carpeta PickGarraIntermedio).
    !***************************************************************

    ! Orientacion [0,0,1,0] = herramienta apuntando hacia abajo
    CONST robtarget p_home:=[[350,0,450],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_sobre_origen:=[[400,-150,250],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_origen:=[[400,-150,150],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_sobre_destino:=[[400,150,250],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_destino:=[[400,150,150],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PROC main()
        ! INICIO: garra abierta
        rAbrir;
        MoveJ p_home,v500,fine,tool0;
        ! ORIGEN: tomar
        MoveJ p_sobre_origen,v500,z20,tool0;
        MoveL p_origen,v100,fine,tool0;
        rCerrar;
        MoveL p_sobre_origen,v100,z10,tool0;
        ! DESTINO: dejar
        MoveJ p_sobre_destino,v500,z20,tool0;
        MoveL p_destino,v100,fine,tool0;
        rAbrir;
        MoveL p_sobre_destino,v100,z10,tool0;
        MoveJ p_home,v500,fine,tool0;
    ENDPROC

    PROC rCerrar()
        Reset ES_S01;
        Set ES_S02;
        WaitTime 0.5;
    ENDPROC

    PROC rAbrir()
        Reset ES_S02;
        Set ES_S01;
        WaitTime 0.5;
    ENDPROC
ENDMODULE
