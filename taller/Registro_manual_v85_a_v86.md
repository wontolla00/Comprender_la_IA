# Registro de cambios · v85 → v86

*Septiembre 2026.*

Origen: tras la auditoría de citas cruzadas colgantes hecha sobre el resto del corpus literario (libro-síntesis, 08, 99_Taller), el usuario pidió aplicar el mismo chequeo al manual. Dado el tamaño del archivo (~30.000 líneas), la verificación se hizo mecánicamente en vez de por muestreo: se extrajeron las 367 secciones realmente definidas como cabecera (`<h2>`/`<h3>` que empiezan por `N.N`) y las 196 citadas por número (patrones `§N.N`, `Cap. N.N`, `sección N.N`, `→ N.N`), y se comparó el conjunto de citadas contra el de definidas.

## Tres referencias colgantes encontradas y corregidas

**§13.611 (dos apariciones, §5.5c/§15.4c).** No existe ninguna sección "13.611" ni "13.6.11" en el manual. El contenido que ambas citas describían —caché semántica indexada solo por texto de consulta, con riesgo de "acierto equivocado" cuando dos barridos con parámetros distintos (`top_k`) devuelven el mismo resultado cacheado— vive en realidad en **§13.15** ("El arnés que miente: procedencia perdida en la capa de evaluación"), Caso 1. Corregido en las dos líneas donde aparecía: la comparación con KV/prompt caching en §5.5c, y la lista "Ver también" al cierre de §15.4c.

**§0.4 (tabla comparativa ETL vs. RAG, cerca de §2.5).** El manual no tiene ninguna sección "0.x" — el Capítulo 0 no usa numeración decimal de subsecciones. La celda de tabla decía "Necesita grounding, umbral de rechazo y cita de fragmentos (§0.4, §12)". El contenido real sobre grounding falso y umbral de rechazo vive en **§7.3** ("El problema del grounding falso") — confirmado por el contenido de esa sección, que discute exactamente "umbral de rechazo" y los fallos silenciosos de un RAG sin él. Corregido a "(§7.3, §12)".

## Verificación

- Snapshot de v85 archivado antes de editar: `archivo/Comprender_la_IA_2026_v85.html`.
- Comparación exhaustiva (no muestreo): 367 secciones definidas vs. 196 citadas, en locale `C` para evitar falsos positivos de ordenación. De las citadas sin sección definida correspondiente, dos resultaron falsos positivos del propio patrón de búsqueda (`0.38` y `0.85 → 0.38` son una caída de puntuación en un caso real, no una referencia de sección) y tres fueron los errores reales corregidos arriba.
- Se comprobó además que no hay dos secciones distintas usando el mismo número (`sort | uniq -d` sobre las 367 cabeceras: sin duplicados) y que ningún capítulo citado excede el rango real (0–22).
- `<title>` y badge de la topbar actualizados de "v85" a "v86"; archivo renombrado de `Comprender_la_IA_2026_v85.html` a `Comprender_la_IA_2026_v86.html`.

## Alcance

Tres correcciones puntuales de referencia (dos veces la misma, más una distinta), sin tocar contenido sustantivo de ninguna sección. Ningún otro capítulo se tocó.
