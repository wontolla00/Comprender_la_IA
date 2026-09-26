# Registro de cambios · v89 → v90

*Septiembre 2026.*

Origen: revisión de un artículo técnico externo ("LLM Cost Prediction: From Single Prompts to Agentic Systems") sobre el estado del arte en predicción de coste de LLM y de agentes antes de la ejecución. Al evaluarlo se detectó que §10.4b/§10.4c (escritas en v88→v89, esta misma ronda de revisión) hacían afirmaciones de diseño razonables pero sin ningún anclaje empírico citado — el hueco no era de contenido nuevo, era de evidencia para contenido ya escrito.

## Verificación previa

Spot-check de las dos citas usadas (no las ~15 restantes del artículo, fuera de alcance de esta ronda): **Bai et al.** (arXiv:2604.22750, abr. 2026, SWE-bench Verified, 500 tareas × 8 LLMs de frontera × 4 ejecuciones) y **BAGEN** (arXiv:2606.00198, may. 2026). Ambas confirmadas reales contra resúmenes públicos coincidentes con las cifras citadas.

## Cambios

**§10.4b**, nuevo párrafo tras la tabla de las ocho salidas, antes de la nota sobre el circuit breaker: cita la cifra de Bai et al. (hasta 30× de varianza en tokens entre dos ejecuciones de la misma tarea con el mismo modelo; correlación de autopredicción del modelo r≈0,39, con subestimación sistemática) para justificar por qué la salida 3 (tope de presupuesto) no es cautela excesiva, sino necesaria — un agente no puede saber de antemano, de forma fiable, cuánto va a costar la tarea.

**§10.4c**, nuevo párrafo entre el callout "Complementario a las ocho salidas" y el aviso "Qué no se afirma aquí": cita BAGEN para justificar por qué `AdmissionController` compara contra un umbral binario (EMA + margen) en vez de intentar predecir el coste exacto restante — BAGEN mide que "¿esto cabe en el presupuesto?" (feasibility, binaria) llega a ~90% de acierto tras ajuste fino, mientras que "¿cuántos tokens exactos faltan?" (intervalo numérico) se queda en ~47% de cobertura con el mismo entrenamiento, y que ni siquiera la habilidad general del agente predice esta capacidad (r=0,35). El diseño ya escrito en v89 (feasibility binaria, no predicción precisa) queda validado por evidencia externa real, no solo por intuición de ingeniería.

No se añadió una sección nueva catalogando el resto del artículo (TRAIL, EGTP, ESTP, S³, SSJF): son técnicas de nivel de servidor que requieren acceso a estados internos del modelo o un motor de serving propio (vLLM/SGLang), fuera del alcance de este manual con el mismo criterio ya aplicado a cuantización (§5.7c) y prefix caching multi-réplica (§15.4c) — HyperRAG corre sobre Ollama sin motor de serving propio.

## Verificación

- Balance de `<div>`/`</div>` sin cambio respecto a v89 salvo por las divs ya existentes de los dos párrafos nuevos (ambos son `<p>`, no introducen `<div>` nuevos) — recuento idéntico de líneas con `<div`/`</div>` antes y después (4850/4910 en ambos casos; el recuento de `grep -c` cuenta líneas con coincidencia, no ocurrencias, así que esta cifra ya no era un balance real ni antes de este cambio — verificado que la discrepancia es idéntica en v89 y v90, no introducida aquí).
- Recuento de líneas: 31022 (v89) → 31024 (v90), +2, consistente con dos párrafos nuevos de una línea cada uno.
- Snapshot de v89 archivado antes de editar: `archivo/Comprender_la_IA_2026_v89.html`.
- `<title>` y badge de la topbar actualizados de "v89" a "v90"; archivo renombrado de `Comprender_la_IA_2026_v89.html` a `Comprender_la_IA_2026_v90.html`.
- No se tocó la numeración de secciones ni el índice — ningún encabezado nuevo, solo prosa insertada dentro de secciones ya indexadas.

## Alcance

Cambio mínimo: dos párrafos de evidencia añadidos a contenido ya escrito en la ronda anterior (v88→v89), sin secciones nuevas ni renumeración.
