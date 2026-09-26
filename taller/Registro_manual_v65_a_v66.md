# Registro de cambios · v65 → v66

*Agosto 2026.*

Tres cambios. Uno cierra un hueco de la tabla de métricas del Cap. 6, otro
extiende el hilo de la procedencia a la capa que faltaba, y el tercero afila
una sección existente con una medida que la contradice a medias.

Los tres proceden de medidas propias sobre un laboratorio de evaluación RAG
instrumentado (corpus de 84 documentos multilingüe, 5.730 fragmentos,
conjunto de respuesta de 38 casos con verificación por token único, sin juez
LLM). Las cifras que aparecen en el manual están acotadas a ese laboratorio
y así se declaran en el texto.

---

## §6.5a — El techo del oráculo (nuevo, Cap. 6)

**Qué faltaba.** La tabla de §6.5 lista Hit Rate@5, MRR, Recall@10 y NDCG.
Las cuatro miden lo mismo desde ángulos distintos: si el fragmento correcto
llega. Ninguna responde a la pregunta anterior —*¿podría el modelo responder
si le llegara?*— y sin ella el recuadro de diagnóstico de §6.5 solo cubre el
caso en que el retrieval falla.

**Qué añade.**

- Dos medidas: el **techo del oráculo** (solo el pasaje correcto en el
  contexto) y el **suelo sin contexto** (contexto vacío; si acierta, el
  golden dataset mide memoria paramétrica, no recuperación).
- Un árbol de diagnóstico de **tres ramas** en lugar de dos, con una columna
  de «qué *no* hacer» por rama.
- La tercera rama —techo alto, Hit Rate alto, sistema que falla igual— es la
  que §7.1 no cubre, y la que manda a re-trocear el corpus: la intervención
  más cara del pipeline y la única que invalida todas las medidas anteriores.

**Respaldo externo.** La misma construcción aparece en *Empty Shelves or Lost
Keys? Recall Is the Bottleneck for Parametric Factuality* (Calderon,
Ben-David, Gekhman, Ofek, Yona — Google Research / Technion, ICML 2026),
sobre 2.150 hechos, 13 modelos y 4M de respuestas, para separar los hechos
que un LLM no tiene de los que tiene y no recupera. Su medida de codificación
es la misma idea del techo. Su resultado —codificación saturada al 95-98% en
modelos de frontera, el cuello está en el acceso— entra como terminología de
consenso citable, no como propuesta del autor.

## §13.15 — El arnés que miente (nuevo, Cap. 13, ★ Propuesta del autor)

**Dónde encaja.** El hilo de la procedencia (§4.7b, §8.7b, §10.9.6) describe
un mismo patrón en tres capas: un artefacto sobrevive sin su procedencia,
nada se rompe, y el error aparece semanas después como degradación difusa.
Faltaba la capa donde más daño hace, porque es la que debería detectar a las
demás: el arnés de evaluación.

**Los tres casos**, todos con la misma forma —el número sobrevive, la
condición que lo produjo no— y ninguno lanza excepción:

1. **Caché semántica cuya clave descarta los parámetros del barrido.**
   Indexa por texto de consulta; ni `top_k` ni las capas entran en la clave.
   El daño es proporcional a lo bien diseñado que esté el experimento:
   cuanto más cuidadosamente se repite la misma consulta entre condiciones,
   más se corrompe la comparación.
2. **Componente presente en el pipeline y ausente de la etiqueta.** Un
   compresor LLM activo por defecto en configuración, apagado a mano en la
   interfaz y no tocado por el arnés. Vivía en la mitad del sistema que
   ningún instrumento miraba, porque solo afecta a `query()` y los arneses de
   recuperación llaman a `retrieve()`. Coste no declarado: una llamada al
   modelo **por fragmento** — 21 por consulta a k=20.
3. **`assert` que valida su propia declaración, y test que hace `grep`.** El
   arreglo del caso 2 comprobaba el flag; el motor preguntaba por el objeto,
   construido en el arranque. El `assert` pasaba con el componente activo. Y
   el test que decía cubrirlo buscaba la cadena del `assert` en el código
   fuente: estaba escrita, y pasó en verde durante toda la vida del defecto.

**Concepto que introduce:** *validación decorativa* — el equivalente en QA de
la supervisión decorativa de §14.2. Un `assert` y un test son artefactos cuya
única función es certificar una condición; cuando certifican la *declaración*
de la condición, siguen existiendo, siguen pasando, y ya no certifican nada.

**Las tres reglas que deja:**

- Un `assert` de evaluación interroga el atributo que el sistema lee en la
  ruta caliente, no el que el arnés acaba de escribir.
- Un test que busca una cadena en el fuente comprueba una intención, no un
  efecto. Si puede pasar con el sistema roto, no es un test.
- La etiqueta de una tanda enumera todos los componentes que tocan el dato.
  Cuenta las llamadas al modelo: si no cuadran con la arquitectura
  declarada, hay un componente sin declarar.

## §10.9.6 — Matiz: cómo distinguir los dos fallos de frontera

**Qué decía.** La sección nombra dos fallos que hacen que un sistema con
buenas métricas de recuperación funcione mal: *recuperar sin presupuesto* (la
ventana se llena) y *recuperar bien y colocar mal*.

**Qué añade.** Una prueba de dos minutos que los separa, y que además puede
descartar los dos: variar el número de fragmentos y mirar si el acierto se
mueve. Si empeora al triplicar, es presupuesto. **Si no se mueve en
absoluto**, el material añadido no estorba — no es presupuesto ni colocación,
y el sospechoso está *entre* la recuperación y la generación.

Medido: pasar de 5 a 20 fragmentos triplicó el contexto de generación (de
~6.000 a ~19.400 caracteres) sin cambiar el acierto ni un caso sobre 38. La
frontera fallaba, pero no por presupuesto. No contradice la sección: le añade
la rama que le faltaba.

---

## Verificación

- Parseo `lxml` correcto.
- **0** enlaces internos rotos (v65 también tenía 0; ninguno nuevo).
- Sin `id` duplicados.
- Balance de etiquetas conservado: `div` +9/+9, `table` +3/+3, `h2` +1/+1,
  `h3` +5/+5.
- Índice actualizado con las dos entradas nuevas; versión del documento,
  `<title>` y barra superior a v66.
- Tamaño: 2.231.503 → 2.245.016 caracteres (+13.513).

## Alcance de las cifras

Todo número propio citado en v66 procede de un laboratorio de un solo corpus,
con n=38 en el conjunto de respuesta. El texto del manual lo declara donde
aparece. Lo que se enseña como transferible es el **instrumento** (la medida
de techo), el **árbol de decisión** y los **mecanismos** de los tres defectos
—que son hechos de código, no estadística—, no los porcentajes.

---

## Corrección aplicada el mismo día, antes de distribuir

v66 se redactó con la tanda de respuesta disponible en ese momento, que se
había ejecutado **con un compresor de contexto activo sin declarar**. El
control limpio se ejecutó horas después y cambió el diagnóstico:

| | con compresor | sin compresor |
|---|---|---|
| acierto k=20 | 55,3% | **92,1%** |
| acierto k=5 | 55,3% | **94,7%** |
| fabricación | 13,2% | 0-2,6% |
| duración de la tanda | 31,7 h | 1,6 h |

El hueco de 42 puntos entre el techo del oráculo y el sistema —que se leía
como un fallo de utilización del contexto— **era el compresor**. Sin él, la
distancia al techo es de 1-2 casos sobre 38, dentro del ruido del sistema.

Tres pasajes corregidos antes de que la versión saliera de la máquina:

1. **§6.5a, recuadro final.** Se añade la advertencia: la medida de techo
   señala que el problema no está en la recuperación, pero **no dice qué hay
   en medio**. Antes de concluir que el modelo no sabe usar lo que recibe,
   hay que enumerar lo que toca el contexto entre retrieval y generación.
2. **§10.9.6, matiz.** Cifras sustituidas por las del control limpio
   (~7.400 → ~24.900 caracteres, un caso de diferencia) y se nombra el
   desenlace real: la causa era la tercera opción, ni presupuesto ni
   colocación.
3. **§13.15, caso 2.** El componente sin declarar tenía hasta ahora un coste
   de latencia. Ahora tiene coste de **acierto**: 37 puntos, 15 casos
   rescatados de 38, fabricación multiplicada por cinco. Es el mayor efecto
   medido en ese laboratorio — mayor que la capa vectorial, que `top_k` y que
   el reranker. La lección queda explícita: al comparar técnicas de RAG, la
   variable no declarada puede pesar más que todas las declaradas juntas.

**Decisión de versionado.** La corrección se aplica sobre v66 en lugar de
publicar una v67, porque v66 no había salido de la máquina y publicar a
sabiendas una revisión con una cifra desmentida es peor para el lector que
corregirla. La procedencia del cambio queda aquí, que es donde debe estar.

Verificación tras la corrección: parseo `lxml` correcto, 0 enlaces internos
rotos, `div` 4672/4672 balanceados.
