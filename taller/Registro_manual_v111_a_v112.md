# Registro de cambios · v111 → v112

*28 de septiembre de 2026.*

Origen: nota técnica académica ("Les modèles de décision structurée, Jev", Julien Perez,
profesor asociado EPITA, 26 sept. 2026) — no es material de proveedor ni periodístico, a
diferencia de las dos fuentes anteriores sobre el mismo producto (Xataka, `taller/Triaje_fuentes_externas_2026.md`
entrada 2026-09-22; y la guía "Jev Engineering" de TypeSafe AI, entrada 2026-09-28 en el mismo
archivo). Formaliza matemáticamente por qué la decisión estructurada es distinta de la generación
(factorización en cadena vs. pase paralelo) y sitúa Jev como combinación de dos líneas anteriores
a los LLM generativos: encoders tipo BERT (clasificación vía cabeza de tarea) y modelos de ranking/
recuperación (softmax sobre candidatos, independiente de *n*). Cita Laya, implementación
independiente y de código abierto del mismo principio — verificada antes de citar: repositorio
real en GitHub (`NandhaKishorM/laya`, ModernBERT-large), no una referencia inventada.

## Verificación previa a escribir

Antes de tocar el manual se cruzó la tesis del post contra el código real de HyperRAG y Empreinte
(mismo criterio que v77-v78, v107-v108): el reranker CrossEncoder de HyperRAG y los clasificadores
de Empreinte (documentados en `HyperRAG/taller/Jev_Engineering_y_clasificadores_HyperRAG_nota_puente.md`
y `Empreinte/taller/Jev_Engineering_y_clasificadores_Empreinte_nota_puente.md`, creadas en la misma
sesión) ya implementan el patrón general. Lo que aporta esta fuente concreta, y que esas dos notas
puente no cubrían, es un hueco real en la tabla existente del manual: §12.4b distingue "clasificador
especializado" (categorías fijas) de "LLM generativo" (contexto abierto), pero no tenía una fila
para la clasificación de cardinalidad variable — puntuar un número de candidatos que cambia en
cada llamada, sin reentrenar. El reranker CrossEncoder de HyperRAG es precisamente esa fila, ya en
producción, sin haberlo nombrado así hasta ahora.

## Cambio en el manual (único, nuevo, pequeño)

**§12.4b** (Clasificadores especializados vs LLMs) gana un nuevo `<h3 id="s124b-cardinalidad">`,
"Cardinalidad variable: cuando el número de opciones no está fijado en el entrenamiento", insertado
después de "Domain Adaptation para clasificadores BERT-family" y antes de §12.4c. Tres párrafos:
(1) la formalización — proyección `d → 1` por candidato en vez de `d → n` fijo, con cita a Perez;
(2) la filiación con ranking/IR (`sᵢ = fθ(x,cᵢ)`, softmax) y las dos implementaciones — Jev
(TypeSafe, cifras de proveedor sin verificación independiente, misma cautela que el resto del
manual, §20.6) y Laya (código abierto, verificado, enlace real); (3) grounding en el propio
corpus — el reranker de HyperRAG ya resuelve esto, Empreinte resuelve el caso de cardinalidad fija
con un mecanismo distinto ya descrito arriba en la misma sección — y un párrafo breve sobre
calibración, enlazando hacia atrás con `confidence_estimate` + `calibrator_version` del
`DecisionRecord` (§12.6), que ya evita el error que la fuente señala (nunca tratar la señal como
probabilidad directa).

Entrada nueva en el índice temático interactivo (categoría "arquitectura", junto a la entrada
gemela de 12.4c), apuntando al nuevo `id`. No se añadió entrada al TOC del sidebar ni al índice de
conceptos del autor — es una extensión con fuente externa, no un concepto ★ nuevo, mismo criterio
que "Domain Adaptation" (h3 vecino, tampoco indexado en el sidebar).

## Corrección incidental encontrada al versionar (fuera del alcance del post)

`Fase_0_Onboarding.html` apuntaba a `Comprender_la_IA_2026_v108.html` en sus dos enlaces al manual
completo — desfase heredado de al menos tres versiones (v109, v110, v111 no lo habían actualizado).
Corregido a v112 en la misma pasada, mismo criterio que la incidencia de proceso reparada en v69.
`README.md` sigue mostrando "versión actual: v88" y su tabla de "Novedades recientes" no llega más
allá de v61 — desfase mucho mayor, preexistente a esta sesión y fuera del alcance de esta ronda;
no se toca aquí, señalado para una pasada de mantenimiento aparte.

## Lo que no se cambió

El resto de la nota de Perez — la ecuación de la cascada confianza→revisión humana→modelo más
potente, y las cuatro preguntas abiertas (calibración, robustez al fraseo, procedencia de los datos
de entrenamiento, ausencia de benchmark estándar) — no generó cambio en el manual esta ronda: la
cascada por confianza ya está cubierta conceptualmente por la matriz de derechos de decisión de
Cap. 14, y las cuatro preguntas abiertas no señalan ningún hueco de contenido nuevo, solo confirman
cautelas que el manual ya sostiene (§13.12, §20.6). Quedan sin tocar por no aportar sección nueva,
no por descuido.

## Verificación

- v111 archivado íntegro en `archivo/Comprender_la_IA_2026_v111.html` antes de editar (md5sum
  verificado idéntico al original en el momento del archivado).
- Balance estructural, verificado dos veces (tras cada edición): div 5278→5278, p 1571→1575 (+4,
  los tres párrafos de prosa más el de calibración), h2 264→264, h3 415→416 (+1, la nueva
  subsección), table 235→235, tr 1361→1361, a 799→800 (+1, el enlace a Laya), code/em/strong sin
  desbalance. 31.427 → 31.433 líneas (+6: 5 de contenido HTML, 1 de la entrada del índice temático
  en JS).
- Sin colisión de `id`: `s124b-cardinalidad` verificado único antes de insertarlo.
- Archivo renombrado `Comprender_la_IA_2026_v111.html` → `Comprender_la_IA_2026_v112.html`;
  `<title>` y badge de topbar actualizados a v112 (verificado por grep, 2 apariciones).

## Alcance

Sección pequeña y acotada — una fila que faltaba en una tabla ya existente, con cita verificable
(Laya) donde la fuente anterior (Jev) solo ofrecía afirmación de proveedor. El hallazgo de mayor
peso de esta fuente fue, otra vez, sobre el propio corpus (HyperRAG, Empreinte) antes que sobre el
manual — mismo patrón que la entrada del 2026-09-28 en el Triaje.
