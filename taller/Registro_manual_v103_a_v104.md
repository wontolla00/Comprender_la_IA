# Registro de cambios · v103 → v104

*22 de septiembre de 2026.*

Origen: revisión de un post técnico de LinkedIn ("What is Continuous Batching in LLMs and How
Does It Work?", Amit Shekhar/Outcome School) dentro de la ronda de revisión acumulativa de posts
externos. El post en sí no aportaba hechos nuevos que verificar (es un explicador correcto de un
concepto estándar), pero el cruce contra el manual real detectó un hueco genuino: "continuous
batching" aparecía citado de pasada dos veces (en la explicación de no-determinismo por
no-asociatividad de punto flotante, y en la sección de inferencia especulativa) sin que el manual
explicara nunca qué es ni cómo funciona — pese a tener ya cubiertas todas las piezas que lo rodean
(prefill/decode, PagedAttention, vLLM, TTFT/ITL). Mismo patrón de "hueco de marco organizador" ya
resuelto antes con cuantización (§5.7c) e inferencia (§5.7d, TTFT/ITL).

## Verificación previa

- No se usaron las cifras del post pegado (">20x sobre serving naive", "2 a 4x sobre static
  batching") tal cual las daba, porque no citaba fuente primaria verificable línea por línea.
- Verificado en su lugar contra dos fuentes primarias independientes:
  - **Orca: A Distributed Serving System for Transformer-Based Generative Models** (Yu, Jeong,
    Kim, Kim, Chun — OSDI 2022, pp. 521-538): el paper que introduce *iteration-level scheduling*
    (el mecanismo real detrás de "continuous batching"). Cifra citada textualmente del paper:
    **36,9× de mejora de throughput** frente a NVIDIA FasterTransformer, al mismo nivel de
    latencia, sobre GPT-3 175B — verificado contra el PDF primario en usenix.org, no un resumen.
  - **Anuncio original de vLLM** (blog oficial, 20 de junio de 2023, "vLLM: Easy, Fast, and Cheap
    LLM Serving with PagedAttention"): **hasta 24×** de throughput frente a HuggingFace
    Transformers sin optimizar, y **hasta 3,5×** frente a HuggingFace TGI (que ya tenía su propio
    batching dinámico en 2023) — verificado contra el texto del blog primario, no una paráfrasis
    de tercero. La comparación contra TGI se prefirió sobre la de 24× porque aísla mejor lo que
    aporta específicamente PagedAttention + continuous batching combinados.

## Cambios

1. **Nueva sección `<h3>` dentro de §5.7d**, "Continuous batching — compartir una GPU entre
   muchas peticiones sin desperdiciar ciclos", insertada tras "El precio de la sorpresa" y antes
   de §5.7e (Arquitecturas de hardware). Cubre: por qué el batching estático desperdicia plazas
   cuando las peticiones no duran lo mismo; qué cambia el scheduling a nivel de iteración de Orca
   (retira/sustituye peticiones en cada paso de decode, no al final del lote); recuadro
   ✅/⚠ de qué mejora y qué NO cambia (el resultado de cada petición es idéntico al de ejecución
   aislada); recuadro de cifras verificadas (Orca 36,9×, vLLM 24×/3,5×); nota de alcance
   explícita — ni PagedAttention ni continuous batching están activas en HyperRAG hoy (corre sobre
   Ollama, un solo usuario, sin motor de serving multi-tenant detrás).
2. **Término de glosario nuevo**: `Continuous Batching` (id `gt-continuous-batching`), mismo
   formato que `FlashAttention`/`Inferencia especulativa` ya existentes en §5.7d.
3. **`<title>` y badge del topbar**: `v103` → `v104`.
4. **`Fase_0_Onboarding.html`**: 10 menciones/enlaces reapuntados a v104 (el enlace al manual, el
   `nav-cap`, y las referencias de texto sueltas). La mención de "v100" en la nota histórica sobre
   accesibilidad no se tocó — es una referencia a esa versión concreta, no al manual vigente.

## Lo que no se cambió, a propósito

- El recuadro-resumen "💡 Resumen — las tres capas de optimización" (cuantización/atención/
  ejecución), justo antes de la nueva sección: sigue siendo correcto tal cual — describe capas que
  aceleran *una* petición; continuous batching es un eje distinto (reparto entre *muchas*
  peticiones concurrentes), declarado explícitamente como tal en la nueva sección, no forzado
  dentro de esa lista de tres.
- Las dos menciones previas de "continuous batching" (no-determinismo por punto flotante,
  inferencia especulativa bajo carga concurrente): siguen siendo correctas y ahora tienen, más
  abajo en la misma sección, dónde remitir al lector — no se editaron sus frases, ya eran
  precisas.
- PagedAttention no gana sección ni término de glosario propios en esta revisión — sigue
  mencionada donde ya estaba (§5.5c y de pasada en §5.7d/§15.4c); añadir eso sería ampliar el
  encargo más allá de lo pedido (Continuous Batching).

## Verificación

- v103 archivado íntegro en `archivo/`, sin tocar.
- Balance estructural de v104 contra v103: `<div>`/`</div>` 5232→5242 (+10, todos balanceados);
  `<h2>` sin cambio (257 — la sección nueva es `<h3>`, no capítulo); `<h3>` 406→407 (+1); `<p>`
  (cualquier atributo) / `</p>` 1531→1536 en ambos lados (balanceado); `<ul>`/`</ul>` 164→166
  (+2, el recuadro ✅/⚠); ids de glosario 34→35 (+1). Sin ids duplicados en todo el documento
  (comprobado sobre el árbol completo de `id="..."`).
- 31.138 → 31.175 líneas (+37, todas dentro del bloque insertado).

## Alcance

Enriquecimiento puro — no corrige ninguna afirmación previa del manual (a diferencia de v102→v103,
que sí corregía una cita empírica invertida). Cierra un hueco de cobertura real: un término ya
usado dos veces en el propio manual, nunca explicado.
