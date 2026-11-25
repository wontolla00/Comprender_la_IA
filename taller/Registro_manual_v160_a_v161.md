# Registro v160 → v161 (METEOR 1.5 y apéndice A de BERTScore en §3.4)

## Qué cambió
- `index.html`: en la nota `s34-similitud-2026-11`, filas de METEOR (las tres celdas) y de BERTScore («qué no ve»), línea de fuentes y versión en `<title>` y barra superior. README, CHANGELOG, CLAUDE.md, Triaje (entrada `2026-11-25 (a)`). Copia de la v160 en `archivo/`.
- Origen: el autor aportó los PDF de BERTScore y de Meteor Universal el 25/11 para cerrar los «sin verificar» del registro de v160.

## Verificado (texto completo leído)
- BERTScore (arXiv:1904.09675, versión de ICLR 2020, 43 páginas): coseno con vectores normalizados, emparejamiento voraz, recall/precisión/F1, F1 recomendada, idf opcional, rango bruto del coseno (−1 a 1) y reescalado lineal «típicamente» entre 0 y 1 que no afecta al ranking; apéndice A (tabla 7): dificultad para detectar errores de hecho, con tres ejemplos; recomendaciones de modelo de embeddings. Las fórmulas de R, P y F1 no salieron legibles en la extracción: se verificó por la prosa.
- Meteor Universal (Denkowski y Lavie, WMT 2014, Baltimore, 26–27 de junio; ACL Anthology W14-3348), 5 páginas: cuatro emparejadores; criterios de alineación; fórmulas de P, R, Fmean y penalización; parámetros de la tabla 2 (solo el inglés con peso de sinónimos); 101.099 juicios de ocho direcciones del WMT12 (tabla 1); tabla 3 (tau de Kendall por frase en WMT13, inglés 0,206 frente a 0,124 de BLEU con la versión universal, español 0,101 frente a 0,068, francés 0,137 frente a 0,099, ruso 0,128 frente a 0,068, hindi 0,264 frente a 0,227); aviso de sesgo a favor de la versión universal en los idiomas incluidos en el ajuste; software: Meteor 1.5 bajo LGPL.
- HTML: etiquetas `<div>` equilibradas (5350/5350), sin `id` duplicados.

## Corrección de una afirmación hecha en la conversación
- Se dijo que Meteor Universal era de un taller de EACL 2014 (dato que venía del resumen de la página oficial de Lavie). El artículo y el ACL Anthology lo sitúan en el taller WMT de ACL 2014, Baltimore. En el manual nunca se escribió «EACL»; la cita correcta es «WMT 2014».

## Sin verificar
- Meteor posteriores a la 1.5: la página oficial la lista como la última; no se buscó otra fuente.
- No hay en estas fuentes validación de METEOR ni de BERTScore con respuestas de modelos de lenguaje; la nota lo dice para METEOR y no lo afirma para BERTScore.
- Banerjee y Lavie (2005) y Jurafsky y Martin, leídos con una herramienta que resume, no con el texto íntegro.

## Decisiones
- La descripción de METEOR pasa a ser la de la versión 1.5; la de 2005 se menciona solo como origen.
- No se incluyen las cifras completas de la tabla 3 en el texto del alumno, solo el caso del ruso por ser el único idioma ajeno al ajuste.
- Sin push.
