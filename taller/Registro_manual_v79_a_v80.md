# Registro de cambios · v79 → v80

*Septiembre 2026.*

Origen: documentación del Nivel 2 de la síntesis STRATEGIST de vigilancia
técnica (`99_Taller/vigilancia_tecnica/hallazgos/2026-08.md`, ítem 3) — el
marco de fiabilidad de agente de Rabanser/Kapoor et al. (arXiv 2602.16666),
implementado como arnés real en HyperRAG/Empreinte en la ronda anterior y
documentado aquí solo después de que ese arnés corriera de verdad tres veces
contra el motor real (mismo criterio que Self-RAG en v77→v78: primero se
construye y verifica, después se escribe).

## La inserción

### §13.16 — Fiabilidad de agente: cuando el éxito medio esconde el fallo real

Sección nueva, al final del Cap. 13 (Validación y QA), justo antes del
resultado del capítulo y justo después de §13.15 ("El arnés que miente") —
vecino deliberado, no arbitrario: el propio proceso de verificar esta
sección produjo una instancia en vivo del patrón que §13.15 lleva
describiendo desde el título (ver más abajo).

Contenido: las 4 dimensiones del paper (Consistencia, Robustez,
Predictibilidad, Seguridad) y sus 12 sub-métricas, citadas y verificadas
contra el texto del paper (no solo el abstract) antes de escribirlas. Dos
desviaciones declaradas explícitamente, no descubiertas después de
publicar: el paper mide agentes con trayectoria de herramientas
(benchmarks GAIA/τ-bench); HyperRAG es `retrieve→generate` de un solo
paso, así que (1) la sub-métrica de trayectoria se redefine como "traza de
decisión" (tipo de consulta + capas consultadas + acierto de caché, no
llamadas a herramienta) y (2) Robustez de Entorno se reporta explícitamente
como no aplicable en vez de forzar un proxy con el nombre de la métrica del
paper.

**Caso real citado con datos de las tres ejecuciones reales** (2026-09-01,
00:05/00:35/01:00, 3-5 tareas cada una) del arnés `HyperRAG/eval/
reliability_eval.py`, en una tabla con las cuatro dimensiones por
ejecución. Nota explícita de límite de escala: 3-5 tareas no es un
benchmark, el valor verificado es que el pipeline completo corre de punta
a punta con las desviaciones correctamente reflejadas, no una medición de
producción.

**El hallazgo del propio proceso, incluido a propósito.** Al ingerir la
segunda ejecución real en el panel de Empreinte, la tabla de Robustez
mezclaba en la misma columna valores numéricos y el texto "no aplicable" —
tipo de dato no homogéneo que rompió la serialización a Arrow de Streamlit
y tumbó la página entera. Se detectó verificando en el navegador antes de
dar el trabajo por terminado, no confiando en que el script no lanzara
excepción. Se incluye en la sección como ejemplo del mismo día del patrón
central de §13.15 — un arnés no auditado no tiene por qué avisar de que
está mintiendo, y aquí no fue una cifra la que mintió, fue la forma de
mostrarla.

## Verificación

- Snapshot de v79 archivado antes de editar: `archivo/Comprender_la_IA_2026_v79.html`
  (Regla 1 de GUARDIAN, seguida desde entonces sin excepción tras el fallo
  de v77→v78).
- Diff real contra ese snapshot: 3 líneas eliminadas (título, badge de
  topbar, el párrafo de cierre del capítulo — las tres tocadas a
  propósito, verificadas una a una), 42 líneas añadidas. Sin eliminación
  de contenido no relacionado con esta ronda.
- Balance de 17 tipos de etiqueta sobre el archivo completo (div, p, span,
  strong, em, a, code, ul, li, h2, h3, table, tr, thead, tbody, th, td):
  las 17, open==close, cero desbalances.
- Verificado en navegador vía servidor HTTP estático local: título de
  pestaña correcto (v80, septiembre 2026), entrada de tabla de contenidos
  presente y enlazando a `#s1316`, contenido íntegro confirmado en el DOM
  renderizado (cita arXiv, la tabla de las tres ejecuciones, la caja roja
  del hallazgo del propio proceso), cero errores de consola.
- `<title>` y badge de la topbar actualizados de "v79 · ago 2026" a
  "v80 · sep 2026"; archivo renombrado de
  `Comprender_la_IA_2026_v79.html` a `Comprender_la_IA_2026_v80.html`.

## Alcance

Una inserción: contenido completamente nuevo (§13.16), no reorganización
de lo existente. El párrafo de cierre del Cap. 13 se actualizó para
mencionar la nueva sección. Ninguna otra sección ni cifra ya presente en
el manual se tocó. No se documenta todavía el código de HyperRAG/Empreinte
más allá de esta sección — eso vive en
`99_Taller/vigilancia_tecnica/hallazgos/2026-08.md` y en los propios
repositorios.
