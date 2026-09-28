# Registro de cambios · v112 → v113

*28 de septiembre de 2026.*

Origen: "Procedural Graphs: Self-Evolving Execution Structures for LLM Agents" (Lu, Chen, Wu,
Arık; Google/Georgia Tech/Peking Univ.; arXiv:2609.09153) — verificado real por WebSearch +
lectura directa del HTML en arXiv, no solo el resumen del post de LinkedIn que lo traía. Entrada
completa de triaje: `taller/Triaje_fuentes_externas_2026.md`, 2026-09-28 (g), profundizada en (k)
con la redacción exacta del texto a insertar, aprobada por David antes de tocar el manual.

## Cambio en el manual (único, nuevo, pequeño)

**§10.9.4** (Memoria de traza como requisito de trazabilidad) gana un `<div class="nota">` nuevo,
insertado inmediatamente después del callout "→ Orden de implementación recomendado" (que cierra
con la afirmación normativa "La memoria de política nunca se auto-promueve") y antes de §10.9.5.
Matiza esa norma citando el paper: una estructura análoga de conocimiento procedimental sí puede
auto-evolucionar de forma controlada (puerta de validación sobre held-out + memoria de rechazo),
con cifras reales (21/24 configuraciones modelo-benchmark). La distinción que sostiene la norma no
es "nunca automatizar", sino "nunca automatizar sin puerta verificable".

No se creó ninguna sección ni `id` nuevo — es un párrafo de matiz, sin necesidad de entrada en el
índice temático.

## Verificación

- v112 archivado íntegro en `archivo/Comprender_la_IA_2026_v112.html` antes de editar (md5sum
  verificado idéntico al original en el momento del archivado: `56fbe6211f70697661c5d35fd3ecdba5`).
- Balance estructural, verificado tras la edición: div 5278→5279 (+1, el nuevo `<div class="nota">`,
  abre y cierra), strong 2428→2429 (+1, el `<strong>🔎 Matiz (2026-09)</strong>`), p/h2/h3/table/tr/a/
  code/em sin cambio (0 nuevos, balance idéntico). 31.433 → 31.437 líneas (+4, exactamente las 4
  líneas del bloque insertado). Sin desbalance de apertura/cierre en ningún tag.
- Sin `id` nuevo, sin colisión que verificar.
- Archivo renombrado `Comprender_la_IA_2026_v112.html` → `Comprender_la_IA_2026_v113.html`;
  `<title>` y badge de topbar actualizados a v113 (verificado por grep, 2 apariciones).

## Lo que no se cambió

El resto de la profundización de hoy sobre los otros tres candidatos (Auditra/prompt injection,
HyperRAG/MCP+evals, Manual/MLOps clásico) no generó ningún cambio de contenido en el manual — quedan
documentados solo en `taller/Triaje_fuentes_externas_2026.md` (entradas (h), (i), (j)), sin tocar el
HTML, por las razones ya explicadas en cada una (pregunta cerrada sin hallazgo, dimensionado de
producto sin cambio de código, y descarte por alcance respectivamente).

## Alcance

Cambio mínimo y localizado — un párrafo de matiz con cita verificable a un contraste real entre el
diseño ya existente del manual y un resultado externo reciente, sin alterar la norma que matiza ni
la estructura del documento.
