# Registro de cambios · v75 → v76

*Agosto 2026.*

Mismo origen que v67→v68 y v73→v74: surgió de una conversación fuera del
manual (esta vez sobre un post técnico de LinkedIn — un "benchmark" de
autor individual comparando generación libre + retry loop contra
decodificación restringida por gramática, GBNF, en llama.cpp). El post
en sí no se incorpora — su metodología no aguanta la precisión que
muestra (N=12 tareas sin repeticiones, conflación entre lo que resuelve
el LLM y lo que resuelve un motor simbólico determinista, cifras con
falsa precisión decimal). Lo que sí es real y verificable, y sí faltaba
en el manual, es la técnica de fondo: la sección "Structured output:
JSON garantizado" (§8.x) cubre solo el caso de API alojada (OpenAI,
Anthropic, Google) y no menciona el equivalente local/open-weight.

Snapshot de v75 archivado **antes** de editar:
`archivo/Comprender_la_IA_2026_v75.html`, 2.442.611 bytes, copia exacta
del v75 en circulación.

---

## La inserción

### §8.x — "Structured output: JSON garantizado": extensión al caso local

Insertado como un `<div class="callout">` nuevo, inmediatamente después
del ejemplo de código de la API de OpenAI (`response_format: {type:
"json_object"}`) y antes de `<h3>El prompt de sistema...</h3>`. No se
creó una sección `<h3>` nueva ni se tocó el ejemplo existente — es una
extensión lateral del mismo concepto, con el mismo criterio que ya usó
v74→v75 para no duplicar patrones ya nombrados.

**Por qué aquí y no como sección nueva:** el ejemplo de OpenAI ya
establece "usa el modo de salida estructurada de la API" — el callout
añadido responde a la pregunta que ese ejemplo deja abierta sin
plantearla ("¿y si no hay API, si el modelo corre local?"), con la
misma estructura pedagógica (afirmación general → mecanismo →
limitación explícita → caso real).

**El contenido.** Explica GBNF (Grammar-Based Neural Format) y
decodificación restringida por JSON Schema como el equivalente local a
`response_format`: enmascara tokens candidatos en cada paso de
generación en vez de validar después. Incluye la limitación que un
lector podría pasar por alto: la garantía es sobre sintaxis, no sobre
contenido (un modelo restringido sigue pudiendo poner un valor en el
campo equivocado, solo que ya no puede romper el JSON al hacerlo) — el
mismo tipo de precisión que el manual ya exige en otras secciones
(§2.5, §6.6b) al separar lo que un mecanismo garantiza de lo que parece
garantizar.

**Caso real citado, verificado antes de escribirlo, no asumido.** El
propio autor de este manual mantiene HyperRAG (motor RAG usado en
producción por Empreinte). Su capa de extracción de grafo
(`graph_layer.py`) generaba JSON libre con reparación por regex y
reintento por chunk fallido — el mismo patrón "Modo A" que el post
externo criticaba, presente sin que nadie lo hubiera notado hasta esa
conversación. Se sustituyó por decodificación restringida vía
`response_format` (litellm 1.90.4 enrutando a Ollama local) el mismo
día que se escribe este registro. Verificación antes de citarlo aquí:

- Los 666 tests de `hyperrag/tests/` pasan sin modificarse.
- Prueba end-to-end real contra Ollama local (`mistral:latest`, dos
  chunks sobre Marie Curie/Sorbonne): 7 nodos y 5 aristas correctos en
  un único intento, sin activar el log de reintento que el patrón
  anterior producía.
- El código de reparación por regex (`_repair_json()`) y el reintento
  por chunk **no se eliminaron** — quedan como red de seguridad para
  proveedores que no honran `response_format`, consistente con la
  propia advertencia del callout de que la garantía no es universal.

No se reclama que HyperRAG sea representativo de nada más allá de sí
mismo — se cita como ejemplo real y verificado, no como evidencia
generalizable de que esto siempre funciona igual de bien en cualquier
proveedor/modelo.

---

## Lo que se dejó fuera, deliberadamente

- **El benchmark del post original** (cifras de latencia, precisión
  CSP, ahorro de tokens): no verificable de forma independiente (N=12,
  sin repeticiones, sin dataset/código enlazado), y la comparación
  mezcla dos variables (decodificación restringida vs. motor simbólico
  determinista) sin separarlas — no aporta nada citable al manual con
  el estándar de verificación que este documento exige.
- **Una sección nueva sobre neurosimbólica aplicada a extracción de
  grafos:** el manual ya cubre esto con más generalidad y mejor
  fundamento en §9.10.3 (taxonología Traductor/Verificador/Sustrato) y
  el Patrón Sándwich (Cap. 12) — el caso de HyperRAG es una instancia
  de "Sustrato" ya nombrado, no un concepto nuevo que justifique una
  sección propia.

## Verificación

- Balance de etiquetas verificado contra el snapshot pre-edición
  (`archivo/Comprender_la_IA_2026_v75.html`):

  | | v75 (archivado) | v76 | Δ | esperado |
  |---|---|---|---|---|
  | bytes | 2.442.611 | 2.444.116 | +1.505 | — |
  | `h2` | 254 | 254 | 0 | 0 |
  | `h3` | 397 | 397 | 0 | 0 |
  | `table` | 223 | 223 | 0 | 0 |
  | `tr` | 1.283 | 1.283 | 0 | 0 |
  | `div` (abre/cierra) | 4.838 / 4.838 | 4.839 / 4.839 | +1 / +1 | +1 (callout nuevo) |
  | `p` | 1.443 | 1.443 | 0 | 0 (sin párrafos `<p>` nuevos, el contenido va dentro del callout) |
  | `span` | 1.539 | 1.539 | 0 | 0 |
  | `strong` | 2.203 | 2.205 | +2 | +2 (título del callout + "decodificación restringida por gramática") |
  | `em` | 509 | 511 | +2 | +2 ("sintaxis" y "contenido") |
  | `a` | 399 | 399 | 0 | 0 (sin fuentes externas nuevas — el caso citado es trabajo propio verificado en la misma sesión, no una fuente de tercero que enlazar) |
  | `code` | 330 | 332 | +2 | +2 (dos menciones inline de `response_format`) |

  Todas las cifras cuadran exactamente con lo insertado.
- Verificación en navegador (servidor HTTP estático local, puerto 8791):
  el texto nuevo está presente en el DOM renderizado dentro de
  `<div class="callout">`, con `containerDepth` = 2 respecto a
  `.container` — idéntico a la profundidad del callout inmediatamente
  anterior ("Chain-of-Thought contraproducente") y del inmediatamente
  posterior ("Qué va en el prompt de sistema"), confirmando que no hay
  fuga de estructura fuera de la columna de lectura.
- Carpeta principal: se elimina `Comprender_la_IA_2026_v75.html` del
  directorio raíz (queda solo en `archivo/`), permanece
  `Comprender_la_IA_2026_v76.html` como único archivo vivo.
- `<title>` y badge de la topbar actualizados de "v75" a "v76".

## Alcance

Una inserción puntual dentro de una sección ya existente (§8.x,
"Structured output"); ninguna sección nueva, ninguna renumeración de
patrones, ningún contenido retirado. No se tocó ningún otro capítulo.
