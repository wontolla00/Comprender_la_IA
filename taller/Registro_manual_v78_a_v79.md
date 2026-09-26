# Registro de cambios · v78 → v79

*Agosto 2026.*

Origen: Nivel 1 de la síntesis STRATEGIST de la primera pasada real de
`/vigilancia-scout` + `/vigilancia-analista` (99_Taller/vigilancia_tecnica),
el sistema formalizado tras la revisión manual de 11 posts que produjo
v76→v78. Cuatro hallazgos de esa pasada, los cuatro clasificados "hueco real
y accionable" con cifras ya verificadas contra fuente primaria en la fase
ANALYST — esta ronda solo aplica lo que ya pasó esa verificación, no repite
la verificación de cifras (ver `hallazgos/2026-08.md` para el detalle
completo por ítem).

## Fallo de proceso de v77→v78, no repetido

A diferencia de la ronda anterior, `Comprender_la_IA_2026_v78.html` **sí se
archivó** en `archivo/` antes de la primera edición de esta ronda (Regla 1 de
`GUARDIAN_checklist.md`, escrita precisamente a raíz de ese fallo). La
verificación de esta ronda pudo hacerse por **diff real** contra ese
snapshot: `diff archivo/…v78.html …v79.html` da 28 líneas de diferencia,
las 28 de tipo adición (`>`), cero líneas eliminadas (`<`) — confirma que las
tres ediciones fueron puramente aditivas, sin tocar contenido existente.

## Las tres inserciones (cuatro hallazgos, agrupados en tres puntos del texto)

### 1. §15.4c — CacheWeaver y LazyAttention, junto a CacheBlend

Nuevo callout inmediatamente después del párrafo de CacheBlend ya existente
(v76→v77), antes del callout de "Límites a tener en cuenta". Presenta dos
mitigaciones más recientes (2026) al mismo problema — reordering de chunks
bajo prefix caching en RAG — con mecanismos distintos a CacheBlend:

- **CacheWeaver** ([arXiv 2606.19667](https://arxiv.org/abs/2606.19667)):
  reordena la evidencia recuperada (árbol de prefijos + recorrido voraz) en
  vez de recalcular. Cifras verificadas contra el abstract: 20-33% de
  reducción de TTFT mediano, 97.5% de la ganancia de un ordenamiento
  oráculo, sin pérdida de calidad QA medida. La más barata de adoptar de las
  tres — vive en la capa de prompt.
- **LazyAttention** ([arXiv 2606.04302](https://arxiv.org/abs/2606.04302)):
  kernel de atención con codificación posicional diferida, KV cache
  agnóstico a la posición. Cifras verificadas contra el abstract: 1.37× TTFT,
  1.40× throughput frente a baseline Block-Attention — ganancia más modesta
  que CacheBlend o Mooncake, mecanismo distinto (cambia el kernel).

### 2. §15.4c — Mooncake, junto a llm-d

Nuevo callout inmediatamente después de la cifra de llm-d ya existente
(v77→v78), antes de la línea "Ver también". Presenta
[Mooncake](https://vllm.ai/blog/2026-05-06-mooncake-store) (blog oficial de
vLLM, mayo 2026) como solución alternativa/complementaria a llm-d para el
mismo problema — round-robin multi-réplica destruye el prefix caching —, con
arquitectura de caché KV distribuida (`KVConnector` sobre GPUDirect RDMA) en
vez de router con índice de bloques. Cifras citadas **textualmente del texto
del blog**, no de un gráfico —a diferencia de la cifra de 13.9× de llm-d que
el manual ya marca como no confirmada letra por letra—: 3.8× throughput, 46×
reducción de TTFT (P50), 8.6× reducción de latencia end-to-end, tasa de
acierto de caché de 1.7% a 92.2%, sobre trazas agénticas reales de Codex en
12 GPUs GB200, con escalado casi lineal hasta 60 GPUs.

### 3. §5.7d — Variantes de decodificación especulativa en producción (AMD)

Nuevo callout tras el bloque "Cuándo funciona bien / Cuándo aporta menos",
antes del resumen "las tres capas de optimización". El manual solo cubría el
patrón genérico draft+verify de dos modelos; esta inserción añade las cinco
estrategias de *drafting* reales que compara un post técnico de vLLM
(agosto 2026) sobre AMD Instinct MI300X/MI355X (ROCm): MTP nativo, Gemma 4
MTP, EAGLE-3, DFlash, DSpark — distinguidas por si el draft genera candidatos
de forma secuencial o en paralelo y de dónde saca la información.

**URL verificada de forma independiente antes de citarla** (la cola de SCOUT
la había dejado marcada como "verificar URL exacta al analizar"): se
localizó por búsqueda y se confirmó como
`https://vllm.ai/blog/2026-08-23-speculative-decoding-amd-gpus`. Cifras
verificadas contra el texto del post, no contra un gráfico: 2.87× y 2.79×
para DFlash en MATH500/HumanEval (gemma-4-26B-A4B-it), 2.68× para DFlash en
Kimi-K2.5, 2.20× para MTP nativo en Qwen3.5-122B-A10B/MATH500 — todas frente
a decodificación sin especulación, no frente al draft+verify clásico.

## Lo que se dejó fuera, deliberadamente

- **"Towards a Science of AI Agent Reliability"** (arXiv 2602.16666):
  clasificado en la síntesis como Nivel 2 — hueco real pero de alcance
  grande, requiere una decisión de alcance para Empreinte antes de escribir
  nada (mismo patrón que abrió el Nivel 2 original de context-quality). No
  forma parte de este Nivel 1.
- **Nemotron 3 Nano**: clasificado como enriquecimiento opcional de baja
  prioridad (el patrón arquitectónico ya está cubierto genéricamente en
  "Hybrid Attention Patterns"); no se incluyó en esta ronda.

## Verificación

- Diff real contra `archivo/Comprender_la_IA_2026_v78.html`: 28 líneas de
  diferencia, 28 adiciones, 0 eliminaciones.
- Balance de 13 tipos de etiqueta sobre el archivo completo tras la edición
  (div, p, span, strong, em, a, code, ul, li, h2, h3, table, tr): las 13,
  open==close, cero desbalances.
- Verificación en navegador vía servidor HTTP estático local (puerto 8793):
  las tres cadenas de texto insertadas (CacheWeaver, LazyAttention, Mooncake,
  DFlash, DSpark, EAGLE-3, y los dos IDs de arXiv) confirmadas presentes en
  el DOM renderizado (`document.documentElement.outerHTML`); la inserción de
  §5.7d confirmada además legible/alcanzable en el árbol de accesibilidad
  (herramienta `find`); cero errores de consola.
- `<title>` y badge de la topbar actualizados de "v78" a "v79"; archivo
  renombrado de `Comprender_la_IA_2026_v78.html` a
  `Comprender_la_IA_2026_v79.html`.

## Alcance

Tres puntos de inserción, los tres extensiones de secciones ya existentes
(§15.4c ×2, §5.7d ×1) — ninguna sección nueva de nivel 2, a diferencia de
Self-RAG en v77→v78. Ninguna cifra ya presente en el manual se tocó sin
reverificar, ningún contenido se retiró, no se tocó ningún otro capítulo.
Item de Nivel 2 (AI Agent Reliability) queda pendiente de decisión de
alcance, ver arriba.
