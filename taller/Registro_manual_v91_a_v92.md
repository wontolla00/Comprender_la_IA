# Registro de cambios · v91 → v92

*Septiembre 2026.*

Origen: revisión de "CPU vs GPU vs TPU vs NPU vs LPU, explained visually" (infografía) + "How a GPU Actually Works" (Akshay Pachaar) — el artículo completo construye, desde una sola asimetría (cómputo barato, mover datos caro), el marco de intensidad aritmética / roofline model que predice el techo de tokens/s de un modelo antes de perfilar nada.

## Verificación previa

- **§5.7d** (prefill compute-bound / decode memory-bound, TTFT/ITL) y **§5.7e** (tabla CPU/GPU/TPU/NPU/LPU, con LPU/Groq) ya cubrían la mitad cualitativa de este material — confirmado por grep, sin necesidad de tocarlos.
- **Hueco real, confirmado por grep**: cero apariciones de "roofline", "intensidad aritmética" u "operaciones por byte" en todo el manual. El vocabulario (memory-bound/compute-bound) y el hardware estaban descritos; el número que los conecta, no.
- **Verificación de las cifras del post, con hallazgo propio**: el post deriva su punto de equilibrio (~295 ops/byte) de "989 TFLOPS BF16 denso ÷ 3,35 TB/s" para la H100 SXM5. Confirmado contra el datasheet oficial de NVIDIA — pero ese mismo datasheet encabeza con **1.979 TFLOPS**, casi el doble, que es la cifra **con sparsity estructurada 2:4**, no la densa. El post usa la cifra correcta (densa) pero no advierte la trampa: copiar el número grande de la ficha técnica duplicaría el punto de equilibrio (≈590 en vez de ≈295) y cambiaría el diagnóstico de memory-bound a compute-bound para la misma carga real. Este hallazgo (no señalado por el post) es el aporte más citable de la sección nueva.
- H200: mismo troquel de cómputo que H100 (989/1.979 TFLOPS sin cambio), banda ampliada a 4,8 TB/s → punto de equilibrio ≈206, coincide con la cifra del post.

## Cambio: nueva subsección dentro de §5.7d

**"El techo cuantitativo: intensidad aritmética y el punto de equilibrio"**, h3 sin id propio (mismo patrón sin ancla que "FlashAttention" e "Inferencia especulativa", sus vecinos dentro de la misma sección), insertada entre el párrafo de diagnóstico prefill/decode y "FlashAttention — la atención estándar, más rápida":

- Define intensidad aritmética y punto de equilibrio (`capacidad aritmética ÷ ancho de banda`), con el nombre estándar del marco (roofline model, Williams et al. 2009) — terminología de industria, no "★ Propuesta del autor".
- Aviso explícito de la trampa densa/sparsity de la H100, con ambas cifras y su procedencia.
- Aplica el cálculo a decode: cada peso hace 2 operaciones (mult+suma) y ocupa 2 bytes a BF16 → intensidad ≈1 op/byte, ~300× por debajo del punto de equilibrio — cuantifica lo que §5.7d ya decía cualitativamente.
- Deriva el techo de tokens/s desde primeros principios (`tamaño del modelo en bytes ÷ ancho de banda`): 70B a BF16 → ≈42 ms/token → ≈24 tok/s; cruzado con §5.7c (cuantizar a 8 bits dobla el techo a ≈48 tok/s) — mismo cálculo que documentar el supuesto de `GPU_PERF` en Empreinte confirmó por el otro lado (ver más abajo).
- Nota de alcance del modelo: batch=1, sin presión de caché KV — remite a §5.7e para sustituir el ancho de banda por familia de chip.

Añadida entrada al índice de conceptos del autor (bloque JS), apuntando a `#s57d` como sus vecinas — sin TOC nueva, mismo criterio que el resto de subsecciones sin numeración propia dentro de 5.7d.

## Verificación

- Parseo HTML completo (`html.parser`) contra el snapshot v91 archivado: 0 avisos de anidamiento, 0 etiquetas sin cerrar, en ambas versiones.
- 944 `id` antes y después (sin `id` nuevo — la subsección no lleva ancla propia, igual que sus vecinas); 722 enlaces internos, **cero rotos nuevos**.
- Entradas del índice de conceptos del autor: 155 → 156 (+1, la nueva).
- Snapshot de v91 archivado antes de editar: `archivo/Comprender_la_IA_2026_v91.html`.
- `<title>` y badge actualizados a v92; archivo renombrado a `Comprender_la_IA_2026_v92.html`.
- Líneas: 31.042 → 31.052 (+10, la subsección nueva más su entrada de índice de conceptos).

## Pieza cruzada en Empreinte (misma sesión, mismo origen)

Al aplicar la fórmula del artículo a `Empreinte/cost_calculator_tab.py::GPU_PERF` (tabla de tokens/s realistas por GPU×tamaño de modelo, usada para estimar latencia de una consulta) se confirmó que la tabla asume implícitamente pesos cuantizados a ~8 bits — a BF16 el techo físico de una H100 para 70B es ~24 tok/s, no los 50 que da la tabla; a ~8 bits sube a ~48, que es de donde salen sus cifras. La celda 70B/H100 queda sin margen (48 de techo teórico sin caché KV vs. 50 en la tabla). Documentado el supuesto en un comentario junto a `GPU_PERF` y añadido un `st.caption()` visible en la UI cuando se muestra la latencia estimada. Verificado con `py_compile`, sin test dedicado (el módulo no tenía ninguno antes de esta sesión).

## Alcance

Cambio pequeño y localizado: una subsección nueva de prosa (sin pseudocódigo, es un cálculo aritmético directo) sobre contenido ya escrito en v88→v89, más una entrada de índice de conceptos. Sin renumeración, sin secciones nuevas de nivel superior.
