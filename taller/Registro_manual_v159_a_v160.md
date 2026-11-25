# Registro v159 → v160 (BERTScore, METEOR y perplejidad en §3.4)

## Qué cambió
- `index.html`: nota nueva `s34-similitud-2026-11` al final de la tabla de §3.4, antes del diagrama de RAGAS; versión en la etiqueta `<title>` y en la barra superior. README, CHANGELOG, CLAUDE.md, Triaje (entrada `2026-11-25 (a)` y CI-ME-1). Copia de la v159 en `archivo/`.
- Origen: infografía «LLM Evaluation Metrics» (Tajamul Khan) enviada el 25/11. El contraste con el código y el manual dio el hueco: el índice de búsqueda anuncia BERTScore en el Cap. 3 y el cuerpo no lo definía; METEOR no aparecía; la perplejidad solo en un gráfico y un texto de pros.

## Verificado
- BERTScore: arXiv:1904.09675, PDF leído hasta el carácter 100.000 de 131.860 con una herramienta que resume (coseno entre embeddings contextuales, emparejamiento voraz, recall/precisión/F1, idf opcional, reescalado lineal que no cambia el orden; venue ICLR 2020 según la primera página). El README oficial no garantiza que el rango reescalado sea 0–1; por eso la nota dice que no lo garantiza.
- METEOR: ACL Anthology W05-0909 (2005), PDF leído: tres fases, media armónica con recall ≈ nueve veces más pesado, penalización por fragmentación con tope del 50 %.
- Perplejidad: Jurafsky y Martin, cap. 3 (borrador del 19/08/2026): definición, comparabilidad solo con vocabulario idéntico, y que una mejora intrínseca no garantiza mejora en la tarea.
- HTML del bloque: etiquetas equilibradas (analizador sin errores), un solo `id` nuevo, anclaje único (el comentario del diagrama de RAGAS).

## Sin verificar
- Últimos ~31.860 caracteres del PDF de BERTScore; versiones posteriores de METEOR (1.x y 2.0); lectura hecha con una herramienta que resume, no con el texto íntegro.
- La frase de la nota sobre que BERTScore no está diseñada para comprobar hechos es una consecuencia del cálculo, declarada como tal en el texto; no se midió.
- La afirmación de que la perplejidad «no siempre se puede obtener de un servicio externo» es general; no se comprobó proveedor por proveedor.

## Decisiones
- No se cita ni se menciona la infografía en el texto del alumno: el proceso va aquí y en el CHANGELOG.
- No se añade F1 ni exact match: ya están cubiertos por el resto del manual (F1 en unas 22 líneas, exact match en 6).
- Sin push.
