# Guía del docente: taller de pick & place con garra (4 h)

**Robot:** ABB IRB 1200-7/0.7 con controlador IRC5, fijo sobre una base negra
**Garra:** neumática, válvula 5/2 **biestable** (dos bobinas, con memoria) en dos salidas
digitales: `ES_S02` **cierra**, `ES_S01` **abre**
**Pieza:** un bloque de espuma rígida
**Participantes:** hasta 20, siempre en **4 equipos** (de 3 a 5 personas)

## La idea

Hay **un solo robot para todo el grupo**. El taller se organiza alrededor de él: **mientras un
equipo está en el robot, los otros tres hacen algo que los prepara para su turno.** El docente queda
fijo en el robot, donde está el riesgo; las otras estaciones se conducen solas con el cuaderno.

**Criterio de éxito:** una pieza, de origen a destino, tres veces seguidas, sin caer.

El programa es el **nivel básico**: todo en secuencia dentro de `main`, sin rutinas
([PickGarraBasico.mod](../rapid/PickGarraBasico.mod)). Las rutinas son el nivel intermedio.

## Las 4 estaciones (30 min cada una)

| Estación | Qué hace el equipo | Hoja |
|---|---|---|
| **R: Robot** | Prueba la garra a mano, crea el programa desde cero (cada uno enseña un punto), corre 3 ciclos y mide | 2 |
| **O: Observadores** | Alrededor de la base negra, miran al equipo del robot con una lista de verificación | 3 |
| **S: Simulación** | En el laptop del equipo, el IRB 1200 virtual en RobotStudio, con las dos salidas virtuales | 4 |
| **P: Papel** | "Robot humano" (la mano es la garra) y un programa con 5 errores | 5 |

## Agenda

| Hora | Bloque | Min |
|---|---|---|
| 0:00 | **Apertura**: misión, criterio, estaciones, rotación | 8 |
| 0:08 | **Seguridad**: *"El IRB 1200 no se detiene por ti"*; la base negra, el IRC5, la habilitación de 3 posiciones, la emergencia. *"La garra tampoco se detiene por ti"* | 10 |
| 0:18 | **El FlexPendant en vivo**: jogging (Increment None, Axis y Linear), menú rápido, los 4 pasos de cada punto, MoveJ/MoveL, `fine`/`z20` | 15 |
| 0:33 | **La garra**: las dos salidas, la garra a mano en Inputs and Outputs, la válvula con memoria, Set y Reset, *fine antes, WaitTime después* | 12 |
| 0:45 | **El programa**: el ciclo, las 22 líneas, comentarios, probar primero sin pieza | 5 |
| 0:50 | **Planificación del equipo** (Hoja 1), roles y estaciones | 10 |
| 1:00 | **Rondas 1 y 2** | 60 |
| 2:00 | *Pausa* | 15 |
| 2:15 | **Rondas 3 y 4** | 60 |
| 3:15 | **Ranking** y desafío *"¿Y si quitamos el WaitTime?"* (prueba sin pieza) | 13 |
| 3:28 | **Demostración en automático** (solo el docente): el programa ganador al 25 % y al 100 % | 12 |
| 3:40 | **Cierre**: observadores (sin nombres), lo que viene (intermedio y avanzado), evaluación | 20 |

## Rotación

| | Ronda 1 | Ronda 2 | Ronda 3 | Ronda 4 |
|---|---|---|---|---|
| Equipo 1 | **R** | O | S | P |
| Equipo 2 | P | **R** | O | S |
| Equipo 3 | S | P | **R** | O |
| Equipo 4 | O | S | P | **R** |

Cada equipo **observa al anterior justo antes de su turno** en el robot.

## Los 30 minutos en el robot

| Min | Qué pasa |
|---|---|
| 0 a 2 | **Docente:** guarda el programa del equipo anterior en USB y crea **New Program** |
| 2 a 4 | La garra a mano en **Inputs and Outputs** |
| 4 a 7 | Jogging libre: cada estudiante mueve el robot |
| 7 a 22 | **5 puntos, uno por estudiante**, y los 3 bloques de la garra |
| 22 a 27 | Probar: primero **sin pieza** con FWD, después con la pieza |
| 27 a 30 | **3 ciclos** en Single Cycle, cronometrar, guardar |

**Regla:** si al minuto 27 el ciclo no está cerrado, se guarda como está. La línea no espera.
Antes del equipo siguiente: **garra abierta y pieza en ORIGEN**.

## Roles en el robot

Rotan **después de cada punto** (tarjetas de roles).

| Rol | Qué hace |
|---|---|
| **Piloto** | FlexPendant y habilitación; enseña **su** punto |
| **Copiloto** | Lee la Hoja 2; confirma punto, velocidad, zona y **salida** antes de cada OK |
| **Seguridad** | Mano junto a la parada; nadie en la base ni con la mano en la garra; libera cada ejecución |
| **Proceso** | Marca los puntos enseñados; avisa cuál se **reutiliza** |
| **Cronómetro** | Mide el tiempo de ciclo y lo anota en la Hoja 6 |

## Seguridad en la celda

1. **Nadie entra en la base negra** ni apoya nada en ella con los motores encendidos.
2. Siempre en **manual reducido** (máx. 250 mm/s) y override al 25 %. Automático solo en la
   demostración del docente.
3. Primera ejecución **sin pieza y paso a paso (FWD)**.
4. **Garra:** nunca la mano entre los dedos. La pieza se pone con la garra abierta y el robot en
   home. Los 3 ciclos se corren en **Single Cycle**, nunca en Continuous.
5. Emergencia: soltar y **Motors On**. Volver a encender exige dos pasos a propósito.

## Antes del taller (docente)

- [ ] Respaldo del robot en USB (**elegir USB**: por defecto el Backup path es el disco interno)
- [ ] Probar la garra a mano: `ES_S02` cierra, `ES_S01` abre, aire conectado
- [ ] Marcar **ORIGEN** y **DESTINO** en la mesa, con la pieza en ORIGEN
- [ ] 1 o 2 semanas antes: mandar el tutorial de RobotStudio (un laptop Windows por equipo)
- [ ] Imprimir un **cuaderno por equipo**, el solucionario, las **tarjetas de roles** (una hoja por
  equipo) y las **marcas del piso** (HOME, ORIGEN, DESTINO para la estación P)
- [ ] Cronómetro (celular), pizarra para el ranking y el QR de la evaluación

## Riesgos y planes B

| Riesgo | Plan B |
|---|---|
| Un equipo llega sin laptop listo | Se une a otro equipo en la estación S, o hace la parte B de la Hoja 5 |
| La garra no responde | Revisar el aire; seguir sin pieza (la salida se ve en Inputs and Outputs) |
| Atraso acumulado | El desafío pasa a demostración del docente en 5 min |
| Alguien presiona la emergencia | Es parte de la clase: soltar y Motors On, y explicar por qué son dos pasos |
| Un equipo no termina en 30 min | Guarda como está; en el ranking queda "incompleto" |
