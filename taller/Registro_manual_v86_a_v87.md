# Registro de cambios · v86 → v87

*Septiembre 2026.*

Origen: el usuario señaló que el manual "vuelve a no tener indexados todos los capítulos en el índice" — indicando que esto ya había pasado antes. El índice principal (Módulo 0, capítulos 0-22 + apéndices) se verificó completo. El problema real estaba en el **Índice de conceptos del autor** (Módulo 5, `#indice-autor`), añadido en v53 para listar en un solo sitio las 30 secciones marcadas ★ Propuesta del autor / 📐 Concepto del autor — una tabla de mantenimiento manual que no se sincroniza sola cuando se añaden secciones nuevas en versiones posteriores.

## Verificación

Se extrajeron todos los encabezados del manual que llevan la etiqueta `★ Propuesta del autor` o el prefijo de id `ca-` (convención de "📐 Concepto del autor") — 36 secciones distintas tras deduplicar — y se compararon contra los 30 `href` listados en la tabla del índice. Faltaban 7.

## Las 7 secciones que faltaban, añadidas como filas 31-37

1. **§2.5.5** — "Cuándo sí: el test del punto de equilibrio"
2. **§4.7b** — "Procedencia declarada: el caso donde la semántica sí se paga sola"
3. **§4.7** — "La procedencia certifica responsabilidad, no veracidad" (📐 Concepto del autor, `id="ca-procedencia-responsabilidad"`)
4. **§6.6b** — "Lo que un grafo plano no puede representar — y qué hacer con eso"
5. **§8.7b** — "El prompt como deuda técnica: la caducidad que no depende de ti"
6. **§10.9.7** — "Tres cosas que el discurso de memory engineering da por supuestas"
7. **§13.15** — "El arnés que miente: procedencia perdida en la capa de evaluación"

Actualizado el recuento de "30" a "37" en el subtítulo del índice y en el párrafo "Por qué existe este índice".

## Verificación posterior

- Diff exhaustivo repetido tras el cambio: cero secciones marcadas sin indexar, cero enlaces muertos en la tabla (los 37 `href` resuelven a un `id` real).
- Snapshot de v86 archivado antes de editar: `archivo/Comprender_la_IA_2026_v86.html`.
- `<title>` y badge de la topbar actualizados de "v86" a "v87"; archivo renombrado de `Comprender_la_IA_2026_v86.html` a `Comprender_la_IA_2026_v87.html`.

## Nota para el futuro

Esta tabla es mantenimiento manual puro — cualquier sección nueva marcada ★ Propuesta del autor o 📐 Concepto del autor a partir de ahora debe añadirse aquí a mano en la misma ronda de edición donde se crea, o el índice volverá a desincronizarse. No hay mecanismo automático que lo detecte salvo repetir esta auditoría.

## Alcance

Una sola sección del manual (el índice de conceptos del autor). Ningún otro contenido se tocó.
