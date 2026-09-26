# Registro de cambios · v68 → v69

*Agosto 2026.*

Cuatro cambios, todos derivados de una sola fuente externa aportada por el
usuario: un post técnico sin firma ("Claude's Watermark Isn't Live. Your
Provenance Debt Is.", 19 ago. 2026, tags ai-engineering/ai-security/mlops)
sobre el marcado de agua de Claude, la deuda de procedencia que genera, y
el Art. 50 del AI Act. No está registrado como entrada separada en
`Triaje_fuentes_externas_2026.md` con su propio veredicto de las cinco
fuentes anteriores porque el triaje completo de esa lista ya se cerró en
v68 — esta es una fuente nueva, evaluada aparte, con la misma disciplina de
verificación.

## Verificación previa a incorporar

Antes de tocar el manual se comprobaron contra fuente primaria las tres
afirmaciones de mayor carga argumental del post:

- **Alcance y estado del marcado de Claude** — verificado verbatim contra
  `anthropic.com/news/claude-text-watermark` (14 ago. 2026): corte en
  modelos lanzados a partir del 2 ago. 2026, API de detección inexistente
  ("in the process of working out the details of its implementation"),
  C2PA solo en `.png/.jpg/.svg`, sin opt-out regional ("we don't yet have a
  durable way to scope it by region").
- **Sanción del Art. 50 AI Act** — verificado contra múltiples fuentes
  legales independientes: el tier correcto es 15M€/3% (Art. 99(4)), no
  20M€/4% (que es el tope de GDPR, Art. 83 RGPD).
- **Radioactividad del watermark** — verificado verbatim contra el
  abstract de arXiv:2402.14904 (Sander et al., NeurIPS 2024): "if the
  suspect model is open-weight, training on watermarked instructions can
  be detected with high confidence (p-value below 10^-5) even when as
  little as 5% of training text is watermarked."

Las tres comprobaron exactas. Verificando la cifra de sanción se encontró,
además, un error real ya presente en el manual (ver más abajo) — hallazgo
lateral de la propia verificación, no del post.

---

## §1.8 — El watermark que sobrevive al fine-tuning: radioactividad (nuevo, Cap. 1)

**Qué faltaba.** El pipeline de generación de datasets RAFT (§1.8) ya
muestra un LLM generando preguntas y otro generando A* con cadena de
pensamiento — exactamente el escenario donde un modelo con marcado
estadístico activo (Claude, y progresivamente el resto de proveedores de
frontera bajo el Art. 50.2) deja una señal en el texto de entrenamiento
sintético. El manual no trataba qué pasa con esa señal después del
fine-tuning.

**Qué añade.** El hallazgo de Sander et al. (NeurIPS 2024): la señal puede
sobrevivir al fine-tuning y hacer detectable, con significancia estadística
(p<10⁻⁵), que un modelo se entrenó con salida marcada, incluso con solo un
5% del corpus contaminado — para el caso open-weight. Dos matices propios
del manual, no del post original: (1) el resultado es específico de
publicar pesos, no de servir por API, y no está confirmado que el mecanismo
transfiera de las familias *green-list* medidas por el paper al *tournament
sampling* de Claude — tratado explícitamente como plausible, no
confirmado; (2) conexión con §10.10.3 (tinta vs. cemento): la radioactividad
convierte una cláusula contractual antes inaplicable ("no entrenes modelos
competidores con nuestra salida") en una medición, y con §4.7 (procedencia
desde la ingesta): recomienda registrar modelo y fecha de generación en
cada ejemplo sintético del dataset RAFT, la misma disciplina que el
capítulo ya exige para el resto del corpus.

## §4.7 — Un caso con fecha: cómo escala Anthropic el marcado en Claude (nuevo, Cap. 4)

**Qué faltaba.** §4.7 ya describe en abstracto las tres familias de
mecanismos de procedencia (C2PA, marcas de agua estadísticas, firma en
origen) y su fragilidad. No tenía, como sí ganó §20.3 en v67 con el caso
Rundell, un ejemplo real y fechado que ancle la abstracción.

**Qué añade.** Los hechos verificados de Anthropic sobre Claude: el corte
del 2 de agosto de 2026 coincide con la fecha de aplicación del Art. 50.2;
ningún modelo Claude seleccionable a fecha de esta edición (Opus 5, Sonnet
5, Fable 5) se lanzó después del corte; los modelos anteriores recibirán
marcado sin fecha anunciada; la API de detección no existe; el despliegue
es global sin excepción por región. Marcado con sello de fecha
`2026-08 · caduca rápido` y con la advertencia explícita de que los nombres
de modelo y fechas concretas son perecederos aunque la mecánica no lo sea
— mismo patrón de caducidad que ya usa el resto del capítulo.

## Cap. 21 — corrección: tier de sanción del Art. 50 (fix, no adición)

**Qué estaba mal.** La tabla CNIL (§21.6) asignaba a la fila "Banner
visible interactúas con IA — Art. 50 AI Act" la sanción 20M€/4%, que es el
tope de GDPR (Art. 83 RGPD), no el tier del AI Act que corresponde a esa
obligación.

**Corrección.** 15M€/3% (Art. 99(4)) — el tier intermedio del AI Act,
verificado contra múltiples fuentes legales independientes. El resto de la
tabla no se tocó: otras filas citan correctamente 20M€/4% donde la base
legal es RGPD (registro CNIL, notificación de incidentes, retención de
logs), así que el error era específico de esa fila, no un patrón general
en la tabla.

## Cap. 4 — clarificación: dos tiers distintos en la misma fecha del calendario Omnibus (fix, no adición)

**Qué estaba ambiguo.** La fila "2 dic 2026" del calendario Digital
Omnibus (§4.5x) agrupaba dos obligaciones de origen distinto —las nuevas
prohibiciones del Art. 5 (tier 35M€/7%) y el fin de la prórroga de 4 meses
para el marcado legible por máquina del Art. 50.2 (tier 15M€/3%,
confirmado contra tres fuentes legales independientes)— bajo una única
"sanción máxima" que un lector podía leer como aplicable a ambas.

**Corrección.** Se separan explícitamente los dos tiers en la misma fila,
sin añadir una fila nueva (la fecha ya estaba, la prórroga específica de
marcado ya estaba nombrada — "fin de la transición de marcado" —, solo
faltaba el tier correcto y distinto), con puntero a §4.7 para el caso
concreto de Claude.

---

## Verificación

- Antes de tocar el fichero: **incidencia de proceso corregida en esta
  misma edición.** Los cuatro cambios se aplicaron primero directamente
  sobre el fichero v68 en vivo, sin archivar antes una copia intacta —
  rompiendo la disciplina que exige el propio taller ("snapshot verificado
  antes de empezar"). Se reparó reconstruyendo el v68 original: se
  revirtieron los cuatro cambios sobre una copia, verificada después
  byte-a-byte contra el v68 pre-edición por tres vías independientes —
  tamaño exacto (2.349.595 caracteres, coincide con el registro de v68),
  balance de etiquetas idéntico al ya verificado en
  `Registro_manual_v67_a_v68.md` (`div` 4695/4695, `table` 227/227, `h2`
  248/248, `h3` 377/377, `script` 40/40, `style` 9/9), y ausencia total de
  los marcadores nuevos (`s18raft-radio`, `s47-claude`, "radioactiv",
  "Provenance Debt"). El snapshot reconstruido queda en
  `archivo/Comprender_la_IA_2026_v68.html`.
- v69: `div` 4696/4696, `table` 227/227, `h2` 248/248, `h3` 379/379 (+2,
  las dos secciones nuevas), `tr` 1300/1300, `ul` 159/159, `style` 9/9,
  `script` 40/40, `p` 1353/1353, `main`/`section`/`aside`/`nav`/`details`
  sin cambios. Ningún `id` nuevo (`s18raft-radio`, `s47-claude`) colisiona
  — comprobado antes de insertar.
- Título, barra superior y badges `🆕 v69` actualizados. Ninguna entrada
  nueva de TOC — mismo criterio que §10.10.3/§13.15.1 en v68 (subsecciones
  de capítulos existentes, no capítulos nuevos, no llevan línea propia en
  el índice).
- Tamaño: 2.349.595 → 2.355.191 caracteres (+5.596).
- Carpeta principal: solo `Comprender_la_IA_2026_v69.html` (convención del
  proyecto — una sola versión viva en la raíz, historial en `archivo/`).

## Alcance

Las cifras de Anthropic (nombres de modelo, fechas de lanzamiento, estado
de la API de detección) tienen alta caducidad y están marcadas como tal en
el propio texto insertado. El mecanismo de radioactividad está demostrado
para watermarks tipo *green-list* y modelos open-weight; su aplicación
específica a Claude (tournament sampling, servido por API) es una
extrapolación razonada, señalada explícitamente como no confirmada en el
propio texto — no se presenta como hecho establecido para Anthropic.
