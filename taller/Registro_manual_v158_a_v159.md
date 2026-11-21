# Registro v158 → v159 (cifra corregida, Adaptive-RAG, CRAG, mapa de técnicas)

## Qué cambió
- `index.html`: aviso de §7.2 con la cifra corregida; fila de HyDE con fuente primaria; nota nueva `s73-control-2026-11` antes de «Más allá de faithfulness» (§7.3); versión en los tres sitios. README, CHANGELOG, Triaje. Copia de la v158 en `archivo/`.

## Verificado
- Adaptive-RAG (arXiv:2403.14403), CRAG (arXiv:2401.15884) y HyDE (arXiv:2212.10496): página de arXiv leída (resumen); descripciones y autores comprobados contra ella.
- Cifras de laboratorio contrastadas con los documentos de HyperRAG: F10 (−5,8 y −4,7; 190 preguntas, qwen2.5:7b) y F11 (consulta original: −4,2 y −1,6) en `ESTADO_evaluacion_2026-08-11b.md`; `adaptativo2_k5` (91 % frente a 92 %, +3/−4, 2,9× más lenta, 74 preguntas, 13/11/2026) en `PLAN_medicion_tecnicas.md`; detector 3 de 13 (15/11/2026) en `HR4_conjunto_dificil.md`.
- Las secciones citadas en la tabla existen como encabezados. Etiquetas `<div>` equilibradas (5349/5349) y un solo `id` nuevo.

## Sin verificar
- Los tres artículos: solo resúmenes, no el texto completo; sin cifras de los autores.
- Las cifras de laboratorio son de conjuntos ya vistos (conjunto de ajuste), una sola pasada y con modelo local dentro: no se han confirmado en un conjunto nuevo (R-06).

## Verificado en una segunda pasada (21/11/2026)
- Cobertura de las 20 técnicas: búsqueda de términos en todo el manual, con el encabezado de cada acierto, y lectura de los pasajes dudosos. Cuatro filas de la tabla estaban mal y se corrigieron en la misma v159: **multimodal** (el manual sí lo trata: §22.8 y §22.2.1; solo falta la recuperación visual directa, tipo ColPali: 0 apariciones de ColPali, ColQwen o «embeddings de página»); **query routing** (hay un router por tipo de consulta en el Caso 2-1 del laboratorio de errores del Módulo 2 y un esquema en §6.6); **parent-child** (§1.4, §7.1 y §6.7.4, no §7.2); **naive RAG** (§1.1 a §1.3). La de **decomposition** se amplía con §6.6 y §6.7.4.
- Siguen sin apartado propio: query decomposition (solo parcial) y la recuperación visual directa.
- Límite: la búsqueda es por términos; una técnica explicada con otras palabras podría no haber salido.

## Decisiones
- Se corrige la cifra de 10,0 sin recuadro de errata: es una corrección de una medida propia, anotada aquí y en el CHANGELOG.
- Las dos mediciones propias de la nota se presentan como ilustración, no como reproducción de los artículos.
- No se añaden técnicas que el manual ya trata; solo la tabla de equivalencias.
- Sin commit ni push.
