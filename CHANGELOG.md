# Changelog — Comprender la IA

Historial editorial del manual. Las notas de proceso ("se movió aquí en v91", "añadido en v98"…) viven en este fichero y no en el texto que lee el alumno.

## v112 — 28 septiembre 2026 · Cardinalidad variable en clasificación (§12.4b)

Origen: nota técnica académica ("Les modèles de décision structurée, Jev", Julien Perez, EPITA,
26 sept. 2026) — no material de proveedor ni periodístico, a diferencia de dos fuentes anteriores
sobre el mismo producto ya registradas en `taller/Triaje_fuentes_externas_2026.md`. Detalle técnico
completo, incluida la verificación de balance de etiquetas, en `taller/Registro_manual_v111_a_v112.md`.

- Nueva subsección §12.4b "Cardinalidad variable: cuando el número de opciones no está fijado en
  el entrenamiento" — la fila que faltaba en la tabla existente entre "clasificador especializado"
  (categorías fijas) y "LLM generativo" (contexto abierto): puntuación de candidatos cuyo número
  varía por llamada, sin reentrenar (proyección d→1 por candidato en vez de d→n fijo).
- Cita Laya (`github.com/NandhaKishorM/laya`, ModernBERT-large, código abierto), verificado antes
  de citar, en vez de depender solo de las cifras de rendimiento de Jev/TypeSafe (sin verificación
  independiente, misma cautela que el resto del manual — §20.6).
- Grounding en el propio corpus: el reranker CrossEncoder de HyperRAG ya resuelve este problema en
  producción, sin haberlo nombrado así hasta ahora.
- Entrada nueva en el índice temático interactivo (categoría "arquitectura").
- Corrección incidental: `Fase_0_Onboarding.html` apuntaba a un nombre de archivo versionado
  (`Comprender_la_IA_2026_v108.html`) que no existe en este repositorio — corregido a `index.html`
  en los dos enlaces, consistente con la convención de este repo (el archivo vivo se llama
  `index.html`; solo `archivo/` usa nombres versionados).

## v110–v111 — septiembre 2026 · sin registro detallado

Estas dos versiones existieron en la copia de trabajo local antes de esta sesión de sincronización,
con snapshots conservados en `archivo/`, pero sin una entrada de changelog que documente qué
cambió en ninguna — hueco anterior a esta sesión, señalado aquí en vez de completado con
contenido inventado.

## v109 — septiembre 2026 · Revisión post-auditoría

Correcciones derivadas de la auditoría externa por dimensiones (rigor, coherencia pedagógica, aplicabilidad, lenguaje, navegabilidad, cobertura, adecuación al perfil).

**Limpieza de andamiaje editorial**
- Retirados del HTML los rótulos de maquetación en inglés del laboratorio de tokenización (`CRITICAL TECH NOTE SECTION`, `LEFT: SIMULATOR`, `RIGHT: THEORETICAL SUMMARY & EVOLUTION`, `BOTTOM: FULL PIPELINE`) y traducidos al español los botones y títulos visibles del widget (Carácter, Palabra, Subpalabra, Nivel de byte, Texto en bruto).
- Las notas de versión `vNN:` incrustadas en el código pasan a este changelog (sección final). Los marcadores estructurales de sección se conservan sin la referencia de versión.
- Retiradas del texto visible las etiquetas "NUEVO en v22/v53", "Frontera de investigación — v33/v36/v37", "Extensión v30" y la promesa caducada de migrar contenido "en v26".
- El banner del modo núcleo ya no afirma un número fijo de secciones plegadas (decía 33; el script pliega 39).

**Navegación e índice**
- Eliminada la entrada duplicada de §12.6 en el índice (aparecía dos veces con anclas distintas, una antes de 12.1).
- §10.9 (memoria persistente) y §10.10 (MCP/A2A) vuelven físicamente al Capítulo 10, antes del cierre del capítulo y del checkpoint del Módulo 2; antes aparecían tras la portada del Módulo 3.
- §9.6 marcada como 💡 Avanzado en índice y título; 5.7d, 5.7e y 5.7g marcadas como "Avanzado · Infraestructura" y 5.7g reclasificada de 📘 a 💡 en el índice.
- El mapa del Cap. 5 separa "Decidir qué modelo usar" (5.7b, 5.7c, 5.7f) de "Servir modelos propios" (5.7d, 5.7e, 5.7g), con indicación explícita de que quien integra vía API puede saltar el segundo bloque.
- Recuento del índice actualizado (442 entradas).

**Glosario**
- Reordenado alfabéticamente de verdad: ~20 entradas estaban en letras equivocadas (Zero-shot, GRPO, Phantom data bajo "C"; Artefacto operativo y Cuantización bajo "T-Z"; LightRAG bajo "H"; YaRN, MMR, Expansión de consulta bajo "R"…). Barra de letras ampliada con J, O, Y, Z.
- Fusionada la entrada duplicada de GRPO.
- Corregido un error de marcado: la entrada "Golden Dataset" no se cerraba y anidaba dentro "Indexación jerárquica" y "GQA".
- Normalizadas siete entradas en formato antiguo (ASR, FRR, JailbreakBench, OCR Poisoning, Sycophancy, LLM Salting, Deriva de identidad) y retirada su etiqueta "★ nuevo", que se confundía con la marca ★ de concepto del autor.
- La tabla de equivalencias autor ↔ estándar pasa al final del glosario (antes separaba la barra de letras de las entradas).
- Recuento real: 111 términos (antes "110+").

**Rigor y referencias cruzadas**
- §4.5: "Módulo 3 (Capítulos 16 y 17)" → Cap. 14 (gobernanza) y Cap. 16 (AI Act), con enlaces.
- Glosario "OCR Poisoning": remitía a Cap. 21.4; corregido a 21.3.
- JailbreakBench atribuido a Chao et al. (2024), no a Shen et al.; ImgTrojan a Tao et al. (2024), no a Chen et al.
- Cap. 21: retiradas dos cifras de ASR con referencias arXiv que no se pudieron localizar (2512.67890, 2511.34567) y la cifra de ">90% (estimado)"; la cifra de 85% atribuida a ImgTrojan (que mide envenenamiento de entrenamiento, no inyección tipográfica) se sustituye por FigStep como referencia del ataque tipográfico.
- Cap. 21, caso Bing/Sydney: el 82,1% de ASR no es una medición sobre Sydney; se aclara su origen y se documenta la respuesta real (límite de 5 turnos/sesión y 50/día).
- Cap. 21, tabla CNIL reescrita como "AI Act, RGPD y CNIL: qué obligación es de quién": no existe registro ante la CNIL desde 2018 (Art. 30 RGPD es un registro interno); el plazo de 72 h es del Art. 33 RGPD, no del Art. 73 AI Act; la sanción de 35 M€/7% se reserva a prácticas prohibidas (resto: 15 M€/3%; RGPD Arts. 30/33/35: 10 M€/2%); el "<2 minutos" de parada se identifica como criterio de diseño del manual, no plazo legal; los 6 meses de logs se anclan al Art. 26.6.

**Cobertura: Capítulo 21 ampliado**
- Nuevas secciones 21.4–21.8: inyección de prompt indirecta; exfiltración y "tríada letal" (con el caso EchoLeak, CVE-2025-32711); seguridad de agentes y MCP (tool poisoning, rug pull, shadowing, flujos tóxicos, confused deputy); seis patrones de diseño defensivo (Beurer-Kellner et al., 2025; Dual LLM; CaMeL); mapa OWASP Top 10 para LLM (2025) → secciones del manual.
- Secciones existentes renumeradas 21.9–21.12; protocolo de 5 pasos ampliado con el vector de inyección indirecta; referencias ampliadas.
- Cap. 21 pasa de 💡 Avanzado a 📘 Recomendado para sistemas que recuperan contenido externo o usan herramientas.

**Tiempos**
- Las tarjetas de ruta indican ahora "h de lectura" junto al calendario real (p. ej. "~30 h de lectura · 10–20 semanas a ritmo real"), coherente con la sección "Cuánto tiempo".

## Notas editoriales retiradas del HTML (anteriores a v109)

- v98: añadido un cuarto concepto transversal (Patrón sándwich / Capa 2) a este callout. Cierra el pendiente "tres conceptos transversales al glosario" del análisis externo de portada (post #18, 2026-09) — el texto original de ese análisis nunca se guardó y no era recuperable; el callout preexistente (ya presente en v88, anterior al propio análisis) no era la pieza pendiente. Candidato elegido por frecuencia real (84+ menciones de "patrón sándwich", 22 de "Capa 2") y por ser el único de los cuatro sin localizador en este Módulo 0 pese a ser el concepto más citado transversalmente del manual (seguridad, agentes, RAG, gobernanza).
- v93: "El mapa rápido" se movió al umbral del Módulo 3 (justo antes de "El mapa de complejidad"), donde el lector ya sabe qué es el Módulo 3 y puede usar el desglose fino que sigue. Aquí queda solo el puntero.
- v93: contenido movido aquí desde el Módulo 0 ("El mapa rápido"), con la frase de cierre reescrita porque ahora señala hacia abajo, no hacia un módulo futuro.
- RUTAS POR PROYECTO — movidas en v91 a la puerta de modo consulta, junto al índice por tarea (estaban antes del título del manual)
- HOOK TÉCNICO — subido a la portada en v91 (antes vivía dentro del Módulo 0, detrás del índice)
- v91: el índice completo (425 entradas) pasa a estar plegado por defecto. No se movió ni se perdió ninguna entrada — deja de ser un peaje de ~460 líneas entre la portada y el primer contenido, y sigue siendo un destino de un clic desde la barra superior. Sin JS: elemento details/summary nativo, los enlaces directos a #indice siguen funcionando.
- HOOK TÉCNICO — movido a la portada en v91 (era el mejor gancho del manual y estaba enterrado bajo el índice)
- v91: las tres vistas redundantes de ruta (por módulo, tabla de prerrequisitos, Ruta MVP detallada) pasan a estar plegadas bajo un solo desplegable. El propio texto reconocía dos veces que "las tres describen las mismas rutas a distinto nivel de zoom": ahora se leen así, en un solo sitio, en vez de como tres bloques consecutivos que el lector cree obligatorios. Ninguna entrada se movió ni se perdió; los anclajes #prerrequisitos-perfil y #ruta-mvp-detalle siguen funcionando.
- v91: la advertencia transversal de entropía acumulada se movió al umbral del Módulo 2, donde el lector ya tiene el vocabulario para usarla. Aquí queda la tesis en dos frases sin jerga: siembra la idea sin exigir saber qué es un agente.
- v91: nota terminológica duplicada retirada. Decía lo mismo que la advertencia transversal (ahora en el umbral del Módulo 2, donde su nota terminológica quedó integrada), y su frase "los dos siguientes párrafos son una vista anticipada" ya no correspondía a nada: los párrafos que describía estaban por encima, no por debajo.
- v91: advertencia transversal movida aquí desde el Módulo 0. Su contenido exige saber qué es un agente y un pipeline de razonamiento — conocimiento que el lector tiene al llegar aquí y no tenía en la página 1. En el Módulo 0 queda la misma tesis en dos frases sin jerga.
- v51: caso REAP/destilacion/MTP
- v51: regresion simbolica
- v51: Robodebt
- v51: escalera de verificadores
- v51: E0-E4 (MATOS IA)
- v51: arnes MMLU
- v51: mini arbol tests
- v51: verificacion vs descubrimiento
- v51: A0-A4 y regla de no compensacion
- v51: antipatron compliance promediado
- v51: fallback silencioso MTP
- SECCIÓN 5.5e — Erosión de contexto: la degradación longitudinal (v30) Insertar entre 5.5d y 5.6
- SECCIÓN 9.10 — IA NEUROSIMBÓLICA: EL PUENTE DE VUELTA (v29)
- SECCIÓN 13.14 — CRÍTICA MULTI-MODELO: INTERSECCIÓN VERIFICADA (v28)
- SECCIONES 13.11-13.13 — RAGAS EN PROFUNDIDAD + GROUND TRUTH + RED TEAMING (v27)
- CAP 22 — MULTIMODALIDAD (NUEVO EN v22)
- ÍNDICE TEMÁTICO (NUEVO v22)
- ENTREGABLE MÓDULO 2 — v5
- ENTREGABLE MÓDULO 3 — v5
- CUÁNTO TIEMPO — comprimido en v4
- CÓMO ESTÁ ESCRITO — comprimido en v4
