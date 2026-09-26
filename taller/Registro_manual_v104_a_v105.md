# Registro de cambios · v104 → v105

*22 de septiembre de 2026.*

Origen: revisión de un post técnico ("MoE inference engineering, clearly explained", autor no
identificado en el fragmento pegado) dentro de la ronda de revisión acumulativa de posts externos.
A diferencia del hueco de continuous batching (v103→v104, mismo día), este no era "las piezas ya
están, falta el nombre que las organiza": §5.7b ya cubría MoE desde el ángulo de **selección de
modelo** (parámetros totales vs. activos), pero el manual no tenía ninguna cobertura del ángulo de
**infraestructura de serving** — routing, dispatch/combine, expert parallelism, placement, y ni
siquiera el vocabulario general de tensor/data parallelism, ausente del manual entero fuera de este
cambio.

## Verificación previa

No se usaron las cifras del post pegado tal cual (sin fuente primaria citada en el propio post) —
se verificaron cuatro afirmaciones contra fuente primaria independiente antes de escribir nada:

- **Qwen3-30B-A3B** (30,5B parámetros totales, 3,3B activados, 8 de 128 expertos por token,
  48 capas): coincide exactamente con la ficha oficial en Hugging Face (`Qwen/Qwen3-30B-A3B`).
- **vLLM, guía de despliegue de expert parallelism** (tamaño de grupo EP = TP × DP cuando se
  activa `--enable-expert-parallel`; ejemplo TP=2/DP=4 → grupo EP de 8, atención shardeada por TP
  dentro de cada grupo DP): verificado contra `docs.vllm.ai/en/latest/serving/expert_parallel_deployment`.
- **DeepSeek-V3, node-limited routing** (256 expertos en 8 grupos de 32, un grupo por nodo, cada
  token limitado a un máximo de 4 de los 8 nodos, deduplicación de tráfico InfiniBand vía NVLink
  intra-nodo): verificado contra el informe técnico primario (arXiv 2412.19437).
- **"Training-Free Halving of Activated Experts"** (arXiv 2609.04575, publicado ~3 semanas antes de
  esta revisión): las cifras del post (Qwen3.6-35B-A3B, 8→4 expertos, 4,65→0,35 puntos MMLU con la
  corrección de renormalización; Qwen3.5-397B-A17B, 10→5 expertos, 0,55 puntos) coinciden
  exactamente con el abstract primario.

Ninguna de las cuatro verificaciones encontró discrepancia con el post.

## Cambios

1. **Nueva sección `<h2>` §5.7g**, "Cómo se sirve un modelo MoE: routing, expert parallelism y
   desequilibrio de carga", insertada al final del capítulo 5 (tras §5.7f, antes del cierre
   "Resultado de este capítulo" — evita renumerar 5.7c/d/e/f y sus referencias cruzadas ya
   existentes en el resto del documento). Seis bloques:
   1. Dispatch y combine — mecanismo de routing, grouped GEMM, por qué decode sufre más que
      prefill también aquí (permutación de filas compitiendo con el cómputo memory-bound ya
      diagnosticado en §5.7d).
   2. Tres números que no son intercambiables — extiende la distinción total/activos de §5.7b con
      un tercero que faltaba, **parámetros residentes**, con el cálculo de memoria de
      Qwen3-30B-A3B verificado (≈61 GB / 56,8 GiB) y advertencia explícita de no sustituir activos
      por totales al estimar memoria.
   3. Tensor/expert/data parallel — las tres capas de paralelismo, con el ejemplo real de vLLM
      (TP×DP=EP) verificado contra su documentación primaria.
   4. Topología — NVLink/InfiniBand, placement (decisión de despliegue) vs. routing entrenado
      (restricción del modelo), con DeepSeek-V3 como caso verificado de la segunda.
   5. Desequilibrio de carga — desequilibrio de experto vs. de petición como problemas distintos,
      tail latency, coste de memoria de replicar un experto caliente.
   6. Límite de corrección — recuadro ✅/⚠ distinguiendo optimizaciones que preservan la selección
      lógica de expertos (grouped GEMM, placement, fusión) de las que cambian el resultado
      (cuantización, reducir top-k), con las cifras verificadas de "Training-Free Halving" como
      evidencia concreta de que "menos expertos" y "peor normalizado" son dos decisiones distintas.
2. **Dos términos de glosario nuevos**: `Expert Parallelism (EP)` (id `gt-expert-parallelism`) y
   `Dispatch / Combine` (id `gt-dispatch-combine`).
3. **Referencias cruzadas añadidas** (sin reescribir prosa existente): nota al final de §5.7b
   apuntando a §5.7g; tabla de "Inferencia y tamaño de modelo" (índice del manual) y tabla
   "Despliegue / optimización de coste" (mapa de casos de uso) actualizadas con el enlace a 5.7g;
   TOC del sidebar con la entrada de 5.7g; cuatro entradas nuevas en el índice de búsqueda del
   manual (continuous batching — retroactivo, se me había olvidado en v103→v104 — y dos para
   5.7g).
4. **`<title>` y badge del topbar**: `v104` → `v105`.
5. **`Fase_0_Onboarding.html`**: 10 menciones/enlaces reapuntados a v105.

## Lo que no se cambió, a propósito

- §5.7b (selección de modelo MoE) no se reescribe — solo gana una frase de puntero hacia 5.7g. Su
  contenido (tabla Mixtral/DeepSeek-V3, la trampa del titular) sigue siendo correcto tal cual.
- No se numeró como 5.7b.4 ni se insertó entre 5.7b y 5.7c — habría exigido renombrar 5.7c→d,
  d→e, e→f, f→g y actualizar cada referencia cruzada existente a esos anclajes (docenas, contando
  la tabla de índice, el glosario y el índice de búsqueda). Insertar al final del capítulo como
  5.7g es aditivo puro, sin ese riesgo.
- No se escribió una sección aparte de "paralelismo tensorial/de datos" fuera del contexto MoE,
  aunque el manual no los cubría en absoluto antes de este cambio — habría sido ampliar el encargo
  (el post pegado es sobre MoE, no sobre serving distribuido en general). Quedan explicados lo
  justo para entender expert parallelism por contraste, no como capítulo autónomo.
- Los límites de capacidad por experto (token dropping) se mencionan como "existen en algunos
  runtimes, no universal" — no se afirma que HyperRAG, Empreinte o Auditra los tengan ni los
  necesiten, porque ninguno opera un motor de serving MoE propio.

## Verificación

- v104 archivado íntegro en `archivo/`, sin tocar.
- Balance estructural: `<div>`/`</div>`, `<p>`/`</p>`, `<ul>`/`</ul>`, `<table>`/`</table>`
  balanceados en ambos lados tras el cambio (5258/5258, 1550/1550, 168/168, 229/229). `<h2>`
  257→258 (+1, la sección nueva); ids de glosario 35→37 (+2). Sin ids duplicados en todo el
  documento.
- 31.175 → 31.252 líneas (+77, dentro del bloque insertado y las referencias cruzadas).

## Alcance

Segundo enriquecimiento del mismo día (v103→v104 fue continuous batching), mismo tipo de cambio —
no corrige ninguna afirmación previa, cierra un hueco de cobertura real verificado contra cuatro
fuentes primarias independientes.
