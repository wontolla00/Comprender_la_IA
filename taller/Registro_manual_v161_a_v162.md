# Registro v161 → v162 (¿hace falta un LLM? en §10.2)

## Qué cambió
- `index.html`: fila nueva al principio de la tabla de §10.2; nota `s102-sinllm-2026-11` entre la tabla y el aviso «El sesgo de la pregunta inversa»; versión en `<title>` y barra superior. README, CHANGELOG, CLAUDE.md, Triaje (entrada `2026-11-26 (b)`), `11_Auditra/docs/PLAN_MAESTRO.md`. Copia de la v161 en `archivo/`.
- Origen: el autor pidió el 26/11 aplicar el hueco detectado al analizar un post francés (sin autor ni fecha) sobre dónde poner IA generativa en los procesos de negocio.

## Verificado
- HTML: etiquetas `<div>` equilibradas (5351/5351), sin `id` duplicados, `v162` en dos sitios y ningún `v161` restante.
- Hueco: la tabla de §10.2 arrancaba en «¿Puede resolverse con un único LLM call…?»; búsquedas de texto sobre el índice, los títulos y §10.2/§10.2b/§2.5.5 no encontraron la pregunta previa ni nada sobre cartografiar el flujo. No se releyó el capítulo entero.

## Sin verificar
- El post no trae autor, fecha ni cifras: no hay fuente primaria. La nota es síntesis del manual, declarada como regla de criterio y no como resultado medido; no cita el post ni da cifras sobre pruebas de concepto que no se generalizan.
- La atribución del cartografiado del flujo a la práctica Lean es conocimiento general, no se contrastó con una fuente.

## Decisiones
- La nota declara que la ordenación no es un teorema y remite a 10.2b, 10.3 y al Cap. 13 para los límites.
- No se añadió ninguna cifra ni cita externa.
- CI-LG-1 (modernización de código heredado) sigue pendiente y sin aplicar.
- Sin push.
