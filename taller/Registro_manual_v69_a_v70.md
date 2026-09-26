# Registro de cambios · v69 → v70

*Agosto 2026.*

Cinco cambios, de dos fuentes distintas aportadas por el usuario el mismo
día: el artículo "How LLM Inference Works" (Akshay Pachaar,
@akshay_pachaar / DailyDoseOfDS.com) más su infografía adjunta "7 LLM
Generation Parameters", y la infografía "72 Techniques to Optimize LLMs in
Production" (mismo publisher). Detalle completo del triaje de ambas,
incluida la comprobación de cobertura de las 72 técnicas y por qué 41 de
las 44 ausentes quedan fuera por diseño, en `Triaje_fuentes_externas_2026.md`.

Esta vez el proceso se hizo en el orden correcto: `archivo/Comprender_la_IA_2026_v69.html`
se archivó **antes** de tocar el fichero en vivo, no después (incidencia
corregida en la edición v68→v69 — ver `Registro_manual_v68_a_v69.md`).

---

## §3.4/§3.4b — Distinción frequency/presence penalty + max_tokens/stop sequences (Cap. 0)

**Qué faltaba.** §3.4 ya cubría temperature, top-k y top-p con más
profundidad que la infografía de origen (incluye no-determinismo residual,
que la infografía no menciona), pero agrupaba frequency y presence penalty
bajo un único "repetition penalty" genérico — la infografía sí distingue
correctamente que una escala con el conteo de apariciones y la otra es
binaria por aparición, con efectos prácticos distintos (bucles vs.
estrechez temática). Tampoco había un tratamiento explícito de max_tokens
(corte duro, no "pide un resumen") ni de stop sequences.

**Qué añade.** La distinción frequency/presence penalty reemplaza el
"repetition penalty" genérico; una nueva §3.4b cubre max_tokens y stop
sequences como los dos controles de cuándo termina la generación; un
callout con el matiz práctico de la fuente que no estaba en el manual:
temperature y top-p amplían el mismo conjunto de candidatos por caminos
distintos, así que ajustar los dos a la vez hace imposible atribuir el
efecto — mover uno, fijar el otro.

## §5.5c — Frontera: DeepSeek-V4 y la atención rediseñada alrededor de la caché (Cap. 5)

**Qué faltaba.** El manual solo mencionaba "DeepSeek V4-Pro" en una tabla
de benchmarks de razonamiento (línea ~14316), sin explicar su
arquitectura. MLA (DeepSeek V2/V3, ya cubierto en profundidad en §5.5c)
trata la caché KV como un coste que se comprime después; DeepSeek-V4
(arXiv:2606.19348, verificado) desplaza el punto de partida: atención
híbrida (dispersa comprimida + densamente comprimida + ventana deslizante)
diseñada desde cero para que la caché no crezca sin control.

**Qué añade.** Nota de frontera (⚡) con la cifra verificada contra el
paper original: ~10% del tamaño de caché KV y ~27% del cómputo por token
frente a V3.2, en contexto de 1M tokens. Marcada explícitamente con nota
de caducidad — cifras y arquitectura de un modelo concreto, alta
volatilidad; el principio (rediseñar en vez de comprimir después) es el
dato estable.

## Multi-LoRA serving (Cap. 1, tras §1.6b)

**Qué faltaba.** El manual cubre LoRA a fondo como técnica de fine-tuning
(mecánica, calculadora de parámetros) pero no el patrón de despliegue que
la hace viable en producción a escala: servir muchos adaptadores desde una
única copia del modelo base.

**Qué añade.** El patrón S-LoRA/LoRAX — modelo base cargado una vez,
adaptadores ligeros intercambiados por petición — como continuación
natural de la calculadora de parámetros LoRA ya existente (que muestra por
qué el adaptador pesa megabytes, no gigabytes). Cierra con el límite real:
no es de memoria, es de gobernanza — trazabilidad de qué adaptador
respondió qué, conectado explícitamente con §4.7 (procedencia), ahora
aplicado a pesos entrenados en vez de a texto.

## Semantic caching (Cap. 8, §8.8)

**Qué faltaba.** §8.8 ya cubre prompt caching (coincidencia exacta de
prefijo) pero no el caso de consultas parecidas-pero-no-idénticas, habitual
en RAG con usuarios que formulan la misma pregunta de mil formas.

**Qué añade.** El mecanismo (embeber la consulta, buscar por similitud
contra un índice de consultas ya respondidas, servir la respuesta cacheada
bajo un umbral) con una advertencia explícita sobre el riesgo real: un
umbral laxo devuelve la respuesta de una pregunta distinta que solo se
parece en superficie — mismo riesgo de falso positivo por similitud coseno
que ya trata el Cap. 6 para retrieval, aquí con consecuencia peor porque el
LLM no vuelve a mirar la pregunta real. Con la recomendación de medir la
tasa de falsos positivos con un golden dataset de pares "parecidos pero
distintos" antes de activarlo en dominios de alto riesgo.

## §12.4c — Model routing y cascading (Cap. 12, nueva sección)

**Qué faltaba.** §12.4b ya resuelve "¿clasificador o LLM?" pero no la
decisión un nivel más abajo, una vez que la respuesta ya es "LLM": enrutar
o escalar entre modelos según coste/complejidad.

**Qué añade.** Distinción entre los dos patrones —cascading (consulta al
modelo barato primero, escala si hace falta, paga al menos una llamada
siempre) y routing (un clasificador barato decide antes de llamar a ningún
LLM, una sola llamada de generación)— con el criterio real de elección: no
es arquitectónico, es cuánta confianza tienes en tu propia señal de "esta
consulta es fácil". Cierra con el reconocimiento de que §8.8b ya aplicaba
el mismo patrón dentro de un grafo de agentes sin nombrarlo así — mismo
principio, unidad de enrutado distinta.

---

## Verificación

- Snapshot de v69 archivado **antes** de editar (proceso correcto esta
  vez): `archivo/Comprender_la_IA_2026_v69.html`, 2.355.191 caracteres —
  coincide exactamente con el tamaño del v69 en vivo antes de tocarlo, y
  un grep de los marcadores nuevos (`v70`, "Multi-LoRA serving: por qué",
  "Semantic caching <span", frontera de DeepSeek-V4) devuelve cero
  coincidencias.
- v70: `div` 4703/4703, `table` 227/227, `h2` 249/249 (+1, §12.4c), `h3`
  382/382 (+3: §3.4b, "Multi-LoRA serving", "Semantic caching"), `tr`
  1300/1300, `ul` 161/161 (+2, las listas de la comparativa routing/
  cascading), `style` 9/9, `script` 40/40, `p` 1359/1359,
  `main`/`section`/`aside`/`nav`/`details` sin cambios.
- Ningún `id` nuevo introducido (todas las inserciones son subsecciones
  sin ancla propia, salvo §12.4c que usa numeración de encabezado sin
  atributo `id` — mismo patrón que otras subsecciones nuevas de v68/v69,
  sin entrada de TOC propia).
- Tamaño: 2.355.191 → 2.363.947 caracteres (+8.756).
- Carpeta principal: solo `Comprender_la_IA_2026_v70.html`.

## Alcance

De las 44 técnicas ausentes detectadas en la comprobación de cobertura de
las 72, se implementaron 3 (semantic caching, multi-LoRA serving, model
routing/cascading) por ser las únicas dentro del alcance ya declarado del
manual (audiencia de arquitectura/gobernanza/RAG, no de ingeniería interna
de motores de inferencia). Las 41 restantes —paralelismo de bajo nivel,
kernels, scheduling de GPU, variantes exóticas de decodificación
especulativa, gestión de caché KV en tiempo de ejecución— quedan anotadas
en el triaje como exclusión deliberada de alcance, no como pendiente.
