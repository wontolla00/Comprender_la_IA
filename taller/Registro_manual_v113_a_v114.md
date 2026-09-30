
# Registro de cambios · v113 → v114

*30 de septiembre de 2026.*

Origen: lote de veille del 30/09 (siete piezas). Cruce con el manual antes de editar: MoE (§5.7g, con
residentes y el paper de halving), LoRA+/QLoRA (§1.6b, §5.7.4), KV cache (§5.5c), los 15 conceptos
(triaje 28/09) y Jev 10 pasos (triaje 28/09, v112) ya estaban cubiertos. Quedaban dos cambios,
aprobados por David antes de tocar el manual.

## Cambios en el manual

1. **§2.4** — nuevo `<div class="warning">` al final de la sección, antes de §2.4b. Sin `id` nuevo ni
   entrada de índice. Contenido: prefijos, pooling, normalización/métrica, preprocesado.
   Verificación externa (fichas de Hugging Face, 30/09/2026): `multilingual-e5-large` exige
   `query: ` / `passage: ` y usa media + L2; `nomic-embed-text-v1.5` exige prefijo de tarea
   (`search_query` / `search_document`), media + L2; BGE-M3 "no longer requires adding instruction to
   the queries". **No verificado y no afirmado:** el pooling de BGE-M3 (la ficha no lo dice).
2. **§5.7b** — en "La trampa del titular", sustituida "Con cuantización 4-bit, cabe en hardware
   accesible" por la distinción cómputo/memoria: 671B × 0,5 B = ≈335 GB solo en pesos.

Referencia interna corregida durante la edición: la regla de versión del modelo de embedding vive en
§4.2 y Cap. 15 (no en §2.6, como decía la propuesta).

## Verificación

- v113 archivado íntegro en `archivo/Comprender_la_IA_2026_v113.html` antes de editar (md5
  `74684ca1729fb4fced56676b89483c84`, idéntico al original).
- Balance de etiquetas (aperturas y cierres): div 5279→5280, strong 2429→2434, code 382→388,
  p sin cambio; sin desbalance. 31.437 → 31.441 líneas.
- `<title>` y badge de topbar actualizados a v114.

## Pendiente

- Sin commit: `.git/index.lock` no se puede borrar desde este entorno, y `index.html` ya traía
  cambios v113 sin confirmar.
