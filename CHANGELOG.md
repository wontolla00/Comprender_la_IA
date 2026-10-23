# Changelog — Comprender la IA

Historial editorial del manual. Las notas de proceso ("se movió aquí en v91", "añadido en v98"…) viven en este fichero y no en el texto que lee el alumno.

## v127 — 23 octubre 2026 · Apéndice A (costes) con precios de lista fechados y fuentes; Cap. 22 marcado como histórico

Origen: pendientes del registro v125→v126 (auditoría externa; repaso del Cap. 22 y del Apéndice A con fuentes primarias).

- **A.2**: tabla rehecha en **USD/M tokens** (antes decía «€» sobre precios en dólares), con modelos vigentes en octubre de 2026 de Anthropic, OpenAI, Google y DeepSeek, fecha de consulta (23/10/2026) y enlaces a las páginas oficiales. Las filas sin fuente verificada (embeddings, Llama alojado) se declaran «no verificado». Se advierte de los tramos y cambios de precio anunciados.
- **Aviso «Lo que esta tabla no captura»**: caché (2,5–10 % del input en lectura), batch (−50 %), recargos de residencia de datos y tokenizador (≈ +30 % de tokens desde Claude 4.7); los descuentos por volumen pasan a «según contrato, sin cifra».
- **A.1**: fórmula con precios de input y output distintos; ejemplo recalculado con Sonnet 5.5 (150 USD/mes; 225 con Sonnet 4.6); precio de embeddings declarado ilustrativo.
- **Calculadora**: precios separados de input y output (antes output = 4× input), modelos actualizados y retirada de una rama muerta (`arc==='razon'`); aviso de caché reformulado.
- **A.2b y A.3**: las cifras sin fuente (latencias, costes de GraphRAG/reranker/tool loop, «mejora recall 10–25 %», porcentajes neurosimbólicos de Escudero 2026) se declaran estimaciones del autor o no verificadas; nombres de modelos obsoletos sustituidos por familias.
- **Cap. 22**: avisos «sección histórica» en GPT-4V/4o y Gemini 1.x–2.0; la arquitectura de GPT-4V/4o y de Gemini deja de describirse como hecho; precio de $5/M y tokens por imagen declarados ilustrativos; precios de TTS y Whisper API fechados; sección de vídeo marcada como sin actualizar (mayo 2025).
- Versión v126 → v127 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## v126 — 23 octubre 2026 · Experimento de convergencia como observación exploratoria (§20.1) y «70 %» del Cap. 15

Origen: pendientes del registro v124→v125 (auditoría externa, contrastada con el texto).

- **§20.1, «Convergencia multi-sistema»** (antes «Evidencia de segundo orden»; renombrado también en el índice de conceptos del autor): aviso de estatus (observación exploratoria, prueba informal de tres a cinco sistemas sobre un único objeto, sin anotación ciega ni protocolo publicado, con las explicaciones alternativas sin descartar y lo que haría falta para convertirla en evidencia); «reproducible» → «puede repetirse»; la ausencia de datos compartidos se matiza (las empresas comparten buena parte de las fuentes públicas); «evidencia de segundo orden» → hipótesis del autor; el caso narrativo pasa de «demostración directa» a «ilustración anecdótica».
- **Checkpoint del Cap. 20**: la pregunta 1 pasa de «explicación más precisa» a «lectura más prudente»; ya no afirma que los modelos no comparten datos de preentrenamiento.
- **Cap. 15**: el «70 %» deja de ser una cifra («en buena parte» / «en gran parte») y la nota lo declara regla práctica del autor, sin métrica definida ni estudio.
- Versión v125 → v126 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## v125 — 23 octubre 2026 · Atención causal y cross-attention (Cap. 0 y §5.2b)

Origen: pendientes del registro v123→v124 (hallazgos de la auditoría externa contrastados con el texto).

- **Definición de atención** (glosario emergente, 3 apariciones), §0.1.5 y §5.2: «cada token mira a todos los demás» → cada posición pondera las que puede ver (todas, en un modelo bidireccional; solo las anteriores y la propia, en un decoder causal). Fila Self-Attention de la tabla de variantes con la misma precisión.
- **Demo interactiva de §0.1.5**: nuevo botón de modo «bidireccional (encoder) ⇄ causal (decoder)». En modo causal los tokens futuros se enmascaran y los pesos se renormalizan sobre los visibles («gato» solo ve «El» y a sí mismo). El texto de la demo ya no presenta la atención bidireccional como la de un LLM generativo.
- **§5.2b.2**: se retira «la cross-attention es el fundamento de… CLIP, GPT-4V y RAFT». Ahora: la base de la traducción encoder-decoder (T5, BART), de Whisper y de la condición por texto en difusión; entre los modelos de visión-lenguaje, Flamingo. CLIP no usa cross-attention (dos codificadores y pérdida contrastiva), LLaVA proyecta y concatena, la arquitectura de GPT-4V no es pública, y RAFT es una receta de fine-tuning, no un mecanismo de atención. Misma corrección en la tabla de la enciclopedia (fila «Fine-tuning / RAFT») y en el Cap. 22 (LLaVA ya no figura entre los que usan cross-attention).
- Versión v124 → v125 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## v124 — 23 octubre 2026 · Proveedor y deployer en el AI Act (Cap. 16 y referencias)

Origen: punto pendiente del registro v122→v123. El manual decía que quien construye una aplicación sobre una API de LLM es «el deployer» y que los labs son «proveedores de la capa base». Contrastado con el texto del Reglamento (UE) 2024/1689 (arts. 2, 3.3, 3.4, 3.11, 25, 26, 53): quien desarrolla el sistema y lo pone en servicio con su nombre —también para uso propio— es proveedor de ese sistema; deployer es quien usa un sistema desarrollado por otro. Calificación dependiente de cada caso: el texto lo dice y recomienda revisión jurídica.

- **§16.2** reescrita: roles por sistema concreto (proveedor del sistema, deployer, proveedor del modelo GPAI, cambio de rol del art. 25, persona afectada), recuadro de implicación y test rápido de tres preguntas.
- **Clasificador de §16.1**: cuatro roles (proveedor del sistema, deployer, proveedor de modelo, cambio de rol); por defecto, «proveedor del sistema»; textos de cada rol corregidos (la «política de uso aceptable» no es una obligación del AI Act y se retira).
- **§4 (introducción)**, caso de RRHH de §16, **§16.3** (reparto de obligaciones de diseño/conformidad y de uso; «antes de agosto de 2026» sustituido por el calendario del Omnibus), **§16.4** (obligaciones del proveedor de modelo; información y contrato con el proveedor, art. 25.4), apartado de sesgo (arts. 10 y 26.4), tabla de roles del glosario de referencia («Co-proveedor» → «Cambio de rol»), entrada «Deployer» del glosario, quiz F3.2, resúmenes de §4 y §16 y mención en DocLang.
- **Alcance territorial** (apertura del Cap. 16 y tabla de marcos): «opera en la UE o procesa datos de ciudadanos europeos» (criterio del RGPD) → criterios del art. 2 del AI Act, con aviso de que el RGPD es otro régimen.
- Versión v123 → v124 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## v123 — 23 octubre 2026 · Sobreafirmaciones, OWASP 2026 y enlaces de plantilla

Origen: pre-mortem y auditoría factual hechos por un asistente externo sobre la v122, contrastados punto por punto con el texto del manual (varios hallazgos eran ciertos, otros ya estaban corregidos o estaban exagerados; ver `taller/Registro_manual_v122_a_v123.md`). Esta versión corrige los siete puntos aceptados; el resto del informe queda como pendiente en el registro.

- **§21.1 y §21.10 (protocolo de 5 pasos) y quiz del Cap. 9**: la regla «delta ASR > 40 puntos = alineamiento superficial, no apto para criticidad 2+» pasa a «señal de alerta (heurística del autor)»; ya no se atribuye a Shida et al. La prueba de 10 prompts se llama «screening exploratorio» y se explica por qué no basta (IC 95 % de ±30 puntos; 1/10 → 5/10 da p ≈ 0,14, Fisher). Los objetivos ASR < 20 % / < 5 % se marcan como heurística del autor.
- **§11.3**: nuevo recuadro «Matiz (2026-10)»: la tabla de precisión mínima es el marco operativo del autor, no un umbral legal; «Obligatorio» significa «lo exige este marco». Mapa del Cap. 3: mismo aviso y el golden dataset de ≥20 pares se presenta como mínimo para arrancar.
- **Cap. 16 (cabecera)**: se retira «el AI Act no inventa los niveles, los codifica»; los niveles 1–4 son del autor y la correspondencia con las categorías legales es orientativa.
- **Cap. 10 (aviso inicial)**: «es la causa principal del fracaso silencioso» → «un riesgo central —y fácil de pasar por alto—».
- **§9.1 y §20.1 (ARC-AGI-3)**: resultados fechados (marzo de 2026); la causa estructural y la diferencia «de tipo» pasan a hipótesis del autor; «demuestra» → indicio. El título del recuadro de §20.1 cambia de «evidencia» a «indicio» (índice de conceptos incluido).
- **Cap. 22**: la frase «la mayoría de aplicaciones…» se sustituye por una formulación sin cuantificador; los modelos nombrados se declaran ejemplos de 2023–2024. **Pendiente**: repaso completo del capítulo con fuentes primarias.
- **§21.8**: mapa OWASP actualizado a la edición 2026 (anuncio del 1/09/2026). IDs fijados solo para LLM01–03; Hidden Context Exposure sustituye a System Prompt Leakage; Excessive Agency sube al puesto 3; recuadro con lo verificado y lo no verificado. Referencia del Cap. 21 actualizada.
- **Enlaces**: 3 enlaces al CHANGELOG apuntan a `github.com/wontolla00/Comprender_la_IA`; los 4 botones a notebooks inexistentes (`your-repo`) se sustituyen por una nota (el código está en el bloque siguiente).
- Versión v122 → v123 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`. `README.md`: tamaño corregido (~2,9 MB) y Cap. 22 situado en el Módulo 6, como en el HTML.

## v122 — 16 octubre 2026 · Cómputo en inferencia: generar y elegir (§9.7b) y tres matices

Origen: pendientes del triaje CI-IT-1 (docx de Chawla, `2026-10-12 (d)`), CI-DM-1 (Letourmy, `2026-10-12 (c)`), CI-MC-1 (Fernandes et al.,
`2026-10-12 (f)`) y CI-FO-1 (guía «Agents, Loops, Graphs», `2026-10-12 (e)`). Los primarios se leyeron el 16/10/2026 antes de citar; las
cifras del docx de Chawla y de los resúmenes divulgativos no entran. Detalle en `taller/Registro_manual_v121_a_v122.md`.

- **§9.7b** (nuevo, `id="s97b"`, con entrada de índice, nivel «profundidad»), tras §9.7: marco generación paralela/secuencial y quién elige;
  tabla de cinco técnicas con la evidencia y sus límites (Wang, Loo, Gao, Huang, Yao, Snell, DeepSeek, Gema); matiz del «14×» de Snell
  (vale con éxito no trivial del modelo pequeño); Sprague (la cadena de pensamiento ayuda sobre todo en matemáticas y lógica); recuadro
  «Regla de diseño: primero la señal de verificación» (presentada como regla del manual, no como resultado de un estudio) y recuadro de límites.
- **§13.2** y **§13.7**, al final: recuadros «Matiz (2026-10)» con dos casos fechados: OpenAI (29/01/2026, evaluaciones que comparan el resultado
  de la SQL y no el texto) y Anthropic (03/06/2026, la precisión offline derivó de ~95 % a ~65 % en un mes por documentación sin mantener), con salvedades.
- **§14.2b**: recuadro «Matiz (2026-10) · Rendir más no es calibrar mejor» (Fernandes et al., preprint exploratorio, sin lenguaje causal).
- **§8.8b** y **§10.4b** (CI-FO-1): el verificador recibe el output y el criterio, no el historial de razonamiento (contexto fresco); la salida 1
  exige un evaluador distinto del agente; nuevo párrafo sobre la tasa de aprovechamiento (salidas conservadas entre generadas). La comprobación de
  «aristas falsas» ya estaba en §8.8b bloque 1, sin cambio.
- Versión v121 → v122 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`; índice 442 → 443 entradas.

## v121 — 16 octubre 2026 · Medir también tiene que ser reproducible (§4.3)

Origen: artículo «Faites-vous trop confiance à ChatGPT ?» (veille del 16/10) y, a través de él, el preprint «Invisible to the Machine»
(Pitenin, arXiv:2608.07069), leído completo. Veredicto del triaje (`2026-10-16 (a)`): **Integrar, en pequeño**; las cifras de
visibilidad de locales y el relato de la «flauta de Hamelín» del artículo no entran. CI-AV-1 cerrado. Detalle en
`taller/Registro_manual_v120_a_v121.md`.

- **§4.3**, al final: recuadro «Matiz (2026-10)» sobre la reproducibilidad de la *medición* (repetir, reformular, comparar entre
  sistemas, validar el instrumento de extracción), con el caso del preprint y sus límites explícitos (sin revisión por pares, de un
  proveedor del sector, observacional, una región, API con búsqueda).
- Versión v120 → v121 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## v120 — 15 octubre 2026 · La inyección que se copia (§21.5.1)

Origen: infografía y post «L'injection de prompt devient un ver» (veille del 14/10), contrastados con el informe primario de
OpenAI («Self-replicating prompt injections exist», 25/09/2026). Veredicto del triaje (`2026-10-14 (c)`): **Integrar, en pequeño**;
la infografía y sus cifras no entran como contenido. CI-WM-1 cerrado. Detalle en `taller/Registro_manual_v119_a_v120.md`.

- **§21.5.1**, tabla de canales de salida: una fila más, «La salida del agente, leída por otro agente» (la autorreplicación: lo
  que un agente escribe es la entrada de otro), con su mitigación.
- **§21.5**, tras el Caso 4: recuadro «Matiz (2026-10)» con el hallazgo de OpenAI (laboratorio, puntos de control internos, sin
  incidente ni tasas), el antecedente Morris II (arXiv:2403.02817, 2024) y por qué la regla de §21.4 no cambia. Dos entradas
  más en la bibliografía del capítulo.
- Versión v119 → v120 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## v119 — 14 octubre 2026 · «Una petición MCP, paso a paso» (§10.10.1b)

Origen: infografía y post «MCP in One Request» (veille del 14/10), contrastados con la especificación MCP en primario
(revisión 2026-07-28, y 2025-11-25 para el handshake anterior). El esquema se descartó como contenido (cliente que
«descubre servidores» y enruta, flujo con estado previo a 2026, servidor que «ejecuta de forma segura», resultado como
evidencia anclada, sin prompts, transportes ni autorización); la idea de una explicación de punta a punta se rehízo y se
incorporó. Detalle en `taller/Registro_manual_v118_a_v119.md`.

- **§10.10.1b** (nuevo, con entrada de índice; `id="s10101b"`) entre §10.10.1 y §10.10.2: actores (host, cliente 1:1,
  servidor, modelo, persona), la petición en ocho pasos, tabla de las tres primitivas (herramientas: modelo; recursos:
  aplicación; prompts: persona) con lo que exige el spec, recuadro de tres correcciones al esquema habitual, simulador
  de cuatro pestañas (recorrido con revisión/transporte/escenario, dos revisiones con matriz de compatibilidad, quién
  controla qué con test, capa de confianza con cinco controles) y recuadro de revisión con insignia «caduca rápido».
  Fuente editable: `taller/widget_mcp_peticion.html`. El marco ajusta su altura al contenido y sigue el modo oscuro del manual
  (`body.dark`); suelto, usa el del sistema y tiene un botón para cambiarlo.
- **§10.9.4**, «Matiz (2026-09)»: una línea más con el segundo caso de la puerta verificable (Zhang et al.,
  arXiv:2609.35738), sin cifras y con salvedades (CI-HL-1; el método se describe según la extracción del PDF).

## v118 — 12 octubre 2026 · Simulador de caché KV y de prefill/decode (§5.7d)

Origen: tres piezas de veille del 12/10 (infografía «How LLMs Actually Generate Text», docx «How LLM Inference Works, Clearly
Explained» y un simulador HTML sobre KV cache y prefill/decode). Las dos primeras se descartaron como contenido; el simulador
se rehízo y se incorporó. Detalle en `taller/Registro_manual_v117_a_v118.md`.

- **§5.7d** gana, tras el apartado «El techo cuantitativo» y antes del recuadro de overhead-bound, un párrafo de enlace y un
  simulador con dos pestañas: caché KV (por token, total, frente a la memoria libre tras los pesos, con cabezas K/V para ver el
  efecto de GQA) y prefill frente a decode (TTFT, ITL, intensidad aritmética frente al punto de equilibrio, cuello de botella
  calculado, gráficos de TTFT e ITL, simulación). Presets con las arquitecturas publicadas de Llama-2-7B, Llama-3-8B y Llama-3-70B;
  hardware con las fichas de NVIDIA (H100 con los TFLOPS densos, coherente con el aviso de sparsity del propio apartado).
  Fuente editable: `taller/widget_kv_prefill_decode.html`. Sin `id` nuevo ni entrada de índice.

## v117 — 12 octubre 2026 · Ejemplo interactivo de retropropagación (§0.1.3)

Origen: infografía, post y versión HTML «How Backpropagation Works» (Tech with Mak), recibidos el 12/10/2026;
el autor decidió incluirlo como referencia visual. Después (mismo día) pidió cifras propias: el ejemplo del manual usa
x=1, y=2, w=(1, 3), v=(−2, 1) y no cita a Tech with Mak (sin cambio de versión). Detalle en `taller/Registro_manual_v116_a_v117.md`.

- **§0.1.3** gana, tras el simulador de la neurona y antes de §0.1.4, un párrafo de enlace (retropropagación y
  descenso del gradiente, ambos con glosario emergente) y un simulador de cuatro pasos sobre una red de una
  entrada, dos unidades ReLU y una salida lineal: pasada hacia delante, gradientes con la regla de la cadena,
  actualización con tasa de aprendizaje η ajustable y nueva predicción. Todo se recalcula desde η, de modo que
  con η = 0,15 o 0,5 la pérdida sube y el simulador lo dice. Fuente editable: `taller/widget_retropropagacion.html`.
- El ejemplo numérico es el de la infografía original (adaptado, con la fuente en el pie del simulador); la
  versión HTML original se rehízo: corregida la notación, dibujada la red y calculados con η los pasos 3 y 4.
  Sin `id` nuevo ni entrada de índice.

## v116 — 30 septiembre 2026 · Quién describe la arquitectura de un asistente comercial (§10.4)

Origen: un post de LinkedIn del 30/09 con el esquema de arquitectura de Muse (Meta), obtenido
preguntándole al propio asistente. Detalle en `taller/Registro_manual_v115_a_v116.md`.

- **§10.4** gana, al final de la sección y antes de §10.4b, un recuadro que trata los esquemas de
  arquitectura extraídos de la autodescripción de un asistente como hipótesis y no como documentación:
  separar lo confirmado por el proveedor de lo declarado por el asistente, y diseñar la gobernanza contra
  lo observable (llamadas, permisos, registros; §10.6 y §12.6). Enlaza con LLM07 (§21.8) y §10.5c. El caso de
  Muse se cita con su fecha: el comunicado de Meta (abril de 2026) solo confirma subagentes en paralelo.

## v115 — 30 septiembre 2026 · Trendslop (§20.1) e IMD sobre confianza y previsión (§20.3b)

Origen: dos piezas de veille del 30/09 (un post sobre Asimov y los problemas de la IA, y un artículo en
francés sobre prospectiva y literatura). Detalle en `taller/Registro_manual_v114_a_v115.md`.

- **§20.1** gana un párrafo con la medición reciente del *trendslop* (Romasanta, Thomas y Levina, HBR,
  marzo 2026): siete modelos convergen en las mismas estrategias de moda incluso al reformular o pedir
  pros y contras. El detalle procede de la cobertura de Fortune; el texto declara que no se contrastó
  con el artículo completo.
- **§20.3b** gana un párrafo con el experimento de IMD (Parra-Moyano, Reinmoeller y Schmedders, HBR,
  julio 2025): cerca de 300 directivos, previsión del precio de Nvidia; quien consultó a ChatGPT quedó más
  confiado y acertó menos que quien discutió con colegas. Contrastado con el artículo de HBR.

## v114 — 30 septiembre 2026 · Contrato de embedding (§2.4) y corrección de memoria MoE (§5.7b)

Origen: veille del 30/09 (handbook de embeddings de techNmak y guía de MoE en inferencia). Las otras
piezas del lote (LoRA, KV cache, 15 conceptos, Jev 10 pasos, U-Net) ya estaban cubiertas o triadas.
Detalle en `taller/Registro_manual_v113_a_v114.md`. v113 (nota de matiz en §10.9.4) está en
`taller/Registro_manual_v112_a_v113.md`.

- **§2.4** gana un recuadro "Un vector solo significa algo junto con quien lo produjo": prefijos de
  consulta/documento (E5, Nomic; BGE-M3 no los necesita), pooling, normalización y métrica (coseno =
  producto punto solo con norma unitaria) y preprocesado. Prefijos y pooling verificados contra las
  fichas de Hugging Face de `multilingual-e5-large` y `nomic-embed-text-v1.5`.
- **§5.7b**: corregida una contradicción interna. El recuadro "La trampa del titular" decía que
  DeepSeek-V3 (671B) "cabe en hardware accesible" a 4 bits; son ≈335 GB solo en pesos. Ahora
  distingue cómputo (activos) de memoria (residentes) y remite a §5.7g, coherente con la viñeta
  "Memoria total elevada" de la propia sección.

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
