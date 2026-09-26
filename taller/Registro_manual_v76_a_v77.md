# Registro de cambios · v76 → v77

*Agosto 2026.*

Mismo origen que v67→v68, v73→v74 y v75→v76: surgió de una conversación
fuera del manual — esta vez sobre un post técnico ("KV, Prefix, Prompt
and Semantic Caching in LLMs, clearly explained") que el autor pegó para
evaluar su interés para sus proyectos. El post en sí no se incorpora — la
sesión cruzó su taxonomía contra el código real de HyperRAG y de
Empreinte (ambos del propio autor) para separar lo verificable de lo que
el post solo afirma. Tres hallazgos sobrevivieron esa verificación y sí
faltaban en el manual, o corrigen una laguna real de una sección
existente.

Snapshot de v76 archivado **antes** de editar:
`archivo/Comprender_la_IA_2026_v76.html`, 2.444.116 bytes, copia exacta
del v76 en circulación.

---

## Las tres inserciones

### 1. §13.611 "Semantic caching" — caso real de HyperRAG (guarda de negación)

Insertado como `<div class="callout concept">` inmediatamente después del
warning existente ("El umbral no es un detalle de implementación..."),
antes del laboratorio de errores de prompt engineering. No se tocó el
texto ya existente de la sección.

**El contenido.** El warning ya presente en §13.611 advertía en abstracto
del riesgo de falso positivo por similitud coseno, sin un caso medido. La
caché semántica real de HyperRAG (`rag_cache_threshold = 0.92`,
[engine.py](../../../HyperRAG/hyperrag/engine.py)) resultó tener
exactamente ese problema frente a negación léxica: reproducido con el
mismo bi-encoder que usa HyperRAG en producción
(`sentence-transformers/all-MiniLM-L6-v2`), el par "Is the API rate
limited?" / "Is the API not rate limited?" puntúa 0.928 — por encima del
umbral. El par en español ("hay límite de peticiones" / "no hay límite de
peticiones") puntúa 0.966. Una paráfrasis real de control puntúa 0.992
para confirmar que la guarda no rompe aciertos legítimos.

**Verificación antes de escribirlo, no citada de segunda mano.** El
número del post original para el mismo tipo de par era 0.952 (bi-encoder
no especificado con el mismo detalle) — la sesión no lo copió: lo
reprodujo con el bi-encoder real de HyperRAG y obtuvo 0.928, un número
distinto que confirma el mismo riesgo por una vía propia y verificable,
no por confiar en la cifra ajena. Este es el criterio de "caso real
citado, verificado antes de escribirlo" que ya establecieron v73→v74 y
v75→v76.

**La corrección real aplicada** (no solo descrita): una guarda léxica de
negación en `HyperRAG._rag_cache_lookup` — si una consulta tiene un
marcador de negación explícito y la otra no, el hit se descarta sin
importar la similitud. Alcance declarado en el propio código: cierra
negación léxica explícita, no antónimos sin negación ("barato"/"caro").
Cruza con §13.15, Caso 1 (el fallo de clave incompleta —`top_k`/capas—
del mismo sistema, corregido antes de este).

### 2. §15.4b "Prompt caching" — la mitad que faltaba en la tabla de descuentos

Dos inserciones: un `<div class="warning">` y un `<div class="callout
concept">`, entre el párrafo "Cómo implementarlo en la práctica" y el
inicio de §15.5. No se tocó la tabla de descuentos ya existente.

**El contenido.** La tabla original de §15.4b solo documenta el
descuento de *lectura* de caché por proveedor. Nunca menciona el coste de
*escritura* — y verificado contra la API de precios en vivo de
OpenRouter (agosto 2026), el ratio lectura/escritura no es uniforme entre
proveedores: Claude Sonnet 5 cobra la escritura a 1.25× el precio de
entrada normal (prima), Gemini 3.7 Flash la cobra a 0.056× (más barata
que la entrada normal — dirección opuesta). Un cálculo de ROI que asuma
el patrón de Anthropic para Gemini se equivoca en el sentido contrario al
esperado, no solo en la magnitud.

**Caso real citado, verificado antes de escribirlo.** Empreinte (la
herramienta de coste/observabilidad de LLM del propio autor, ver §8.x)
auditaba coste sin ningún concepto de tokens de caché:
`hyperrag/core/llm_client.py` nunca capturaba
`cache_creation_input_tokens`/`cache_read_input_tokens` del objeto
`usage` de litellm, y `Empreinte/cost_engine.py` aplicaba tarifa plana
sin tier de caché. Verificación antes de escribirlo:

- Corregido en las tres capas: captura de los campos (`llm_client.py`,
  `log_receiver.py`), cálculo cache-aware (`cost_engine.py`,
  `calculate_cost_usd_cached()`) y consumo real (`audit_sensor.py`,
  `free_chat_engine.py`).
- La corrección deliberadamente NO asume el ratio 0.1×/1.25× de Anthropic
  como universal — sería el mismo error que corrige la tabla de arriba.
  Lee la tarifa real por modelo desde OpenRouter; cuando no está
  publicada para un modelo, lo declara (`cache_pricing_known: False`) en
  vez de mostrar una cifra con precisión falsa.
- 67 tests existentes de Empreinte pasan sin modificarse; retrocompatibilidad
  verificada explícitamente (una entrada de log sin campos de caché
  calcula el mismo coste, número idéntico, que antes del cambio).

### 3. §15.4c "Prefix caching" — sección nueva completa

`<h2 data-nivel="profundidad">` nuevo entre §15.4b y §15.5 — mismo patrón
de plegado ("sección de profundización") que ya usan §3.5/3.6 y otras.
Cubre el mecanismo de hash-chain por bloques de vLLM (distinto del KV
cache de §5.5c y del prompt caching facturado de §15.4b), aislamiento
multi-tenant por *salt*, y por qué se rompe específicamente en RAG
(reordering de chunks bajo hash encadenado).

**Cifra de CacheBlend/LMCache verificada contra la fuente primaria antes
de escribirla** (no se aceptó la cita del post sin comprobar): abstract
de arXiv 2405.16444 (Yao et al., EuroSys 2025, ampliado en ACM
Transactions on Computer Systems marzo 2026) leído textualmente —
"reduces time-to-first-token (TTFT) by 2.2-3.3x and increases the
inference throughput by 2.8-5x from full KV recompute without
compromising generation quality". El post original decía "2-3x" sin más
precisión; el paper da 2.2–3.3× TTFT **y además** 2.8–5× throughput, cifra
que el post no mencionaba. Confirmado además que el repo
[LMCache/LMCache](https://github.com/LMCache/LMCache) implementa
CacheBlend y cita el mismo paper (no es una asociación asumida).

**Nota de alcance añadida explícitamente en el propio texto**: el
mecanismo es específico de vLLM/PagedAttention — no hay caso propio de
HyperRAG que lo respalde, porque HyperRAG corre sobre Ollama/litellm, no
vLLM. Esta sección no tiene el mismo nivel de "caso real verificado" que
las otras dos, y se declara así en vez de forzar una conexión que no
existe.

---

## Lo que se dejó fuera, deliberadamente

- **La cifra 0.952 del post original** para el par de negación: no se usó
  como dato del manual — se reemplazó por 0.928, obtenida de primera mano
  con el bi-encoder real de HyperRAG. Se menciona en este registro (no en
  el manual) como nota de proceso.
- **Cualquier afirmación sobre si el mecanismo de context-shift de
  Ollama/llama.cpp ofrece un beneficio equivalente al prefix caching de
  vLLM**: no medido. Habría requerido un experimento nuevo (comparar
  latencia de una llamada con prefijo largo compartido contra una con
  prefijo único, replicando la metodología de
  `HyperRAG/scripts/check_ollama_concurrency.py`) que no se hizo en esta
  sesión. La sección §15.4c lo señala como límite de alcance en vez de
  callarlo.
- **Corregir los porcentajes de descuento de lectura ya existentes en la
  tabla de §15.4b** (Anthropic ~90%, OpenAI ~50%, Google ~75%): no se
  tocaron. Los datos verificados contra OpenRouter en esta sesión fueron
  de *escritura*, no de lectura, y no se cruzó cada porcentaje de lectura
  existente contra la fuente primaria de cada proveedor — tocar cifras no
  verificadas en esta sesión habría sido el mismo error que el resto de
  este registro evita.

## Verificación

- Balance de etiquetas verificado contra el snapshot pre-edición
  (`archivo/Comprender_la_IA_2026_v76.html`):

  | | v76 (archivado) | v77 | Δ | esperado |
  |---|---|---|---|---|
  | bytes | 2.444.116 | 2.454.462 | +10.346 | — |
  | `h2` | 254 | 255 | +1 | +1 (§15.4c) |
  | `h3` | 397 | 397 | 0 | 0 |
  | `table` | 223 | 225 | +2 | +2 (comparación negación en §13.611, tarifas lectura/escritura en §15.4b) |
  | `tr` | 1.283 | 1.290 | +7 | +7 (filas de ambas tablas) |
  | `div` (abre/cierra) | 4.839 / 4.839 | 4.845 / 4.845 | +6 / +6 | +6 (1 callout en §13.611, 1 warning + 1 callout en §15.4b, 2 callouts + 1 warning en §15.4c) |
  | `p` | 1.443 | 1.459 | +16 | — |
  | `span` | 1.539 | 1.539 | 0 | 0 (sin spans nuevos) |
  | `strong` | 2.205 | 2.218 | +13 | — |
  | `em` | 511 | 518 | +7 | — |
  | `a` | 399 | 401 | +2 | +2 (enlaces a arXiv 2405.16444 y a github.com/LMCache/LMCache) |
  | `code` | 332 | 343 | +11 | — |

  Todas las cifras cuadran; ningún tag quedó desbalanceado.
- Verificación en navegador (servidor HTTP estático local, puerto 8791):
  las tres secciones confirmadas presentes en el DOM renderizado vía
  lectura directa de texto (no solo captura de pantalla, que resultó
  intermitente en esta página por su tamaño); el toggle de "sección de
  profundización" de §15.4c se comporta igual que el resto de secciones
  `data-nivel="profundidad"` del manual.
- Carpeta principal: se elimina `Comprender_la_IA_2026_v76.html` del
  directorio raíz (queda solo en `archivo/`), permanece
  `Comprender_la_IA_2026_v77.html` como único archivo vivo.
- `<title>` y badge de la topbar actualizados de "v76" a "v77".

## Alcance

Tres inserciones puntuales: dos dentro de secciones ya existentes
(§13.611, §15.4b) y una sección nueva (§15.4c) en un hueco natural de
numeración entre §15.4b y §15.5. Ninguna sección existente se reescribió,
ninguna cifra ya presente en el manual se tocó sin verificarla de nuevo,
ningún contenido se retiró. No se tocó ningún otro capítulo.
