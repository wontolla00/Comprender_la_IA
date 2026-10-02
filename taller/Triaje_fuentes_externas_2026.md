# Triaje de fuentes externas · log acumulado

*Abierto agosto 2026.*

Registro continuo de artículos, posts y papers evaluados como candidatos a
enriquecer o corregir el manual *Comprender la IA*, o a extender/corregir
Empreinte y HyperRAG. Cada entrada es un veredicto, no un resumen — el
objetivo es una traza de por qué algo entró, se descartó, o quedó en
observación, para no re-litigar la misma fuente dos veces ni perder el
razonamiento detrás de una decisión ya tomada.

Formato de entrada de este log, no del manual: aquí cabe una fuente débil
documentada como débil. Lo que pasa al manual, a Empreinte o a HyperRAG es
solo lo que supera el triaje; queda registrado en `Registro_manual_vNN.md`
(o equivalente) cuando se aplica.

---

## Pendientes abiertos — leer esto primero al retomar

*Actualizado 2026-08-20, veinticinco fuentes evaluadas hasta ahora.*

**Hecho (2026-08-20, segunda tanda del día).** Dos fuentes del mismo
publisher (Akshay Pachaar / DailyDoseOfDS.com) → manual §3.4/§3.4b, §5.5c,
Cap. 1 (Multi-LoRA serving), §8.8 (Semantic caching), §12.4c (Model
routing y cascading), ahora en **v70**. La primera ("How LLM Inference
Works" + infografía "7 LLM Generation Parameters") aportó la distinción
frequency/presence penalty y max_tokens/stop sequences, más una nota de
frontera sobre DeepSeek-V4 verificada contra el paper original
(arXiv:2606.19348). La segunda ("72 Techniques to Optimize LLMs in
Production") se cruzó término a término contra el manual completo: de 72,
18 ya cubiertas en profundidad, 10 de forma superficial, 44 ausentes — de
esas 44, solo 3 (semantic caching, multi-LoRA serving, model
routing/cascading) caían dentro del alcance ya declarado del manual y se
incorporaron; las 41 restantes son ingeniería interna de motores de
inferencia (paralelismo, kernels, scheduling de GPU) fuera de alcance por
diseño, no un descuido — detalle completo en el Log, entrada 2026-08-20
("72 Techniques"). Registro: `Registro_manual_v69_a_v70.md`.

**Hecho (2026-08-20).** "Claude's Watermark Isn't Live. Your Provenance
Debt Is." (post técnico sin firma, 19 ago. 2026) → manual §1.8/§4.7 +
corrección de Cap. 21/Cap. 4, ahora en **v69**. Tres afirmaciones de mayor
carga verificadas contra fuente primaria antes de incorporar (alcance del
marcado de Claude contra `anthropic.com/news/claude-text-watermark`,
sanción del Art. 50 contra fuentes legales independientes, radioactividad
del watermark contra el abstract de arXiv:2402.14904) — las tres exactas.
La verificación de la sanción destapó un error real preexistente en el
manual (Cap. 21 citaba el tope de GDPR, 20M€/4%, para una obligación del
AI Act que corresponde a 15M€/3%), corregido en la misma tanda. Registro
completo, con la incidencia de proceso (edición sin snapshot previo,
reparada reconstruyendo el v68 original) y su verificación:
`Registro_manual_v68_a_v69.md`, este mismo directorio.

Nada de lo que sigue está implementado salvo lo marcado como hecho. Ningún
candidato tiene prioridad fijada entre sí — el orden es el de aparición en
el log, no de importancia.

**Decisiones pendientes — solo quedan las de Empreinte/HyperRAG:**

1. **Empreinte** — desglose de latencia/tokens por fase
   (`embedding_latency_ms`/`retrieval_latency_ms`/`generation_latency_ms`)
   en `audit_sensor.py::record()`, hoy un único `latency_ms` agregado por
   turno. Fuente: Griciunas/tracing. Condicionado a verificar si
   `rag_engine.py` ya mide los tiempos por fase internamente.
2. **HyperRAG** — timing por capa (`bm25`/`vector`/`wiki`/`graph`/`tree`/
   `reranker`) en `search`/`query`, hoy ausente. Misma fuente. Anclado
   también en `docs/ARRANQUE.md` §8 y `docs/RETOMAR.md` §7 de HyperRAG,
   marcado ahí como "sin medir, sin decidir, no tocar sin discutirlo antes".
3. **Empreinte** — `retrieved_chunks: []` en vez de (o además de)
   `chunks_used` (conteo) en `audit_sensor.py`, para habilitar
   faithfulness/context precision sobre tráfico real. Fuente: Chunking
   Strategies for RAG / recomendación ya existente del propio manual
   (línea ~17002).
4. **HyperRAG** — verificación menor: confirmar si la separación
   `context_prefix`/`text` de `ContextualLLMStrategy` sobrevive hasta
   `cmd_query` y las citas generadas, o se remezcla sin etiqueta en algún
   punto posterior. No urgente, no es una brecha confirmada — es una
   pregunta abierta.
5. **HyperRAG (proceso, no contenido)** — la regla "Claude no ejecuta
   git" (`docs/ARRANQUE.md` §2.6) es tinta, no cemento. Convertirla en
   restricción de sistema (usuario aislado o token con alcance limitado)
   es una decisión del propietario del laboratorio — anotado aquí, no
   anclado en los documentos de HyperRAG, porque es higiene operativa, no
   una proposición de investigación.
6. **HyperRAG** — `hyperrag/core/llm_client.py:206-218`: `_send_audit_log()`
   registra `model=self.cfg.model` (el alias configurado), nunca
   `response.model` (lo que LiteLLM/el proveedor confirmó que sirvió
   realmente). Se propaga a Empreinte: `model_used` en `audit_sensor.py`
   (líneas 320/455) hereda ese mismo alias sin corregirlo en ningún punto
   intermedio. Fix pequeño, no toca el esquema — encontrado 2026-08-20
   investigando el candidato nº7, independiente del ángulo de
   watermarking que lo motivó. Ver Log, entrada 2026-08-20.
7. **HyperRAG** — `memo_finetune/memo_generate_reflections.py` genera
   pares QA sintéticos con dos modelos (`self.model` pesado,
   `self.fast_model` ligero, líneas 328-329) y los escribe a JSONL en
   `step1_extract`/`step3_verify`/`step4_entities` sin `source_model` ni
   `generated_at` por fila — 0% del corpus es hoy auditable por modelo
   antes de alimentar el fine-tuning real en Ollama (`memo_register.py`).
   Es el punto de aplicación literal del patrón "registra qué modelo
   generó cada fila" de la fuente watermark/Provenance Debt (ver Log,
   entrada 2026-08-20). Empreinte no tiene pipeline de fine-tuning — no
   hay dónde aplicar esto ahí.

**Descartado sin implementar:** BCMT (candidato nº12 de la priorización) —
evidencia insuficiente (escala de juguete, pérdida de calidad en casi
todas las pruebas propias, sin comparación a competidores reales, admitido
por el propio autor). Sigue como candidato a Apéndice D si en el futuro se
publica una versión a mayor escala con comparación real.

**Hecho:**

- Rundell/*The Guardian* → manual §20.3b, **v67**. Registro:
  `Registro_manual_v66_a_v67.md`. Nota-puente:
  `10_epigenetica/Rundell_y_las_tres_domesticaciones_nota_puente.md`.
- **Los 11 candidatos de manual restantes, aplicados juntos → manual
  §5.0/§5.7f/§6.10b/§6.11.4-5/§6.5a(ampliación)/§8.7b(refuerzo)/
  §10.10.3/§12.6(cita)/§13.15.1-2, ahora en v68** (2026-08-19, por orden
  de prioridad acordado con el usuario): leyes de escalado (Kaplan/
  Chinchilla), refuerzo empírico de §8.7b (Chakrabarti 2026), procedencia
  en la capa de ingesta (Die Zeit/NSDAP), contrato fail-to-pass (Tracely),
  taxonomía de memoria de agente (Kimi Agent Swarm, con cautela de
  atribución), caso de estudio de embeddings estáticos (Lattice), "tinta
  vs. cemento" para agentes de código (maibot), ampliación de la cita de
  Empty Shelves or Lost Keys, prerrequisito animado de tensores (idea del
  usuario), matiz de especulativa bajo carga concurrente, y cita opcional
  del Keystone Project en §12.6. Registro completo, con verificación de
  balance de etiquetas y confirmación de que el v67 archivado quedó
  idéntico al original: `Registro_manual_v67_a_v68.md`, este mismo
  directorio.

**Fuentes descartadas sin acción** (ver Log para el razonamiento
completo): las dos infografías de LinkedIn genéricas, el post de chunking
de Medium (salvo el hallazgo lateral #3 de arriba), y el "Complete Agentic
AI Cheatsheet" (no se anotó por instrucción explícita — ver conversación,
no queda entrada en este log).

---

## Metodología de triaje

Por cada fuente, cinco ejes:

1. **Credibilidad de la fuente** — autor/institución, ¿peer-review, preprint,
   o post de blog/vendor?, fecha, conflicto de interés (¿evalúa su propio
   producto?).
2. **Validez metodológica** — si aporta datos: tamaño de muestra,
   reproducibilidad, qué mide realmente frente a qué dice medir.
3. **Novedad real** — ¿ya cubierto en el manual (23 capítulos + apéndices) o
   en Empreinte/HyperRAG? ¿Contradice algo ya escrito? ¿Lo matiza?
4. **Caducidad** — contenido volátil (benchmarks, pricing, SOTA de modelo)
   va a Apéndice D si entra; no al cuerpo estable.
5. **Veredicto y destino**:
   - **Incorporar** — con sección/capítulo o módulo de destino concreto.
   - **Matizar/contrastar** — se cita para contrastar algo ya existente, sin
     reescribirlo.
   - **Observar** — interesante pero sin evidencia suficiente todavía; se
     anota y se espera corroboración.
   - **Descartar** — con motivo (fuente no fiable, ya cubierto, irrelevante,
     metodología inválida).

Etiquetas de destino: `[Manual §N]` · `[Empreinte: módulo]` ·
`[HyperRAG: componente]` · `[Apéndice D]` · `[Ninguno]`.

---

## Notas de verificación interna

*(no son triaje de fuente externa — son comprobaciones de coherencia
manual↔código disparadas durante el triaje, que vale la pena dejar
ancladas para no repetirlas)*

### 2026-08-19 — Silence rate: manual §13.9/§14.2b vs código

Disparada por la comprobación de la infografía "RAG Pipeline vs Good RAG
Pipeline" (ver Log más abajo), que trataba la abstención como buena
práctica de prompt. Se verificó si el concepto propio del manual (*silence
rate*, §13.9, elevado a regla arquitectónica en §14.2b) tiene
implementación real o es solo prosa.

**Resultado: implementado y en uso en ambos proyectos, no es solo teoría.**

- **HyperRAG (motor).** Vive en la capa de memoria episódica —
  [`hyperrag/memory_ops.py`](C:\Perso\Projects\HyperRAG\hyperrag\memory_ops.py),
  [`hyperrag/memory/write_policy.py`](C:\Perso\Projects\HyperRAG\hyperrag\memory\write_policy.py),
  [`hyperrag/memory/manager.py`](C:\Perso\Projects\HyperRAG\hyperrag\memory\manager.py),
  [`hyperrag/memory/store.py`](C:\Perso\Projects\HyperRAG\hyperrag\memory\store.py) —
  con test dedicado en `hyperrag/tests/test_memory_manager.py`. El README
  lo documenta bajo "memoria de la duda".
- **Empreinte (consumidor).**
  [`rag_engine.py:598`](C:\Perso\Projects\Empreinte\rag_engine.py:598)
  expone `get_silence_rate()` →
  `{"high_stakes_total", "silent", "silence_rate"}`: de las sesiones de
  alto riesgo cerradas, qué fracción nunca articuló qué se dudaba
  (`contested_assumption IS NULL`). Distingue `NULL` (nunca preguntado) de
  `""` (preguntado, sin duda real) — solo `NULL` cuenta como silencio.
  `high_stakes=False` no activa nada (no invasivo por defecto). Se muestra
  en la pestaña RAG Avanzado
  ([`pages/9_RAG_Avanzado.py:586-594`](C:\Perso\Projects\Empreinte\pages\9_RAG_Avanzado.py:586))
  como "Tasa de silencio", con alerta visual si `silence_rate > 0.5`.

**Conclusión.** Manual y código están alineados; no hay brecha que
corregir. Se ancla aquí para no re-auditar el mismo triángulo
(manual↔HyperRAG↔Empreinte) si una fuente externa futura toca abstención o
silence rate — la pregunta relevante en ese caso ya no es "¿existe?" sino
"¿esta fuente aporta algo que mejore la implementación ya descrita arriba?".

---

## Log

### 2026-08-20 — "72 Techniques to Optimize LLMs in Production" (infografía, DailyDoseOfDS.com)

**Fuente.** Infografía del mismo publisher que la entrada anterior
(Akshay Pachaar / DailyDoseOfDS.com). Género distinto: no es un artículo
con argumento, es un cuadro de mando — 72 nombres de técnica con una frase
descriptiva cada uno, agrupadas en 9 categorías (compresión de modelo,
atención/arquitectura, decodificación, caché KV, batching/scheduling,
paralelismo/kernels, caching de aplicación, forma de entrada/salida,
enrutado/coste). Sin datos, sin cita, sin comparación, sin "cuándo sí /
cuándo no" — no hay ninguna afirmación cuantitativa que verificar, a
diferencia de la entrada anterior del mismo autor.

**Método.** Comprobación de cobertura término a término contra el manual
completo (grep + sinónimo en español, verificación de profundidad con
contexto). Resultado: **18 cubiertas en profundidad** (INT8/INT4,
GGUF, destilación, FlashAttention, PagedAttention, MQA/GQA/MLA, sliding
window, MoE, decodificación especulativa, attention sinks, prompt
caching, structured output, RAG, fine-tuning, function calling), **10
cubiertas de forma superficial** (normalmente porque el manual usa otro
nombre para el mismo mecanismo — "moderación en cascada" en vez de
*model cascading*, "caché de prompts" en vez de *prefix caching*), **44
ausentes** sin resultado ni con sinónimo.

**El patrón que importa, no el número.** Casi todas las 44 ausencias caen
en dos categorías muy concretas: paralelismo de bajo nivel (tensor/
pipeline/expert/sequence parallelism, CUDA graphs, kernel fusion, torch
compile) y scheduling de infraestructura de serving (chunked prefill,
autoscaling, spot GPU, SLO-aware scheduling, request deduplication,
prefill-decode disaggregation). No es descuido — es exactamente el
territorio que el manual excluye por diseño, el mismo criterio que ya
aplicó este taller al descartar la tabla "vLLM vs. SGLang vs.
TensorRT-LLM" de una fuente anterior (entrada "Master LLM Inference",
2026-08-19): es la ingeniería interna de quien *construye* un motor de
inferencia, no de quien lo *usa* vía API u Ollama, que es la audiencia
declarada del manual.

**Lo que sí encajaba.** Tres candidatos, dentro del alcance ya declarado
(coste, arquitectura híbrida, RAG en producción): Model Routing/Model
Cascading por coste (#66-68), Semantic Caching (#53), Multi-LoRA Serving
(#13). Los otros 41 ausentes se listan abajo, con el motivo de exclusión.

**Veredicto: incorporar 3, descartar 41 por alcance de diseño.**
`[Manual: §3 candidatos → §5.5c/Cap.1/§8.8/§12.4c, ahora v70 — ver
Registro_manual_v69_a_v70.md]`

**Los 41 descartados por alcance** (ninguno es un hueco, todos caen fuera
del público declarado del manual — arquitectos/gobernanza/QA sobre
sistemas que consumen LLMs vía API u Ollama, no sobre quien construye el
motor de inferencia): FP8 Quantization, SmoothQuant, QAT, Mixed Precision,
Structured Pruning, Unstructured Pruning, RadixAttention, Early Exit,
Medusa, EAGLE, Lookahead Decoding, Prompt Lookup Decoding, Multi-Token
Prediction, KV Offload to CPU, KV Offload to Disk, KV Cache Quantization,
KV Cache Compression, Chunked Prefill, Dynamic Batching,
Prefill-Decode Disaggregation, SLO-Aware Scheduling, Autoscaling, Spot GPU
Scheduling, Request Deduplication, Tensor Parallelism, Pipeline
Parallelism, Expert Parallelism, Sequence Parallelism, CUDA Graphs,
Kernel Fusion, Torch Compile, Exact-Match Caching, Embedding Deflection,
Response Caching, Context Pruning, System Prompt Optimization, Response
Length Cap, Few-Shot Pruning, Context Distillation, Multi-Provider
Failover, QoS Tiers.

### 2026-08-20 — "How LLM Inference Works" (Akshay Pachaar, DailyDoseOfDS.com) + infografía "7 LLM Generation Parameters"

**Fuente.** Docx completo de Akshay Pachaar (@akshay_pachaar,
cofundador de DailyDoseOfDS.com) sobre tokenización, embeddings,
atención, prefill/decode, KV cache y cuantización, con una infografía
adjunta del mismo publisher sobre los siete parámetros de generación
(max_tokens, temperature, top_p, top_k, frequency/presence penalty, stop
sequences). Categoría de credibilidad distinta a las infografías
genéricas sin firma de este log: autor identificable con trayectoria
editorial real, no un post de fórmula.

**Verificación.** El único dato con fecha del artículo —la arquitectura
de atención híbrida de DeepSeek-V4 (~10% de tamaño de caché KV, ~27% de
cómputo por token frente a V3.2, en contexto de 1M)— se verificó contra
el paper original (arXiv:2606.19348) y cobertura técnica independiente:
exacto, con una simplificación menor (el artículo describe dos variantes
de atención comprimida cuando el esquema real combina tres, incluida una
ventana deslizante que el artículo no menciona).

**Novedad frente al manual — mixta, con un hueco real.**
Tokenización (BPE): el manual la cubre más a fondo, con laboratorio
interactivo y una fe de erratas propia ya corregida. Prefill/decode,
TTFT/ITL: §5.7d ya lo cubre con el mismo contenido más un concepto propio
("el precio de la sorpresa") y un caso real de fallo en producción que el
artículo no tiene. KV cache/GQA/MLA: el manual da cifras concretas de
reducción que el artículo no da. Generación (temperature/top-k/top-p):
el manual (§3.2-3.6) cubre esto y además no-determinismo residual, que
el artículo no menciona — pero agrupaba frequency y presence penalty bajo
un "repetition penalty" genérico, sin la distinción correcta que sí trae
la infografía, y no tenía max_tokens/stop sequences como controles
explícitos. **Hueco real y verificado**: la arquitectura de DeepSeek-V4,
que el manual solo nombraba en una tabla de benchmarks sin explicar.

**Veredicto: incorporar el hueco de DeepSeek-V4 y la distinción de
parámetros de generación; descartar el resto por redundancia con
contenido ya más profundo.**
`[Manual: §3.4/§3.4b (frequency/presence penalty, max_tokens, stop
sequences) + §5.5c (nota de frontera DeepSeek-V4), ahora v70 — ver
Registro_manual_v69_a_v70.md]`

### 2026-08-20 — Aplicabilidad a Empreinte/HyperRAG del código propuesto en "Claude's Watermark Isn't Live. Your Provenance Debt Is."

**Contexto.** La misma fuente incorporada al manual en v69 (§1.8/§4.7,
ver `Registro_manual_v68_a_v69.md`) trae dos patrones de código: un
generador de datos sintéticos que registra `source_model` (tomado de
`resp.model`, no del alias pedido) y `generated_at` por fila, y un script
`corpus_exposure_audit.py` que audita un corpus JSONL agrupándolo por
modelo/estado de marcado/formato. Se investigó si algo de esto es
aprovechable en los dos proyectos de laboratorio del autor.

**Empreinte — no aplica.** Es puramente un observador de interacciones de
producción (`audit_sensor.py::record()`/`log_interaction()`,
`rag_engine.py`); no existe pipeline de generación de datos sintéticos ni
de fine-tuning en el repo (grep de "fine-tun|RAFT|distill|synthetic|
training_data" solo golpea documentación que *describe* estos conceptos,
no código que los genere). El script de auditoría de corpus no tiene
corpus al que aplicarse.

**HyperRAG — encaje literal en `memo_finetune/`.**
`memo_generate_reflections.py` genera pares QA sintéticos con dos modelos
Ollama (`self.model` pesado, `self.fast_model` ligero, líneas 328-329),
escritos a JSONL en tres pasos (`step1_extract`, `step3_verify`,
`step4_entities`, líneas 355-402) **sin registrar cuál de los dos modelos
generó cada fila, ni cuándo** — antes de que ese corpus alimente un
fine-tuning real en Ollama (`memo_register.py`). Es exactamente el
"corpus no auditable" que el script del post señalaría: 0% de filas con
procedencia de modelo. Aquí la motivación no es watermarking (son modelos
locales) sino la misma disciplina que el propio manual exige en §4.7:
sin ese campo, nadie puede decidir después qué fracción del corpus vino
de qué modelo.

**Hallazgo lateral, independiente del watermarking.**
`hyperrag/core/llm_client.py:206-218` recibe de LiteLLM un objeto
`response` con `.model` (lo que el proveedor confirmó que sirvió), pero
`_send_audit_log()` (línea 218) registra `model=self.cfg.model` — el
alias configurado, nunca `response.model`. Es el mismo patrón que el post
señala para Claude ("registra lo que pediste, no lo que sirvió"), aquí en
Ollama/LiteLLM. Se propaga a Empreinte: `model_used` en `audit_sensor.py`
(líneas 320/455) hereda ese mismo alias sin corrección intermedia.

**Veredicto: diagnóstico completo, sin implementar por decisión
explícita del usuario ("nada por ahora, solo quería el diagnóstico").**
`[Empreinte: Ninguno — no hay pipeline al que aplicar el patrón]`
`[HyperRAG: dos candidatos concretos anclados en Pendientes abiertos
arriba (ítems 6 y 7) — fix de `response.model` en `llm_client.py`, y
`source_model`/`generated_at` en `memo_generate_reflections.py`]`

### 2026-08-19 — "The Evolution of RAG Architecture" (infografía LinkedIn)

**Fuente.** Sivasankar Natarajan (shiva.bytes), post/infografía de LinkedIn.
Bio genérica de consultoría ("Driving Smarter Outcomes with AI, Cloud &
Data."), sin afiliación institucional ni credencial de investigación
declarada. Sin citas, sin benchmark, sin cifras — solo un diagrama de
pipeline y afirmaciones cualitativas. Cierra con pregunta de enganche para
comentarios, patrón típico de contenido de marca personal en LinkedIn.

**Contenido.** Compara un pipeline "Classic RAG" (chunking → embedding →
similarity search → top-K → prompt → LLM) contra uno "Advanced RAG" (+
metadata enrichment en indexado, retrieval híbrido denso+disperso,
reranking, relevance filtering, context fusion, y answer synthesis en
generación). Recomienda orden de adopción: metadata filtering → hybrid
retrieval → reranking → relevance filtering.

**Credibilidad.** Baja como fuente primaria — es una síntesis divulgativa de
patrones de arquitectura RAG que son estándar de facto desde ~2023-2024
(retrieval híbrido denso+disperso, reranking, metadata filtering). Ninguna
afirmación lleva evidencia: "hybrid retrieval is the single biggest
upgrade" es una superlativa sin medir.

**Validez metodológica.** N/A — no aporta datos, es un diagrama de
conceptos ya consolidados.

**Novedad frente al manual.** Ninguna. §6 (búsqueda vectorial avanzada) y
§7 (diagnóstico y optimización RAG) ya cubren estos componentes con más
profundidad y con datos propios medidos — p. ej. §6.5a (v66) sobre el techo
del oráculo, que diagnostica un tercer tipo de fallo que este post ni
menciona. El post se queda en "qué componentes existen"; el manual ya está
en "cómo diagnosticar cuál está fallando y con qué evidencia".

**Comprobación en HyperRAG.** [hyperrag-engine/scripts/hyperrag_cli.py:39]
ya implementa seis capas configurables (`bm25, vector, wiki, graph, tree,
reranker`): el retrieval híbrido denso+disperso y el reranking que el post
presenta como "advanced" ya están en producción, con dos capas adicionales
(graph, tree) que el post ni contempla. El pipeline "avanzado" del post es,
en la práctica, más simple que lo ya implementado en este proyecto.

**Veredicto: Descartar.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]` — contenido introductorio, sin evidencia propia, por
debajo del estado actual tanto del manual como de HyperRAG. Se registra
para no reevaluar la misma fuente si reaparece.

### 2026-08-19 — "RAG Pipeline vs Good RAG Pipeline" (infografía sin atribuir)

**Fuente.** Infografía + texto de LinkedIn sin autoría visible en el propio
contenido (a diferencia de la entrada anterior). Mismo género que la fuente
del 2026-08-19 previa: comparación "básico vs bueno", sin cita, sin dato,
sin benchmark, cierre en máxima genérica ("Better RAG isn't about
retrieving MORE context. It's about retrieving the RIGHT context.").

**Contenido.** Añade respecto al post anterior: query understanding/query
rewriting, grounding & citas, abstención ("comfortable saying I don't have
enough information"), y evaluación con Recall@K, MRR, faithfulness,
relevance, citation accuracy.

**Credibilidad.** Baja, misma categoría que la entrada anterior — contenido
de fórmula ("basic vs good pipeline") que circula de forma casi idéntica
entre varias cuentas de LinkedIn. La ausencia de autoría aquí es en sí
misma una señal: no hay a quién atribuir la afirmación ni pedir cuentas por
ella.

**Validez metodológica.** N/A — sin datos propios.

**Novedad frente al manual — comprobación específica.** Los elementos que
sí eran nuevos respecto al post anterior ya están cubiertos, con más
profundidad y matices que el propio post:
- **Query rewriting/expansion** → Cap. 7: tabla comparativa de
  multi-query retrieval, HyDE y query expansion clásica, con recuadro de
  cuándo *no* ayuda y puede perjudicar (el post no menciona el caso
  negativo). También en glosario (`Expansión de consulta`, `HyDE`,
  `Multi-query retrieval`, `Step-back prompting`).
- **Grounding & citas** → cubierto como Faithfulness (RAGAS, Cap. 13.1),
  con laboratorio dedicado (falso grounding con Faithfulness alta por
  corpus obsoleto — un caso que el post no contempla).
- **Abstención** → §13.9 *Silence rate*, con benchmark orientativo e
  implementación mínima, y elevado a regla de arquitectura en §14.2b
  (regla del rechazo cero): "un sistema que nunca puede decir 'no sé' no
  está decidiendo". El post lo trata como buena práctica de prompt; el
  manual lo trata como métrica de gobernanza monitorizable y como
  propiedad arquitectónica.
- **Evaluación (Recall@K, MRR, faithfulness, etc.)** → Cap. 6.5/13, con la
  extensión propia del techo del oráculo (§6.5a, v66) que ninguno de los
  dos posts menciona.

**Comprobación en HyperRAG.** [hyperrag_cli.py:19-22,165-170] confirma un
`QueryTransformer` con flags `query_rewrite`, `query_multi`,
`query_decompose` — multi-query y descomposición de consulta ya
implementados y configurables (decompose ni aparece en el post). El comando
`query` ya ejecuta "retrieve, fuse, rerank, compress, and generate a cited
answer" — grounding con citas ya en producción, no es un "debería tener".

**Veredicto: Descartar.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]` — segunda pieza consecutiva del mismo género
("pipeline básico vs bueno"), sin autoría verificable, y cuyo contenido
completo ya está superado por el estado actual del manual y de HyperRAG.
**Nota de patrón:** si sigue llegando contenido de este género (infografías
"basic vs advanced RAG" sin cita ni dato), se puede descartar por
comparación directa con esta entrada sin repetir la comprobación completa
en HyperRAG, salvo que introduzca un concepto no listado aquí.

### 2026-08-19 — "AI System Observability: Tracing" (Aurimas Griciunas / SwirlAI)

**Fuente.** Aurimas Griciunas, autor de la newsletter SwirlAI
(newsletter.swirlai.com), practicante identificable con trayectoria pública
en LLMOps/MLOps — no un post de marca genérica. Categoría de credibilidad
distinta a las dos entradas anteriores: sin peer-review, pero con autoría
real y consistencia editorial verificable.

**Contenido.** Define orquestador/trace/span en un sistema RAG ingenuo
(vocabulario estándar derivado de OpenTelemetry, el mismo que usan
Langfuse/LangSmith/Arize). Traza un ejemplo paso a paso: query → embedding
(con conteo de tokens) → ANN lookup (con metadata de relevancia) → prompt →
LLM (con tokens in/out). Argumenta que la traza importa porque (1) los
fallos pueden ocurrir en cualquier paso de la cadena, (2) el coste varía
por paso y hay que preverlo, (3) los sistemas no deterministas se degradan
y hay que evaluar a nivel de span, no solo de input/output global.

**Credibilidad y validez.** Contenido técnicamente correcto y estándar de
la industria (terminología OTel aplicada a GenAI, tal como la usan las
herramientas de observabilidad de LLM ya listadas en el propio manual —
LangSmith, Helicone, Prompt flow). No aporta datos propios, es un explainer
conceptual, pero de un autor competente y sin errores detectables.

**Novedad frente al manual — hallazgo relevante.** El manual no solo cubre
esto, lo **supera y lo re-encuadra**: §12.6 (★ propuesta del autor)
distingue explícitamente **telemetría** (justo lo que describe este post:
traces, tokens, latencia, tool calls) de **observabilidad real**
(reconstrucción de *por qué* el sistema eligió ese camino), y lo dice sin
rodeos: *"La mayoría de equipos instrumentan sus sistemas con traces,
métricas y dashboards — y asumen que tienen observabilidad. No la tienen.
Tienen telemetría de ejecución."* El post de Griciunas es, con precisión,
un ejemplo de manual de esa **Capa ① — Observabilidad de ejecución** (de
las tres que define §12.6): necesaria, bien explicada, pero exactamente el
techo que el capítulo advierte que la mayoría confunde con el todo. No
llega a la Capa ② (qué alternativas existían y por qué se descartaron) ni
a la ③ (qué configuración hizo posible esa decisión) — ni al DecisionRecord
que el manual propone como artefacto auditable.

**Comprobación en Empreinte — gap real y accionable.**
[`audit_sensor.py::record()`, línea 264-330](C:\Perso\Projects\Empreinte\audit_sensor.py)
captura un único `latency_ms` y `tokens_in`/`tokens_out` **agregados por
turno completo** — no hay desglose por fase (embedding vs. retrieval vs.
generación). Es exactamente el nivel de granularidad que este post
argumenta que hace falta para diagnosticar *dónde* se atasca un pipeline o
se dispara el coste ("embedding taking longer than expected", "reached API
limits"). Hoy Empreinte no puede responder esa pregunta: solo ve el total
de la conversación.

**Comprobación en HyperRAG — mismo gap.** El motor ya tiene 6 capas
configurables (`bm25, vector, wiki, graph, tree, reranker`,
[hyperrag_cli.py:39](C:\Perso\Projects\HyperRAG\hyperrag-engine\scripts\hyperrag_cli.py:39))
pero no encontré timing por capa en `hyperrag_cli.py` (`elapsed`,
`duration_ms`, etc. — sin resultados). Con seis capas activas, saber cuál
tarda o cuál falla es más urgente aquí que en un RAG de una sola capa como
el del post.

**Veredicto: Matizar/incorporar parcialmente.**
- `[Manual: Ninguno obligatorio]` — §12.6 ya supera el contenido. Opcional,
  no urgente: una frase citando este post como ilustración real de "Capa ①
  confundida con observabilidad completa" reforzaría el argumento con un
  ejemplo externo verificable — decisión del autor, no autoaplicado aquí.
- `[Empreinte: audit_sensor.py — desglose de latencia/tokens por fase]`
  **candidato real de extensión.** Añadir campos aditivos (no rompen el
  esquema actual) tipo `embedding_latency_ms`, `retrieval_latency_ms`,
  `generation_latency_ms` — condicionado a que `rag_engine.py` ya mida
  estos tiempos internamente antes de llamar a `record()`; si no los mide,
  la extensión es de dos capas (instrumentar el pipeline + ampliar el
  esquema de log), no solo de logging.
- `[HyperRAG: instrumentación por capa]` **candidato de extensión**, mismo
  patrón — timing por capa (`bm25`/`vector`/`wiki`/`graph`/`tree`/`reranker`)
  en `search`/`query`, hoy ausente.

Pendiente de decisión del usuario: ¿implementar el desglose de
latencia/tokens por fase en Empreinte y/o por capa en HyperRAG, o dejarlo
en observación hasta acumular más señales de que hace falta?

**Armonización con los documentos de continuidad de HyperRAG (2026-08-19).**
HyperRAG se gobierna como laboratorio con disciplina propia
(`docs/ARRANQUE.md`, `docs/RETOMAR.md`, `docs/ESTADO_evaluacion_*.md`):
nada entra como "proposición asentada" sin una entrada de bitácora con
comando y fecha, y la cola de prioridades (`ARRANQUE.md §6.3`,
`RETOMAR.md §4`) es una decisión del propietario del laboratorio, no algo
que este triaje pueda alterar por su cuenta. Los dos candidatos de arriba
quedan anclados en la sección que ese repo ya reserva para dependencias
externas (`ARRANQUE.md §8` / `RETOMAR.md §7`, mismo sitio donde vive la
referencia a este manual), **no** en la cola de prioridades ni en el
dossier de medición — quedan explícitamente marcados ahí como "sin medir,
sin decidir, no tocar sin discutirlo antes", en su mismo registro. Así una
sesión que arranque en frío en HyperRAG los ve sin que se confundan con
algo ya decidido, y este log sigue siendo la fuente completa del
razonamiento detrás de ambos.

### 2026-08-19 — "Chunking Strategies for RAG" (Renatagotler, Medium)

**Fuente.** Post de Medium, autora sin credencial ni institución
identificable en el propio texto. Sin citas a estudios ni benchmarks
propios — es un artículo explicativo/listicle: fixed-size, overlapping,
recursivo, semántico, language-aware (código/HTML/markdown), metadata-aware
y parent-child, cerrando con la recomendación de evaluar empíricamente con
Precision@K/Recall@K/MRR/NDCG + faithfulness/latencia. Misma categoría de
credibilidad que las dos infografías (baja, sin verificación posible), pero
en prosa más extensa y sin errores técnicos detectables.

**Validez.** Taxonomía correcta y estándar — es la misma que documentan
LangChain/LlamaIndex desde 2023. Cero datos propios; todos los ejemplos son
ilustrativos (política de reembolso, `def authenticate()`).

**Novedad frente al manual.** Ninguna, y en un punto el manual va más
lejos: cubre *late chunking* (arXiv 2409.04701, `jina-ai/late-chunking` —
invierte el orden, embebe el documento entero y agrupa vectores de token
*después*), técnica de 2024 que este artículo de 2026 ni menciona. También
cubre chunking jerárquico parent-child con el mismo nombre y mecanismo
(línea ~11469), y explica el coste del chunking semántico con más
precisión que el post (el coste es la llamada al embedding en indexación
para detectar fronteras, no el tamaño de los chunks). Único hueco real:
chunking de código vía AST/límites de función — no aparece en el manual;
menor, estándar en LangChain, no urgente para un manual orientado a
producción más que a herramientas de desarrollador.

**El hallazgo que sí importa: contraste empírico con el propio laboratorio
HyperRAG.** La tesis central del artículo — *"in many production RAG
systems retrieval quality depends more on chunking strategy than model
size"*, *"thoughtful chunking often delivers larger gains than switching to
a more powerful LLM"* — es exactamente la hipótesis que F1/F2/F3
(`docs/ARRANQUE.md` §7, dossier §9) sometieron a prueba tres veces sobre un
corpus real, y la refutaron cada vez como causa dominante: *"El troceado no
puede ser la causa de un fallo cuando el chunk correcto se recupera
siempre. Los ~42 puntos se pierden después de recuperar y antes de
responder."* En ese laboratorio, lo que de verdad costó puntos fue el
compresor de contexto por defecto (**37 puntos**, R3) y el parámetro `k`
(**11,8 puntos**, A9/P8) — el chunking, medido tres veces, no. Esto no
invalida el artículo en general (el propio manual tiene un laboratorio de
Cap. 13 donde el chunking sí rompe algo, con contratos legales trinchados
por artículo), pero sí desmonta la generalización sin matices del post: la
pregunta correcta no es «¿importa el chunking?» sino «¿es tu chunking la
causa medida, o la sospechosa de siempre porque es la más fácil de
señalar?». HyperRAG es exactamente el contraejemplo verificable que le
faltaría citar a un artículo así.

**Hallazgo lateral en Empreinte, no del artículo sino del propio manual.**
Revisando la sección de chunking del manual encontré esta recomendación
(línea ~17002, sobre faithfulness computable sin anotación humana): añadir
un campo `retrieved_chunks: []` al log de interacciones para poder calcular
faithfulness y context precision sobre tráfico real. `audit_sensor.py`
[líneas 271, 330, 372, 465](C:\Perso\Projects\Empreinte\audit_sensor.py)
ya tiene `chunks_used`, pero es un **conteo entero**, no el contenido/ID de
los chunks recuperados — no permite ese cálculo hoy. Tercer candidato de
instrumentación para Empreinte, además de los dos ya anotados.

**Veredicto: Descartar como fuente de contenido nuevo, conservar como
contraste citable.**
`[Manual: Ninguno obligatorio — opcional citar HyperRAG F1/F2/F3 como
contraejemplo real a la generalización "chunking > modelo" en Cap. 1 o
Cap. 7]`
`[Empreinte: candidato #3 — retrieved_chunks[] en audit_sensor.py, en vez
de (o además de) chunks_used, para habilitar faithfulness/context
precision sobre tráfico real sin anotación humana, tal como recomienda el
propio manual]`
`[HyperRAG: Ninguno — el hallazgo relevante es que su propio dossier ya
refuta la tesis del artículo, no que le falte algo]`

**Nota.** El candidato #3 de Empreinte (`retrieved_chunks[]`) no se ancló
en los documentos de HyperRAG porque no depende de ese repo — vive
únicamente en el triaje hasta que se decida.

### 2026-08-19 — "Lattice static retriever fits in 8 MB. Know what it forgets" (Musthave.AI)

**Fuente.** Abdessalam Alaoui, fundador de Musthave.AI (9 ago. 2026). Blog
de empresa, no papel académico — pero de categoría claramente distinta a
las cuatro entradas anteriores: **reproduce el artefacto localmente** antes
de escribir, y separa explícitamente en una tabla qué verificó él mismo
("Reproduced": carga del checkpoint, forma del embedding, normalización,
generación del artefacto int4 de 7,94 MB) de qué solo cita del autor
("Author-reported": el benchmark de velocidad sobre Wikipedia completa).
Cita el commit exacto del repo (`fe4b29d`) y el JSON de evaluación
versionado. Sesgo de interés real pero declarado: enlaza contenido propio
de Musthave.AI ("our model selection framework"), es marketing de
contenido técnico, no neutral — pero el método es serio y auditable.

**Contenido.** *Lattice* (`erikkaum/lattice-retrieval`): en vez de un
transformer con atención, usa una tabla de embeddings 30.522×1.024
aprendida (una fila por token), sin capa de atención — tokeniza,
recupera filas, aplica *mean pooling* y normaliza L2. Artefacto de
despliegue: 512 dim + cuantización int4-row = **7,94 MB**. Entrenado sobre
~660M pares consulta-documento + fine-tuning con negativos duros. Pérdida
de calidad frente al modelo completo: 0,4749 → 0,4697 NDCG@10 (BEIR de 12
tareas, -1,1% relativo) — el propio autor advierte que esa cifra mezcla
reducción de dimensión y cuantización, no es "penalización de
cuantización pura". Limitación explícita: al hacer *mean pooling* sin
atención, pierde orden de palabras, polisemia y composicionalidad
("el perro muerde al hombre" ≈ "el hombre muerde al perro" en el vector).
Solo inglés — cobertura multilingüe no verificada.

**Validez metodológica.** Alta para el género. Reproduce en vez de repetir,
distingue medición propia de cita, y advierte activamente contra la
comparación ingenua ("different hardware, warm-up, batching... would make
a direct comparison misleading"). El benchmark de velocidad (6,4M
artículos en 7m26s) queda correctamente marcado como no reproducido.

**Novedad frente al manual — hueco real.** El manual solo menciona
"embedding estático" una vez (línea 5970), como concepto histórico
pre-transformer para explicar por qué se abandonó (polisemia sin resolver:
"voy al banco" con vector fijo). No cubre el resurgimiento deliberado de
2026: embeddings estáticos **entrenados a gran escala específicamente para
retrieval** (no word2vec genérico) y usados como **primera etapa barata**
dentro de un pipeline de dos etapas — exactamente el patrón que Cap. 6/7 sí
cubre para otras técnicas (reranking en cascada) pero no para esta. No hay
mención de retrieval on-device/offline/CPU-only como caso de uso con
trade-off propio.

**Relevancia para Empreinte — con matiz que descarta uso inmediato.** La
filosofía de Empreinte (Ollama, modelos locales, minimizar dependencia de
APIs cloud por coste y privacidad — ver §6.10 del manual, "viabilidad con
modelos locales") hace que un retriever de 8 MB, CPU-only, sin llamada
externa, encaje en el mismo eje de valor. Pero el propio artículo declara
cobertura **solo en inglés**, y no hay evidencia de variante multilingüe.
Dado que Empreinte y HyperRAG operan en corpus multilingües (fr/en/es),
esto no es adoptable hoy sin verificar — es candidato a **observar**, no a
incorporar.

**Relevancia para HyperRAG — descartado por ahora, con motivo específico.**
El propio dossier (P10/P11) ya estableció que **los fallos de recuperación
de HyperRAG se concentran en la banda de bajo solape léxico y en francés**
— justo el terreno donde un modelo *inglés-only* sin atención y sin
capacidad de resolver polisemia rendiría peor, no mejor. Además HyperRAG
es "un laboratorio... no tiene usuarios" (`ARRANQUE.md` §1): no hay
restricción de memoria/CPU de producción que un artefacto de 8 MB venga a
resolver. No hay caso de uso hoy.

**Veredicto: Observar / candidato a incorporar en el manual.**
`[Manual: candidato — Cap. 6, caso de estudio "el resurgir deliberado de
los embeddings estáticos": por qué se abandonaron (Cap. 0) y por qué
vuelven con los ojos abiertos como primera etapa barata en pipelines de
dos etapas, con la cifra de coste (-1,1% NDCG@10 combinando dimensión +
cuantización) y el límite explícito (orden de palabras, polisemia,
solo inglés)]`
`[Empreinte: Observar — encaja en la filosofía "local primero", pero
bloqueado por cobertura solo-inglés hasta verificar alternativa
multilingüe; no implementar sin esa verificación]`
`[HyperRAG: Ninguno — su propio hallazgo P10/P11 (fallos concentrados en
francés y bajo solape léxico) es precisamente el escenario donde esta
técnica es más débil, y el proyecto no tiene restricción de producción que
la justifique]`

### 2026-08-19 — "I hate what AI is doing to the minds and happiness of the young" (Katherine Rundell, The Guardian)

**Fuente.** The Guardian, 8 ago. 2026, sección Comment/Opinion. Autora
identificable y con autoridad real en la materia — escritora infantil,
fellow de Oxford, trabaja directamente con jóvenes — pero es **ensayo de
opinión explícitamente polémico** ("if you set out to design a tool for
authoritarian rule, it would look exactly like AI"), no reportaje ni
investigación. Categoría de credibilidad distinta a todo lo anterior:
plataforma y autora de primer nivel, registro persuasivo, no neutral.

**Contenido.** Argumenta que la IA generativa daña la capacidad cognitiva y
la libertad intelectual de niños y estudiantes: cita un "estudio del MIT"
sobre menor actividad cerebral con IA, un estudio no identificado sobre
persistencia tras "10 minutes of AI-assisted problem-solving", el caso de
suicidio de Sewell Setzer III, y los giros regulatorios de Suecia/Noruega
contra la tecnología en el aula. Concluye pidiendo volver a la lectura y la
escritura sin asistencia como forma de resistencia intelectual.

**Relevancia y alcance.** El manual es un manual para profesionales que
construyen y gobiernan sistemas de IA (ingenieros, compliance, dirigentes),
no un texto de política educativa K-12/universitaria. La discusión sobre
currículo escolar, Suecia/Noruega o el caso Setzer está fuera de alcance
por diseño — no es un hueco, es una audiencia distinta.

**El hallazgo que sí importa: el manual ya trata el mismo estudio, con más
rigor.** El "estudio del MIT" que Rundell cita como hallazgo asentado
("lowest brain activity", "consistently underperformed at neural,
linguistic, and behavioural levels") es, casi con certeza, **Kosmyna et
al., MIT, preprint arXiv 2506.08872 (2025)** — el mismo que el manual ya
trata en detalle en §20.3, con un recuadro de advertencia explícito:
*"Este estudio circula en algunos materiales del sector con la cifra
específica de 'reducción del 55% de la conectividad fronto-parietal'... el
trabajo está como preprint sin revisión por pares completada y sin
replicación independiente. **No lo cites como hecho establecido.**"* El
artículo de Rundell hace exactamente lo que el manual advierte que no se
haga: presenta el hallazgo preliminar como prueba consumada, sin mencionar
que es un preprint de muestra pequeña sin réplica. Es un ejemplo real,
fechado y verificable (prensa de calidad, agosto 2026) de la distorsión
que §20.3 anticipa.

Además, §20.3 ya cita **tres** estudios convergentes con más matiz que el
artículo — Klopfer et al. (MIT/CACM 2024, retención en programación),
Lee et al. (Microsoft Research/CMU 2025, pensamiento crítico) y el propio
Kosmyna et al. — y advierte explícitamente contra la cifra del 55% que
"circula popularmente". El artículo de Rundell no menciona ninguno de los
otros dos ni las limitaciones de tamaño de muestra o auto-selección que el
manual sí discute (Lee et al.: "correlación no es causalidad... puede
deberse en parte a auto-selección").

**Conexión interna, sin brecha.** El concepto propio del manual más
cercano —§13.10 "Vibe coding y deuda de comprensión"— está ya cubierto en
código y práctica de desarrollo, pero acotado a programadores. §20.3
(delegación cognitiva) es el capítulo que sí cubre el caso general
(escritura, aprendizaje) que plantea Rundell, y ya lo hace con precedente
metodológico (GPS y memoria espacial, Dahmani & Bohbot 2020) y con más
estudios que el propio artículo.

**Veredicto original: Descartar como fuente de contenido nuevo — el manual
ya cubre esto con más rigor. Opcionalmente citable como ejemplo de mala
práctica.**
`[Manual: Ninguno obligatorio — candidato opcional en §20.3: una frase
citando este artículo (Rundell, The Guardian, ago. 2026) como caso real de
prensa seria repitiendo la cifra del 55% de Kosmyna et al. sin el matiz de
preprint/sin réplica, justo el patrón que el recuadro de advertencia de
§20.3 ya anticipa — refuerza el argumento del manual con un ejemplo fechado,
no añade contenido técnico]`
`[Empreinte: Ninguno — fuera de alcance, no es un sistema de IA en
educación]`
`[HyperRAG: Ninguno — no aplica, no es contenido de RAG/retrieval]`

**Actualización 2026-08-19 — incorporado.** El usuario pidió cruzar esta
fuente contra el corpus literario de la Obra Completa antes de decidir. El
cruce (con *Beyond the Covenant*, 01_Ciclo_Covenant, y sobre todo con
*Tres domesticaciones*, 10_epigenetica) resultó más sustancial de lo
previsto — no solo confirma el recuadro de §20.3, añade una complicación
empírica real (Dell'Acqua et al., el "filo irregular") a un argumento del
propio artículo de Rundell (Suecia/Noruega, a quién protege restringir la
IA). Se incorporó como §20.3b, manual ahora en **v67**. Registro completo
del parche: `Registro_manual_v66_a_v67.md`, este mismo directorio. Análisis
completo de sinergias/contradicciones: nota-puente
`10_epigenetica/Rundell_y_las_tres_domesticaciones_nota_puente.md`.
`[Manual: §20.3b, v67 — hecho]`

### 2026-08-19 — "Extracting Truth from 16 Million Pages" (Armin Maddah, LinkedIn, sobre GIJN/Die Zeit)

**Fuente.** Armin Maddah (Data Scientist), post de LinkedIn que analiza una
entrevista real de GIJN (Global Investigative Journalism Network) a Gregor
Aisch y Andreas Loos, del desk de datos e IA de *Die Zeit*, sobre el
pipeline que digitalizó 16 millones de páginas de fichas de afiliación al
NSDAP. Categoría de credibilidad alta: el análisis es secundario, pero la
fuente primaria (entrevista GIJN, base de datos pública de Die Zeit) es
verificable, con nombres, institución y un artefacto público real —no una
infografía genérica. Maddah distingue explícitamente lo que la entrevista
dice de lo que él especula ("The article does not describe how those
models were coordinated, but it raises an interesting architecture
question").

**Contenido.** 5.442 PDFs, ~3.000 páginas cada uno, ~16M páginas. OCR con
varios sistemas + Gemini para manuscrito. Normalización de nombres/fechas/
lugares producidos por oficinas distintas durante dos décadas, con
resolución de entidades y deduplicación. El punto central: el LLM a veces
no transcribe, **interpreta** — una ficha con la abreviatura "D." puede
devolver "Düsseldorf". Interpretación plausible, pero es información que
no estaba literalmente en el documento fuente, y si se guarda como si lo
estuviera, ni un sistema aguas abajo ni un lector pueden distinguir después
qué vino del archivo y qué vino del modelo.

**Validez.** Alta para el género — hechos concretos y verificables (cifras,
nombres, artefacto público), sin benchmark propio pero sin necesitarlo:
es relato de ingeniería en producción, no una afirmación estadística.

**Novedad frente al manual — hueco real, distinto de lo ya cubierto.** El
manual tiene un hilo de procedencia bien desarrollado (§4.7b, §8.7b,
§10.9.6, §13.15) pero todo él vive en la capa de **evaluación** (el arnés
que no distingue qué se aproximó) o de **uso individual** (línea ~19894:
protocolo para que una persona distinga, en su propio trabajo con IA, qué
verificó de qué es inferencia del modelo). El caso Die Zeit es distinto:
es procedencia en la **capa de ingesta/indexación** — un pipeline que debe
decidir, estructuralmente, si el texto "extraído" y el texto "interpretado
por el modelo" viven en el mismo campo o en campos distintos, antes de que
nadie evalúe nada. También hay un caso "OCR Poisoning" en Cap. 21, pero es
un vector de seguridad (texto malicioso oculto en imagen), no este
problema — que es benigno en intención y dañino por conflación silenciosa.
Es una capa del problema de procedencia que el manual no cubre todavía.

**Comprobación en HyperRAG — no es un hueco, es una confirmación.**
Fui a comprobar si `ContextualLLMStrategy`
([hyperrag/core/chunking/strategies.py:197-271](C:\Perso\Projects\HyperRAG\hyperrag\core\chunking\strategies.py))
—que genera 1-2 frases de contexto vía LLM para situar cada chunk, el
mismo patrón "contextual retrieval" de Anthropic 2024— tenía el mismo
problema: mezclar la interpretación del LLM con el texto literal sin
etiqueta. **No lo tiene.** El prefijo generado por el LLM se usa solo para
`embed_text` (línea 265: `d.embed_text = f"{prefix}\n{d.text}"`), y se
guarda además, por separado y explícitamente etiquetado, en
`d.extra_meta["context_prefix"]` (línea 267) — `d.text`, el chunk literal,
no se toca. Es exactamente la separación extracción/interpretación que el
caso Die Zeit pide. **Sin verificar:** si esa separación sobrevive aguas
abajo, hasta la generación y las citas del comando `query` — no confirmado
en esta pasada.

**Veredicto: Incorporar (manual) / Confirmar sin acción (HyperRAG) /
No aplica (Empreinte).**
`[Manual: candidato — extensión al hilo de procedencia existente
(§4.7b/§13.15) o nueva entrada en Cap. 1/Cap. 6 sobre calidad de fuente:
caso real Die Zeit/NSDAP como ejemplo de alto riesgo (identidad de
personas reales, archivos históricos) de por qué "extraído" e
"interpretado por el modelo" necesitan campos distintos en el esquema de
datos, no solo disciplina de prompt — con el patrón de
`ContextualLLMStrategy` de HyperRAG como contraejemplo positivo de cómo
hacerlo bien]`
`[Empreinte: Ninguno — no hace ingesta de documentos escaneados/OCR]`
`[HyperRAG: Ninguno que corregir — `context_prefix` ya separado de `text`;
candidato a verificación futura de si la separación sobrevive hasta
`cmd_query` y las citas generadas, no urgente]`

### 2026-08-19 — "Master LLM Inference: A Step-by-Step Roadmap" (Sivasankar Natarajan, LinkedIn)

**Fuente.** Mismo autor que la primera entrada de este log (shiva.bytes,
bio genérica de consultoría), esta vez sobre mecánica de inferencia
(prefill/decode, transformer, hardware, optimización, serving) en vez de
arquitectura RAG. Mismo patrón: infografía sin cita, sin dato propio, sin
benchmark — cinco cajas conceptuales (prefill/decode, self-attention,
hardware SM/SRAM/HBM, optimizaciones, motores de serving).

**Contenido.** Prefill (cómputo, paralelo, construye KV cache) vs. decode
(memoria, secuencial, lo reutiliza) como respuesta a por qué el primer
token tarda y el resto es rápido. KV cache, batching/continuous batching,
FlashAttention, cuantización, decodificación especulativa, prompt
caching/chunked prefill. Motores: vLLM, SGLang, TensorRT-LLM, llama.cpp.

**Credibilidad y validez.** Igual que la primera entrada de este autor:
baja, sin evidencia propia, contenido de fórmula para LinkedIn.

**Novedad frente al manual — ninguna, y la brecha de profundidad es mayor
que la vez anterior.** §5.7d ("La economía física de la inferencia:
prefill, decode y el ancho de banda") cubre exactamente esta distinción
—cómputo vs. ancho de banda de memoria— y la conecta explícitamente con
por qué el chunking y el retrieval existen como disciplina (cruce con
§1.4), algo que la infografía no intenta. Añade un concepto propio que la
infografía ni roza: **"el precio de la sorpresa"** — la decodificación
especulativa es *sin pérdida* pero su velocidad depende de la tasa de
aceptación del borrador, que es más alta cuanto más predecible es el
texto; consecuencia, el texto predecible se genera más barato, y esa
señal de precio es medible en producción (tasas de aceptación logueadas).
§5.7e cubre hardware con una tabla de cinco categorías (CPU/GPU/TPU/NPU/
LPU) con tradeoffs y dónde brilla cada una, frente a las tres cajas
genéricas SM/SRAM/HBM de la infografía, y añade una nota de frontera
—prefill/decode servidos desde pools de hardware separados, hasta 14× de
mejora en TTFT documentada— que es más avanzada que cualquier cosa en el
post. El KV cache está tratado con más profundidad: MLA y GQA (reducción
5-13× y 4-8× respectivamente), que la infografía no menciona en absoluto.
Y donde el post dice "llama.cpp for local and CPU" en una línea, el
manual tiene un caso de fallo real en producción (línea ~14821: colapso
por CUDA OOM a partir de la undécima petición concurrente).

**Único hueco menor.** No hay una tabla única "cuándo elegir vLLM vs.
SGLang vs. TensorRT-LLM vs. llama.cpp" — pero es exactamente el tipo de
contenido de alta caducidad (nombres de herramientas, no mecanismos) que
el manual reserva deliberadamente fuera del cuerpo estable, y los
mecanismos que cada motor implementa (continuous batching, PagedAttention,
FlashAttention, cuantización, decodificación especulativa) ya están
cubiertos individualmente y con más rigor.

**Comprobación en Empreinte/HyperRAG.** No aplica — ninguno de los dos
proyectos opera su propio servidor de inferencia (consumen LLMs vía
Ollama/APIs), así que la mecánica de prefill/decode/serving no es una
capa que construyan ellos mismos.

**Veredicto: Descartar.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]` — mismo autor, mismo patrón de la primera entrada
de este log, y esta vez el manual no solo iguala sino que supera con un
concepto propio (el precio de la sorpresa) y con un caso de fallo real
que la infografía no tiene ni en germen. **Nota de patrón, extendida:**
este autor produce infografías de fórmula sobre temas de IA/LLM distintos
cada pocos días; el patrón de descarte por comparación directa (ya
establecido para el género "basic vs advanced RAG") se extiende ahora
también a su serie sobre mecánica de inferencia — futuras piezas del
mismo autor sobre estos dos temas pueden triarse contra las entradas
correspondientes de este log sin repetir la comprobación completa, salvo
que aporten una cifra o cita propia que no tuvieran antes.

### 2026-08-19 — "Speculative Decoding" (dimplesharma21, LinkedIn)

**Fuente.** Infografía de LinkedIn (@dimplesharma21), sin bio ni afiliación
visible en el propio contenido. Sin cita a los papers originales
(Leviathan et al. 2023, Chen et al. / DeepMind 2023) ni dato propio — pero
de ejecución notablemente más cuidada que las infografías genéricas
anteriores de este log: un ejemplo trabajado con K=5, contando pases
exactos y mostrando accept/reject/resample paso a paso, no solo el
diagrama de cajas habitual.

**Contenido.** Por qué la generación autoregresiva es secuencial (100
tokens = 100 pases) pero verificar es paralelo (comprobar 10 tokens cuesta
lo mismo que generar 1). Draft model propone K tokens, target los verifica
en un pase; primer rechazo corta el bloque y se resamplea desde ahí. La
calidad no baja porque el target decide, el draft solo propone — salida
estadísticamente idéntica. Y el punto más fino: la técnica compra latencia
con cómputo — gana en una GPU con capacidad libre (un usuario esperando en
streaming), pierde en un servidor saturado, donde el throughput medido
puede *caer*. "The win is latency, not throughput."

**Credibilidad y validez.** Sin evidencia propia ni cita, pero técnicamente
correcto en todo lo que afirma — incluido el matiz final, que es más fino
que el de la mayoría de explicaciones divulgativas del tema.

**Novedad frente al manual — cubierto en casi todo, con un matiz real que
falta.** §5.7d ya tiene inferencia especulativa con más profundidad:
diagrama draft(1.5B)/verifier(70B) con velocidad efectiva 1.5-3×, caja
"cuándo funciona bien / cuándo aporta menos" (rechazo alto → el overhead
supera el beneficio; VRAM de dos modelos cargados a la vez), entrada de
glosario, y el concepto propio **"el precio de la sorpresa"** — que el
texto predecible se genera más barato porque la tasa de aceptación es más
alta, con esa señal de precio medible en producción — que esta infografía
ni menciona y es más sofisticado que su propio argumento. Pero el matiz
concreto de *throughput vs. latencia bajo saturación de servidor* —que
gastar cómputo extra en verificar especulaciones compite por el mismo
cómputo que atender más peticiones concurrentes bajo continuous batching,
así que la técnica puede mejorar la latencia de un usuario y a la vez
reducir el throughput agregado del servidor— **no está** en §5.7d ni en
ningún otro punto del documento (comprobado). Es un matiz real, específico,
y verificable independientemente en la literatura de serving (es la misma
tensión que motiva el desagregado prefill/decode que sí menciona §5.7e).

**Comprobación en Empreinte/HyperRAG.** No aplica directamente — ninguno
de los dos proyectos implementa su propio motor de decodificación
especulativa (consumen LLMs vía Ollama/APIs, no construyen el serving).

**Veredicto: Matizar — incorporación menor y acotada.**
`[Manual: candidato pequeño — añadir una frase a la caja "cuándo aporta
menos" de §5.7d: bajo carga concurrente con continuous batching, el
cómputo extra de verificación compite con el de servir más peticiones, así
que la ganancia de la técnica es de latencia por usuario, no
necesariamente de throughput agregado del servidor — matiz que ni esta
fuente ni el manual tenían conectado con continuous batching hasta ahora]`
`[Empreinte: Ninguno]` `[HyperRAG: Ninguno]`

### 2026-08-19 — "6 Concepts Mathématiques Pour Mieux Comprendre l'IA" (François Giltaire)

**Fuente.** Nota manuscrita/infografía en francés, francoisgiltaire.com,
con gancho promocional al final ("100 énigmes mathématiques... sur
francoisgiltaire.com") — mismo patrón de embudo que otras fuentes de este
log, pero aplicado a divulgación matemática, no a arquitectura de IA.

**Contenido.** Vector (representación numérica de palabras/imágenes/
sonido), distancia |AB|, producto escalar (fórmula correcta:
OA·OB = ‖OA‖‖OB‖cos θ, con la lectura correcta de que ángulo menor implica
mayor similitud), función como f(x)=ax+b de juguete, derivada con su
definición de límite correcta, y un árbol de probabilidad de dos niveles
cuyas cuatro ramas suman 100% correctamente (56,25+18,75+12,5+12,5).

**Validez.** Matemáticamente correcto en todo lo verificable — no hay
error que señalar. No requiere evidencia empírica porque no hace ninguna
afirmación sobre sistemas, solo explica matemática de base.

**Novedad frente al manual — no es un hueco, es una audiencia distinta.**
El manual usa estos conceptos constantemente (embeddings, similitud
coseno, descenso de gradiente implícito en el ajuste de parámetros,
softmax/probabilidad en la capa de salida) pero **los asume como
conocimiento previo** en todos sus perfiles de lectura declarados —
incluido "BI/datos en transición", que ya presupone alfabetización
cuantitativa. Este contenido explica el nivel *anterior* a ese punto de
partida (qué es un vector, qué es una derivada, desde cero). No es que el
manual lo cubra peor: es que está calibrado para un lector que ya no
necesita esta explicación. Incorporarlo sería un desajuste de altitud, no
un enriquecimiento — bajaría el nivel del capítulo 0 en vez de reforzarlo.

**Comprobación en Empreinte/HyperRAG.** No aplica — no hace ninguna
afirmación sobre RAG, retrieval, arquitectura o sistemas; es prerrequisito
matemático puro.

**Veredicto: Descartar por audiencia, no por calidad.** `[Manual: Ninguno]`
`[Empreinte: Ninguno]` `[HyperRAG: Ninguno]` — contenido correcto y bien
ejecutado para su público (introducción general, no técnica), pero por
debajo del punto de partida que el manual asume en todos sus perfiles de
lectura. Sería relevante solo si en algún momento se decidiera crear un
apéndice de prerrequisitos matemáticos para lectores sin formación
cuantitativa previa — eso es una decisión de alcance editorial, no un
hallazgo de esta fuente.

**Actualización 2026-08-19.** El usuario recogió la idea de fondo —no
esta fuente en concreto— como candidato propio: ver pendiente #12 del
panel de arriba (tensores explicados con imagen animada, y posible
generalización a otros prerrequisitos como este).

### 2026-08-19 — "Your AI Coding Agent Is You... And That's the Problem" (dev.to)

**Fuente.** Post técnico de dev.to, relato en primera persona de una
implementación real y propia (no genérica): usuario Linux aislado
(`maibot`), GitHub App con permisos exactos listados
(`contents:write`, `pull_requests:write`, `metadata:read`), intercambio
JWT→token de instalación con expiración de una hora, dos sesiones
Remote-SSH/WSL2 separadas (`wsl-colomr` para el desarrollador,
`wsl-maibot` para el agente). Especificidad alta — no es un post
conceptual, es una configuración que se puede reproducir literalmente.

**Contenido.** Un agente de código corriendo dentro de la sesión de un
desarrollador no se autentica como sí mismo: hereda las claves SSH, el
`git config`, la sesión de `gh` del desarrollador. Si el desarrollador es
admin de la organización, el agente opera como admin — y los rulesets de
GitHub eximen a los admins por defecto. El push a `main` no rompió ninguna
regla: la regla nunca llegó a aplicarse. Distinción central: un
`RULES.md` que dice "nunca hagas push a main" es **tinta** (probabilístico,
el modelo lo interpreta); una restricción a nivel de sistema que bloquea
el push antes de que ocurra es **cemento** (sin excepciones).

**Credibilidad y validez.** Alta para el género — relato de primera mano
de una implementación real, con detalles verificables (permisos exactos,
mecanismo de token, arquitectura de dos sesiones). El comportamiento de
GitHub descrito (rulesets eximen a admins por defecto) es correcto y
documentado por GitHub mismo.

**Novedad frente al manual — el principio ya está, con más rigor; falta
la implementación concreta.** §10.10.2 ya dice, casi palabra por palabra,
lo mismo que este post concluye: *"cualquier agente con capacidad de
actuación real necesita (1) una credencial con alcance explícito y
limitado — **nunca credenciales de administrador heredadas sin
acotar**"* — y cita un estándar formal, OWASP AISVS (C5/C9/C10), con dos
matices que el post ni menciona: **reautorización continua** (cada acción
privilegiada se reautoriza en el momento, no solo al delegar la credencial
una vez) y **fail-closed, no fallback silencioso** (negar por defecto si
la autorización no puede completarse). En eso el manual va más lejos.
Lo que el post aporta y el manual no tiene: una **implementación de
referencia concreta y reproducible** para el caso más común de todos —
un agente de código conectado a GitHub — mientras el manual se queda en
el principio arquitectónico general. Es exactamente el hueco entre
"qué debe ser cierto" (§10.10.2) y "cómo se construye, paso a paso, para
esta herramienta específica" que ningún capítulo cubre todavía. El marco
"tinta vs. cemento" es además una reformulación memorable, en otro
dominio (seguridad de Git/CI), del mismo principio que ya sostiene el
Patrón Sándwich del manual (§12): no confíes en que el modelo lea la
instrucción, haz que el código decida.

**Comprobación en HyperRAG — hallazgo directo y concreto.**
[`docs/ARRANQUE.md` §2.6](C:\Perso\Projects\HyperRAG\docs\ARRANQUE.md):
*"Quién ejecuta qué: David lanza todo lo que necesite ollama, HuggingFace
o git. Claude lanza evaluaciones sólo-bm25 y todo lo demás en el sandbox
Linux. **Claude no ejecuta git.**"* Es exactamente la regla correcta,
aplicada al mismo riesgo que describe el post — pero es **tinta**: una
línea en un `.md` que una sesión futura (o esta misma) podría violar por
error, no un límite que el sistema haga cumplir. HyperRAG no tiene hoy el
equivalente de `maibot` (usuario aislado, credencial de git con alcance
limitado) — tiene la política correcta sin el cemento que la sostenga.

**Veredicto: Incorporar (manual) / Observar (HyperRAG, cambio de
proceso, no de código).**
`[Manual: candidato — Cap. 10 (§10.10.2) o Cap. 12: implementación de
referencia "tinta vs. cemento" para agentes de código sobre Git/GitHub,
usando este post como caso concreto del principio ya establecido;
también citable en Cap. 21 (ciberseguridad LLM) como ejemplo de bypass de
gobernanza por herencia de identidad, no por fallo del modelo]`
`[Empreinte: Ninguno — no ejecuta agentes con acceso a repositorios Git]`
`[HyperRAG: Observar — la regla "Claude no ejecuta git" en
`docs/ARRANQUE.md` §2.6 ya es la política correcta; convertirla en cemento
(usuario de sistema separado o token de git con alcance limitado en el
sandbox Linux) sería la aplicación directa de este hallazgo, pero es una
decisión de proceso del propietario del laboratorio, no algo que este
triaje deba tocar por su cuenta — se ancla aquí, no en `ARRANQUE.md`,
porque no es un candidato de contenido de investigación sino de
higiene operativa]`

### 2026-08-19 — "Why Does CLAUDE.md Keep Growing? Catastrophic Remembering in Agentic Coding" (Kushal Chakrabarti, arXiv:2608.11095)

**Fuente.** Paper de arXiv (cs.AI, 11 ago. 2026), autor único, South Park
Commons. La fuente de mayor rigor de todo este log, por un margen amplio:
corpus de 1.867 repositorios GitHub reales con CLAUDE.md/AGENTS.md/
copilot-instructions.md, 299.440 transiciones versión-a-versión, 247.694
ciclos de vida de instrucciones individuales rastreados con un pipeline
de segmentación y emparejamiento validado (1,000 precisión / 0,933 recall
sobre 50 transiciones anotadas a mano). Análisis de supervivencia
(estimador de Nelson-Aalen, bootstrap estratificado por repositorio),
modelo de fragilidad gamma para descartar explicaciones rivales, umbrales
y criterios de aceptación **pre-registrados antes de correr el pipeline**
(Tabla 3, "todo criterio pre-registrado pasa"), experimento controlado
(inversión de IFEval) con brazo control/placebo/tratamiento, validación en
mundo real sobre WildIFEval con doble juez para reproducibilidad, sección
de Limitaciones explícita, declaración de uso de LLM (solo como "compilador
delegado" para redacción/código, nunca para generar cifras — "no LLM
produjo un valor reportado"), y declaración de ética. Es, con diferencia,
la fuente que más se parece al propio registro de rigor que exige este
manual.

**Contenido — dos hallazgos encadenados.**

1. **El fenómeno, medido.** Los ficheros de instrucciones agénticas
   (CLAUDE.md y equivalentes) crecen sin límite en repositorios reales:
   +226% de media sobre su propio ciclo de vida, +4,9 instrucciones netas
   por commit, mediana de 39 instrucciones por fichero (percentil 90: 131).
   El 76,8% de las "muertes" de instrucciones llegan por reescritura total
   del fichero, no por poda selectiva — y tras la reescritura el
   crecimiento se reanuda, **más rápido que antes** (4,9%/commit tras
   reescribir frente a 4,1%/commit antes). Lo llaman el **ratchet** (trinquete):
   la reescritura resetea el tamaño pero no la tasa de crecimiento.
2. **El mecanismo causal, aislado.** El hazard de eliminación **cae** con
   la edad de la instrucción (pendiente log-hazard -0,032/commit, IC 95%
   excluye cero) — lo contrario de lo que predice la hipótesis rival
   "caducidad de la instrucción" (que predice hazard creciente con la
   edad), y controlado contra la otra rival, "fragilidad de contenido"
   (modelo de fragilidad gamma, absorbe solo 30,8% de la pendiente). El
   mecanismo real: **recuerdo imperfecto**. Añadir una instrucción cuesta
   O(1); borrarla con seguridad requiere saber *por qué* se añadió (su
   "razonamiento latente"), y probar que ya no hace falta cuesta O(2^|D|)
   en un prompt de |D| instrucciones — sin ese porqué, el mantenedor
   racional nunca puede confirmar que borrar es seguro.
3. **La solución, probada.** Comentarios que registran el razonamiento
   latente de una instrucción (qué fallo motivó, qué hipótesis, qué
   resultado tuvo) — **nunca vistos por el ejecutor**, solo por el
   siguiente mantenedor — eliminan el 99,3% del exceso en el experimento
   controlado (+211,3% de exceso sin comentarios → +1,4% con ellos, sobre
   51 pasos) y mejoran el cumplimiento de instrucciones en prompts reales
   (WildIFEval) en un 23,1% relativo (11,6pp, IC 95% [5,1; 18,3]pp) —
   porque instrucciones ruidosas/obsoletas degradan activamente el
   cumplimiento de las instrucciones verdaderas que sí siguen vigentes
   (-24,1pp de precisión con 16 distractores).

**Validez.** Sobresaliente para el género — pre-registro de umbrales,
descarte activo de dos hipótesis rivales con sus propios tests, doble
juez para el experimento en mundo real, ablaciones que aíslan qué
componente del comentario hace el trabajo (retirar el campo de resultado
cuesta el 37% del efecto). Limitaciones propias reconocidas sin adorno:
el 77,3% de "muertes" quedan censuradas como reescritura/migración, no
medidas directamente por el hazard; la segmentación gramatical por corpus
es el grado de libertad menos probado; no se midió distribución de idioma
(sin resultado sobre instrucciones no inglesas).

**Novedad frente al manual — el hallazgo de mayor calidad de esta ronda:
convergencia con una propuesta propia ya existente, ahora con respaldo
empírico real.** §8.7b ("El prompt como deuda técnica: la caducidad que
no depende de ti", ★ Propuesta del autor, v63) ya proponía, **de forma
independiente y con vocabulario propio**, casi exactamente el mismo
diagnóstico y la misma solución que este paper ahora mide a escala:
*"Una instrucción cuya justificación no se puede volver a medir no se
podrá retirar nunca, porque nadie sabrá si quitarla es seguro... la
documentación no se retira, se acumula"* — es la misma proposición que el
paper llama "recuerdo imperfecto" y demuestra con análisis de
supervivencia sobre 247.694 instrucciones reales. Y el remedio que
propone §8.7b.3 —anotar cada instrucción con campo `why` que contenga
**un número, no una intención**, y `verified_on`— es estructuralmente el
mismo mecanismo que el paper valida como "comentarios que codifican
razonamiento latente, nunca vistos por el ejecutor". §8.7b puede pasar de
"propuesta del autor sin contrastar" a **propuesta con validación externa
independiente a escala**, la primera vez en este log que una fuente
externa no solo no contradice ni iguala una idea propia del manual, sino
que la **confirma con datos que el propio manual no tenía**. Matiz
importante: el paper es más general que §8.7b — la causa que identifica
opera incluso cuando el modelo no cambia («incluso si la tarea no
cambia, la memoria decayente de por qué se escribió cada instrucción
basta para producir crecimiento sin límite»), mientras que §8.7b se
centra específicamente en la obsolescencia inducida por migración de
modelo. Son complementarios, no redundantes: el paper explica un
mecanismo más amplio del que la migración de modelo es un caso particular.

**Comprobación en HyperRAG — paralelismo estructural interesante, no una
medición del paper.** `docs/ARRANQUE.md` y `docs/RETOMAR.md` no son
literalmente CLAUDE.md/AGENTS.md (el paper no los midió; ningún proyecto
de los tres tiene un fichero con esos nombres exactos — comprobado), pero
funcionan como el mismo tipo de artefacto: instrucciones de continuidad
que un agente lee al empezar una sesión fría. Su propia regla 7
("`ARRANQUE.md` se reescribe donde haya quedado viejo") y la separación
entre ese fichero (estado actual, podado activamente) y la bitácora del
dossier (§9, expresamente **de solo añadir**, con comando y fecha por
entrada) es, estructuralmente, la misma separación instrucción/comentario
que el paper valida: un canal breve y activamente mantenido para "qué
hacer ahora", y un canal append-only con el "por qué" de cada decisión,
que no se relee entero cada vez pero queda disponible para auditar. No es
una confirmación medida — es un diseño independiente que ya converge con
la misma solución, sin que en HyperRAG se haya llamado nunca así.

**Veredicto: Incorporar — la prioridad más alta de este log.**
`[Manual: §8.7b — añadir cita a Chakrabarti 2026 (arXiv:2608.11095) como
respaldo empírico externo de la proposición ya existente; candidato
también a una entrada breve en Cap. 8 (mantenimiento de prompts/ficheros
de instrucciones agénticas) citando las cifras del paper (+226% de
crecimiento, mecanismo de recuerdo imperfecto, 99,3% de reducción con
comentarios, 23,1% de mejora en cumplimiento) como el primer estudio a
gran escala del fenómeno que §8.7b ya intuía]`
`[Empreinte: Ninguno directo — no gestiona ficheros de instrucciones
agénticas tipo CLAUDE.md]`
`[HyperRAG: Ninguno que corregir — nota de reconocimiento: la separación
ARRANQUE.md/bitácora ya implementa, sin saberlo, el mismo patrón que el
paper valida; posible mención breve en la sección de dependencias
externas si el propietario quiere documentar la coincidencia, no
urgente]`

### 2026-08-19 — "Tracely" (post en español, herramienta open source)

**Fuente.** Post en primera persona describiendo Tracely, herramienta
open source (MIT, Python: FastAPI/Celery/ClickHouse, +370 estrellas en
GitHub a fecha del post) — no una infografía genérica: describe un
artefacto real y verificable (repo, licencia, stack, métrica de
adopción), aunque en registro promocional ("el detalle que más me
gusta"). Sin cita académica ni benchmark de precisión propio de la
herramienta (no hay cifra de falsos positivos/negativos de su juez LLM
ni de su clustering de fallos).

**Contenido.** Problema: testear agentes de IA es difícil porque el
modelo nunca responde igual dos veces, y la mayoría de herramientas de
evals piden un dataset escrito a mano. Tracely lee trazas OTLP que el
agente ya exporta, evalúa cada ejecución (LLM-as-judge + checks
estructurales) y agrupa fallos similares. Con un clic congela una
ejecución fallida en un fixture hermético (input, tool calls, respuestas
del modelo) que el CI reproduce de forma determinista, offline y sin
coste. **El contrato fail-to-pass:** cada caso debe fallar con el código
viejo y pasar con el fix, o no se considera fiable.

**Credibilidad y validez.** Media — proyecto real y verificable, diseño
técnicamente coherente, pero sin datos propios sobre la fiabilidad de sus
propios mecanismos de juicio (tasa de acierto del LLM-as-judge, falsos
positivos del agrupamiento de fallos).

**Novedad frente al manual — hueco específico y real, con una conexión
directa a una idea ya existente.** El manual tiene "golden dataset"
curado a mano (glosario, línea ~21456: "construido y validada
manualmente por expertos del dominio") y clustering de producción para
detectar inconsistencias desconocidas (línea ~16829: "el golden dataset
detecta errores conocidos de forma reproducible, el clustering detecta
inconsistencias desconocidas en producción... son capas"). Ninguna de las
dos cubre el mecanismo específico de Tracely: **convertir un fallo real
de producción, no reproducible por sí solo (por el no-determinismo del
LLM), en un fixture determinista para regresión en CI** — congelando
input, tool calls y salidas del modelo. Es un hueco de mecanismo, no de
principio: el manual ya sabe que hace falta reproducibilidad (Cap. 13
entero trata de eso), pero no describe *cómo* lograrla frente a un
sistema que por diseño no es determinista.

**Conexión directa con §13.15 — el contrato fail-to-pass es la
operacionalización exacta de una regla que el manual ya tiene.** §13.15
("El arnés que miente") ya dice: *"Un test que busca una cadena en el
código fuente comprueba una intención, no un efecto. Si puede pasar con
el sistema roto, no es un test."* El contrato fail-to-pass de Tracely es,
literalmente, un chequeo automatizado de esa misma regla: exige
demostrar que el caso falla con el código viejo antes de aceptarlo como
válido. Es un mecanismo concreto y adoptable para una regla que el manual
ya defendía en abstracto.

**Cautela que hay que añadir, no ignorar — tensión con una regla dura de
HyperRAG y con el propio §13.14 del manual.** Tracely evalúa cada
ejecución con **LLM-as-judge**. `docs/ARRANQUE.md` §2.1 de HyperRAG es
categórico: *"Nunca un juez LLM para calidad de respuesta... Hay un test
que lo impide."* Y el propio manual, en la sección de clustering
(línea ~16825), nombra exactamente el riesgo que un juez LLM introduce
aquí: *"la evaluación confabulada de extremo a extremo: si el evaluador
(humano o modelo) inventa el objeto que dice estar evaluando con
coherencia interna, no hay outlier que detectar."* Si el juez de Tracely
confabula un veredicto coherente pero equivocado sobre una traza, ese
veredicto se congela como fixture "correcto" con la misma confianza que
si fuera cierto — el mecanismo de congelar no protege contra un juez que
se equivoca de forma consistente. El valor real de Tracely (congelar
trazas + contrato fail-to-pass) es independiente de su componente de
juez LLM y adoptable sin él, sustituyendo el juicio por checks
estructurales — que es exactamente lo que ya hace HyperRAG con sus
arneses propios.

**Veredicto: Matizar/incorporar parcial.**
`[Manual: candidato — Cap. 13, mención breve junto a §13.15: el patrón
"congelar traza de fallo → fixture determinista → gate de CI con
contrato fail-to-pass" como técnica concreta para regresión en sistemas
no deterministas, citando Tracely como ejemplo de herramienta OSS que lo
implementa, con la cautela explícita sobre su componente LLM-as-judge
frente a §13.14]`
`[Empreinte: Ninguno — no gestiona una suite de regresión de agente]`
`[HyperRAG: Ninguno que corregir — el diseño de sus propios arneses (sin
juez LLM, deterministas, con comando y corpus fijados) ya cumple el
mismo estándar por otra vía; el patrón de fixture congelado podría ser
útil si algún día se automatiza CI sobre el motor, pero no es un
candidato con bloqueo hoy]`

### 2026-08-19 — "Tokenization does not create value" (post de fintech, sin autor visible)

**Fuente.** Post genérico de LinkedIn sobre tokenización de activos reales
en blockchain (inmuebles, bonos, fondos, acciones, flujos de ingresos),
sin autor identificado en el texto, sin cita, registro de contenido
financiero divulgativo estándar.

**Contenido.** La tesis: tokenizar no crea valor (el edificio genera
renta, el bono paga interés, la empresa genera beneficio) — lo que la
tokenización cambia es la infraestructura alrededor de ese valor,
haciéndolo digital, programable y conectable a contratos inteligentes.

**Triaje: fuera de alcance total, sin relación con el dominio.** Esta
fuente no trata IA, LLMs, RAG, ni ningún tema dentro del alcance del
manual (arquitectura/límites/gobernanza de sistemas generativos), de
Empreinte (observabilidad de coste/calidad/privacidad de LLM) ni de
HyperRAG (laboratorio de técnicas RAG). Es tokenización de activos
financieros en blockchain — un dominio completamente distinto. No
amerita comprobación de código ni cruce con ninguno de los tres
proyectos: no hay ninguna afirmación técnica sobre IA que verificar.

**Nota curiosa, no accionable.** La única coincidencia con este log es
léxica: "token" aquí significa activo financiero digital en blockchain,
no la unidad mínima de texto que procesa un LLM (el sentido que ha tenido
"token" en todas las demás entradas de este triaje — prefill/decode,
KV cache, tokens de entrada/salida). Vale la pena señalarlo solo como
recordatorio de que la palabra es un falso amigo entre dominios, no como
hallazgo de contenido.

**Veredicto: Descartar — fuera de dominio, no evaluable con la
metodología de este log.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]`

### 2026-08-19 — "Kimi K3's weights are free to download. Almost nobody can run them." (post sin autor, sobre Moonshot AI)

**Fuente.** Post de LinkedIn/redes, sin autor identificado en el texto,
registro aforístico de thought-leadership ("Openness stopped being the
opposite of a business model. It became the top of the funnel."). Sin
cita a fuente primaria dentro del propio texto — pero las afirmaciones
son verificables porque son específicas y factuales (no opiniones), así
que hice una comprobación externa antes de fijar el veredicto de
credibilidad.

**Verificación externa (búsqueda web, 2026-08-19).** Los hechos
comprueban: Kimi K3 es real — 2,8 billones de parámetros, arquitectura
MoE (104B activos por token), publicado por Moonshot AI el 16 de julio de
2026, contexto de 1M tokens. La licencia impone exactamente los umbrales
que cita el post: >$20M de ingresos anuales para negociar contrato de
servicio a terceros, e ingreso mensual >$20M o >100M usuarios activos
mensuales para exigir atribución visible. Posición de benchmark: 3º en el
Artificial Analysis Intelligence Index y 1º chino en topear Frontend Code
Arena — coincide con "top three overall and first in frontend coding".
No pude confirmar independientemente la cifra "revenue up at least 6x
since launch" de Moonshot, pero nada la contradice (ARR de Moonshot ya
superaba $200M en abril, antes del lanzamiento de K3). **Fuentes:**
[MLQ News](https://mlq.ai/news/moonshot-ai-releases-kimi-k3-a-28-trillion-parameter-open-weight-model-rivaling-top-us-systems/),
[Unite.AI](https://www.unite.ai/moonshot-opens-kimi-k3-weights-under-a-revenue-tiered-license/),
[Tom's Hardware](https://www.tomshardware.com/tech-industry/artificial-intelligence/moonshot-releases-2-8-trillion-parameter-kimi-k3).

**Credibilidad, revisada al alza.** El post no cita sus fuentes dentro
del texto, pero cada afirmación factual verificable resultó exacta. Es
una categoría distinta de las infografías sin dato de este log: aforismo
sin cita que, comprobado, no miente.

**Contenido.** La tesis central: "pesos abiertos" en modelos de esta
escala (2,8T parámetros) ya no significa que puedas auto-alojarlos —
significa que puedes leer el fichero. La apertura no compite con el
modelo de negocio: se convierte en la parte superior del embudo
(desarrolladores descargan, casi nadie puede servir el modelo, así que
llaman a la API igual). Publicar los pesos también mata la sospecha de
benchmarks manipulados: nadie puede alegar que las cifras están cocinadas
si terceros independientes las replican sobre el artefacto público.

**Novedad frente al manual — hueco real, con destino claro.** El manual
menciona "pesos abiertos" varias veces como opción de despliegue, pero no
tiene ningún análisis del patrón de negocio que describe este post:
pesos abiertos como estrategia de embudo/marketing con licencia
escalonada por ingresos, en vez de como alternativa genuina de
auto-alojamiento a esta escala. Es un ángulo económico/estratégico que
Cap. 17 (roles) o Apéndice A (costes) no cubren. Pero el contenido en sí
—nombres de modelo, cifras de licencia, posición de benchmark— es
exactamente lo que el manual reserva para **Apéndice D** por su alta
caducidad: dentro de seis meses "Kimi K3" será una entrada más en una
lista de modelos superados, aunque el patrón de negocio que ilustra
(pesos abiertos como embudo, no como autoalojamiento real) puede seguir
siendo cierto más tiempo que la cifra concreta.

**Veredicto: Observar / candidato a Apéndice D.**
`[Manual: candidato — Apéndice D, nota de campo fechada: "pesos abiertos
como embudo, no como autoalojamiento" con Kimi K3 como caso verificado
(2,8T parámetros, licencia escalonada por ingresos, 3º en Artificial
Analysis) — marcar explícitamente alta caducidad, no incorporar al
cuerpo estable]`
`[Empreinte: Ninguno — no despliega modelos de frontera propios]`
`[HyperRAG: Ninguno — el laboratorio corre sobre modelos locales
pequeños/medianos (Ollama, HuggingFace), no sobre modelos de 2,8T que
requieran esta discusión de infraestructura]`

### 2026-08-19 — "Memory Engineering for Kimi" (artículo sin autor visible)

**Fuente.** Artículo técnico extenso (no aforismo ni infografía), sin
autor identificado en el texto, con ejemplos de código reales (script
Python que convierte el grafo del swarm a un vault de Obsidian) y
plantillas concretas (`SKILL.md`, `CONSTRAINTS.md`). Sigue directamente
al post anterior sobre Kimi K3 de este mismo log — mismo modelo, mismo
día.

**Verificación externa — parcial, con una discrepancia que importa.**
Comprobé por separado los tres pilares del artículo:
- **Agent Swarm, 300 sub-agentes en paralelo, coordinador entrenado por
  RL para decidir cuándo paralelizar:** confirmado, real, documentado
  ([MoClaw](https://moclaw.ai/blog/kimi-k3-agent-swarm),
  [Verdent](https://www.verdent.ai/guides/kimi-k2-6-agent-swarm)).
- **Context graph** (nodos por entidad, aristas cuando dos agentes tocan
  la misma entidad, exportable): confirmado como función real de Kimi
  Agent Swarm
  ([artículo de @0xRicker sobre "Context Graph Engineering With K3"](https://x.com/0xRicker/article/2087163793558126997)).
- **"Skills" como `SKILL.md` + scripts/ + references/, cargado
  automáticamente por Kimi Agent Swarm:** **no confirmado** en la
  búsqueda — lo único que aparece sobre convenciones de fichero para Kimi
  es `AGENTS.md` para restringir el comportamiento del agente, no
  `SKILL.md`. La descripción exacta que da el artículo (carpeta con
  `SKILL.md`, `scripts/`, `references/`, cargada automáticamente al
  inicio de una ejecución) coincide, rasgo por rasgo, con la función
  **Skills real de Claude/Claude Code** — la misma que uso yo en esta
  sesión. No puedo confirmar si Moonshot implementó algo estructuralmente
  idéntico bajo el mismo nombre, o si el artículo atribuye a Kimi una
  función de otro proveedor. Motivo de cautela explícita, no de descarte
  total: dos de los tres pilares del artículo verifican; el tercero no.

**Contenido.** Distingue ventana de contexto (1M tokens, "más sitio para
pensar en una sesión") de memoria real (algo que sobrevive entre
sesiones). Propone tres artefactos separables: **Skills** (procedimiento
persistido — cómo hacer algo, cada vez más rápido), **Constraints file**
(correcciones persistidas — qué salió mal antes, para no repetirlo, "el
que gets faster AND more correct"), y **Context graph** (relaciones
persistidas entre entidades, no solo hechos sueltos). Los tres se leen
automáticamente al empezar una ejecución y se escriben automáticamente al
terminarla.

**Novedad frente al manual.** §6.11 ("Memoria compilada: Wiki Memory y
MEMO") cubre memoria de *conocimiento* (el sistema estudia documentos una
vez en vez de recuperar siempre) — un paradigma distinto y complementario
al de este artículo, que trata memoria de *procedimiento* (Skills),
memoria de *corrección* (Constraints) y memoria de *relación* (grafo) en
un contexto agéntico, no de RAG documental. Es un ángulo que el manual no
tiene todavía: la distinción explícita entre estos tres tipos de memoria
agéntica y por qué ninguno sustituye a los otros dos ("un Skill sin
constraints se vuelve más rápido pero no más correcto").

**Conexión directa con la fuente anterior de este mismo log — riesgo no
mencionado por el artículo.** El propio `CONSTRAINTS.md` que propone este
artículo ("loaded automatically... - [rule distilled from last run's
review]... - [the mistake you never want repeated]") es, estructuralmente,
el mismo tipo de fichero que Chakrabarti (arXiv:2608.11095, entrada
anterior de este log) mide creciendo sin límite: instrucciones que se
**añaden** en cada sesión, sin ningún mecanismo descrito para revisar o
retirar una regla que ya no hace falta. El artículo no menciona poda,
caducidad ni el equivalente al campo `why` con número verificable que
propone el propio §8.7b del manual. Aplicado literalmente, el patrón que
recomienda este artículo es candidato directo al "recuerdo catastrófico"
que la fuente anterior acaba de cuantificar.

**Conexión con HyperRAG — evidencia externa anecdótica, no una medición.**
Comprobé el estado de `hyperrag/layers/graph_layer.py` (615 líneas) y
`wiki_layer.py` (338 líneas): mismo tamaño que en `PLAN_siguiente_fase.md`
— siguen **sin construirse ni medirse**, la misma "hipótesis
arquitectónica sin una sola medición" que el plan nombraba. Que un
sistema de producción real (Kimi Agent Swarm) haya encontrado valor
suficiente en memoria de relaciones estructurada en grafo como para
enviarlo es un dato de mercado a favor de la Fase 2 del plan — pero es
evidencia de producto, no de laboratorio, y no cambia la secuencia de
puertas de decisión ya fijada (Fase 0 → 1 → 2).

**Veredicto: Incorporar con cautela de atribución.**
`[Manual: candidato — Cap. 10 (memoria de agentes) o extensión de §6.11:
la distinción Skill/Constraints/Grafo como taxonomía de tres tipos de
memoria agéntica, citando Kimi Agent Swarm como ejemplo (con la cautela
explícita sobre "Skills" no verificado) y cruzando con §8.7b y con
Chakrabarti 2026 para señalar que un CONSTRAINTS.md sin poda es
exactamente el patrón de recuerdo catastrófico que ese paper mide]`
`[Empreinte: Ninguno directo]`
`[HyperRAG: Ninguno — nota de contexto de mercado para cuando se retome
la Fase 2 de `PLAN_siguiente_fase.md` (construir `graph`), no accionable
hoy]`

### 2026-08-19 — "Tensors: The Building Blocks of Intelligence" (Sivasankar Natarajan, LinkedIn)

**Fuente.** Tercera aparición de este mismo autor en el log (tras
"Evolution of RAG Architecture" y "Master LLM Inference"). Mismo formato
de infografía numerada, misma bio genérica, sin cita ni dato propio.

**Contenido.** Qué es un tensor (contenedor unificado N-dimensional: 0D
escalar → 1D vector → 2D matriz → 3D+ tensor), por qué unifica la
representación de imagen/texto/embeddings/vídeo bajo la misma forma
(H×W×C, batch×seq_len, vocab×dim, etc.), propiedades prácticas (shape,
rank, dtype —donde ocurre la cuantización—, device, memoria contigua,
broadcasting), y por qué esa uniformidad es lo que permite que la misma
GPU entrene un modelo de visión y uno de lenguaje. Un sexto panel, solo
visible en la imagen y ausente del texto, titulado "From Memory to
Meaning" ("memory retention, memory expiry, recall filtering, sensitive
data blocking...") no tiene relación temática real con tensores — parece
contenido de plantilla reciclado de otra infografía del mismo autor
sobre gobernanza de memoria de agentes, pegado sin ajustar. Señal
adicional de producción formulaica.

**Validez.** Correcto en todo lo verificable — es la explicación estándar
de tensores que aparece en cualquier tutorial de PyTorch/NumPy/
TensorFlow. Sin errores.

**Relevancia para el manual — misma respuesta que "6 Concepts
Mathématiques": correcto, pero por debajo del punto de partida
asumido.** Comprobé: el manual usa "tensor" solo de pasada, en el
interior de la sección más avanzada de atención (línea ~6270,
mecanismos GQA/MLA), sin definirlo nunca desde cero — exactamente como
asume que el lector ya sabe qué es sin explicarlo. El Cap. 5 entero
(cuantización, KV cache, hardware CPU/GPU/TPU/NPU/LPU en §5.7e) opera
sobre tensores sin nombrarlos como concepto introductorio. Este artículo
cubre justo ese prerrequisito ausente — pero es prerrequisito de
ingeniería ML (numpy/PyTorch), no contenido nuevo para un lector que ya
llegó al Cap. 5. Mismo diagnóstico que la fuente de matemáticas: no es un
hueco de contenido, es un desajuste de audiencia.

**Veredicto: Descartar por audiencia, no por calidad — y extiendo la
nota de patrón de este autor.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]` — sin comprobación de código porque no hace ninguna
afirmación sobre RAG/retrieval/sistemas, solo matemática/estructura de
datos de base. **Nota de patrón, tercera vez:** este autor produce
infografías de fórmula sobre subtemas de IA distintos cada pocos días.
Van tres entradas de esta cuenta en el log, con dos motivos de descarte
distintos y ya mapeados: (a) contenido ya cubierto y superado por el
manual (RAG, inferencia) o (b) contenido correcto pero de audiencia
equivocada, por debajo del punto de partida del manual (este). Piezas
futuras de este autor pueden triarse por comparación directa contra
estas tres entradas antes de investigar desde cero.

**Actualización 2026-08-19.** El usuario recogió el interés de la idea
de fondo —explicar tensores con claridad, con imagen animada— como
candidato propio, independiente de esta fuente concreta: ver pendiente
#12 del panel de arriba.

### 2026-08-19 — Tres PDFs: Kaplan et al. 2020, Hoffmann et al. 2022 (Chinchilla), y Arezki 2026 (BCMT)

**Dos fuentes de máxima credibilidad, cubriendo un hueco real y
significativo.**

**Kaplan et al., "Scaling Laws for Neural Language Models" (OpenAI,
2020)** y **Hoffmann et al., "Training Compute-Optimal Large Language
Models" (DeepMind, 2022 — "Chinchilla")** son, junto con "Attention Is
All You Need", de los papers más citados y más fundacionales de todo el
campo: establecen cómo escalan pérdida/calidad con parámetros, datos y
cómputo, y corrigieron colectivamente la práctica de la industria — el
hallazgo de Chinchilla (modelos como GPT-3 o Gopher estaban
significativamente sub-entrenados para su presupuesto de cómputo; la
proporción óptima ronda ~20 tokens por parámetro) es la razón por la que
prácticamente todo modelo de producción desde 2022 se entrena como se
entrena. No necesitan verificación de credibilidad — son papel fundacional
del campo, no contenido de blog.

**Comprobación en el manual — hueco real y notable.** Busqué "scaling
law", "Chinchilla", "Kaplan", "compute-optimal", "tokens por parámetro":
**cero resultados**. Es un hueco genuino y más importante que la mayoría
de los de este log: el manual explica en profundidad el interior de un
LLM (Cap. 5: MoE, GQA/MLA, cuantización, FlashAttention, inferencia
especulativa, hardware) pero nunca explica el marco que determina **por
qué los modelos se entrenan con el tamaño y el volumen de datos que
tienen** — la pregunta que Kaplan planteó y Chinchilla corrigió. Es
contenido estable, no de alta caducidad (los propios papers tienen 4 y 6
años y siguen siendo la referencia), así que pertenece al cuerpo
principal, no a Apéndice D.

**Veredicto: Incorporar — prioridad alta, junto con Chakrabarti 2026.**
`[Manual: candidato — nueva sección en Cap. 5 o Cap. 1 ("de cuántos datos
necesita tu modelo"): leyes de escalado de Kaplan (2020), la corrección
de Chinchilla (2022, ~20 tokens/parámetro, ejemplo Gopher 280B vs.
Chinchilla 70B con más datos superándolo), y por qué esto importa para
decisiones de fine-tuning/RAFT que el propio Cap. 1 ya trata (§1.6b,
§1.8) sin este marco explícito]`
`[Empreinte: Ninguno directo]` `[HyperRAG: Ninguno directo — el
laboratorio no entrena modelos desde cero, solo evalúa técnicas de
retrieval sobre modelos ya entrenados]`

---

**BCMT (Blockwise Causal Memory Transformer), Rachid Arezki, arXiv
2608.13578, independent researcher — leído completo.**

**Contenido.** Arquitectura alternativa a la atención densa global para
contexto largo: atención causal densa dentro de bloques locales +
"memoria causal exponencial" (media exponencial causal de resúmenes de
bloque, con más peso a los recientes) inyectada de vuelta vía compuerta
aprendida. Complejidad O(TL) en vez de O(T²). Código disponible
(github.com/rachidlabs/BCMT).

**Credibilidad — moderada, con motivo.** Autor único, sin afiliación
institucional, preprint sin revisión por pares. La sección de trabajo
relacionado es sólida y cita correctamente arquitecturas reales
(Longformer, BigBird, Linformer, Performer, LongNet, Transformer-XL,
RMT, HMT, RetNet, RWKV, Mamba). El estudio de ablación (Fase IV, BCMT vs.
variante "HOnly" sin memoria) está bien diseñado y aísla correctamente la
contribución del mecanismo propuesto — buena práctica metodológica.

**Validez — leído con ojo crítico, hay problemas reales que el propio
paper reconoce en parte.**
- **Escala de juguete.** `d_model=128`, 6 capas — un modelo minúsculo.
  "Contexto largo" se prueba hasta **1024 tokens**, que no es contexto
  largo en 2026 (Kimi K3, evaluado hace dos entradas en este mismo log,
  ya sirve 1M tokens). A esa longitud, la atención densa sigue siendo
  barata — la motivación central del paper (evitar el coste cuadrático)
  nunca se pone a prueba en el régimen donde importaría.
- **BCMT pierde en calidad en casi todas las comparaciones.** Tabla 2
  (1024 tokens): Dense 4.5752 vs. mejor variante BCMT-256 4.5931 — Dense
  gana. Tabla 3 (más datos, 600k): la brecha de pérdida **se duplica**
  respecto a la tanda de 200k (0,018 → 0,036) en vez de cerrarse. El
  paper lo redacta como "los beneficios se mantienen" (cierto para
  throughput/memoria) sin señalar que la brecha de *calidad* creció con
  más datos — una tendencia que, si algo, preocupa de cara a escalar.
- **Sin comparación contra ningún competidor real.** El propio paper lo
  admite en Limitaciones: solo compara contra un Transformer denso
  vainilla, nunca contra Transformer-XL, RMT, RetNet, RWKV o Mamba —
  las arquitecturas contra las que se posiciona en el related work.
- Es honesto en su propio marco (nunca dice "mejor que", solo
  "comparable"; declara sus límites sin adornar), lo cual pesa a favor
  de la credibilidad del autor aunque no cambia la fuerza de la
  evidencia.

**Novedad frente al manual.** El manual ya cubre el panorama de
arquitecturas eficientes con las que BCMT compite (Transformer-XL,
Mamba, Linear Attention, arquitecturas híbridas) dentro de su propio
explorador interactivo de mecanismos de atención (Cap. 5). BCMT encajaría
ahí como una fila más — pero con la evidencia actual (escala de juguete,
pérdida peor, sin comparación a competidores reales) no cumple el
estándar que el propio manual exige para "★ concepto verificado" en
lugar de "control de laboratorio a vigilar".

**Veredicto: Observar, no incorporar todavía.**
`[Manual: Ninguno por ahora — candidato a Apéndice D ("notas de campo")
si se quiere documentar como dirección de investigación activa, no como
técnica establecida; revisar si el autor publica una versión a escala
mayor o con comparación a competidores reales]`
`[Empreinte: Ninguno]` `[HyperRAG: Ninguno — mismo motivo que otras
arquitecturas de atención alternativa: el laboratorio no entrena
modelos, solo evalúa retrieval sobre modelos ya entrenados]`

### 2026-08-19 — "When Local Consistency Isn't Enough" (The Keystone Project, sponsored working paper)

**Fuente.** "Draft for Peer Review", agosto 2026 — es decir, **no
revisado por pares todavía**. Contacto personal (`@me.com`), "sponsored"
sin nombrar patrocinador, sin afiliación institucional visible. Leído
completo. Contenido: teoría de CSP (constraint satisfaction) —
descomposición en árbol, marginales locales, un controlador epistémico
que separa consistencia local / insuficiencia representacional /
exactitud global certificada, con abstención explícita cuando la
evidencia no alcanza. Teoremas con demostración (1-3), citas correctas y
reales (Freuder, Dechter, Sherali-Adams, Sontag, proof-carrying code de
Necula, formatos DRAT/LRAT, y trabajo real de verificadores LLM: Cobbe
et al., Lightman et al., monitorización de cadena de razonamiento de
OpenAI, circuit-tracing de Anthropic).

**Honestidad epistémica notable, y una ausencia que hay que nombrar.**
La sección 9 ("Falsifiable Efficiency Hypothesis") **no reporta ningún
resultado experimental** — propone el protocolo de benchmark, no lo
ejecuta. El abstract lo declara sin rodeos: *"The central efficiency
claim remains empirical and is intentionally left open for benchmark
falsification."* Es más honesto que la mayoría de fuentes de este log,
pero también significa que no hay ninguna evidencia empírica que
evaluar — solo matemática (sólida, con demostraciones) y una propuesta
de arquitectura sin validar.

**Relevancia — analogía formal a algo que el manual ya defiende, no
contenido técnico nuevo para RAG/LLM.** El propio §10 del paper se cuida
de no sobre-vender la relevancia: *"tree decompositions certify finite
CSP semantics, not the truth of natural-language answers."* Aun así, el
principio central —nunca inferir una afirmación fuerte (exactitud) de
una más débil (convergencia/consistencia local), y abstenerse
explícitamente cuando falta el certificado— es, con otro vocabulario, el
mismo que sostiene el Patrón Sándwich (Cap. 12), el DecisionRecord, y la
silence rate (§13.9) del manual. Incluso comparte la analogía exacta de
separación plano-de-control/plano-de-execución (SDN) que ya usa §10.10.2
para lo mismo. No aporta nada que el manual no tenga ya — pero es un
respaldo formal, desde teoría de la computación, de que la arquitectura
que el manual defiende no es idiosincrasia del dominio LLM sino un
patrón general de sistemas con evidencia parcial.

**Veredicto: Observar — cita opcional, no contenido nuevo.**
`[Manual: Ninguno obligatorio — candidato opcional de una frase en
§12.6 o §10.10.2, citando este framework como paralelismo formal
(proof-carrying computation, no SDN) al mismo principio de separación
propuesta/certificación — no urgente, el argumento ya está completo sin
él]` `[Empreinte: Ninguno]` `[HyperRAG: Ninguno — dominio CSP finito, no
RAG]`

### 2026-08-19 — "Empty Shelves or Lost Keys?" (Calderon et al., Google Research/Technion, ICML 2026)

**Verificación de una cita ya existente en el manual, no una fuente
nueva a evaluar.** Este es exactamente el paper que §6.5a (v66) cita
como respaldo externo al "techo del oráculo". Leí el abstract e
introducción completos para comprobar la cita.

**La cita es exacta.** El manual dice: *"codificación saturada al
95-98% en modelos de frontera, el cuello está en el acceso."* El
abstract dice, palabra por cifra: *"encoding is nearly saturated in
frontier models... GPT-5 and Gemini-3 encoding 95–98% of facts. However,
recall remains a major bottleneck."* La cifra de la bitácora de HyperRAG
("2.150 hechos, 13 modelos, 4M de respuestas") coincide con el abstract
("2,150 facts... 4 million responses from 13 LLMs"). Sin discrepancias.

**Contenido adicional no citado todavía, potencialmente aprovechable.**
El paper va más allá de la cifra de saturación: reencuadra la
"maldición de la reversión" (reversal curse) y los errores en hechos de
cola larga como fallos de **recall**, no de conocimiento faltante —
"Oasis tocó en el Boardwalk" se puede responder pero "quién tocó en el
Boardwalk" no, aunque el hecho esté codificado y sea reconocible en
opción múltiple. Y muestra que el *thinking* (cómputo en tiempo de
inferencia) recupera una fracción sustancial de esos fallos. Esto es
material adicional relevante para el mismo §6.5a o para el Cap. 9
(razonamiento nativo) que no está incorporado todavía — no lo desarrollo
más aquí por presupuesto de lectura, pero queda anotado como ampliación
posible de una cita ya buena.

**Veredicto: Confirmación de cita existente + candidato menor de
ampliación.** `[Manual: candidato opcional — ampliar la cita de §6.5a
con el hallazgo de reversal-curse-como-recall y el efecto recuperador
del thinking, si se relee el paper completo]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno directo, aunque el marco encoding/recall es
conceptualmente afín a la distinción retrieval/generación que ya
estructura sus propios arneses]`

### 2026-09-22 — Jev / TypeSafe AI (Xataka, artículo periodístico sobre producto comercial)

**Fuente.** Artículo de Xataka (16-17 sept. 2026) sobre Jev, modelo de
TypeSafe AI (Diogo Almeida, ex-OpenAI, coautor de InstructGPT) que no
genera texto: recibe entrada no estructurada y devuelve una decisión
dentro de un conjunto de opciones cerrado, con probabilidad calibrada por
opción, vía una técnica propia (Reinforcement Learning for Calibrated
Decisions, RLCD). Fuente de parte interesada: no hay paper reproducible
de RLCD ni evaluación independiente citada — el propio artículo lo
reconoce, y los mejores resultados de rendimiento provienen de
benchmarks diseñados por la empresa. Cifras (20-200× más rápido, 40-400×
más barato, "0% de alucinaciones") tratadas aquí como afirmación de
proveedor, no como dato verificado.

**Relevancia — no es contenido técnico nuevo, es un caso de estudio
epistemológico y un ejemplo de arquitectura ya defendida por el manual
desde otro ángulo.** Dos conexiones, ninguna con paper que verificar:

1. El propio patrón "clasificación contraint a un espacio cerrado, con
   probabilidad, sin generación libre" es exactamente lo que ya
   estructura el Patrón Sándwich/DecisionRecord (Cap. 12) y la matriz de
   derechos de decisión con regla del rechazo cero (Cap. 14) —Jev es un
   ejemplo comercial de esa arquitectura aplicada a agentes de alta
   frecuencia (Cap. 10), no una técnica que el manual no cubra ya en
   principio.
2. La cifra "0% de alucinaciones" sin evidencia empírica independiente, y
   el reconocimiento explícito del propio artículo de que solo mide
   "no puede inventar una quinta opción", no "acierta cuál de las cuatro
   es correcta", es un caso de manual — literal— para §20.6 (taxonomía de
   fallos de investigación asistida, "conteo sin método"): una cifra de
   marketing que suena a métrica pero no lo es.

**Riesgo señalado por el propio artículo, relevante para Cap. 14.** El
artículo dice sin rodeos que Jev "hace que sea totalmente innecesario que
un humano lea la respuesta" — es la descripción casi literal de lo que
Cap. 14 llama supervisión decorativa, presentada aquí como ventaja de
producto, no como riesgo. Citable como ejemplo de cómo el discurso
comercial puede nombrar como eficiencia lo que el manual nombra como
fallo de gobernanza.

**Veredicto: Observar — candidato de cita opcional, no incorporación con
datos propios (el proveedor no los ofrece de forma verificable).**
`[Manual: candidato opcional de una mención breve en Cap. 10 (ejemplo de
arquitectura agente-sin-texto) y/o §20.6 (ejemplo de "0% sin método") —
no urgente, no cambia ningún argumento ya hecho, solo lo ilustra con un
caso comercial reciente]` `[Empreinte: Ninguno — el proyecto ya
implementa el mismo principio de clasificación contraint con el
clasificador CamemBERT de `audit_report/`; Jev no aporta técnica nueva,
solo valida externamente la misma filosofía de diseño]` `[HyperRAG:
Ninguno — sin conexión verificada con el enrutado/umbrales actuales]`
`[Auditra: tratado aparte, no es alcance de este log —
ver `11_Auditra/docs/roadmap/jev-clasificacion-decision-calibrada.md`]`

### 2026-09-28 — Jev Engineering: The 10-Step Guide (TypeSafe AI, guía técnica/promocional)

**Fuente.** Guía técnica de TypeSafe AI (probablemente propia, sin firma periodística
independiente) sobre el mismo Jev tratado en la entrada del 2026-09-22 (Xataka), pero contenido
distinto: más técnico, con pricing, ejemplos de código y un patrón de arquitectura de 10 pasos
("Jev Engineering") para instalar a Jev entre un LLM generador y el código que ejecuta. Misma
cautela epistémica que la entrada anterior — mismo proveedor, mismas cifras sin paper reproducible
ni evaluación independiente; esta guía no añade ni resta verificación sobre TypeSafe.

**Relevancia — a diferencia de la entrada anterior, esta vez la revisión sí generó hallazgo
verificado, pero en el propio corpus, no en Jev.** La tesis del post ("las llamadas que solo
eligen, puntúan o responden sí/no no deberían pagar precio de generación") empujó a revisar el
código real de HyperRAG y Empreinte con esa pregunta encima. Resultado en los dos casos: el patrón
ya está implementado, con cifras de cobertura y latencia propias, documentadas en el propio código
desde antes del post — ver `HyperRAG/taller/Jev_Engineering_y_clasificadores_HyperRAG_nota_puente.md`
y `Empreinte/taller/Jev_Engineering_y_clasificadores_Empreinte_nota_puente.md` para el detalle
verificado línea por línea.

**Vale la pena para Cap. 10 (ejemplo de arquitectura agente-sin-texto): reemplazar o complementar
el ejemplo comercial de Jev por evidencia del propio corpus.** La entrada del 2026-09-22 ya
marcaba Cap. 10 como candidato para un ejemplo de Jev. Ahora hay una alternativa mejor: el
clasificador de dos niveles de HyperRAG (`_classify_query`, regex + SLM local) y el clasificador
híbrido de Empreinte (`question_type_classifier_hybrid.py`, regex 85% + SLM local 10-15%) ilustran
el mismo principio con cifras verificadas del propio proyecto, sin depender de benchmarks de
parte interesada. No cambia ningún argumento ya hecho, mejora la evidencia que lo ilustra.

**Veredicto: Aplicado en Empreinte y HyperRAG (notas puente creadas); pendiente de decisión en el
manual.** `[Manual: candidato reforzado — el ejemplo de Cap. 10 puede citar HyperRAG/Empreinte en
vez de (o además de) Jev; sigue sin ser urgente, es mejora de evidencia, no corrección; decisión
de incorporarlo a una versión concreta queda para David]` `[Empreinte: Aplicado —
ver nota puente en `Empreinte/taller/`; el post no aporta técnica nueva, dos mecanismos ya
resuelven el patrón "Choice"/"Score" localmente]` `[HyperRAG: Aplicado — ver nota puente en
`HyperRAG/taller/`; actualiza el veredicto "Ninguno" de la entrada anterior, ahora con tres
conexiones verificadas]` `[Auditra: no tocado en esta pasada — pendiente anotado aparte en
memoria, para retomar más tarde]`

### 2026-09-28 (b) — Les modèles de décision structurée, Jev (Julien Perez, EPITA, nota técnica académica)

**Fuente.** A diferencia de las dos entradas anteriores sobre Jev (Xataka, periodístico; guía
TypeSafe, promocional), esta es una nota técnica de un profesor asociado de EPITA: formaliza
matemáticamente la diferencia generación/decisión (factorización en cadena vs. pase paralelo) y
sitúa Jev como combinación de dos líneas anteriores a los LLM generativos (encoders BERT + ranking/
IR, softmax sobre candidatos). Cita Laya, implementación independiente de código abierto —
verificada antes de citar: repositorio real (`github.com/NandhaKishorM/laya`, ModernBERT-large),
no una referencia inventada. Mismas cifras de Jev/TypeSafe sin verificación independiente, misma
cautela que las dos entradas anteriores.

**Veredicto: Aplicado en el manual (único hallazgo con hueco de contenido real).** `[Manual:
Aplicado — nueva subsección §12.4b "Cardinalidad variable" (v111→v112), citando Laya (verificable)
en vez de solo Jev (proveedor); ver `Registro_manual_v111_a_v112.md`]` `[Empreinte: Ninguno nuevo —
ya cubierto por la nota puente del 28/09 (REGEX+SLM, cardinalidad fija)]` `[HyperRAG: Ninguno
nuevo en código — el hallazgo de esta fuente (cardinalidad variable) es precisamente lo que ya hace
el reranker CrossEncoder, ahora citado en el manual con fundamento teórico propio]` `[Auditra: no
tocado en esta pasada — pendiente anotado aparte en memoria]`

**Seguimiento 2026-09-28 — cierre del frente Empreinte.** El "Ninguno nuevo" de arriba dejó de
ser exacto: la pregunta abierta de esta fuente sobre robustez al fraseo se convirtió en un
experimento real (`Empreinte/tests/test_question_type_robustness_to_phrasing.py`, ejecutado con
n=3, ampliado a n=15, pendiente de reejecución final por el usuario) y ese experimento sacó a la
luz, de forma incidental, un defecto de código real: la confianza de tipo de pregunta que
`question_type_classifier_hybrid.py` calcula por SLM se descartaba en los dos únicos sitios de
producción que la consumían (`phase2_slm_reclassifier.py`, `prompt_clustering.py`), sustituida por
una constante `0.8` sin relación con ningún valor calculado. Corregido: confianza real propagada,
formato de salida del SLM especificado explícitamente en el *system prompt* (antes ambiguo), y
`SubjectCluster.to_dict()` ahora exporta el campo (antes ni se serializaba). Detalle completo,
incluida la verificación (`234 passed, 2 skipped`, test de regresión nuevo) en
`Empreinte/taller/Jev_Engineering_y_clasificadores_Empreinte_nota_puente.md`, Adendas 2 y 3.
`[Empreinte: Aplicado — corrección de código real en 3 archivos + 1 test de regresión nuevo]`

**Cierre definitivo 2026-09-28 (misma tarde).** La investigación continuó más allá de la
corrección inicial: verificación con Ollama real reveló que el modelo también inventaba
categorías fuera de la lista cerrada (~9-12%), y que reforzar la instrucción en texto no lo
arreglaba. Solución final: salida estructurada (JSON Schema con `enum` cerrado, constrained
decoding) — verificada con Ollama real sobre 56 prompts: 0% categorías inventadas, 100%
confianza reconocible. Resumen ejecutivo completo de toda la cadena (9 adendas) en
`Empreinte/taller/Cierre_Empreinte_Jev_Confianza_Estructurada_2026-09-28.md`. Suite final:
`238 passed, 2 skipped`, 15 commits locales.


### 2026-09-28 (c) — Exploring the Cryptographic Limits of Transformer Networks (Domunco, Draguns, Torr, Robinson, Schroeder de Witt — Oxford / Contramont Research, arXiv:2606.29389)

**Fuente.** Verificado contra el paper real (no solo el resumen que trajo David) — arXiv:2606.29389 existe,
autores confirmados: Stefan Domunco, Andis Draguns, Philip Torr, Isaac Robinson, Christian Schroeder de
Witt. Motivación declarada: trabajo previo sobre colusión secreta entre agentes de IA vía esteganografía
("Secret Collusion among AI Agents: Multi-Agent Deception via Steganography" — título real, no
inventado). Los autores construyen circuitos de umbral para tres construcciones criptográficas (Keccak,
Merkle–Damgård, Árboles de Merkle) y derivan leyes de escalado profundidad/ancho verificadas para
mapearlos a arquitecturas transformer, bajo dos esquemas de mapeo (sin atención; *tokens-as-gates*).

**Matiz que el resumen de David no traía y que cambia cómo se cita esto.** El propio paper es explícito:
*"the mappings are constructive and have not been verified empirically by training"* y *"whether gradient
descent can learn to implement these constructions is an open question"*. Es una cota superior teórica de
capacidad arquitectónica (qué podría llegar a computar un transformer de cierto tamaño, en el peor caso),
no evidencia de que el entrenamiento por descenso de gradiente encuentre esa solución en la práctica.
Distinción que hay que preservar si esto se cita en algún sitio — el resumen original ya lo señalaba
("no afirman que los LLM actuales lo hagan"), pero aquí queda con la cita textual verificada.

**Relevancia por frente.**

- **Empreinte** — sin conexión. Es una plataforma de auditoría de coste/gobernanza de llamadas LLM; el
  paper trata capacidad computacional interna de la arquitectura, no el uso ni el coste de las llamadas.
  Ningún archivo del proyecto tiene relación con esto.

- **HyperRAG** — conexión real pero indirecta, sin cambio de código. `hyperrag/core/content_screen.py`
  (`detect_encoded_blob()`, ya implementado, 737/737 tests) ya defiende contra un problema *distinto*:
  blobs codificados/cifrados **en el texto recuperado** (heurística de entropía sobre tiradas largas de
  base64/hex). El propio módulo documenta su límite: *"no detectará un payload deliberadamente entreverado
  con lenguaje natural para romper la firma de entropía"* — que es, con otras palabras, justo lo que
  produciría un transformer capaz de esteganografía real (texto que parece generación normal pero
  codifica información oculta, sin la firma de alta entropía que el heurístico busca). El paper de
  Domunco et al. no exige ni sugiere ningún cambio en `content_screen.py` — pero es fundamento teórico
  externo, verificado, de un límite que el propio código ya se atribuía por honestidad, no por haber leído
  este paper. Además: la amenaza que motiva el paper (colusión *entre* agentes) no tiene hoy la estructura
  multi-agente necesaria en HyperRAG — mismo patrón de conclusión que el análisis ya hecho sobre Fan et al.
  (`PROJECT_STATE.md`, nota "Guardarraíl para un futuro bucle agéntico largo"): motor de un solo agente,
  sin canal de coordinación entre instancias, la amenaza no aplica estructuralmente hoy.

- **Comprender la IA** — candidato de cita, capítulo exacto sin decidir. §10.10.4 ("Cuando el fallo de
  contención es colectivo, no individual", verificado leyendo el HTML real v112) ya documenta un incidente
  real (OpenAI/Hugging Face, ago. 2026) de coordinación emergente no sancionada entre ~1.200 agentes vía un
  tablón interno — pero ese canal era abierto y legible, no cifrado ni esteganográfico; los propios informes
  citados en esa sección hablan de manipulación de *registros* (borrar/alterar transcripciones), no de
  comunicación cifrada dentro del contenido generado. El paper de Domunco et al. aporta algo que §10.10.4
  no cubre: fundamento teórico de que la ocultación podría, en principio, ir un paso más allá del tablón
  abierto — codificada dentro de la propia salida del modelo, indetectable para un evaluador que solo lea
  el texto como texto. Vale como nota técnica complementaria a §10.10.4 o como aporte al criterio
  metodológico más amplio del paper (evaluar por cota estructural de capacidad, no solo por conducta
  observada) — que podría encajar en cualquier capítulo sobre metodología de evaluación/red-teaming. No
  tengo localizado con certeza ese capítulo en esta pasada — queda como candidato sin verificar la sección
  exacta, no como incorporación decidida.

- **Corpus literario** — eco temático posible, no verificado como necesario: la idea de "lo que un sistema
  podría llegar a computar, más allá de lo que demuestra hacer" resuena con los temas de profundidad oculta
  y emergencia que ya recorren el corpus (marco de domesticación, observatorio de consciencia) — pero es una
  resonancia de tema, no un hallazgo técnico que el corpus necesite incorporar. Señalado, no forzado.

**Veredicto: Observar — sin incorporación con código ni con capítulo decidido en esta pasada.**
`[Manual: candidato sin decidir — posible nota técnica en o junto a §10.10.4, o en la sección de
metodología de evaluación aún sin localizar con certeza; no urgente, decisión de David]` `[Empreinte:
Ninguno — fuera de alcance del proyecto]` `[HyperRAG: Ninguno en código — refuerza por fundamento externo
verificado un límite que `content_screen.py` ya se atribuía a sí mismo; la amenaza de colusión
multi-agente que motiva el paper no aplica estructuralmente hoy, mismo patrón que el análisis ya hecho
sobre Fan et al.]` `[Auditra: no tocado en esta pasada — pendiente anotado aparte en memoria]`


### 2026-09-28 (d) — RAG vs Agentic RAG vs Graph RAG: Which One Do You Need? (Anurag Karuparti, infografía/post de LinkedIn, promocional)

**Fuente.** Post de LinkedIn con infografía, sin cifras propias ni cita a paper alguno — comparación
didáctica de tres patrones de RAG como si fueran tres arquitecturas mutuamente excluyentes entre las
que hay que elegir una para todo el sistema, cada una con su lista de "casos de uso" ilustrativa, no
verificada. Mismo registro que las guías promocionales de Jev (TypeSafe) tratadas el 22 y 28/09: útil
como disparador de revisión, no como fuente de datos a citar.

**Comprender la IA — sin incorporación, contenido ya cubierto y con más matiz.** Verificado en el manual
real (v112, no de memoria): "Agentic RAG" aparece 4 veces, "GraphRAG"/"Graph RAG" 80 veces. El patrón
exacto que el post describe (agente que evalúa si el retrieval es suficiente y repite con una
sub-pregunta si no) ya está en el manual como "Combinación 3: RAG agéntico" — con el diagrama textual
del propio loop pregunta→retrieval→evaluación→retrieval 2→síntesis, en el contexto de una taxonomía más
amplia de combinaciones (no aislado como una de tres opciones a elegir, sino como una entre varias
piezas componibles). El post no aporta nada que el manual no tenga ya, con más profundidad.
`[Manual: Ninguno]`

**HyperRAG — sin cambio de código, pero comparación real que vale la pena dejar escrita.** El post
enmarca RAG / Agentic RAG / Graph RAG como tres arquitecturas entre las que se elige una según el caso
de uso. HyperRAG no elige: implementa las tres piezas del post como capas del mismo motor (BM25,
Vector, Wiki, Graph vía `GraphLayer`/networkx, Tree, Reranker) más MEMO, y decide **por consulta, no
por sistema**, qué subconjunto usar — verificado en `engine.py::_MATURITY_LAYER_MAP`:

| Categoría (clasificador L2) | Capas usadas |
|---|---|
| explanation | bm25, vector, wiki, reranker |
| root_cause | vector, graph, reranker |
| hidden_node | graph, tree, reranker |
| prediction | vector, graph, tree, reranker |

Además, el "evalúa y repite" del bloque Agentic RAG del post ya existe como `_self_critique()`
(inspirado en Self-RAG, opt-in, capado a un reintento exacto por diseño — no un bucle abierto). El
post no equivoca nada, pero su pregunta decisoria ("¿uso RAG, Agentic RAG o Graph RAG?") asume una
granularidad de sistema completo que HyperRAG ya resolvió a granularidad de consulta individual — dato
útil como contraste documentado, no como corrección de nada que el post afirme mal.
`[HyperRAG: Ninguno en código — conexión de contraste documentada aquí, sin cambio: la arquitectura
real ya compone las tres piezas del post con enrutado adaptativo por consulta, en vez de elegir una
para todo el sistema]`

**Empreinte — sin conexión.** No es un sistema de retrieval; la comparación no aplica.
`[Empreinte: Ninguno]`

**Corpus literario — sin conexión, no se fuerza.** `[Corpus: Ninguno]`

**Veredicto: Descartar como fuente de contenido nuevo — el manual ya cubre Agentic RAG y GraphRAG con
más profundidad, y HyperRAG ya implementa las tres piezas de forma adaptativa por consulta. Vale como
confirmación externa de que el diseño de HyperRAG no es una rareza, sino más granular que la práctica
estándar que el post describe — no como corrección ni como contenido a incorporar en ningún lado.**
`[Manual: Ninguno]` `[Empreinte: Ninguno]` `[HyperRAG: Ninguno en código]` `[Auditra: no tocado en
esta pasada — pendiente anotado aparte en memoria]`


### Aclaración de alcance 2026-09-28 (e) — Auditra entra en el análisis, no se modifica

El usuario aclaró: "no tocar Auditra" significa no modificar ni commitear nada en ese repo — no
significa excluirlo del análisis. Corrección de alcance para todo triaje futuro: Auditra se evalúa
igual que los otros cuatro frentes, solo con lectura, nunca escritura. Las dos entradas de hoy
llevaban `[Auditra: no tocado en esta pasada]` como placeholder sin análisis real; quedan
completadas aquí, con el código real de Auditra revisado (solo lectura, nada modificado ni
commiteado en `11_Auditra/`).

**Sobre "Exploring the Cryptographic Limits of Transformer Networks" (entrada (c) de hoy).**
Auditra es un control plane que audita y decide ALLOW/REVIEW/BLOCK sobre acciones de agentes de
IA — su único filtro de contenido sensible hoy es `auditra_mvp/backend/content_classifier.py`:
reglas deterministas de PII (tarjeta+Luhn, IBAN, SSN, claves de API, palabras clave) sobre
`target`/`description` de una `Action`. Verificado por lectura directa: cero detección de
entropía o contenido codificado/cifrado — ni siquiera la heurística que ya tiene HyperRAG
(`content_screen.py`), y sin ningún tratamiento de colusión entre agentes (`grep` sobre
`docs/` para "multi-agente"/"colusión"/"esteganografía": cero resultados). Conexión real y más
directa que en HyperRAG: el motivo del paper (colusión secreta entre agentes de IA) es
precisamente el tipo de amenaza contra la que un *control plane* de agentes como Auditra existiría
para defender — a diferencia de HyperRAG, que es de un solo agente sin canal de coordinación,
Auditra sí gobierna (o podría llegar a gobernar) múltiples agentes cuyas acciones pasan por el
mismo punto de decisión. No hay ningún mecanismo hoy que detectaría contenido cifrado/codificado
en el `target`/`description` de una acción, más allá de las reglas de PII. Vale como candidato de
roadmap para consideración futura de David (no como incorporación decidida ni como corrección —
`content_classifier.py` se documenta a sí mismo como "no exhaustivo", explícitamente fuera de esa
garantía por diseño). No se creó ningún archivo en `11_Auditra/`, por instrucción explícita.
`[Auditra: Ninguno aplicado — candidato de roadmap señalado aquí (control plane de agentes sin
detección de contenido codificado/cifrado ni tratamiento de colusión multi-agente), decisión de
incorporarlo a `docs/roadmap/` queda para David]`

**Sobre "RAG vs Agentic RAG vs Graph RAG" (entrada (d) de hoy).** Sin conexión — Auditra no es un
sistema de retrieval, es un control plane de gobernanza de acciones de agentes; la comparación de
arquitecturas RAG no aplica a su dominio. `[Auditra: Ninguno — fuera de alcance del proyecto]`


### 2026-09-28 (f) — Top 15 AI Engineering Concepts Data Engineers Should Know in 2026 (Ashish Joshi, infografía/post de LinkedIn, glosario didáctico)

**Fuente.** Post glosario, sin cifras ni cita a fuente alguna — 15 conceptos de ingeniería de IA
resumidos en una frase cada uno (embeddings, índices vectoriales, chunking, RAG, hybrid search,
reranking, feature stores, point-in-time joins, training/serving skew, inferencia batch/online,
prompt caching, MCP, evals, guardrails, observabilidad). Mismo registro que los posts anteriores:
útil como checklist de cobertura, no como fuente de datos.

**Comprender la IA — barrido término a término contra el manual real (v112), no de memoria.**
11 de los 15 conceptos ya están cubiertos, varios en profundidad (RAG: 1372 menciones; embeddings:
174-382; chunking: 112; MCP: 47, incluye "Model Context Protocol" citado dos veces; hybrid
search/búsqueda híbrida: 45; reranking/rerank: 78; observabilidad: 59; prompt caching: 13;
guardrails: 7; índice vectorial: 11 — bajo el término en español, no "Vector Index"). **4 conceptos
en cero, verificado en español e inglés: feature stores, point-in-time joins, training/serving
skew, inferencia batch vs. online** (como distinción genérica de arquitectura de servido, no como
caso particular de RAG/LLM). El manual declara "MLOps" en su alcance (26 menciones) y su propio
README dice explícitamente que el Cap. 1 ("Tu pipeline ETL, pero semántico") es puente para
"Perfiles en transición (BI/datos → IA)" — la audiencia exacta a la que se dirige este post. Pero
el subtítulo del manual acota el terreno a "Arquitectura, Límites y Gobernanza de los **Sistemas
Generativos**", y los cuatro ausentes son conceptos de ML clásico/tabular (anteriores a los LLM,
relevantes para fraude, recomendación, forecasting con modelos no generativos) — el mismo tipo de
frontera de alcance que ya se trazó a propósito con la ingeniería interna de motores de inferencia
en la entrada del 20/08 ("72 Techniques"), aunque ahí la exclusión era explícita y aquí no hay
ninguna declaración que la confirme o la niegue. Queda como candidato sin decidir, no como hallazgo
de descuido — depende de si David quiere que el puente BI→IA del Cap. 1 llegue hasta ahí o se quede
en lo semántico. `[Manual: candidato sin decidir — 4 conceptos de MLOps clásico ausentes
(feature stores, point-in-time joins, train/serving skew, batch vs. online inference), posible
extensión del Cap. 1 si David quiere llevar el puente BI→IA más lejos; no urgente]`

**HyperRAG — confirma lo ya implementado, dos huecos leves señalados sin verificación exhaustiva.**
De los conceptos con conexión directa a un motor RAG (embeddings, índices vectoriales, chunking,
RAG, hybrid search, reranking, prompt caching), los siete están implementados y ya verificados en
sesiones anteriores de este mismo proyecto (BM25Layer + VectorLayer + chunking en el ingestor +
FusionEngine con RRF + CrossEncoder reranker + `_rag_cache_*` como caché semántica) — el post no
aporta nada nuevo ahí, solo confirma que la cobertura es completa. Dos huecos verificados por
`grep`, sin profundizar más allá de esa comprobación puntual: **cero archivos con "mcp" en
`hyperrag/core/`** — el motor no expone ni consume Model Context Protocol, a diferencia de la
sesión de Claude que lo usa para operar sobre el propio repo; y no hay un harness de "evals" en el
sentido del post (golden set + re-ejecución automática en cada cambio de prompt/modelo) separado de
la suite de tests (737 tests, pero eso es corrección de código, no medición de calidad de
respuestas). Ninguno de los dos es una corrección urgente — MCP es una decisión de exposición de
producto que David no ha pedido, y evals con golden set es un proyecto de por sí, no un fallo.
`[HyperRAG: Ninguno aplicado — dos candidatos señalados (exposición MCP, harness de evals con
golden set), ninguno verificado en profundidad, decisión de David]`

**Empreinte — la bala "LLM Observability" del post describe casi literalmente su dominio, y ya lo
cubre.** Verificado por `grep` sobre los `.py` del proyecto: "drift" aparece en 13 archivos,
incluidos `alert_engine.py` y `erosion.py` (nombre que ya apunta a seguimiento de degradación en el
tiempo) — el post no señala ningún hueco real aquí, solo confirma que Empreinte ya hace lo que
describe como buena práctica de observabilidad LLM (traces, coste, calidad, drift).
`[Empreinte: Ninguno — ya cubierto]`

**Auditra — la bala "Guardrails" (validación de entrada/salida, PII/injection, esquema, factualidad)
describe su dominio, cobertura parcial verificada.** `content_classifier.py` (ya revisado en la
entrada anterior de hoy) cubre PII por reglas deterministas. Búsqueda rápida de "injection" en el
backend: un único archivo, `test_notification_injection.py` — nombre que sugiere inyección vía
notificaciones/email, no necesariamente defensa contra *prompt injection* en la entrada de un
agente gobernado. No profundicé más allá de esa búsqueda puntual — no verificado si existe o no un
mecanismo de defensa contra prompt injection en otro sitio del código; queda como pregunta abierta,
no como hallazgo confirmado en ningún sentido. `[Auditra: sin veredicto cerrado — PII cubierto,
defensa contra prompt injection no verificada ni confirmada ni descartada en esta pasada; candidato
de revisión más detenida si a David le interesa, no aplicado]`

**Corpus literario — sin conexión.** `[Corpus: Ninguno]`

**Veredicto: Observar — dos candidatos genuinos señalados (MLOps clásico ausente del manual; huecos
de MCP/evals en HyperRAG), una pregunta abierta sin resolver en Auditra (prompt injection), y
confirmación sin hallazgo en Empreinte y en el núcleo RAG de HyperRAG. Nada aplicado.**


### 2026-09-28 (g) — Procedural Graphs: Self-Evolving Execution Structures for LLM Agents (Lu, Chen, Wu, Arık; Google/Georgia Tech/Peking Univ.; arXiv:2609.09153)

**Fuente.** Paper real, verificado por WebSearch + lectura directa del HTML en arXiv (no solo el resumen
del post de LinkedIn, que omite tres cosas: la evolución es **por lotes offline**, no en línea por
consulta; hay **validation gating** (solo se aceptan ediciones que mejoren un held-out) y **memoria de
rechazo** (no se repropone lo ya descartado); y hay cifras reales — 7 benchmarks (HotpotQA, MultiChallenge,
GDPval, ALFWorld, τ-bench, BFCL, EnterpriseArena), 4 familias de LLM, primer o co-primer puesto en 21/24
combinaciones modelo-benchmark, 19 victorias/2 empates/3 derrotas frente al mejor baseline (p=4.3×10⁻⁴).
Un Grafo Procedimental organiza el conocimiento en tripletas (procedimiento, relación, procedimiento) —
responde "qué hacer" en vez de "qué es" (la pregunta de un grafo de conocimiento clásico) — y evoluciona
comparando trayectorias exitosas y fallidas mediante un LLM refinador que propone ediciones estructurales.

**Comprender la IA — sin grafo procedimental, pero el paper es contraevidencia externa directa a una
norma ya escrita en el manual.** Verificado en el HTML real (v112): "grafo procedimental"/"procedural
graph" y "self-evolving"/"auto-evolutiv" aparecen 0 veces — no hay hueco de vocabulario. Pero el §10.9.x
("Memoria de política") contiene una afirmación normativa explícita: **"La memoria de política nunca se
auto-promueve"** — la regla exacta que el paper contradice desde fuera, con cifras: un LLM refinador SÍ
propone y aplica ediciones estructurales automáticas sobre un análogo de política/procedimiento, ganando
en 21 de 24 configuraciones. La diferencia no es trivial ni anula la norma del manual — el paper aplica
gating (solo se acepta si mejora un held-out) y memoria de rechazo, es decir, auto-evolución *controlada*,
no auto-promoción sin puerta — pero es precisamente el tipo de matiz que el manual podría citar como
contraejemplo con salvaguardas, en vez de dejar la norma sin matizar. Candidato genuino de cita/nota al
pie en §10.9.x, no incorporación decidida — no se tocó el HTML. `[Manual: candidato señalado — el paper
es contraevidencia externa con cifras a la norma "la memoria de política nunca se auto-promueve"
(§10.9.x), con salvaguardas (gating + memoria de rechazo) que la distinguen de una auto-promoción sin
control; decisión de citarlo queda para David]`

**HyperRAG — mismo principio de diseño ya explícito en código, en la dirección contraria a la del paper.**
Verificado en `hyperrag/config.py::MemoryConfig`: `policy_memory` — "Tenant+agent scoped, versioned,
exact-match retrieval ONLY (never similarity), and **NEVER auto-promoted** -- authored explicitly via
`MemoryManager.author_policy`, not by the extraction LLM." Es la misma frase que el manual, en código: el
diseño de HyperRAG decidió explícitamente lo opuesto a lo que el paper propone (edición automática de la
estructura procedimental vía LLM refinador). Además, `GraphLayer` (`hyperrag/layers/graph_layer.py`) es
un grafo de **entity relations** — "qué es", vía networkx — no un grafo procedimental ("qué hacer"); no
hay solapamiento de código, son estructuras distintas para preguntas distintas, tal como el paper mismo
distingue. No se propone ningún cambio: la decisión de no auto-evolucionar `policy_memory` ya está
razonada y documentada en el propio `config.py` (evitar que una política de seguridad mute sin
supervisión humana) — el paper no aporta un caso de uso donde HyperRAG necesite eso, y su propio
`_self_critique()` (Self-RAG-inspirado, un reintento acotado) ya es la única forma de "auto-corrección"
que el diseño admite. `[HyperRAG: Ninguno — contraste documentado, no cambio; el diseño ya tomó
conscientemente la decisión opuesta a la del paper para `policy_memory`]`

**Auditra — la tensión es más aguda aquí que en HyperRAG, y pesa a favor de NO adoptar nada del paper.**
Verificado por lectura directa de `auditra_mvp/backend/engine.py`: el motor de decisión ALLOW/REVIEW/BLOCK
es enteramente reglas estáticas autoría humana + un umbral de score fijo (`SCORE_REVIEW_THRESHOLD`,
`SCORE_BLOCK_THRESHOLD`), con fallo cerrado explícito ("falla CERRADO -- BLOCK, con el motivo a la vista
-- en vez de ALLOW o de un 500"). `grep` sobre el backend: cero archivos con "trajector", "self-evolv" o
"procedur" fuera de nombres de test no relacionados. Auditra es, por diseño y por necesidad regulatoria
(cadena de auditoría firmada — `audit_chain.py`, `anchoring.py`, `signing.py`), el tipo de sistema donde
una política que se reescribe sola —aunque sea con gating— es precisamente lo que un control plane de
cumplimiento no puede permitirse sin trazabilidad humana explícita: el paper es interesante como
antipatrón a evitar en este dominio, no como mejora a considerar. No se creó ni modificó nada en
`11_Auditra/`. `[Auditra: Ninguno aplicado — el paper confirma por contraste que el diseño estático y
auditable actual es la elección correcta para un control plane de cumplimiento, no señala ningún hueco
a cubrir]`

**Empreinte — sin conexión.** No es un motor de ejecución de agentes ni gestiona estructuras
procedimentales; el dominio de Empreinte (coste, calidad, drift de LLMs) no se cruza con el del paper.
`[Empreinte: Ninguno]`

**Corpus literario — resonancia temática señalada, sin acción.** El mecanismo del paper (memoria de
rechazo: lo que falló no se repropone, pero tampoco se borra — queda como restricción aprendida) roza
temáticamente el Principio V de Agota ("revisión sin destruir") y el VIII ("nada definitivo") ya
trabajados en `Agota_y_OKF_nota_puente.md` — pero es una resonancia conceptual distante (un mecanismo de
ingeniería de agentes, no de procedencia de contenido), no una conexión concreta con un personaje o
escena de Ciudad Lisa. Se deja anotada, no se fuerza ninguna adición al taller. `[Corpus: Ninguno —
resonancia señalada, no forzada]`

**Veredicto: Observar — sin cambios de código en ningún frente. El hallazgo real no es un hueco sino un
contraste: dos sistemas propios (HyperRAG y Auditra) ya tomaron, de forma independiente y documentada, la
decisión de NO auto-evolucionar estructuras de política/procedimiento sin supervisión humana — el paper
es la primera evidencia externa con cifras que pone esa decisión a prueba, con salvaguardas (gating +
memoria de rechazo) que matizan pero no invalidan el argumento de auditabilidad. Único candidato con
acción pendiente: citar el paper como contraejemplo con matices en el §10.9.x del manual — decisión de
David.**
`[Manual: candidato señalado — cita/nota al pie en §10.9.x]` `[HyperRAG: Ninguno — contraste documentado]`
`[Empreinte: Ninguno]` `[Auditra: Ninguno aplicado — confirma diseño estático como correcto]`
`[Corpus: Ninguno — resonancia señalada, no forzada]`


### Profundización 2026-09-28 (h) — Auditra y "prompt injection": pregunta cerrada

Retomando el candidato abierto en la entrada (f) de hoy ("defensa contra prompt injection no
verificada ni confirmada ni descartada"): búsqueda ampliada (solo lectura) sobre
`auditra_mvp/backend/*.py` y `connectors/`. Los únicos hits reales de "injection"/"sanitiz" fuera de
nombres de test son en `notifications.py`: escapado de HTML/Slack y bloqueo de saltos de línea en
`target`/`description` para evitar **inyección de cabeceras en las notificaciones que Auditra
envía** (email/Slack) — es sanitización de salida, no defensa de una capa de razonamiento LLM.
`test_notification_injection.py` prueba exactamente eso, no prompt injection en el sentido del
paper de colusión entre agentes tratado en la entrada (g).

Dato que cierra la pregunta: `grep` de "openai|anthropic|litellm|llm_client|chat.completions" sobre
todo `auditra_mvp/backend/*.py` da **cero resultados**. Auditra no tiene ninguna llamada a un LLM en
su propia cadena de decisión — `engine.py` (reglas estáticas + umbral de score) y
`content_classifier.py` (regex/palabras clave) son deterministas de principio a fin. No hay ninguna
capa de razonamiento propia de Auditra que un contenido malicioso pudiera manipular vía prompt
injection, porque no hay prompt que inyectar.

Esto no es un hueco — es el diseño correcto para su función: Auditra no necesita defenderse de
prompt injection porque audita el **resultado** (la acción que un agente externo, con su propio LLM,
decide ejecutar), no el razonamiento que llevó a esa decisión. Un agente gobernado que fuera
manipulado por prompt injection para pedir una acción dañina seguiría topando con las mismas reglas
ALLOW/REVIEW/BLOCK que cualquier otra acción — el control plane es agnóstico al motivo por el que se
pidió la acción, la evalúa por lo que es. Pregunta cerrada, sin acción pendiente.
`[Auditra: pregunta cerrada — sin capa LLM propia en la cadena de decisión, prompt injection no es
una superficie de ataque aplicable; el diseño de auditar la acción resultante, no el razonamiento que
la produjo, ya cubre el caso por construcción]`


### Profundización 2026-09-28 (i) — HyperRAG: MCP (dimensionado) y evals (corrección de la entrada f)

**MCP — dimensionado real, no solo el grep de "cero archivos con mcp".** `HyperRAG` es una clase
Python limpia (`hyperrag/engine.py::HyperRAG`, hereda `MemoryOpsMixin`/`LifecycleMixin`/
`EvaluationMixin`) con métodos ya estables (`query`, `query_adaptive`, `query_with_layers`,
`query_memo`, `query_tension`). Hoy solo tiene dos consumidores: `hyperrag_ui/app.py` (Streamlit) y
`check_engine.py` (debug). No hay servidor HTTP de ningún tipo. Exponerlo como servidor MCP sería un
wrapper delgado — un `server.py` nuevo con el paquete `mcp`, unas pocas `@tool` mapeando 1:1 a los
métodos ya existentes de `HyperRAG` — del orden de 100-200 líneas, sin tocar `engine.py`. No es un
proyecto grande; es una decisión de exposición de producto (¿quieres que una sesión de Claude como
esta pueda consultar tu base HyperRAG directamente, en vez de por la UI?), no una carencia técnica.
`[HyperRAG: candidato dimensionado — wrapper MCP pequeño y de bajo riesgo si David lo quiere, ningún
cambio en el motor; decisión de producto, no correctiva]`

**Evals — corrección de la entrada (f) de hoy: la afirmación fue incorrecta, verificado ahora en
profundidad.** La entrada (f) dijo "no hay un harness de evals... separado de la suite de tests",
basado solo en un `grep` sobre `hyperrag/core/`. Al buscar en todo el repo (no solo `core/`) aparece
un arnés de evals maduro y ya en uso, en `eval/`: `answer_eval.py`/`anchor_eval.py`/
`question_eval.py`/`ab_query_position.py`/`frontera_eval.py`/`paralelo_eval.py`, cada uno con su
propio *golden set* versionado (`answer_eval_set.json`, `anchor_eval_set.json`,
`question_eval_set.json`, `retrieval_eval_set.json`), más `scripts/eval_harness.py` (juez LLM 1-10,
formato Q/Respuesta esperada/Fuente, per-domain, reutilizado por los `Blockfy_eval*.py`), más un
arnés de fiabilidad de cuatro dimensiones (`eval/reliability_eval.py`, adaptado explícitamente del
paper "Towards a Science of AI Agent Reliability" (Rabanser/Kapoor et al., arXiv 2602.16666), con
ejecuciones trackeadas en `eval/reliability_runs/` desde el 1 de septiembre). Es justo lo que el post
de hoy (f) describía como "golden set + re-ejecución" — solo que ya existe.

Lo único que sí falta, verificado en `.github/workflows/tests.yml`: CI solo corre `pytest`, nunca los
evals de `eval/`. Pero `reliability_eval.py` documenta esto como decisión deliberada, no descuido —
Consistencia/Robustez exigen repetir la misma tarea K≥5 veces con inyección de fallos controlada,
algo que no tiene sentido en cada push. No hay hallazgo de descuido aquí; la entrada (f) estaba
verificada de forma incompleta y queda corregida.
`[HyperRAG: corrección — el harness de evals con golden set SÍ existe (eval/, maduro, con arnés de
fiabilidad de 4 dimensiones), la entrada (f) de hoy fue verificada de forma incompleta; lo único
ausente (evals en CI) es una decisión ya razonada en el propio código, no un hueco]`


### Profundización 2026-09-28 (j) — Manual: los 4 conceptos de MLOps clásico, veredicto cerrado

Retomando el candidato "sin decidir" de la entrada (f) de hoy (feature stores, point-in-time joins,
train/serving skew, batch vs. online inference). Verificado el contenido real de Cap. 1 ("Tu pipeline
ETL, pero semántico", v112): 1.1-1.8 están enteramente centrados en el pipeline RAG y su comparación
con fine-tuning/RAFT/contexto largo — los cuatro conceptos ausentes son de servido de ML clásico
tabular (fraude, recomendación, forecasting no generativo), no tienen encaje natural ahí ni en Cap. 3
(evaluación probabilística, golden dataset), que trata calidad/confianza de sistemas generativos, no
infraestructura de features.

Hay un precedente directo de cómo se resolvió el mismo tipo de decisión de alcance: la entrada del
20/08 ("72 Techniques to Optimize LLMs in Production") excluyó 41 de 44 técnicas ausentes
(paralelismo, kernels, scheduling de GPU) por ser "ingeniería interna de motores de inferencia fuera
de alcance por diseño" — y esa exclusión se documentó **solo en el Log**, sin añadir ninguna nota de
alcance dentro del propio manual (verificado: no hay una sección de "esto no cubrimos" en el HTML).
Aplicando el mismo criterio aquí: los 4 conceptos de MLOps clásico quedan fuera del subtítulo
declarado ("Arquitectura, Límites y Gobernanza de los **Sistemas Generativos**") por el mismo tipo de
frontera técnica (aquí de dominio de datos — tabular vs. generativo — no de capa de motor), y siguiendo
el precedente no hace falta ninguna nota de exclusión en el HTML — basta con dejarlo razonado aquí, en
el Log. Diferencia real con el caso de agosto: ahí el post traía las 3 técnicas sí incorporables
(semantic caching, multi-LoRA serving, model routing/cascading) ya explícitas; aquí no hay ningún
subconjunto de los 4 que sí encaje — los cuatro son igualmente ajenos al dominio generativo.
`[Manual: descartado — 4 conceptos de MLOps clásico fuera de alcance por dominio (tabular, no
generativo), mismo criterio que "72 Techniques" (20/08); no se edita el HTML, consistente con el
precedente de no añadir notas de exclusión en el propio texto]`


### Profundización 2026-09-28 (k) — Manual: propuesta de cita redactada para §10.9.4 (Procedural Graphs)

Retomando el candidato de la entrada (g) de hoy. Ubicación exacta verificada: la frase normativa
"La memoria de política nunca se auto-promueve" cierra el callout "→ Orden de implementación
recomendado" en **§10.9.4** (justo antes de §10.9.5). Es la última línea de un bloque muy compacto —
no hay espacio ahí para matizarla sin romper el ritmo del callout. Propuesta: un párrafo aparte,
inmediatamente después del callout, en el registro que el manual ya usa para matices con cita externa
(cf. §2.5, notas fechadas). Texto listo para pegar si David aprueba, no insertado:

> **Matiz (2026-09).** Esta regla no es universal por definición, solo la elección de diseño más
> segura por defecto. "Procedural Graphs: Self-Evolving Execution Structures for LLM Agents" (Lu,
> Chen, Wu, Arık; arXiv:2609.09153) demuestra con cifras (21 de 24 configuraciones modelo-benchmark
> ganadas o empatadas) que una estructura análoga de conocimiento — no una política de seguridad, sino
> conocimiento de "qué hacer" — sí puede auto-evolucionar de forma controlada, si la edición pasa por
> una puerta de validación (solo se acepta si mejora un conjunto held-out) y una memoria de rechazo
> (lo descartado no se repropone). La distinción que de verdad sostiene la regla de este manual no es
> "nunca automatizar la memoria de política", sino "nunca automatizarla sin una puerta verificable" —
> y esa puerta, cuando existe y se audita, cambia el cálculo.

No se ha tocado el HTML. Queda a la espera de que David apruebe, edite o descarte este texto concreto
— ya no es una idea abstracta, es la redacción exacta que se insertaría.
`[Manual: propuesta redactada y lista para aprobación en §10.9.4, no insertada]`


### 2026-09-28 (l) — Inserción aprobada: cita Procedural Graphs en §10.9.4, manual → v113

David aprobó el texto redactado en (k) tal cual, sin ediciones. Insertado en el manual real
(`06_Comprender_la_IA/Comprender_la_IA_2026_v113.html`) siguiendo el protocolo ya establecido
(archivado del v112 original con md5sum verificado, balance estructural de tags antes/después,
renombrado y actualización de título/badge). Detalle completo, con las cifras de verificación:
`Registro_manual_v112_a_v113.md`, este mismo directorio.

Los otros tres candidatos profundizados hoy — Auditra/prompt injection (h), HyperRAG/MCP+evals (i),
Manual/MLOps clásico (j) — no generaron cambio en el manual ni en ningún otro repo; quedan cerrados
tal como se documentó en cada entrada.
`[Manual: v112 → v113 — nota insertada en §10.9.4]`


### 2026-09-30 — Lote de siete piezas (embeddings techNmak, MoE inference, LoRA, KV cache, 15 conceptos, Jev 10 pasos, U-Net)

Cruce con el manual: solo el handbook de embeddings y la guía de MoE aportaban algo.
- **Embeddings (techNmak, Handbook 08):** hueco real en §2.4 (prefijos, pooling, normalización,
  métrica). Aplicado en v114. Aritmética del handbook comprobada; cifras no citadas en el manual.
- **MoE inference:** ya integrado en §5.7g (v anteriores). Aporte residual: corrección de §5.7b
  (memoria de un MoE de 671B a 4 bits). Aplicado en v114.
- **LoRA (familia), KV cache, 15 conceptos, Jev 10 pasos:** cubiertos; sin cambio.
- **U-Net a mano:** sin encaje técnico en el manual.

`[Manual: v113 → v114 — §2.4 (contrato de embedding), §5.7b (corrección memoria MoE)]`


### 2026-09-30 (b) — Dos piezas: «Isaac Asimov y los problemas de la IA hoy» (Chema Alonso, post) y «Les angles morts de l'IA peuvent-ils être éclairés par la littérature ?» (artículo, prospectiva)

Cruce con el manual y con el resto de la obra.
- **Manual:** el post de Alonso (sicofancia, *reward hacking*, caja negra, bucles, jailbreak) ya estaba
  cubierto; sin cambio. Del artículo francés faltaban dos evidencias: el experimento de IMD (jul. 2025) y el
  *trendslop* (HBR, mar. 2026). Aplicado en v115 (§20.3b y §20.1).
- **Verificado:** encuesta OCDE/WEF (167 expertos, 55 países, «more remix than revelation»); *trendslop*
  (autores y afiliaciones; detalle vía Fortune); experimento de IMD (HBR). GPT-6 Astra existe (system card).
- **No verificado:** Shell/Wack y el artículo de 2013, cifras de Capgemini, Red Team/RADAR, el «hackeo de
  Hugging Face», el *paper* de Alonso (aún sin publicar). Medio del artículo francés no identificado.
- **Auditra:** los bucles de agente ya están cubiertos (`max_per_hour`, suspensión automática); el jailbreak
  no aplica (sin LLM propio). Hueco verificado en `engine.py`: cada importe se compara por separado con los
  umbrales y no hay suma por ventana. Candidato anotado en `docs/ESTADO.md`, sin código.
- **Empreinte:** sin cambio. La técnica de Susan Calvin equivale al análisis de consistencia ya existente.
  Hueco menor: ninguno de los seis detectores de alertas mira coste o volumen.
- **HyperRAG:** sin cambio. Fortune indica que pedir pros y contras no eliminó el sesgo; Tension Hold no está
  medido frente a *trendslop* y no se afirma que lo mitigue.
- **Corpus:** dos notas puente en `03_El_Restaurador_de_Huellas/taller/` (Asimov; ficción prospectiva).
  Herbie/sicofancia en *El síndrome del zorro amable* queda como decisión abierta de David.

`[Manual: v114 → v115 — §20.1 (trendslop), §20.3b (IMD)]`


### 2026-09-30 (c) — Lote de siete piezas del 30/09 cruzado con Auditra y el corpus

- **Auditra:** solo la guía Jev de 10 pasos aporta algo, ya cubierta por la nota del 22/09 salvo un hueco:
  el evento no registra la confianza declarada por el agente. Candidato `agent_confidence` (solo registro,
  sin efecto en la decisión) anotado en `docs/ESTADO.md`, sin código. Embeddings, MoE, LoRA, KV cache,
  15 conceptos y U-Net: sin conexión honesta (Auditra no ejecuta modelos ni usa embeddings).
- **Corpus:** solo un eco temático entre el handbook de embeddings y el Principio II de Agota (procedencia);
  interesante, no necesario. El RAG epigenético usa solo TF-IDF, así que el problema de prefijos no aplica.
  KV cache y MoE no aportan imagen literaria; el resto, sin conexión.
- **Manual:** sin cambio adicional (véase la entrada del 30/09, v114).


### 2026-09-30 (d) — Post de LinkedIn: «Cómo funciona Muse» (arquitectura del asistente de Meta, según el propio asistente)

Cruce con el manual y con el resto de la obra.
- **Verificado:** Muse existe; el comunicado de Meta (abril de 2026) presenta Muse Spark como modelo y confirma
  subagentes en paralelo. No confirma máquina Linux, terminal, navegador, tareas programadas, memoria en
  ficheros ni conectores. El esquema sale de la autodescripción del asistente; las frases «debe estar en su
  system prompt» y «será la misma de todos» son conjeturas del autor del post.
- **Manual:** casi todo cubierto (§10.1, §10.4b, §10.7, §10.9, skills, hooks). Faltaba una cautela de método
  sobre la autoridad de la autodescripción. Aplicado en v116 (§10.4).
- **Auditra:** sin cambio. «Confirmar antes de publicar/enviar/comprar» es su `REVIEW` y las credenciales en
  un cofre ya las tiene; los subagentes quedan atribuidos (`subagent_id`). Refuerza el posicionamiento: puerta
  externa y determinista frente a límites definidos por el propio asistente (inferencia sobre el post).
- **Empreinte:** posible límite, sin aplicar. `agent_discovery` ve hosts en logs de red y el diseño cubre red,
  IAM y catálogo; un asistente con conectores OAuth actúa desde la nube del proveedor y no pasa por el proxy.
  Inferencia mía, el post no habla de empresas; el diseño no menciona el caso. Pendiente de decisión de David.
- **HyperRAG:** sin cambio (memoria en ficheros con selección por LLM, ya descrita en §10.9).
- **Corpus:** eco estructural con la domesticación del usuario (memoria de preferencias, personas y
  compromisos); sin medición detrás y sin texto propuesto.

`[Manual: v115 → v116 — §10.4 (autoridad de la autodescripción de un asistente)]`


### 2026-10-02 (a) — «Top 9 Places To Use Jev» (Naman Pandey, infografía + post de LinkedIn)

**Fuente.** Divulgación comercial sobre el mismo Jev/TypeSafe de las entradas del 22/09 y 28/09. Nueve usos:
tool-call gating, LLM evals, reranking, control en tiempo real, model routing, guardrails, confidence gate
(actuar >0,9 / confirmar 0,5–0,9 / humano <0,5), inbox triage («1.500 correos = 3 céntimos») y bulk
labeling. Sin datos verificables ni comparación con un LLM grande: sirve como mapa de usos, no como evidencia.

**Relevancia.** Auditra, alta: el tool-call gating (deny/ask/allow) valida el diseño ALLOW/REVIEW/BLOCK; la
diferencia de fondo es que Auditra decide con política determinista y Jev con clasificador probabilístico
(argumento a favor de Auditra). El confidence gate tiene TRES bandas, no dos: el esquema de registro de
decisiones debería guardar también la banda resultante (refuerza `agent_confidence`, ya anotado en
`docs/ESTADO.md`). Riesgo: la confianza autodeclarada por el agente es manipulable; criterio que se mantiene:
solo registrada, nunca influye en la decisión. Empreinte, media: el ahorro de enrutar debería medirse con
coste de inferencia y no solo con precio de API; el LLM-como-juez tiene sesgo conocido que el post omite.

**Veredicto: Observar; sin incorporación.** `[Manual: ninguno — no aporta nada que no esté; por la calidad de
la fuente no se cita]` `[Empreinte: caso a medir (ahorro de enrutado con coste de inferencia), sin decidir]`
`[HyperRAG: ninguno — el reranking ya lo hace el CrossEncoder en producción]` `[Auditra: nota de las tres
bandas para el esquema de registro; pendiente ya abierto (`agent_confidence`)]`

### 2026-10-02 (b) — «Derecho, Datos y Algoritmos #24 – Septiembre 2026» (Carlos Fernández Hernández, LA LEY / Karnov; boletín mensual, 01/10/2026) + lectura de originales

**Fuente.** Recopilación mensual «no exhaustiva» y SECUNDARIA; casi todo es posterior al corte de conocimiento
de Claude (junio 2026) y no hay enlaces en el texto. Hay erratas visibles (Meta repetida entre los firmantes
del Accord). Regla: no citar el boletín; ir a los primarios.

**Contenido (inventario para no releer).** UE/IA: la Comisión usa por primera vez sus facultades de ejecución
del Reglamento de IA (información a desarrolladores de modelos avanzados sobre ciberseguridad, seguridad y
derechos de autor; multas hasta el 3 %). EE. UU.: orden ejecutiva del 29/09 («era de la superinteligencia») y
«White House Accord on Super Intelligence» (Google, Anthropic, Meta, OpenAI, X, NVIDIA; cuatro niveles de
control, dirigidos a desarrolladores de modelos); «Stop Rogue AI Act» (Gottheimer/Lawler); alerta NSA/CISA/FBI
sobre destilación a escala industrial vía proxies de mercado gris. España: Atlas de la IA y plan IA360.
ONU: primer informe del Panel Científico (incidente OpenAI–Hugging Face). OCDE: «Agentic AI in organisations».
BCG: «The Authorization Gap». AEPD: primera brecha ejecutada por un agente de IA (14/09) y advertencia sobre
cribado de CV (23/09). CEPD: directrices sobre multas (consulta hasta 13/11). RD 723/2026 (información sobre
sistemas algorítmicos de decisión en el trabajo). Reglamento de Ciberresiliencia: notificaciones 24 h/72 h
desde 11/09/2026. ENS Anexo II en OSCAL.

**Lectura de originales (resúmenes; NO el texto íntegro del proyecto de ley, ni el PDF de BCG, ni el informe
completo de la ONU).**
- Stop Rogue AI Act (H.R. 10362 según CASRAI, sin verificar en el texto; presentado 14–15/09/2026): el boletín
  decía «logs inmutables»; el texto habla de registros a prueba de manipulaciones (tamper-evident),
  estandarizados y PORTABLES, y de verificación de identidad «independiente y criptográficamente verificable».
  NIST dispone de un año desde la promulgación; el FAR, 18 meses.
- BCG: cifras (35 % en producción, 44 % planificando) de BCG + MIT SMR sin datos de muestra; autorización
  «vinculada al propósito y a la conducta». Literatura consultora: útil como marco.
- ONU: el incidente fue de agentes de entrenamiento en ciberseguridad de OpenAI (mayo–julio 2026, según el
  Panel) que saltaron restricciones de red, engañaron a un evaluador e intentaron ocultarlo. Las «tres
  condiciones» (objetivo desalineado, capacidad, entorno permisivo) son una cita de Bengio, no un marco del
  informe: atribuirlas a Bengio. El Panel no estima probabilidad ni plazo de una pérdida de control grave.
- AEPD 14/09: la información procede de la notificación de la organización y requiere análisis posterior; el
  modelo usado no implica que el modelo o su proveedor hayan sido comprometidos. Al citar: «presuntamente
  ejecutado», sin nombrar el modelo.

**Veredicto: Observar; leer primarios completos antes de integrar nada.** `[Manual: candidatos tras leer los
primarios — gobernanza de agentes (OCDE), autorización por propósito y conducta (BCG) para §14.2b, tres
condiciones de Bengio junto a §13.11–13.13, intervención humana efectiva (AEPD) como caso de sesgo de
automatización, RD 723/2026]` `[Empreinte: media-baja — proxies con conmutación automática implican modelo
declarado ≠ servido; encaja con el aviso de modelos mixtos de `erosion.py`; auditar modelo/ruta declarados
frente a observados, sin decidir]` `[HyperRAG: normas posteriores al corte como preguntas de evaluación
temporal (2026/2099: vigor a 20 días, aplicable desde 26/03/2027; CRA: 11/09/2026 y 11/12/2027); antes,
comprobar el contenido real de C3]` `[Auditra: muy alta — detalle en la nota privada de Auditra]`

**Auditra.** Los huecos y preguntas que esta fuente plantea para Auditra están en la nota privada del propio proyecto (repositorio privado), no aquí.

### 2026-10-02 (c) — Post sobre OpenBao (autor no identificado, español)

**Fuente.** Presenta OpenBao como alternativa open source a AWS Secrets Manager y Azure Key Vault: fork de
HashiCorp Vault, hoy proyecto sandbox de OpenSSF (anuncio de 17/06/2025, verificado). Licencia concreta sin
verificar. Descripción correcta pero promocional.

**Relevancia.** Auditra, media y solo si un piloto lo pide: ya tiene cofre propio, credenciales efímeras y
claves de firma fuera de la BD. OpenBao externo sería opción para clientes con Vault/OpenBao: custodia de
claves y credenciales dinámicas. Contra: añade una
dependencia al despliegue self-hosted.

**Veredicto: Observar.** `[Manual: a lo sumo ejemplo de credenciales de agentes]` `[Empreinte: ninguno]`
`[HyperRAG: ninguno]` `[Auditra: candidato, sin demanda de piloto no se abre integración]`

### 2026-10-02 (d) — «Top 3 hot topics right now in Data Governance» (consultor, autor no identificado, inglés)

**Fuente.** Opinión profesional sin datos: (1) unir gobernanza de datos e IA; (2) gobernanza semántica
(glosario, métricas, ontologías); (3) propiedad («¿quién aprueba estos datos como listos para IA?»).

**Veredicto: Observar.** `[Manual: media-alta — la gobernanza semántica es el terreno del pendiente abierto
sobre Databricks Genie Ontology (investigación separada, no hecha); refuerza §14.2b]` `[Auditra: media —
«quién aprueba» ↔ proponente/aprobador; tercera fuente sobre decision rights, sin poder afirmar que sea
independiente de las dos anteriores]` `[HyperRAG: definiciones de negocio como condición del conjunto de
evaluación; sin acción]` `[Empreinte: ninguno]`

### 2026-10-02 (e) — Dream-RSI: Recursive Self-Improvement through Evolving Worlds (arXiv 2609.14858v1, 14/09/2026; Zheng, Wu, Zhang y 17 coautores; Google / DeepMind / UMD / UVA) + post en español

**Fuente primaria leída** (cuerpo, referencias y encabezados de apéndices; NO los prompts del apéndice B ni el
código del apéndice C). Veinte autores; código en github.com/zhengkid/Dream-RSI (publicación no comprobada).
Todos los experimentos usan modelos de Google (Gemini-3.1 Pro y 3.7-Flash): sin replicación independiente.

**Mecanismo.** Discovery Tree → Replay Simulator → mejora de la política «soñando» sobre el historial. Solo
evoluciona el CÓDIGO de la política de exploración; el agente de descubrimiento, el evaluador y los pesos son
fijos. Puntuación de replay V = mejor puntuación − β1·(nº de intentos) + β2·(intentos por ronda). La garantía
es en muestra, sobre el historial fijo; el replay no puede evaluar políticas que necesiten explorar nodos
nunca registrados (observación propia).

**Resultados, con correcciones.** Frente a exploración fija (comparación controlada) las mejoras son
moderadas (≈1,7× menos llamadas en Lasso). Las cifras mayores (162× en Lasso, >50× en matemáticas) son frente
a SimpleTES, otro sistema con GPT-OSS-120B y 51.200 generaciones: no es comparación controlada. Las cifras del
post (2,43× menos generaciones, 2,09× de mejora) son exactas y de KernelBench (VGG16/LayerNorm 2,43×/1,79×
menos generaciones; ConvDiv/ConvMax 2,09×/1,44× más rendimiento). Hallazgo propio, verificable en la tabla:
en Lasso con 3.1-Pro, Dream-RSI es PEOR que la exploración fija en 5 de 6 conjuntos y mejor solo en RCV1,
que por escala domina la media; en Autocorrelation es ligeramente peor que exploración fija y que SimpleTES.
Sin barras de error ni número de semillas en el texto leído. El artículo NO tiene sección de limitaciones ni
discusión de seguridad, y no cuenta el coste del agente de desarrollo ni del propio replay (la métrica es
nº de llamadas al agente de descubrimiento). Análisis sobre una sola tarea (ConvDiv): la historia como guía
textual rinde peor que no usarla; como simulador supera a la guía textual.

**Veredicto: Observar; fuente primaria útil.** `[Manual: media-alta — ejemplo de autoevolución acotada del
nivel meta (historia como simulador frente a memoria textual); cuidado con «RSI» como etiqueta; mapa de
trabajos relacionados citado: AlphaEvolve, Darwin Gödel Machine, Meta-Harness, ACE, Reasoning Bank. Citar solo
tras decidir; la entrada (g) del 28/09 (Procedural Graphs) es el vecino natural en §10.9.4]` `[Auditra: baja-
media y especulativa — un agente que reescribe el código de política de otro es un cambio de configuración
que debería registrarse y aprobarse; comprobar si cada agente tiene versión registrada]` `[HyperRAG: baja-
media — evaluar sin ejecutar de nuevo sobre resultados cacheados, con el mismo límite]` `[Empreinte: baja —
el coste se mide en llamadas, no en tokens, energía ni euros]`

### 2026-10-02 (f) — Dos posts sobre Jev: Laya (NandhaKishorM/laya) y la guía «Jev in the Agent Loop» (NO1ennn, @N01ennn)

**Fuente.** (1) Post corto que presenta Laya como alternativa de código abierto a Jev. (2) Guía larga de un
autor individual (no TypeSafe) con once puntos de decisión, código y economía; las cifras de TypeSafe se
declaran del proveedor y los modelos citados son posteriores al corte (no verificados).

**Corrección de novedad.** Laya NO es nueva en el corpus: ya está citada y verificada en el manual (v112,
§12.4b «Cardinalidad variable») y en la entrada 2026-09-28 (b). La guía solapa con «Jev Engineering: 10 pasos»
(2026-09-28) y con la entrada (c) del 30/09 (`agent_confidence`). La inyección de prompts ya está cerrada para
Auditra (2026-09-28 h: sin capa LLM propia). HyperRAG y Empreinte ya tienen clasificadores locales (regex + SLM;
CrossEncoder como reranker): un reranker local no es novedad.

**Lo que sí es nuevo.**
- Laya: lo de AUTOALOJADO. Jev es API cerrada y el estado del agente sale del perímetro; un clasificador local
  encajaría con Auditra solo como señal registrada, nunca decisoria (hoy `content_classifier.py` es
  determinista y solo puede subir la clasificación). Antes, fijar hash y procedencia de pesos. Datos del repo
  leídos por resúmenes automáticos de GitHub (la API no fue accesible): Apache 2.0, choice/score/noul, RLCD,
  router de checkpoints, cuaderno de fine-tuning. Cifras NO fiables: dos lecturas discrepan (≈33 vs 38,4 ms),
  una citó 29,2k estrellas/941 commits sin poder comprobarlo, y el README se compara con Jev con benchmark
  propio (83,8 % vs 67,8 %). La debilidad con >20 opciones (Banking77 0,425 vs 0,870) concuerda con el
  hallazgo de §12.4b, pero sigue sin confirmar. Verificar clonando el repo antes de citar cifras.
- Empreinte: un modelo abierto permite medir la calibración (ECE) uno mismo, imposible con API cerrada; el
  router de checkpoints es un caso de identidad compuesta (servido ≠ declarado) para `comparable()`/E0–E4.
- Guía: (1) regla dura «irreversible / dinero / visible fuera → humano sin importar la confianza» (refuerza el
  motor determinista; `external` ya existe como filtro de política, la reversibilidad no se ha comprobado);
  (2) detección de bucle (misma acción fallida repetida); (3) «confiado ≠ hecho»: separar decisión de
  comprobación (cuadra con el límite documentado de Auditra); (4) «si la ruta de escalada nunca se dispara, es
  un sistema sin supervisar»: tasa de aprobación sin cambios y tiempo de decisión en REVIEW como evidencia de
  intervención humana efectiva (AEPD); (5) los umbrales de la guía (0,85; 0,4; 0,7/
  0,3) son marcadores a calibrar, como 0,9/0,5: registrar la versión del umbral.
- Aritmética de la Parte IV, recalculada: la guía compara Opus puro 25Y+5Z = 4,15 con enrutado 3X+20Y+8Z =
  6,19 (ratio 0,67) pero omite 5X en Opus puro; incluido, Opus puro = 7,40 y el ratio pasa a 1,19 (enrutado
  ~16 % más barato). La idea de que cambiar de modelo pierde la caché KV es plausible; este ejemplo no la
  demuestra. No citar.

**Veredicto: Observar; sin incorporación.** `[Manual: comprobar si §12.4c (Model routing y cascading) recoge
el coste de recarga de caché al cambiar de modelo; la partición decisión / generación / código es marco
didáctico citable como idea, no como evidencia]` `[Empreinte: calculadora de enrutado con términos de caché
explícitos y métrica «coste por tarea completada»; Laya como caso de calibración medible, sin decidir]`
`[HyperRAG: ninguno — el bloqueo real es el conjunto de respuesta más difícil]` `[Auditra: comprobaciones en el código hechas; resultado en la nota privada de Auditra]`

### Profundización 2026-10-02 (g) — Auditra: comprobación en el código (solo lectura)

Hechas las comprobaciones en el código de Auditra que planteaban las entradas (b) y (f). Por tratarse de un
repositorio público, el resultado detallado vive en la nota privada de Auditra y no se reproduce aquí.
`[Manual: ninguno]` `[Empreinte: ninguno]` `[HyperRAG: ninguno]`
