# Registro v154 → v155 (§13.16, evaluar a un agente)

## Qué cambió
- `index.html`: nota `s1316-evals-2026-11` al final de §13.16, antes de «Resultado de este capítulo»; versión (título, barra superior, revisión del capítulo multimodal); regla de contraste acotada ampliada a la nota nueva. README, CHANGELOG. Copia de la v154 en `archivo/`.

## Decisiones
- Una sola nota, no sección nueva: aporta cuatro ideas y una distinción, y se apoya en §13.12.3 y §13.15.
- Atribuciones por separado tras leer las dos guías completas: Anthropic (enero de 2026) da el estado final, los tres tipos de calificador, capacidad frente a regresión, un juez por dimensión, la salida «Unknown», calibrar con expertos, pass@k y pass^k; **no fija escala numérica**. LangChain (9/11/2026) da escribir la prueba antes del arreglo, comparar ejemplo por ejemplo, conjunto de reserva y la recomendación de aprobado/suspenso frente a 1–10. Esto corrige mi análisis previo, que atribuía la frase de la escala a ambas.
- No se porta la infografía (cuatro roles) ni sus marcadores «ilustrativos».
- HyperRAG como ejemplo, redactado «según las notas del propio proyecto».

## Verificado
- Ambas guías leídas completas vía WebFetch el 16/11/2026. 0,75³ = 0,421875 ≈ 42 % (cifra de la guía de Anthropic; supone intentos independientes, declarado en el texto).

## Sin verificar
- Las dos posturas de HyperRAG proceden del Triaje y de `ARRANQUE.md` §2.1; no se ha releído `scripts/eval_harness.py` en esta sesión.
- La fecha de la guía de Anthropic (9/1/2026) viene de la propia página extraída; el resto de detalles son del resumen que devuelve la herramienta, no de lectura directa del HTML.
