# Registro de cambios · v107 → v108

*23 de septiembre de 2026.*

Origen: post técnico sobre embeddings ("Embeddings are everywhere in modern AI...", handbook
promocional adjunto por error y no usado como fuente) — explicador correcto de token/contextual/
sentence embeddings, geometría aprendida, coseno vs. producto punto, invalidación de índice por
cambio de modelo/pooling, prefijos query/documento asimétricos. Cruzado contra el manual (§2.3,
§2.4, §2.6) y contra el código real de HyperRAG antes de decidir qué escribir.

## Hallazgo de código (ejecutado aparte, no en el manual)

El post nombra el bug exacto: ignorar el prefijo de tarea en modelos de embedding entrenados de
forma asimétrica degrada el retrieval sin lanzar ningún error. `hyperrag/layers/vector_layer.py`
(`OllamaVectorLayer`, backend opcional "sin CUDA") llamaba a `ollama_embed()` con el texto crudo
tanto para la query como para los chunks, con `nomic-embed-text` como modelo por defecto — un
modelo que sí requiere `search_query: `/`search_document: ` según su propia ficha. No es un bug
activo (el backend en uso real es `VectorLayer`/MiniLM, simétrico), pero sí uno latente si alguien
activa esa ruta. Corregido con `prefijo_asimetrico()` (función pura, testeada sin red) y 9 tests
nuevos en `hyperrag/tests/test_prefijo_asimetrico.py` (29/29 pasan junto con los tests existentes
de `test_vector_dedup.py`). No toca el manual — es un fix de código, documentado aquí solo por
origen compartido con este post.

## Cambio en el manual (único, nuevo, pequeño)

**Hueco real**: el manual cubre similitud coseno en profundidad (§2.3, con más matices que el
propio post — incluye el límite de negación/estructura lógica que el post no menciona) y cubre
elección de modelo de embedding (§2.4b), pero no menciona embeddings Matryoshka (MRL) — una
técnica de 2022 con aplicación práctica real y verificable (OpenAI `text-embedding-3-*` con
parámetro `dimensions`, `nomic-embed-text-v1.5` — el mismo modelo ya citado en la tabla de §2.4b).
Es, a diferencia de warps/SIMT del post de GPU, una decisión de <em>despliegue</em> (truncar
dimensiones para ahorrar almacenamiento/latencia sin reentrenar), no de entrenamiento de modelos —
encaja en la altitud del manual.

1. **Nueva sección `<h2>` 2.4c** ("Dimensiones truncables: embeddings Matryoshka"), insertada
   entre la tabla de selección de modelo (§2.4b) y §2.5 — mecanismo (prefijos anidados, sin
   reentrenar), justificación operativa (coste de almacenamiento/ANN en función de la dimensión),
   dónde está ya en producción (OpenAI, nomic-embed-text-v1.5, ambos citados con fuente
   verificable), y el límite explícito: truncar a mano un modelo sin MRL degrada de forma brusca.
   Cita primaria: Kusupati et al., NeurIPS 2022, arXiv:2205.13147.
2. **Un término de glosario nuevo** (`gt-matryoshka-embeddings`, orden alfabético correcto, antes
   de "Mecanismo de atención").
3. **Una entrada nueva en el índice de búsqueda** del manual.
4. **TOC del sidebar** actualizado con la nueva subsección.
5. `<title>` y badge: `v107` → `v108`.
6. `Fase_0_Onboarding.html`: 10 referencias reapuntadas a v108.

## Lo que no se cambió

- El resto del post (token/contextual/sentence embeddings, pooling, hard negatives, contrastive
  training) — o bien ya está cubierto con más profundidad (coseno, límites semánticos), o bien es
  terreno de quien entrena el modelo de embeddings, no de quien lo consume en un RAG — mismo
  criterio de altitud que ya se aplicó para descartar la mitad de microarquitectura del post de GPU
  (v105→v106).

## Verificación

- v107 archivado íntegro en `archivo/`.
- Balance estructural: `<div>`/`</div>` 5259→5264 (+5, balanceados). `<p>` 1131→1134 (+3), `<p
  style=...>` 420→421 (sin cambio este bloque), `</p>` 1552→1555 (+3), consistentes. `<h2>`
  258→259 (+1, la sección nueva). Sin ids duplicados (`s24c`, `gt-matryoshka-embeddings`
  verificados).
- 31.258 → 31.276 líneas (+18).

## Alcance

Sección pequeña y acotada — un mecanismo con aplicación de despliegue verificable, no una
elaboración teórica. El hallazgo de mayor peso de esta ronda fue de código, no de manual.
