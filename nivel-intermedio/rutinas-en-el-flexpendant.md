# Del programa básico al intermedio: rutinas en el FlexPendant

En el programa básico con garra, el par **Reset / Set / WaitTime** aparece **tres veces**: al
inicio, en el origen y en el destino. Si mañana la garra necesita 0,8 s en vez de 0,5 s, hay que
cambiar tres líneas, y es fácil olvidar una.

La solución de la industria: escribir cada acción **una sola vez**, en una **rutina** con nombre, y
**llamarla** desde el programa. Hoy creamos dos: `rCerrar` y `rAbrir`.

Todo lo de esta hoja fue **comprobado en el robot de la UTEM** (12/11/2026). Los menús van en
**inglés**.

## 0. Punto de partida

El programa **básico** del taller con garra, funcionando: 5 puntos, la garra con `Reset`/`Set`, todo
dentro de `main`. Salidas del robot de la UTEM:

| Salida (Name) | Label | En 1 |
|---|---|---|
| `ES_S02` | S02 | **Cierra** la garra |
| `ES_S01` | S01 | **Abre** la garra |

## 1. Guardar el básico con su nombre

1. **ABB > Program Editor > Tasks and Programs**.
2. **File > Save Program As...**
3. Lugar: tocar **`...`** y elegir **USB** (el pendrive). Repetir después en **HOME** (el disco del
   controlador): siempre dos copias.
4. Nombre: `PickGarraBasico` (sin espacios ni acentos) > **OK**.

Se crea una **carpeta** con un `.pgf` y el `MainModule.mod`. Los puntos van **dentro** del módulo.

## 2. Hacer una copia para el intermedio

No hace falta empezar de cero ni enseñar los puntos otra vez:

1. **Tasks and Programs > File > Save Program As...** otra vez.
2. Nombre: `PickGarraIntermedio` > **OK**.

Desde ahora, el programa abierto **es la copia**. Todo lo que se cambie queda en
`PickGarraIntermedio`; el básico sigue guardado como estaba.

> Para volver al básico: **File > Load Program...** > carpeta `PickGarraBasico` > archivo `.pgf`.
> Para un programa vacío: **File > New Program...** (pregunta si se guarda el actual).

## 3. Crear la rutina `rCerrar`

1. **Program Editor > Routines** (botón de arriba) > **File > New Routine...**
2. **Name:** `rCerrar` · **Type:** **Procedure** > **OK**.
3. Seleccionar `rCerrar` > **Show Routine**. Aparece `PROC rCerrar()` con `<SMT>`.
4. **Add Instruction > Reset** > `ES_S01` (apaga la que abre).
5. **Add Instruction > Set** > `ES_S02` (enciende la que cierra).
6. **Add Instruction > WaitTime** > **`123`** > `0.5` > **OK**.

## 4. Crear la rutina `rAbrir`

Los mismos pasos, con **Name** `rAbrir`:

1. **Reset** > `ES_S02` (apaga la que cierra).
2. **Set** > `ES_S01` (enciende la que abre).
3. **WaitTime** `0.5`.

## 5. Cambiar los bloques en `main` por llamadas

1. **Routines** > `main` > **Show Routine**.
2. **Al inicio:** seleccionar cada una de las 3 líneas (`Reset ES_S02`, `Set ES_S01`, `WaitTime 0.5`)
   > **Edit > Delete**, una por vez.
3. Seleccionar la línea **anterior** al lugar donde estaban y **Add Instruction > ProcCall** >
   elegir **`rAbrir`** en la lista. La línea queda `rAbrir;`.
4. **Después de `MoveL p_origen`:** borrar las 3 líneas del cierre e insertar **ProcCall > `rCerrar`**.
5. **Después de `MoveL p_destino`:** borrar las 3 líneas e insertar **ProcCall > `rAbrir`**.

> **Add Instruction** inserta **debajo** de la línea seleccionada: antes de cada ProcCall, mirar
> bien qué línea está seleccionada.

## 6. Probar

1. Menú rápido: override **25 %**, **Run mode > Single Cycle**.
2. **Debug > PP to Main**, habilitación y **FWD** línea por línea.
3. En la línea `rCerrar;`, el FWD **entra en la rutina**: la flecha del PP salta a `PROC rCerrar()`
   y recorre sus 3 líneas. Al llegar a `ENDPROC`, **vuelve a `main`**, a la línea siguiente. Eso es
   una llamada a rutina.
4. Después, continuo con **Start**, todavía en manual reducido.

## 7. Guardar

**Tasks and Programs > File > Save Program** (mismo nombre, `PickGarraIntermedio`), en **USB** y en
**HOME**.

## El programa en la pantalla

```
PROC main()
    ! INICIO: garra abierta
    rAbrir;
    MoveJ p_home, v500, fine, tool0;
    ! ORIGEN: tomar
    MoveJ p_sobre_origen, v500, z20, tool0;
    MoveL p_origen, v100, fine, tool0;
    rCerrar;
    MoveL p_sobre_origen, v100, z10, tool0;
    ! DESTINO: dejar
    MoveJ p_sobre_destino, v500, z20, tool0;
    MoveL p_destino, v100, fine, tool0;
    rAbrir;
    MoveL p_sobre_destino, v100, z10, tool0;
    MoveJ p_home, v500, fine, tool0;
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
```

## Para pensar

| Pregunta | |
|---|---|
| La garra ahora tarda 0,8 s. ¿Cuántas líneas hay que cambiar? ¿Y en el básico? | |
| `main` pasó de 19 a 13 líneas. ¿Qué se entiende más rápido al leerlo? | |
| ¿Qué otra parte del ciclo se repite y podría ser una rutina? (pista: bajar, agarrar, subir) | |

**Siguiente nivel:** rutinas `rRecoger` y `rDejar` con `Offs` (3 puntos en vez de 5), un `FOR` para
3 ciclos y `GripLoad` para avisar al robot que lleva la pieza.
