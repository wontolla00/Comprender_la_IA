# Registro de cambios · v77 → v78

*Agosto 2026.*

Origen: la primera parte del "Nivel 1" de una revisión acumulativa de 11
posts/artículos externos (ver la nota de proyecto de la sesión), evaluados
uno a uno contra el código real de HyperRAG/Empreinte y contra el propio
manual antes de decidir qué incorporar. Cuatro inserciones sobrevivieron esa
verificación para esta ronda: dos huecos de *marco organizador* (cuantización,
inferencia) ya señalados como del mismo tipo, la extensión de prefix caching
a multi-réplica (llm-d), y una técnica genuinamente nueva (Self-RAG) con caso
real recién implementado en HyperRAG el mismo día.

## Fallo de proceso, declarado en vez de encubierto

**No se archivó `Comprender_la_IA_2026_v77.html` antes de empezar a editar
esta ronda** — el hábito de "archivar antes de editar" que siguieron v72→v78
en todas las rondas anteriores se rompió aquí; las ediciones ya estaban en
marcha cuando se notó. Consecuencia: no hay un snapshot `archivo/v77.html`
que refleje el estado *antes* de esta ronda, así que la verificación de esta
entrada no pudo hacerse por diff de bytes/tags contra un archivo previo, como
en v72→v77.

Lo que sí se hizo en su lugar: (1) verificación de **balance absoluto** de
14 tipos de etiqueta sobre el archivo final (open==close en cada una, cero
desbalances); (2) reconciliación manual de cada inserción contra lo que
realmente se escribió en esta sesión — el delta de `h3` (+4), `table` (+1),
`tr` (+6), `div` (+4) y `a` (+2) coincide exactamente, uno a uno, con las
cuatro secciones añadidas más abajo, contadas a mano contra el texto
insertado. No es tan fuerte como un diff contra un snapshot real, pero
detecta lo mismo que ese diff detectaría: una etiqueta rota o un cierre que
falta. `archivo/Comprender_la_IA_2026_v76.html` sigue siendo el snapshot
archivado más reciente disponible.

---

## Las cuatro inserciones

### 1. §5.7c.2b — El mecanismo común de cuantización (RTN, QAT, marco de outliers)

Nueva sección entre la tabla de formatos ya existente (GGUF/GPTQ/AWQ/
bitsandbytes) y "5.7c.3 Destilación". La tabla original comparaba los
formatos como productos (qué son, dónde se usan, qué calidad dan) sin
explicar por qué GPTQ y AWQ difieren entre sí. La inserción da el mecanismo
común — ~0,1% de dimensiones ocultas con valores hasta 20× mayores que el
resto rompen la rejilla de cuantización (Dettmers et al.) — y organiza los
cinco métodos por **en qué punto del pipeline** lo resuelven: RTN lo ignora
(nuevo en el manual, el baseline sin calibración), GPTQ repara después de
redondear, AWQ protege antes, LLM.int8()/bitsandbytes aísla en inferencia
(ya cubierto, ahora conectado al mecanismo), y QAT lo resuelve en
entrenamiento (nuevo en el manual, única categoría no post-entrenamiento de
las cinco).

### 2. §5.7d — El diagnóstico previo: ¿prefill o decode?

Nueva subsección al principio de "5.7d Optimización de inferencia", antes de
FlashAttention. El manual ya cubría KV cache, PagedAttention/vLLM, GQA/MQA/
MLA, FlashAttention y speculative decoding por separado, pero nunca bajo el
diagnóstico prefill=compute-bound/decode=memory-bound con sus dos métricas
(TTFT, ITL) que organiza cuándo cada técnica de la sección ayuda. La
inserción explica por qué FlashAttention ataca sobre todo prefill/
entrenamiento y la inferencia especulativa ataca decode — complementarias
por atacar fases distintas, no por ser "mejor" una que otra.

**Cifra de DeepSeek-V4 verificada contra la fuente primaria antes de
escribirla**: 27% de los FLOPs de inferencia y 10% del tamaño de caché KV
frente a DeepSeek-V3.2 a 1M de contexto, citado textualmente del abstract de
[arXiv 2606.19348](https://arxiv.org/abs/2606.19348) — confirmado también en
los blogs oficiales de HuggingFace y vLLM en la sesión de investigación
previa a esta ronda de edición.

### 3. §15.4c — Cuando hay varias réplicas: el problema que un solo servidor no tiene

Extensión de la sección de prefix caching ya escrita en v76→v77. Esa versión
cubría el mecanismo dentro de un único servidor vLLM; esta extensión cubre
lo que pasa con varias réplicas detrás de un balanceador estándar de
Kubernetes — round-robin asume que cualquier réplica sirve igual cualquier
request, falso en cuanto existe caché de prefijo, porque las réplicas
difieren en qué recuerdan. Presenta **llm-d** (proyecto sandbox de la CNCF,
fundado por Red Hat/Google Cloud/IBM Research/CoreWeave/NVIDIA) como la
orquestación real que resuelve esto encima de vLLM/SGLang: indexado en vivo
de bloques por réplica, umbral para ignorar afinidad bajo carga, jerarquía
de offloading GPU→CPU→disco, disagregación prefill/decode.

**Cifras con su nivel de verificación real declarado en el propio texto**:
la mejora de ~70% en throughput/TTFT por disagregación (AWS SageMaker
HyperPod) está confirmada en múltiples fuentes independientes. La cifra de
13.9× por offloading a disco a 250 usuarios concurrentes aparece en fuentes
secundarias pero no se confirmó letra por letra contra el texto extraíble
del blog primario de llm-d.ai — marcada explícitamente como plausible, no
como confirmada, en vez de presentarla con la misma seguridad que la
primera cifra.

### 4. §7.3 — Self-RAG: verificar la propia respuesta antes de entregarla

Sección completamente nueva (no reorganización de contenido existente, a
diferencia de las tres anteriores), insertada en "7.3 El problema del
grounding falso", justo después de la detección offline vía RAGAS/
faithfulness y antes de "Más allá de faithfulness". Explica la técnica real
de Self-RAG (Asai et al., 2023 — tokens de reflexión `[Retrieve]`/`[IsREL]`/
`[IsSUP]`/`[IsUSE]` entrenados en el propio generador) y la distingue
explícitamente de la aproximación práctica sin fine-tuning (una llamada de
crítica aparte, sin tocar pesos) — declarando la diferencia como una
limitación real de señal, no ocultándola bajo el mismo nombre.

**Caso real citado, verificado el mismo día en que se escribió.** HyperRAG
implementa la aproximación práctica como `self_critique_enabled` (§ver
`hyperrag/config.py`, `hyperrag/engine.py::_self_critique()`) — apagado por
defecto, regeneración acotada a un único intento, fallo abierto si el
juicio no se puede parsear. Verificado con 6 tests nuevos que cubren el
pipeline `query()` completo: desactivado no añade ninguna llamada LLM;
sin problema no regenera; con problema regenera exactamente una vez, nunca
en bucle; `regenerate=False` solo anota sin regenerar; el JSON se parsea
con y sin valla de markdown; una respuesta no parseable falla abierto. 676
tests de HyperRAG pasan en total (670 previos + 6 nuevos).

Cruza con §3.7 (guardarraíles con escalado a humano) y con RAGAS/
faithfulness ya cubierto en esta misma sección — se presenta como una capa
más (detección en el momento de generar, por consulta), no como sustituto
de la detección offline agregada ni del guardarraíl de escalado para casos
de alto riesgo.

---

## Lo que se dejó fuera, deliberadamente

- **LoRA+ en el pipeline de fine-tuning de HyperRAG** (`memo_finetune.py`):
  implementado y testeado el mismo día (tasas de aprendizaje distintas para
  las matrices A/B de LoRA, Hayou et al. 2024), pero no se añadió al manual
  en esta ronda — es una técnica de fine-tuning, no de RAG/inferencia, y no
  encajaba en ninguna sección tocada aquí sin forzarlo.
- **Corregir cifras de descuento de lectura ya existentes en §15.4b** (no
  tocadas en la ronda anterior tampoco): sigue sin verificarse esta sesión,
  mismo criterio de no tocar lo que no se ha comprobado de nuevo.

## Verificación

- Balance absoluto de 14 tipos de etiqueta sobre el archivo final: h2, h3,
  h4, table, tr, div, p, span, strong, em, a, code, ul, li — las 14,
  open==close, cero desbalances.
- Reconciliación manual de deltas contra el contenido insertado (ver arriba,
  sección "Fallo de proceso"): h3 +4, table +1, tr +6, div +4, a +2 — todos
  coinciden exactamente con el conteo a mano de lo escrito.
- Verificación en navegador: las cuatro secciones nuevas confirmadas
  presentes en el DOM renderizado (servidor HTTP estático local, puerto
  8792) vía lectura directa de texto.
- HyperRAG: 676/676 tests pasan (código real detrás del caso citado en §7.3
  y del ítem de LoRA+ dejado fuera del manual).
- `<title>` y badge de la topbar actualizados de "v77" a "v78".

## Alcance

Cuatro inserciones: tres extienden secciones ya existentes (§5.7c, §5.7d,
§15.4c) y una es contenido nuevo (§7.3, Self-RAG). Ninguna sección existente
se reescribió, ninguna cifra ya presente en el manual se tocó sin
verificarla de nuevo, ningún contenido se retiró. No se tocó ningún otro
capítulo. LoRA+ queda fuera del manual por ahora, ver arriba.
