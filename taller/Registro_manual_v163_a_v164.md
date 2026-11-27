# Registro v163 → v164 (Graph-R1 en §6.6)

## Qué cambió
- `index.html`: nota `s66-graphr1-2026-11` al final de §6.6, antes del recuadro «Resultado de este capítulo»; versión en `<title>` y barra superior. README, CHANGELOG, CLAUDE.md, Triaje (entrada `2026-11-27 (a)`), `11_Auditra/docs/PLAN_MAESTRO.md`. Copia de la v163 en `archivo/`.
- Origen: post de LinkedIn con infografía (Poornachandra Kongara) que comparaba RAG, Graph-R1 y RAG agéntico; el autor aportó el PDF de Graph-R1 (v2) el 27/11.

## Verificado (PDF de 21 páginas, v2 del 2 de junio de 2026, leído con pdftotext)
- Recompensa: formato (0,5 por paso bien formado, tope de 1) más F1 a nivel de token de la respuesta final; optimización con GRPO. Corrige una afirmación hecha en la conversación el 27/11 (se dijo que la infografía simplificaba la recompensa; en la v2 coincide con «F1 + Format Score»; los tres componentes del resumen de la v1 son de la primera versión).
- Montaje: Qwen2.5 de 1,5B, 3B y 7B; 4 GPU A100 de 80 GB; GPT-4o-mini para construir el conocimiento; bge-large-en-v1.5 para recuperar; seis conjuntos; 5.120 ejemplos de entrenamiento y 128 de prueba por conjunto.
- Resultados con el 7B: StandardRAG 32,05, HyperGraphRAG 29,40, Search-R1 46,19, Graph-R1 57,28 según un párrafo y 57,82 según otro (inconsistencia interna); con 1,5B y 3B, 40,09 y 51,26.
- La afirmación de que los GraphRAG solo con prompts suelen rendir por debajo del RAG estándar es de los autores.
- HTML: `<div>` equilibrados (5353/5353), sin `id` duplicados, `v164` en dos sitios y ningún `v163`.

## Sin verificar
- Coste de entrenar el agente (no se buscó en el texto) y comparación de coste con el de los demás métodos.
- Ausencia de intervalos de confianza y de repeticiones con semillas: comprobada con búsquedas de texto sobre el PDF, no con lectura página a página de las tablas.
- Qué modelo aplica las rúbricas de evaluación de la generación.
- La infografía no se cita en el manual.

## Decisiones
- La nota usa «unos 57 puntos de F1» y cita la inconsistencia entre 57,28 y 57,82 como límite.
- Se enlaza con 8.0b (diagnóstico por capa) y 6.6b (lo que un grafo colapsa).
- Sin push.
