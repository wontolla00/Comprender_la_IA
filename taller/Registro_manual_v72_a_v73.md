# Registro de cambios · v72 → v73

*Agosto 2026.*

Cuatro adiciones desde el laboratorio RAG instrumentado en
`C:\Perso\Projects\HyperRAG`, que ya había abierto el hilo de v66 (§6.5a,
§13.15, §10.9.6). D1 (bitácora de HyperRAG, `docs/ESTADO_evaluacion_2026-08-11b.md`)
documenta lo que llegó a v66: la medida de techo del oráculo (R2c/F2b), los
tres defectos de procedencia del arnés (§5 del dossier, C1a) y el matiz de
§10.9.6. Esta versión trae lo que se midió **después** de esa entrega —
sesión del 15-16 de agosto (P10, P11, R3/R4) — y que llevaba desde entonces
sin cruzar al manual. No hay cambios de contenido fuera de estas cuatro
inserciones: sin renumeración de capítulos, sin edición editorial ajena a
lo que sigue.

Snapshot de v72 archivado **antes** de editar:
`archivo/Comprender_la_IA_2026_v72.html`, 2.423.976 bytes, copia exacta del
v72 en circulación.

---

## Las cuatro adiciones

### 1. §6.3 — aviso de reranker monolingüe sobre corpus multilingüe

Insertado como `<div class="warning">` entre el callout de "Rerankers
open-weight" y el callout de ColBERT (que ya estaban en v72), antes del
h2 `6.3b`.

**Por qué se eligió aquí:** la tabla de §6.3 presenta las ganancias de
reranking como cifras agregadas de "ganancia típica" (+8-18%, +10-20%…),
sin matiz de idioma. Es exactamente el punto ciego que el hallazgo mide:
un cross-encoder monolingüe inglés sobre un corpus un tercio en español
sostenía ~89-90% de media —parecería justificar la fila de la tabla—
mientras hundía la peor población (español) a 75,7-78,4%, 16 puntos por
debajo de no tener reranker en absoluto. El agregado lo escondía por
completo. Con un reranker propiamente multilingüe (`bge-reranker-v2-m3`)
el daño desaparece, pero entonces empata *hasta el decimal* con no tener
reranker, a 20-25× de latencia.

**Fuente:** `ESTADO_evaluacion_2026-08-11b.md`, entradas A3/A5/A7/A8 y
P3/P4/P6/P7 (11 de agosto). Cifra citada tal cual, sin redondeo adicional.

**Cross-referencia añadida:** cita §13.6 (no compensación) — el mismo
fallo de leer solo el agregado que ese principio existe para prevenir,
aplicado aquí a la elección de un componente, no solo a la lectura de un
resultado.

### 2. §6.5a — matiz sobre el modo del compresor

Editado dentro del callout ya existente ("🧵 Un instrumento que la
investigación de factualidad paramétrica encontró por su cuenta"), que ya
narraba desde v66 el hallazgo del compresor (37 puntos de coste). Se
añadió una frase de cierre que separa arquitectura de competencia del
modelo: el coste no era de "comprimir el contexto" en general, sino del
modo concreto (extracción con el mismo LLM que genera la respuesta) — un
modo alternativo sin LLM (cross-encoder) no costó nada medible en la misma
condición, pese a comprimir más caracteres.

**Por qué se eligió aquí y no como sección nueva:** es un matiz de un
hallazgo que el propio texto de v66 ya cuenta con detalle; una sección
aparte habría duplicado el marco en vez de corregirlo. La frase nueva
cambia la receta operativa —"apaga el compresor" pasa a "verifica qué modo
usa tu compresor antes de apagarlo"— sin tocar ni una palabra de lo que ya
estaba verificado en v66.

**Fuente:** `ESTADO_evaluacion_2026-08-11b.md`, entrada R4 (16 de agosto).

### 3. §7.2 — diagnóstico del solape léxico + aviso sobre transformación de consulta

Insertado como nuevo `<h4>` ("El solape léxico como termómetro…") al
principio de "Optimización del retrieval", antes de la tabla de query
expansion — es decir, como diagnóstico previo a las tres familias de
técnicas que ya documentaba la sección, no como una cuarta técnica más.
Incluye:

- Un `<div class="callout">`: el hallazgo del acantilado de 0,45 de solape
  léxico — el 100% de los fallos de recuperación medidos vivía por debajo
  de ese umbral; por encima, BM25 sola acertaba el 100% en tres idiomas.
- Un `<div class="warning">`: las técnicas de reformulación de consulta
  (multi-query, step-back, HyDE) ya documentadas en la tabla de esa misma
  sección **costaron recall en la medida de este laboratorio** (−10,0
  puntos de media a k=5, −4,7 a k=20), en vez de ser pura ganancia con
  coste solo en latencia como sugiere la tabla existente.

**Por qué se eligió aquí:** la sección ya lista las tres familias de
técnicas de retrieval sin ningún criterio de "cuándo aplicar cada una" ni
ninguna advertencia de coste en recall — solo coste en latencia. El
hallazgo de P10 es precisamente ese criterio ausente, y el de P12
(transformador de consulta) es precisamente el matiz de coste ausente de
la tabla de query expansion inmediatamente siguiente.

**Fuente:** `ESTADO_evaluacion_2026-08-11b.md`, entradas P10 (a-d) y P12
(a-d) (16 de agosto).

**Cross-referencias añadidas:** §6.2 (define BM25 léxica vs. vectorial
semántica, base del concepto de solape), §13.6 (no compensación, aplicada
aquí a un diagnóstico agregado que esconde dónde vive el fallo real), §6.3
(remite al aviso nuevo de reranker multilingüe, punto 1 de este registro).

### 4. §13.15.3 — cuarto caso del hilo "el arnés que miente"

Insertado como nuevo `<h3>` tras 13.15.2 (el contrato fail-to-pass) y
antes de "✅ Resultado de este capítulo", como cuarta instancia del mismo
patrón que estructura toda la sección desde v66: *el número sobrevive, la
condición que lo produjo no*.

**El caso:** un filtro de generación de preguntas que descarta preguntas
"referenciales" (sin respuesta única fuera de su contexto inmediato)
cubría 8 sustantivos en la rama francesa frente a 12 o más en inglés y
español — ninguna de las tres ramas cubría la palabra que más importaba en
el corpus de prueba. El francés puntuaba sistemáticamente peor en
recuperación, y la explicación parecía ser el idioma. Auditado: más de la
mitad del déficit era composición de la muestra causada por el propio
filtro, no un defecto del motor de recuperación. Se añade un segundo
factor real y menor (tokenización sin stemming) con la firma opuesta a la
esperada — neutro en el agregado, visible solo en la peor población — como
segundo ejemplo de la misma regla de no compensación dentro del mismo
caso.

**Por qué se eligió aquí:** es el mismo defecto de procedencia que los
tres casos ya documentados (caché, componente sin declarar, `assert`
decorativo) pero en la capa de *generación* del conjunto de evaluación en
vez de en su *ejecución* — un lugar donde el patrón no estaba nombrado
todavía en el manual, y donde es más fácil de cometer porque "el idioma
rinde peor" es una explicación que no pide más verificación por sí sola.

**Fuente:** `ESTADO_evaluacion_2026-08-11b.md`, entradas P11 (a-g) (16 de
agosto).

**Cross-referencia añadida:** §13.6 (no compensación) — dos veces dentro
del mismo caso, una para la composición de la muestra y otra para el
efecto del stemming.

---

## Lo que se dejó fuera, deliberadamente

- **F3** (frontera sobre C3/Q3, inspección manual de 10 fallos): confirma
  con otro corpus la misma conclusión que F2 ya aportó a §6.5a en v66 — no
  añade un hallazgo transferible nuevo, solo una réplica. No entra para no
  diluir la sección con una cifra que repite el argumento ya hecho.
- **PE1/PE2** (arnés paralelo, contenido controlado fr/en/es): el
  resultado central —cero discordancias entre idiomas con contenido
  controlado— no titula (n=17, por debajo del mínimo de la propia regla
  del laboratorio) y la propia bitácora lo marca como no citable todavía.
  No se lleva al manual un número que su propio origen no da por
  asentado.
- **La hipótesis de ficción narrativa (F3b):** explícitamente sin medir en
  el propio laboratorio. Nada que trasladar.

## Verificación

- Balance de etiquetas verificado sobre el documento completo tras las
  cuatro inserciones (no por conteo agregado únicamente — cada inserción
  se releyó en contexto antes de darla por buena):

  | | v72 | v73 | Δ |
  |---|---|---|---|
  | `h2` | 254 | 254 | 0 |
  | `h3` | 395 | 396 | +1 (13.15.3) |
  | `table` | 223 | 223 | 0 |
  | `div` | 4831 | 4835 | +4 (1 warning en §6.3, 1 callout + 1 warning en §7.2, 1 warning en §13.15.3) |
  | `p` | 1431 | 1435 | +4 |
  | bytes | 2.423.976 | 2.431.429 | +7.453 |

  Coincide exactamente con lo esperado de las cuatro inserciones: cada una
  añade un `div` contenedor (dos en el caso de §7.2, que lleva callout y
  warning) y un `p` de cuerpo. Verificado contra
  `archivo/Comprender_la_IA_2026_v72.html` (el snapshot pre-edición), no
  solo por conteo agregado del propio v73 — comparar contra el snapshot
  evita que un desbalance preexistente en v72 se compense con uno nuevo y
  quede invisible en el total, que es justo el defecto que el registro de
  v71→v72 describe haber encontrado en `#entw72`.
- Balance también verificado para `section`, `svg`, `style`, `p`, `ul`,
  `ol` — cero desbalances en los ocho tipos de etiqueta, documento
  completo.
- Cada una de las cuatro inserciones se verificó de forma aislada contra
  el texto real que la rodea antes de aplicarse — ninguna cifra citada es
  nueva: las cuatro proceden de entradas ya cerradas y comprobadas en la
  bitácora de HyperRAG, citadas aquí sin redondeo ni reinterpretación.
- Carpeta principal del proyecto: se elimina `Comprender_la_IA_2026_v72.html`
  del directorio raíz (queda solo en `archivo/`), permanece
  `Comprender_la_IA_2026_v73.html` como único archivo vivo — misma
  convención que v72.

## Alcance

Cuatro inserciones puntuales dentro de secciones ya existentes; ninguna
reestructuración, ninguna renumeración, ningún contenido retirado. No se
tocó el trabajo de widgets de v72 ni la limpieza editorial de v71.

---

## Corrección posterior — 24/8, misma tarde

El usuario reportó la estructura rota entre §4.6 y el principio del
Módulo 3, con el contenido ocupando la anchura total de la pantalla en
vez de la columna de lectura habitual. **No era una consecuencia de las
cuatro inserciones de arriba** — verificado contra
`archivo/Comprender_la_IA_2026_v72.html`: el defecto ya estaba presente
en el v72 archivado, idéntico. Viene de más atrás, probablemente del
propio trabajo de conversión a widget de §4.6 en v71→v72 (`#vr46w72`,
ítem 15 de `Registro_manual_v71_a_v72.md`).

**Causa raíz, localizada con el DOM real del navegador (no solo conteo de
etiquetas — el mismo defecto que enmascaró un problema análogo en
v71→v72):** un `</div>` sobrante justo después del `<script>` del widget
`#vr46w72`, sin nada que cerrar a ese nivel (el propio widget ya se había
cerrado limpio tres etiquetas antes). Ese `</div>` de más cerraba el
`<div class="container">` que envuelve toda la columna de lectura —
abierto al principio del Módulo 1 — **a mitad del capítulo 4**, mucho
antes de lo que su propio `max-width:900px` da a entender que debería.
Todo lo que seguía en el documento —el resto del capítulo 4, los seis
capítulos enteros del Módulo 2, y el principio del Módulo 3 hasta que un
`<div class="container">` nuevo abre en la cabecera del Módulo 3— quedaba
fuera de ese contenedor: sin la columna de 900px, sin el fondo de
tarjeta, sin el padding. De ahí la anchura de pantalla completa.

**Arreglo, dos líneas:**

1. Eliminado el `</div>` sobrante tras el `<script>` de `#vr46w72`
   (dentro de §4.6).
2. Con el contenedor ya sin cerrar antes de tiempo, quedaba abierto hasta
   la apertura del contenedor del Módulo 3 sin que nada lo cerrara antes
   — anidaba un `.container` dentro de otro en vez de ser hermanos.
   Añadido el `</div>` que le falta justo antes de
   `<div class="container">` del Módulo 3, mismo patrón que ya usan las
   otras dos transiciones de módulo del documento
   (`</div><div class="container">`).

**Verificación:** con el DOM ya renderizado (no con regex sobre el
fuente, que en un documento de este tamaño con `<script>`/`<style>`
inline no es fiable — la razón por la que el defecto sobrevivió una
verificación anterior), recorridos 983 elementos (`h1`–`h4`, `table`,
`.callout`, `.warning`) entre §4.6 y el principio del Módulo 4: 0 con
profundidad de `.container` distinta de 1. Comprobado también a 1920px
de viewport (la anchura de pantalla completa que el usuario pidió usar
para revisar, no los 800px por defecto del panel de vista previa) — la
diferencia sólo era visible ahí, a un ancho estrecho el problema pasaba
desapercibido.

**Fuera de alcance, encontrado de paso, sin tocar:** 12 cabeceras del
Apéndice C y D (`Referencias técnicas esenciales`, C.1–C.5, D.1–D.3, y el
Índice Temático Interactivo) tienen el mismo síntoma —fuera de
`.container`— pero es una región del documento completamente distinta,
no conectada con esta corrección ni con las cuatro inserciones de este
registro. Anotado para una sesión aparte.

---

## Segunda corrección — 24/8, misma tarde: tres críticas externas verificadas y aplicadas

El usuario aportó cuatro observaciones de una crítica externa del
manual. Cada una se comprobó contra el archivo real antes de aceptarla o
descartarla — mismo criterio que v71. Veredicto por observación:

1. **§5.7c, "bf16 [...] el punto de partida real de casi toda la
   inferencia moderna"** — la crítica señala que fp16 (mismo tamaño,
   distinto rango dinámico) también es real en producción, e int8 lo es
   en edge. Válida y bien calibrada por quien la escribió (la propia
   crítica la llama "roza el error", no "es un error"). **Aplicada,
   24/8 más tarde:** la frase acota bf16 a "GPU de centro de datos",
   nombra fp16 (2 bytes, distinto rango dinámico, real en hardware sin
   soporte nativo de bf16) e int8 como punto de partida de edge — sin
   tocar la cifra del 75%, que la propia crítica no cuestionaba y es
   válida para cualquier formato de 2 bytes.
2. **§20.1 / Grey Alignment, "cinco subsecciones", peso retórico
   desproporcionado** — verificado y **refutado en el hecho concreto**:
   §20.1 tiene 3-4 cajas "Concepto del autor", no cinco, y Grey Alignment
   no vive ahí — está en §20.6, con su propia caja `nota-frontera`
   explícita ("propuesta en evolución, no práctica asentada"). La
   preocupación de fondo es legítima en abstracto; la evidencia citada
   no la sostiene. **No aplicada** — no hay nada que corregir sobre un
   hecho que no es tal.
3. **§4.6.4, tabla de mitigación con rangos sin fuente** — el hecho es
   cierto, pero el manual ya lo autodenunciaba en un recuadro justo
   debajo de la tabla ("Inconsistencia interna detectada..."). El fallo
   real, que la crítica sí capta aunque no lo diga así: el aviso vive en
   un párrafo aparte que nadie ve si solo mira la tabla. **Aplicada:**
   retirados los porcentajes de las celdas en las dos copias de la tabla
   (el widget interactivo de §4.2 y la tabla estática de §4.6.4);
   quedan solo las etiquetas relativas (Alta/Media/Muy alta). Los
   rangos numéricos originales siguen visibles al pulsar cada fila del
   widget, siempre junto al aviso "orientativo, sin fuente validada" que
   ya llevaban ahí — ese emparejamiento número+aviso no se tocó, es
   correcto. Añadida una nota bajo la tabla estática de §4.6.4
   remitiendo al widget de §4.2 para quien llegue solo por lectura
   lineal.
4. **"Deriva de identidad" no catalogada como concepto del autor, pese a
   usarse 37 veces sin cita externa** — verificado en el Índice de
   conceptos del autor: "entropía acumulada" está, "deriva de identidad"
   no estaba. Es una propuesta de autor de facto (término propio, sin
   adopción externa, con caja "📐 Nota técnica" en vez de "★ Propuesta
   del autor") que se había caído del sistema de catalogación que el
   manual promete mantener completo. **Aplicada:**
   - Caja de §4.3 (`id="ca-deriva-identidad"`, nuevo) ahora lleva el
     badge `★ Propuesta del autor` y el bloque `aviso-propuesta`
     estándar (mismo patrón que §5.5e).
   - Añadida como fila 30 del Índice de conceptos del autor (antes 29;
     actualizadas las tres menciones de la cifra en esa sección).
   - Añadida al final de la Tabla de equivalencias, con
     *identity drift / persona drift / context-induced role drift* como
     términos relacionados de la literatura de agentes — sin equivalente
     estándar único, señalado como tal.
   - El hedge de la afirmación causal ("demostración directa más
     accesible del mecanismo de sycophancy") se movió a la misma frase
     que la afirmación, no a la siguiente: ahora lee "sobre un único
     caso documentado —no un estudio, no una réplica—" antes de la
     afirmación, no después.

**Verificación:** recargado el documento completo tras los cuatro
cambios; recorridos todos los `h1`/`h2` del documento por profundidad de
`.container` — mismos 12 casos preexistentes de Apéndice C/D, cero
nuevos. Confirmado con el DOM real: la fila 30 del índice enlaza
correctamente a `#ca-deriva-identidad`, la tabla de equivalencias pasa de
7 a 8 filas, la celda de la tabla estática de §4.6.4 ya no lleva
porcentaje, y el panel de detalle del widget interactivo (que no se tocó)
sigue mostrando el rango numérico junto a su aviso, sin cambios.
