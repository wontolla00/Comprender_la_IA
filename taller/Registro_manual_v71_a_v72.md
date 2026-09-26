# Registro de cambios · v71 → v72

*Agosto 2026.*

Sustitución sistemática de diagramas SVG estáticos y tablas comparativas
por widgets HTML/JS interactivos, más una limpieza de las etiquetas de
"novedad de versión" que se habían acumulado desde v63. Cada widget se
evaluó primero por rigor factual contra el texto real del manual (no solo
por valor visual/pedagógico) antes de implementarlo — disciplina seguida
durante todo el proceso de selección, en sesiones previas a este registro.

Snapshot de v71 archivado **antes** de editar (tercera vez seguida con el
proceso correcto): `archivo/Comprender_la_IA_2026_v71.html`, 2.364.788
bytes, verificado idéntico al v71 en circulación.

---

## Limpieza de etiquetas de versión

Eliminadas 34 etiquetas `🆕 vNN` (introducidas entre v63 y v70 para marcar
contenido nuevo en su momento) y 1 etiqueta `🔧 v71 · reubicada` (marcador
temporal de la reubicación de §4.7b en v71). Estas etiquetas cumplieron su
función de trazabilidad durante su ventana de vigencia y ya no aportan
información al lector — todo el contenido que marcaban lleva ahora varias
versiones integrado de forma estable.

**No se tocaron** las 20 etiquetas `version-badge caducidad-alta` — estas
marcan contenido con fecha de caducidad epistémica (nombres de modelo,
cifras de mercado, estado normativo) que puede quedar desactualizado en
semanas, no versiones del propio manual. Son un tipo de aviso distinto y
siguen cumpliendo su función.

Durante esta limpieza se detectó que un guardado intermedio en modo texto
de Python había alterado accidentalmente los finales de línea; se verificó
y restauró la convención CRLF nativa del archivo (confirmada contra el
propio v71 archivado, que ya usa CRLF en la totalidad de sus líneas — no
es una inconsistencia introducida en v72).

## Sustitución de diagramas SVG y tablas por widgets interactivos

Quince reemplazos, evaluados y aprobados en sesiones previas de revisión
factual. Cada widget quedó envuelto en un contenedor `id` único, con todo
su CSS reescrito bajo ese `id` (evita fugas de estilo al resto del
documento) y su JS en IIFE con referencias `querySelector` relativas al
contenedor.

**Reemplazos "de tabla" (7):**

1. §1.2 — comparativa ETL↔RAG → `#e2r` (comparación interactiva + mini-lab de búsqueda exacta/semántica)
2. §6.13.2 — tabla "cinco tipos de memoria" → `#mem5` (explorador con antipatrón)
3. §10.3b — comparativa pipeline lineal vs. arquitectura recursiva → `#arb10` (simulador de inyección de error en árbol/cadena)
4. §12.4b — tabla "taxonomía completa de herramientas" → `#her12` (selector de tarea → herramienta correcta + coste del error)
5. §13.4 — tabla "taxonomía de errores" → `#err13` (selector de síntoma → diagnóstico)
6. §22.1 — diagrama de pipeline multimodal + callout de coste → `#mm22` (explorador por fase + calculadora de coste de tokens visuales en vivo)
7. §16.1 — tabla de riesgo AI Act → `#act16` (selector de rol + árbol de clasificación de 4 preguntas); la tabla redundante del árbol de clasificación en R.4 se sustituyó por una llamada cruzada a §16.1

**Reemplazos "de SVG" con CSS escopado (8):**

8. §4.2 (Cap. 0) — diagrama de niveles de alucinación → `#aluc0widget` (demo T=0 vs T=0.9, tabla de mitigación clicable, cuadrícula de 4 niveles de criticidad)
9. §1.3 — diagrama de pipeline RAG → `#ragw72` (fases offline/online con animación Play/Reset, 10 nodos clicables con snippets de código)
10. §6.2 — diagrama de búsqueda híbrida → `#hibw72` (comparador ponderada vs. RRF con selector de query y ranking en vivo)
11. §10.3 — gráfico de barras de entropía acumulada → `#entw72` (simulador con control de correlación entre errores; corrige el modelo original `p^n` con un término `p_ef = p - c·(1-p)` que converge exactamente a `p^n` cuando la correlación es 0)
12. §10.5 — diagrama de las 4 capas del patrón sándwich → `#sndw72` (recorrido interactivo por 3 escenarios, con la pregunta "¿qué pasaría si esta capa no existiera?" en cada capa)
13. §11.2 — matriz de criticidad verificabilidad×reversibilidad (9 celdas) → `#critw72` (11 casos del manual ubicables en la matriz; contenido verificado carácter a carácter contra el SVG original)
14. §15.1 — diagrama de los tres ciclos de vida del RAG en producción → `#mlow72` (pestañas Corpus/Modelos/Evaluación)
15. §4.6 — tabla diagonal verificabilidad/reversibilidad (marco de 3 niveles, distinto del de 9 celdas de §11.2) → `#vr46w72` (9 casos clasificables por nivel)

**No reemplazado en esta versión:** el diagrama "Pipeline completo de
inferencia en 9 pasos" (Cap. 4/5, dentro de §4.6.6) sigue siendo un SVG
estático. Existe un widget candidato evaluado en sesiones previas, pero su
contenido verificado no estaba disponible en el contexto de esta sesión de
implementación; reconstruirlo de memoria habría arriesgado exactamente el
tipo de deriva factual que este proceso existe para evitar. Queda anotado
como pendiente para la próxima sesión de widgets.

Tampoco se tocaron las 4 visualizaciones SVG dentro de `#rag-mec-es`
(§6.7-6.10, "Mecánica del sistema RAG + grafo") — no son diagramas
estáticos sueltos, son paneles de un widget por pestañas que ya es
interactivo desde antes de v72.

---

## Verificación

- Balance de etiquetas verificado tras **cada** inserción individual, no
  en lote — disciplina establecida en v72 tras detectar un `</div>` sobrante
  en el primer widget insertado esta versión.
- Dos regresiones propias detectadas y corregidas durante el propio
  proceso, antes de darlo por cerrado:
  - `#entw72`: un `</div>` de cierre duplicado justo después de su
    `<script>` (el contenedor ya se había cerrado antes del script).
    Detectado por traza de pila línea a línea, no por conteo agregado —
    el conteo agregado de todo el documento coincidía igualmente con o sin
    el bug, porque un defecto preexistente en el propio v71 (tres
    `</div>` de cierre en el bloque "Dilema M2" de la sección de
    autoevaluación del Módulo 2, cuyo déficit se compensa en otro punto
    del documento) enmascaraba el nuevo desbalance en el total.
  - `#critw72`: al eliminar el cuerpo del SVG original ya reemplazado,
    una edición de limpieza posterior añadió un `</div>` de más por
    error; detectado y revertido en el mismo turno.
  - Verificación final: traza de pila completa (no conteo agregado) para
    `div`, `section`, `svg`, `style`, `table`, `p`, `ul`, `ol` en todo el
    documento — cero cierres sin apertura correspondiente, cero
    aperturas sin cerrar, para los ocho tipos de etiqueta.
- El defecto preexistente del bloque "Dilema M2" (tres `</div>` donde
  el HTML válido solo necesita uno, en la sección de autoevaluación del
  Módulo 2) se confirmó idéntico en `archivo/Comprender_la_IA_2026_v71.html`
  línea 15291/15294/15299 — no es una regresión de v72, es deuda técnica
  preexistente que compensa en la práctica (el navegador cierra los
  `<div>` ancestros de más sin romper el renderizado visual) y queda fuera
  del alcance de esta sesión, que era sustitución de SVGs, no una
  auditoría general de HTML.
- Estructura antes/después:

  | | v71 | v72 | Δ |
  |---|---|---|---|
  | `h2` | 249 | 254 | +5 |
  | `h3` | 382 | 395 | +13 |
  | `table` | 227 | 223 | −4 |
  | `div` | 4703 | 4831 | +128 |
  | `svg` | 12 | 5 | −7 |
  | `script` | 40 | 55 | +15 |
  | `style` | 9 | 24 | +15 |
  | bytes | 2.364.788 | 2.423.976 | +59.188 |

  El descenso de `svg` (−7) corresponde exactamente a los 7 diagramas
  `svg-*` con `id` propio que existían en v71 y se sustituyeron (aluc,
  rag-pipeline, hibrida, entropia, sandwich, criticidad, mlops); los 5
  `<svg>` restantes en v72 son el diagrama de 9 pasos (pendiente, ver
  arriba) y los 4 paneles internos de `#rag-mec-es`.
- Carpeta principal del proyecto: se elimina
  `Comprender_la_IA_2026_v71.html`, queda solo
  `Comprender_la_IA_2026_v72.html` (convención del proyecto: un único
  archivo vivo en la raíz).

## Alcance

Esta versión completa la sustitución de todos los diagramas SVG
independientes evaluados y aprobados en el lote de 20 widgets revisado
antes de esta sesión, con la única excepción documentada arriba (pipeline
de 9 pasos, pendiente por falta de contenido verificado disponible en
sesión). No se realizaron cambios de contenido textual ni correcciones
editoriales en esta versión — ese trabajo quedó cerrado en v71
(`Revision_editorial_agosto2026.md`).
