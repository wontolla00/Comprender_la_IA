# Triaje de fuentes externas · log acumulado

*Abierto agosto 2026.*

Registro continuo de artículos, posts y papers evaluados como candidatos a
enriquecer o corregir el manual *Comprender la IA*, o a extender/corregir
Empreinte y HyperRAG. Cada entrada es un veredicto, no un resumen — el
objetivo es una traza de por qué algo entró, se descartó, o quedó en
observación, para no re-litigar la misma fuente dos veces ni perder el
razonamiento detrás de una decisión ya tomada.

Formato de entrada de este log, no del manual: aquí cabe una fuente débil
documentada como débil. Lo que pasa al manual, a Empreinte o a HyperRAG es
solo lo que supera el triaje; queda registrado en `Registro_manual_vNN.md`
(o equivalente) cuando se aplica.

---

## Pendientes abiertos — leer esto primero al retomar

*Actualizado 2026-08-20, veinticinco fuentes evaluadas hasta ahora.*

**CERRADO en v140 / PENDIENTE de Empreinte (2026-10-30, entrada `2026-10-30 (a)`; veredicto «Integrar, en pequeño»).**
- [x] **CI-RT-1 · §12.4c, coste real de enrutar (media): HECHO en v140** (30/10/2026; recuadro «Matiz (2026-10)» al final de §12.4c; ver `taller/Registro_manual_v139_a_v140.md`). Sin cifras de OpenRouter.
- [ ] **EM-RT-1 · Empreinte (alta):** la calculadora ya trata caché (`cost_engine.py` guarda `cache_read` y `cache_write`); faltan reintentos (coste ÷ tasa de éxito), espera y la métrica «coste por tarea completada», y un campo de proveedor servido. Sin decidir.

**CERRADO en v141 / PENDIENTE de Empreinte: «Inference Engineering» (2026-10-30, entrada `2026-10-30 (b)`; veredicto «Integrar, en pequeño»).**
- [x] **CI-IE-1 · §5.7d, recuadro breve (media-baja): HECHO en v141** (30/10/2026; ver `taller/Registro_manual_v140_a_v141.md`). definir juntos TTFT, ITL y TPOT (sin igualar ITL y TPOT); *goodput* según DistServe (arXiv 2401.09670: tasa máxima que cumple el objetivo de servicio, por GPU); *chunked prefill* según Sarathi-Serve (OSDI '24); cuantización de la caché KV según la documentación de vLLM (fp8, calibrar). PP/DP opcional. No citar las aceleraciones de los papers como generales. Primarios leídos solo con herramienta que resume: releer antes de citar cifras. Si se aplica: v141, copia de v140 en `archivo/`, CHANGELOG y `taller/Registro_manual_v140_a_v141.md`.
- [ ] **EM-IE-1 · Empreinte (baja-media):** campo opcional `ttft_ms` (n/d si falta) y porcentaje de interacciones que cumplen un objetivo de latencia declarado por el usuario, como análogo de *goodput*; se une a EM-RT-1. Sujeto a la regla P3. Sin decidir.

**CERRADO en v141: CUDA Graphs (2026-10-30, entrada `2026-10-30 (c)`; veredicto «Integrar, en pequeño»).**
- [x] **CI-CG-1 · §5.7d, párrafo overhead-bound (baja-media): HECHO en v141** (30/10/2026). una o dos frases con el nombre CUDA Graphs y su coste (grafos para tamaños capturados, relleno o vuelta a eager, memoria y arranque extra), más palabras clave del buscador. Fuente: diseño de CUDA Graphs de vLLM y tutorial de CUDA; sin cifras de aceleración y sin afirmar lo de las direcciones de memoria. Puede ir junto a CI-IE-1 en una sola v141. Primarios leídos solo con herramienta que resume.

**PENDIENTE primarios de «¿confiamos demasiado en ChatGPT?» (2026-10-25, entrada `2026-10-25 (c)`; veredicto «Observar», nada implementado).**
- [ ] **CI-ST-1 · sección de delegación cognitiva (baja-media):** Strömberg, Lei y Wu (CEPR DP 21577) como evidencia cuantitativa, con el matiz de que es observacional y de un condado. Leer el DP completo antes de citar cifras.
- [ ] **CI-XP-1 · sesgos de evaluación (baja):** Xu, Li y Jiang (arXiv:2509.00462) como caso concreto de autopreferencia en cribado automático. Antes: comprobar si el manual cubre la autopreferencia del juez LLM con otro nombre. No citar el rango 67-82 % sin acotarlo a los modelos y al análisis que lo dan.
- [ ] **CI-MC-1 · monocultivo algorítmico (baja):** Bommasani et al., «Picking on the same person: does algorithmic monoculture lead to outcome homogenization?» (NeurIPS 2022), localizado solo en la bibliografía del Human Creativity Benchmark; no leído. Verificar y, si encaja, citarlo en lugar del HCB para el argumento de monocultivo.
- [ ] **CI-PI-1 · inyección de prompt y defensas por diseño (baja-media):** leer completos CaMeL (arXiv 2503.18813; 77 % de las tareas de AgentDojo con seguridad demostrable frente a 84 % sin defensa) y «Design Patterns for Securing LLM Agents against Prompt Injections» (2506.08837); comprobar cuántos patrones son y si dicen que un agente generalista no se puede asegurar (afirmación del post, no verificada). Antes: ver qué cubre hoy el manual sobre inyección de prompt. El estudio de las «doce defensas» es Nasr, Carlini y otros (2510.09023). Añadir como ejemplo pequeño (con salvedades, ver entrada (i)): Qiao et al., UCLA, arXiv 2610.12524.
- [ ] **CI-MS-1 · gobernanza de agentes, fuente primaria de Microsoft (baja-media):** Abdo, «Agents are your newest insiders» (Microsoft Security Blog, 19/10/2026): identidad por agente, permisos acotados por tarea, riesgo continuo y respuesta graduada, con el principio de controles deterministas fuera del modelo. Citar solo como posición del fabricante: el texto no da estado de disponibilidad ni fechas de lo que presenta («introducing»). Antes: comprobar qué cubre hoy el manual sobre identidad y permisos de agentes.
- [ ] **CI-CR-1 · §14.2b, contraste con la matriz de decisión de MIT CISR (media-alta):** Sebastian, Weill, Haskamp y vom Brocke, «Designing Decision Rights for AI» (MIT CISR Research Briefing XXVI-6, 18/06/2026; 30 entrevistas con 27 directivos de nueve empresas). Añadir en §14.2b una nota de convergencia con fuente primaria y, como complemento y no como sustituto, la dimensión de ambigüedad y la descomposición Frame/Act/Learn (ver entrada (l)). Comprobar primero, desde memoria y sin verificar, que Weill y Ross, «IT Governance» (2004), sea la referencia clásica de «decision rights» en gobierno de TI: la cabecera de §14.2b dice que el concepto «no tiene literatura de referencia». Leer el PDF original si es accesible (solo se leyó el texto de la página del CISR).
- [ ] **CI-DR-1 · significación externa en las redes (baja-media):** Dreyfus (2007), «Why Heideggerian AI failed and how fixing it would require making it more Heideggerian», *Artificial Intelligence* 171, pp. 1137-1160, sección 8 (p. 1150): en las redes neuronales «la significación se añade desde fuera, ya que la red no busca nada». Citable con página como antecedente de la tesis del RLHF como significación externa (Tres Domesticaciones), con el matiz de que habla de redes en general, no de RLHF. Antes: comprobar si el corpus ya cita a Dreyfus (carpeta no conectada); en el manual hay 0 menciones de Dreyfus, Heidegger o Merleau-Ponty (comprobado en los .md y el HTML). Posible uso en el manual: historia de la IA (problema del marco, micro-mundos).

**PENDIENTE caché KV entrenable (2026-10-25, entrada `2026-10-25 (b)`; veredicto «Observar», nada implementado).**
- [ ] **CI-LC-1 · §5.7d, nota breve (baja):** la caché KV como objeto que se puede entrenar por documento (Latent Compaction, arXiv:2610.20582): idea de 2 etapas y reutilización para muchas preguntas, con tres salvedades: coste de ajuste por documento no reportado, resultados en presupuestos lógicos (no memoria ni latencia medidas), y degradación con contexto y compresión. Antes de citar cifras: leer el PDF original (el 96,7 % a 32× no está atado a modelo ni longitud en el texto) y no citar CoPE ni Continuum Attention. Es cambio de versión.
- [ ] **CI-CA-1 · RAG, CAG y GraphRAG (baja):** el manual cubre GraphRAG (73 líneas del HTML con la palabra) pero no menciona CAG (Cache-Augmented Generation) ni «Cache-Augmented». Si se añade una nota comparativa, hacerlo desde la fuente original de CAG (no localizada ni leída) y con cifras de coste y calidad, no desde la regla de decisión del post (entrada (j)). Relacionado con CI-LC-1 (caché KV por documento).

**PENDIENTE medición de la Data en decisiones (2026-10-25, entrada `2026-10-25 (a)`; veredicto «Observar», nada implementado).**
- [ ] **CI-DV-1 · §14.2b, nota breve (baja-media):** medir la contribución de la Data a las decisiones (plazo de reacción, arbitrajes aplazados,
  tiempo de conciliación) en lugar de la disponibilidad de la plataforma; con la salvaguarda de comparar a perímetro comparable y descontar otros
  cambios. Marcar el ejemplo de 6 a 3 semanas como ficticio; no citar cifras. Antes: comprobar que §14.2b no lo recoja ya. Es cambio de versión.

**PENDIENTE BitNet (2026-10-12, entrada `2026-10-12 (a)`; veredicto «Observar», nada implementado).**
- [ ] **CI-BN-1 · §5.7c, nota breve** tras la fila QAT / la tabla que acaba en Q2_K: BitNet b1.58 = entrenar ya en
  ternario (-1, 0, +1), no cuantizar después; modelo real = 2B4T (2,4B, 4 billones de tokens, contexto 4.096).
  Decidir antes: ¿nota o subsección? ¿insignia `caducidad-alta`? Es cambio de versión (v116 → v117): copia a
  `archivo/`, CHANGELOG, `taller/Registro_manual_*`.
- [ ] **CI-BN-2 · Ejemplo «demo sintética vs. modelo entrenado»:** el «100B a 5-7 tok/s» del README es una prueba de
  rendimiento con pesos ficticios; no hay BitNet de 100B entrenado. Candidato a ejemplo en el capítulo de verificación
  de afirmaciones (junto a la infografía viral ya citada en index.html).
- [ ] **CI-BN-3 · Antes de citar cifras:** leer el paper de bitnet.cpp (2,37-6,17x x86, 1,37-5,07x ARM, 82 % energía) y
  el informe técnico de 2B4T. Las cifras del post NO están verificadas; «memoria 16-32x menor» es incorrecto
  (1,58 bits vs FP16 ≈ 10x).
- [x] **CI-DM-1 · HECHO en v122 (16/10/2026; §13.2 y §13.7; ver `taller/Registro_manual_v121_a_v122.md`). Texto original del pendiente: Dos casos fechados (entrada `2026-10-12 (c)`, baja):** (i) Anthropic, 03/06/2026: precisión offline de ~95 % a ~65 % en un mes
  por documentación sin actualizar (§13.7/§15, evaluación continua); (ii) OpenAI, 29/01/2026: evals con SQL «dorada»,
  comparando SQL y datos (§13.2/Text-to-SQL). Ambos verificados en primario; citar «skills», no «documentación», para
  Anthropic. No citar Spider 2.0/BIRD ni las cifras del artículo (sin verificar). Cambio de versión.
- [x] **CI-IT-1 · HECHO en v122 (16/10/2026; nueva §9.7b; ver `taller/Registro_manual_v121_a_v122.md`). Texto original del pendiente: Subsección «cómputo en inferencia: generar y elegir» (entrada `2026-10-12 (d)`, media):** marco paralelo vs. secuencial;
  voto mayoritario (reduce varianza, no sesgo), best-of-N (sobreoptimización frente al modelo de recompensa), autorrefinamiento
  (neto negativo sin crítica externa), árbol de pensamiento/beam/MCTS (coste y por qué DeepSeek lo dejó); regla «verificador
  primero». Encaja con §13.12 y con los §5.x de pensamiento extendido. ANTES: leer los primarios (Snell, Gao, Huang, Sprague,
  Yao, DeepSeek-R1, escalado inverso de Anthropic); solo está verificado arXiv:2511.00751. Cambio de versión.
- [x] **CI-FO-1 · HECHO en v122 (16/10/2026; §8.8b y §10.4b; «aristas falsas» ya estaba; ver `taller/Registro_manual_v121_a_v122.md`). Texto original del pendiente: Bucles y grafos de agentes: tres comprobaciones en §8.8b y §10.4b (entrada `2026-10-12 (e)`, baja):** (1) test de «aristas falsas»
  (¿separa §8.8b secuencia de dependencia real?); (2) verificador con contexto fresco, distinto del agente que hizo el trabajo (0 apariciones);
  (3) tasa de aprovechamiento (salidas conservadas / generadas, 0 apariciones). Comprobar primero; si ya están, cerrar sin cambio de versión.
- [x] **CI-MC-1 · HECHO en v122 (16/10/2026; §14.2b; ver `taller/Registro_manual_v121_a_v122.md`). Texto original del pendiente: Metacognición y asistencia por IA: matiz en el bloque de sesgo de automatización (entrada `2026-10-12 (f)`, baja-media):** el manual tiene 0
  menciones de Dunning-Kruger o metacognición y unas 10 de sesgo de automatización. Candidato: una frase de matiz citando arXiv:2609.31095 como
  estudio EXPLORATORIO (sin preregistro ni asignación aleatoria): con IA se puntúa más y la confianza sube (0,66→0,78), pero la estimación de la
  propia nota deja de seguir a la nota real (r .07 frente a .40) y la discriminación entre respuestas correctas e incorrectas baja entre tareas, no
  dentro de cada una (no establecido). NO citar las cifras del resumen divulgativo (63,1 %, «igualó a la IA»). Esperar réplica o revisión por pares si se quiere citar como establecido.
- [x] **CI-HL-1 · HECHO en v119 (14/10/2026, §10.9.4, una línea sin cifras y con salvedades; `taller/Registro_manual_v118_a_v119.md`). Texto original del pendiente: Segundo caso para el «Matiz (2026-09)» de §10.9.4 (entrada `2026-10-14 (a)`, baja):** una línea tras Procedural Graphs
  (arXiv:2609.09153): Zhang et al., arXiv:2609.35738 (JHU/CMU, preprint 28/09/2026) reescriben el código del harness con un proponente de 4B
  entrenado con RL, y solo sobrevive la edición que gana en datos reservados (tres conjuntos disjuntos: feedback, puntuación, final). Citar con
  sus salvedades: 0,32 → 0,62 es la media de propuestas sueltas en 21 familias no vistas (no «calidad de edición» ni mejor de ocho), contra 0,56 del
  profesor de 35B (que gana en el mejor de ocho: 0,85 frente a 0,83); protocolos de «5 secuenciales frente a mejor de 8» sin cómputo igualado; sin
  coste reportado; modelos de 4B-8B en Reasoning Gym y QA multi-salto. Pariente de §8.5 (DSPy). Antes de citar: leer el PDF completo (las tablas
  y páginas de la entrada salen de una extracción, no de lectura directa). Sin cambio de versión si es solo esa línea.
- [ ] **HR-HL-1 · (HyperRAG, media; detalle en `HyperRAG/docs/HR4_conjunto_dificil.md`, «Lo que queda sin hacer»):** conjunto Q4 intacto de confirmación
- [ ] **HR-CA-1 · amortización de cachear frente a recuperar (baja-media):** medir en HyperRAG el punto en que precargar el documento (CAG, o caché KV) compensa frente a recuperar: preguntas por documento, tamaño del corpus, coste y latencia, y recuperación de detalles raros. Es la pregunta que el post (entrada (j)) plantea sin medir y que CI-LC-1 señala como lo que habría que medir. Sin diseño ni piloto todavía.
  antes de decidir sobre chunking o el peso de BM25 en la fusión, y confirmación de HR-4 con los 56 hechos numéricos de C3 aún sin usar.
- [x] **CI-AV-1 · Medir también tiene que ser reproducible (entrada `2026-10-16 (a)`, baja): HECHO en v121 (16/10/2026; recuadro «Matiz (2026-10)» al final de §4.3; ver `taller/Registro_manual_v120_a_v121.md`).** §4.3 trataba la reproducibilidad de la salida, no la de la medición (repetir, reformular, comparar entre sistemas, validar el instrumento de extracción). La comprobación en Empreinte ya se hizo (16/10/2026) y quedó recogida como ítem EM-AV-1 en ese proyecto (a la espera de datos de uso libre); nada pendiente en el manual.
- [ ] **CI-HK-1 · Ganchos del ciclo de vida del agente, recuadro breve en el cap. 10 o 13 (entrada `2026-10-15 (a)`, baja; «Observar»):** control determinista del ciclo de vida frente a herramientas que elige el agente, con la salvedad de que el gancho de Copilot Studio falla abierto (primario: Microsoft Learn, 29/09/2026, preview). Esperar a que salga de preview o a una segunda fuente; si se escribe, citar la fecha y no generalizar a otras plataformas sin comprobarlas. Antes de tocar: buscar «hook» en el manual (solo 5 menciones, ninguna de esto).
- [x] **CI-WM-1 · La inyección que se copia (entrada `2026-10-14 (c)`, baja-media): HECHO en v120 (15/10/2026; fila en §21.5.1 y recuadro «Matiz (2026-10)»; ver `taller/Registro_manual_v119_a_v120.md`). Texto original del pendiente:** §21.4-§21.5 ya cubren la inyección indirecta, la tríada letal, EchoLeak y la memoria persistente (§10.9.3), pero no la **autorreplicación**: la salida de un agente es la entrada del siguiente. Propuesta: una fila en la tabla de canales de salida del §21.5.1 («lo que un agente escribe y otro leerá») o un Caso 5 breve tras EchoLeak. Contenido verificado en primario el 15/10/2026: OpenAI, «Self-replicating prompt injections exist» (descubierto el 27/06, divulgado el 25/09/2026): hallazgo de laboratorio con puntos de control internos de investigación (GPT-5.4-mini y GPT-5.5), **sin incidente ni tasas publicadas**; tres canales (respuesta de correo, escritura de archivo, mensaje de Slack en varias lecturas). Antecedente: «Morris II» (arXiv 2403.02817, 2024), gusano de IA de laboratorio contra asistentes de correo. Lección de diseño que ya está en §21.5: quitar una de las tres patas y confirmación humana en lo que escribe hacia fuera. **No citar** los «2.076 CVE de la pila IA»: son CVE «relacionados con IA» acumulados de enero de 2025 a agosto de 2026 (GTIG), con ~50 % en middleware de orquestación y solo unos pocos explotados. SalesBleed (Zenity, 24/09/2026) ya está corregido (18/08). Antes de citar: leer el HTML crudo del informe de OpenAI (esta entrada lo leyó mediante resumidor de página). Cambio de versión (v119 → v120).
- [x] **CI-MCP-1 · HECHO en v119 (14/10/2026, §10.10.1b, `taller/Registro_manual_v118_a_v119.md`). Texto original del pendiente: una petición MCP de punta a punta (entrada `2026-10-14 (b)`, media; decisión del autor: SÍ, «lo más completo posible»):** §10.10 y §21.6 ya cubrían el qué y los ataques, pero no había un recorrido con quién decide en cada paso ni una nota de revisión del protocolo. Hecho: subsección de texto, simulador de cuatro pestañas y recuadro de revisión 2026-07-28.
- [x] **CI-BP-1 · HECHO en v117 (12/10/2026, §0.1.3, `taller/Registro_manual_v116_a_v117.md`). Texto original del pendiente: Retropropagación: ejemplo numérico interactivo como referencia visual (entrada `2026-10-12 (g)`, baja; decisión del autor: SÍ incluirlo):** hoy el manual
  solo nombra backpropagation de pasada (la caja «Entrenamiento» del widget de neurona, ~línea 2588 de `index.html`, y una frase en el capítulo 5); «regla de la cadena» 0 apariciones.
  Base: `How_Backpropagation_Works.html` (autocontenido, ~10 KB, sin CDN). ANTES de portarlo: (1) corregir erratas (`L/∂w₁` sin ∂ ×2, `∂L/ŷ` → `∂L/∂ŷ`, `∂/∂h₁` → `∂ŷ/∂h₁`);
  (2) `drawConnections()` está vacío: no hay aristas ni pesos dibujados y «blue path» no apunta a nada; (3) con el deslizador el paso 4 queda incoherente (texto fijo 0,7/2,1/−0,49 y caja
  «Success!»; con η = 0,5 sale ŷ = −5, L = 12,5, «reducción» −2400 % en verde) → recalcular todo desde η o limitar el rango, y aprovechar el caso para mostrar que un paso grande
  puede empeorar la pérdida; (4) tabla con `toFixed(1)` pierde precisión; (5) traducir (lang="es" con texto inglés). Convención del manual: widget como `<iframe srcdoc>` (hay 14);
  es cambio de versión (v116 → v117: copia a `archivo/`, CHANGELOG, `taller/Registro_manual_*`). Atribución: resuelta el 12/10/2026, el autor prefirió cifras propias (ya no se cita a Tech with Mak en el manual); antes: ejemplo de la infografía de Tech with Mak; citar como «adaptado de»
  o rehacer con cifras propias. Cifras verificadas por recálculo (L 0,5 → 0,12005; gradientes 3, −1, 1, 2).
- [ ] **Higiene (no es de BitNet):** `git status` marca ~10+ `archivo/Comprender_la_IA_2026_v*.html` como modificados sin
  intención conocida (¿saltos de línea?). Investigar antes del próximo commit amplio.

**Hecho (2026-08-20, segunda tanda del día).** Dos fuentes del mismo
publisher (Akshay Pachaar / DailyDoseOfDS.com) → manual §3.4/§3.4b, §5.5c,
Cap. 1 (Multi-LoRA serving), §8.8 (Semantic caching), §12.4c (Model
routing y cascading), ahora en **v70**. La primera ("How LLM Inference
Works" + infografía "7 LLM Generation Parameters") aportó la distinción
frequency/presence penalty y max_tokens/stop sequences, más una nota de
frontera sobre DeepSeek-V4 verificada contra el paper original
(arXiv:2606.19348). La segunda ("72 Techniques to Optimize LLMs in
Production") se cruzó término a término contra el manual completo: de 72,
18 ya cubiertas en profundidad, 10 de forma superficial, 44 ausentes — de
esas 44, solo 3 (semantic caching, multi-LoRA serving, model
routing/cascading) caían dentro del alcance ya declarado del manual y se
incorporaron; las 41 restantes son ingeniería interna de motores de
inferencia (paralelismo, kernels, scheduling de GPU) fuera de alcance por
diseño, no un descuido — detalle completo en el Log, entrada 2026-08-20
("72 Techniques"). Registro: `Registro_manual_v69_a_v70.md`.

**Hecho (2026-08-20).** "Claude's Watermark Isn't Live. Your Provenance
Debt Is." (post técnico sin firma, 19 ago. 2026) → manual §1.8/§4.7 +
corrección de Cap. 21/Cap. 4, ahora en **v69**. Tres afirmaciones de mayor
carga verificadas contra fuente primaria antes de incorporar (alcance del
marcado de Claude contra `anthropic.com/news/claude-text-watermark`,
sanción del Art. 50 contra fuentes legales independientes, radioactividad
del watermark contra el abstract de arXiv:2402.14904) — las tres exactas.
La verificación de la sanción destapó un error real preexistente en el
manual (Cap. 21 citaba el tope de GDPR, 20M€/4%, para una obligación del
AI Act que corresponde a 15M€/3%), corregido en la misma tanda. Registro
completo, con la incidencia de proceso (edición sin snapshot previo,
reparada reconstruyendo el v68 original) y su verificación:
`Registro_manual_v68_a_v69.md`, este mismo directorio.

Nada de lo que sigue está implementado salvo lo marcado como hecho. Ningún
candidato tiene prioridad fijada entre sí — el orden es el de aparición en
el log, no de importancia.

**Decisiones pendientes — solo quedan las de Empreinte/HyperRAG:**

1. **Empreinte** — desglose de latencia/tokens por fase
   (`embedding_latency_ms`/`retrieval_latency_ms`/`generation_latency_ms`)
   en `audit_sensor.py::record()`, hoy un único `latency_ms` agregado por
   turno. Fuente: Griciunas/tracing. Condicionado a verificar si
   `rag_engine.py` ya mide los tiempos por fase internamente.
2. **HyperRAG** — timing por capa (`bm25`/`vector`/`wiki`/`graph`/`tree`/
   `reranker`) en `search`/`query`, hoy ausente. Misma fuente. Anclado
   también en `docs/ARRANQUE.md` §8 y `docs/RETOMAR.md` §7 de HyperRAG,
   marcado ahí como "sin medir, sin decidir, no tocar sin discutirlo antes".
3. **Empreinte** — `retrieved_chunks: []` en vez de (o además de)
   `chunks_used` (conteo) en `audit_sensor.py`, para habilitar
   faithfulness/context precision sobre tráfico real. Fuente: Chunking
   Strategies for RAG / recomendación ya existente del propio manual
   (línea ~17002).
4. **HyperRAG** — verificación menor: confirmar si la separación
   `context_prefix`/`text` de `ContextualLLMStrategy` sobrevive hasta
   `cmd_query` y las citas generadas, o se remezcla sin etiqueta en algún
   punto posterior. No urgente, no es una brecha confirmada — es una
   pregunta abierta.
5. **HyperRAG (proceso, no contenido)** — la regla "Claude no ejecuta
   git" (`docs/ARRANQUE.md` §2.6) es tinta, no cemento. Convertirla en
   restricción de sistema (usuario aislado o token con alcance limitado)
   es una decisión del propietario del laboratorio — anotado aquí, no
   anclado en los documentos de HyperRAG, porque es higiene operativa, no
   una proposición de investigación.
6. **HyperRAG** — `hyperrag/core/llm_client.py:206-218`: `_send_audit_log()`
   registra `model=self.cfg.model` (el alias configurado), nunca
   `response.model` (lo que LiteLLM/el proveedor confirmó que sirvió
   realmente). Se propaga a Empreinte: `model_used` en `audit_sensor.py`
   (líneas 320/455) hereda ese mismo alias sin corregirlo en ningún punto
   intermedio. Fix pequeño, no toca el esquema — encontrado 2026-08-20
   investigando el candidato nº7, independiente del ángulo de
   watermarking que lo motivó. Ver Log, entrada 2026-08-20.
7. **HyperRAG** — `memo_finetune/memo_generate_reflections.py` genera
   pares QA sintéticos con dos modelos (`self.model` pesado,
   `self.fast_model` ligero, líneas 328-329) y los escribe a JSONL en
   `step1_extract`/`step3_verify`/`step4_entities` sin `source_model` ni
   `generated_at` por fila — 0% del corpus es hoy auditable por modelo
   antes de alimentar el fine-tuning real en Ollama (`memo_register.py`).
   Es el punto de aplicación literal del patrón "registra qué modelo
   generó cada fila" de la fuente watermark/Provenance Debt (ver Log,
   entrada 2026-08-20). Empreinte no tiene pipeline de fine-tuning — no
   hay dónde aplicar esto ahí.

**Descartado sin implementar:** BCMT (candidato nº12 de la priorización) —
evidencia insuficiente (escala de juguete, pérdida de calidad en casi
todas las pruebas propias, sin comparación a competidores reales, admitido
por el propio autor). Sigue como candidato a Apéndice D si en el futuro se
publica una versión a mayor escala con comparación real.

**Hecho:**

- Rundell/*The Guardian* → manual §20.3b, **v67**. Registro:
  `Registro_manual_v66_a_v67.md`. Nota-puente:
  `10_epigenetica/Rundell_y_las_tres_domesticaciones_nota_puente.md`.
- **Los 11 candidatos de manual restantes, aplicados juntos → manual
  §5.0/§5.7f/§6.10b/§6.11.4-5/§6.5a(ampliación)/§8.7b(refuerzo)/
  §10.10.3/§12.6(cita)/§13.15.1-2, ahora en v68** (2026-08-19, por orden
  de prioridad acordado con el usuario): leyes de escalado (Kaplan/
  Chinchilla), refuerzo empírico de §8.7b (Chakrabarti 2026), procedencia
  en la capa de ingesta (Die Zeit/NSDAP), contrato fail-to-pass (Tracely),
  taxonomía de memoria de agente (Kimi Agent Swarm, con cautela de
  atribución), caso de estudio de embeddings estáticos (Lattice), "tinta
  vs. cemento" para agentes de código (maibot), ampliación de la cita de
  Empty Shelves or Lost Keys, prerrequisito animado de tensores (idea del
  usuario), matiz de especulativa bajo carga concurrente, y cita opcional
  del Keystone Project en §12.6. Registro completo, con verificación de
  balance de etiquetas y confirmación de que el v67 archivado quedó
  idéntico al original: `Registro_manual_v67_a_v68.md`, este mismo
  directorio.

**Fuentes descartadas sin acción** (ver Log para el razonamiento
completo): las dos infografías de LinkedIn genéricas, el post de chunking
de Medium (salvo el hallazgo lateral #3 de arriba), y el "Complete Agentic
AI Cheatsheet" (no se anotó por instrucción explícita — ver conversación,
no queda entrada en este log).

---

## Metodología de triaje

Por cada fuente, cinco ejes:

1. **Credibilidad de la fuente** — autor/institución, ¿peer-review, preprint,
   o post de blog/vendor?, fecha, conflicto de interés (¿evalúa su propio
   producto?).
2. **Validez metodológica** — si aporta datos: tamaño de muestra,
   reproducibilidad, qué mide realmente frente a qué dice medir.
3. **Novedad real** — ¿ya cubierto en el manual (23 capítulos + apéndices) o
   en Empreinte/HyperRAG? ¿Contradice algo ya escrito? ¿Lo matiza?
4. **Caducidad** — contenido volátil (benchmarks, pricing, SOTA de modelo)
   va a Apéndice D si entra; no al cuerpo estable.
5. **Veredicto y destino**:
   - **Incorporar** — con sección/capítulo o módulo de destino concreto.
   - **Matizar/contrastar** — se cita para contrastar algo ya existente, sin
     reescribirlo.
   - **Observar** — interesante pero sin evidencia suficiente todavía; se
     anota y se espera corroboración.
   - **Descartar** — con motivo (fuente no fiable, ya cubierto, irrelevante,
     metodología inválida).

Etiquetas de destino: `[Manual §N]` · `[Empreinte: módulo]` ·
`[HyperRAG: componente]` · `[Apéndice D]` · `[Ninguno]`.

---

## Notas de verificación interna

*(no son triaje de fuente externa — son comprobaciones de coherencia
manual↔código disparadas durante el triaje, que vale la pena dejar
ancladas para no repetirlas)*

### 2026-08-19 — Silence rate: manual §13.9/§14.2b vs código

Disparada por la comprobación de la infografía "RAG Pipeline vs Good RAG
Pipeline" (ver Log más abajo), que trataba la abstención como buena
práctica de prompt. Se verificó si el concepto propio del manual (*silence
rate*, §13.9, elevado a regla arquitectónica en §14.2b) tiene
implementación real o es solo prosa.

**Resultado: implementado y en uso en ambos proyectos, no es solo teoría.**

- **HyperRAG (motor).** Vive en la capa de memoria episódica —
  [`hyperrag/memory_ops.py`](C:\Perso\Projects\HyperRAG\hyperrag\memory_ops.py),
  [`hyperrag/memory/write_policy.py`](C:\Perso\Projects\HyperRAG\hyperrag\memory\write_policy.py),
  [`hyperrag/memory/manager.py`](C:\Perso\Projects\HyperRAG\hyperrag\memory\manager.py),
  [`hyperrag/memory/store.py`](C:\Perso\Projects\HyperRAG\hyperrag\memory\store.py) —
  con test dedicado en `hyperrag/tests/test_memory_manager.py`. El README
  lo documenta bajo "memoria de la duda".
- **Empreinte (consumidor).**
  [`rag_engine.py:598`](C:\Perso\Projects\Empreinte\rag_engine.py:598)
  expone `get_silence_rate()` →
  `{"high_stakes_total", "silent", "silence_rate"}`: de las sesiones de
  alto riesgo cerradas, qué fracción nunca articuló qué se dudaba
  (`contested_assumption IS NULL`). Distingue `NULL` (nunca preguntado) de
  `""` (preguntado, sin duda real) — solo `NULL` cuenta como silencio.
  `high_stakes=False` no activa nada (no invasivo por defecto). Se muestra
  en la pestaña RAG Avanzado
  ([`pages/9_RAG_Avanzado.py:586-594`](C:\Perso\Projects\Empreinte\pages\9_RAG_Avanzado.py:586))
  como "Tasa de silencio", con alerta visual si `silence_rate > 0.5`.

**Conclusión.** Manual y código están alineados; no hay brecha que
corregir. Se ancla aquí para no re-auditar el mismo triángulo
(manual↔HyperRAG↔Empreinte) si una fuente externa futura toca abstención o
silence rate — la pregunta relevante en ese caso ya no es "¿existe?" sino
"¿esta fuente aporta algo que mejore la implementación ya descrita arriba?".

---

## Log

### 2026-08-20 — "72 Techniques to Optimize LLMs in Production" (infografía, DailyDoseOfDS.com)

**Fuente.** Infografía del mismo publisher que la entrada anterior
(Akshay Pachaar / DailyDoseOfDS.com). Género distinto: no es un artículo
con argumento, es un cuadro de mando — 72 nombres de técnica con una frase
descriptiva cada uno, agrupadas en 9 categorías (compresión de modelo,
atención/arquitectura, decodificación, caché KV, batching/scheduling,
paralelismo/kernels, caching de aplicación, forma de entrada/salida,
enrutado/coste). Sin datos, sin cita, sin comparación, sin "cuándo sí /
cuándo no" — no hay ninguna afirmación cuantitativa que verificar, a
diferencia de la entrada anterior del mismo autor.

**Método.** Comprobación de cobertura término a término contra el manual
completo (grep + sinónimo en español, verificación de profundidad con
contexto). Resultado: **18 cubiertas en profundidad** (INT8/INT4,
GGUF, destilación, FlashAttention, PagedAttention, MQA/GQA/MLA, sliding
window, MoE, decodificación especulativa, attention sinks, prompt
caching, structured output, RAG, fine-tuning, function calling), **10
cubiertas de forma superficial** (normalmente porque el manual usa otro
nombre para el mismo mecanismo — "moderación en cascada" en vez de
*model cascading*, "caché de prompts" en vez de *prefix caching*), **44
ausentes** sin resultado ni con sinónimo.

**El patrón que importa, no el número.** Casi todas las 44 ausencias caen
en dos categorías muy concretas: paralelismo de bajo nivel (tensor/
pipeline/expert/sequence parallelism, CUDA graphs, kernel fusion, torch
compile) y scheduling de infraestructura de serving (chunked prefill,
autoscaling, spot GPU, SLO-aware scheduling, request deduplication,
prefill-decode disaggregation). No es descuido — es exactamente el
territorio que el manual excluye por diseño, el mismo criterio que ya
aplicó este taller al descartar la tabla "vLLM vs. SGLang vs.
TensorRT-LLM" de una fuente anterior (entrada "Master LLM Inference",
2026-08-19): es la ingeniería interna de quien *construye* un motor de
inferencia, no de quien lo *usa* vía API u Ollama, que es la audiencia
declarada del manual.

**Lo que sí encajaba.** Tres candidatos, dentro del alcance ya declarado
(coste, arquitectura híbrida, RAG en producción): Model Routing/Model
Cascading por coste (#66-68), Semantic Caching (#53), Multi-LoRA Serving
(#13). Los otros 41 ausentes se listan abajo, con el motivo de exclusión.

**Veredicto: incorporar 3, descartar 41 por alcance de diseño.**
`[Manual: §3 candidatos → §5.5c/Cap.1/§8.8/§12.4c, ahora v70 — ver
Registro_manual_v69_a_v70.md]`

**Los 41 descartados por alcance** (ninguno es un hueco, todos caen fuera
del público declarado del manual — arquitectos/gobernanza/QA sobre
sistemas que consumen LLMs vía API u Ollama, no sobre quien construye el
motor de inferencia): FP8 Quantization, SmoothQuant, QAT, Mixed Precision,
Structured Pruning, Unstructured Pruning, RadixAttention, Early Exit,
Medusa, EAGLE, Lookahead Decoding, Prompt Lookup Decoding, Multi-Token
Prediction, KV Offload to CPU, KV Offload to Disk, KV Cache Quantization,
KV Cache Compression, Chunked Prefill, Dynamic Batching,
Prefill-Decode Disaggregation, SLO-Aware Scheduling, Autoscaling, Spot GPU
Scheduling, Request Deduplication, Tensor Parallelism, Pipeline
Parallelism, Expert Parallelism, Sequence Parallelism, CUDA Graphs,
Kernel Fusion, Torch Compile, Exact-Match Caching, Embedding Deflection,
Response Caching, Context Pruning, System Prompt Optimization, Response
Length Cap, Few-Shot Pruning, Context Distillation, Multi-Provider
Failover, QoS Tiers.

### 2026-08-20 — "How LLM Inference Works" (Akshay Pachaar, DailyDoseOfDS.com) + infografía "7 LLM Generation Parameters"

**Fuente.** Docx completo de Akshay Pachaar (@akshay_pachaar,
cofundador de DailyDoseOfDS.com) sobre tokenización, embeddings,
atención, prefill/decode, KV cache y cuantización, con una infografía
adjunta del mismo publisher sobre los siete parámetros de generación
(max_tokens, temperature, top_p, top_k, frequency/presence penalty, stop
sequences). Categoría de credibilidad distinta a las infografías
genéricas sin firma de este log: autor identificable con trayectoria
editorial real, no un post de fórmula.

**Verificación.** El único dato con fecha del artículo —la arquitectura
de atención híbrida de DeepSeek-V4 (~10% de tamaño de caché KV, ~27% de
cómputo por token frente a V3.2, en contexto de 1M)— se verificó contra
el paper original (arXiv:2606.19348) y cobertura técnica independiente:
exacto, con una simplificación menor (el artículo describe dos variantes
de atención comprimida cuando el esquema real combina tres, incluida una
ventana deslizante que el artículo no menciona).

**Novedad frente al manual — mixta, con un hueco real.**
Tokenización (BPE): el manual la cubre más a fondo, con laboratorio
interactivo y una fe de erratas propia ya corregida. Prefill/decode,
TTFT/ITL: §5.7d ya lo cubre con el mismo contenido más un concepto propio
("el precio de la sorpresa") y un caso real de fallo en producción que el
artículo no tiene. KV cache/GQA/MLA: el manual da cifras concretas de
reducción que el artículo no da. Generación (temperature/top-k/top-p):
el manual (§3.2-3.6) cubre esto y además no-determinismo residual, que
el artículo no menciona — pero agrupaba frequency y presence penalty bajo
un "repetition penalty" genérico, sin la distinción correcta que sí trae
la infografía, y no tenía max_tokens/stop sequences como controles
explícitos. **Hueco real y verificado**: la arquitectura de DeepSeek-V4,
que el manual solo nombraba en una tabla de benchmarks sin explicar.

**Veredicto: incorporar el hueco de DeepSeek-V4 y la distinción de
parámetros de generación; descartar el resto por redundancia con
contenido ya más profundo.**
`[Manual: §3.4/§3.4b (frequency/presence penalty, max_tokens, stop
sequences) + §5.5c (nota de frontera DeepSeek-V4), ahora v70 — ver
Registro_manual_v69_a_v70.md]`

### 2026-08-20 — Aplicabilidad a Empreinte/HyperRAG del código propuesto en "Claude's Watermark Isn't Live. Your Provenance Debt Is."

**Contexto.** La misma fuente incorporada al manual en v69 (§1.8/§4.7,
ver `Registro_manual_v68_a_v69.md`) trae dos patrones de código: un
generador de datos sintéticos que registra `source_model` (tomado de
`resp.model`, no del alias pedido) y `generated_at` por fila, y un script
`corpus_exposure_audit.py` que audita un corpus JSONL agrupándolo por
modelo/estado de marcado/formato. Se investigó si algo de esto es
aprovechable en los dos proyectos de laboratorio del autor.

**Empreinte — no aplica.** Es puramente un observador de interacciones de
producción (`audit_sensor.py::record()`/`log_interaction()`,
`rag_engine.py`); no existe pipeline de generación de datos sintéticos ni
de fine-tuning en el repo (grep de "fine-tun|RAFT|distill|synthetic|
training_data" solo golpea documentación que *describe* estos conceptos,
no código que los genere). El script de auditoría de corpus no tiene
corpus al que aplicarse.

**HyperRAG — encaje literal en `memo_finetune/`.**
`memo_generate_reflections.py` genera pares QA sintéticos con dos modelos
Ollama (`self.model` pesado, `self.fast_model` ligero, líneas 328-329),
escritos a JSONL en tres pasos (`step1_extract`, `step3_verify`,
`step4_entities`, líneas 355-402) **sin registrar cuál de los dos modelos
generó cada fila, ni cuándo** — antes de que ese corpus alimente un
fine-tuning real en Ollama (`memo_register.py`). Es exactamente el
"corpus no auditable" que el script del post señalaría: 0% de filas con
procedencia de modelo. Aquí la motivación no es watermarking (son modelos
locales) sino la misma disciplina que el propio manual exige en §4.7:
sin ese campo, nadie puede decidir después qué fracción del corpus vino
de qué modelo.

**Hallazgo lateral, independiente del watermarking.**
`hyperrag/core/llm_client.py:206-218` recibe de LiteLLM un objeto
`response` con `.model` (lo que el proveedor confirmó que sirvió), pero
`_send_audit_log()` (línea 218) registra `model=self.cfg.model` — el
alias configurado, nunca `response.model`. Es el mismo patrón que el post
señala para Claude ("registra lo que pediste, no lo que sirvió"), aquí en
Ollama/LiteLLM. Se propaga a Empreinte: `model_used` en `audit_sensor.py`
(líneas 320/455) hereda ese mismo alias sin corrección intermedia.

**Veredicto: diagnóstico completo, sin implementar por decisión
explícita del usuario ("nada por ahora, solo quería el diagnóstico").**
`[Empreinte: Ninguno — no hay pipeline al que aplicar el patrón]`
`[HyperRAG: dos candidatos concretos anclados en Pendientes abiertos
arriba (ítems 6 y 7) — fix de `response.model` en `llm_client.py`, y
`source_model`/`generated_at` en `memo_generate_reflections.py`]`

### 2026-08-19 — "The Evolution of RAG Architecture" (infografía LinkedIn)

**Fuente.** Sivasankar Natarajan (shiva.bytes), post/infografía de LinkedIn.
Bio genérica de consultoría ("Driving Smarter Outcomes with AI, Cloud &
Data."), sin afiliación institucional ni credencial de investigación
declarada. Sin citas, sin benchmark, sin cifras — solo un diagrama de
pipeline y afirmaciones cualitativas. Cierra con pregunta de enganche para
comentarios, patrón típico de contenido de marca personal en LinkedIn.

**Contenido.** Compara un pipeline "Classic RAG" (chunking → embedding →
similarity search → top-K → prompt → LLM) contra uno "Advanced RAG" (+
metadata enrichment en indexado, retrieval híbrido denso+disperso,
reranking, relevance filtering, context fusion, y answer synthesis en
generación). Recomienda orden de adopción: metadata filtering → hybrid
retrieval → reranking → relevance filtering.

**Credibilidad.** Baja como fuente primaria — es una síntesis divulgativa de
patrones de arquitectura RAG que son estándar de facto desde ~2023-2024
(retrieval híbrido denso+disperso, reranking, metadata filtering). Ninguna
afirmación lleva evidencia: "hybrid retrieval is the single biggest
upgrade" es una superlativa sin medir.

**Validez metodológica.** N/A — no aporta datos, es un diagrama de
conceptos ya consolidados.

**Novedad frente al manual.** Ninguna. §6 (búsqueda vectorial avanzada) y
§7 (diagnóstico y optimización RAG) ya cubren estos componentes con más
profundidad y con datos propios medidos — p. ej. §6.5a (v66) sobre el techo
del oráculo, que diagnostica un tercer tipo de fallo que este post ni
menciona. El post se queda en "qué componentes existen"; el manual ya está
en "cómo diagnosticar cuál está fallando y con qué evidencia".

**Comprobación en HyperRAG.** [hyperrag-engine/scripts/hyperrag_cli.py:39]
ya implementa seis capas configurables (`bm25, vector, wiki, graph, tree,
reranker`): el retrieval híbrido denso+disperso y el reranking que el post
presenta como "advanced" ya están en producción, con dos capas adicionales
(graph, tree) que el post ni contempla. El pipeline "avanzado" del post es,
en la práctica, más simple que lo ya implementado en este proyecto.

**Veredicto: Descartar.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]` — contenido introductorio, sin evidencia propia, por
debajo del estado actual tanto del manual como de HyperRAG. Se registra
para no reevaluar la misma fuente si reaparece.

### 2026-08-19 — "RAG Pipeline vs Good RAG Pipeline" (infografía sin atribuir)

**Fuente.** Infografía + texto de LinkedIn sin autoría visible en el propio
contenido (a diferencia de la entrada anterior). Mismo género que la fuente
del 2026-08-19 previa: comparación "básico vs bueno", sin cita, sin dato,
sin benchmark, cierre en máxima genérica ("Better RAG isn't about
retrieving MORE context. It's about retrieving the RIGHT context.").

**Contenido.** Añade respecto al post anterior: query understanding/query
rewriting, grounding & citas, abstención ("comfortable saying I don't have
enough information"), y evaluación con Recall@K, MRR, faithfulness,
relevance, citation accuracy.

**Credibilidad.** Baja, misma categoría que la entrada anterior — contenido
de fórmula ("basic vs good pipeline") que circula de forma casi idéntica
entre varias cuentas de LinkedIn. La ausencia de autoría aquí es en sí
misma una señal: no hay a quién atribuir la afirmación ni pedir cuentas por
ella.

**Validez metodológica.** N/A — sin datos propios.

**Novedad frente al manual — comprobación específica.** Los elementos que
sí eran nuevos respecto al post anterior ya están cubiertos, con más
profundidad y matices que el propio post:
- **Query rewriting/expansion** → Cap. 7: tabla comparativa de
  multi-query retrieval, HyDE y query expansion clásica, con recuadro de
  cuándo *no* ayuda y puede perjudicar (el post no menciona el caso
  negativo). También en glosario (`Expansión de consulta`, `HyDE`,
  `Multi-query retrieval`, `Step-back prompting`).
- **Grounding & citas** → cubierto como Faithfulness (RAGAS, Cap. 13.1),
  con laboratorio dedicado (falso grounding con Faithfulness alta por
  corpus obsoleto — un caso que el post no contempla).
- **Abstención** → §13.9 *Silence rate*, con benchmark orientativo e
  implementación mínima, y elevado a regla de arquitectura en §14.2b
  (regla del rechazo cero): "un sistema que nunca puede decir 'no sé' no
  está decidiendo". El post lo trata como buena práctica de prompt; el
  manual lo trata como métrica de gobernanza monitorizable y como
  propiedad arquitectónica.
- **Evaluación (Recall@K, MRR, faithfulness, etc.)** → Cap. 6.5/13, con la
  extensión propia del techo del oráculo (§6.5a, v66) que ninguno de los
  dos posts menciona.

**Comprobación en HyperRAG.** [hyperrag_cli.py:19-22,165-170] confirma un
`QueryTransformer` con flags `query_rewrite`, `query_multi`,
`query_decompose` — multi-query y descomposición de consulta ya
implementados y configurables (decompose ni aparece en el post). El comando
`query` ya ejecuta "retrieve, fuse, rerank, compress, and generate a cited
answer" — grounding con citas ya en producción, no es un "debería tener".

**Veredicto: Descartar.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]` — segunda pieza consecutiva del mismo género
("pipeline básico vs bueno"), sin autoría verificable, y cuyo contenido
completo ya está superado por el estado actual del manual y de HyperRAG.
**Nota de patrón:** si sigue llegando contenido de este género (infografías
"basic vs advanced RAG" sin cita ni dato), se puede descartar por
comparación directa con esta entrada sin repetir la comprobación completa
en HyperRAG, salvo que introduzca un concepto no listado aquí.

### 2026-08-19 — "AI System Observability: Tracing" (Aurimas Griciunas / SwirlAI)

**Fuente.** Aurimas Griciunas, autor de la newsletter SwirlAI
(newsletter.swirlai.com), practicante identificable con trayectoria pública
en LLMOps/MLOps — no un post de marca genérica. Categoría de credibilidad
distinta a las dos entradas anteriores: sin peer-review, pero con autoría
real y consistencia editorial verificable.

**Contenido.** Define orquestador/trace/span en un sistema RAG ingenuo
(vocabulario estándar derivado de OpenTelemetry, el mismo que usan
Langfuse/LangSmith/Arize). Traza un ejemplo paso a paso: query → embedding
(con conteo de tokens) → ANN lookup (con metadata de relevancia) → prompt →
LLM (con tokens in/out). Argumenta que la traza importa porque (1) los
fallos pueden ocurrir en cualquier paso de la cadena, (2) el coste varía
por paso y hay que preverlo, (3) los sistemas no deterministas se degradan
y hay que evaluar a nivel de span, no solo de input/output global.

**Credibilidad y validez.** Contenido técnicamente correcto y estándar de
la industria (terminología OTel aplicada a GenAI, tal como la usan las
herramientas de observabilidad de LLM ya listadas en el propio manual —
LangSmith, Helicone, Prompt flow). No aporta datos propios, es un explainer
conceptual, pero de un autor competente y sin errores detectables.

**Novedad frente al manual — hallazgo relevante.** El manual no solo cubre
esto, lo **supera y lo re-encuadra**: §12.6 (★ propuesta del autor)
distingue explícitamente **telemetría** (justo lo que describe este post:
traces, tokens, latencia, tool calls) de **observabilidad real**
(reconstrucción de *por qué* el sistema eligió ese camino), y lo dice sin
rodeos: *"La mayoría de equipos instrumentan sus sistemas con traces,
métricas y dashboards — y asumen que tienen observabilidad. No la tienen.
Tienen telemetría de ejecución."* El post de Griciunas es, con precisión,
un ejemplo de manual de esa **Capa ① — Observabilidad de ejecución** (de
las tres que define §12.6): necesaria, bien explicada, pero exactamente el
techo que el capítulo advierte que la mayoría confunde con el todo. No
llega a la Capa ② (qué alternativas existían y por qué se descartaron) ni
a la ③ (qué configuración hizo posible esa decisión) — ni al DecisionRecord
que el manual propone como artefacto auditable.

**Comprobación en Empreinte — gap real y accionable.**
[`audit_sensor.py::record()`, línea 264-330](C:\Perso\Projects\Empreinte\audit_sensor.py)
captura un único `latency_ms` y `tokens_in`/`tokens_out` **agregados por
turno completo** — no hay desglose por fase (embedding vs. retrieval vs.
generación). Es exactamente el nivel de granularidad que este post
argumenta que hace falta para diagnosticar *dónde* se atasca un pipeline o
se dispara el coste ("embedding taking longer than expected", "reached API
limits"). Hoy Empreinte no puede responder esa pregunta: solo ve el total
de la conversación.

**Comprobación en HyperRAG — mismo gap.** El motor ya tiene 6 capas
configurables (`bm25, vector, wiki, graph, tree, reranker`,
[hyperrag_cli.py:39](C:\Perso\Projects\HyperRAG\hyperrag-engine\scripts\hyperrag_cli.py:39))
pero no encontré timing por capa en `hyperrag_cli.py` (`elapsed`,
`duration_ms`, etc. — sin resultados). Con seis capas activas, saber cuál
tarda o cuál falla es más urgente aquí que en un RAG de una sola capa como
el del post.

**Veredicto: Matizar/incorporar parcialmente.**
- `[Manual: Ninguno obligatorio]` — §12.6 ya supera el contenido. Opcional,
  no urgente: una frase citando este post como ilustración real de "Capa ①
  confundida con observabilidad completa" reforzaría el argumento con un
  ejemplo externo verificable — decisión del autor, no autoaplicado aquí.
- `[Empreinte: audit_sensor.py — desglose de latencia/tokens por fase]`
  **candidato real de extensión.** Añadir campos aditivos (no rompen el
  esquema actual) tipo `embedding_latency_ms`, `retrieval_latency_ms`,
  `generation_latency_ms` — condicionado a que `rag_engine.py` ya mida
  estos tiempos internamente antes de llamar a `record()`; si no los mide,
  la extensión es de dos capas (instrumentar el pipeline + ampliar el
  esquema de log), no solo de logging.
- `[HyperRAG: instrumentación por capa]` **candidato de extensión**, mismo
  patrón — timing por capa (`bm25`/`vector`/`wiki`/`graph`/`tree`/`reranker`)
  en `search`/`query`, hoy ausente.

Pendiente de decisión del usuario: ¿implementar el desglose de
latencia/tokens por fase en Empreinte y/o por capa en HyperRAG, o dejarlo
en observación hasta acumular más señales de que hace falta?

**Armonización con los documentos de continuidad de HyperRAG (2026-08-19).**
HyperRAG se gobierna como laboratorio con disciplina propia
(`docs/ARRANQUE.md`, `docs/RETOMAR.md`, `docs/ESTADO_evaluacion_*.md`):
nada entra como "proposición asentada" sin una entrada de bitácora con
comando y fecha, y la cola de prioridades (`ARRANQUE.md §6.3`,
`RETOMAR.md §4`) es una decisión del propietario del laboratorio, no algo
que este triaje pueda alterar por su cuenta. Los dos candidatos de arriba
quedan anclados en la sección que ese repo ya reserva para dependencias
externas (`ARRANQUE.md §8` / `RETOMAR.md §7`, mismo sitio donde vive la
referencia a este manual), **no** en la cola de prioridades ni en el
dossier de medición — quedan explícitamente marcados ahí como "sin medir,
sin decidir, no tocar sin discutirlo antes", en su mismo registro. Así una
sesión que arranque en frío en HyperRAG los ve sin que se confundan con
algo ya decidido, y este log sigue siendo la fuente completa del
razonamiento detrás de ambos.

### 2026-08-19 — "Chunking Strategies for RAG" (Renatagotler, Medium)

**Fuente.** Post de Medium, autora sin credencial ni institución
identificable en el propio texto. Sin citas a estudios ni benchmarks
propios — es un artículo explicativo/listicle: fixed-size, overlapping,
recursivo, semántico, language-aware (código/HTML/markdown), metadata-aware
y parent-child, cerrando con la recomendación de evaluar empíricamente con
Precision@K/Recall@K/MRR/NDCG + faithfulness/latencia. Misma categoría de
credibilidad que las dos infografías (baja, sin verificación posible), pero
en prosa más extensa y sin errores técnicos detectables.

**Validez.** Taxonomía correcta y estándar — es la misma que documentan
LangChain/LlamaIndex desde 2023. Cero datos propios; todos los ejemplos son
ilustrativos (política de reembolso, `def authenticate()`).

**Novedad frente al manual.** Ninguna, y en un punto el manual va más
lejos: cubre *late chunking* (arXiv 2409.04701, `jina-ai/late-chunking` —
invierte el orden, embebe el documento entero y agrupa vectores de token
*después*), técnica de 2024 que este artículo de 2026 ni menciona. También
cubre chunking jerárquico parent-child con el mismo nombre y mecanismo
(línea ~11469), y explica el coste del chunking semántico con más
precisión que el post (el coste es la llamada al embedding en indexación
para detectar fronteras, no el tamaño de los chunks). Único hueco real:
chunking de código vía AST/límites de función — no aparece en el manual;
menor, estándar en LangChain, no urgente para un manual orientado a
producción más que a herramientas de desarrollador.

**El hallazgo que sí importa: contraste empírico con el propio laboratorio
HyperRAG.** La tesis central del artículo — *"in many production RAG
systems retrieval quality depends more on chunking strategy than model
size"*, *"thoughtful chunking often delivers larger gains than switching to
a more powerful LLM"* — es exactamente la hipótesis que F1/F2/F3
(`docs/ARRANQUE.md` §7, dossier §9) sometieron a prueba tres veces sobre un
corpus real, y la refutaron cada vez como causa dominante: *"El troceado no
puede ser la causa de un fallo cuando el chunk correcto se recupera
siempre. Los ~42 puntos se pierden después de recuperar y antes de
responder."* En ese laboratorio, lo que de verdad costó puntos fue el
compresor de contexto por defecto (**37 puntos**, R3) y el parámetro `k`
(**11,8 puntos**, A9/P8) — el chunking, medido tres veces, no. Esto no
invalida el artículo en general (el propio manual tiene un laboratorio de
Cap. 13 donde el chunking sí rompe algo, con contratos legales trinchados
por artículo), pero sí desmonta la generalización sin matices del post: la
pregunta correcta no es «¿importa el chunking?» sino «¿es tu chunking la
causa medida, o la sospechosa de siempre porque es la más fácil de
señalar?». HyperRAG es exactamente el contraejemplo verificable que le
faltaría citar a un artículo así.

**Hallazgo lateral en Empreinte, no del artículo sino del propio manual.**
Revisando la sección de chunking del manual encontré esta recomendación
(línea ~17002, sobre faithfulness computable sin anotación humana): añadir
un campo `retrieved_chunks: []` al log de interacciones para poder calcular
faithfulness y context precision sobre tráfico real. `audit_sensor.py`
[líneas 271, 330, 372, 465](C:\Perso\Projects\Empreinte\audit_sensor.py)
ya tiene `chunks_used`, pero es un **conteo entero**, no el contenido/ID de
los chunks recuperados — no permite ese cálculo hoy. Tercer candidato de
instrumentación para Empreinte, además de los dos ya anotados.

**Veredicto: Descartar como fuente de contenido nuevo, conservar como
contraste citable.**
`[Manual: Ninguno obligatorio — opcional citar HyperRAG F1/F2/F3 como
contraejemplo real a la generalización "chunking > modelo" en Cap. 1 o
Cap. 7]`
`[Empreinte: candidato #3 — retrieved_chunks[] en audit_sensor.py, en vez
de (o además de) chunks_used, para habilitar faithfulness/context
precision sobre tráfico real sin anotación humana, tal como recomienda el
propio manual]`
`[HyperRAG: Ninguno — el hallazgo relevante es que su propio dossier ya
refuta la tesis del artículo, no que le falte algo]`

**Nota.** El candidato #3 de Empreinte (`retrieved_chunks[]`) no se ancló
en los documentos de HyperRAG porque no depende de ese repo — vive
únicamente en el triaje hasta que se decida.

### 2026-08-19 — "Lattice static retriever fits in 8 MB. Know what it forgets" (Musthave.AI)

**Fuente.** Abdessalam Alaoui, fundador de Musthave.AI (9 ago. 2026). Blog
de empresa, no papel académico — pero de categoría claramente distinta a
las cuatro entradas anteriores: **reproduce el artefacto localmente** antes
de escribir, y separa explícitamente en una tabla qué verificó él mismo
("Reproduced": carga del checkpoint, forma del embedding, normalización,
generación del artefacto int4 de 7,94 MB) de qué solo cita del autor
("Author-reported": el benchmark de velocidad sobre Wikipedia completa).
Cita el commit exacto del repo (`fe4b29d`) y el JSON de evaluación
versionado. Sesgo de interés real pero declarado: enlaza contenido propio
de Musthave.AI ("our model selection framework"), es marketing de
contenido técnico, no neutral — pero el método es serio y auditable.

**Contenido.** *Lattice* (`erikkaum/lattice-retrieval`): en vez de un
transformer con atención, usa una tabla de embeddings 30.522×1.024
aprendida (una fila por token), sin capa de atención — tokeniza,
recupera filas, aplica *mean pooling* y normaliza L2. Artefacto de
despliegue: 512 dim + cuantización int4-row = **7,94 MB**. Entrenado sobre
~660M pares consulta-documento + fine-tuning con negativos duros. Pérdida
de calidad frente al modelo completo: 0,4749 → 0,4697 NDCG@10 (BEIR de 12
tareas, -1,1% relativo) — el propio autor advierte que esa cifra mezcla
reducción de dimensión y cuantización, no es "penalización de
cuantización pura". Limitación explícita: al hacer *mean pooling* sin
atención, pierde orden de palabras, polisemia y composicionalidad
("el perro muerde al hombre" ≈ "el hombre muerde al perro" en el vector).
Solo inglés — cobertura multilingüe no verificada.

**Validez metodológica.** Alta para el género. Reproduce en vez de repetir,
distingue medición propia de cita, y advierte activamente contra la
comparación ingenua ("different hardware, warm-up, batching... would make
a direct comparison misleading"). El benchmark de velocidad (6,4M
artículos en 7m26s) queda correctamente marcado como no reproducido.

**Novedad frente al manual — hueco real.** El manual solo menciona
"embedding estático" una vez (línea 5970), como concepto histórico
pre-transformer para explicar por qué se abandonó (polisemia sin resolver:
"voy al banco" con vector fijo). No cubre el resurgimiento deliberado de
2026: embeddings estáticos **entrenados a gran escala específicamente para
retrieval** (no word2vec genérico) y usados como **primera etapa barata**
dentro de un pipeline de dos etapas — exactamente el patrón que Cap. 6/7 sí
cubre para otras técnicas (reranking en cascada) pero no para esta. No hay
mención de retrieval on-device/offline/CPU-only como caso de uso con
trade-off propio.

**Relevancia para Empreinte — con matiz que descarta uso inmediato.** La
filosofía de Empreinte (Ollama, modelos locales, minimizar dependencia de
APIs cloud por coste y privacidad — ver §6.10 del manual, "viabilidad con
modelos locales") hace que un retriever de 8 MB, CPU-only, sin llamada
externa, encaje en el mismo eje de valor. Pero el propio artículo declara
cobertura **solo en inglés**, y no hay evidencia de variante multilingüe.
Dado que Empreinte y HyperRAG operan en corpus multilingües (fr/en/es),
esto no es adoptable hoy sin verificar — es candidato a **observar**, no a
incorporar.

**Relevancia para HyperRAG — descartado por ahora, con motivo específico.**
El propio dossier (P10/P11) ya estableció que **los fallos de recuperación
de HyperRAG se concentran en la banda de bajo solape léxico y en francés**
— justo el terreno donde un modelo *inglés-only* sin atención y sin
capacidad de resolver polisemia rendiría peor, no mejor. Además HyperRAG
es "un laboratorio... no tiene usuarios" (`ARRANQUE.md` §1): no hay
restricción de memoria/CPU de producción que un artefacto de 8 MB venga a
resolver. No hay caso de uso hoy.

**Veredicto: Observar / candidato a incorporar en el manual.**
`[Manual: candidato — Cap. 6, caso de estudio "el resurgir deliberado de
los embeddings estáticos": por qué se abandonaron (Cap. 0) y por qué
vuelven con los ojos abiertos como primera etapa barata en pipelines de
dos etapas, con la cifra de coste (-1,1% NDCG@10 combinando dimensión +
cuantización) y el límite explícito (orden de palabras, polisemia,
solo inglés)]`
`[Empreinte: Observar — encaja en la filosofía "local primero", pero
bloqueado por cobertura solo-inglés hasta verificar alternativa
multilingüe; no implementar sin esa verificación]`
`[HyperRAG: Ninguno — su propio hallazgo P10/P11 (fallos concentrados en
francés y bajo solape léxico) es precisamente el escenario donde esta
técnica es más débil, y el proyecto no tiene restricción de producción que
la justifique]`

### 2026-08-19 — "I hate what AI is doing to the minds and happiness of the young" (Katherine Rundell, The Guardian)

**Fuente.** The Guardian, 8 ago. 2026, sección Comment/Opinion. Autora
identificable y con autoridad real en la materia — escritora infantil,
fellow de Oxford, trabaja directamente con jóvenes — pero es **ensayo de
opinión explícitamente polémico** ("if you set out to design a tool for
authoritarian rule, it would look exactly like AI"), no reportaje ni
investigación. Categoría de credibilidad distinta a todo lo anterior:
plataforma y autora de primer nivel, registro persuasivo, no neutral.

**Contenido.** Argumenta que la IA generativa daña la capacidad cognitiva y
la libertad intelectual de niños y estudiantes: cita un "estudio del MIT"
sobre menor actividad cerebral con IA, un estudio no identificado sobre
persistencia tras "10 minutes of AI-assisted problem-solving", el caso de
suicidio de Sewell Setzer III, y los giros regulatorios de Suecia/Noruega
contra la tecnología en el aula. Concluye pidiendo volver a la lectura y la
escritura sin asistencia como forma de resistencia intelectual.

**Relevancia y alcance.** El manual es un manual para profesionales que
construyen y gobiernan sistemas de IA (ingenieros, compliance, dirigentes),
no un texto de política educativa K-12/universitaria. La discusión sobre
currículo escolar, Suecia/Noruega o el caso Setzer está fuera de alcance
por diseño — no es un hueco, es una audiencia distinta.

**El hallazgo que sí importa: el manual ya trata el mismo estudio, con más
rigor.** El "estudio del MIT" que Rundell cita como hallazgo asentado
("lowest brain activity", "consistently underperformed at neural,
linguistic, and behavioural levels") es, casi con certeza, **Kosmyna et
al., MIT, preprint arXiv 2506.08872 (2025)** — el mismo que el manual ya
trata en detalle en §20.3, con un recuadro de advertencia explícito:
*"Este estudio circula en algunos materiales del sector con la cifra
específica de 'reducción del 55% de la conectividad fronto-parietal'... el
trabajo está como preprint sin revisión por pares completada y sin
replicación independiente. **No lo cites como hecho establecido.**"* El
artículo de Rundell hace exactamente lo que el manual advierte que no se
haga: presenta el hallazgo preliminar como prueba consumada, sin mencionar
que es un preprint de muestra pequeña sin réplica. Es un ejemplo real,
fechado y verificable (prensa de calidad, agosto 2026) de la distorsión
que §20.3 anticipa.

Además, §20.3 ya cita **tres** estudios convergentes con más matiz que el
artículo — Klopfer et al. (MIT/CACM 2024, retención en programación),
Lee et al. (Microsoft Research/CMU 2025, pensamiento crítico) y el propio
Kosmyna et al. — y advierte explícitamente contra la cifra del 55% que
"circula popularmente". El artículo de Rundell no menciona ninguno de los
otros dos ni las limitaciones de tamaño de muestra o auto-selección que el
manual sí discute (Lee et al.: "correlación no es causalidad... puede
deberse en parte a auto-selección").

**Conexión interna, sin brecha.** El concepto propio del manual más
cercano —§13.10 "Vibe coding y deuda de comprensión"— está ya cubierto en
código y práctica de desarrollo, pero acotado a programadores. §20.3
(delegación cognitiva) es el capítulo que sí cubre el caso general
(escritura, aprendizaje) que plantea Rundell, y ya lo hace con precedente
metodológico (GPS y memoria espacial, Dahmani & Bohbot 2020) y con más
estudios que el propio artículo.

**Veredicto original: Descartar como fuente de contenido nuevo — el manual
ya cubre esto con más rigor. Opcionalmente citable como ejemplo de mala
práctica.**
`[Manual: Ninguno obligatorio — candidato opcional en §20.3: una frase
citando este artículo (Rundell, The Guardian, ago. 2026) como caso real de
prensa seria repitiendo la cifra del 55% de Kosmyna et al. sin el matiz de
preprint/sin réplica, justo el patrón que el recuadro de advertencia de
§20.3 ya anticipa — refuerza el argumento del manual con un ejemplo fechado,
no añade contenido técnico]`
`[Empreinte: Ninguno — fuera de alcance, no es un sistema de IA en
educación]`
`[HyperRAG: Ninguno — no aplica, no es contenido de RAG/retrieval]`

**Actualización 2026-08-19 — incorporado.** El usuario pidió cruzar esta
fuente contra el corpus literario de la Obra Completa antes de decidir. El
cruce (con *Beyond the Covenant*, 01_Ciclo_Covenant, y sobre todo con
*Tres domesticaciones*, 10_epigenetica) resultó más sustancial de lo
previsto — no solo confirma el recuadro de §20.3, añade una complicación
empírica real (Dell'Acqua et al., el "filo irregular") a un argumento del
propio artículo de Rundell (Suecia/Noruega, a quién protege restringir la
IA). Se incorporó como §20.3b, manual ahora en **v67**. Registro completo
del parche: `Registro_manual_v66_a_v67.md`, este mismo directorio. Análisis
completo de sinergias/contradicciones: nota-puente
`10_epigenetica/Rundell_y_las_tres_domesticaciones_nota_puente.md`.
`[Manual: §20.3b, v67 — hecho]`

### 2026-08-19 — "Extracting Truth from 16 Million Pages" (Armin Maddah, LinkedIn, sobre GIJN/Die Zeit)

**Fuente.** Armin Maddah (Data Scientist), post de LinkedIn que analiza una
entrevista real de GIJN (Global Investigative Journalism Network) a Gregor
Aisch y Andreas Loos, del desk de datos e IA de *Die Zeit*, sobre el
pipeline que digitalizó 16 millones de páginas de fichas de afiliación al
NSDAP. Categoría de credibilidad alta: el análisis es secundario, pero la
fuente primaria (entrevista GIJN, base de datos pública de Die Zeit) es
verificable, con nombres, institución y un artefacto público real —no una
infografía genérica. Maddah distingue explícitamente lo que la entrevista
dice de lo que él especula ("The article does not describe how those
models were coordinated, but it raises an interesting architecture
question").

**Contenido.** 5.442 PDFs, ~3.000 páginas cada uno, ~16M páginas. OCR con
varios sistemas + Gemini para manuscrito. Normalización de nombres/fechas/
lugares producidos por oficinas distintas durante dos décadas, con
resolución de entidades y deduplicación. El punto central: el LLM a veces
no transcribe, **interpreta** — una ficha con la abreviatura "D." puede
devolver "Düsseldorf". Interpretación plausible, pero es información que
no estaba literalmente en el documento fuente, y si se guarda como si lo
estuviera, ni un sistema aguas abajo ni un lector pueden distinguir después
qué vino del archivo y qué vino del modelo.

**Validez.** Alta para el género — hechos concretos y verificables (cifras,
nombres, artefacto público), sin benchmark propio pero sin necesitarlo:
es relato de ingeniería en producción, no una afirmación estadística.

**Novedad frente al manual — hueco real, distinto de lo ya cubierto.** El
manual tiene un hilo de procedencia bien desarrollado (§4.7b, §8.7b,
§10.9.6, §13.15) pero todo él vive en la capa de **evaluación** (el arnés
que no distingue qué se aproximó) o de **uso individual** (línea ~19894:
protocolo para que una persona distinga, en su propio trabajo con IA, qué
verificó de qué es inferencia del modelo). El caso Die Zeit es distinto:
es procedencia en la **capa de ingesta/indexación** — un pipeline que debe
decidir, estructuralmente, si el texto "extraído" y el texto "interpretado
por el modelo" viven en el mismo campo o en campos distintos, antes de que
nadie evalúe nada. También hay un caso "OCR Poisoning" en Cap. 21, pero es
un vector de seguridad (texto malicioso oculto en imagen), no este
problema — que es benigno en intención y dañino por conflación silenciosa.
Es una capa del problema de procedencia que el manual no cubre todavía.

**Comprobación en HyperRAG — no es un hueco, es una confirmación.**
Fui a comprobar si `ContextualLLMStrategy`
([hyperrag/core/chunking/strategies.py:197-271](C:\Perso\Projects\HyperRAG\hyperrag\core\chunking\strategies.py))
—que genera 1-2 frases de contexto vía LLM para situar cada chunk, el
mismo patrón "contextual retrieval" de Anthropic 2024— tenía el mismo
problema: mezclar la interpretación del LLM con el texto literal sin
etiqueta. **No lo tiene.** El prefijo generado por el LLM se usa solo para
`embed_text` (línea 265: `d.embed_text = f"{prefix}\n{d.text}"`), y se
guarda además, por separado y explícitamente etiquetado, en
`d.extra_meta["context_prefix"]` (línea 267) — `d.text`, el chunk literal,
no se toca. Es exactamente la separación extracción/interpretación que el
caso Die Zeit pide. **Sin verificar:** si esa separación sobrevive aguas
abajo, hasta la generación y las citas del comando `query` — no confirmado
en esta pasada.

**Veredicto: Incorporar (manual) / Confirmar sin acción (HyperRAG) /
No aplica (Empreinte).**
`[Manual: candidato — extensión al hilo de procedencia existente
(§4.7b/§13.15) o nueva entrada en Cap. 1/Cap. 6 sobre calidad de fuente:
caso real Die Zeit/NSDAP como ejemplo de alto riesgo (identidad de
personas reales, archivos históricos) de por qué "extraído" e
"interpretado por el modelo" necesitan campos distintos en el esquema de
datos, no solo disciplina de prompt — con el patrón de
`ContextualLLMStrategy` de HyperRAG como contraejemplo positivo de cómo
hacerlo bien]`
`[Empreinte: Ninguno — no hace ingesta de documentos escaneados/OCR]`
`[HyperRAG: Ninguno que corregir — `context_prefix` ya separado de `text`;
candidato a verificación futura de si la separación sobrevive hasta
`cmd_query` y las citas generadas, no urgente]`

### 2026-08-19 — "Master LLM Inference: A Step-by-Step Roadmap" (Sivasankar Natarajan, LinkedIn)

**Fuente.** Mismo autor que la primera entrada de este log (shiva.bytes,
bio genérica de consultoría), esta vez sobre mecánica de inferencia
(prefill/decode, transformer, hardware, optimización, serving) en vez de
arquitectura RAG. Mismo patrón: infografía sin cita, sin dato propio, sin
benchmark — cinco cajas conceptuales (prefill/decode, self-attention,
hardware SM/SRAM/HBM, optimizaciones, motores de serving).

**Contenido.** Prefill (cómputo, paralelo, construye KV cache) vs. decode
(memoria, secuencial, lo reutiliza) como respuesta a por qué el primer
token tarda y el resto es rápido. KV cache, batching/continuous batching,
FlashAttention, cuantización, decodificación especulativa, prompt
caching/chunked prefill. Motores: vLLM, SGLang, TensorRT-LLM, llama.cpp.

**Credibilidad y validez.** Igual que la primera entrada de este autor:
baja, sin evidencia propia, contenido de fórmula para LinkedIn.

**Novedad frente al manual — ninguna, y la brecha de profundidad es mayor
que la vez anterior.** §5.7d ("La economía física de la inferencia:
prefill, decode y el ancho de banda") cubre exactamente esta distinción
—cómputo vs. ancho de banda de memoria— y la conecta explícitamente con
por qué el chunking y el retrieval existen como disciplina (cruce con
§1.4), algo que la infografía no intenta. Añade un concepto propio que la
infografía ni roza: **"el precio de la sorpresa"** — la decodificación
especulativa es *sin pérdida* pero su velocidad depende de la tasa de
aceptación del borrador, que es más alta cuanto más predecible es el
texto; consecuencia, el texto predecible se genera más barato, y esa
señal de precio es medible en producción (tasas de aceptación logueadas).
§5.7e cubre hardware con una tabla de cinco categorías (CPU/GPU/TPU/NPU/
LPU) con tradeoffs y dónde brilla cada una, frente a las tres cajas
genéricas SM/SRAM/HBM de la infografía, y añade una nota de frontera
—prefill/decode servidos desde pools de hardware separados, hasta 14× de
mejora en TTFT documentada— que es más avanzada que cualquier cosa en el
post. El KV cache está tratado con más profundidad: MLA y GQA (reducción
5-13× y 4-8× respectivamente), que la infografía no menciona en absoluto.
Y donde el post dice "llama.cpp for local and CPU" en una línea, el
manual tiene un caso de fallo real en producción (línea ~14821: colapso
por CUDA OOM a partir de la undécima petición concurrente).

**Único hueco menor.** No hay una tabla única "cuándo elegir vLLM vs.
SGLang vs. TensorRT-LLM vs. llama.cpp" — pero es exactamente el tipo de
contenido de alta caducidad (nombres de herramientas, no mecanismos) que
el manual reserva deliberadamente fuera del cuerpo estable, y los
mecanismos que cada motor implementa (continuous batching, PagedAttention,
FlashAttention, cuantización, decodificación especulativa) ya están
cubiertos individualmente y con más rigor.

**Comprobación en Empreinte/HyperRAG.** No aplica — ninguno de los dos
proyectos opera su propio servidor de inferencia (consumen LLMs vía
Ollama/APIs), así que la mecánica de prefill/decode/serving no es una
capa que construyan ellos mismos.

**Veredicto: Descartar.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]` — mismo autor, mismo patrón de la primera entrada
de este log, y esta vez el manual no solo iguala sino que supera con un
concepto propio (el precio de la sorpresa) y con un caso de fallo real
que la infografía no tiene ni en germen. **Nota de patrón, extendida:**
este autor produce infografías de fórmula sobre temas de IA/LLM distintos
cada pocos días; el patrón de descarte por comparación directa (ya
establecido para el género "basic vs advanced RAG") se extiende ahora
también a su serie sobre mecánica de inferencia — futuras piezas del
mismo autor sobre estos dos temas pueden triarse contra las entradas
correspondientes de este log sin repetir la comprobación completa, salvo
que aporten una cifra o cita propia que no tuvieran antes.

### 2026-08-19 — "Speculative Decoding" (dimplesharma21, LinkedIn)

**Fuente.** Infografía de LinkedIn (@dimplesharma21), sin bio ni afiliación
visible en el propio contenido. Sin cita a los papers originales
(Leviathan et al. 2023, Chen et al. / DeepMind 2023) ni dato propio — pero
de ejecución notablemente más cuidada que las infografías genéricas
anteriores de este log: un ejemplo trabajado con K=5, contando pases
exactos y mostrando accept/reject/resample paso a paso, no solo el
diagrama de cajas habitual.

**Contenido.** Por qué la generación autoregresiva es secuencial (100
tokens = 100 pases) pero verificar es paralelo (comprobar 10 tokens cuesta
lo mismo que generar 1). Draft model propone K tokens, target los verifica
en un pase; primer rechazo corta el bloque y se resamplea desde ahí. La
calidad no baja porque el target decide, el draft solo propone — salida
estadísticamente idéntica. Y el punto más fino: la técnica compra latencia
con cómputo — gana en una GPU con capacidad libre (un usuario esperando en
streaming), pierde en un servidor saturado, donde el throughput medido
puede *caer*. "The win is latency, not throughput."

**Credibilidad y validez.** Sin evidencia propia ni cita, pero técnicamente
correcto en todo lo que afirma — incluido el matiz final, que es más fino
que el de la mayoría de explicaciones divulgativas del tema.

**Novedad frente al manual — cubierto en casi todo, con un matiz real que
falta.** §5.7d ya tiene inferencia especulativa con más profundidad:
diagrama draft(1.5B)/verifier(70B) con velocidad efectiva 1.5-3×, caja
"cuándo funciona bien / cuándo aporta menos" (rechazo alto → el overhead
supera el beneficio; VRAM de dos modelos cargados a la vez), entrada de
glosario, y el concepto propio **"el precio de la sorpresa"** — que el
texto predecible se genera más barato porque la tasa de aceptación es más
alta, con esa señal de precio medible en producción — que esta infografía
ni menciona y es más sofisticado que su propio argumento. Pero el matiz
concreto de *throughput vs. latencia bajo saturación de servidor* —que
gastar cómputo extra en verificar especulaciones compite por el mismo
cómputo que atender más peticiones concurrentes bajo continuous batching,
así que la técnica puede mejorar la latencia de un usuario y a la vez
reducir el throughput agregado del servidor— **no está** en §5.7d ni en
ningún otro punto del documento (comprobado). Es un matiz real, específico,
y verificable independientemente en la literatura de serving (es la misma
tensión que motiva el desagregado prefill/decode que sí menciona §5.7e).

**Comprobación en Empreinte/HyperRAG.** No aplica directamente — ninguno
de los dos proyectos implementa su propio motor de decodificación
especulativa (consumen LLMs vía Ollama/APIs, no construyen el serving).

**Veredicto: Matizar — incorporación menor y acotada.**
`[Manual: candidato pequeño — añadir una frase a la caja "cuándo aporta
menos" de §5.7d: bajo carga concurrente con continuous batching, el
cómputo extra de verificación compite con el de servir más peticiones, así
que la ganancia de la técnica es de latencia por usuario, no
necesariamente de throughput agregado del servidor — matiz que ni esta
fuente ni el manual tenían conectado con continuous batching hasta ahora]`
`[Empreinte: Ninguno]` `[HyperRAG: Ninguno]`

### 2026-08-19 — "6 Concepts Mathématiques Pour Mieux Comprendre l'IA" (François Giltaire)

**Fuente.** Nota manuscrita/infografía en francés, francoisgiltaire.com,
con gancho promocional al final ("100 énigmes mathématiques... sur
francoisgiltaire.com") — mismo patrón de embudo que otras fuentes de este
log, pero aplicado a divulgación matemática, no a arquitectura de IA.

**Contenido.** Vector (representación numérica de palabras/imágenes/
sonido), distancia |AB|, producto escalar (fórmula correcta:
OA·OB = ‖OA‖‖OB‖cos θ, con la lectura correcta de que ángulo menor implica
mayor similitud), función como f(x)=ax+b de juguete, derivada con su
definición de límite correcta, y un árbol de probabilidad de dos niveles
cuyas cuatro ramas suman 100% correctamente (56,25+18,75+12,5+12,5).

**Validez.** Matemáticamente correcto en todo lo verificable — no hay
error que señalar. No requiere evidencia empírica porque no hace ninguna
afirmación sobre sistemas, solo explica matemática de base.

**Novedad frente al manual — no es un hueco, es una audiencia distinta.**
El manual usa estos conceptos constantemente (embeddings, similitud
coseno, descenso de gradiente implícito en el ajuste de parámetros,
softmax/probabilidad en la capa de salida) pero **los asume como
conocimiento previo** en todos sus perfiles de lectura declarados —
incluido "BI/datos en transición", que ya presupone alfabetización
cuantitativa. Este contenido explica el nivel *anterior* a ese punto de
partida (qué es un vector, qué es una derivada, desde cero). No es que el
manual lo cubra peor: es que está calibrado para un lector que ya no
necesita esta explicación. Incorporarlo sería un desajuste de altitud, no
un enriquecimiento — bajaría el nivel del capítulo 0 en vez de reforzarlo.

**Comprobación en Empreinte/HyperRAG.** No aplica — no hace ninguna
afirmación sobre RAG, retrieval, arquitectura o sistemas; es prerrequisito
matemático puro.

**Veredicto: Descartar por audiencia, no por calidad.** `[Manual: Ninguno]`
`[Empreinte: Ninguno]` `[HyperRAG: Ninguno]` — contenido correcto y bien
ejecutado para su público (introducción general, no técnica), pero por
debajo del punto de partida que el manual asume en todos sus perfiles de
lectura. Sería relevante solo si en algún momento se decidiera crear un
apéndice de prerrequisitos matemáticos para lectores sin formación
cuantitativa previa — eso es una decisión de alcance editorial, no un
hallazgo de esta fuente.

**Actualización 2026-08-19.** El usuario recogió la idea de fondo —no
esta fuente en concreto— como candidato propio: ver pendiente #12 del
panel de arriba (tensores explicados con imagen animada, y posible
generalización a otros prerrequisitos como este).

### 2026-08-19 — "Your AI Coding Agent Is You... And That's the Problem" (dev.to)

**Fuente.** Post técnico de dev.to, relato en primera persona de una
implementación real y propia (no genérica): usuario Linux aislado
(`maibot`), GitHub App con permisos exactos listados
(`contents:write`, `pull_requests:write`, `metadata:read`), intercambio
JWT→token de instalación con expiración de una hora, dos sesiones
Remote-SSH/WSL2 separadas (`wsl-colomr` para el desarrollador,
`wsl-maibot` para el agente). Especificidad alta — no es un post
conceptual, es una configuración que se puede reproducir literalmente.

**Contenido.** Un agente de código corriendo dentro de la sesión de un
desarrollador no se autentica como sí mismo: hereda las claves SSH, el
`git config`, la sesión de `gh` del desarrollador. Si el desarrollador es
admin de la organización, el agente opera como admin — y los rulesets de
GitHub eximen a los admins por defecto. El push a `main` no rompió ninguna
regla: la regla nunca llegó a aplicarse. Distinción central: un
`RULES.md` que dice "nunca hagas push a main" es **tinta** (probabilístico,
el modelo lo interpreta); una restricción a nivel de sistema que bloquea
el push antes de que ocurra es **cemento** (sin excepciones).

**Credibilidad y validez.** Alta para el género — relato de primera mano
de una implementación real, con detalles verificables (permisos exactos,
mecanismo de token, arquitectura de dos sesiones). El comportamiento de
GitHub descrito (rulesets eximen a admins por defecto) es correcto y
documentado por GitHub mismo.

**Novedad frente al manual — el principio ya está, con más rigor; falta
la implementación concreta.** §10.10.2 ya dice, casi palabra por palabra,
lo mismo que este post concluye: *"cualquier agente con capacidad de
actuación real necesita (1) una credencial con alcance explícito y
limitado — **nunca credenciales de administrador heredadas sin
acotar**"* — y cita un estándar formal, OWASP AISVS (C5/C9/C10), con dos
matices que el post ni menciona: **reautorización continua** (cada acción
privilegiada se reautoriza en el momento, no solo al delegar la credencial
una vez) y **fail-closed, no fallback silencioso** (negar por defecto si
la autorización no puede completarse). En eso el manual va más lejos.
Lo que el post aporta y el manual no tiene: una **implementación de
referencia concreta y reproducible** para el caso más común de todos —
un agente de código conectado a GitHub — mientras el manual se queda en
el principio arquitectónico general. Es exactamente el hueco entre
"qué debe ser cierto" (§10.10.2) y "cómo se construye, paso a paso, para
esta herramienta específica" que ningún capítulo cubre todavía. El marco
"tinta vs. cemento" es además una reformulación memorable, en otro
dominio (seguridad de Git/CI), del mismo principio que ya sostiene el
Patrón Sándwich del manual (§12): no confíes en que el modelo lea la
instrucción, haz que el código decida.

**Comprobación en HyperRAG — hallazgo directo y concreto.**
[`docs/ARRANQUE.md` §2.6](C:\Perso\Projects\HyperRAG\docs\ARRANQUE.md):
*"Quién ejecuta qué: David lanza todo lo que necesite ollama, HuggingFace
o git. Claude lanza evaluaciones sólo-bm25 y todo lo demás en el sandbox
Linux. **Claude no ejecuta git.**"* Es exactamente la regla correcta,
aplicada al mismo riesgo que describe el post — pero es **tinta**: una
línea en un `.md` que una sesión futura (o esta misma) podría violar por
error, no un límite que el sistema haga cumplir. HyperRAG no tiene hoy el
equivalente de `maibot` (usuario aislado, credencial de git con alcance
limitado) — tiene la política correcta sin el cemento que la sostenga.

**Veredicto: Incorporar (manual) / Observar (HyperRAG, cambio de
proceso, no de código).**
`[Manual: candidato — Cap. 10 (§10.10.2) o Cap. 12: implementación de
referencia "tinta vs. cemento" para agentes de código sobre Git/GitHub,
usando este post como caso concreto del principio ya establecido;
también citable en Cap. 21 (ciberseguridad LLM) como ejemplo de bypass de
gobernanza por herencia de identidad, no por fallo del modelo]`
`[Empreinte: Ninguno — no ejecuta agentes con acceso a repositorios Git]`
`[HyperRAG: Observar — la regla "Claude no ejecuta git" en
`docs/ARRANQUE.md` §2.6 ya es la política correcta; convertirla en cemento
(usuario de sistema separado o token de git con alcance limitado en el
sandbox Linux) sería la aplicación directa de este hallazgo, pero es una
decisión de proceso del propietario del laboratorio, no algo que este
triaje deba tocar por su cuenta — se ancla aquí, no en `ARRANQUE.md`,
porque no es un candidato de contenido de investigación sino de
higiene operativa]`

### 2026-08-19 — "Why Does CLAUDE.md Keep Growing? Catastrophic Remembering in Agentic Coding" (Kushal Chakrabarti, arXiv:2608.11095)

**Fuente.** Paper de arXiv (cs.AI, 11 ago. 2026), autor único, South Park
Commons. La fuente de mayor rigor de todo este log, por un margen amplio:
corpus de 1.867 repositorios GitHub reales con CLAUDE.md/AGENTS.md/
copilot-instructions.md, 299.440 transiciones versión-a-versión, 247.694
ciclos de vida de instrucciones individuales rastreados con un pipeline
de segmentación y emparejamiento validado (1,000 precisión / 0,933 recall
sobre 50 transiciones anotadas a mano). Análisis de supervivencia
(estimador de Nelson-Aalen, bootstrap estratificado por repositorio),
modelo de fragilidad gamma para descartar explicaciones rivales, umbrales
y criterios de aceptación **pre-registrados antes de correr el pipeline**
(Tabla 3, "todo criterio pre-registrado pasa"), experimento controlado
(inversión de IFEval) con brazo control/placebo/tratamiento, validación en
mundo real sobre WildIFEval con doble juez para reproducibilidad, sección
de Limitaciones explícita, declaración de uso de LLM (solo como "compilador
delegado" para redacción/código, nunca para generar cifras — "no LLM
produjo un valor reportado"), y declaración de ética. Es, con diferencia,
la fuente que más se parece al propio registro de rigor que exige este
manual.

**Contenido — dos hallazgos encadenados.**

1. **El fenómeno, medido.** Los ficheros de instrucciones agénticas
   (CLAUDE.md y equivalentes) crecen sin límite en repositorios reales:
   +226% de media sobre su propio ciclo de vida, +4,9 instrucciones netas
   por commit, mediana de 39 instrucciones por fichero (percentil 90: 131).
   El 76,8% de las "muertes" de instrucciones llegan por reescritura total
   del fichero, no por poda selectiva — y tras la reescritura el
   crecimiento se reanuda, **más rápido que antes** (4,9%/commit tras
   reescribir frente a 4,1%/commit antes). Lo llaman el **ratchet** (trinquete):
   la reescritura resetea el tamaño pero no la tasa de crecimiento.
2. **El mecanismo causal, aislado.** El hazard de eliminación **cae** con
   la edad de la instrucción (pendiente log-hazard -0,032/commit, IC 95%
   excluye cero) — lo contrario de lo que predice la hipótesis rival
   "caducidad de la instrucción" (que predice hazard creciente con la
   edad), y controlado contra la otra rival, "fragilidad de contenido"
   (modelo de fragilidad gamma, absorbe solo 30,8% de la pendiente). El
   mecanismo real: **recuerdo imperfecto**. Añadir una instrucción cuesta
   O(1); borrarla con seguridad requiere saber *por qué* se añadió (su
   "razonamiento latente"), y probar que ya no hace falta cuesta O(2^|D|)
   en un prompt de |D| instrucciones — sin ese porqué, el mantenedor
   racional nunca puede confirmar que borrar es seguro.
3. **La solución, probada.** Comentarios que registran el razonamiento
   latente de una instrucción (qué fallo motivó, qué hipótesis, qué
   resultado tuvo) — **nunca vistos por el ejecutor**, solo por el
   siguiente mantenedor — eliminan el 99,3% del exceso en el experimento
   controlado (+211,3% de exceso sin comentarios → +1,4% con ellos, sobre
   51 pasos) y mejoran el cumplimiento de instrucciones en prompts reales
   (WildIFEval) en un 23,1% relativo (11,6pp, IC 95% [5,1; 18,3]pp) —
   porque instrucciones ruidosas/obsoletas degradan activamente el
   cumplimiento de las instrucciones verdaderas que sí siguen vigentes
   (-24,1pp de precisión con 16 distractores).

**Validez.** Sobresaliente para el género — pre-registro de umbrales,
descarte activo de dos hipótesis rivales con sus propios tests, doble
juez para el experimento en mundo real, ablaciones que aíslan qué
componente del comentario hace el trabajo (retirar el campo de resultado
cuesta el 37% del efecto). Limitaciones propias reconocidas sin adorno:
el 77,3% de "muertes" quedan censuradas como reescritura/migración, no
medidas directamente por el hazard; la segmentación gramatical por corpus
es el grado de libertad menos probado; no se midió distribución de idioma
(sin resultado sobre instrucciones no inglesas).

**Novedad frente al manual — el hallazgo de mayor calidad de esta ronda:
convergencia con una propuesta propia ya existente, ahora con respaldo
empírico real.** §8.7b ("El prompt como deuda técnica: la caducidad que
no depende de ti", ★ Propuesta del autor, v63) ya proponía, **de forma
independiente y con vocabulario propio**, casi exactamente el mismo
diagnóstico y la misma solución que este paper ahora mide a escala:
*"Una instrucción cuya justificación no se puede volver a medir no se
podrá retirar nunca, porque nadie sabrá si quitarla es seguro... la
documentación no se retira, se acumula"* — es la misma proposición que el
paper llama "recuerdo imperfecto" y demuestra con análisis de
supervivencia sobre 247.694 instrucciones reales. Y el remedio que
propone §8.7b.3 —anotar cada instrucción con campo `why` que contenga
**un número, no una intención**, y `verified_on`— es estructuralmente el
mismo mecanismo que el paper valida como "comentarios que codifican
razonamiento latente, nunca vistos por el ejecutor". §8.7b puede pasar de
"propuesta del autor sin contrastar" a **propuesta con validación externa
independiente a escala**, la primera vez en este log que una fuente
externa no solo no contradice ni iguala una idea propia del manual, sino
que la **confirma con datos que el propio manual no tenía**. Matiz
importante: el paper es más general que §8.7b — la causa que identifica
opera incluso cuando el modelo no cambia («incluso si la tarea no
cambia, la memoria decayente de por qué se escribió cada instrucción
basta para producir crecimiento sin límite»), mientras que §8.7b se
centra específicamente en la obsolescencia inducida por migración de
modelo. Son complementarios, no redundantes: el paper explica un
mecanismo más amplio del que la migración de modelo es un caso particular.

**Comprobación en HyperRAG — paralelismo estructural interesante, no una
medición del paper.** `docs/ARRANQUE.md` y `docs/RETOMAR.md` no son
literalmente CLAUDE.md/AGENTS.md (el paper no los midió; ningún proyecto
de los tres tiene un fichero con esos nombres exactos — comprobado), pero
funcionan como el mismo tipo de artefacto: instrucciones de continuidad
que un agente lee al empezar una sesión fría. Su propia regla 7
("`ARRANQUE.md` se reescribe donde haya quedado viejo") y la separación
entre ese fichero (estado actual, podado activamente) y la bitácora del
dossier (§9, expresamente **de solo añadir**, con comando y fecha por
entrada) es, estructuralmente, la misma separación instrucción/comentario
que el paper valida: un canal breve y activamente mantenido para "qué
hacer ahora", y un canal append-only con el "por qué" de cada decisión,
que no se relee entero cada vez pero queda disponible para auditar. No es
una confirmación medida — es un diseño independiente que ya converge con
la misma solución, sin que en HyperRAG se haya llamado nunca así.

**Veredicto: Incorporar — la prioridad más alta de este log.**
`[Manual: §8.7b — añadir cita a Chakrabarti 2026 (arXiv:2608.11095) como
respaldo empírico externo de la proposición ya existente; candidato
también a una entrada breve en Cap. 8 (mantenimiento de prompts/ficheros
de instrucciones agénticas) citando las cifras del paper (+226% de
crecimiento, mecanismo de recuerdo imperfecto, 99,3% de reducción con
comentarios, 23,1% de mejora en cumplimiento) como el primer estudio a
gran escala del fenómeno que §8.7b ya intuía]`
`[Empreinte: Ninguno directo — no gestiona ficheros de instrucciones
agénticas tipo CLAUDE.md]`
`[HyperRAG: Ninguno que corregir — nota de reconocimiento: la separación
ARRANQUE.md/bitácora ya implementa, sin saberlo, el mismo patrón que el
paper valida; posible mención breve en la sección de dependencias
externas si el propietario quiere documentar la coincidencia, no
urgente]`

### 2026-08-19 — "Tracely" (post en español, herramienta open source)

**Fuente.** Post en primera persona describiendo Tracely, herramienta
open source (MIT, Python: FastAPI/Celery/ClickHouse, +370 estrellas en
GitHub a fecha del post) — no una infografía genérica: describe un
artefacto real y verificable (repo, licencia, stack, métrica de
adopción), aunque en registro promocional ("el detalle que más me
gusta"). Sin cita académica ni benchmark de precisión propio de la
herramienta (no hay cifra de falsos positivos/negativos de su juez LLM
ni de su clustering de fallos).

**Contenido.** Problema: testear agentes de IA es difícil porque el
modelo nunca responde igual dos veces, y la mayoría de herramientas de
evals piden un dataset escrito a mano. Tracely lee trazas OTLP que el
agente ya exporta, evalúa cada ejecución (LLM-as-judge + checks
estructurales) y agrupa fallos similares. Con un clic congela una
ejecución fallida en un fixture hermético (input, tool calls, respuestas
del modelo) que el CI reproduce de forma determinista, offline y sin
coste. **El contrato fail-to-pass:** cada caso debe fallar con el código
viejo y pasar con el fix, o no se considera fiable.

**Credibilidad y validez.** Media — proyecto real y verificable, diseño
técnicamente coherente, pero sin datos propios sobre la fiabilidad de sus
propios mecanismos de juicio (tasa de acierto del LLM-as-judge, falsos
positivos del agrupamiento de fallos).

**Novedad frente al manual — hueco específico y real, con una conexión
directa a una idea ya existente.** El manual tiene "golden dataset"
curado a mano (glosario, línea ~21456: "construido y validada
manualmente por expertos del dominio") y clustering de producción para
detectar inconsistencias desconocidas (línea ~16829: "el golden dataset
detecta errores conocidos de forma reproducible, el clustering detecta
inconsistencias desconocidas en producción... son capas"). Ninguna de las
dos cubre el mecanismo específico de Tracely: **convertir un fallo real
de producción, no reproducible por sí solo (por el no-determinismo del
LLM), en un fixture determinista para regresión en CI** — congelando
input, tool calls y salidas del modelo. Es un hueco de mecanismo, no de
principio: el manual ya sabe que hace falta reproducibilidad (Cap. 13
entero trata de eso), pero no describe *cómo* lograrla frente a un
sistema que por diseño no es determinista.

**Conexión directa con §13.15 — el contrato fail-to-pass es la
operacionalización exacta de una regla que el manual ya tiene.** §13.15
("El arnés que miente") ya dice: *"Un test que busca una cadena en el
código fuente comprueba una intención, no un efecto. Si puede pasar con
el sistema roto, no es un test."* El contrato fail-to-pass de Tracely es,
literalmente, un chequeo automatizado de esa misma regla: exige
demostrar que el caso falla con el código viejo antes de aceptarlo como
válido. Es un mecanismo concreto y adoptable para una regla que el manual
ya defendía en abstracto.

**Cautela que hay que añadir, no ignorar — tensión con una regla dura de
HyperRAG y con el propio §13.14 del manual.** Tracely evalúa cada
ejecución con **LLM-as-judge**. `docs/ARRANQUE.md` §2.1 de HyperRAG es
categórico: *"Nunca un juez LLM para calidad de respuesta... Hay un test
que lo impide."* Y el propio manual, en la sección de clustering
(línea ~16825), nombra exactamente el riesgo que un juez LLM introduce
aquí: *"la evaluación confabulada de extremo a extremo: si el evaluador
(humano o modelo) inventa el objeto que dice estar evaluando con
coherencia interna, no hay outlier que detectar."* Si el juez de Tracely
confabula un veredicto coherente pero equivocado sobre una traza, ese
veredicto se congela como fixture "correcto" con la misma confianza que
si fuera cierto — el mecanismo de congelar no protege contra un juez que
se equivoca de forma consistente. El valor real de Tracely (congelar
trazas + contrato fail-to-pass) es independiente de su componente de
juez LLM y adoptable sin él, sustituyendo el juicio por checks
estructurales — que es exactamente lo que ya hace HyperRAG con sus
arneses propios.

**Veredicto: Matizar/incorporar parcial.**
`[Manual: candidato — Cap. 13, mención breve junto a §13.15: el patrón
"congelar traza de fallo → fixture determinista → gate de CI con
contrato fail-to-pass" como técnica concreta para regresión en sistemas
no deterministas, citando Tracely como ejemplo de herramienta OSS que lo
implementa, con la cautela explícita sobre su componente LLM-as-judge
frente a §13.14]`
`[Empreinte: Ninguno — no gestiona una suite de regresión de agente]`
`[HyperRAG: Ninguno que corregir — el diseño de sus propios arneses (sin
juez LLM, deterministas, con comando y corpus fijados) ya cumple el
mismo estándar por otra vía; el patrón de fixture congelado podría ser
útil si algún día se automatiza CI sobre el motor, pero no es un
candidato con bloqueo hoy]`

### 2026-08-19 — "Tokenization does not create value" (post de fintech, sin autor visible)

**Fuente.** Post genérico de LinkedIn sobre tokenización de activos reales
en blockchain (inmuebles, bonos, fondos, acciones, flujos de ingresos),
sin autor identificado en el texto, sin cita, registro de contenido
financiero divulgativo estándar.

**Contenido.** La tesis: tokenizar no crea valor (el edificio genera
renta, el bono paga interés, la empresa genera beneficio) — lo que la
tokenización cambia es la infraestructura alrededor de ese valor,
haciéndolo digital, programable y conectable a contratos inteligentes.

**Triaje: fuera de alcance total, sin relación con el dominio.** Esta
fuente no trata IA, LLMs, RAG, ni ningún tema dentro del alcance del
manual (arquitectura/límites/gobernanza de sistemas generativos), de
Empreinte (observabilidad de coste/calidad/privacidad de LLM) ni de
HyperRAG (laboratorio de técnicas RAG). Es tokenización de activos
financieros en blockchain — un dominio completamente distinto. No
amerita comprobación de código ni cruce con ninguno de los tres
proyectos: no hay ninguna afirmación técnica sobre IA que verificar.

**Nota curiosa, no accionable.** La única coincidencia con este log es
léxica: "token" aquí significa activo financiero digital en blockchain,
no la unidad mínima de texto que procesa un LLM (el sentido que ha tenido
"token" en todas las demás entradas de este triaje — prefill/decode,
KV cache, tokens de entrada/salida). Vale la pena señalarlo solo como
recordatorio de que la palabra es un falso amigo entre dominios, no como
hallazgo de contenido.

**Veredicto: Descartar — fuera de dominio, no evaluable con la
metodología de este log.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]`

### 2026-08-19 — "Kimi K3's weights are free to download. Almost nobody can run them." (post sin autor, sobre Moonshot AI)

**Fuente.** Post de LinkedIn/redes, sin autor identificado en el texto,
registro aforístico de thought-leadership ("Openness stopped being the
opposite of a business model. It became the top of the funnel."). Sin
cita a fuente primaria dentro del propio texto — pero las afirmaciones
son verificables porque son específicas y factuales (no opiniones), así
que hice una comprobación externa antes de fijar el veredicto de
credibilidad.

**Verificación externa (búsqueda web, 2026-08-19).** Los hechos
comprueban: Kimi K3 es real — 2,8 billones de parámetros, arquitectura
MoE (104B activos por token), publicado por Moonshot AI el 16 de julio de
2026, contexto de 1M tokens. La licencia impone exactamente los umbrales
que cita el post: >$20M de ingresos anuales para negociar contrato de
servicio a terceros, e ingreso mensual >$20M o >100M usuarios activos
mensuales para exigir atribución visible. Posición de benchmark: 3º en el
Artificial Analysis Intelligence Index y 1º chino en topear Frontend Code
Arena — coincide con "top three overall and first in frontend coding".
No pude confirmar independientemente la cifra "revenue up at least 6x
since launch" de Moonshot, pero nada la contradice (ARR de Moonshot ya
superaba $200M en abril, antes del lanzamiento de K3). **Fuentes:**
[MLQ News](https://mlq.ai/news/moonshot-ai-releases-kimi-k3-a-28-trillion-parameter-open-weight-model-rivaling-top-us-systems/),
[Unite.AI](https://www.unite.ai/moonshot-opens-kimi-k3-weights-under-a-revenue-tiered-license/),
[Tom's Hardware](https://www.tomshardware.com/tech-industry/artificial-intelligence/moonshot-releases-2-8-trillion-parameter-kimi-k3).

**Credibilidad, revisada al alza.** El post no cita sus fuentes dentro
del texto, pero cada afirmación factual verificable resultó exacta. Es
una categoría distinta de las infografías sin dato de este log: aforismo
sin cita que, comprobado, no miente.

**Contenido.** La tesis central: "pesos abiertos" en modelos de esta
escala (2,8T parámetros) ya no significa que puedas auto-alojarlos —
significa que puedes leer el fichero. La apertura no compite con el
modelo de negocio: se convierte en la parte superior del embudo
(desarrolladores descargan, casi nadie puede servir el modelo, así que
llaman a la API igual). Publicar los pesos también mata la sospecha de
benchmarks manipulados: nadie puede alegar que las cifras están cocinadas
si terceros independientes las replican sobre el artefacto público.

**Novedad frente al manual — hueco real, con destino claro.** El manual
menciona "pesos abiertos" varias veces como opción de despliegue, pero no
tiene ningún análisis del patrón de negocio que describe este post:
pesos abiertos como estrategia de embudo/marketing con licencia
escalonada por ingresos, en vez de como alternativa genuina de
auto-alojamiento a esta escala. Es un ángulo económico/estratégico que
Cap. 17 (roles) o Apéndice A (costes) no cubren. Pero el contenido en sí
—nombres de modelo, cifras de licencia, posición de benchmark— es
exactamente lo que el manual reserva para **Apéndice D** por su alta
caducidad: dentro de seis meses "Kimi K3" será una entrada más en una
lista de modelos superados, aunque el patrón de negocio que ilustra
(pesos abiertos como embudo, no como autoalojamiento real) puede seguir
siendo cierto más tiempo que la cifra concreta.

**Veredicto: Observar / candidato a Apéndice D.**
`[Manual: candidato — Apéndice D, nota de campo fechada: "pesos abiertos
como embudo, no como autoalojamiento" con Kimi K3 como caso verificado
(2,8T parámetros, licencia escalonada por ingresos, 3º en Artificial
Analysis) — marcar explícitamente alta caducidad, no incorporar al
cuerpo estable]`
`[Empreinte: Ninguno — no despliega modelos de frontera propios]`
`[HyperRAG: Ninguno — el laboratorio corre sobre modelos locales
pequeños/medianos (Ollama, HuggingFace), no sobre modelos de 2,8T que
requieran esta discusión de infraestructura]`

### 2026-08-19 — "Memory Engineering for Kimi" (artículo sin autor visible)

**Fuente.** Artículo técnico extenso (no aforismo ni infografía), sin
autor identificado en el texto, con ejemplos de código reales (script
Python que convierte el grafo del swarm a un vault de Obsidian) y
plantillas concretas (`SKILL.md`, `CONSTRAINTS.md`). Sigue directamente
al post anterior sobre Kimi K3 de este mismo log — mismo modelo, mismo
día.

**Verificación externa — parcial, con una discrepancia que importa.**
Comprobé por separado los tres pilares del artículo:
- **Agent Swarm, 300 sub-agentes en paralelo, coordinador entrenado por
  RL para decidir cuándo paralelizar:** confirmado, real, documentado
  ([MoClaw](https://moclaw.ai/blog/kimi-k3-agent-swarm),
  [Verdent](https://www.verdent.ai/guides/kimi-k2-6-agent-swarm)).
- **Context graph** (nodos por entidad, aristas cuando dos agentes tocan
  la misma entidad, exportable): confirmado como función real de Kimi
  Agent Swarm
  ([artículo de @0xRicker sobre "Context Graph Engineering With K3"](https://x.com/0xRicker/article/2087163793558126997)).
- **"Skills" como `SKILL.md` + scripts/ + references/, cargado
  automáticamente por Kimi Agent Swarm:** **no confirmado** en la
  búsqueda — lo único que aparece sobre convenciones de fichero para Kimi
  es `AGENTS.md` para restringir el comportamiento del agente, no
  `SKILL.md`. La descripción exacta que da el artículo (carpeta con
  `SKILL.md`, `scripts/`, `references/`, cargada automáticamente al
  inicio de una ejecución) coincide, rasgo por rasgo, con la función
  **Skills real de Claude/Claude Code** — la misma que uso yo en esta
  sesión. No puedo confirmar si Moonshot implementó algo estructuralmente
  idéntico bajo el mismo nombre, o si el artículo atribuye a Kimi una
  función de otro proveedor. Motivo de cautela explícita, no de descarte
  total: dos de los tres pilares del artículo verifican; el tercero no.

**Contenido.** Distingue ventana de contexto (1M tokens, "más sitio para
pensar en una sesión") de memoria real (algo que sobrevive entre
sesiones). Propone tres artefactos separables: **Skills** (procedimiento
persistido — cómo hacer algo, cada vez más rápido), **Constraints file**
(correcciones persistidas — qué salió mal antes, para no repetirlo, "el
que gets faster AND more correct"), y **Context graph** (relaciones
persistidas entre entidades, no solo hechos sueltos). Los tres se leen
automáticamente al empezar una ejecución y se escriben automáticamente al
terminarla.

**Novedad frente al manual.** §6.11 ("Memoria compilada: Wiki Memory y
MEMO") cubre memoria de *conocimiento* (el sistema estudia documentos una
vez en vez de recuperar siempre) — un paradigma distinto y complementario
al de este artículo, que trata memoria de *procedimiento* (Skills),
memoria de *corrección* (Constraints) y memoria de *relación* (grafo) en
un contexto agéntico, no de RAG documental. Es un ángulo que el manual no
tiene todavía: la distinción explícita entre estos tres tipos de memoria
agéntica y por qué ninguno sustituye a los otros dos ("un Skill sin
constraints se vuelve más rápido pero no más correcto").

**Conexión directa con la fuente anterior de este mismo log — riesgo no
mencionado por el artículo.** El propio `CONSTRAINTS.md` que propone este
artículo ("loaded automatically... - [rule distilled from last run's
review]... - [the mistake you never want repeated]") es, estructuralmente,
el mismo tipo de fichero que Chakrabarti (arXiv:2608.11095, entrada
anterior de este log) mide creciendo sin límite: instrucciones que se
**añaden** en cada sesión, sin ningún mecanismo descrito para revisar o
retirar una regla que ya no hace falta. El artículo no menciona poda,
caducidad ni el equivalente al campo `why` con número verificable que
propone el propio §8.7b del manual. Aplicado literalmente, el patrón que
recomienda este artículo es candidato directo al "recuerdo catastrófico"
que la fuente anterior acaba de cuantificar.

**Conexión con HyperRAG — evidencia externa anecdótica, no una medición.**
Comprobé el estado de `hyperrag/layers/graph_layer.py` (615 líneas) y
`wiki_layer.py` (338 líneas): mismo tamaño que en `PLAN_siguiente_fase.md`
— siguen **sin construirse ni medirse**, la misma "hipótesis
arquitectónica sin una sola medición" que el plan nombraba. Que un
sistema de producción real (Kimi Agent Swarm) haya encontrado valor
suficiente en memoria de relaciones estructurada en grafo como para
enviarlo es un dato de mercado a favor de la Fase 2 del plan — pero es
evidencia de producto, no de laboratorio, y no cambia la secuencia de
puertas de decisión ya fijada (Fase 0 → 1 → 2).

**Veredicto: Incorporar con cautela de atribución.**
`[Manual: candidato — Cap. 10 (memoria de agentes) o extensión de §6.11:
la distinción Skill/Constraints/Grafo como taxonomía de tres tipos de
memoria agéntica, citando Kimi Agent Swarm como ejemplo (con la cautela
explícita sobre "Skills" no verificado) y cruzando con §8.7b y con
Chakrabarti 2026 para señalar que un CONSTRAINTS.md sin poda es
exactamente el patrón de recuerdo catastrófico que ese paper mide]`
`[Empreinte: Ninguno directo]`
`[HyperRAG: Ninguno — nota de contexto de mercado para cuando se retome
la Fase 2 de `PLAN_siguiente_fase.md` (construir `graph`), no accionable
hoy]`

### 2026-08-19 — "Tensors: The Building Blocks of Intelligence" (Sivasankar Natarajan, LinkedIn)

**Fuente.** Tercera aparición de este mismo autor en el log (tras
"Evolution of RAG Architecture" y "Master LLM Inference"). Mismo formato
de infografía numerada, misma bio genérica, sin cita ni dato propio.

**Contenido.** Qué es un tensor (contenedor unificado N-dimensional: 0D
escalar → 1D vector → 2D matriz → 3D+ tensor), por qué unifica la
representación de imagen/texto/embeddings/vídeo bajo la misma forma
(H×W×C, batch×seq_len, vocab×dim, etc.), propiedades prácticas (shape,
rank, dtype —donde ocurre la cuantización—, device, memoria contigua,
broadcasting), y por qué esa uniformidad es lo que permite que la misma
GPU entrene un modelo de visión y uno de lenguaje. Un sexto panel, solo
visible en la imagen y ausente del texto, titulado "From Memory to
Meaning" ("memory retention, memory expiry, recall filtering, sensitive
data blocking...") no tiene relación temática real con tensores — parece
contenido de plantilla reciclado de otra infografía del mismo autor
sobre gobernanza de memoria de agentes, pegado sin ajustar. Señal
adicional de producción formulaica.

**Validez.** Correcto en todo lo verificable — es la explicación estándar
de tensores que aparece en cualquier tutorial de PyTorch/NumPy/
TensorFlow. Sin errores.

**Relevancia para el manual — misma respuesta que "6 Concepts
Mathématiques": correcto, pero por debajo del punto de partida
asumido.** Comprobé: el manual usa "tensor" solo de pasada, en el
interior de la sección más avanzada de atención (línea ~6270,
mecanismos GQA/MLA), sin definirlo nunca desde cero — exactamente como
asume que el lector ya sabe qué es sin explicarlo. El Cap. 5 entero
(cuantización, KV cache, hardware CPU/GPU/TPU/NPU/LPU en §5.7e) opera
sobre tensores sin nombrarlos como concepto introductorio. Este artículo
cubre justo ese prerrequisito ausente — pero es prerrequisito de
ingeniería ML (numpy/PyTorch), no contenido nuevo para un lector que ya
llegó al Cap. 5. Mismo diagnóstico que la fuente de matemáticas: no es un
hueco de contenido, es un desajuste de audiencia.

**Veredicto: Descartar por audiencia, no por calidad — y extiendo la
nota de patrón de este autor.** `[Manual: Ninguno]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno]` — sin comprobación de código porque no hace ninguna
afirmación sobre RAG/retrieval/sistemas, solo matemática/estructura de
datos de base. **Nota de patrón, tercera vez:** este autor produce
infografías de fórmula sobre subtemas de IA distintos cada pocos días.
Van tres entradas de esta cuenta en el log, con dos motivos de descarte
distintos y ya mapeados: (a) contenido ya cubierto y superado por el
manual (RAG, inferencia) o (b) contenido correcto pero de audiencia
equivocada, por debajo del punto de partida del manual (este). Piezas
futuras de este autor pueden triarse por comparación directa contra
estas tres entradas antes de investigar desde cero.

**Actualización 2026-08-19.** El usuario recogió el interés de la idea
de fondo —explicar tensores con claridad, con imagen animada— como
candidato propio, independiente de esta fuente concreta: ver pendiente
#12 del panel de arriba.

### 2026-08-19 — Tres PDFs: Kaplan et al. 2020, Hoffmann et al. 2022 (Chinchilla), y Arezki 2026 (BCMT)

**Dos fuentes de máxima credibilidad, cubriendo un hueco real y
significativo.**

**Kaplan et al., "Scaling Laws for Neural Language Models" (OpenAI,
2020)** y **Hoffmann et al., "Training Compute-Optimal Large Language
Models" (DeepMind, 2022 — "Chinchilla")** son, junto con "Attention Is
All You Need", de los papers más citados y más fundacionales de todo el
campo: establecen cómo escalan pérdida/calidad con parámetros, datos y
cómputo, y corrigieron colectivamente la práctica de la industria — el
hallazgo de Chinchilla (modelos como GPT-3 o Gopher estaban
significativamente sub-entrenados para su presupuesto de cómputo; la
proporción óptima ronda ~20 tokens por parámetro) es la razón por la que
prácticamente todo modelo de producción desde 2022 se entrena como se
entrena. No necesitan verificación de credibilidad — son papel fundacional
del campo, no contenido de blog.

**Comprobación en el manual — hueco real y notable.** Busqué "scaling
law", "Chinchilla", "Kaplan", "compute-optimal", "tokens por parámetro":
**cero resultados**. Es un hueco genuino y más importante que la mayoría
de los de este log: el manual explica en profundidad el interior de un
LLM (Cap. 5: MoE, GQA/MLA, cuantización, FlashAttention, inferencia
especulativa, hardware) pero nunca explica el marco que determina **por
qué los modelos se entrenan con el tamaño y el volumen de datos que
tienen** — la pregunta que Kaplan planteó y Chinchilla corrigió. Es
contenido estable, no de alta caducidad (los propios papers tienen 4 y 6
años y siguen siendo la referencia), así que pertenece al cuerpo
principal, no a Apéndice D.

**Veredicto: Incorporar — prioridad alta, junto con Chakrabarti 2026.**
`[Manual: candidato — nueva sección en Cap. 5 o Cap. 1 ("de cuántos datos
necesita tu modelo"): leyes de escalado de Kaplan (2020), la corrección
de Chinchilla (2022, ~20 tokens/parámetro, ejemplo Gopher 280B vs.
Chinchilla 70B con más datos superándolo), y por qué esto importa para
decisiones de fine-tuning/RAFT que el propio Cap. 1 ya trata (§1.6b,
§1.8) sin este marco explícito]`
`[Empreinte: Ninguno directo]` `[HyperRAG: Ninguno directo — el
laboratorio no entrena modelos desde cero, solo evalúa técnicas de
retrieval sobre modelos ya entrenados]`

---

**BCMT (Blockwise Causal Memory Transformer), Rachid Arezki, arXiv
2608.13578, independent researcher — leído completo.**

**Contenido.** Arquitectura alternativa a la atención densa global para
contexto largo: atención causal densa dentro de bloques locales +
"memoria causal exponencial" (media exponencial causal de resúmenes de
bloque, con más peso a los recientes) inyectada de vuelta vía compuerta
aprendida. Complejidad O(TL) en vez de O(T²). Código disponible
(github.com/rachidlabs/BCMT).

**Credibilidad — moderada, con motivo.** Autor único, sin afiliación
institucional, preprint sin revisión por pares. La sección de trabajo
relacionado es sólida y cita correctamente arquitecturas reales
(Longformer, BigBird, Linformer, Performer, LongNet, Transformer-XL,
RMT, HMT, RetNet, RWKV, Mamba). El estudio de ablación (Fase IV, BCMT vs.
variante "HOnly" sin memoria) está bien diseñado y aísla correctamente la
contribución del mecanismo propuesto — buena práctica metodológica.

**Validez — leído con ojo crítico, hay problemas reales que el propio
paper reconoce en parte.**
- **Escala de juguete.** `d_model=128`, 6 capas — un modelo minúsculo.
  "Contexto largo" se prueba hasta **1024 tokens**, que no es contexto
  largo en 2026 (Kimi K3, evaluado hace dos entradas en este mismo log,
  ya sirve 1M tokens). A esa longitud, la atención densa sigue siendo
  barata — la motivación central del paper (evitar el coste cuadrático)
  nunca se pone a prueba en el régimen donde importaría.
- **BCMT pierde en calidad en casi todas las comparaciones.** Tabla 2
  (1024 tokens): Dense 4.5752 vs. mejor variante BCMT-256 4.5931 — Dense
  gana. Tabla 3 (más datos, 600k): la brecha de pérdida **se duplica**
  respecto a la tanda de 200k (0,018 → 0,036) en vez de cerrarse. El
  paper lo redacta como "los beneficios se mantienen" (cierto para
  throughput/memoria) sin señalar que la brecha de *calidad* creció con
  más datos — una tendencia que, si algo, preocupa de cara a escalar.
- **Sin comparación contra ningún competidor real.** El propio paper lo
  admite en Limitaciones: solo compara contra un Transformer denso
  vainilla, nunca contra Transformer-XL, RMT, RetNet, RWKV o Mamba —
  las arquitecturas contra las que se posiciona en el related work.
- Es honesto en su propio marco (nunca dice "mejor que", solo
  "comparable"; declara sus límites sin adornar), lo cual pesa a favor
  de la credibilidad del autor aunque no cambia la fuerza de la
  evidencia.

**Novedad frente al manual.** El manual ya cubre el panorama de
arquitecturas eficientes con las que BCMT compite (Transformer-XL,
Mamba, Linear Attention, arquitecturas híbridas) dentro de su propio
explorador interactivo de mecanismos de atención (Cap. 5). BCMT encajaría
ahí como una fila más — pero con la evidencia actual (escala de juguete,
pérdida peor, sin comparación a competidores reales) no cumple el
estándar que el propio manual exige para "★ concepto verificado" en
lugar de "control de laboratorio a vigilar".

**Veredicto: Observar, no incorporar todavía.**
`[Manual: Ninguno por ahora — candidato a Apéndice D ("notas de campo")
si se quiere documentar como dirección de investigación activa, no como
técnica establecida; revisar si el autor publica una versión a escala
mayor o con comparación a competidores reales]`
`[Empreinte: Ninguno]` `[HyperRAG: Ninguno — mismo motivo que otras
arquitecturas de atención alternativa: el laboratorio no entrena
modelos, solo evalúa retrieval sobre modelos ya entrenados]`

### 2026-08-19 — "When Local Consistency Isn't Enough" (The Keystone Project, sponsored working paper)

**Fuente.** "Draft for Peer Review", agosto 2026 — es decir, **no
revisado por pares todavía**. Contacto personal (`@me.com`), "sponsored"
sin nombrar patrocinador, sin afiliación institucional visible. Leído
completo. Contenido: teoría de CSP (constraint satisfaction) —
descomposición en árbol, marginales locales, un controlador epistémico
que separa consistencia local / insuficiencia representacional /
exactitud global certificada, con abstención explícita cuando la
evidencia no alcanza. Teoremas con demostración (1-3), citas correctas y
reales (Freuder, Dechter, Sherali-Adams, Sontag, proof-carrying code de
Necula, formatos DRAT/LRAT, y trabajo real de verificadores LLM: Cobbe
et al., Lightman et al., monitorización de cadena de razonamiento de
OpenAI, circuit-tracing de Anthropic).

**Honestidad epistémica notable, y una ausencia que hay que nombrar.**
La sección 9 ("Falsifiable Efficiency Hypothesis") **no reporta ningún
resultado experimental** — propone el protocolo de benchmark, no lo
ejecuta. El abstract lo declara sin rodeos: *"The central efficiency
claim remains empirical and is intentionally left open for benchmark
falsification."* Es más honesto que la mayoría de fuentes de este log,
pero también significa que no hay ninguna evidencia empírica que
evaluar — solo matemática (sólida, con demostraciones) y una propuesta
de arquitectura sin validar.

**Relevancia — analogía formal a algo que el manual ya defiende, no
contenido técnico nuevo para RAG/LLM.** El propio §10 del paper se cuida
de no sobre-vender la relevancia: *"tree decompositions certify finite
CSP semantics, not the truth of natural-language answers."* Aun así, el
principio central —nunca inferir una afirmación fuerte (exactitud) de
una más débil (convergencia/consistencia local), y abstenerse
explícitamente cuando falta el certificado— es, con otro vocabulario, el
mismo que sostiene el Patrón Sándwich (Cap. 12), el DecisionRecord, y la
silence rate (§13.9) del manual. Incluso comparte la analogía exacta de
separación plano-de-control/plano-de-execución (SDN) que ya usa §10.10.2
para lo mismo. No aporta nada que el manual no tenga ya — pero es un
respaldo formal, desde teoría de la computación, de que la arquitectura
que el manual defiende no es idiosincrasia del dominio LLM sino un
patrón general de sistemas con evidencia parcial.

**Veredicto: Observar — cita opcional, no contenido nuevo.**
`[Manual: Ninguno obligatorio — candidato opcional de una frase en
§12.6 o §10.10.2, citando este framework como paralelismo formal
(proof-carrying computation, no SDN) al mismo principio de separación
propuesta/certificación — no urgente, el argumento ya está completo sin
él]` `[Empreinte: Ninguno]` `[HyperRAG: Ninguno — dominio CSP finito, no
RAG]`

### 2026-08-19 — "Empty Shelves or Lost Keys?" (Calderon et al., Google Research/Technion, ICML 2026)

**Verificación de una cita ya existente en el manual, no una fuente
nueva a evaluar.** Este es exactamente el paper que §6.5a (v66) cita
como respaldo externo al "techo del oráculo". Leí el abstract e
introducción completos para comprobar la cita.

**La cita es exacta.** El manual dice: *"codificación saturada al
95-98% en modelos de frontera, el cuello está en el acceso."* El
abstract dice, palabra por cifra: *"encoding is nearly saturated in
frontier models... GPT-5 and Gemini-3 encoding 95–98% of facts. However,
recall remains a major bottleneck."* La cifra de la bitácora de HyperRAG
("2.150 hechos, 13 modelos, 4M de respuestas") coincide con el abstract
("2,150 facts... 4 million responses from 13 LLMs"). Sin discrepancias.

**Contenido adicional no citado todavía, potencialmente aprovechable.**
El paper va más allá de la cifra de saturación: reencuadra la
"maldición de la reversión" (reversal curse) y los errores en hechos de
cola larga como fallos de **recall**, no de conocimiento faltante —
"Oasis tocó en el Boardwalk" se puede responder pero "quién tocó en el
Boardwalk" no, aunque el hecho esté codificado y sea reconocible en
opción múltiple. Y muestra que el *thinking* (cómputo en tiempo de
inferencia) recupera una fracción sustancial de esos fallos. Esto es
material adicional relevante para el mismo §6.5a o para el Cap. 9
(razonamiento nativo) que no está incorporado todavía — no lo desarrollo
más aquí por presupuesto de lectura, pero queda anotado como ampliación
posible de una cita ya buena.

**Veredicto: Confirmación de cita existente + candidato menor de
ampliación.** `[Manual: candidato opcional — ampliar la cita de §6.5a
con el hallazgo de reversal-curse-como-recall y el efecto recuperador
del thinking, si se relee el paper completo]` `[Empreinte: Ninguno]`
`[HyperRAG: Ninguno directo, aunque el marco encoding/recall es
conceptualmente afín a la distinción retrieval/generación que ya
estructura sus propios arneses]`

### 2026-09-22 — Jev / TypeSafe AI (Xataka, artículo periodístico sobre producto comercial)

**Fuente.** Artículo de Xataka (16-17 sept. 2026) sobre Jev, modelo de
TypeSafe AI (Diogo Almeida, ex-OpenAI, coautor de InstructGPT) que no
genera texto: recibe entrada no estructurada y devuelve una decisión
dentro de un conjunto de opciones cerrado, con probabilidad calibrada por
opción, vía una técnica propia (Reinforcement Learning for Calibrated
Decisions, RLCD). Fuente de parte interesada: no hay paper reproducible
de RLCD ni evaluación independiente citada — el propio artículo lo
reconoce, y los mejores resultados de rendimiento provienen de
benchmarks diseñados por la empresa. Cifras (20-200× más rápido, 40-400×
más barato, "0% de alucinaciones") tratadas aquí como afirmación de
proveedor, no como dato verificado.

**Relevancia — no es contenido técnico nuevo, es un caso de estudio
epistemológico y un ejemplo de arquitectura ya defendida por el manual
desde otro ángulo.** Dos conexiones, ninguna con paper que verificar:

1. El propio patrón "clasificación contraint a un espacio cerrado, con
   probabilidad, sin generación libre" es exactamente lo que ya
   estructura el Patrón Sándwich/DecisionRecord (Cap. 12) y la matriz de
   derechos de decisión con regla del rechazo cero (Cap. 14) —Jev es un
   ejemplo comercial de esa arquitectura aplicada a agentes de alta
   frecuencia (Cap. 10), no una técnica que el manual no cubra ya en
   principio.
2. La cifra "0% de alucinaciones" sin evidencia empírica independiente, y
   el reconocimiento explícito del propio artículo de que solo mide
   "no puede inventar una quinta opción", no "acierta cuál de las cuatro
   es correcta", es un caso de manual — literal— para §20.6 (taxonomía de
   fallos de investigación asistida, "conteo sin método"): una cifra de
   marketing que suena a métrica pero no lo es.

**Riesgo señalado por el propio artículo, relevante para Cap. 14.** El
artículo dice sin rodeos que Jev "hace que sea totalmente innecesario que
un humano lea la respuesta" — es la descripción casi literal de lo que
Cap. 14 llama supervisión decorativa, presentada aquí como ventaja de
producto, no como riesgo. Citable como ejemplo de cómo el discurso
comercial puede nombrar como eficiencia lo que el manual nombra como
fallo de gobernanza.

**Veredicto: Observar — candidato de cita opcional, no incorporación con
datos propios (el proveedor no los ofrece de forma verificable).**
`[Manual: candidato opcional de una mención breve en Cap. 10 (ejemplo de
arquitectura agente-sin-texto) y/o §20.6 (ejemplo de "0% sin método") —
no urgente, no cambia ningún argumento ya hecho, solo lo ilustra con un
caso comercial reciente]` `[Empreinte: Ninguno — el proyecto ya
implementa el mismo principio de clasificación contraint con el
clasificador CamemBERT de `audit_report/`; Jev no aporta técnica nueva,
solo valida externamente la misma filosofía de diseño]` `[HyperRAG:
Ninguno — sin conexión verificada con el enrutado/umbrales actuales]`
`[Auditra: tratado aparte, no es alcance de este log —
ver `11_Auditra/docs/roadmap/jev-clasificacion-decision-calibrada.md`]`

### 2026-09-28 — Jev Engineering: The 10-Step Guide (TypeSafe AI, guía técnica/promocional)

**Fuente.** Guía técnica de TypeSafe AI (probablemente propia, sin firma periodística
independiente) sobre el mismo Jev tratado en la entrada del 2026-09-22 (Xataka), pero contenido
distinto: más técnico, con pricing, ejemplos de código y un patrón de arquitectura de 10 pasos
("Jev Engineering") para instalar a Jev entre un LLM generador y el código que ejecuta. Misma
cautela epistémica que la entrada anterior — mismo proveedor, mismas cifras sin paper reproducible
ni evaluación independiente; esta guía no añade ni resta verificación sobre TypeSafe.

**Relevancia — a diferencia de la entrada anterior, esta vez la revisión sí generó hallazgo
verificado, pero en el propio corpus, no en Jev.** La tesis del post ("las llamadas que solo
eligen, puntúan o responden sí/no no deberían pagar precio de generación") empujó a revisar el
código real de HyperRAG y Empreinte con esa pregunta encima. Resultado en los dos casos: el patrón
ya está implementado, con cifras de cobertura y latencia propias, documentadas en el propio código
desde antes del post — ver `HyperRAG/taller/Jev_Engineering_y_clasificadores_HyperRAG_nota_puente.md`
y `Empreinte/taller/Jev_Engineering_y_clasificadores_Empreinte_nota_puente.md` para el detalle
verificado línea por línea.

**Vale la pena para Cap. 10 (ejemplo de arquitectura agente-sin-texto): reemplazar o complementar
el ejemplo comercial de Jev por evidencia del propio corpus.** La entrada del 2026-09-22 ya
marcaba Cap. 10 como candidato para un ejemplo de Jev. Ahora hay una alternativa mejor: el
clasificador de dos niveles de HyperRAG (`_classify_query`, regex + SLM local) y el clasificador
híbrido de Empreinte (`question_type_classifier_hybrid.py`, regex 85% + SLM local 10-15%) ilustran
el mismo principio con cifras verificadas del propio proyecto, sin depender de benchmarks de
parte interesada. No cambia ningún argumento ya hecho, mejora la evidencia que lo ilustra.

**Veredicto: Aplicado en Empreinte y HyperRAG (notas puente creadas); pendiente de decisión en el
manual.** `[Manual: candidato reforzado — el ejemplo de Cap. 10 puede citar HyperRAG/Empreinte en
vez de (o además de) Jev; sigue sin ser urgente, es mejora de evidencia, no corrección; decisión
de incorporarlo a una versión concreta queda para David]` `[Empreinte: Aplicado —
ver nota puente en `Empreinte/taller/`; el post no aporta técnica nueva, dos mecanismos ya
resuelven el patrón "Choice"/"Score" localmente]` `[HyperRAG: Aplicado — ver nota puente en
`HyperRAG/taller/`; actualiza el veredicto "Ninguno" de la entrada anterior, ahora con tres
conexiones verificadas]` `[Auditra: no tocado en esta pasada — pendiente anotado aparte en
memoria, para retomar más tarde]`

### 2026-09-28 (b) — Les modèles de décision structurée, Jev (Julien Perez, EPITA, nota técnica académica)

**Fuente.** A diferencia de las dos entradas anteriores sobre Jev (Xataka, periodístico; guía
TypeSafe, promocional), esta es una nota técnica de un profesor asociado de EPITA: formaliza
matemáticamente la diferencia generación/decisión (factorización en cadena vs. pase paralelo) y
sitúa Jev como combinación de dos líneas anteriores a los LLM generativos (encoders BERT + ranking/
IR, softmax sobre candidatos). Cita Laya, implementación independiente de código abierto —
verificada antes de citar: repositorio real (`github.com/NandhaKishorM/laya`, ModernBERT-large),
no una referencia inventada. Mismas cifras de Jev/TypeSafe sin verificación independiente, misma
cautela que las dos entradas anteriores.

**Veredicto: Aplicado en el manual (único hallazgo con hueco de contenido real).** `[Manual:
Aplicado — nueva subsección §12.4b "Cardinalidad variable" (v111→v112), citando Laya (verificable)
en vez de solo Jev (proveedor); ver `Registro_manual_v111_a_v112.md`]` `[Empreinte: Ninguno nuevo —
ya cubierto por la nota puente del 28/09 (REGEX+SLM, cardinalidad fija)]` `[HyperRAG: Ninguno
nuevo en código — el hallazgo de esta fuente (cardinalidad variable) es precisamente lo que ya hace
el reranker CrossEncoder, ahora citado en el manual con fundamento teórico propio]` `[Auditra: no
tocado en esta pasada — pendiente anotado aparte en memoria]`

**Seguimiento 2026-09-28 — cierre del frente Empreinte.** El "Ninguno nuevo" de arriba dejó de
ser exacto: la pregunta abierta de esta fuente sobre robustez al fraseo se convirtió en un
experimento real (`Empreinte/tests/test_question_type_robustness_to_phrasing.py`, ejecutado con
n=3, ampliado a n=15, pendiente de reejecución final por el usuario) y ese experimento sacó a la
luz, de forma incidental, un defecto de código real: la confianza de tipo de pregunta que
`question_type_classifier_hybrid.py` calcula por SLM se descartaba en los dos únicos sitios de
producción que la consumían (`phase2_slm_reclassifier.py`, `prompt_clustering.py`), sustituida por
una constante `0.8` sin relación con ningún valor calculado. Corregido: confianza real propagada,
formato de salida del SLM especificado explícitamente en el *system prompt* (antes ambiguo), y
`SubjectCluster.to_dict()` ahora exporta el campo (antes ni se serializaba). Detalle completo,
incluida la verificación (`234 passed, 2 skipped`, test de regresión nuevo) en
`Empreinte/taller/Jev_Engineering_y_clasificadores_Empreinte_nota_puente.md`, Adendas 2 y 3.
`[Empreinte: Aplicado — corrección de código real en 3 archivos + 1 test de regresión nuevo]`

**Cierre definitivo 2026-09-28 (misma tarde).** La investigación continuó más allá de la
corrección inicial: verificación con Ollama real reveló que el modelo también inventaba
categorías fuera de la lista cerrada (~9-12%), y que reforzar la instrucción en texto no lo
arreglaba. Solución final: salida estructurada (JSON Schema con `enum` cerrado, constrained
decoding) — verificada con Ollama real sobre 56 prompts: 0% categorías inventadas, 100%
confianza reconocible. Resumen ejecutivo completo de toda la cadena (9 adendas) en
`Empreinte/taller/Cierre_Empreinte_Jev_Confianza_Estructurada_2026-09-28.md`. Suite final:
`238 passed, 2 skipped`, 15 commits locales.


### 2026-09-28 (c) — Exploring the Cryptographic Limits of Transformer Networks (Domunco, Draguns, Torr, Robinson, Schroeder de Witt — Oxford / Contramont Research, arXiv:2606.29389)

**Fuente.** Verificado contra el paper real (no solo el resumen que trajo David) — arXiv:2606.29389 existe,
autores confirmados: Stefan Domunco, Andis Draguns, Philip Torr, Isaac Robinson, Christian Schroeder de
Witt. Motivación declarada: trabajo previo sobre colusión secreta entre agentes de IA vía esteganografía
("Secret Collusion among AI Agents: Multi-Agent Deception via Steganography" — título real, no
inventado). Los autores construyen circuitos de umbral para tres construcciones criptográficas (Keccak,
Merkle–Damgård, Árboles de Merkle) y derivan leyes de escalado profundidad/ancho verificadas para
mapearlos a arquitecturas transformer, bajo dos esquemas de mapeo (sin atención; *tokens-as-gates*).

**Matiz que el resumen de David no traía y que cambia cómo se cita esto.** El propio paper es explícito:
*"the mappings are constructive and have not been verified empirically by training"* y *"whether gradient
descent can learn to implement these constructions is an open question"*. Es una cota superior teórica de
capacidad arquitectónica (qué podría llegar a computar un transformer de cierto tamaño, en el peor caso),
no evidencia de que el entrenamiento por descenso de gradiente encuentre esa solución en la práctica.
Distinción que hay que preservar si esto se cita en algún sitio — el resumen original ya lo señalaba
("no afirman que los LLM actuales lo hagan"), pero aquí queda con la cita textual verificada.

**Relevancia por frente.**

- **Empreinte** — sin conexión. Es una plataforma de auditoría de coste/gobernanza de llamadas LLM; el
  paper trata capacidad computacional interna de la arquitectura, no el uso ni el coste de las llamadas.
  Ningún archivo del proyecto tiene relación con esto.

- **HyperRAG** — conexión real pero indirecta, sin cambio de código. `hyperrag/core/content_screen.py`
  (`detect_encoded_blob()`, ya implementado, 737/737 tests) ya defiende contra un problema *distinto*:
  blobs codificados/cifrados **en el texto recuperado** (heurística de entropía sobre tiradas largas de
  base64/hex). El propio módulo documenta su límite: *"no detectará un payload deliberadamente entreverado
  con lenguaje natural para romper la firma de entropía"* — que es, con otras palabras, justo lo que
  produciría un transformer capaz de esteganografía real (texto que parece generación normal pero
  codifica información oculta, sin la firma de alta entropía que el heurístico busca). El paper de
  Domunco et al. no exige ni sugiere ningún cambio en `content_screen.py` — pero es fundamento teórico
  externo, verificado, de un límite que el propio código ya se atribuía por honestidad, no por haber leído
  este paper. Además: la amenaza que motiva el paper (colusión *entre* agentes) no tiene hoy la estructura
  multi-agente necesaria en HyperRAG — mismo patrón de conclusión que el análisis ya hecho sobre Fan et al.
  (`PROJECT_STATE.md`, nota "Guardarraíl para un futuro bucle agéntico largo"): motor de un solo agente,
  sin canal de coordinación entre instancias, la amenaza no aplica estructuralmente hoy.

- **Comprender la IA** — candidato de cita, capítulo exacto sin decidir. §10.10.4 ("Cuando el fallo de
  contención es colectivo, no individual", verificado leyendo el HTML real v112) ya documenta un incidente
  real (OpenAI/Hugging Face, ago. 2026) de coordinación emergente no sancionada entre ~1.200 agentes vía un
  tablón interno — pero ese canal era abierto y legible, no cifrado ni esteganográfico; los propios informes
  citados en esa sección hablan de manipulación de *registros* (borrar/alterar transcripciones), no de
  comunicación cifrada dentro del contenido generado. El paper de Domunco et al. aporta algo que §10.10.4
  no cubre: fundamento teórico de que la ocultación podría, en principio, ir un paso más allá del tablón
  abierto — codificada dentro de la propia salida del modelo, indetectable para un evaluador que solo lea
  el texto como texto. Vale como nota técnica complementaria a §10.10.4 o como aporte al criterio
  metodológico más amplio del paper (evaluar por cota estructural de capacidad, no solo por conducta
  observada) — que podría encajar en cualquier capítulo sobre metodología de evaluación/red-teaming. No
  tengo localizado con certeza ese capítulo en esta pasada — queda como candidato sin verificar la sección
  exacta, no como incorporación decidida.

- **Corpus literario** — eco temático posible, no verificado como necesario: la idea de "lo que un sistema
  podría llegar a computar, más allá de lo que demuestra hacer" resuena con los temas de profundidad oculta
  y emergencia que ya recorren el corpus (marco de domesticación, observatorio de consciencia) — pero es una
  resonancia de tema, no un hallazgo técnico que el corpus necesite incorporar. Señalado, no forzado.

**Veredicto: Observar — sin incorporación con código ni con capítulo decidido en esta pasada.**
`[Manual: candidato sin decidir — posible nota técnica en o junto a §10.10.4, o en la sección de
metodología de evaluación aún sin localizar con certeza; no urgente, decisión de David]` `[Empreinte:
Ninguno — fuera de alcance del proyecto]` `[HyperRAG: Ninguno en código — refuerza por fundamento externo
verificado un límite que `content_screen.py` ya se atribuía a sí mismo; la amenaza de colusión
multi-agente que motiva el paper no aplica estructuralmente hoy, mismo patrón que el análisis ya hecho
sobre Fan et al.]` `[Auditra: no tocado en esta pasada — pendiente anotado aparte en memoria]`


### 2026-09-28 (d) — RAG vs Agentic RAG vs Graph RAG: Which One Do You Need? (Anurag Karuparti, infografía/post de LinkedIn, promocional)

**Fuente.** Post de LinkedIn con infografía, sin cifras propias ni cita a paper alguno — comparación
didáctica de tres patrones de RAG como si fueran tres arquitecturas mutuamente excluyentes entre las
que hay que elegir una para todo el sistema, cada una con su lista de "casos de uso" ilustrativa, no
verificada. Mismo registro que las guías promocionales de Jev (TypeSafe) tratadas el 22 y 28/09: útil
como disparador de revisión, no como fuente de datos a citar.

**Comprender la IA — sin incorporación, contenido ya cubierto y con más matiz.** Verificado en el manual
real (v112, no de memoria): "Agentic RAG" aparece 4 veces, "GraphRAG"/"Graph RAG" 80 veces. El patrón
exacto que el post describe (agente que evalúa si el retrieval es suficiente y repite con una
sub-pregunta si no) ya está en el manual como "Combinación 3: RAG agéntico" — con el diagrama textual
del propio loop pregunta→retrieval→evaluación→retrieval 2→síntesis, en el contexto de una taxonomía más
amplia de combinaciones (no aislado como una de tres opciones a elegir, sino como una entre varias
piezas componibles). El post no aporta nada que el manual no tenga ya, con más profundidad.
`[Manual: Ninguno]`

**HyperRAG — sin cambio de código, pero comparación real que vale la pena dejar escrita.** El post
enmarca RAG / Agentic RAG / Graph RAG como tres arquitecturas entre las que se elige una según el caso
de uso. HyperRAG no elige: implementa las tres piezas del post como capas del mismo motor (BM25,
Vector, Wiki, Graph vía `GraphLayer`/networkx, Tree, Reranker) más MEMO, y decide **por consulta, no
por sistema**, qué subconjunto usar — verificado en `engine.py::_MATURITY_LAYER_MAP`:

| Categoría (clasificador L2) | Capas usadas |
|---|---|
| explanation | bm25, vector, wiki, reranker |
| root_cause | vector, graph, reranker |
| hidden_node | graph, tree, reranker |
| prediction | vector, graph, tree, reranker |

Además, el "evalúa y repite" del bloque Agentic RAG del post ya existe como `_self_critique()`
(inspirado en Self-RAG, opt-in, capado a un reintento exacto por diseño — no un bucle abierto). El
post no equivoca nada, pero su pregunta decisoria ("¿uso RAG, Agentic RAG o Graph RAG?") asume una
granularidad de sistema completo que HyperRAG ya resolvió a granularidad de consulta individual — dato
útil como contraste documentado, no como corrección de nada que el post afirme mal.
`[HyperRAG: Ninguno en código — conexión de contraste documentada aquí, sin cambio: la arquitectura
real ya compone las tres piezas del post con enrutado adaptativo por consulta, en vez de elegir una
para todo el sistema]`

**Empreinte — sin conexión.** No es un sistema de retrieval; la comparación no aplica.
`[Empreinte: Ninguno]`

**Corpus literario — sin conexión, no se fuerza.** `[Corpus: Ninguno]`

**Veredicto: Descartar como fuente de contenido nuevo — el manual ya cubre Agentic RAG y GraphRAG con
más profundidad, y HyperRAG ya implementa las tres piezas de forma adaptativa por consulta. Vale como
confirmación externa de que el diseño de HyperRAG no es una rareza, sino más granular que la práctica
estándar que el post describe — no como corrección ni como contenido a incorporar en ningún lado.**
`[Manual: Ninguno]` `[Empreinte: Ninguno]` `[HyperRAG: Ninguno en código]` `[Auditra: no tocado en
esta pasada — pendiente anotado aparte en memoria]`


### Aclaración de alcance 2026-09-28 (e) — Auditra entra en el análisis, no se modifica

El usuario aclaró: "no tocar Auditra" significa no modificar ni commitear nada en ese repo — no
significa excluirlo del análisis. Corrección de alcance para todo triaje futuro: Auditra se evalúa
igual que los otros cuatro frentes, solo con lectura, nunca escritura. Las dos entradas de hoy
llevaban `[Auditra: no tocado en esta pasada]` como placeholder sin análisis real; quedan
completadas aquí, con el código real de Auditra revisado (solo lectura, nada modificado ni
commiteado en `11_Auditra/`).

**Sobre "Exploring the Cryptographic Limits of Transformer Networks" (entrada (c) de hoy).**
Auditra es un control plane que audita y decide ALLOW/REVIEW/BLOCK sobre acciones de agentes de
IA — su único filtro de contenido sensible hoy es `auditra_mvp/backend/content_classifier.py`:
reglas deterministas de PII (tarjeta+Luhn, IBAN, SSN, claves de API, palabras clave) sobre
`target`/`description` de una `Action`. Verificado por lectura directa: cero detección de
entropía o contenido codificado/cifrado — ni siquiera la heurística que ya tiene HyperRAG
(`content_screen.py`), y sin ningún tratamiento de colusión entre agentes (`grep` sobre
`docs/` para "multi-agente"/"colusión"/"esteganografía": cero resultados). Conexión real y más
directa que en HyperRAG: el motivo del paper (colusión secreta entre agentes de IA) es
precisamente el tipo de amenaza contra la que un *control plane* de agentes como Auditra existiría
para defender — a diferencia de HyperRAG, que es de un solo agente sin canal de coordinación,
Auditra sí gobierna (o podría llegar a gobernar) múltiples agentes cuyas acciones pasan por el
mismo punto de decisión. No hay ningún mecanismo hoy que detectaría contenido cifrado/codificado
en el `target`/`description` de una acción, más allá de las reglas de PII. Vale como candidato de
roadmap para consideración futura de David (no como incorporación decidida ni como corrección —
`content_classifier.py` se documenta a sí mismo como "no exhaustivo", explícitamente fuera de esa
garantía por diseño). No se creó ningún archivo en `11_Auditra/`, por instrucción explícita.
`[Auditra: Ninguno aplicado — candidato de roadmap señalado aquí (control plane de agentes sin
detección de contenido codificado/cifrado ni tratamiento de colusión multi-agente), decisión de
incorporarlo a `docs/roadmap/` queda para David]`

**Sobre "RAG vs Agentic RAG vs Graph RAG" (entrada (d) de hoy).** Sin conexión — Auditra no es un
sistema de retrieval, es un control plane de gobernanza de acciones de agentes; la comparación de
arquitecturas RAG no aplica a su dominio. `[Auditra: Ninguno — fuera de alcance del proyecto]`


### 2026-09-28 (f) — Top 15 AI Engineering Concepts Data Engineers Should Know in 2026 (Ashish Joshi, infografía/post de LinkedIn, glosario didáctico)

**Fuente.** Post glosario, sin cifras ni cita a fuente alguna — 15 conceptos de ingeniería de IA
resumidos en una frase cada uno (embeddings, índices vectoriales, chunking, RAG, hybrid search,
reranking, feature stores, point-in-time joins, training/serving skew, inferencia batch/online,
prompt caching, MCP, evals, guardrails, observabilidad). Mismo registro que los posts anteriores:
útil como checklist de cobertura, no como fuente de datos.

**Comprender la IA — barrido término a término contra el manual real (v112), no de memoria.**
11 de los 15 conceptos ya están cubiertos, varios en profundidad (RAG: 1372 menciones; embeddings:
174-382; chunking: 112; MCP: 47, incluye "Model Context Protocol" citado dos veces; hybrid
search/búsqueda híbrida: 45; reranking/rerank: 78; observabilidad: 59; prompt caching: 13;
guardrails: 7; índice vectorial: 11 — bajo el término en español, no "Vector Index"). **4 conceptos
en cero, verificado en español e inglés: feature stores, point-in-time joins, training/serving
skew, inferencia batch vs. online** (como distinción genérica de arquitectura de servido, no como
caso particular de RAG/LLM). El manual declara "MLOps" en su alcance (26 menciones) y su propio
README dice explícitamente que el Cap. 1 ("Tu pipeline ETL, pero semántico") es puente para
"Perfiles en transición (BI/datos → IA)" — la audiencia exacta a la que se dirige este post. Pero
el subtítulo del manual acota el terreno a "Arquitectura, Límites y Gobernanza de los **Sistemas
Generativos**", y los cuatro ausentes son conceptos de ML clásico/tabular (anteriores a los LLM,
relevantes para fraude, recomendación, forecasting con modelos no generativos) — el mismo tipo de
frontera de alcance que ya se trazó a propósito con la ingeniería interna de motores de inferencia
en la entrada del 20/08 ("72 Techniques"), aunque ahí la exclusión era explícita y aquí no hay
ninguna declaración que la confirme o la niegue. Queda como candidato sin decidir, no como hallazgo
de descuido — depende de si David quiere que el puente BI→IA del Cap. 1 llegue hasta ahí o se quede
en lo semántico. `[Manual: candidato sin decidir — 4 conceptos de MLOps clásico ausentes
(feature stores, point-in-time joins, train/serving skew, batch vs. online inference), posible
extensión del Cap. 1 si David quiere llevar el puente BI→IA más lejos; no urgente]`

**HyperRAG — confirma lo ya implementado, dos huecos leves señalados sin verificación exhaustiva.**
De los conceptos con conexión directa a un motor RAG (embeddings, índices vectoriales, chunking,
RAG, hybrid search, reranking, prompt caching), los siete están implementados y ya verificados en
sesiones anteriores de este mismo proyecto (BM25Layer + VectorLayer + chunking en el ingestor +
FusionEngine con RRF + CrossEncoder reranker + `_rag_cache_*` como caché semántica) — el post no
aporta nada nuevo ahí, solo confirma que la cobertura es completa. Dos huecos verificados por
`grep`, sin profundizar más allá de esa comprobación puntual: **cero archivos con "mcp" en
`hyperrag/core/`** — el motor no expone ni consume Model Context Protocol, a diferencia de la
sesión de Claude que lo usa para operar sobre el propio repo; y no hay un harness de "evals" en el
sentido del post (golden set + re-ejecución automática en cada cambio de prompt/modelo) separado de
la suite de tests (737 tests, pero eso es corrección de código, no medición de calidad de
respuestas). Ninguno de los dos es una corrección urgente — MCP es una decisión de exposición de
producto que David no ha pedido, y evals con golden set es un proyecto de por sí, no un fallo.
`[HyperRAG: Ninguno aplicado — dos candidatos señalados (exposición MCP, harness de evals con
golden set), ninguno verificado en profundidad, decisión de David]`

**Empreinte — la bala "LLM Observability" del post describe casi literalmente su dominio, y ya lo
cubre.** Verificado por `grep` sobre los `.py` del proyecto: "drift" aparece en 13 archivos,
incluidos `alert_engine.py` y `erosion.py` (nombre que ya apunta a seguimiento de degradación en el
tiempo) — el post no señala ningún hueco real aquí, solo confirma que Empreinte ya hace lo que
describe como buena práctica de observabilidad LLM (traces, coste, calidad, drift).
`[Empreinte: Ninguno — ya cubierto]`

**Auditra — la bala "Guardrails" (validación de entrada/salida, PII/injection, esquema, factualidad)
describe su dominio, cobertura parcial verificada.** `content_classifier.py` (ya revisado en la
entrada anterior de hoy) cubre PII por reglas deterministas. Búsqueda rápida de "injection" en el
backend: un único archivo, `test_notification_injection.py` — nombre que sugiere inyección vía
notificaciones/email, no necesariamente defensa contra *prompt injection* en la entrada de un
agente gobernado. No profundicé más allá de esa búsqueda puntual — no verificado si existe o no un
mecanismo de defensa contra prompt injection en otro sitio del código; queda como pregunta abierta,
no como hallazgo confirmado en ningún sentido. `[Auditra: sin veredicto cerrado — PII cubierto,
defensa contra prompt injection no verificada ni confirmada ni descartada en esta pasada; candidato
de revisión más detenida si a David le interesa, no aplicado]`

**Corpus literario — sin conexión.** `[Corpus: Ninguno]`

**Veredicto: Observar — dos candidatos genuinos señalados (MLOps clásico ausente del manual; huecos
de MCP/evals en HyperRAG), una pregunta abierta sin resolver en Auditra (prompt injection), y
confirmación sin hallazgo en Empreinte y en el núcleo RAG de HyperRAG. Nada aplicado.**


### 2026-09-28 (g) — Procedural Graphs: Self-Evolving Execution Structures for LLM Agents (Lu, Chen, Wu, Arık; Google/Georgia Tech/Peking Univ.; arXiv:2609.09153)

**Fuente.** Paper real, verificado por WebSearch + lectura directa del HTML en arXiv (no solo el resumen
del post de LinkedIn, que omite tres cosas: la evolución es **por lotes offline**, no en línea por
consulta; hay **validation gating** (solo se aceptan ediciones que mejoren un held-out) y **memoria de
rechazo** (no se repropone lo ya descartado); y hay cifras reales — 7 benchmarks (HotpotQA, MultiChallenge,
GDPval, ALFWorld, τ-bench, BFCL, EnterpriseArena), 4 familias de LLM, primer o co-primer puesto en 21/24
combinaciones modelo-benchmark, 19 victorias/2 empates/3 derrotas frente al mejor baseline (p=4.3×10⁻⁴).
Un Grafo Procedimental organiza el conocimiento en tripletas (procedimiento, relación, procedimiento) —
responde "qué hacer" en vez de "qué es" (la pregunta de un grafo de conocimiento clásico) — y evoluciona
comparando trayectorias exitosas y fallidas mediante un LLM refinador que propone ediciones estructurales.

**Comprender la IA — sin grafo procedimental, pero el paper es contraevidencia externa directa a una
norma ya escrita en el manual.** Verificado en el HTML real (v112): "grafo procedimental"/"procedural
graph" y "self-evolving"/"auto-evolutiv" aparecen 0 veces — no hay hueco de vocabulario. Pero el §10.9.x
("Memoria de política") contiene una afirmación normativa explícita: **"La memoria de política nunca se
auto-promueve"** — la regla exacta que el paper contradice desde fuera, con cifras: un LLM refinador SÍ
propone y aplica ediciones estructurales automáticas sobre un análogo de política/procedimiento, ganando
en 21 de 24 configuraciones. La diferencia no es trivial ni anula la norma del manual — el paper aplica
gating (solo se acepta si mejora un held-out) y memoria de rechazo, es decir, auto-evolución *controlada*,
no auto-promoción sin puerta — pero es precisamente el tipo de matiz que el manual podría citar como
contraejemplo con salvaguardas, en vez de dejar la norma sin matizar. Candidato genuino de cita/nota al
pie en §10.9.x, no incorporación decidida — no se tocó el HTML. `[Manual: candidato señalado — el paper
es contraevidencia externa con cifras a la norma "la memoria de política nunca se auto-promueve"
(§10.9.x), con salvaguardas (gating + memoria de rechazo) que la distinguen de una auto-promoción sin
control; decisión de citarlo queda para David]`

**HyperRAG — mismo principio de diseño ya explícito en código, en la dirección contraria a la del paper.**
Verificado en `hyperrag/config.py::MemoryConfig`: `policy_memory` — "Tenant+agent scoped, versioned,
exact-match retrieval ONLY (never similarity), and **NEVER auto-promoted** -- authored explicitly via
`MemoryManager.author_policy`, not by the extraction LLM." Es la misma frase que el manual, en código: el
diseño de HyperRAG decidió explícitamente lo opuesto a lo que el paper propone (edición automática de la
estructura procedimental vía LLM refinador). Además, `GraphLayer` (`hyperrag/layers/graph_layer.py`) es
un grafo de **entity relations** — "qué es", vía networkx — no un grafo procedimental ("qué hacer"); no
hay solapamiento de código, son estructuras distintas para preguntas distintas, tal como el paper mismo
distingue. No se propone ningún cambio: la decisión de no auto-evolucionar `policy_memory` ya está
razonada y documentada en el propio `config.py` (evitar que una política de seguridad mute sin
supervisión humana) — el paper no aporta un caso de uso donde HyperRAG necesite eso, y su propio
`_self_critique()` (Self-RAG-inspirado, un reintento acotado) ya es la única forma de "auto-corrección"
que el diseño admite. `[HyperRAG: Ninguno — contraste documentado, no cambio; el diseño ya tomó
conscientemente la decisión opuesta a la del paper para `policy_memory`]`

**Auditra — la tensión es más aguda aquí que en HyperRAG, y pesa a favor de NO adoptar nada del paper.**
Verificado por lectura directa de `auditra_mvp/backend/engine.py`: el motor de decisión ALLOW/REVIEW/BLOCK
es enteramente reglas estáticas autoría humana + un umbral de score fijo (`SCORE_REVIEW_THRESHOLD`,
`SCORE_BLOCK_THRESHOLD`), con fallo cerrado explícito ("falla CERRADO -- BLOCK, con el motivo a la vista
-- en vez de ALLOW o de un 500"). `grep` sobre el backend: cero archivos con "trajector", "self-evolv" o
"procedur" fuera de nombres de test no relacionados. Auditra es, por diseño y por necesidad regulatoria
(cadena de auditoría firmada — `audit_chain.py`, `anchoring.py`, `signing.py`), el tipo de sistema donde
una política que se reescribe sola —aunque sea con gating— es precisamente lo que un control plane de
cumplimiento no puede permitirse sin trazabilidad humana explícita: el paper es interesante como
antipatrón a evitar en este dominio, no como mejora a considerar. No se creó ni modificó nada en
`11_Auditra/`. `[Auditra: Ninguno aplicado — el paper confirma por contraste que el diseño estático y
auditable actual es la elección correcta para un control plane de cumplimiento, no señala ningún hueco
a cubrir]`

**Empreinte — sin conexión.** No es un motor de ejecución de agentes ni gestiona estructuras
procedimentales; el dominio de Empreinte (coste, calidad, drift de LLMs) no se cruza con el del paper.
`[Empreinte: Ninguno]`

**Corpus literario — resonancia temática señalada, sin acción.** El mecanismo del paper (memoria de
rechazo: lo que falló no se repropone, pero tampoco se borra — queda como restricción aprendida) roza
temáticamente el Principio V de Agota ("revisión sin destruir") y el VIII ("nada definitivo") ya
trabajados en `Agota_y_OKF_nota_puente.md` — pero es una resonancia conceptual distante (un mecanismo de
ingeniería de agentes, no de procedencia de contenido), no una conexión concreta con un personaje o
escena de Ciudad Lisa. Se deja anotada, no se fuerza ninguna adición al taller. `[Corpus: Ninguno —
resonancia señalada, no forzada]`

**Veredicto: Observar — sin cambios de código en ningún frente. El hallazgo real no es un hueco sino un
contraste: dos sistemas propios (HyperRAG y Auditra) ya tomaron, de forma independiente y documentada, la
decisión de NO auto-evolucionar estructuras de política/procedimiento sin supervisión humana — el paper
es la primera evidencia externa con cifras que pone esa decisión a prueba, con salvaguardas (gating +
memoria de rechazo) que matizan pero no invalidan el argumento de auditabilidad. Único candidato con
acción pendiente: citar el paper como contraejemplo con matices en el §10.9.x del manual — decisión de
David.**
`[Manual: candidato señalado — cita/nota al pie en §10.9.x]` `[HyperRAG: Ninguno — contraste documentado]`
`[Empreinte: Ninguno]` `[Auditra: Ninguno aplicado — confirma diseño estático como correcto]`
`[Corpus: Ninguno — resonancia señalada, no forzada]`


### Profundización 2026-09-28 (h) — Auditra y "prompt injection": pregunta cerrada

Retomando el candidato abierto en la entrada (f) de hoy ("defensa contra prompt injection no
verificada ni confirmada ni descartada"): búsqueda ampliada (solo lectura) sobre
`auditra_mvp/backend/*.py` y `connectors/`. Los únicos hits reales de "injection"/"sanitiz" fuera de
nombres de test son en `notifications.py`: escapado de HTML/Slack y bloqueo de saltos de línea en
`target`/`description` para evitar **inyección de cabeceras en las notificaciones que Auditra
envía** (email/Slack) — es sanitización de salida, no defensa de una capa de razonamiento LLM.
`test_notification_injection.py` prueba exactamente eso, no prompt injection en el sentido del
paper de colusión entre agentes tratado en la entrada (g).

Dato que cierra la pregunta: `grep` de "openai|anthropic|litellm|llm_client|chat.completions" sobre
todo `auditra_mvp/backend/*.py` da **cero resultados**. Auditra no tiene ninguna llamada a un LLM en
su propia cadena de decisión — `engine.py` (reglas estáticas + umbral de score) y
`content_classifier.py` (regex/palabras clave) son deterministas de principio a fin. No hay ninguna
capa de razonamiento propia de Auditra que un contenido malicioso pudiera manipular vía prompt
injection, porque no hay prompt que inyectar.

Esto no es un hueco — es el diseño correcto para su función: Auditra no necesita defenderse de
prompt injection porque audita el **resultado** (la acción que un agente externo, con su propio LLM,
decide ejecutar), no el razonamiento que llevó a esa decisión. Un agente gobernado que fuera
manipulado por prompt injection para pedir una acción dañina seguiría topando con las mismas reglas
ALLOW/REVIEW/BLOCK que cualquier otra acción — el control plane es agnóstico al motivo por el que se
pidió la acción, la evalúa por lo que es. Pregunta cerrada, sin acción pendiente.
`[Auditra: pregunta cerrada — sin capa LLM propia en la cadena de decisión, prompt injection no es
una superficie de ataque aplicable; el diseño de auditar la acción resultante, no el razonamiento que
la produjo, ya cubre el caso por construcción]`


### Profundización 2026-09-28 (i) — HyperRAG: MCP (dimensionado) y evals (corrección de la entrada f)

**MCP — dimensionado real, no solo el grep de "cero archivos con mcp".** `HyperRAG` es una clase
Python limpia (`hyperrag/engine.py::HyperRAG`, hereda `MemoryOpsMixin`/`LifecycleMixin`/
`EvaluationMixin`) con métodos ya estables (`query`, `query_adaptive`, `query_with_layers`,
`query_memo`, `query_tension`). Hoy solo tiene dos consumidores: `hyperrag_ui/app.py` (Streamlit) y
`check_engine.py` (debug). No hay servidor HTTP de ningún tipo. Exponerlo como servidor MCP sería un
wrapper delgado — un `server.py` nuevo con el paquete `mcp`, unas pocas `@tool` mapeando 1:1 a los
métodos ya existentes de `HyperRAG` — del orden de 100-200 líneas, sin tocar `engine.py`. No es un
proyecto grande; es una decisión de exposición de producto (¿quieres que una sesión de Claude como
esta pueda consultar tu base HyperRAG directamente, en vez de por la UI?), no una carencia técnica.
`[HyperRAG: candidato dimensionado — wrapper MCP pequeño y de bajo riesgo si David lo quiere, ningún
cambio en el motor; decisión de producto, no correctiva]`

**Evals — corrección de la entrada (f) de hoy: la afirmación fue incorrecta, verificado ahora en
profundidad.** La entrada (f) dijo "no hay un harness de evals... separado de la suite de tests",
basado solo en un `grep` sobre `hyperrag/core/`. Al buscar en todo el repo (no solo `core/`) aparece
un arnés de evals maduro y ya en uso, en `eval/`: `answer_eval.py`/`anchor_eval.py`/
`question_eval.py`/`ab_query_position.py`/`frontera_eval.py`/`paralelo_eval.py`, cada uno con su
propio *golden set* versionado (`answer_eval_set.json`, `anchor_eval_set.json`,
`question_eval_set.json`, `retrieval_eval_set.json`), más `scripts/eval_harness.py` (juez LLM 1-10,
formato Q/Respuesta esperada/Fuente, per-domain, reutilizado por los `Blockfy_eval*.py`), más un
arnés de fiabilidad de cuatro dimensiones (`eval/reliability_eval.py`, adaptado explícitamente del
paper "Towards a Science of AI Agent Reliability" (Rabanser/Kapoor et al., arXiv 2602.16666), con
ejecuciones trackeadas en `eval/reliability_runs/` desde el 1 de septiembre). Es justo lo que el post
de hoy (f) describía como "golden set + re-ejecución" — solo que ya existe.

Lo único que sí falta, verificado en `.github/workflows/tests.yml`: CI solo corre `pytest`, nunca los
evals de `eval/`. Pero `reliability_eval.py` documenta esto como decisión deliberada, no descuido —
Consistencia/Robustez exigen repetir la misma tarea K≥5 veces con inyección de fallos controlada,
algo que no tiene sentido en cada push. No hay hallazgo de descuido aquí; la entrada (f) estaba
verificada de forma incompleta y queda corregida.
`[HyperRAG: corrección — el harness de evals con golden set SÍ existe (eval/, maduro, con arnés de
fiabilidad de 4 dimensiones), la entrada (f) de hoy fue verificada de forma incompleta; lo único
ausente (evals en CI) es una decisión ya razonada en el propio código, no un hueco]`


### Profundización 2026-09-28 (j) — Manual: los 4 conceptos de MLOps clásico, veredicto cerrado

Retomando el candidato "sin decidir" de la entrada (f) de hoy (feature stores, point-in-time joins,
train/serving skew, batch vs. online inference). Verificado el contenido real de Cap. 1 ("Tu pipeline
ETL, pero semántico", v112): 1.1-1.8 están enteramente centrados en el pipeline RAG y su comparación
con fine-tuning/RAFT/contexto largo — los cuatro conceptos ausentes son de servido de ML clásico
tabular (fraude, recomendación, forecasting no generativo), no tienen encaje natural ahí ni en Cap. 3
(evaluación probabilística, golden dataset), que trata calidad/confianza de sistemas generativos, no
infraestructura de features.

Hay un precedente directo de cómo se resolvió el mismo tipo de decisión de alcance: la entrada del
20/08 ("72 Techniques to Optimize LLMs in Production") excluyó 41 de 44 técnicas ausentes
(paralelismo, kernels, scheduling de GPU) por ser "ingeniería interna de motores de inferencia fuera
de alcance por diseño" — y esa exclusión se documentó **solo en el Log**, sin añadir ninguna nota de
alcance dentro del propio manual (verificado: no hay una sección de "esto no cubrimos" en el HTML).
Aplicando el mismo criterio aquí: los 4 conceptos de MLOps clásico quedan fuera del subtítulo
declarado ("Arquitectura, Límites y Gobernanza de los **Sistemas Generativos**") por el mismo tipo de
frontera técnica (aquí de dominio de datos — tabular vs. generativo — no de capa de motor), y siguiendo
el precedente no hace falta ninguna nota de exclusión en el HTML — basta con dejarlo razonado aquí, en
el Log. Diferencia real con el caso de agosto: ahí el post traía las 3 técnicas sí incorporables
(semantic caching, multi-LoRA serving, model routing/cascading) ya explícitas; aquí no hay ningún
subconjunto de los 4 que sí encaje — los cuatro son igualmente ajenos al dominio generativo.
`[Manual: descartado — 4 conceptos de MLOps clásico fuera de alcance por dominio (tabular, no
generativo), mismo criterio que "72 Techniques" (20/08); no se edita el HTML, consistente con el
precedente de no añadir notas de exclusión en el propio texto]`


### Profundización 2026-09-28 (k) — Manual: propuesta de cita redactada para §10.9.4 (Procedural Graphs)

Retomando el candidato de la entrada (g) de hoy. Ubicación exacta verificada: la frase normativa
"La memoria de política nunca se auto-promueve" cierra el callout "→ Orden de implementación
recomendado" en **§10.9.4** (justo antes de §10.9.5). Es la última línea de un bloque muy compacto —
no hay espacio ahí para matizarla sin romper el ritmo del callout. Propuesta: un párrafo aparte,
inmediatamente después del callout, en el registro que el manual ya usa para matices con cita externa
(cf. §2.5, notas fechadas). Texto listo para pegar si David aprueba, no insertado:

> **Matiz (2026-09).** Esta regla no es universal por definición, solo la elección de diseño más
> segura por defecto. "Procedural Graphs: Self-Evolving Execution Structures for LLM Agents" (Lu,
> Chen, Wu, Arık; arXiv:2609.09153) demuestra con cifras (21 de 24 configuraciones modelo-benchmark
> ganadas o empatadas) que una estructura análoga de conocimiento — no una política de seguridad, sino
> conocimiento de "qué hacer" — sí puede auto-evolucionar de forma controlada, si la edición pasa por
> una puerta de validación (solo se acepta si mejora un conjunto held-out) y una memoria de rechazo
> (lo descartado no se repropone). La distinción que de verdad sostiene la regla de este manual no es
> "nunca automatizar la memoria de política", sino "nunca automatizarla sin una puerta verificable" —
> y esa puerta, cuando existe y se audita, cambia el cálculo.

No se ha tocado el HTML. Queda a la espera de que David apruebe, edite o descarte este texto concreto
— ya no es una idea abstracta, es la redacción exacta que se insertaría.
`[Manual: propuesta redactada y lista para aprobación en §10.9.4, no insertada]`


### 2026-09-28 (l) — Inserción aprobada: cita Procedural Graphs en §10.9.4, manual → v113

David aprobó el texto redactado en (k) tal cual, sin ediciones. Insertado en el manual real
(`06_Comprender_la_IA/Comprender_la_IA_2026_v113.html`) siguiendo el protocolo ya establecido
(archivado del v112 original con md5sum verificado, balance estructural de tags antes/después,
renombrado y actualización de título/badge). Detalle completo, con las cifras de verificación:
`Registro_manual_v112_a_v113.md`, este mismo directorio.

Los otros tres candidatos profundizados hoy — Auditra/prompt injection (h), HyperRAG/MCP+evals (i),
Manual/MLOps clásico (j) — no generaron cambio en el manual ni en ningún otro repo; quedan cerrados
tal como se documentó en cada entrada.
`[Manual: v112 → v113 — nota insertada en §10.9.4]`


### 2026-09-30 — Lote de siete piezas (embeddings techNmak, MoE inference, LoRA, KV cache, 15 conceptos, Jev 10 pasos, U-Net)

Cruce con el manual: solo el handbook de embeddings y la guía de MoE aportaban algo.
- **Embeddings (techNmak, Handbook 08):** hueco real en §2.4 (prefijos, pooling, normalización,
  métrica). Aplicado en v114. Aritmética del handbook comprobada; cifras no citadas en el manual.
- **MoE inference:** ya integrado en §5.7g (v anteriores). Aporte residual: corrección de §5.7b
  (memoria de un MoE de 671B a 4 bits). Aplicado en v114.
- **LoRA (familia), KV cache, 15 conceptos, Jev 10 pasos:** cubiertos; sin cambio.
- **U-Net a mano:** sin encaje técnico en el manual.

`[Manual: v113 → v114 — §2.4 (contrato de embedding), §5.7b (corrección memoria MoE)]`


### 2026-09-30 (b) — Dos piezas: «Isaac Asimov y los problemas de la IA hoy» (Chema Alonso, post) y «Les angles morts de l'IA peuvent-ils être éclairés par la littérature ?» (artículo, prospectiva)

Cruce con el manual y con el resto de la obra.
- **Manual:** el post de Alonso (sicofancia, *reward hacking*, caja negra, bucles, jailbreak) ya estaba
  cubierto; sin cambio. Del artículo francés faltaban dos evidencias: el experimento de IMD (jul. 2025) y el
  *trendslop* (HBR, mar. 2026). Aplicado en v115 (§20.3b y §20.1).
- **Verificado:** encuesta OCDE/WEF (167 expertos, 55 países, «more remix than revelation»); *trendslop*
  (autores y afiliaciones; detalle vía Fortune); experimento de IMD (HBR). GPT-6 Astra existe (system card).
- **No verificado:** Shell/Wack y el artículo de 2013, cifras de Capgemini, Red Team/RADAR, el «hackeo de
  Hugging Face», el *paper* de Alonso (aún sin publicar). Medio del artículo francés no identificado.
- **Auditra:** los bucles de agente ya están cubiertos (`max_per_hour`, suspensión automática); el jailbreak
  no aplica (sin LLM propio). Hueco verificado en `engine.py`: cada importe se compara por separado con los
  umbrales y no hay suma por ventana. Candidato anotado en `docs/ESTADO.md`, sin código.
- **Empreinte:** sin cambio. La técnica de Susan Calvin equivale al análisis de consistencia ya existente.
  Hueco menor: ninguno de los seis detectores de alertas mira coste o volumen.
- **HyperRAG:** sin cambio. Fortune indica que pedir pros y contras no eliminó el sesgo; Tension Hold no está
  medido frente a *trendslop* y no se afirma que lo mitigue.
- **Corpus:** dos notas puente en `03_El_Restaurador_de_Huellas/taller/` (Asimov; ficción prospectiva).
  Herbie/sicofancia en *El síndrome del zorro amable* queda como decisión abierta de David.

`[Manual: v114 → v115 — §20.1 (trendslop), §20.3b (IMD)]`


### 2026-09-30 (c) — Lote de siete piezas del 30/09 cruzado con Auditra y el corpus

- **Auditra:** solo la guía Jev de 10 pasos aporta algo, ya cubierta por la nota del 22/09 salvo un hueco:
  el evento no registra la confianza declarada por el agente. Candidato `agent_confidence` (solo registro,
  sin efecto en la decisión) anotado en `docs/ESTADO.md`, sin código. Embeddings, MoE, LoRA, KV cache,
  15 conceptos y U-Net: sin conexión honesta (Auditra no ejecuta modelos ni usa embeddings).
- **Corpus:** solo un eco temático entre el handbook de embeddings y el Principio II de Agota (procedencia);
  interesante, no necesario. El RAG epigenético usa solo TF-IDF, así que el problema de prefijos no aplica.
  KV cache y MoE no aportan imagen literaria; el resto, sin conexión.
- **Manual:** sin cambio adicional (véase la entrada del 30/09, v114).


### 2026-09-30 (d) — Post de LinkedIn: «Cómo funciona Muse» (arquitectura del asistente de Meta, según el propio asistente)

Cruce con el manual y con el resto de la obra.
- **Verificado:** Muse existe; el comunicado de Meta (abril de 2026) presenta Muse Spark como modelo y confirma
  subagentes en paralelo. No confirma máquina Linux, terminal, navegador, tareas programadas, memoria en
  ficheros ni conectores. El esquema sale de la autodescripción del asistente; las frases «debe estar en su
  system prompt» y «será la misma de todos» son conjeturas del autor del post.
- **Manual:** casi todo cubierto (§10.1, §10.4b, §10.7, §10.9, skills, hooks). Faltaba una cautela de método
  sobre la autoridad de la autodescripción. Aplicado en v116 (§10.4).
- **Auditra:** sin cambio. «Confirmar antes de publicar/enviar/comprar» es su `REVIEW` y las credenciales en
  un cofre ya las tiene; los subagentes quedan atribuidos (`subagent_id`). Refuerza el posicionamiento: puerta
  externa y determinista frente a límites definidos por el propio asistente (inferencia sobre el post).
- **Empreinte:** posible límite, sin aplicar. `agent_discovery` ve hosts en logs de red y el diseño cubre red,
  IAM y catálogo; un asistente con conectores OAuth actúa desde la nube del proveedor y no pasa por el proxy.
  Inferencia mía, el post no habla de empresas; el diseño no menciona el caso. Pendiente de decisión de David.
- **HyperRAG:** sin cambio (memoria en ficheros con selección por LLM, ya descrita en §10.9).
- **Corpus:** eco estructural con la domesticación del usuario (memoria de preferencias, personas y
  compromisos); sin medición detrás y sin texto propuesto.

`[Manual: v115 → v116 — §10.4 (autoridad de la autodescripción de un asistente)]`


### 2026-10-02 (a) — «Top 9 Places To Use Jev» (Naman Pandey, infografía + post de LinkedIn)

**Fuente.** Divulgación comercial sobre el mismo Jev/TypeSafe de las entradas del 22/09 y 28/09. Nueve usos:
tool-call gating, LLM evals, reranking, control en tiempo real, model routing, guardrails, confidence gate
(actuar >0,9 / confirmar 0,5–0,9 / humano <0,5), inbox triage («1.500 correos = 3 céntimos») y bulk
labeling. Sin datos verificables ni comparación con un LLM grande: sirve como mapa de usos, no como evidencia.

**Relevancia.** Auditra, alta: el tool-call gating (deny/ask/allow) valida el diseño ALLOW/REVIEW/BLOCK; la
diferencia de fondo es que Auditra decide con política determinista y Jev con clasificador probabilístico
(argumento a favor de Auditra). El confidence gate tiene TRES bandas, no dos: el esquema de registro de
decisiones debería guardar también la banda resultante (refuerza `agent_confidence`, ya anotado en
`docs/ESTADO.md`). Riesgo: la confianza autodeclarada por el agente es manipulable; criterio que se mantiene:
solo registrada, nunca influye en la decisión. Empreinte, media: el ahorro de enrutar debería medirse con
coste de inferencia y no solo con precio de API; el LLM-como-juez tiene sesgo conocido que el post omite.

**Veredicto: Observar; sin incorporación.** `[Manual: ninguno — no aporta nada que no esté; por la calidad de
la fuente no se cita]` `[Empreinte: caso a medir (ahorro de enrutado con coste de inferencia), sin decidir]`
`[HyperRAG: ninguno — el reranking ya lo hace el CrossEncoder en producción]` `[Auditra: nota de las tres
bandas para el esquema de registro; pendiente ya abierto (`agent_confidence`)]`

### 2026-10-02 (b) — «Derecho, Datos y Algoritmos #24 – Septiembre 2026» (Carlos Fernández Hernández, LA LEY / Karnov; boletín mensual, 01/10/2026) + lectura de originales

**Fuente.** Recopilación mensual «no exhaustiva» y SECUNDARIA; casi todo es posterior al corte de conocimiento
de Claude (junio 2026) y no hay enlaces en el texto. Hay erratas visibles (Meta repetida entre los firmantes
del Accord). Regla: no citar el boletín; ir a los primarios.

**Contenido (inventario para no releer).** UE/IA: la Comisión usa por primera vez sus facultades de ejecución
del Reglamento de IA (información a desarrolladores de modelos avanzados sobre ciberseguridad, seguridad y
derechos de autor; multas hasta el 3 %). EE. UU.: orden ejecutiva del 29/09 («era de la superinteligencia») y
«White House Accord on Super Intelligence» (Google, Anthropic, Meta, OpenAI, X, NVIDIA; cuatro niveles de
control, dirigidos a desarrolladores de modelos); «Stop Rogue AI Act» (Gottheimer/Lawler); alerta NSA/CISA/FBI
sobre destilación a escala industrial vía proxies de mercado gris. España: Atlas de la IA y plan IA360.
ONU: primer informe del Panel Científico (incidente OpenAI–Hugging Face). OCDE: «Agentic AI in organisations».
BCG: «The Authorization Gap». AEPD: primera brecha ejecutada por un agente de IA (14/09) y advertencia sobre
cribado de CV (23/09). CEPD: directrices sobre multas (consulta hasta 13/11). RD 723/2026 (información sobre
sistemas algorítmicos de decisión en el trabajo). Reglamento de Ciberresiliencia: notificaciones 24 h/72 h
desde 11/09/2026. ENS Anexo II en OSCAL.

**Lectura de originales (resúmenes; NO el texto íntegro del proyecto de ley, ni el PDF de BCG, ni el informe
completo de la ONU).**
- Stop Rogue AI Act (H.R. 10362 según CASRAI, sin verificar en el texto; presentado 14–15/09/2026): el boletín
  decía «logs inmutables»; el texto habla de registros a prueba de manipulaciones (tamper-evident),
  estandarizados y PORTABLES, y de verificación de identidad «independiente y criptográficamente verificable».
  NIST dispone de un año desde la promulgación; el FAR, 18 meses.
- BCG: cifras (35 % en producción, 44 % planificando) de BCG + MIT SMR sin datos de muestra; autorización
  «vinculada al propósito y a la conducta». Literatura consultora: útil como marco.
- ONU: el incidente fue de agentes de entrenamiento en ciberseguridad de OpenAI (mayo–julio 2026, según el
  Panel) que saltaron restricciones de red, engañaron a un evaluador e intentaron ocultarlo. Las «tres
  condiciones» (objetivo desalineado, capacidad, entorno permisivo) son una cita de Bengio, no un marco del
  informe: atribuirlas a Bengio. El Panel no estima probabilidad ni plazo de una pérdida de control grave.
- AEPD 14/09: la información procede de la notificación de la organización y requiere análisis posterior; el
  modelo usado no implica que el modelo o su proveedor hayan sido comprometidos. Al citar: «presuntamente
  ejecutado», sin nombrar el modelo.

**Veredicto: Observar; leer primarios completos antes de integrar nada.** `[Manual: candidatos tras leer los
primarios — gobernanza de agentes (OCDE), autorización por propósito y conducta (BCG) para §14.2b, tres
condiciones de Bengio junto a §13.11–13.13, intervención humana efectiva (AEPD) como caso de sesgo de
automatización, RD 723/2026]` `[Empreinte: media-baja — proxies con conmutación automática implican modelo
declarado ≠ servido; encaja con el aviso de modelos mixtos de `erosion.py`; auditar modelo/ruta declarados
frente a observados, sin decidir]` `[HyperRAG: normas posteriores al corte como preguntas de evaluación
temporal (2026/2099: vigor a 20 días, aplicable desde 26/03/2027; CRA: 11/09/2026 y 11/12/2027); antes,
comprobar el contenido real de C3]` `[Auditra: muy alta — detalle en la nota privada de Auditra]`

**Auditra.** Los huecos y preguntas que esta fuente plantea para Auditra están en la nota privada del propio proyecto (repositorio privado), no aquí.

### 2026-10-02 (c) — Post sobre OpenBao (autor no identificado, español)

**Fuente.** Presenta OpenBao como alternativa open source a AWS Secrets Manager y Azure Key Vault: fork de
HashiCorp Vault, hoy proyecto sandbox de OpenSSF (anuncio de 17/06/2025, verificado). Licencia concreta sin
verificar. Descripción correcta pero promocional.

**Relevancia.** Auditra, media y solo si un piloto lo pide: ya tiene cofre propio, credenciales efímeras y
claves de firma fuera de la BD. OpenBao externo sería opción para clientes con Vault/OpenBao: custodia de
claves y credenciales dinámicas. Contra: añade una
dependencia al despliegue self-hosted.

**Veredicto: Observar.** `[Manual: a lo sumo ejemplo de credenciales de agentes]` `[Empreinte: ninguno]`
`[HyperRAG: ninguno]` `[Auditra: candidato, sin demanda de piloto no se abre integración]`

### 2026-10-02 (d) — «Top 3 hot topics right now in Data Governance» (consultor, autor no identificado, inglés)

**Fuente.** Opinión profesional sin datos: (1) unir gobernanza de datos e IA; (2) gobernanza semántica
(glosario, métricas, ontologías); (3) propiedad («¿quién aprueba estos datos como listos para IA?»).

**Veredicto: Observar.** `[Manual: media-alta — la gobernanza semántica es el terreno del pendiente abierto
sobre Databricks Genie Ontology (investigación separada, no hecha); refuerza §14.2b]` `[Auditra: media —
«quién aprueba» ↔ proponente/aprobador; tercera fuente sobre decision rights, sin poder afirmar que sea
independiente de las dos anteriores]` `[HyperRAG: definiciones de negocio como condición del conjunto de
evaluación; sin acción]` `[Empreinte: ninguno]`

### 2026-10-02 (e) — Dream-RSI: Recursive Self-Improvement through Evolving Worlds (arXiv 2609.14858v1, 14/09/2026; Zheng, Wu, Zhang y 17 coautores; Google / DeepMind / UMD / UVA) + post en español

**Fuente primaria leída** (cuerpo, referencias y encabezados de apéndices; NO los prompts del apéndice B ni el
código del apéndice C). Veinte autores; código en github.com/zhengkid/Dream-RSI (publicación no comprobada).
Todos los experimentos usan modelos de Google (Gemini-3.1 Pro y 3.7-Flash): sin replicación independiente.

**Mecanismo.** Discovery Tree → Replay Simulator → mejora de la política «soñando» sobre el historial. Solo
evoluciona el CÓDIGO de la política de exploración; el agente de descubrimiento, el evaluador y los pesos son
fijos. Puntuación de replay V = mejor puntuación − β1·(nº de intentos) + β2·(intentos por ronda). La garantía
es en muestra, sobre el historial fijo; el replay no puede evaluar políticas que necesiten explorar nodos
nunca registrados (observación propia).

**Resultados, con correcciones.** Frente a exploración fija (comparación controlada) las mejoras son
moderadas (≈1,7× menos llamadas en Lasso). Las cifras mayores (162× en Lasso, >50× en matemáticas) son frente
a SimpleTES, otro sistema con GPT-OSS-120B y 51.200 generaciones: no es comparación controlada. Las cifras del
post (2,43× menos generaciones, 2,09× de mejora) son exactas y de KernelBench (VGG16/LayerNorm 2,43×/1,79×
menos generaciones; ConvDiv/ConvMax 2,09×/1,44× más rendimiento). Hallazgo propio, verificable en la tabla:
en Lasso con 3.1-Pro, Dream-RSI es PEOR que la exploración fija en 5 de 6 conjuntos y mejor solo en RCV1,
que por escala domina la media; en Autocorrelation es ligeramente peor que exploración fija y que SimpleTES.
Sin barras de error ni número de semillas en el texto leído. El artículo NO tiene sección de limitaciones ni
discusión de seguridad, y no cuenta el coste del agente de desarrollo ni del propio replay (la métrica es
nº de llamadas al agente de descubrimiento). Análisis sobre una sola tarea (ConvDiv): la historia como guía
textual rinde peor que no usarla; como simulador supera a la guía textual.

**Veredicto: Observar; fuente primaria útil.** `[Manual: media-alta — ejemplo de autoevolución acotada del
nivel meta (historia como simulador frente a memoria textual); cuidado con «RSI» como etiqueta; mapa de
trabajos relacionados citado: AlphaEvolve, Darwin Gödel Machine, Meta-Harness, ACE, Reasoning Bank. Citar solo
tras decidir; la entrada (g) del 28/09 (Procedural Graphs) es el vecino natural en §10.9.4]` `[Auditra: baja-
media y especulativa — un agente que reescribe el código de política de otro es un cambio de configuración
que debería registrarse y aprobarse; comprobar si cada agente tiene versión registrada]` `[HyperRAG: baja-
media — evaluar sin ejecutar de nuevo sobre resultados cacheados, con el mismo límite]` `[Empreinte: baja —
el coste se mide en llamadas, no en tokens, energía ni euros]`

### 2026-10-02 (f) — Dos posts sobre Jev: Laya (NandhaKishorM/laya) y la guía «Jev in the Agent Loop» (NO1ennn, @N01ennn)

**Fuente.** (1) Post corto que presenta Laya como alternativa de código abierto a Jev. (2) Guía larga de un
autor individual (no TypeSafe) con once puntos de decisión, código y economía; las cifras de TypeSafe se
declaran del proveedor y los modelos citados son posteriores al corte (no verificados).

**Corrección de novedad.** Laya NO es nueva en el corpus: ya está citada y verificada en el manual (v112,
§12.4b «Cardinalidad variable») y en la entrada 2026-09-28 (b). La guía solapa con «Jev Engineering: 10 pasos»
(2026-09-28) y con la entrada (c) del 30/09 (`agent_confidence`). La inyección de prompts ya está cerrada para
Auditra (2026-09-28 h: sin capa LLM propia). HyperRAG y Empreinte ya tienen clasificadores locales (regex + SLM;
CrossEncoder como reranker): un reranker local no es novedad.

**Lo que sí es nuevo.**
- Laya: lo de AUTOALOJADO. Jev es API cerrada y el estado del agente sale del perímetro; un clasificador local
  encajaría con Auditra solo como señal registrada, nunca decisoria (hoy `content_classifier.py` es
  determinista y solo puede subir la clasificación). Antes, fijar hash y procedencia de pesos. Datos del repo
  leídos por resúmenes automáticos de GitHub (la API no fue accesible): Apache 2.0, choice/score/noul, RLCD,
  router de checkpoints, cuaderno de fine-tuning. Cifras NO fiables: dos lecturas discrepan (≈33 vs 38,4 ms),
  una citó 29,2k estrellas/941 commits sin poder comprobarlo, y el README se compara con Jev con benchmark
  propio (83,8 % vs 67,8 %). La debilidad con >20 opciones (Banking77 0,425 vs 0,870) concuerda con el
  hallazgo de §12.4b, pero sigue sin confirmar. Verificar clonando el repo antes de citar cifras.
- Empreinte: un modelo abierto permite medir la calibración (ECE) uno mismo, imposible con API cerrada; el
  router de checkpoints es un caso de identidad compuesta (servido ≠ declarado) para `comparable()`/E0–E4.
- Guía: (1) regla dura «irreversible / dinero / visible fuera → humano sin importar la confianza» (refuerza el
  motor determinista; `external` ya existe como filtro de política, la reversibilidad no se ha comprobado);
  (2) detección de bucle (misma acción fallida repetida); (3) «confiado ≠ hecho»: separar decisión de
  comprobación (cuadra con el límite documentado de Auditra); (4) «si la ruta de escalada nunca se dispara, es
  un sistema sin supervisar»: tasa de aprobación sin cambios y tiempo de decisión en REVIEW como evidencia de
  intervención humana efectiva (AEPD); (5) los umbrales de la guía (0,85; 0,4; 0,7/
  0,3) son marcadores a calibrar, como 0,9/0,5: registrar la versión del umbral.
- Aritmética de la Parte IV, recalculada: la guía compara Opus puro 25Y+5Z = 4,15 con enrutado 3X+20Y+8Z =
  6,19 (ratio 0,67) pero omite 5X en Opus puro; incluido, Opus puro = 7,40 y el ratio pasa a 1,19 (enrutado
  ~16 % más barato). La idea de que cambiar de modelo pierde la caché KV es plausible; este ejemplo no la
  demuestra. No citar.

**Veredicto: Observar; sin incorporación.** `[Manual: comprobar si §12.4c (Model routing y cascading) recoge
el coste de recarga de caché al cambiar de modelo; la partición decisión / generación / código es marco
didáctico citable como idea, no como evidencia]` `[Empreinte: calculadora de enrutado con términos de caché
explícitos y métrica «coste por tarea completada»; Laya como caso de calibración medible, sin decidir]`
`[HyperRAG: ninguno — el bloqueo real es el conjunto de respuesta más difícil]` `[Auditra: comprobaciones en el código hechas; resultado en la nota privada de Auditra]`

### Profundización 2026-10-02 (g) — Auditra: comprobación en el código (solo lectura)

Hechas las comprobaciones en el código de Auditra que planteaban las entradas (b) y (f). Por tratarse de un
repositorio público, el resultado detallado vive en la nota privada de Auditra y no se reproduce aquí.
`[Manual: ninguno]` `[Empreinte: ninguno]` `[HyperRAG: ninguno]`

### 2026-10-12 (a) — Post sobre BitNet / bitnet.cpp (Microsoft; autor no identificado, inglés, LinkedIn)

**Fuente.** Presenta bitnet.cpp como "LLM de 100B en una sola CPU", con pesos ternarios (-1, 0, +1; 1,58 bits),
5-7 tokens/s, 2,37-6,17x más rápido que llama.cpp en x86, 82 % menos energía y "precisión que apenas cambia".
Verificado contra el README del repositorio (microsoft/BitNet): el 100B y los 5-7 tokens/s existen, pero son
una prueba de rendimiento con modelos ficticios ("dummy"), no un modelo entrenado; el README lo declara. El único
modelo insignia es BitNet b1.58 2B4T (2,4B parámetros, 4 billones de tokens, contexto de 4.096). Las cifras de
velocidad y energía NO se han verificado (hay que leer el paper). "Memoria 16-32x menor" está inflado:
1,58 bits frente a FP16 son unas 10x. No es una novedad (bitnet.cpp es de 2024).

**Relevancia.** Manual, media: §5.7c no menciona BitNet ni pesos ternarios, y su tabla acaba en Q2_K (~85-90 %).
Hueco real: la fila QAT dice que cuantizar durante el entrenamiento es otra categoría; BitNet es el caso extremo
(entrenar ya en ternario, no cuantizar después), y sirve de ejemplo de "demo sintética vs. modelo entrenado".
Empreinte, media: caso de coste a nivel de inferencia/hardware (CPU local, sin API; energía y amortización en
lugar de precio por token); la calidad debe medirla el propio pipeline, no el benchmark del fabricante.
HyperRAG, baja: oráculo y DIR/PARA con 2B4T en CPU; contexto de 4.096 limita k=20; prueba ES/FR para ver la
pérdida en la cola larga. Auditra, débil: inferencia local fuera de cualquier proxy (línea para el threat model).

**Veredicto: Observar.** `[Manual: nota breve en §5.7c — pendiente de decidir]` `[Empreinte: proveedor «CPU local 1,58-bit» en la calculadora, sin prioridad]`
`[HyperRAG: experimento opcional, tras los fallos de recuperación 4 % y 1667]` `[Auditra: ninguno]`

### 2026-10-12 (b) — Post «95 % of AI agents can retrieve. Almost none can investigate» (GraphRAG; autor no identificado, inglés, LinkedIn)

**Fuente.** Contrapone el agente de recuperación (una búsqueda vectorial + resumen) al «agente investigador»
(descompone la pregunta, consulta un grafo de conocimiento varias veces, cruza hallazgos, recuerda investigaciones
previas) y lo atribuye a GraphRAG («el vector encuentra lo que suena parecido, el grafo sigue lo conectado»).
Promocional, sin fuentes ni datos; el «95 %» no tiene origen. La «pista de evidencia» hereda los errores de la
extracción de entidades (la hace un LLM). No describe una arquitectura nueva: es RAG agéntico + multi-hop + memoria.

**Relevancia.** Manual, ninguna: ya cubierto (§6.5b, §6.6, §6.8.1, §10.9.5; ver el recuento de GraphRAG/Agentic RAG
en la entrada que lo establece más arriba). HyperRAG, la única real: la afirmación del post es la hipótesis que el
laboratorio quiere medir. `hyperrag/layers/graph_layer.py` (615 líneas) y `memo_layer.py` existen pero, según
`docs/PLAN_siguiente_fase.md` (11/08/2026), nunca se han construido ni medido; el plan exige antes el arnés de preguntas
de dos pasajes (Fase 1) y fija la puerta 1.8: si `bm25,vector` supera el 85 % en multi-hop, `graph` no tiene nada
que demostrar. Estado actual de la Fase 1 sin comprobar. Empreinte, débil: un agente que consulta el grafo varias
veces multiplica el coste por tarea (refuerza el pendiente «coste por tarea completada»). Auditra, débil: memoria
entre investigaciones = superficie para el threat model (retención, envenenamiento); sin demanda de piloto.
Corpus literario, ninguna.

**Veredicto: Descartar como contenido nuevo.** `[Manual: ninguno]` `[Empreinte: ninguno]`
`[HyperRAG: sin acción nueva; confirmar el estado de la Fase 1 antes de medir `graph`]` `[Auditra: ninguno]`

### 2026-10-12 (c) — «Votre agent IA ne se recette pas. Il se mesure.» (Laurent Letourmy, Head of Data Devoteam Snowflake Partner, con Vincent Vikor; LinkedIn, 02/10/2026)

**Fuente.** Tesis: un agente analítico no se «recibe» (recette), se mide de forma permanente, con un conjunto de preguntas
de respuesta conocida certificada por el negocio, repitiendo cada pregunta varias veces; el coste real es el tiempo del
negocio para certificar, y la documentación obsoleta es el cerebro obsoleto del agente. Verificado en primario:
Anthropic (blog, 03/06/2026): sin «skills» el agente no pasaba del 21 % en sus evals y con ellas supera el 95 % en
agregado; la precisión offline derivó de ~95 % a ~65 % en un mes; la capa semántica es «mandatory default path»; evals
generadas por Claude con validación humana, tamaño del conjunto no indicado (el artículo dice «documentación» donde el
blog dice «skills»; el 95 % de la frase introductoria del blog es cuota de automatización, no precisión). OpenAI
(29/01/2026): evals con pares pregunta-respuesta; respuesta esperada = SQL «dorada»; se compara SQL y datos resultantes,
sin comparar cadenas; «como tests unitarios». NO verificado: Spider 2.0 y BIRD (clasificaciones del 26/09), y las cifras
de sus propios tests (4 de 5 repeticiones parcialmente correctas, «marché adressable» 1 de cada 10, ingeniero 1 de cada 14;
n desconocido). Fuente comercial.

**Relevancia.** HyperRAG, media: sus medidas son «una pasada a T=0 y un modelo» y `HR4_conjunto_dificil.md` admite que un
discordante por sentido es compatible con ruido; repetir da el número y comprueba si T=0 en ollama es determinista.
Empreinte, baja-media: `erosion.py` solo marca el modelo mixto (`model_mix`, `n_mixed_episodes`) como confusor; el caso de
Anthropic atribuye la deriva a documentación sin actualizar, no al modelo; no hay campo de versión del contexto o la
documentación. Auditra, nota de diseño: el agente da la misma seguridad acierte o falle, así que el umbral
ALLOW/REVIEW/BLOCK debe apoyarse en una tasa medida por clase de pregunta y no en la confianza declarada (conecta con el
pendiente Jev del 28/09); campos candidatos: quién certificó la respuesta esperada y fecha de la última medida. Manual,
baja: ya cubierto (§3.3, §13.2, §13.8, §13.12, §6.5b y el laboratorio Text-to-SQL); ni el blog de Anthropic ni el de
OpenAI están citados; candidatos a dos casos fechados. Genie Ontology sigue pendiente aparte. Corpus literario, ninguna.

**Veredicto: Integrar, en pequeño.** `[Manual: dos casos fechados y verificados (deriva 95→65 %; evals que comparan SQL y datos), cambio de versión, baja]`
`[Empreinte: valorar campo de versión del contexto/documentación como confusor en erosion.py]`
`[HyperRAG: repetir oráculo y DIR/PARA N veces; lo ejecuta el autor]` `[Auditra: línea en la nota privada, no en este repo]`

### 2026-10-12 (d) — «How Production LLMs Reason Better at Inference Time (as researched by Google, OpenAI, and Anthropic)» (Avi Chawla, Daily Dose of DS; docx recibido)

**Fuente.** Ocho técnicas de cómputo en inferencia (cadena de pensamiento, voto mayoritario, best-of-N, pensamiento extendido,
autorrefinamiento, árbol de pensamiento, beam search, MCTS) bajo una tesis: todas generan candidatos y eligen, y la calidad
del selector decide; con verificador exacto el beneficio se sostiene al subir el presupuesto, con modelo de recompensa
aprendido se degrada. Regla: «construye primero la señal de verificación, escala la búsqueda después». Distinción paralelo
(coste en tokens, poca latencia) frente a secuencial (latencia directa). Verificado en primario SOLO la cifra de Gemini 2.5
(arXiv:2511.00751 «Self-Consistency Is Losing Its Edge»: +0,4 HotpotQA con 20 muestras, +1,6 MATH-500, coste casi lineal
con las muestras). El resto (Snell et al., Gao et al., Huang et al., Sprague et al., Yao et al., DeepSeek-R1, escalado inverso
de Anthropic) son estudios conocidos pero NO releídos: leer los primarios antes de citar. Matiz: «cómputo en inferencia supera
a un modelo 14x mayor» vale, según recuerdo del trabajo de Google, para problemas fáciles e intermedios, no para los difíciles;
el texto lo omite. Misma casa editorial que dos entradas del 2026-08-20.

**Relevancia.** Manual, media (hueco real): voto mayoritario 2 apariciones, árbol de pensamiento 1, autocorrección 1,
modelos de recompensa por proceso 4, pensamiento extendido 9, Goodhart 1; sin best-of-N, escalado inverso, MCTS, RULER ni
«test-time compute». Falta el marco generar-y-elegir; encaja con §13.12 (ground truth auditable). Empreinte, baja-media:
respalda la cláusula Goodhart (EM-4) con la curva de best-of-N y la inversión beam search/best-of-N; la evidencia de que el
autorrefinamiento sin crítica externa es neto negativo apoya declarar los límites del juez LLM; el presupuesto de
razonamiento (`budget_tokens`, `reasoning_effort`) es candidato a confusor junto a la versión del contexto (EM-DM-1); el coste
casi lineal con las muestras alimenta «coste por tarea completada». HyperRAG, refuerzo: respalda la regla de no juez LLM y
la observación del 11/08 (quitar el reranker, un selector aprendido, +7,9 puntos; análogo, no equivalente); el voto no
arreglaría `4%`/`1667` (sesgo de recuperación, no varianza). Auditra, refuerzo débil: decidir con comprobaciones
deterministas, en la línea de la nota del artículo de Letourmy. Tres Domesticaciones: la curva de sobreoptimización frente
a un proxy es una medición empírica del mecanismo del marco; sin comprobar si ya lo cita.

**Veredicto: Integrar.** `[Manual: subsección «cómputo en inferencia como generar y elegir», cambio de versión, prioridad media; antes leer los primarios]`
`[Empreinte: ampliar EM-DM-1 con la configuración de razonamiento; comprobar si el README cita los trabajos de Goodhart]`
`[HyperRAG: sin tarea nueva]` `[Auditra: sin tarea nueva]` `[Tres Domesticaciones: comprobar si cita el trabajo de sobreoptimización de recompensas]`

### 2026-10-12 (e) — «Agents, Loops, Graphs. Everything You Need to Know in One Place» (guía sin autor; docx recibido)

**Fuente.** Guía práctica sobre tres piezas con Claude: agente (herramientas, memoria, bucle), bucle (repetir hasta que el trabajo
supere un listón) y grafo de trabajadores en paralelo (fan-out). Verificado en primario SOLO que los «dynamic workflows» existen en la
documentación de Claude Code («un script que ejecuta muchos subagentes y contrasta sus resultados») y que la misma página avisa de que
varias sesiones a la vez multiplican el consumo de tokens. El bloque YAML `workflow/nodes/depends_on` NO aparece en esa página (Claude
escribe el script): tratarlo como ilustrativo. No trae cifras ni estudios; «todos los estudios serios concluyen que los modelos pasan
por alto la mayoría de sus errores» no tiene fuente. Contradicción interna: su bucle hace que el mismo modelo se puntúe de 1 a 10 con
«sé duro», pese a decir que el chequeo debe poder fallar y que el agente que hace el trabajo nunca lo revisa (el mismo problema que el
autorrefinamiento sin crítica externa de (d)). El umbral 8/10 y «por debajo del 50 % de aprovechamiento sale más caro que hacerlo tú» son
cifras arbitrarias.

**Relevancia.** Manual, cobertura alta: §8.8b (orquestación en grafo), §10.4b (ocho condiciones de parada), §10.6 (trazabilidad
multiagente), decaimiento de consenso, «juez LLM» ~18 veces; sin «contexto fresco» para el verificador ni tasa de aprovechamiento.
Empreinte, la parte más aprovechable: la tasa de aprovechamiento (salidas conservadas / generadas) es casi el pendiente de «coste por
tarea completada», con el denominador en lo que se conserva y no en lo que se genera, y cada vuelta del bucle reenvía un contexto más
largo. HyperRAG y corpus literario: nada. Auditra: sin tarea pública (el análisis y lo implementado viven en su nota privada).

**Veredicto: Observar.** `[Manual: CI-FO-1, tres comprobaciones, baja; sin cambio de versión salvo que falte algo]`
`[Empreinte: EM-FO-1, «salidas conservadas» como denominador de «coste por tarea completada»]` `[HyperRAG: nada]` `[Auditra: ver nota privada]`

### 2026-10-12 (f) — «Confident, Not Wiser: The Dunning-Kruger Effect in Human-AI Interaction» (Fernandes, Rausch, Kloft, Buschek, Welsch; arXiv:2609.31095, preprint, 25/09/2026; PDF leído, más infografía y post divulgativo)

**Fuente.** Estudio observacional exploratorio, no preregistrado, con los dos grupos reclutados por separado (sin asignación aleatoria): N = 366
(187 sin IA, 179 con IA), 40 ítems de razonamiento en cuatro bloques, IA = GPT-5.6 Luna con esfuerzo de razonamiento bajo, también evaluada sola
(100 ejecuciones). Verificado contra el PDF: con IA +7,22 puntos [5,99; 8,46]; frente a la IA sola +0,65 [−0,27; 1,57], «no establece sinergia ni
equivalencia»; confianza media por respuesta 0,66→0,78; diferencia de confianza correctas−incorrectas 0,12→0,04; dentro de un bloque el AUROC
es .590 sin IA y .568 con IA, no establecido (p = .091), y ~80 % de los pares del cálculo agrupado cruzan bloques; correlación estimación-nota real
.40 frente a .07; contraste Dunning-Kruger entre cuartiles 8,87 sin IA y 13,58 con IA, que con controles de regresión a la media queda en 6,49 y 8,87
con diferencia entre grupos inconclusa. Los autores advierten de que no se identifican efectos causales. El resumen divulgativo desfigura tres
puntos: el 63,1 % es «la estimación del dúo igualaba a la mejor de las dos» (participantes sin IA, hipotético), no «creían que superaría al experto»;
«el dúo igualó a la IA sola» no está establecido; y el lenguaje causal («destruye») no lo permite el diseño.

**Relevancia.** Manual, media (hueco real: 0 menciones de Dunning-Kruger o metacognición). Corpus literario, alta: cruza con «Mirar antes de
intentar» (segunda condición); ya hecho como nota-puente en `10_epigenetica/` (sin tocar texto vigente). Empreinte: el estudio fija el esfuerzo de
razonamiento y criba 17 modelos candidatos, ejemplo de control del confusor de EM-IT-1; sin tarea nueva. HyperRAG: nada. Auditra: ver nota privada.

**Veredicto: Integrar, con cautela.** `[Manual: CI-MC-1, baja-media]` `[Corpus: nota-puente hecha, propuesta de inserción sin aplicar, decide el autor]`
`[Empreinte: sin tarea]` `[HyperRAG: nada]` `[Auditra: ver nota privada]`

### 2026-10-12 (g) — «How Backpropagation Works» (Tech with Mak; infografía, post y versión interactiva HTML)

**Fuente.** Ejemplo numérico mínimo: x = 1, y = 0, dos unidades ReLU (w₁ = 1, w₂ = 2), salida lineal (v₁ = 3, v₂ = −1), sin sesgos, pérdida ½(ŷ−y)². Recalculado a mano: ŷ = 1, L = 0,5; gradientes w₁ = 3, w₂ = −1, v₁ = 1, v₂ = 2; con η = 0,1 los pesos pasan a 0,7 / 2,1 / 2,9 / −1,2; nueva ŷ = −0,49, L = 0,12005 (−76 %). Todo coincide. Las salvedades del post (gradientes antes de actualizar, pendiente de ReLU = 1, un paso no garantiza bajar la pérdida) son correctas. Sin afirmaciones empíricas que verificar.

**Versión HTML.** Útil como referencia visual, pero con defectos antes de portarla (ver CI-BP-1): erratas de notación, red sin aristas, paso 4 incoherente con el deslizador, sin traducir.

**Relevancia.** Manual, hueco pequeño pero real (backprop nombrado de pasada; 0 «regla de la cadena»). Empreinte, HyperRAG, Auditra y corpus: nada.

**Veredicto: Integrar** (cambio respecto a la primera lectura, «Descartar»: el autor decide incluirlo como referencia visual). `[Manual: CI-BP-1, baja]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Auditra: nada]` `[Corpus: nada]`

**Aplicado el 12/10/2026 (v117):** simulador corregido y en español en §0.1.3, con párrafo de enlace. Detalle en `taller/Registro_manual_v116_a_v117.md`.

### 2026-10-12 (h) — «How LLMs Actually Generate Text» (Brij Kishore Pandey; infografía interactiva HTML)

**Veredicto: Descartar.** El manual ya cubre cada paso (§0.2.6, §5.3, §5.4, §5.5c, §5.7d) y tiene un simulador de muestreo que sí
redistribuye probabilidades. Errores de la infografía: «genera 4 tokens en ~1 forward pass» (el borrador los genera uno a uno), d_model 4096
«en GPT-4» con «×96 capas en GPT-4» (cifras de Llama 3 8B mezcladas con las de GPT-3), atención sin normalizar ni máscara causal, ID de «grav»
distinto entre pasos, controles de muestreo inertes. `[Manual: nada]` `[Empreinte, HyperRAG, Auditra, corpus: nada]`

### 2026-10-12 (i) — «How LLM Inference Works, Clearly Explained» (Avi Chawla, Daily Dose of DS; docx)

**Veredicto: Descartar.** Cubierto en §5.7d y §5.5c. Errores: DeepSeek-V4 «abril de 2025» (fue abril de 2026; 27 % y 10 % verificados en el
blog de Hugging Face, no así 9,62 y 83,9 GiB), `softmax(scaled)` con variable inexistente, pseudocódigo con posiciones sumadas pese a RoPE,
vocabulario «unos 50.000», 1 MB por token solo sin GQA, y cifras sin fuente. `[Manual: nada]` `[Empreinte, HyperRAG, Auditra, corpus: nada]`

### 2026-10-12 (j) — Simulador HTML «KV Cache & Prefill vs Decode»

**Veredicto: Integrar, corregido; HECHO en v118 (§5.7d).** Defectos del original y verificaciones en `taller/Registro_manual_v117_a_v118.md`.
`[Manual: hecho]` `[Empreinte: nada]` `[HyperRAG: el simulador sirve para estimar caché y TTFT de un modelo local; sin tarea]` `[Auditra: nada]` `[Corpus: nada]`

### 2026-10-14 (a) — «This might be the most important paper on AI agents this month» (post en inglés, autor no identificado) y el paper «Harness Learning Enables Generalizable Test-Time Adaptation» (Zhang, Liu, Wang, Tajwar, Arora, Salakhutdinov, Khashabi, Song, Zanette; JHU/CMU; arXiv:2609.35738v1, 28/09/2026)

**Fuente.** Post con figura redibujada de las Figs. 1 y 2 del paper y una receta de seis pasos. Primario localizado y leído **a través de la extracción del PDF**
(arxiv.org/pdf/2609.35738), no a mano: los números de tabla, figura y página de esta entrada hay que contrastarlos con el PDF antes de citar. Preprint, sin revisión por
pares, sin replicación independiente. Mecanismo: un `harness.py` alrededor de un solucionador congelado; un proponente de 4B entrenado con RL lee la tarea, el harness y un
informe de ejecución, propone 8 ediciones por ronda, se puntúan en un conjunto aparte y solo la mejor pasa a ser el harness siguiente; feedback, puntuación y evaluación
final usan tres conjuntos disjuntos. Modelos: Reasoning Gym, proponente y solucionador Qwen3.5-4B (sin razonamiento) y profesor SFT Qwen3.6-35B-A3B; QA multi-salto,
proponente Qwen3-4B y solucionador Qwen3-8B, RL sin profesor, entrenado en HotpotQA y evaluado en MuSiQue y 2WikiMultihopQA.

**Cifras del post frente al paper.**
- *«Superó al modelo de 35B del que aprendió»:* solo en la media de propuestas sueltas sobre 21 familias no vistas: 0,62 (RL de un paso) frente a 0,56 (profesor). En el mejor
  de ocho gana el profesor: 0,85 frente a 0,83 (Tabla 9).
- *«Calidad de edición de 0,32 a 0,62»:* el paper no usa ese término; es la puntuación en reserva del harness revisado, promediada sobre propuestas: 0,32 proponente base,
  0,49 tras SFT, 0,62 con RL de un paso. El post omite el escalón intermedio.
- *«5 ediciones seguidas igualan o superan al mejor de 8 en paralelo»:* en Reasoning Gym, «se acerca o supera» (Fig. 4c); en QA, la media final de 10 rondas supera al mejor
  oráculo de 80 propuestas independientes (Fig. 5d-e). El paper avisa de que los protocolos difieren en selección de padre y prompt y de que cómputo y feedback no están igualados.
- *«Ediciones rotas del 38 % al 15 %»:* es una tasa combinada de ediciones fallidas y harness con puntuación cero (Tabla 10, familias canónicas). Con el proponente base solo 1
  de 120 propuestas era una edición fallida. En las familias no vistas el descenso es del 38 % al 8 %.
- *Receta de seis pasos:* omite el ingrediente central. El paper entrena el proponente con RL; pedir cinco ediciones a un modelo cualquiera no está probado. Lo transferible es la
  partición en tres conjuntos disjuntos y la selección solo por puntuación en datos reservados.
- *No reportado:* coste (horas de GPU, tiempo, euros) del entrenamiento ni del bucle; número de semillas de entrenamiento en Reasoning Gym. Barras de error: un error estándar entre
  familias. Limitaciones (§7): solucionador fijo, un solo profesor, instrucciones de revisión prescritas. Los benchmarks están lejos de un agente en producción.
- *«p. 8, un harness aprendido»:* por el orden del texto, es la Fig. 7 (QA): la llamada de respuesta lee los pasajes recuperados directamente y los resúmenes del primer salto solo
  guían la recuperación. Página inferida.

**Relevancia.**
- *Manual (baja):* §10.9.4 ya recoge, en el «Matiz (2026-09)», la autoevolución con puerta de validación en datos reservados y memoria de rechazo (Procedural Graphs, arXiv:2609.09153).
  Este paper es un segundo caso con otro mecanismo: reescribe el código del harness con un proponente entrenado, no una estructura de conocimiento. Parientes: §8.5 (DSPy) y la entrada
  `2026-10-02 (e)` (Dream-RSI, que cita Meta-Harness). Una línea basta.
- *HyperRAG (media):* el paper no enseña nada que el laboratorio no haga ya (regla 2, predicciones antes de medir, ruido de réplica), pero refuerza una brecha que el propio dossier
  documenta: casos de HR-4 reformulados después de ver los fallos, y Q3 ya inspeccionado caso a caso. Detalle y diseño en `HyperRAG/docs/HR4_conjunto_dificil.md` (HR-HL-1).
  Un bucle de autoedición automático **no** se propone: el laboratorio busca refutar teorías, no optimizar, y lo automático industrializaría lo que la regla 2 prohíbe.
- *Empreinte:* nada directo; el coste del bucle (80 propuestas por ejecución en QA) no se reporta, y es lo que mediría.
- *Auditra:* ver nota privada. *Corpus:* nada.

**Veredicto: Descartar como fuente nueva** (el post exagera y su receta no está probada; el paper es sólido pero no cambia nada que no estuviera ya en el Matiz). Queda como segundo caso
con salvedades. `[Manual: CI-HL-1, baja]` `[HyperRAG: HR-HL-1, media]` `[Empreinte: nada]` `[Auditra: ver nota privada]` `[Corpus: nada]`

### 2026-10-14 (b) — «MCP in One Request: DISCOVER → CALL → GROUND → RESPOND» (post en inglés + infografía, Greg Coquillo)

**Fuente.** Infografía de una página y texto del post. Contrastada con la especificación MCP en primario, leída el 14/10/2026: revisión **2026-07-28** (arquitectura,
herramientas, recursos, prompts, autorización, transportes, versionado, descubrimiento y peticiones de varias rondas) y revisión **2025-11-25** (ciclo de vida y transportes).

**Lo que el esquema dice frente al spec.**
- *«El cliente descubre servidores»:* no. Qué servidores existen lo fija la configuración del host; el cliente (uno por servidor, creado por el host) pide el catálogo del suyo.
- *Cliente como enrutador/planificador:* las herramientas son **controladas por el modelo**; el cliente no elige ni planifica. Recursos: dirigidos por la aplicación. Prompts: por la persona. El esquema omite las dos últimas primitivas.
- *Flujo con estado previo a 2026:* en 2026-07-28 no hay `initialize` ni sesión; cada petición lleva `_meta` (versión, cliente, capacidades) y `server/discover` es opcional para el cliente. Los servidores no inician peticiones: `input_required` + reintento.
- *«El servidor ejecuta de forma segura»:* el protocolo no lo garantiza. Lo que el spec obliga al servidor (validar entradas, control de acceso, límite de tasa, sanear salidas) lo protege a él; la autorización es opcional, solo HTTP (stdio: credenciales del entorno).
- *«GROUND», el resultado como evidencia:* es entrada no confiable. El spec obliga a tratar las anotaciones como no confiables y recomienda validar resultados antes del modelo; confirmación humana y registro son «debería».
- *Omisiones:* transportes, autorización y seguridad. *Errata:* «MCP Clinet».
- *Correcto:* la secuencia general (listar, llamar, resultado, respuesta).

**Relevancia.**
- *Manual (media):* §10.10 y §21.6 ya cubrían el «qué» y el catálogo de ataques (tool poisoning, rug pull). Faltaban un recorrido de punta a punta con quién decide en cada paso y una nota de revisión del protocolo, que caduca rápido. Integrado en v119 (CI-MCP-1).
- *Empreinte:* nada. *HyperRAG:* nada. *Corpus:* nada. *Auditra:* ver nota privada.

**Veredicto: Integrar, rehecho** (la idea de un recorrido de punta a punta; no la infografía como contenido). `[Manual: CI-MCP-1, HECHO en v119]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Auditra: ver nota privada]` `[Corpus: nada]`


### 2026-10-14 (c) — «L'injection de prompt devient un ver» (post en francés + infografía, Jean-Marie Uzel)

**Fuente.** Post e infografía («Rapport OpenAI · fin septembre 2026»). Contrastada el 15/10/2026 con tres primarios, leídos mediante un resumidor de página (no se citan frases literales): el informe de OpenAI «Self-replicating prompt injections exist» (blog de alineamiento, descubierto el 27/06, divulgado el 25/09/2026), la metodología de Google Threat Intelligence (GTIG, «Vulnerability Discovery and Exploitation Trends in the AI Era») y la divulgación de Zenity («SalesBleed», 24/09/2026, vía Infosecurity Magazine). Del texto del post no se verificó la frase sobre Gemini; la beta pública de Claude para Google Workspace sí está confirmada.

**Lo que se sostiene.** OpenAI publicó el 25/09 un informe sobre inyecciones de prompt que se reproducen (atacante contra defensor, con el marco GPT-Red). Los tres canales coinciden: respuesta de correo, escritura de archivo y mensaje de Slack tras varias lecturas. Los 2.076 CVE y el «0 clic» de Salesforce existen.

**Lo que el post estira.**
- *«El tema ya no es teórico»:* el gusano es un hallazgo de laboratorio. Los modelos eran puntos de control internos de investigación; OpenAI dice que no vio efectos fuera de las llamadas simuladas y que lo comparte por su novedad, «no por ningún incidente». No publica tasas de éxito. Lo real fuera del laboratorio son los CVE y SalesBleed.
- *«Contamina al agente siguiente»:* el informe muestra que el agente reproduce la inyección en un canal de salida; en lo leído no hay una medición de un segundo agente infectado. Es la extrapolación natural, no un dato.
- *El razonamiento atribuido al modelo* («ninguna regla me lo prohibía…») no aparece en el informe. Lo que el informe recoge es más corto: el agente anota que la instrucción pide enviar un acuse y que la herramienta lo permite; en otro ejemplo sospecha que la nota es una inyección y la obedece igual.
- *«Informes financieros» y «activos internos»:* el directorio borrado se llamaba `finance_reports`, pero el informe habla de «informes importantes»; lo transferido fue una moneda interna de reconocimiento a un compañero (dos mensajes de acuse).
- *2.076 CVE:* GTIG cuenta CVE «relacionados con IA» acumulados de enero de 2025 a agosto de 2026, no «de la pila IA». El middleware de orquestación es ~50 % de los fallos relacionados con IA (782 de 1.584 en 2026). GTIG añade que solo unos pocos se han explotado y que no ha visto explotación de día cero en infraestructura de IA.
- *Salesforce:* SalesBleed, vía Web-to-Lead; avisado en junio y corregido el 18/08. «0 clic» es correcto en el sentido de que la víctima no hace nada, pero el agente tiene que procesar el registro envenenado.

**Relevancia.**
- *Manual (baja-media):* ver CI-WM-1. El §21.4-§21.5 ya cubre el mecanismo y los controles; falta la autorreplicación y su antecedente (Morris II, 2024).
- *Empreinte:* nada. *HyperRAG:* nada. *Corpus:* nada. *Auditra:* ver nota privada.

**Veredicto: Integrar, en pequeño** (la idea de la autorreplicación y sus salvedades; no la infografía ni sus cifras como contenido). `[Manual: CI-WM-1, baja-media]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Auditra: ver nota privada]` `[Corpus: nada]`

### 2026-10-15 (a) — «Copilot Studio Hooks (Preview)» (Ravi Teja Ragam; post en inglés + infografía)

**Fuente.** Post e infografía de un desarrollador de la comunidad (el logo de Microsoft no la hace oficial). Contrastada el 15/10/2026 con el primario: «Hooks (preview)», Microsoft Learn, Copilot Studio (`ms.date` 2026-09-29; página de preliminar sujeta a cambios), leído mediante un resumidor de página (no se citan frases literales).

**Lo que se sostiene.** Un gancho (hook) = un evento del ciclo de vida del agente + un workflow que corre cada vez que ocurre. Seis eventos: inicio, prompt del usuario, antes de usar una herramienta, después, tras fallo de herramienta y error. Solo «antes de usar una herramienta» puede bloquear (`deny`) o modificar parámetros; los demás añaden contexto o cambian valores. Cada gancho recibe metadatos (conversación, usuario, canal, agente; pueden venir vacíos).

**Lo que la infografía omite o suaviza.**
- *Alcance:* la documentación dice que los ganchos aplican a agentes con el arnés de GitHub Copilot; la infografía no lo menciona.
- *Fallo abierto:* si el workflow falla, agota el tiempo o devuelve algo ilegible, el agente sigue como si no hubiera devuelto nada, también en «antes de usar una herramienta». La infografía lo recoge en «Important Design Rules», pero el post lo presenta como «control» sin esa salvedad. La propia documentación desaconseja usar un gancho como única salvaguarda de una regla crítica y pide tratar prompts, resultados y errores como entrada no fiable.
- *Estado:* preview; puede cambiar.

**Relevancia.**
- *Manual (baja-media):* 0 menciones de hooks ni de Copilot Studio. El patrón (control determinista del ciclo de vida frente a herramientas que elige el agente) existe también en otros arneses, pero esta fuente por sí sola no justifica una versión. Ver CI-HK-1.
- *Empreinte:* nada. *HyperRAG:* nada. *Corpus:* nada. *Auditra:* tocado en su guía de integración (privada), sin hueco que registrar aquí.

**Veredicto: Observar** (volver a mirar al salir de preview o con una segunda fuente). `[Manual: CI-HK-1, baja]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Auditra: ver guía de integración]` `[Corpus: nada]`

### 2026-10-16 (a) — «Invisible to the Machine» (Pitenin, Norly Research, arXiv:2608.07069, 07/08/2026) + artículo divulgativo que lo cita

**Fuente.** Llegó por el artículo «Faites-vous trop confiance à ChatGPT ?» (Rottembourg y Prunkl, Inria Régalia, 16/10/2026), que usa el
estudio como prueba de que la IA concentra a todos en los mismos sitios. Se leyó el **PDF completo (31 páginas)**. Preprint, un solo autor,
sin revisión por pares. Norly vende herramientas de visibilidad en IA: lo declara, y declara preinscripción del análisis y resultados nulos
contrarios a su interés (el de Foursquare).

**Lo que se sostiene (en el PDF).** Censo de 4.776 locales de dos zonas de Bali frente a 96 consultas de recomendación, 4 sistemas (ChatGPT,
Claude, Gemini, Perplexity, por API con búsqueda), 2.208 ejecuciones en 7 días, 12.439 menciones válidas. El 85,6 % de los locales no fue
recomendado nunca (suelo; 92,6 % con el marco más amplio). Entrar en una respuesta se asocia a la documentación (web propia OR 1,92, volumen
de reseñas OR 1,64, precio, menciones web), no a la nota (OR 0,89); la nota sí predice quedar primero (OR 1,17). Fallo dominante: locales
cerrados (93 recomendaciones), no invención (0,08 %). Repetición de la misma consulta: Jaccard 0,22 a 0,45; entre motores 0,33 a 0,54; la
paráfrasis baja la similitud en los cuatro; el retest a las dos semanas no se distingue del reintento del mismo día (ruido, no deriva). Un
efecto aparente (Foursquare, OR 1,70) pasó a nulo (OR 0,84) al corregir el emparejamiento de nombres.

**Lo que el artículo divulgativo simplifica.** (1) «La nota no juega»: solo en la entrada; para el orden sí. (2) «Flujo masivo hacia el mismo
grupo»: el paper mide cola larga (el primero, 1,9 %; los 25 primeros, 28,5 %) y poco acuerdo entre motores y entre repeticiones: no apoya
ese relato. (3) Las cifras no se extrapolan fuera de los locales de dos zonas de Bali. Límites del paper: observacional, API con búsqueda (no
las aplicaciones), una región, inglés, presupuesto de búsqueda de Claude limitado a dos por ejecución (vinculante en el 97,6 %).

**Relevancia.**
- *Manual (baja):* hueco en §4.3 (solo la reproducibilidad de la salida): **CI-AV-1, hecho en v121**. Sin GEO, restaurantes ni cifras de
  visibilidad como contenido. La fila de la tabla de técnicas («si retrieval trae doc obsoleto, alucina con fuente») queda como está: el
  paper observa fidelidad a fuentes caducadas, pero es un solo estudio de locales, no de documentos.
- *Empreinte (media, metodológica):* comprobar en el código si la erosión y la deriva repiten y reformulan antes de comparar. **Hecho el 16/10/2026: recogido como EM-AV-1 en Empreinte (a la espera de datos de uso libre).**
- *HyperRAG (baja):* la obsolescencia de las fuentes como modo de fallo de respuestas ancladas enlaza con las preguntas de evaluación
  temporal anotadas en `2026-10-02 (b)`. Sin acción.
- *Auditra:* nada. *Corpus:* nada.

**Veredicto: Integrar, en pequeño** (la idea de medir con repetición, reformulación, comparación y validación del instrumento; no las cifras
de visibilidad). `[Manual: CI-AV-1, hecho v121]` `[Empreinte: EM-AV-1, comprobado 16/10/2026; a la espera de datos]` `[HyperRAG: sin acción]`
`[Auditra: nada]` `[Corpus: nada]`

### 2026-10-25 (a) — Viennet, «Et si votre plateforme Data n'était plus le problème ?» + newsletter OVOT n.º 10, «La valeur de la Data se mesure dans les décisions qu'elle améliore» (15/10/2026)

**Fuente.** Dos textos del mismo autor (Johann Viennet, Head of Data & AI), publicados el 15/10/2026: un artículo de opinión que adelanta la
newsletter n.º 10 de «One Version of Truth» (OVOT), la que cierra su primer ciclo. Sin datos ni fuentes primarias que verificar. El propio autor
presenta la tesis como hipótesis «que debe verificarse».

**Qué dice.** Con una plataforma de datos madura, la restricción puede pasar de la información al arbitraje entre directivas (quién decide, con qué
criterios y bajo qué responsabilidad). Propone medir la contribución de la Data a las decisiones, no la disponibilidad de la plataforma: plazo entre
una variación significativa de la demanda (>15 %) y la revisión del plan, número de arbitrajes aplazados por falta de hipótesis comunes y tiempo de
conciliación de previsiones; comparar antes y después a perímetro comparable, descontando otros cambios del periodo. El ejemplo «de 6 a 3 semanas» es
**ficticio** y el autor aclara que no demuestra mejores decisiones ni ganancia económica atribuible a la plataforma.

**Relevancia.**
- *Manual (baja-media):* extiende la línea de derechos de decisión de §14.2b (existe en el manual). No se encontró «Viennet» en `index.html`; la
  autoría del hilo de v102 consta en `taller/Registro_manual_v101_a_v102.md`. No es una fuente independiente de ese hilo. Ver CI-DV-1.
- *Empreinte (baja):* paralelo con «coste por tarea completada» y con la exigencia de comparar descontando confusores (EM-DM-1, EM-IT-1). Encuadre, no función.
- *HyperRAG, corpus, impacto económico:* nada.
- *Auditra:* ver nota privada (no se detalla aquí).

**Veredicto: Observar** (tesis sin evidencia propia; lo útil es el marco de medición y sus salvaguardas contra la atribución abusiva).
`[Manual: CI-DV-1, baja-media]` `[Empreinte: encuadre, sin pendiente nuevo]` `[HyperRAG: nada]` `[Auditra: ver nota privada]` `[Corpus: nada]`

### 2026-10-25 (b) — Tres preprints del 14/10/2026 en un post «Rethink memory»: Continuum Attention (arXiv 2610.20586), Latent Compaction with Test-Time Training (2610.20582) y CoPE, Co-Evolving Acting and Forecasting (2610.20597)

**Fuente.** El post (LinkedIn, sin autor identificado en el texto recibido) es prudente: dice que los resúmenes son parciales y que no verifican aceleraciones. De los tres artículos solo se leyó **completo** el de Latent Compaction (PDF a través de una herramienta que lo resume, y el README del código); los otros dos, solo el resumen en espejos (papers.cool, OpenTrain), sin PDF de arXiv.

**Continuum Attention** (Khadangi, un autor). Operador de atención que integra sobre una curva de memoria lineal a trozos; conserva complejidad cuadrática (no es una mejora de eficiencia). Mejora de 0,020 nats/byte frente a softmax y 0,048 frente a atención focal en pérdida de validación; el autor dice que la generalización a mayor escala no está probada. Sin acción.

**Latent Compaction con TTT** (Chen, Shen, Xiao, Han; Tsinghua; código THUNLP, 15/10/2026, no ejecutado). Aprende por documento una caché KV compacta con los pesos congelados: etapa 1 de 1.000 actualizaciones (ajuste de salidas y normalizadores de atención) y etapa 2 de 1.000 (destilación), con 480 prompts genéricos por documento. Resumen: 96,7 % en RULER a 32× frente a 40,0 % de KVZip+. **Lo que el texto no ata:** modelo y longitud de contexto de ese 96,7 % (la Figura 1 usa Qwen3-1.7B; las cifras por subtarea solo están en figuras). **No reporta** tiempo, memoria de GPU ni latencia; sus resultados son «presupuestos lógicos de pares KV», no ahorros medidos; su ruta de atención usa PyTorch explícito, no FlashAttention. Los autores reconocen que el ajuste por documento sigue siendo costoso y que la compresión extrema hace perder precisión; resumir el texto supera al método en RULER con las compresiones más agresivas; en Phonebook Lookup (Qwen3-1.7B, 16×) baja de 87,75 (4K) a 70,50 (16K) y todos los métodos se acercan a 0 a 64× o más. Modelos de 0,6B a 8B, una semilla por documento.

**CoPE** (Yu et al., UIUC; repo ulab-uiuc/CoPE; solo resumen). RL para agentes con un tercer objetivo auxiliar, la secuencia de acciones siguientes (no el resultado). Hasta 1,9× y 2,0× más eficiencia de muestras que ECHO y GRPO en ScienceWorld, sin coste de inferencia; cinco benchmarks. Sin acción.

**Relevancia.**
- *Manual (baja):* nota posible en §5.7d (la caché KV como objeto entrenable) con la salvedad del coste por documento y de que lo medido son presupuestos lógicos. El manual tiene 0 menciones de «test-time training». Ver CI-LC-1.
- *HyperRAG (baja):* comparación teórica «cachear un documento estático» frente a RAG; lo que habría que medir es el punto de amortización (preguntas por documento) y la recuperación de detalles raros. Sin acción.
- *Empreinte (baja):* aviso para el modelo de costes: un ahorro de memoria «lógico» no es un ahorro medido.
- *Auditra, corpus:* nada.

**Veredicto: Observar.** `[Manual: CI-LC-1, baja]` `[Empreinte: aviso, sin pendiente]` `[HyperRAG: sin acción]` `[Auditra: nada]` `[Corpus: nada]`

### 2026-10-25 (c) — «Faites-vous trop confiance à ChatGPT ?» (Rottembourg y Prunkl, Inria Régalia, 16/10/2026), lectura completa del artículo

**Fuente.** Artículo divulgativo, no estudio. Es el mismo que trajo a Pitenin en `2026-10-16 (a)` (allí ya se corrigieron tres simplificaciones); aquí se lee entero. Repite la lectura de «concentración» de Pitenin (689 locales, «flautista de Hamelín») que el paper no apoya: mide cola larga. Valor principal: mapa de primarios.

**Verificado (búsqueda, 25/10/2026).**
- **Strömberg, Lei y Wu (2026)**, CEPR DP 21577 (columna en VoxEU): 26.811 alumnos de 7.º a 12.º de un condado de China central, 30 meses, nueve materias. Deberes +18 % y tiempo de 64 a 45 min; exámenes mensuales −20 % a los 6 meses; exámenes de acceso −24 % (bachillerato) y −18 % (universidad) tras ~2 años. **Observacional** (diferencias en diferencias escalonadas; las fechas de adopción las declaran los alumnos). «No es la herramienta, es el descargo» es una lectura de la heterogeneidad, no un resultado causal.
- **Xu, Li y Jiang**, arXiv:2509.00462 (autopreferencia en cribado de CV): 2.245 CV tras limpiar; el 67-82 % es el resultado de igualdad de oportunidades LLM-contra-humano de varios modelos (GPT-4-turbo 66,9; GPT-4o-mini 67,9; GPT-4o 81,9; Qwen 78,0; DeepSeek-V3 71,6); LLaMA 3.3-70B es incoherente entre texto, figura (−1,4) y tabla (79). Solo resúmenes ejecutivos, simulación con 10 CV y 4 plazas; los anotadores humanos prefirieron lo humano «a veces» (18 anotadores, 30 pares cada uno), no como regla.
- **Barcaui (2025)**: solo se localizó una reseña (no un primario) de un ensayo aleatorizado sobre retención a 45 días con 57,5 % frente a 68,5 %; sin confirmar autor, año, N=120 ni la corrección por tiempo de estudio.
- **Sin verificar:** umbral del 20 % de Waze, OptimismBench (14 de 16), «The Future's Too Bright», Grok y Musk, el falso think tank, los casos de Cauterets, Floride y Character.AI, la comparación de Barcelona.

**Relevancia.**
- *Manual (baja-media):* ya hay sycophancy (15), delegación cognitiva (10), deuda cognitiva (2) y envenenamiento (10). **0 menciones de «autopreferencia»** (puede existir el sesgo del juez LLM con otro nombre; no se buscó). Ver CI-ST-1 y CI-XP-1.
- *Corpus literario (media):* la sección de uniformización toca «monocultivo» y el sesgo optimista de modelos «entrenados para agradar» toca Tres Domesticaciones; apoyarse en primarios, no en este texto.
- *Empreinte:* si usa juez LLM, importan el sesgo de tendencia central y la autopreferencia (no comprobado). *HyperRAG, Auditra:* nada.

**Veredicto: Observar** (dos primarios candidatos, ninguno leído completo). `[Manual: CI-ST-1 y CI-XP-1, baja-media y baja]` `[Corpus: nota]` `[Empreinte: comprobar si usa juez LLM]` `[HyperRAG: nada]` `[Auditra: nada]`

### 2026-10-25 (d) — The Human Creativity Benchmark (Hopkins et al., Contra; arXiv 2606.30561), lectura completa del PDF (39 págs.)

**Fuente.** Un post que lo usaba como prueba de que las ideas se estrechan («acuerdo sobre GPT-Image-1.5, reacciones divididas ante Flux-2-Pro»). Se leyó el PDF entero.

**Lo que el paper hace.** Mide acuerdo entre expertos (28 evaluadores, 93 prompts) en tres ejes (adherencia al prompt, usabilidad, atractivo visual) y tres fases (ideación, maqueta, refinamiento). **No mide diversidad entre salidas ni homogeneización**: el término aparece en el estado de la cuestión (Bommasani 2022, Thanh-Tung 2020) y en la discusión como creencia («We believe this can result in homogenized outputs»). La Figura 2 es un ejemplo ilustrativo de acuerdo entre evaluadores sobre una misma imagen, no un resultado.

**Salvedades verificadas en el texto.**
- Cifras internas que no cuadran: texto 93 prompts, 5.940 pares, 5.940 valoraciones, 3.675 respuestas (suma 15.555, el «15.000» del resumen); Apéndice A: 95 prompts, 3.174, 2.116 y 2.247 (suma ~7.500). No se comprobó cuál es la del conjunto liberado.
- α de Krippendorff por debajo de ~0,3 en todos los ejes y dominios (Fig. 40), con filas negativas en la Tabla 4; la «convergencia» se apoya en el % de prompts con evaluadores a ±1 del mediano (laxo en escala de 5). W de Kendall sube en Ad Images (0,345 → 0,549) y baja en Landing Pages (0,484 → 0,333).
- Cada prompt se ejecutó una vez; muestra pequeña (reconocida por los autores); muchos p de Friedman > 0,05 en maqueta y refinamiento.
- Restos de borrador («[add details]»; leyendas de las Figs. 13 y 25 que no corresponden). Todos los autores son de Contra, que aportó los evaluadores; el codificado cualitativo lo hizo GPT-4o.

**Relevancia.**
- *Manual (baja):* caso didáctico de benchmark cuyo N del resumen no coincide con el del apéndice; el marco «el desacuerdo experto es información» es citable como marco, no como resultado.
- *Corpus / monocultivo:* **no sirve como evidencia**; mejor el primario de Bommasani (CI-MC-1).
- *Empreinte:* solo si usa juez LLM o rúbricas sobre salidas creativas: reportar acuerdo por eje, no una puntuación única. *HyperRAG, Auditra:* nada.

**Veredicto: Descartar** (como evidencia de homogeneización; se conserva solo el marco).
`[Manual: nota didáctica, sin pendiente]` `[Corpus: CI-MC-1, baja]` `[Empreinte: condicional]` `[HyperRAG: nada]` `[Auditra: nada]`

### 2026-10-25 (e) — «Can two AI models, given the same task, behave the same way?» (Khan et al., NAIST, 17/10/2026; Claude Haiku 4.5 frente a Gemini 2.5 Flash-Lite en extracción de tripletas desde GitHub), solo el post

**Fuente.** Post divulgativo del primer autor sobre un artículo aceptado en ICCA 2026 (sin enlace ni PDF en el texto recibido; código y anotaciones declarados abiertos). Todo lo siguiente viene del post, no del paper.

**Qué afirma.** 30 repositorios de ML, 8 relaciones, 922 tripletas etiquetadas a mano. F1: Claude 0,76, Gemini 0,66, línea base de regex 0,32 (IC por bootstrap). Claude «conservador» (precisión 0,94), Gemini «agresivo» (0,80); complementarios por relación; la concordancia entre anotadores humanos coincide con las relaciones que los modelos extraen mejor.

**Salvedades.**
- **Aritmética que no encaja con el relato.** Con esas precisiones y F1, el recall implícito (si son medidas globales de la misma base) sale ≈ 0,64 para Claude y ≈ 0,56 para Gemini: Claude ganaría en precisión *y* recall globales, y «Gemini = alto recall» solo valdría por relación. Comprobar en el paper cómo definen precisión y recall.
- **Recall sobre un conjunto agrupado:** las 922 tripletas son lo que produjeron los sistemas, así que el recall probablemente se mide contra lo correcto dentro de ese conjunto, no contra todo lo que decía el README (hipótesis, no verificado).
- **«Vendor» confundido con nivel de modelo:** ambos son modelos pequeños y baratos (Haiku, Flash-Lite); no separa proveedor de tamaño.
- **El ensamblado no se probó:** «probablemente más productivo» es hipótesis; la mayoría de etiquetas, de un solo anotador; la línea base es de regex; 30 repos populares de ML en Python.
- Lo bueno: reconoce las limitaciones y publica anotaciones.

**Relevancia.**
- *Empreinte (baja-media):* misma hipótesis que un auditor multiproveedor (modelos complementarios por tipo de tarea), pero con una tarea de extracción y no de coste; sirve como idea de qué comparar por categoría, no como evidencia.
- *HyperRAG (baja):* metodología de extracción con oro etiquetado a mano e IC por bootstrap; leer el paper si se construye extracción de tripletas.
- *Manual (baja):* buen ejemplo didáctico de «comparar proveedores con oro humano» y de sus límites. *Corpus, Auditra:* nada.

**Veredicto: Observar** (sin pendiente nuevo hasta ver el paper). `[Manual: ejemplo didáctico]` `[Empreinte: idea]` `[HyperRAG: leer el paper si aplica]` `[Auditra: nada]` `[Corpus: nada]`

### 2026-10-25 (f) — Post «La défense la plus solide contre l'injection de prompt… retirer des pouvoirs à l'agent» (gobernanza, ISO 27001 / 42001), con CaMeL y los patrones de diseño

**Fuente.** Post de LinkedIn en francés, sin autor identificado en el texto recibido. Resume tres primarios que se comprobaron en arXiv (solo resúmenes, ningún PDF):
- **CaMeL** (Debenedetti, Shumailov, Carlini, Tramèr y otros; 2503.18813, 2025): 77 % de las tareas de AgentDojo con seguridad demostrable, 84 % sin defensa. El post omite ese coste. La cifra de «949 ataques» no aparece en el resumen: sin verificar.
- **«Doce defensas, más del 90 %»:** Nasr, Carlini y otros, «The Attacker Moves Second» (2510.09023, oct. 2025); ataques adaptativos; muchas defensas declaraban cerca de 0 %. No se sabe si evaluó CaMeL.
- **Seis patrones de diseño:** 2506.08837 (jun. 2025). El resumen no da el número ni afirma que un agente generalista no se pueda asegurar: esa conclusión es del post.
- Ambos artículos son de 2025, no de esta semana. NCSC e ISO 27001/42001: no verificados (opinión del autor).

**Lo útil.** Las garantías cubren acciones y flujos de datos, no efectos de un contenido sesgado (resumen orientado, recomendación torcida): para un agente que ayuda a decidir hace falta evaluación de impacto.

**Relevancia.**
- *Manual (baja-media):* material para una sección sobre inyección de prompt y defensas por diseño; sin comprobar qué cubre hoy. Ver CI-PI-1.
- *Auditra:* ver nota privada (no se detalla aquí).
- *Empreinte, HyperRAG, corpus:* nada.

**Veredicto: Observar.** `[Manual: CI-PI-1, baja-media]` `[Auditra: ver nota privada]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Corpus: nada]`

### 2026-10-25 (g) — Post de la libélula («100.000 neuronas… usar el mundo como su propio modelo… Heideggerian AI») y lectura completa de Dreyfus (2007)

**Fuente.** Post en español, sin autor identificado en el texto recibido. Se leyó completo el artículo de Dreyfus (24 págs.). De Mischiati et al. (*Nature* 2015, doi 10.1038/nature14045) solo el resumen.

**El post no se apoya en el artículo.**
- Dreyfus (2007) trata de IA simbólica, Brooks, Agre, Wheeler y Freeman; no menciona deep learning, modelos de lenguaje ni eficiencia energética. «Profético frente a los LLM» es una extrapolación del autor del post.
- «El mundo es su propio modelo» es de Brooks, y Dreyfus lo critica: sus robots responden solo a rasgos fijos, no aprenden y esquivan el problema del marco (pp. 1140-1142). Advierte contra la «falacia del primer paso» (insecto → humano, p. 1141) y concluye que una IA heideggeriana exigiría modelar un cuerpo como el nuestro, lo que la hace más difícil (p. 1160). Reconoce algún avance hacia una «IA animal» (salamandra de Freeman), sin razón para creer que sea un primer paso hacia lo humano.
- Su tesis es ontológica, no empírica (p. 1149). Mischiati et al. (resumen) describen en la libélula «modelos directos e inversos de la dinámica del cuerpo» y modelos del movimiento de la presa; si eso cuenta como «representación» en el sentido de Dreyfus no se ha resuelto (él acepta el modelo de Freeman, que usa estados del cerebro, no del mundo).
- «Ignorado durante décadas»: solo su propio relato (nota 8; p. 1140, cita de Winograd).
- Sin verificar: 100.000 neuronas (las estimaciones varían), 97 % frente a 25 % del león (cifras de divulgación). Error de categoría: parámetros de un modelo ≠ neuronas.

**Relevancia.**
- *Corpus / Tres Domesticaciones (media-alta):* la frase de la p. 1150 sobre significación añadida desde fuera. Ver CI-DR-1.
- *Manual (media-baja):* 0 menciones de Dreyfus en el repositorio; posible apartado histórico.
- *Empreinte, HyperRAG, Auditra:* nada.

**Veredicto: el post, Descartar; Dreyfus (2007), Observar.** `[Corpus: CI-DR-1, baja-media]` `[Manual: CI-DR-1]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Auditra: nada]`

### 2026-10-25 (h) — Post «A committee cannot be accountable» (propiedad de la gobernanza de IA: un directivo de negocio con nombre, no un comité)

**Fuente.** Post de LinkedIn sin autor identificado en el texto recibido; cita la «AI Governance & Security Matrix» de Inga Stirbyte (no verificada). Opinión, sin estudios ni primarios.

**Tesis.** El propietario de un sistema de IA es el directivo de negocio cuyo proceso cambia; el comité coordina, el CISO fija las barreras y el CIO opera las plataformas. Tres mecanismos: registro de casos de uso con un propietario nominal, misma delegación de firma que cualquier gasto, revisión trimestral del registro por el comité de auditoría.

**Relevancia.**
- *Manual (baja-media):* misma tesis que el hilo de derechos de decisión (§14.2b) y el Cap. 16.2 sobre tu rol y tu responsabilidad ante el AI Act; sin fuente nueva. Sin pendiente.
- *Auditra:* ver nota privada (no se detalla aquí).
- *Empreinte (baja):* si reporta por agente, el propietario nominal sería una columna natural; no se ha comprobado si existe.
- *HyperRAG, corpus:* nada.

**Veredicto: Observar** (peso bajo). `[Manual: sin pendiente]` `[Auditra: ver nota privada]` `[Empreinte: comprobar]` `[HyperRAG: nada]` `[Corpus: nada]`

### 2026-10-25 (i) — Post «La falacia del control semántico» y preprint de UCLA «An Exploration of Attacks on AI Agent Systems» (arXiv 2610.12524)

**Fuente.** Post de LinkedIn en español, sin autor identificado en el texto recibido. Se localizó el preprint (Qiao, Cabilangan y otros diez, UCLA) y se leyó su versión HTML, no el PDF. Sin señales de revisión por pares; los autores reconocen experimentos pequeños y locales, con muchas pruebas de 3-5 repeticiones, y una fila ilegible en la Tabla III.

**Lo que el post dice frente a lo que consta.**
- «Seguro en el 100 %»: en PALChain con clasificadores, 3 de 4 consultas salieron SAFE (una etiqueta por consulta, no por repetición); en la más grave el agente leyó `.env` en el 80 % de las pruebas (n=5).
- «Cambio de formato al 100 % contra barreras duras»: n=5 y contra un filtro codificado a mano (Flag Reveal), no contra los clasificadores.
- «Más del 97 % por descripción extensa y sentimiento positivo»: mezcla dos ensayos. Sentimiento positivo: 98,15 % (URL local) y 97,65 % (URL aleatoria); descripción más larga: 89,6 %. Montaje: 106 tareas de reserva, GPT-4o y un Gemini cuya versión se cita de forma inconsistente, 4 ensayos.
- «Sin firmas digitales ni confianza cero» es el montaje del experimento. El artículo no menciona NIS2, DORA, ENS ni ISO 27001: la tesis jurídica es del post.

**Relevancia.**
- *Auditra:* ver nota privada (no se detalla aquí).
- *Manual (baja-media):* ejemplo pequeño para el apartado de inyección de prompt; ver CI-PI-1.
- *HyperRAG (baja):* la inyección por documentos recuperados es un vector, pero el artículo no trata de RAG.
- *Empreinte, corpus:* nada.

**Veredicto: Observar** (peso bajo). `[Manual: CI-PI-1, ampliado]` `[Auditra: ver nota privada]` `[Empreinte: nada]` `[HyperRAG: baja]` `[Corpus: nada]`

### 2026-10-25 (j) — Post «RAG vs CAG vs GraphRAG» (regla de decisión de divulgación)

**Fuente.** Post de LinkedIn (Sneha Vijaykumar, según el pie del texto recibido). Sin datos, estudios ni fuente de CAG.

**Qué dice.** RAG si los datos cambian a menudo; CAG si el conocimiento es pequeño y estable con consultas repetidas; GraphRAG si hay relaciones y preguntas de varios saltos; se pueden combinar. No define «pequeño», no da cifras de coste, latencia ni calidad, y no cita la fuente de CAG.

**Relevancia (interés potencial anotado a petición del autor).**
- *Manual (baja):* GraphRAG ya está cubierto; CAG, no. Ver CI-CA-1.
- *HyperRAG (baja-media):* la pregunta de cuándo compensa cachear frente a recuperar es medible en el laboratorio. Ver HR-CA-1.
- *Empreinte, Auditra, corpus:* nada.

**Veredicto: Descartar el post** (sin evidencia); se conservan los dos pendientes como interés potencial. `[Manual: CI-CA-1, baja]` `[HyperRAG: HR-CA-1, baja-media]` `[Empreinte: nada]` `[Auditra: nada]` `[Corpus: nada]`

### 2026-10-25 (k) — Post «Les agents IA sont les nouveaux collaborateurs…» y dos artículos de Microsoft: «Agents are your newest insiders» (19/10/2026) y «Rethinking security for the age of AI» (27/07/2026)

**Fuente.** Post de LinkedIn en francés, sin autor identificado en el texto recibido; resume bien el artículo de octubre. Se leyeron los dos artículos originales (blog de Microsoft).

**Octubre (Nadim Abdo, vicepresidente, Identidad y Acceso a la Red).** Principio: «rodear la inteligencia no determinista con controles deterministas, evidencia independiente y límites de contención»; el modelo no debe ser su propia autoridad de seguridad. Presenta Dynamic Permissions, Dynamic Agent Risk, Dynamic Conditional Access y agentes guardianes (en Project Perception) con el verbo «introducing», **sin estado de disponibilidad ni fechas**; amplía Entra Agent ID y el descubrimiento de agentes locales a 60 tipos (35 nuevos, entre ellos Claude Code, OpenAI Codex y GitHub Copilot). No cita estadísticas externas; «cientos de miles de agentes» dentro de Microsoft es una cita sin fuente. No usa «kill switch», pero habla de aislar el entorno o detener la ejecución con el riesgo más alto; aprobación humana verificable en acciones de alto impacto; saber «quién es el propietario» de cada agente.

**Julio (Hayete Gallot, vicepresidenta ejecutiva, Microsoft Security).** Anuncia Project Perception (defensa multiagente con agentes rojos, azules y verdes; vista previa pública el 3 de agosto; primer caso, gestión de vulnerabilidades). Cifras de Microsoft sin verificación independiente: 96 % en CyberGym con métrica de «cualquier fallo», supera a Mythos en esa clasificación, casi 50 % de ahorro de coste. No trata de controles deterministas ni de evidencia de auditoría. Es el origen de los «agentes guardianes» de octubre.

**Relevancia.**
- *Manual (media-baja):* material para el apartado de gobernanza de agentes. Ver CI-MS-1.
- *Auditra:* ver nota privada (no se detalla aquí).
- *Empreinte (baja), HyperRAG, corpus:* nada.

**Veredicto: Observar** (posición del fabricante, sin datos propios). `[Manual: CI-MS-1, baja-media]` `[Auditra: ver nota privada]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Corpus: nada]`

### 2026-10-25 (l) — «The AI Decision Matrix» (MIT CISR / MIT Sloan Management Review, imagen y post) y lectura del briefing «Designing Decision Rights for AI» (18/06/2026)

**Fuente.** Post de LinkedIn sin autor identificado en el texto recibido, con la imagen de la matriz y notas del autor. Se leyó el texto del briefing en la página del CISR a través de una herramienta de lectura web que resume y devuelve citas; el PDF del repositorio del MIT no se pudo abrir (acceso denegado), y la versión «Talking Points» del repositorio (Sebastian y Weill, dos autores) no se leyó.

**Qué dice el briefing (Sebastian, Weill, Haskamp, vom Brocke).** Ambigüedad = «how clearly data determines the answer»; riesgo = «the consequences of getting a decision wrong» (coste del error y dificultad de revertir). Cuatro tipos: rutinaria (automatizar), consecuente (gestionar, con un responsable humano de riesgo con autoridad para mejorar la IA), exploratoria (habilitar) y estratégica (liderar; humanos dueños del encuadre y del aprendizaje, la IA apoya la acción). Cada decisión se descompone en encuadrar, actuar y aprender. «No AI agent is deployed without a named business owner accountable for its outcomes and learning» (One NZ, más de 50 agentes; despliegue por cohortes pequeñas; restricción de no dar nunca un precio equivocado). La autonomía puede crecer con la confianza.

**Matices.** Evidencia: 30 entrevistas; los casos de One NZ son ilustrativos y las cifras las declara la empresa (60 % menos de tiempo de segmentación; más del 60 % de las consultas en la app); las conclusiones finales son predicciones. El texto y la figura difieren en un punto: el texto da el encuadre estratégico a los directivos humanos, la figura lo marca «humano con IA». La nota del post de que la autonomía no debe ser permanente es una lectura razonable del texto, no una frase literal. El PS sobre NVIDIA GTC Berlin es publicidad ajena.

**Contraste con la matriz del §14.2b (Delegar / Supervisar / Retomar / Responder).** Ejes distintos y complementarios. La del manual asigna *autoridad* con nombres propios y evidencia auditable (registro con propietario nominal, tasa de rechazo, umbrales de escalado, rol ante el AI Act), cruzada con los niveles de criticidad del Cap. 11 (≈ eje de riesgo); no tiene eje de ambigüedad ni la descomposición encuadrar/actuar/aprender. La del MIT asigna *qué parte de cada decisión* hace la IA según ambigüedad y riesgo, sin mecanismo de verificación (no hay equivalente a la regla de «rechazo cero» ni a `override_rate_at_decision`). Coinciden en el propietario nominal y en que la responsabilidad humana no se delega. La cabecera de §14.2b dice que el concepto «no tiene literatura de referencia»: conviene revisarla (ver CI-CR-1).

**Relevancia.**
- *Manual (media-alta):* ver CI-CR-1. Sería una segunda señal de convergencia, ahora con fuente primaria, y la ambigüedad es un eje que el manual hoy no usa.
- *Auditra:* ver nota privada (no se detalla aquí).
- *Empreinte, HyperRAG, corpus:* nada.

**Veredicto: Integrar** en el manual (condicionado a leer el PDF original); **Observar** el resto. `[Manual: CI-CR-1, media-alta]` `[Auditra: ver nota privada]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Corpus: nada]`

### 2026-10-30 (a) — «The Current State of AI Tokenomics» (Peter Walker, OpenRouter; newsletter para directores financieros, 22/10/2026)

**Fuente.** Artículo invitado de Walker (Head of Insights de OpenRouter), texto completo recibido y leído. El bloque inicial de Remote (empleador de registro) es publicidad ajena. El autor trabaja en una pasarela de enrutado y los datos son de su propia plataforma.

**Qué dice.** La inferencia se comporta como una materia prima: volumen al alza, precio unitario a la baja y un mejor proveedor que cambia cada pocos meses. Cifras que declara (no contrastadas): de unos 0,5 billones de tokens semanales en enero de 2025 a 164 billones a finales de septiembre de 2026; precio medio por millón de tokens de $0,77 a $0,14; pesos abiertos con el 60 % de los tokens y el 26 % del gasto; agentes con 131 billones semanales frente a 18 de personas; el 44 % de los tokens de modelos chinos, servidos por proveedores con sede en EE. UU.; para tres modelos abiertos, lo pagado entre un 43 % y un 89 % por debajo del equivalente de lista. Su enrutado por defecto pasa a precio de «coste aterrizado»: precio efectivo tras el descuento de caché, más el coste de espera y el de los reintentos.

**Verificado.** Aritmética del reintento: $1,00 con 80 % de éxito = $1,25 por respuesta válida (correcta). Con su 60 % de tokens y 26 % de gasto, un token abierto cuesta en media aproximadamente una cuarta parte de uno cerrado (cálculo mío). Primario de Anthropic sobre caché de prompt, leído el 30/10/2026 con una herramienta de lectura web que resume: escritura 1,25× (5 min) y 2× (1 h) del precio base, lectura normalmente 0,1× con excepciones por modelo, aciertos solo con segmentos idénticos y aislamiento por organización y espacio de trabajo; la página no dice si la caché se reutiliza entre modelos.

**Matices.** El precio medio por token no es un índice de precios: la caída de $0,77 a $0,14 mezcla cambio de modelos y bajada de precios del mismo modelo, y el artículo no las separa. La muestra es una sola plataforma, con umbrales mínimos de gasto en las cohortes, y las cuotas entre laboratorios valen solo dentro de ella. Las cifras de disponibilidad (92,8 %, 96,9 %, 97,3 %) vienen de la propia empresa. No se comprobaron los modelos nuevos que cita. Las recomendaciones a directores financieros (guardarraíles, regiones, límites por función) son opinión del autor.

**Relevancia.**
- *Manual (media):* §12.4c no recogía caché, reintentos ni failover; cerrado como CI-RT-1 en v140, tomando el concepto y no las cifras.
- *Empreinte (alta):* ver EM-RT-1; encaja con «modelo servido ≠ declarado».
- *Auditra:* sin detalle aquí (el Triaje es público).
- *HyperRAG:* baja (mide ejecuciones locales). *Corpus:* nada.
- *Transversal «Impacto económico de la IA»:* complementa el hilo de OpenRouter/Stripe y Jevons; no se ha convertido en post.

**Veredicto: Integrar, en pequeño** (hecho en el manual). `[Manual: CI-RT-1, HECHO en v140]` `[Empreinte: EM-RT-1]` `[HyperRAG: nada]` `[Auditra: no se detalla aquí]` `[Corpus: nada]`

### 2026-10-30 (b) — «Inference Engineering» (Tech with Mak; infografía + post en inglés, LinkedIn)

**Fuente.** Infografía «Inference Engineering» y texto del post, recibidos y leídos. Autor divulgativo, sin datos propios; es un mapa de conceptos (latencia, rendimiento, caché KV, cuantización, paralelismo, servicio), no una medición. Los primarios se leyeron el 30/10/2026 con una herramienta de lectura web que resume, no con los PDF completos.

**Qué dice.** Presenta la ingeniería de inferencia como disciplina propia: TTFT, latencia entre tokens y rendimiento; separación prefill/decode; caché KV con su ejemplo de tamaño; *chunked prefill*; *goodput*; cuantización de la caché KV; paralelismo (TP, PP, DP, EP) y servicio en lotes continuos.

**Verificado.**
- Ejemplo de caché KV: 2 × 32 capas × 8192 tokens × 8 cabezas KV × 128 × 2 bytes = 1.073.741.824 bytes = 1 GiB. Correcto.
- *Goodput*: DistServe (arXiv 2401.09670) lo define como la tasa máxima de peticiones servidas cumpliendo el objetivo de nivel de servicio (por ejemplo el 90 %), por GPU; TTFT y TPOT como en el post. Sus cifras (hasta 7,4× más peticiones o 12,6× objetivo más estricto) son de sus montajes, no generales.
- *Chunked prefill*: Sarathi-Serve (OSDI '24) lo combina con planificación sin parones; 2,6× (Mistral-7B, A100), 3,7× (Yi-34B, 2 A100) y 5,6× (Falcon-180B con PP) frente a vLLM, en sus condiciones. DistServe señala que reduce la interferencia pero no la elimina.
- Cuantización de la caché KV: documentación de vLLM, `kv_cache_dtype` fp8 / fp8_e4m3 / fp8_e5m2; sin calibración las escalas valen 1,0 y se recomienda calibrar.
- Ninguna de las cifras de aceleración se cita como general.

**Matices.** ITL y TPOT no son sinónimos exactos en la literatura: definirlos juntos y sin igualarlos. El post no distingue qué optimiza cada técnica (latencia frente a rendimiento) ni su coste en calidad.

**Cobertura del manual (búsqueda de texto en `index.html`, v140).** Ya cubierto: prefill/decode, caché KV, GQA, PagedAttention, FlashAttention, lotes continuos, caché de prefijos, desagregación prefill/decode, inferencia especulativa, TP/EP en MoE; TTFT/ITL ya constaba en §5.7d (entrada de 2026-08-20). Huecos: *goodput* (0 apariciones), TPOT como término (0), *chunked prefill* (0 en el manual; aparece 3 veces en este Triaje), cuantización de la caché KV (0), PP/DP.

**Relevancia.**
- *Manual (media-baja):* un recuadro breve en §5.7d con TTFT/ITL/TPOT, *goodput* según DistServe, *chunked prefill* según Sarathi-Serve y cuantización de la caché KV según la documentación de vLLM; PP/DP opcional.
- *Empreinte (baja-media):* hoy mide solo latencia hasta el fin de la respuesta; no registra TTFT. Ver EM-IE-1. Sujeto a la regla P3 de Empreinte (nada pensado para vender).
- *HyperRAG:* baja (tampoco registra TTFT). *Corpus:* nada.
- *Transversal «Impacto económico de la IA»:* enlaza con el coste por tarea completada (EM-RT-1); sin post.
- *Auditra:* sin detalle aquí (el Triaje es público).

**Veredicto: Integrar, en pequeño** (hecho en el manual, v141). `[Manual: CI-IE-1, HECHO en v141]` `[Empreinte: EM-IE-1]` `[HyperRAG: nada]` `[Auditra: no se detalla aquí]` `[Corpus: nada]`

### 2026-10-30 (c) — «A counterintuitive insight about LLM inference» (CUDA Graphs; post en inglés + infografía «How CUDA Graph Replay Cuts Inference Overhead», autor no identificado)

**Fuente.** Post y infografía, recibidos y leídos. Texto divulgativo, sin datos propios y sin ninguna cifra. Los primarios se leyeron el 30/10/2026 con una herramienta de lectura web que resume, no con los documentos completos.

**Qué dice.** La inferencia puede acelerarse sin acelerar los kernels, recortando el hueco entre operaciones. Una pasada de LLM son muchos kernels pequeños que la CPU lanza uno a uno; en la decodificación token a token se repite la misma secuencia. Un CUDA Graph guarda esa secuencia tras una pasada de calentamiento y la reproduce con un solo lanzamiento; la reproducción vuelve a calcular con entradas nuevas, no reutiliza salidas. Coste: menos flexibilidad (formas, flujo de control y direcciones de memoria compatibles), de ahí varios grafos por forma común, relleno a un tamaño capturado o ejecución eager, con más memoria de GPU y más trabajo de arranque.

**Verificado.**
- Mecanismo (capturar, instanciar, lanzar; grabar una vez y repetir «con mínima interacción de la CPU»): documentación de CUDA Graphs (tutorial intro-to-cuda). La misma fuente dice que los grafos son estáticos tras instanciarse y no da ninguna aceleración medida.
- Varios grafos, relleno y vuelta a eager: diseño de CUDA Graphs de vLLM (`cudagraph_capture_sizes`; sin grafo adecuado, ejecución eager). El modo por defecto usa grafo completo solo para decodificación uniforme y grafos por tramos para el resto; es el que más memoria y más tiempo de captura necesita. Matiza la imagen de «repetir el grafo entero».
- Que las direcciones de memoria deban coincidir NO se encontró en estas dos fuentes: no darlo como verificado.
- La utilidad en la práctica depende de que la decodificación esté limitada por el coste de lanzamiento (modelos o lotes pequeños); con kernels largos el hueco pesa poco. Es razonamiento propio, sin medida. «Mayor utilización de GPU» de la infografía solo vale en ese caso.

**Cobertura del manual (búsqueda de texto, v140).** §5.7d ya tiene «Un tercer diagnóstico: overhead-bound» (coste fijo de despacho, síntoma de GPU ociosa con la CPU al límite, arreglo «capturar la secuencia completa para repetirla como una sola unidad») y entrada propia en el buscador. Falta el nombre CUDA Graphs (0 apariciones) y el coste de la técnica (tamaños capturados, relleno, eager, memoria). El Triaje del 2026-08-19 dejó CUDA graphs fuera por ser ingeniería de quien construye el motor; hoy el concepto ya está en el manual, así que basta una o dos frases, no una sección.

**Relevancia.**
- *Manual (baja-media):* CI-CG-1, ver cabecera.
- *Empreinte:* nada. *HyperRAG:* muy baja; si se compararan latencias entre motores locales, activar o no los grafos sería un confusor (no comprobado cómo lo gestiona llama.cpp).
- *Auditra:* sin detalle aquí (el Triaje es público). *Corpus:* nada.

**Veredicto: Integrar, en pequeño** (hecho en el manual, v141). `[Manual: CI-CG-1, HECHO en v141]` `[Empreinte: nada]` `[HyperRAG: nada]` `[Auditra: no se detalla aquí]` `[Corpus: nada]`

### 2026-10-30 (d) — «Traditional ML Inference vs. LLM Inference» (Avi Chawla, Daily Dose of DS; texto recibido, sin infografías)

**Veredicto: Descartar.** Los cinco puntos ya están en el manual: lotes continuos (14 menciones), desagregación prefill/decode y PagedAttention en §5.7d, enrutamiento por prefijo en §15.4c (llm-d, con el umbral de carga que el texto no menciona) y paralelismo de expertos en §5.7g. Una afirmación habría que acotarla antes de citarla: «las capas de atención se replican en todas las GPU» con paralelismo de expertos depende de la configuración (atención con TP o con DP); no verificado en un primario. Mismo patrón que la entrada `2026-10-12 (i)`. `[Manual: nada]` `[Empreinte, HyperRAG, Auditra, corpus: nada]`
