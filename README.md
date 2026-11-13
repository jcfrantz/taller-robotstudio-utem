# Taller práctico de robótica industrial: pick & place con garra

[![Licencia: CC BY-NC-SA 4.0](https://img.shields.io/badge/Licencia-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es)

> **¿Vienes a instalar RobotStudio para el taller?** → [Paso a paso para preparar el laptop](instalar-robotstudio.md)

Taller práctico de 4 horas con **metodología activa de aprendizaje basado en proyectos (ABP)**:
equipos de estudiantes programan **desde cero** un robot industrial ABB IRB 1200 con garra
neumática, usando solo el FlexPendant, hasta que el robot lleva una pieza de un punto a otro, tres
veces seguidas, sin dejarla caer.

Creado para el evento **«Mechanica Movet Mundum»**, Escuela de Mecánica de la Universidad
Tecnológica Metropolitana (**UTEM**, Santiago de Chile), noviembre de 2026, en el marco del Convenio
Marco de Cooperación UNIFEBE–UTEM. Autor: **Prof. Dr. Julio Cesar Frantz**, Centro Universitário de
Brusque (**UNIFEBE**, Brasil).

## El proyecto

> **Pregunta motriz:** ¿cómo hacer que un robot industrial tome una pieza y la lleve a otro lugar,
> tres veces seguidas, sin dejarla caer?

| | |
|---|---|
| **Producto del equipo** | Un programa que funciona en el robot real: 5 puntos enseñados y la garra controlada con dos salidas digitales |
| **Criterio de éxito** | Una pieza, de origen a destino, tres veces seguidas, sin caer |
| **Quién aprende qué** | Cada integrante enseña **al menos un punto** al robot real |
| **Duración** | 4 horas, hasta 20 estudiantes en 4 equipos |
| **Requisitos** | Ninguno de robótica. Un laptop con Windows por equipo (para la simulación) |

## Cómo funciona el ABP en el taller

Hay **un solo robot para todo el grupo**. En vez de una fila de espera, el taller se organiza en
**rotación por estaciones**: mientras un equipo está en el robot, los otros tres hacen actividades
que los preparan para su turno. El docente queda fijo en el robot, donde está el riesgo.

| Elemento del ABP | Cómo aparece en el taller |
|---|---|
| **Problema auténtico** | El ciclo de pick & place de una celda industrial real, con un robot y una garra de verdad |
| **Pregunta motriz** | Llevar la pieza tres veces seguidas sin caer: un criterio que el propio robot evalúa |
| **Indagación sostenida** | Cuatro estaciones de 30 min que atacan el mismo problema desde ángulos distintos: robot real, observación, simulación y papel |
| **Voz y decisión del equipo** | El equipo planifica quién enseña cada punto, quién pone cada bloque de la garra y apuesta el tiempo de ciclo |
| **Roles y colaboración** | Cinco roles que rotan después de cada punto: Piloto, Copiloto, Seguridad, Proceso y Cronómetro |
| **Crítica y revisión** | Cada equipo **observa al anterior** justo antes de su turno, con una lista de verificación; los errores de otros se vuelven aprendizaje |
| **Producto público** | Ranking de tiempos, desafío en vivo (*¿y si quitamos el WaitTime?*) y demostración en automático del programa ganador |
| **Reflexión** | Hoja de resultados (predicción contra realidad), cierre de los observadores y evaluación anónima |

### Las cuatro estaciones

| Estación | Qué hace el equipo |
|---|---|
| **R: Robot** | Prueba la garra a mano, crea el programa en el FlexPendant (cada uno enseña un punto) y corre 3 ciclos |
| **O: Observadores** | Alrededor del área del robot, miran al equipo que programa con una lista de verificación |
| **S: Simulación** | El mismo programa en un IRB 1200 virtual en RobotStudio, con salidas virtuales para la garra |
| **P: Papel** | "Robot humano": un estudiante ejecuta el programa con el cuerpo; después, cazar 5 errores en un programa |

| | Ronda 1 | Ronda 2 | Ronda 3 | Ronda 4 |
|---|---|---|---|---|
| Equipo 1 | **R** | O | S | P |
| Equipo 2 | P | **R** | O | S |
| Equipo 3 | S | P | **R** | O |
| Equipo 4 | O | S | P | **R** |

## Material

### Nivel básico: el taller (todo en secuencia dentro de `main`)

| Archivo | Qué es |
|---|---|
| [Presentación](nivel-basico/presentacion/taller-garra-utem.pdf) | Las 48 diapositivas del taller, en español |
| [Cuaderno del taller](nivel-basico/cuaderno/cuaderno-del-taller.pdf) | Uno por equipo: portada, Hojas 1 a 6 (planificación, las 4 estaciones y resultados) |
| [Tarjetas de roles](nivel-basico/cuaderno/tarjetas-de-roles.pdf) | Los 5 roles para recortar, una hoja por equipo |
| [Marcas del piso](nivel-basico/cuaderno/marcas-del-piso.pdf) | HOME, ORIGEN y DESTINO para el robot humano |
| [PickGarraBasico.mod](nivel-basico/rapid/PickGarraBasico.mod) | El programa completo, como queda en el FlexPendant |
| [Guía del docente](nivel-basico/docente/agenda-4h.md) | Agenda de 4 h, los 30 min en el robot, roles, seguridad, lista previa y planes B |
| [Instalar RobotStudio](instalar-robotstudio.md) | Tutorial para dejar el laptop listo en casa |

El solucionario del docente no se publica, para que el cuaderno siga sirviendo a otros grupos.
Docentes que quieran usarlo pueden pedirlo al autor.

### Nivel intermedio: rutinas

| Archivo | Qué es |
|---|---|
| [Rutinas en el FlexPendant](nivel-intermedio/rutinas-en-el-flexpendant.md) | Paso a paso: copiar el programa básico y escribir la garra **una sola vez** en `rCerrar` y `rAbrir`, llamadas con `ProcCall` |
| [PickGarraIntermedio.mod](nivel-intermedio/rapid/PickGarraIntermedio.mod) | El programa intermedio |

**Nivel avanzado** (próximamente): programar en RAPID desde el computador, con `Offs`, bucles `FOR`,
el TCP de la garra y la carga de la pieza (`GripLoad`).

## El robot y la garra

- **Robot:** ABB IRB 1200-7/0.7 (7 kg, 0,7 m de alcance), controlador IRC5, FlexPendant en inglés.
- **Garra:** neumática, con válvula 5/2 **biestable** (dos bobinas, con memoria) en dos salidas
  digitales: `ES_S02` **cierra** y `ES_S01` **abre**. Apagar una salida no mueve la garra: hay que
  encender la otra. Nunca las dos en 1.
- **Pieza:** un bloque de espuma rígida.

**Para usarlo con otro robot ABB:** cambiar los nombres de las salidas en el cuaderno y en los
programas, y volver a enseñar los puntos. El resto del taller no cambia.

## Seguridad

El IRB 1200 es un **robot industrial, no un cobot**: no siente si alguien lo toca. El taller exige
área de trabajo delimitada, manual reducido al 25 %, primera ejecución sin pieza y paso a paso, y
una persona con la mano en la parada de emergencia. Este material **no reemplaza** la evaluación
de riesgos de la celda ni la capacitación de seguridad de cada institución.

## Licencia

© 2026 Julio Cesar Frantz (UNIFEBE). Este material está bajo la licencia
[Creative Commons Atribución-NoComercial-CompartirIgual 4.0 Internacional (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es).
Texto completo en [LICENSE](LICENSE).

- **Pueden:** copiar, distribuir y adaptar el material para clases, talleres y cursos.
- **Con estas condiciones:** citar al autor, **sin fines comerciales** y compartir las adaptaciones
  con **la misma licencia**.

**Cómo citar:** FRANTZ, Julio Cesar. *Taller práctico de robótica industrial: pick & place con
garra*. Brusque: UNIFEBE, 2026. Disponible en: <https://github.com/jcfrantz/taller-robotstudio-utem>.

Los logos de la UTEM y de la UNIFEBE y las marcas ABB, RobotStudio, RobotWare, FlexPendant e IRC5
pertenecen a sus dueños y **no** están incluidos en la licencia. Este no es material oficial de ABB.
