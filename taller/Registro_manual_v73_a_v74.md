# Registro de cambios · v73 → v74

*Agosto 2026.*

Origen distinto de los registros habituales: no viene del laboratorio RAG
instrumentado (`HyperRAG`), sino de un post externo (LinkedIn, IBM/Jothi
Moorthy) sobre **Enforcement Tracking para watsonx Orchestrate**, discutido
primero fuera del manual. Antes de incorporar nada se verificó contra las
páginas oficiales de IBM y un análisis técnico de tercero — mismo criterio
que v67 (Rundell, verificado contra The Guardian y el estudio original) y
v69 (watermarking de Claude, verificado contra la página oficial de
Anthropic y el paper de Sander et al.). La corrección de la sesión que
motivó este registro: la primera lectura del post asumió que las métricas
(hallucination, helpfulness, toxicity) se presentaban sin metodología
declarada. Al buscar la documentación primaria de IBM, resultó que sí hay
metodología — LLM-as-a-Judge, con modelos "slate" propios afinados por
métrica — lo cual no cierra la objeción original, la reformula con más
precisión: el punto ciego no es la ausencia de método, es el método mismo
(un juez-modelo evaluando a un agente-modelo).

Snapshot de v73 archivado **antes** de editar:
`archivo/Comprender_la_IA_2026_v73.html`, 2.433.583 bytes, copia exacta
del v73 en circulación.

---

## Las tres inserciones

### 1. Cap. 12 — callout tras la escala E0–E4: caso real aplicado

Insertado como `<div class="callout" style="border-left:4px solid
#dc2626;">` inmediatamente después del callout que cierra la escala E0–E4
("La distinción medido/estimado que este manual defiende...") y antes del
`<h1>Validación y QA en producción</h1>` que abre el Cap. 13.

**Por qué se eligió aquí:** la escala E0–E4 termina con la advertencia de
que "gran parte de la observabilidad que se vende en 2026 vive en E1
mientras el dashboard sugiere E3" — el callout aplica esa misma frase a un
caso con nombre, fecha y fuente verificable en vez de dejarla en
abstracto. Aplica la escala del propio manual al producto: captura de
trazas (OpenTelemetry/Traceloop) y cadencia programada = E2 real; ausencia
de golden dataset declarado o tasa de acuerdo humano-juez publicada =
techo en E2–E3, no el E4 ("governance proof") que el naming del producto
sugiere.

**Fuente:** IBM, ["From governance policies to governance proof with
Enforcement Tracking for watsonx
Orchestrate"](https://www.ibm.com/new/announcements/from-governance-policies-to-governance-proof-with-enforcement-tracking-for-watsonx-orchestrate)
(anuncio oficial); IBM, ["IBM's answer to governing AI
Agents"](https://www.ibm.com/new/announcements/ibms-answer-to-governing-ai-agents-automation-and-evaluation-with-watsonx-governance).

**Cross-referencia añadida:** remite a §13.14.7 para el desarrollo del
problema del juez.

### 2. §13.14.7 (nueva) — El juez intercambiable

Insertada como `<h3>` nueva al final de §13.14 (tras 13.14.6, "Generación
multi-modelo: cuando la convergencia no es señal"), antes del `<h2
id="s1315">` que abre "El arnés que miente".

**Contenido:** LLM-as-a-Judge en watsonx.governance como instancia
industrializada de la crítica confabulada de 13.14.2 — un juez-modelo, no
un panel, evaluando a un agente-modelo con el que puede compartir encuadre
estadístico. Documenta que el juez puede ser "cualquier LLM" (los ejemplos
publicados usan Mixtral 8x7B) o una familia de modelos "slate" propios
(125M parámetros, por métrica). Incluye un `<div class="warning">` que
nombra el campo ausente: qué juez, calibrado contra qué, con qué tasa de
acuerdo con revisión humana — dato de configuración que la plataforma no
expone junto al score. Cierra reconociendo lo que sí es sólido (captura de
trazas vía estándares abiertos, cadencia de evaluación producción/desa­
rrollo) para no convertir el caso en descalificación genérica.

**Por qué se eligió aquí y no como sección nueva de nivel 2:** 13.14 ya
tiene el aparato conceptual completo (protocolo de intersección
verificada, crítica confabulada, convergencia sin independencia); este es
el caso donde ese aparato se aplica a un producto real de mercado en vez
de a un caso de campo propio. Mismo patrón que 13.14.6, añadida en v57
sobre el mismo fundamento.

**Fuentes:** IBM, anuncio oficial de Enforcement Tracking (enlace arriba);
Ravi Chamarthy, ["Evaluating faithfulness of an Agentic RAG System using
IBM
watsonx.governance"](https://ravi-chamarthy.medium.com/evaluating-faithfulness-of-an-agentic-rag-system-using-ibm-watsonx-governance-0532e4b4b468)
(metodología LLM-as-a-Judge, modelos slate de 125M parámetros).
**Declarado explícitamente como no verificable:** si el juez se calibra
contra un golden dataset publicado, y cuál es su tasa de acuerdo con
evaluación humana — no aparece en ninguna fuente consultada. Se registra
la ausencia en vez de rellenarla por conjetura.

**Cross-referencia añadida:** enlaza a `#s12-decision-record` (Cap. 12).

### 3. Tabla de equivalencias — fila nueva: DecisionRecord

`DecisionRecord` es concepto ★ del Cap. 12 desde v51 y no tenía fila en la
Tabla de equivalencias — hueco preexistente, no introducido por esta
edición, cerrado de paso porque el caso de watsonx.governance es
precisamente el ejemplo de mercado que la fila necesitaba para no quedar
abstracta. Término relacionado del sector: "governance evidence" /
"Enforcement Tracking" (terminología de proveedor) o "audit trail" /
"structured decision log" (observabilidad general) — con la nota de que
ningún término estándar distingue todavía el nivel de fuerza probatoria
E0–E4 que este manual separa.

---

## Lo que se dejó fuera, deliberadamente

- **Metodología de calibración del juez** (golden dataset, tasa de acuerdo
  con humanos): no encontrada en fuentes públicas verificadas. No se
  inventa ni se estima — se nombra como ausencia en §13.14.7.
- **Comparación con otras plataformas de gobernanza de agentes**
  (competidores de watsonx.governance): fuera de alcance de esta edición,
  que documenta un caso, no un panorama de mercado.
- **Reescritura del post original como fuente primaria:** el post de
  LinkedIn que originó la discusión no se cita en el manual — solo la
  documentación oficial de IBM y el análisis técnico de tercero que la
  verifican. El post es la ocasión, no la fuente.

## Verificación

- Balance de etiquetas verificado contra el snapshot pre-edición
  (`archivo/Comprender_la_IA_2026_v73.html`), no solo por conteo agregado
  del propio v74:

  | | v73 (archivado) | v74 | Δ | esperado |
  |---|---|---|---|---|
  | bytes | 2.433.583 | 2.440.060 | +6.477 | — |
  | `h2` | 254 | 254 | 0 | 0 (ninguna sección nueva de nivel 2) |
  | `h3` | 396 | 397 | +1 | +1 (§13.14.7) |
  | `table` | 223 | 223 | 0 | 0 (fila añadida a tabla existente, no tabla nueva) |
  | `tr` | 1.054 | 1.055 | +1 | +1 (fila de DecisionRecord) |
  | `div` (abre/cierra) | 4.836 / 4.836 | 4.838 / 4.838 | +2 / +2 | +2 (1 callout Cap. 12, 1 warning §13.14.7), balanceado |
  | `p` | 1.436 | 1.441 | +5 | +5 (1 en callout Cap. 12, 4 en §13.14.7) |
  | `span` | 1.536 | 1.538 | +2 | +2 (version-badge en cada inserción con encabezado) |
  | `a` | 389 | 396 | +7 | +7 (4 enlaces externos a fuentes IBM/Medium, 3 enlaces internos de cross-referencia) |
  | `strong` | 2.197 | 2.202 | +5 | — |
  | `em` | 503 | 507 | +4 | — |
  | `code` | 328 | 330 | +2 | — |

  Todas las cifras cuadran exactamente con el conteo manual de lo
  insertado — ningún desbalance, ninguna etiqueta huérfana.
- Verificación adicional en navegador (servidor estático local, no solo
  regex sobre el fuente — la misma lección de v72→v73, donde un desbalance
  de `<div>` sobrevivió una verificación por conteo): las tres inserciones
  confirmadas presentes en el DOM renderizado, y profundidad de
  `.container` = 1 en los cuatro puntos de anclaje (`s12-decision-record`,
  `s1314`, `tabla-equivalencias`, el nuevo `h3` de 13.14.7 y el nuevo
  callout del Cap. 12) — sin anidamiento ni fuga fuera de la columna de
  lectura.
- Carpeta principal: se elimina `Comprender_la_IA_2026_v73.html` del
  directorio raíz (queda solo en `archivo/`), permanece
  `Comprender_la_IA_2026_v74.html` como único archivo vivo — misma
  convención que v72→v73.
- `<title>` y badge de la topbar corregidos de "v72" a "v74": ambos
  habían quedado desactualizados desde v72 (no se habían actualizado en
  v73), detectado al verificar la versión antes de esta edición. Corregido
  de paso, no es parte de las tres inserciones de contenido.

## Alcance

Tres inserciones puntuales dentro de secciones ya existentes (Cap. 12,
§13.14, Tabla de equivalencias); ninguna reestructuración, ninguna
renumeración, ningún contenido retirado. Corrección menor de version
badges obsoletos. No se tocó ningún otro capítulo ni el trabajo de
widgets de v72.
