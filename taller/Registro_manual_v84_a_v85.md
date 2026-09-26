# Registro de cambios · v84 → v85

*Septiembre 2026.*

Origen: el usuario sometió el manual a un segundo análisis externo (Meta AI), tras el de Qwen que dio lugar a v84. De las cinco críticas detalladas, tres señalaban imprecisiones reales, verificadas contra el texto del manual antes de aplicar ningún cambio. Las otras dos (contradicción en el párrafo del watermark de Claude, umbral 0.5 del índice de erosión) resultaron parcialmente fundadas pero no se tocaron — ver detalle al final. Este registro documenta las tres correcciones aplicadas.

## 1. FlashAttention — "5–20× menos memoria" sin especificar de qué

**El error.** En 5.7d, la frase de cierre del párrafo principal ("misma calidad, 2–4× más rápido, 5–20× menos uso de memoria", línea ~12834) y el recuadro de resumen ("Memoria durante entrenamiento: hasta 20× menos", línea ~12840) daban la cifra de ahorro de memoria sin aclarar que es sobre la matriz de atención N² intermedia, no sobre la VRAM total del modelo. El párrafo sí explica el mecanismo (evitar materializar la matriz completa), pero la cifra final no llevaba el calificador — un lector puede leerla como "el modelo ocupa 20× menos".

**La corrección.** Añadido "en la matriz de atención intermedia (no en la VRAM total del modelo...)" en la frase principal, con una nota de que en inferencia con batch pequeño el ahorro agregado es más modesto que la cifra sugiere. En el recuadro resumen, "Memoria durante entrenamiento: hasta 20× menos" pasa a "Memoria de la matriz de atención durante entrenamiento: hasta 20× menos".

## 2. No-determinismo residual a T=0 — causa dudosa

**El error.** §3.5 (línea ~4715) daba "tres causas técnicas" para el no-determinismo residual: hardware paralelo, no-asociatividad del punto flotante, y "estado del caché y jerarquía de memoria". La tercera no es una causa establecida de forma independiente en la literatura de referencia sobre este fenómeno (el análisis técnico más citado sobre no-determinismo en inferencia LLM atribuye la variabilidad al orden de reducción bajo *continuous batching* interactuando con la no-asociatividad de punto flotante — no a la jerarquía de caché como mecanismo aparte).

**La corrección.** Reescrito el pasaje a dos causas entrelazadas en vez de tres independientes: el orden de reducción en el hardware paralelo varía según cómo el motor de serving agrupa peticiones (continuous batching), y esa variación de orden interactúa con la no-asociatividad del punto flotante. Se retiró "estado del caché y jerarquía de memoria" como causa.

## 3. Ejemplo Qwen3.6-35B (REAP+destilación+MTP) sin badge de caducidad

**El error.** Al abrir el Cap. 6 (línea ~13000), un caso comunitario de dos meses de antigüedad (poda REAP + destilación LoRA + MTP sobre Qwen3.6-35B) se presentaba en prosa sin marcar, cerrando con "la lección de arquitectura" en tono de conclusión asentada — a diferencia de contenido igual de volátil en el mismo manual (DeepSeek-V4 en 5.5c, o toda la sección 5.7d) que sí lleva badge `caducidad-alta` y nota de caducidad explícita. Inconsistencia en el propio sistema de etiquetado, no solo un problema de contenido: las cifras en sí (ARC-Challenge 0.616 vs. 0.532, etc.) eran correctas.

**La corrección.** Añadido badge `<span class="version-badge caducidad-alta">2026-06 · caduca rápido</span>` junto al título del recuadro. Separada explícitamente la lección de arquitectura que sobrevive (apilar poda+destilación+cuantización+especulación como capas independientes) de las cifras concretas del caso, marcadas ahora como "ilustración con fecha, no [...] benchmark de referencia".

## Descartado tras verificación: el resto del análisis de Meta AI

- **Watermark de Claude / "tournament sampling" (Cap. 1, radioactividad):** Meta AI describía esto como una contradicción "3 párrafos después" de la afirmación inicial. Verificado: es la misma frase, no párrafos distintos — el manual ya afirma y matiza en el mismo aliento ("Claude usa tournament sampling [...] pero no está confirmada específicamente para la implementación de Anthropic"). La tensión de fondo es real pero ya está autocontenida; no se considera error que amerite reescritura, aunque la prosa podría ser más limpia en una futura pasada editorial.
- **Umbral |r|≥0.5 del índice de erosión (§5.5e.3):** el propio análisis reconoce que la analogía "promotion gate de la sesión" ya está marcada como ★ Concepto del autor. El punto residual (el umbral es una convención estadística genérica, no derivada para este caso de uso) es válido pero menor; no se tocó.
- **Reglamento (UE) 2026/1744 (Digital Omnibus), arXiv:2606.19348 (DeepSeek-V4), Sander et al. (radioactividad):** verificados por búsqueda externa como correctos y ya bien tratados en el manual (fechas exactas del calendario de prórrogas confirmadas contra BOE/DOUE; DeepSeek-V4 ya en recuadro "Frontera de investigación" con nota de caducidad). No se cambia nada.

## Alcance

Tres correcciones puntuales en dos capítulos (5.7d, 3.5) y un recuadro al abrir el Cap. 6. Ningún otro contenido se tocó. Snapshot de v84 archivado antes de editar: `archivo/Comprender_la_IA_2026_v84.html`. `<title>` y badge de la topbar actualizados de "v84" a "v85"; archivo renombrado de `Comprender_la_IA_2026_v84.html` a `Comprender_la_IA_2026_v85.html`.
