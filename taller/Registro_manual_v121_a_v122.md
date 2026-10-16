# Registro de cambios · v121 → v122

*16 de octubre de 2026.*

Origen: cuatro pendientes del Triaje que el autor pidió resolver juntos: CI-IT-1 (media), CI-MC-1 (baja-media), CI-DM-1 (baja) y CI-FO-1 (baja).
Antes de escribir se leyeron los primarios (resúmenes y, donde se indica, cuerpo del paper) el 16/10/2026. Sin cambios en las cifras del docx de
Chawla, del artículo de Letourmy ni de los resúmenes divulgativos: no entran.

## Cambios en el manual

- **§9.7b** (nuevo, `id="s97b"`, `data-nivel="profundidad"`, insignia «caduca rápido»), entre §9.7 y §9.8. Marco generación paralela/secuencial y
  selector; tabla de cinco técnicas; apartado «Repartir el cómputo según la dificultad» (Snell, Sprague); recuadro «Regla de diseño» y recuadro
  «Qué no sale de aquí». Entrada de índice añadida (442 → 443).
- **§13.2** (antes de §13.3): recuadro «Matiz (2026-10) · La referencia es el resultado ejecutable, no el texto» (OpenAI, 29/01/2026).
- **§13.7** (antes de §13.8): recuadro «Matiz (2026-10) · La evaluación continua también cubre la documentación del agente» (Anthropic, 03/06/2026).
- **§14.2b** (antes de «Cierre del bucle»): recuadro «Matiz (2026-10) · Rendir más no es calibrar mejor» (Fernandes et al., arXiv:2609.31095).
- **§8.8b**, bloque 3: la verificación adversarial recibe el output y el criterio, no el historial de razonamiento (contexto fresco).
- **§10.4b**: la salida 1 exige un evaluador distinto del agente (enlace a §9.7b); párrafo nuevo sobre la tasa de aprovechamiento, antes de la
  nota sobre el circuit breaker.
- Versión v121 → v122 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## CI-FO-1: resultado de las tres comprobaciones

1. «Aristas falsas»: **ya estaba** en §8.8b bloque 1 («¿B necesita literalmente un output de A para empezar, o solo lo estás secuenciando por costumbre?»). Sin cambio.
2. Verificador con contexto fresco: §8.8b ya pedía que el verificador no compartiera el encuadre, pero no que no recibiera el historial; y la salida 1 de §10.4b no
   decía que el evaluador fuera distinto del agente. Añadido en ambos sitios.
3. Tasa de aprovechamiento: no aparecía. Añadida sin umbral (las cifras del docx, 8/10 y 50 %, eran arbitrarias).

## Verificado en primario (16/10/2026)

- **Snell et al.**, arXiv:2408.03314 (06/08/2024), abstract y cuerpo: dos vías (búsqueda contra verificadores de proceso y adaptación de la distribución
  de respuestas); estrategia adaptativa por dificultad con más de 4× de eficiencia frente a mejor de N; el «14×» vale «donde un modelo base más pequeño
  tiene éxito no trivial». En el cuerpo: relación R = tokens de inferencia / tokens de preentrenamiento (0,16, 0,79, 22); el cómputo en inferencia
  gana en preguntas fáciles e intermedias con poca carga, el preentrenamiento en las muy difíciles o con R ≫ 1; el haz mejora preguntas difíciles con
  presupuesto bajo y **empeora** en las fáciles al subir el presupuesto (explotación del PRM); PaLM 2-S* sobre MATH; verificador propio entrenado con
  rollouts (PRM800K fue «largamente ineficaz»). *Corrige el recuerdo del Triaje: el abstract no habla de «fáciles/intermedias»; eso sale del cuerpo.*
- **Gao, Schulman y Hilton**, arXiv:2210.10760 (19/10/2022): recompensa «dorada» de 6B, proxies de 3M a 3B, 100.000 comparaciones sintéticas; la
  recompensa dorada sube y luego baja con RL y con mejor de n; formas R_bon(d) = d(α − βd) y R_RL(d) = d(α − β log d) con d = √KL.
  El manual solo cita la forma cualitativa, no las fórmulas.
- **Huang et al.**, arXiv:2310.01798 (03/10/2023; v2 14/03/2024; ICLR 2024): autocorrección intrínseca sin retroalimentación externa; GPT-4 GSM8K 95,5 → 91,5 → 89,0;
  GPT-3.5 CommonSenseQA 75,8 → 38,1 → 41,8; las mejoras previas usaban la etiqueta correcta para parar; debate multiagente 83,0 frente a autoconsistencia 88,2
  con 9 respuestas. (Esta última cifra no se usa en el texto.)
- **Wang et al.**, arXiv:2203.11171 (21/03/2022; ICLR 2023): autoconsistencia; +17,9 % GSM8K, +11,0 % SVAMP, +12,2 % AQuA, +6,4 % StrategyQA, +3,9 % ARC-challenge
  (se citan los dos extremos, tal como los da el abstract, sin precisar si son puntos o relativos).
- **Loo**, arXiv:2511.00751 (02/11/2025; v2 07/05/2026): Gemini 2.5, +0,4 HotpotQA con 20 muestras y +1,6 MATH-500, coste casi lineal con las muestras; preprint de un autor.
- **Yao et al.**, arXiv:2305.10601: juego del 24, GPT-4 con cadena de pensamiento 4 %, con árbol de pensamiento 74 %.
- **DeepSeek-R1**, arXiv:2501.12948: **versión 1 (22/01/2025)**, sección «Unsuccessful Attempts» (PRM: paso fino difícil de definir, juicio de pasos intermedios
  difícil, reward hacking del modelo aprendido; MCTS: espacio de búsqueda de tokens enorme, modelo de valor difícil de entrenar; los autores aclaran que no
  significa que no puedan servir). La versión revisada de 2026 (y la de *Nature*) tiene un texto distinto: cuando se cita, se cita la v1.
- **Gema et al.**, arXiv:2507.14417 (19/07/2025), abstract: tareas con razonamiento más largo y peor exactitud; Claude más distraído por información irrelevante,
  serie o de OpenAI sobreajustada al encuadre. También menciona un aumento de declaraciones de autoconservación en Claude Sonnet 4: **no se usa**.
- **Sprague et al.**, arXiv:2409.12183 (18/09/2024; v3 07/05/2025): metaanálisis de más de 100 artículos y 20 conjuntos de datos con 14 modelos; la cadena de pensamiento ayuda sobre todo en matemáticas y lógica simbólica.
- **Fernandes et al.**, arXiv:2609.31095 (25/09/2026): N = 366; el abstract confirma lo cualitativo (rendir más, estimaciones que siguen peor el rendimiento, discriminación de la
  confianza menor con IA pero no establecida dentro de la tarea, Dunning-Kruger en ambos grupos con mayor contraste con IA, diferencia controlada inconclusa).
  Las cifras (187/179, +7,22, 0,66→0,78, r = 0,07 frente a 0,40) vienen de la lectura del PDF del 12/10/2026 recogida en el Triaje `2026-10-12 (f)`, no se volvieron a leer hoy.
  *El abstract no habla de «observacional/exploratorio»; ese diseño y la ausencia de preinscripción y de asignación aleatoria salen del PDF.*
- **Anthropic** (blog, 03/06/2026, Josh Cherry et al.): «no excedió el 21 %» sin skills; «consistentemente por encima del 95 % en conjunto» con ellas; «de ~95 % en el lanzamiento a ~65 % en un mes»;
  causa dada por el blog: skills sin mantenimiento; evaluaciones generadas por Claude y validadas por personas; sin tamaño total; el «95 %» de la introducción es cuota de automatización.
- **OpenAI** (29/01/2026): pares pregunta–respuesta, SQL «dorada» escrita a mano, comparación de la SQL y de los datos resultantes, sin comparar cadenas, «como pruebas unitarias» y avisos tempranos en producción.

## Comprobaciones del HTML

- v121 archivado íntegro en `archivo/Comprender_la_IA_2026_v121.html` (md5 `f084f5adf99894bc7d9d1ec457b81ab8`, idéntico al `index.html` previo).
- Balance de etiquetas (aperturas = cierres) y cambios: div 5292→5298, p 1590→1593, table 236→237, tr 1366→1372, td 3876→3896, li 729→732, ul 169→170, h2 264→265, h3 417→418;
  32.767 → 32.808 líneas. Ningún `id` perdido ni duplicado; el único nuevo es `s97b`. Sin enlaces internos rotos nuevos.
- Abierto en Chromium (Playwright) desde una copia: la sección se despliega con el botón de profundización, la tabla y los recuadros se ven bien, sin desbordamiento horizontal a 1280 px.
  Los errores de consola son recursos externos bloqueados por la red del entorno, no del contenido.

## No hecho / a tener en cuenta

- Sin las cifras del docx de Chawla (como «cómputo en inferencia supera a un modelo 14× mayor» sin condición, ni la fórmula de que con verificador exacto el beneficio se sostiene): la regla de verificador primero va como regla de diseño del manual, no como hallazgo.
- Sin RULER ni los trabajos de sobreoptimización por proceso más allá de Gao y Snell; sin «inverse scaling» más allá de Gema.
- No se tocó la tabla de bibliografía del final del manual (la entrada de Wang et al. sigue como estaba).
- Fuera de este repo, sigue abierto en el proyecto de Tres Domesticaciones comprobar si cita a Gao et al.; el manual sí lo cita ahora en §9.7b.
- Pendientes de veille que siguen abiertos: CI-BN-1..3 (Observar) y CI-HK-1 (Observar). Sin push.
