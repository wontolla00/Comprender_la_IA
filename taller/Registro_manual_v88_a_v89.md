# Registro de cambios · v88 → v89

*Septiembre 2026.*

Origen: revisión de un post técnico externo ("Can an LLM Forget the Right Things?", Anubhab Banerjee, Towards Data Science, ago. 2026) sobre un runtime CUDA hand-written para un robot VLA con deadline duro de ciclo. Al cruzarlo contra el manual se localizó un hueco concreto: §10.4b (las ocho salidas del loop de agente) y §22.10 (VLA) ya cubrían, por separado, la gobernanza de latencia/coste de un agente y el dominio de riesgo físico de un VLA — pero ninguna de las dos cubre el patrón de **admisión proactiva** (rechazar un paso antes de empezarlo si no va a caber en el plazo), a diferencia de las ocho salidas existentes, que son todas reactivas (cortan una ejecución ya en marcha).

## Cambio: nueva sección 10.4c

**§10.4c "Admission control proactivo: negarse a empezar"**, insertada entre §10.4b y §10.5 (patrón sándwich):
- Motiva la sección desde la insuficiencia de las ocho salidas reactivas en sistemas con plazo duro (control físico, VLA), donde "detectar el retraso y cortar" llega después de que el retraso ya causó daño.
- Nombra el patrón con su término de origen (*call admission control*, redes celulares/ATM) — analogía verificable y ya bien establecida en ingeniería de redes, no una invención del post.
- Pseudocódigo `AdmissionController`: estima el coste del siguiente paso con una media móvil exponencial (EMA) del historial de pasos, rechaza el paso si `tiempo_transcurrido + coste_estimado > plazo`. Mismo estilo de pseudocódigo (`⚠ Pseudocódigo — no ejecutable sin adaptar`) que `AgentLoopGuard` en §10.4b, para que ambos se lean como un par.
- Callout explícito de que es **complementario, no sustituto**, de las ocho salidas de §10.4b: uno decide si empezar, el otro si cortar.
- **Disciplina de no-sobreclaim aplicada**: se incluye un aviso explícito de que no se citan cifras concretas del proyecto externo que motivó la sección (deadline exacto, tasa de acierto del kernel, etc.) porque no se verificaron de primera mano contra su repositorio en esta edición — el patrón se sostiene por su propia lógica, no por la autoridad de la fuente. Coherente con la práctica ya establecida del manual (ver v77→v78, verificación de la cifra de DeepSeek-V4 solo hasta donde el abstract primario la sostenía).

## Cruce con contenido existente

- **§22.10.2** (VLA, alucinación motora): se añadió una frase de cierre a la advertencia existente, señalando que la asimetría de coste de una alucinación motora es precisamente el caso donde las ocho salidas no bastan y hace falta §10.4c. Único texto de prosa ya existente que se tocó — una frase, sin reescribir el resto del párrafo.
- No se creó ninguna sección nueva en el Cap. 22: el manual documenta explícitamente en §22.10.3 por qué trata Physical AI como extensión y no como capítulo propio, y ese criterio se respetó — el patrón de control se documenta en Cap. 10 (agentes), con referencia cruzada hacia VLA, no al revés.

## Verificación

- Balance de `<div>` en el bloque insertado: 2 aperturas / 2 cierres (`callout`, `warning`), coincide con el patrón ya usado en el resto de §10.4b.
- `id="s104c"` verificado único en todo el archivo (sin colisión).
- Entradas añadidas en los tres sitios que indexan contenido: índice principal (TOC), cuerpo del capítulo, e índice de conceptos del autor (bloque JS con `c:"agentes"`, mismas claves de búsqueda que usaría alguien buscando "admission control", "EMA", "deadline").
- Snapshot de v88 archivado antes de editar: `archivo/Comprender_la_IA_2026_v88.html`.
- `<title>` y badge de la topbar actualizados de "v88" a "v89"; archivo renombrado de `Comprender_la_IA_2026_v88.html` a `Comprender_la_IA_2026_v89.html`.
- Recuento de líneas: 30992 → 31022 (+30), consistente con el contenido añadido (sección nueva + 2 entradas de índice + 1 entrada de concepto + 1 frase de cruce en §22.10.2); ningún otro párrafo del cuerpo se tocó.

## Alcance

Cambio pequeño y localizado: una sección nueva de ~20 líneas de prosa/pseudocódigo, dos entradas de índice, una entrada de concepto, una frase de referencia cruzada. Sin renumeración de secciones existentes (10.4c cabía sin desplazar 10.5 en adelante).
