# Registro de cambios · v90 → v91

*Septiembre 2026. Reestructuración del preámbulo — ninguna línea de contenido eliminada.*

Origen: un análisis externo de la portada del manual, encargado por el autor, diagnosticó que el problema del preámbulo no era la calidad de los bloques sino su **redundancia estructural** y la inversión de la carga cognitiva: el lector paga en la primera visita el coste de un aparato de consulta que solo le sirve a partir de la segunda. Antes de aceptarlo se verificaron sus afirmaciones estructurales contra el archivo real.

## Verificación previa del diagnóstico (lo que se comprobó antes de tocar nada)

| Afirmación del análisis | Resultado |
|---|---|
| "Rutas por proyecto" aparecía **antes del título del manual** | ✅ línea 1122 vs. título en 1172 |
| Cuatro vistas de la misma ruta, con el texto admitiéndolo dos veces | ✅ "las tres vistas describen las mismas rutas a distinto nivel de detalle" y "…a distinto nivel de zoom" |
| Dos notas "Corrección v53" visibles al lector | ✅ dos ocurrencias |
| La advertencia de entropía se disculpa por llegar antes de tiempo | ✅ "Los dos siguientes párrafos son una vista anticipada…" |
| El índice como peaje | ✅ 461 líneas entre la portada y el Módulo 0 |
| "~450 entradas de índice" | ⚠️ **425** encabezados numerados (434 elementos `toc-item` contando labs y entregables). Única cifra del análisis que se pasaba; se corrigió antes de citarla en el propio manual |

**Hallazgo propio, no señalado por el análisis:** el bloque "Rutas por proyecto" abría con *"Las cuatro tarjetas de arriba son rutas por perfil"* — pero en su posición (antes del título) esas tarjetas estaban ~700 líneas **por debajo**. La frase era falsa desde que el bloque se movió arriba en alguna versión anterior. Al bajarlo a modo consulta la referencia vuelve a ser correcta, y se reformuló a "las cuatro tarjetas de la portada" para que no dependa de la posición.

## Cambios aplicados, en orden de retorno sobre riesgo

1. **El gancho sube a la portada.** El caso de logística (14 vs. 30 días) estaba dentro del Módulo 0, detrás del índice completo. Ahora va inmediatamente después del bloque de autor, antes del banner de rutas MVP. Es la mejor pieza del preámbulo y era la más enterrada. Etiqueta reformulada de "Antes de empezar — qué vas a poder hacer" a "Por qué existe este manual", coherente con su nueva posición.
2. **"Rutas por proyecto" baja a modo consulta.** Se agrupa con el índice por tarea bajo un encabezado nuevo, `#modo-consulta` ("Modo consulta: si llegas con un problema concreto"), que declara explícitamente a quién sirven ambas entradas. Antes estaban separadas por ~15 bloques resolviendo el mismo caso de uso.
3. **El índice completo se pliega por defecto.** `details/summary` nativo, sin JS, sin estado: **461 líneas fuera del camino**. El `id="indice"` se conserva en el contenedor, así que el enlace de la barra superior sigue llevando ahí; el índice deja de ser un corredor y pasa a ser un destino de un clic. Ninguna de las 434 entradas se movió ni se perdió.
4. **Las tres vistas redundantes de ruta se pliegan juntas.** Por módulo, tabla de prerrequisitos y Ruta MVP detallada quedan bajo un solo desplegable: **113 líneas más fuera del camino**. Los anclajes `#prerrequisitos-perfil` y `#ruta-mvp-detalle` siguen resolviendo. El texto introductorio se reescribió para decir lo que el manual ya admitía sin actuar en consecuencia: la ruta ya está elegida con las cuatro tarjetas de la portada; lo demás es la misma ruta a más resolución.
5. **La advertencia de entropía acumulada se muda al umbral del Módulo 2.** Era el caso más claro de contenido en el sitio equivocado: exigía saber qué es un agente y un pipeline de razonamiento, y el propio manual se disculpaba por ello. En el Módulo 0 queda la tesis en dos frases sin jerga ("la fiabilidad se multiplica, no se suma") con enlace al Cap. 10.3. La nota terminológica quedó integrada en el bloque movido.
6. **Nota terminológica duplicada retirada.** Repetía la definición de "entropía acumulada" ya dada unos bloques antes, y su frase *"los dos siguientes párrafos son una vista anticipada"* ya no describía nada: los párrafos que anunciaba estaban por encima, no por debajo.
7. **Las dos cicatrices "Corrección v53" retiradas.** Se conserva íntegro el contenido de ambas correcciones (que el Módulo 4 no es parada obligatoria para los perfiles Manager/Producto); solo desaparece la etiqueta de versión, que era historial de edición expuesto al lector. El historial vive en este taller, que es su sitio.

## Lo que deliberadamente NO se hizo

- **No se partió el archivo en varias páginas.** El análisis proponía mover material "detrás de un clic" sin señalar que este manual es un único HTML de 31.000 líneas con 944 `id` mantenidos a mano, y que esa unicidad es una propiedad de diseño (se entrega entero, funciona sin servidor). Se obtuvo el mismo efecto con `details/summary` nativo: cero JS, cero estado, anclajes intactos, impresión intacta.
- **No se movió "El mapa rápido: cuánto necesitas leer" al Módulo 3**, ni los tres conceptos transversales al glosario. Son los dos puntos del análisis con menor retorno y mayor riesgo de dejar huecos de contexto; quedan anotados para una ronda posterior si se decide.

## Verificación

- **Parseo HTML completo** (`html.parser`, comparando contra el v90 archivado): 0 avisos de anidamiento y 0 etiquetas sin cerrar en ambas versiones — el archivo editado parsea exactamente igual de limpio que el original.
- **Anclajes**: 721 enlaces internos, 944 `id`, **cero enlaces rotos nuevos**. El único no resuelto (`${lab.anchor}`) es un literal de plantilla JS que ya existía idéntico en v90.
- **Sin `id` duplicados**. `id` añadido: 1 (`modo-consulta`).
- Entradas de índice: 434 antes y después. Ocurrencias de "Corrección v53": 2 → 0. Gancho de logística: 1 → 1 (movido, no duplicado).
- Balance de `details`/`summary`: 7 pares abiertos y cerrados (5 preexistentes + 2 nuevos).
- Snapshot de v90 archivado antes de editar: `archivo/Comprender_la_IA_2026_v90.html`.
- `<title>` y badge actualizados a v91; archivo renombrado a `Comprender_la_IA_2026_v91.html`.
- Recuento de líneas: 31.024 → 31.042 (+18: comentarios de trazabilidad de los movimientos, las dos etiquetas `details/summary` y el encabezado de modo consulta).

## Corrección dentro de la misma ronda (misma sesión, v91 sin distribuir)

El autor detectó al revisar la barra superior que **el Módulo 6 no tenía entrada**: la navegación saltaba del Módulo 5 a "Multimodalidad", que es el Cap. 22 — un capítulo *dentro* del Módulo 6. Efecto real: el Cap. 21 (Ciberseguridad de LLM), que abre ese módulo, no era alcanzable desde la barra, solo desde el índice. Corregido: `<a href="#cap22">Multimodalidad</a>` → `<a href="#parte6">Módulo 6</a>`, coherente con el patrón `#parteN` de las otras cinco entradas. Verificado que las siete anclas de la barra resuelven.

**Decisión del autor sobre la contrapartida**: se conservan **las dos** entradas — `Módulo 6` (→ `#parte6`, coherente con el patrón de los otros cinco módulos) y `Multimodal` (→ `#cap22`, el atajo directo que ya existía). La etiqueta se acortó de "Multimodalidad" a "Multimodal" para no ensanchar una barra que ya estaba llena. Barra final: 12 entradas, todas con ancla verificada.

No se abrió una v92 por este cambio: es una corrección de una omisión dentro de la misma ronda, sobre un archivo que no había salido de la sesión. Queda registrada aquí en vez de en un registro propio, que es donde el corpus guarda el historial de edición.

## Alcance

Cero contenido eliminado. Lo que cambia es **qué encuentra el lector primero**: 574 líneas de aparato de orientación pasan de estar interpuestas en el camino a estar a un clic, y el primer bloque que enseña algo pasa a estar detrás de una portada con gancho en vez de detrás del índice completo y cuatro versiones del mismo mapa de rutas.
