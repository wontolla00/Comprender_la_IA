# Registro de cambios · v92 → v93

*Septiembre 2026. Tres orígenes distintos, ejecutados en la misma sesión tras cerrar la ronda 3 de revisión de posts externos.*

## 1. Sección nueva: 10.9.8 Skills

Origen: "Les skills et l'intelligence artificielle opérationnelle" (Associate Professor AI/ML, EPITA, LinkedIn, 5 sep. 2026) — artículo académico completo, bibliografía de 16 papers verificados por muestreo (RAG Lewis 2020, ReAct, Toolformer, ToolLLM, Voyager 2305.16291, ExpeL 2308.10144, Agent Workflow Memory 2409.07429, Memp 2508.06433, Reflexion, CoALA 2309.02427, A-MEM, ADAS 2408.08435, AFlow 2410.10762, survey de self-evolving agents, Greshake indirect prompt injection).

**Verificación previa**: grep de los términos técnicos centrales del artículo (SKILL.md, skill library, divulgación progresiva, Voyager, CoALA, ExpeL, ADAS, AFlow, Agent Workflow Memory, skill shadowing, Toolformer, ToolLLM) contra el manual completo — **cero coincidencias**. Hueco real y grande: una capa entera de arquitectura agéntica sin cobertura, pese a que los objetos vecinos con los que se define por contraste (prompts, herramientas, memoria, workflows, identidad de agente) están cubiertos con profundidad en Cap. 8 y Cap. 10.

**Ubicación elegida**: nueva subsección **§10.9.8**, entre §10.9.7 (cierre del bloque de memoria de agentes) y §10.10 (interoperabilidad/identidad). Encaja mejor ahí que en Cap. 8 o como sección de nivel superior: CoALA (ya sería la referencia natural) distingue memoria semántica/episódica/procedural, y §10.9 ya cubre las dos primeras — el hueco es exactamente el tercer registro, no un tema nuevo sin relación.

**Contenido**: definición de skill como artefacto externo al modelo (vs. prompt de una vez), mecanismo de divulgación progresiva con puente explícito a §6.13.4 (el sistema de memoria de 4 tipos de Claude Code, ya documentado en el manual sin usar el término "skill" — es divulgación progresiva aplicada a hechos, no a procedimiento), linaje de investigación de adquisición automática (Voyager → ExpeL/Agent Workflow Memory, con la salvedad honesta de que ninguna generaliza a tareas sin señal de verificación automática), patología de biblioteca grande ("skill shadowing", eco explícito de §10.3 entropía acumulada — más no es mejor), y puente de gobernanza hacia §10.10 (un skill de procedencia no verificada es superficie de inyección igual que un documento de RAG).

**Decisión de alcance**: no se reprodujo la anatomía de 11 componentes del artículo ni su taxonomía completa de gobernanza en 8 ejes — habría inflado la sección sin verificación propia de cada punto. Se seleccionaron los tres elementos con verificación más sólida (divulgación progresiva con ejemplo real ya en el manual, linaje de investigación con arXiv IDs verificados, patología de biblioteca con eco temático ya establecido) en vez de una traducción completa del artículo.

## 2. Refresco de §15.4c (llm-d v0.9)

Origen: infografía "llm-d: Scaling LLM Inference Beyond a Single Engine" (sep. 2026), continuación del post #10 de la ronda 1 (ya cubierto en v89).

Verificado contra fuente primaria ([llm-d.ai/blog/sticky-until-saturated-token-aware-routing](https://llm-d.ai/blog/sticky-until-saturated-token-aware-routing), [llm-d.ai/blog/llm-d-v0.9-hardened-for-scale](https://llm-d.ai/blog/llm-d-v0.9-hardened-for-scale)): "sticky until saturated" es el nombre real de la estrategia de routing por defecto, con una cifra citada textualmente (no de gráfico) de **2-3× de throughput frente a round-robin** — más limpia que la cifra de 13.9× ya marcada como no confirmada en el texto existente. Añadida como frase nueva sin tocar la cifra de disagregación (~70%, AWS SageMaker HyperPod), que sigue confirmada. Añadido un segundo párrafo sobre la capa de producción de v0.9 (HA del router, flow control, rolling updates, tracing OTel, autoscaling KEDA dirigido por SLO) — informativo, sin caso propio en HyperRAG (sigue sobre Ollama).

## 3. Cita de GitHub Copilot custom agents en §10.10.3

Origen: post "Le enseñé a GitHub a arreglar su propio código..." (LinkedIn, sep. 2026), ya evaluado como "sin hueco real" — el manual ya cubre el principio de fondo (Patrón Sándwich, tinta y cemento) con más rigor. Único punto de valor: nombrar el producto de primera parte de GitHub que implementa esta arquitectura en producción hoy, junto al incidente anonimizado que ya motivaba la sección. Añadida una frase de pie de sección, verificada contra [GitHub Docs](https://docs.github.com/en/copilot/concepts/agents/cloud-agent/about-custom-agents) — sin tocar el argumento existente.

## 4. Reordenamiento de portada — item pendiente de #18 (parcial)

Origen: leftover explícito de `Registro_manual_v90_a_v91.md`: *"No se movió 'El mapa rápido: cuánto necesitas leer' al Módulo 3, ni los tres conceptos transversales al glosario"*.

- **"El mapa rápido" → movido.** Contenido trasladado del umbral del Módulo 0 al umbral del Módulo 3, justo antes de "El mapa de complejidad" (la tabla fina que ya existía ahí). En Módulo 0 queda solo un puntero de una frase; la frase de cierre del bloque movido se reescribió porque antes apuntaba hacia adelante ("el inicio del Módulo 3 tiene una tabla...") y ahora está en ese mismo punto.
- **"Los tres conceptos transversales al glosario" → NO ejecutado.** El registro de #18 no especifica cuáles son esos tres conceptos, y el documento del análisis externo original no se guardó como archivo en su momento (no está en `taller/`). Ejecutarlo sin ese texto habría significado adivinar qué mover, con el riesgo de huecos de contexto que el propio registro de v91 ya señalaba como el motivo de no haberlo hecho entonces. Queda pendiente para una ronda donde se recupere o repita el análisis original.

## Verificación

- Parseo HTML completo (`html.parser`, comparando contra `archivo/Comprender_la_IA_2026_v92.html`): 0 avisos de anidamiento, 0 etiquetas sin cerrar, en ambas versiones.
- `id`: 944 → 945 (+1, `s1098`). Sin duplicados en ninguna versión.
- Enlaces internos: 722 → 723 (+1, la entrada de TOC nueva). **Cero rotos nuevos.**
- Líneas: 31.053 → 31.076 (+23).
- Snapshot de v92 archivado antes de editar: `archivo/Comprender_la_IA_2026_v92.html`.
- `<title>` y badge actualizados a v93; archivo renombrado a `Comprender_la_IA_2026_v93.html`.
- Entrada añadida al índice de conceptos del autor (bloque JS): 1 (Skills, `#s1098`).

## Alcance

Cuatro cambios de origen y tamaño distinto, ninguno reabre un diagnóstico existente: una sección nueva de tamaño moderado (10.9.8), dos refrescos de una frase/párrafo sobre contenido ya escrito (15.4c, 10.10.3), y una reubicación de contenido sin pérdida (mapa rápido). Sin cambios en HyperRAG ni Empreinte — ninguno de los cuatro orígenes tenía pieza de código propia pendiente.
