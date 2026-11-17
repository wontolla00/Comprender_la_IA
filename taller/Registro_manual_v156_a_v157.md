# Registro v156 → v157 (§10.9.2 y §10.5c)

## Qué cambió
- `index.html`: dos notas nuevas (`s1092-agentes-2026-11` antes de §10.9.3; `s105c-indice-2026-11` al final de §10.5c); versión (título, barra superior, revisión del capítulo multimodal); regla de contraste ampliada a las dos notas. README, CHANGELOG, Triaje. Copia de la v156 en `archivo/`.

## Decisiones
- CI-LP-1 y CI-AG-1 se unen en una sola nota; CI-RS-1 va aparte, en el capítulo de RAG.
- No se usan los nombres «bucle de turno» y «bucle de traza»: solo se conocen por un resumen de segunda mano de una charla no vista; se describe con palabras.
- Plan-and-Execute no se nombra: no se localizó primario claro. LATS tampoco.
- Reflexion: una frase, solo con el resumen de arXiv leído.
- Las cifras de la infografía de RAG a 10 M se presentan como memoria de vectores; el camino de escritura como opinión de práctica sin primario.

## Verificado
- Aritmética de 200 M × 1024 (819,2 / 204,8 / 25,6 GB), recalculada.
- Qdrant y Elasticsearch: 4x (int8) y 32x (binaria); vectores originales en disco; bytes de corrección; HNSW pesa más con BBQ (Alibaba Cloud); recall binario según modelo. Por búsqueda web, sin abrir las páginas completas.
- Breunig (22/06/2025) y Anthropic (dic. 2024): leídos por extracto de la herramienta de lectura, no en navegador. Reflexion: solo el resumen.

## Sin verificar
- «How to Fix Your Context» (Breunig, continuación): no leído.
- Origen de Plan-and-Execute. Camino de escritura (cola, reintentos, dead-letter, carril del histórico), p95 < 2 s, 40 workers, lotes de 256.
- Que el manual no tenga ya otro apartado sobre colas o dead-letter: la búsqueda de «dead-letter» dio 0.
