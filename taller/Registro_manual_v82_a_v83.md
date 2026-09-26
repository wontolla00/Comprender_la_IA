# Registro de cambios · v82 → v83

*Septiembre 2026.*

Origen: batch de 14 widgets interactivos aportados por el usuario para su posible inserción en el manual (`C:\Users\wonto\Downloads\`). Cada widget se evaluó primero por factualidad y rigor técnico — no solo por si "encajaba" — con el mismo criterio aplicado a los posts externos revisados en sesiones anteriores: verificar cifras contra fuente primaria, cruzar contra el código/contenido real del manual, y declarar en qué se equivoca un widget aunque el concepto de fondo sea bueno. Dos rondas de corrección directa sobre los archivos originales del usuario (no solo señaladas): el arXiv ID y la cifra de ASR del widget de Prompt Injection, y el preset "PUERTA XOR" del widget de la Neurona Artificial.

## Hallazgo estructural antes de insertar nada

Antes de tocar el manual, se verificó si alguno de los 12 widgets aún candidatos ya tenía equivalente en v82 — el manual ya trae 7 simuladores embebidos vía `<iframe srcdoc>` y 15 diagramas convertidos a widgets inline desde v72. El cruce descartó 5 candidatos completos por solapamiento y obligó a recortar 2 más:

- **Descartados por duplicado directo (ya existen como iframe):** Diagnóstico RAG en 5 Pasos (ya existe: "Árbol de Decisión: Troubleshooting de Fallos RAG", Cap. 7) · Calculadora TCO (ya existe: "Calculadora de TCO de Sistemas RAG Corporativos", Apéndice A).
- **Descartados por solapamiento con widget inline ya superior:** Simulador de Entropía Acumulada (§10.3 ya tiene un modelo de correlación más sofisticado y cita a METR con el título real del paper) · Clasificador AI Act (§16.1 ya usa las categorías legales reales del AI Act con los tramos de sanción correctos por categoría, más preciso que el marco Nivel 1-4 del widget) · Búsqueda Híbrida BM25+Vectorial (§6.2 ya usa las mismas 5 queries de ejemplo y añade una comparación en vivo RRF-real vs. ponderada que el widget no tenía).
- **Recortados a su parte no duplicada:** Prompt Injection y Defensas (Cap. 21 ya cubre ASR/FRR, casos reales y matriz de defensas con más rigor — se insertó solo la pestaña "Atacar", el simulador interactivo que Cap. 21 no tenía) · La Escalera de la IA (§9.9 ya tenía la tabla comparativa de niveles y el caso Meridian — se insertó solo el árbol de decisión interactivo de 4 preguntas, que no existía).
- **Descartado por decisión del usuario, sin evaluar:** Arquitectura RAG & Costes (solapaba con Calculadora TCO y era el más flojo técnicamente de los dos).
- **Descartado por redundancia entre los propios candidatos:** Simulador de Predicción de Tokens (duplica Simulador de Temperatura y Muestreo con menos profundidad — top-k fijo sin top-p, sin pestaña comparativa, sin regla de decisión con rangos de temperatura).

## Los 7 widgets insertados

1. **Neurona Artificial Interactiva** — Cap. 0, antes de §1.4 (La arquitectura Transformer). El manual no tenía ninguna sección sobre el cómputo de una sola neurona (suma ponderada + sesgo + sigmoide) antes de pasar a atención/Transformer. Corregido antes de insertar: el preset "PUERTA XOR" implicaba que una sola neurona podía resolver XOR, que no es linealmente separable (Minsky y Papert, 1969) — se añadió una tabla de verdad en vivo que muestra que AND/OR aciertan las 4 combinaciones y XOR falla siempre en al menos una, con la explicación de por qué.
2. **Simulador de Temperatura y Muestreo** — Cap. 0, entre §3.4 (Top-k/Top-p) y §3.4b (max_tokens). Sin overlap: la sección existente no tenía ningún elemento interactivo sobre temperatura o muestreo.
3. **Simulador de Embeddings y Similitud Coseno** — Cap. 2, antes de §2.4. La advertencia sobre negación semántica ya existía como prosa estática (mismo ejemplo "ganó/perdió 10M"); el widget añade el visualizador 2D, la calculadora manipulable y el caso de estructura lógica (A implica B ≠ B implica A) que no estaba cubierto.
4. **Simulador de LoRA y Fine-tuning** — Cap. 1, antes de §1.7. §1.6b solo tenía glosario y un selector de arquitectura de alto nivel (RAG/fine-tuning/RAFT); no había calculadora de rango/α ni visualización de las matrices A/B sobre W₀. Corregido antes de insertar: el preset "GPT-2 large (1024)" — 1024 es la dimensión de GPT-2 *medium*, no *large* (1280) — renombrado a "GPT-2 medium (1024)".
5. **La Escalera de la IA — árbol de decisión** (recortado, ver arriba) — §9.9, tras el párrafo de cierre ("Marco basado en Valenzuela, J. 2026").
6. **Constructor del Patrón Sándwich** — Laboratorio Módulo 3, justo después del Caso 3-2 ("El patrón sándwich roto"). El §10.5 ya tiene un recorrido narrativo por 3 escenarios explicando qué hace cada capa; el widget es un ejercicio distinto — construir por arrastre una arquitectura y validarla con puntuación — posicionado junto al caso de scoring crediticio roto para que el lector reconstruya la versión correcta con el preset ya listo para ese caso exacto.
7. **Simulador de ataque — Prompt Injection** (recortado, ver arriba) — Cap. 21, tras el bloque "El dato que cambia la conversación: 14,3% → 71,4%" y antes de §21.2 (Casos reales).

## Bug encontrado y corregido en el manual (no solo en los widgets)

Verificando la cita de Shida et al. citada en el widget de Prompt Injection, se detectó que el arXiv ID **ya estaba mal en el propio manual v82**, en tres sitios: quiz de Cap. 9 (§9, pregunta 2), Cap. 21 §21.1 y la bibliografía de Cap. 21. `arXiv:2404.02652` no es el paper citado — es "Mutual singularity of Riesz products on the unit sphere" (Doubtsov), matemática pura sin relación con IA. El paper real es **arXiv:2604.02652** — "Generalization Limits of Reinforcement Learning Alignment: Detecting LLM Vulnerabilities through Compound Jailbreaks" (Shida, Imai y Kansa, Aladdin Security Inc., abril 2026) — verificado directamente contra arXiv antes de corregir. Las cifras 14,3%/71,4% en sí eran correctas; solo el ID y el año (2024→2026) estaban mal. Corregido en los tres sitios, y se añadió "sobre gpt-oss-20b" en Cap. 21 para precisar qué modelo evalúa el paper.

## Mecanismo de inserción

Los 7 widgets se embebieron con el mismo patrón `<iframe loading="lazy" srcdoc="...">` que ya usa el manual para sus 7 simuladores existentes — aislamiento completo de CSS/JS por documento, sin riesgo de colisión de nombres de función o de clase entre widgets. Los dos widgets recortados (Prompt Injection, Escalera) se reconstruyeron como HTML autocontenido nuevo a partir del contenido ya revisado, no editando por resta el archivo original del usuario, para evitar dependencias colgantes de la pestaña retirada.

## Verificación

- Snapshot de v82 archivado antes de editar: `archivo/Comprender_la_IA_2026_v82.html`.
- Balance de 6 tipos de etiqueta sobre el documento completo (`div`, `section`, `table`, `h2`, `h3`, `style`) comparado v82 vs. v83: los 5 tipos ajenos a los widgets idénticos antes/después; `div` sube exactamente +14 (7 widgets × 2 divs de cabecera cada uno), sin desbalances en ningún caso.
- Servido con un servidor HTTP estático local y verificado en navegador: los 14 iframes (7 previos + 7 nuevos) cargan con contenido visible, cero errores de consola. Prueba funcional end-to-end de dos widgets: el Constructor del Patrón Sándwich calcula score (77/100) y coste (€0,068) al cargar el preset de scoring crediticio; el árbol de La Escalera de la IA completa las 4 preguntas y devuelve "Nivel 1 — Llamada única" para el camino esperado.
- `<title>` y badge de la topbar actualizados de "v82" a "v83"; archivo renombrado de `Comprender_la_IA_2026_v82.html` a `Comprender_la_IA_2026_v83.html`.

## Alcance

Siete inserciones de contenido nuevo, todas en secciones ya existentes, ninguna sustituye contenido ya presente. Tres correcciones de una cita ya incorrecta en el manual (no introducida por esta ronda, pero detectada durante ella). Ningún otro capítulo se tocó.
