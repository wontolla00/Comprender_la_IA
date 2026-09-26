# Registro de cambios · v67 → v68

*Agosto 2026.*

Once cambios, aplicados en el orden de prioridad fijado con el usuario tras
revisar el triaje completo de fuentes externas
(`taller/Triaje_fuentes_externas_2026.md`). Se excluyó deliberadamente el
candidato nº12 de esa lista (BCMT) por evidencia insuficiente — sigue
anotado en el log como "no recomendado".

---

## Prioridad alta

### §5.7f — Leyes de escalado: Kaplan (2020) y Chinchilla (2022) (nuevo, Cap. 5)

**Qué faltaba.** El manual explica en profundidad el interior de un LLM
(MoE, GQA/MLA, cuantización, FlashAttention, hardware) pero nunca explicaba
el marco que determina *por qué* los modelos se entrenan con el tamaño y
volumen de datos que tienen. Hueco confirmado por búsqueda: cero menciones
a "scaling law", "Chinchilla" o "Kaplan" en v67.

**Qué añade.** Ley de potencia de Kaplan et al. (parámetros/datos/cómputo),
la corrección de Chinchilla (~20 tokens/parámetro a cómputo fijo), el caso
Gopher (280B, infraentrenado) vs. Chinchilla (70B, mismo cómputo, más
datos, mejor rendimiento) y la conexión explícita con las decisiones de
fine-tuning/RAFT que ya trata Cap. 1 (§1.6b, §1.8).

### §8.7b — Refuerzo empírico con Chakrabarti 2026 (Cap. 8)

**Qué faltaba.** §8.7b es una propuesta del autor (★, v63) sin respaldo
externo — el campo `why` con "un número, no una intención" era intuición
razonada, no dato.

**Qué añade.** Cita a Chakrabarti, "Why Does CLAUDE.md Keep Growing?"
(arXiv:2608.11095, ago. 2026): 247.694 ciclos de vida de instrucciones en
1.867 repos reales confirman el mismo mecanismo (recuerdo imperfecto,
hazard de eliminación que cae con la edad) y validan experimentalmente que
comentarios con razonamiento verificable —el mismo patrón del campo
`why`— eliminan el 99,3% del exceso de crecimiento y mejoran el
cumplimiento de instrucciones un 23,1%. Primer caso en el manual de una
propuesta del autor pasando a propuesta con validación externa
independiente a escala.

---

## Prioridad media

### §13.15.1 — La procedencia en la capa de ingesta: caso Die Zeit/NSDAP (nuevo, Cap. 13)

**Qué añade.** Extiende el hilo de procedencia (§4.7b, §8.7b, §10.9.6,
§13.15) a una capa que no cubría: la ingesta/OCR. El caso Die Zeit
(pipeline de 16M páginas escaneadas, el problema "D." → "Düsseldorf" —
interpretación del modelo guardada como si fuera texto extraído) como
ejemplo de alto riesgo real, con `ContextualLLMStrategy` de HyperRAG
citada como contraejemplo positivo ya verificado en código
(`hyperrag/core/chunking/strategies.py:265-267`: el prefijo generado por
LLM se guarda aparte de `d.text`, nunca mezclado).

### §13.15.2 — El contrato fail-to-pass (nuevo, Cap. 13)

**Qué añade.** Operacionalización automatizable de la primera regla de
§13.15 ("si puede pasar con el sistema roto, no es un test"), a partir de
Tracely (herramienta OSS de regresión sobre trazas de agente). Incluye la
cautela obligatoria: el componente LLM-as-judge de esa herramienta hereda
el riesgo de "evaluación confabulada" ya nombrado en el propio Cap. 13; el
mecanismo de fixtures es válido y más seguro sin él.

### §6.11.4 y §6.11.5 — Tres memorias de agente: Skill / Constraints / Grafo (nuevo, Cap. 6)

**Qué añade.** Taxonomía de memoria agéntica (procedimiento / corrección /
relación) distinta de la memoria de conocimiento que ya cubre §6.11 (Wiki
Memory, MEMO). Fuente: patrón documentado para Kimi Agent Swarm
(Moonshot AI). **Cautela de atribución explícita en el propio texto**: la
convención de "Skill" descrita no se pudo verificar como función propia de
Kimi y coincide con la función Skills de Claude — marcado así en el texto,
no presentado como hecho confirmado. Cruce obligatorio con §8.7b: un
fichero de memoria de corrección sin poda es recuerdo catastrófico en
potencia (mismo mecanismo que Chakrabarti 2026). §6.11.5 conecta la
memoria de relación con GraphRAG (§6.6) y con la capa de grafo ya presente
en HyperRAG.

### §6.10b — El resurgir deliberado de los embeddings estáticos (nuevo, Cap. 6)

**Qué añade.** Caso de estudio Lattice (retriever estático de 7,94 MB,
CPU-only): por qué se abandonaron los embeddings estáticos (Cap. 0, ya
existente) y por qué vuelven como primera etapa barata en pipelines de dos
fases. Incluye el límite explícito (orden de palabras, polisemia, solo
inglés verificado) y encaja temáticamente junto a §6.10 (viabilidad con
modelos locales).

---

## Prioridad baja

### §10.10.3 — Tinta y cemento: implementación de referencia para agentes de código (nuevo, Cap. 10)

**Qué añade.** Ejemplo concreto y reproducible del principio ya establecido
en §10.10.2 ("nunca credenciales de administrador heredadas sin acotar"):
el caso `maibot` (usuario de sistema aislado, GitHub App con permisos
exactos, token de vida corta) para el caso más común — un agente de código
con acceso a Git/GitHub heredando la identidad admin del desarrollador.

### §6.5a — Ampliación de la cita de Empty Shelves or Lost Keys (Cap. 6)

**Qué añade.** Dos hallazgos adicionales del mismo paper ya citado
(verificado contra el texto original de Calderon et al., ICML 2026): la
"maldición de la reversión" reencuadrada como fallo de acceso, no de
conocimiento faltante; y que el razonamiento en inferencia ("thinking")
recupera buena parte de esos fallos.

### §5.0 — Prerrequisito: qué es un tensor (nuevo, Cap. 5, con animación CSS)

**Qué añade.** Sección introductoria previa a §5.1: 0D→1D→2D→3D con
visualización animada (CSS puro, sin dependencias JS nuevas, clases
prefijadas `tsr68-` para evitar colisión con estilos existentes), y tabla
de shape/rank/dtype/device/broadcasting conectada explícitamente a dónde
el manual ya usa cada propiedad sin nombrarla (cuantización = dtype,
hardware = device, KV cache = rank alto). Marcada como saltable en el TOC
para lectores que ya conocen NumPy/PyTorch. Origen: idea del usuario,
motivada por dos fuentes descartadas por audiencia en el triaje (no por
su contenido).

### §5.7d — Matiz de una frase: especulativa bajo carga concurrente (Cap. 5)

**Qué añade.** Una línea en la caja "cuándo aporta menos": bajo continuous
batching, la ganancia de la decodificación especulativa es de latencia
por usuario, no necesariamente de throughput agregado del servidor.

### §12.6 — Cita opcional: The Keystone Project (Cap. 12)

**Qué añade.** Un párrafo señalando el paralelismo formal entre el
`DecisionRecord` y un framework de teoría de la computación (satisfacción
de restricciones) que separa, con demostraciones, consistencia local /
insuficiencia representacional / exactitud certificada — mismo principio,
dominio distinto. Marcado explícitamente como working paper sin revisar
por pares.

---

## Adenda — §5.0 sustituido por un widget interactivo (mismo día, mismo v68)

El usuario aportó dos ficheros HTML con visualizadores de tensores
candidatos para reemplazar la animación CSS estática de §5.0. Comparación:

- **`Visualizador-De-Tensores-Interactivo.html`** — aplicación React
  completa (runtime de React embebido) más Tailwind CSS sin depurar
  (215 KB). Descartado: trae el *reset* global de Tailwind sin encapsular
  (`*,:after,:before{box-sizing:border-box;...}`, `body{margin:0;
  font-family:...}`, `h1,h2,h3...{font-size:inherit}`) que habría
  sobrescrito en silencio la tipografía y el box-sizing de **todo el
  documento**, no solo del widget. Coste de adaptación segura mayor que
  el valor aportado.
- **`Qwen_html_20260819_yjciqozis.html`** — JS vanilla, ~19 KB, sin
  dependencias, ya escrito citando la numeración real del manual
  (§2.1, §5.5c). Adoptado tras encapsular.

**Adaptación aplicada** antes de insertar: todo el CSS reprefijado bajo
`.tsr68q-` (ningún selector global `body`/`html`/`*`/`code` bare); todos
los `id` reprefijados `tsr68q-*` (verificados únicos en el documento
completo: `root`, `stage`, `tabs`, `addAxis`, `shape`, `ndim`, `elems`,
`desc`, `extra`, `readout`, `regen`, `spin` — un único match cada uno);
todo el script envuelto en un IIFE con `document.getElementById(
'tsr68q-root')` como raíz de consulta, sin variables ni funciones
globales (`$`, `div`, `heat`, `seed`, etc. del original quedaban en
`window` sin encapsular); paleta de color fija (tarjeta oscura
autocontenida) en vez de las variables de tema del manual — decisión
deliberada, coherente con el patrón ya existente en el documento de cajas
oscuras autocontenidas para diagramas interactivos (p. ej. el ciclo
stateless de §6.11). Sustituye la sección §5.0 original (animación CSS de
puntos pulsantes) por pestañas 0D→4D interactivas, inspector al pasar el
cursor por cada celda con su coordenada exacta, escenas 3D/4D arrastrables,
botón "añadir eje" con revelado progresivo animado y regenerar valores.

**Incidencia durante la edición, sin consecuencia en el resultado final.**
El reemplazo del bloque completo en una sola operación falló repetidamente
por el tamaño y la alta repetición interna del HTML original (muchos
`<div class="tsr68-dot"></div>` idénticos en secuencia parecen confundir
el emparejamiento de bloques largos). Se resolvió sustituyendo fila por
fila en ediciones más pequeñas, verificando cada paso. Una simplificación
provisional para evitar el mismo problema (quitar tildes/eñes de los
textos visibles del widget) se corrigió íntegramente después, en una
pasada dedicada verificada por `grep` sobre la sección completa del
widget.

---

## Verificación

- Balance de etiquetas en v68 tras los 11 cambios: `div` 4740/4740, `table`
  227/227, `ul` 159/159, `h2` 248/248, `h3` 377/377, `style` 9/9, `<p `
  (cualquier atributo) 1345/1345. El desajuste aparente en `<p>` sin
  atributos (1001 vs. 1345) es un artefacto de medición ya presente en
  v67 original (977 vs. 1317, misma proporción) — no es una regresión.
- Balance re-verificado tras la sustitución del widget de §5.0 (adenda
  anterior): `div` 4695/4695, `table` 227/227, `script` 40/40, `style`
  9/9, `main` 1/1, `section` 1/1, `aside` 1/1, `nav` 3/3, `details` 5/5.
  Los 12 `id` nuevos del widget (`tsr68q-root`, `-stage`, `-tabs`,
  `-addAxis`, `-shape`, `-ndim`, `-elems`, `-desc`, `-extra`, `-readout`,
  `-regen`, `-spin`) aparecen exactamente una vez cada uno en todo el
  documento. Cero rastros de la clase antigua `tsr68-` ni de marcadores
  temporales de edición. Tamaño final: 2.349.595 caracteres.
- Snapshot de v67 archivado en `archivo/Comprender_la_IA_2026_v67.html`,
  verificado con `diff` **idéntico** al fichero antes de empezar esta
  tanda de cambios.
- Ninguna sección existente fue reescrita ni movida — todas las
  inserciones son adiciones en puntos de cierre de sección ya
  identificados, antes del siguiente encabezado. Ningún `id` nuevo
  colisiona con uno existente (comprobado por búsqueda de texto antes de
  cada inserción: `s50`, `s57f`, `s10mcp` sin duplicar).
- Título, barra superior y TOC actualizados a v68. Nueva entrada de TOC
  para §5.0; entradas de tabla de "núcleo" del Cap. 5 actualizadas para
  incluirla.
- Tamaño: 2.302.026 → 2.332.949 caracteres (+30.923).

## Alcance

Se excluyó el duodécimo candidato del triaje (BCMT) por decisión explícita
—evidencia insuficiente (escala de juguete, sin comparación a competidores
reales, pérdida de calidad en casi todas las pruebas propias)—, tal como
quedó registrado en el triaje. Las cautelas de atribución señaladas en el
texto (Kimi "Skills", working paper de Keystone sin revisar) se mantienen
visibles en el propio manual, no solo en este registro.
