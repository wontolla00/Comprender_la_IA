# Topología vs Modelo: por qué el gráfo escala, no el LLM

*(draft para sección de Comprender_la_IA, basado en Graph Engineering article, 2026-09-22)*

## Tesis

Lo que escala un sistema multi-agente no es la inteligencia del modelo. Es la **forma del trabajo**. El gráfo, no el LLM.

La mayoría de la gente construye sistemas de IA como líneas: paso uno, paso dos, paso tres, cada uno esperando al anterior. Funciona. Es lento. Y es un error de topología, no un error del modelo.

## El problema de la línea

Una línea es una cadena de secuencia pura. Cada paso depende del anterior:

```
entrada → agent_1 → agent_2 → agent_3 → ... → salida
```

Parece natural porque es cómo escribimos: en orden. Pero miente sobre las dependencias reales.

En una auditoría de seguridad:
- "revisar función A, luego revisar función B"
- La revisión de B **nunca lee el resultado de A**
- Pero se ejecutan secuencialmente de todas formas
- Una tarda 2s, otra tarda 20s
- El resultado total es 22s, no 20s

Eso es una **arista falsa** — una dependencia que no existe en la realidad.

Graph Engineering lo llama el "fake edge test": en cada paso, ¿necesita realmente el resultado del paso anterior? Si no, no hay arista. Corre en paralelo.

## Dónde vive el juicio

Pero no todo puede corer en paralelo. Aquí es donde entra la **topología real**.

Toma cualquier sistema multi-agente que funciona:
1. Varios agentes trabajan **en paralelo** (fan-out)
2. Se comprime el ruido (reduce — código puro, sin modelos)
3. Un agente final escribe la respuesta (synthesize — donde vive el juicio)

Esa forma se llama el **diamante**: fan-out, reduce, synthesize.

```
entrada
  |
  +-- agent_1 (cheap model)
  |
  +-- agent_2 (cheap model)
  |
  +-- agent_3 (cheap model)
  |
reduce (sin tokens)
  |
synthesize (strong model)
  |
salida
```

En Auditra: múltiples evaluadores (fan-out), un verifier (reduce), decisión final (synthesize).

En Empreinte: múltiples capas RAG en paralelo (fan-out), fusión deduplicada (reduce), generación final (synthesize).

En HyperRAG: múltiples fuentes (fan-out), reranking y compresión (reduce), respuesta final (synthesize).

Lo que cambia no es el modelo. Es dónde vive el juicio.

## Model tiering: caro solo donde importa

Una vez que ves el diamante, becomes obvio: no todo paso necesita el modelo fuerte.

Los nodos "aburridos" —extraer un campo, clasificar un ticket, validar una fuente— puede correr en modelo barato.
Los nodos "donde vive el juicio" —sintetizar una decisión, arbitrar un hallazgo, escribir la respuesta— merecen el modelo fuerte.

Graph Engineering lo describe así:

> "Run the boring nodes on a cheaper model and spend your expensive tokens where judgment actually lives."

Si pones model GPT-4 en 100 agentes baratos, pagas por algo que no necesita juicio.
Si pones model-barato en 100 agentes y model-fuerte en 1 (la síntesis), ahorras 99x el coste sin perder calidad.

Auditra lo hace: evaluadores baratos (context-light), verifier fuerte (donde se refuta).
Empreinte lo hace: BM25/Vector (sin modelo), reranker (barato), generador final (fuerte).

## Anchors: lo que no puede optimizarse

Hay otro patrón que aparece en los buenos sistemas: **algunas reglas están congeladas**.

No porque sean correctas, sino porque un optimizador las doblaría para ganar.

En Auditra: una política BLOCK debe mantenerse congelada aunque signifique rechazar acciones válidas. Si se permite la optimización, el sistema presionará para bajarla a REVIEW "para mejorar eficiencia".

En bancos: "todo depósito > 100K va a revisión manual" debe estar congelado, aunque esto ralentice el sistema. Si se permite optimizar, la lógica presionará para subir el umbral "ya que el modelo es muy bueno."

Graph Engineering lo llama "anchors that keep a graph honest":

> "some rules must be frozen, the ones an optimizer would be tempted to weaken, kept off-limits precisely because they are the ones it would bend to win."

Son la diferencia entre "sistema que funciona" y "sistema que se confía es honesto."

## Responsabilidad sin origen

Hay un caso extremo donde el gráfo explota: cuando no hay **contratos claros en los nodos**.

Cada nodo debe tener un límite: un input definido, un output definido, un job único.

Si un nodo tiene dos jobs:
- No puede paralelizarse (depende de sí mismo)
- No puede verificarse (¿cuál output verifica?)
- No puede debuggearse (falló, ¿en cuál job?)

Cuando no hay contratos claros, la cadena de decisión se vuelve:

> "la cadena es perfectamente conforme y está perfectamente vacía"

(Doc. 14, *El_Umbral*: cada eslabón cumplió su procedimiento, pero nadie decidió nada. La responsabilidad desapareció en el vacío entre nodos mal definidos.)

Graph Engineering fuerza contratos: cada nodo tiene su job clara, su input schema, su output schema. Si la salida es "pared de texto libre," el siguiente nodo no puede leerla. Si es schema fijo, el siguiente nodo consume sin adivinar.

## Cuándo NO usar gráfo

El artículo cierra con algo importante:

> "A graph buys breadth. It does not buy better judgment."

No uses gráfo cuando:
- El trabajo es pequeño o aislado (arreglar un bug, añadir una función) — la coordinación es overhead
- Necesitas control cercano (leer y aprobar cada paso) — el punto del gráfo es que corra sin ti
- No sabes qué buscas (exploración) — quieres un agente que puedas steer
- Los pasos genuinamente dependen unos de otros — si cada paso lee el anterior, **no hay paralelismo**

El test es simple: ¿hay dos jobs sin arista entre ellos? Si sí, hay gráfo. Si no, es una línea.

Una línea que funciona es mejor que un gráfo que impresiona pero es más lento.

## La transición

Cuando pasaste de "un agente que hace todo en cadena" a "múltiples agentes que se coordinan", pasaste de prompter a arquitecto.

El modelo no cambió. El razonamiento sigue siendo el mismo. Lo que cambió es la **forma**: dónde corren las cosas, cómo se sincronizan, dónde vive el juicio, cuál nodo puede refutar a cuál.

Eso es topología. Y es lo que escala.

---

## Nota editorial

Esta sección busca nombrar explícitamente un patrón que ya existe en tus sistemas (Auditra, Empreinte, HyperRAG) pero que no está documentado como principio transversal.

Graph Engineering articula algo que ya sabías: el gráfo no es una técnica fancy, es cómo se distribuye realmente el trabajo cuando **eliminitas el overhead de coordinación.**

La pregunta siguiente es dónde en Comprender_la_IA vive esta idea. Opciones:
1. Subsección en capítulo existente sobre "arquitectura"
2. Capítulo nuevo: "Topología y gobierno de sistemas"
3. Integrada en la sección sobre "multi-agente" si existe

Decidelo. La sección es ~1500 palabras, lista para editar o expandir.
