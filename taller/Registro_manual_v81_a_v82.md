# Registro de cambios · v81 → v82

*Septiembre 2026.*

Origen: segundo análisis cruzado (rol STRATEGIST) de la misma pasada de vigilancia técnica, sobre cinco posts adicionales revisados tras cerrar la ronda v80→v81 — ver `99_Taller/vigilancia_tecnica/hallazgos/2026-09.md`. Dos huecos pequeños, confirmados por el usuario ("atacamos A+B"), en dos secciones ya existentes y no relacionadas entre sí — misma resolución de identidad, dos capas distintas del stack.

## Las dos inserciones

### 1. §6.5b — La misma resolución de identidad, pero en la ingesta, no en la consulta

Origen: "Claimprint" (proyecto académico/portfolio sobre RAG e IDP en documentos financieros). Nuevo callout tras el ejemplo "inflows" ya existente, antes de la nota de alcance de cierre de la sección. El ejemplo existente resuelve identidad en el momento de la *consulta*, sobre un esquema ya estructurado; la inserción cubre el caso equivalente en la *ingesta*, sobre documentos no estructurados (PDFs financieros) donde dos cifras adyacentes y ambas correctas — resultado neto consolidado vs. resultado atribuible a la controlante, caso real citado en el post de origen — pueden hacer que un retrieval que encuentra la evidencia correcta devuelva igualmente el dato equivocado. Añade la pieza que el caso de esquema estructurado no necesitaba: abstención explícita cuando la identidad del valor extraído no puede resolverse con confianza.

### 2. §12.4c — Elegir entre modelos no es lo mismo que sustituir el proveedor de una herramienta

Origen: guía "Grok Bot with Kimi K3" (verificada: producto real de SpaceXAI/xAI, lanzado 11 de agosto de 2026; técnica real de redirección de un cliente construido para la API de Anthropic hacia Moonshot/Kimi K3 vía variables de entorno compatibles). Nuevo callout de advertencia tras el existente sobre dónde ya se usa routing/cascading sin llamarlo así. Distingue explícitamente dos patrones que §12.4c no separaba: decidir *cuál* modelo atiende cada consulta dentro de un pipeline controlado (routing/cascading, ya cubierto) frente a sustituir el proveedor completo de una herramienta ya construida mediante una capa de compatibilidad de API — riesgo distinto, porque el cambio afecta a toda la herramienta a la vez sin que esta lo declare.

La sección §12.4c no tenía anclaje (`id`) propio pese a estar referenciada por número en el texto — añadido `id="s124c"` como parte de esta ronda, ya que la nueva entrada del índice temático lo necesitaba.

## Índice temático — cuatro entradas nuevas

Añadidas junto con el contenido, no como ronda separada: una para la sección de ingesta de §6.5b, una para §12.4c en general (que tampoco estaba indexada) y una para el callout de compatibilidad de proveedor. Verificado end-to-end en el buscador real del manual: "resultado neto consolidado", "grok bot kimi" y "model cascading" devuelven las entradas correctas.

## Verificación

- Snapshot de v81 archivado antes de editar: `archivo/Comprender_la_IA_2026_v81.html`.
- Diff real contra ese snapshot: 1 línea eliminada (el `<h2>` de §12.4c, sustituido por la misma línea con `id` añadido — esperada, no una pérdida de contenido), 14 añadidas.
- Balance de 13 tipos de etiqueta sobre el archivo completo: las 13, open==close, cero desbalances.
- Verificado en navegador vía servidor HTTP estático local: las dos inserciones de contenido y las cuatro entradas del índice confirmadas en el DOM renderizado y funcionando en el buscador real, cero errores de consola.
- `<title>` y badge de la topbar actualizados de "v81" a "v82"; archivo renombrado de `Comprender_la_IA_2026_v81.html` a `Comprender_la_IA_2026_v82.html`.

## Alcance

Dos puntos de inserción de contenido, ambos extienden secciones ya existentes (§6.5b, §12.4c) sin reescribir nada. Cuatro entradas nuevas en el índice temático, más un `id` añadido a un `<h2>` que no lo tenía. Ninguna cifra ya presente en el manual se tocó, ningún contenido se retiró, no se tocó ningún otro capítulo.
