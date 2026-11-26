# Registro v162 → v163 (validación en la migración de código heredado, §13.15.2)

## Qué cambió
- `index.html`: nota `s13152-heredado-2026-11` al final de §13.15.2, antes de §13.15.3; versión en `<title>` y barra superior. README, CHANGELOG, CLAUDE.md, Triaje (entrada `2026-11-25 (b)`, CI-LG-1), `11_Auditra/docs/PLAN_MAESTRO.md`. Copia de la v162 en `archivo/`.
- Origen: el autor aportó los cinco PDF el 26/11 tras una primera lectura resumida.

## Verificado (texto completo leído con pdftotext)
- Google (arXiv:2504.09691): 39 migraciones, 595 cambios, 93.574 ediciones, 74,45 % y 69,46 % por el LLM, seis filtros y su orden, ahorro del 50 % como percepción, amenazas a la validez (sin experimento controlado, tres desarrolladores, sesgo de los desarrolladores, modelo interno).
- IBM 2504.10548: ejecución simbólica (no LLM), 43/51 párrafos (84 %) con cobertura completa y 46/51 por encima del 80 %, CHANN11 con 0/2, tiempos de validación de 55 a 10 y de 35 a 8,5 minutos.
- IBM 2507.23356: comprobadores analíticos y juez LLM con escala de siete puntos; tres fallos inyectados; los comprobadores detectan el primero y el tercero y el juez solo el segundo, con un aviso inexistente y una llamada ABEND dada por buena; el 34 % es el argumento sobre probar programas completos; no hay cifra de acuerdo del juez con expertos.
- Diggs et al. (arXiv:2411.14971): conjuntos MUMPS (78 ficheros, 5.107 líneas) y ensamblador (12 ficheros, 13.344 líneas); ICC de 0,73/0,65/0,89/0,85 y de 0,22/0,16/0,21/0,12; sin corrección de Bonferroni, dicho por los autores.
- COBOL-Coder (arXiv:2604.03986): tabla 4 (COBOLEval) y tabla de traducción (COBOL→Java y Java→COBOL) con las cifras citadas.
- HTML: `<div>` equilibrados (5352/5352), sin `id` duplicados, `v163` en dos sitios y ningún `v162`.

## Inconsistencias internas de los papers (no se trasladan al texto)
- COBOL-Coder: el texto da 72,95 % de CSR para el 14B en COBOLEval y la tabla 73,95 %; el texto da 81,11 de Pass@1 en COBOL→Java para el 7B y la tabla 81,81. Se usan las cifras de la tabla y las que coinciden en el resumen.
- Diggs: el intervalo del ICC de «usefulness» en ensamblador (`[0,17, 0,37]`) no contiene su valor (0,12); el texto da −0,33 para tiempo de proceso frente a usefulness y no se pudo cuadrar con la tabla IV (extracción con columnas mezcladas). No se cita.

## Sin verificar
- Cifras de proveedores (Amazon Q, blog de AWS del 26/02/2026, Thoughtworks): no se reproducen en el manual.
- La entrevista de GFT que originó el tema: sin evidencia propia, descartada.

## Decisiones
- Ubicación: §13.15.2, por la relación con el contrato fail-to-pass y con la cautela sobre jueces LLM.
- La cifra del 34 % se marca como ilustrativa del propio trabajo; remite a 10.3.
- Sin push.
