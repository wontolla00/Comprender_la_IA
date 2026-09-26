# Revisión editorial · tres críticas independientes, agosto 2026

*Registro de la sesión del 2026-08-20. No es triaje de fuentes externas
para enriquecer contenido (eso vive en `Triaje_fuentes_externas_2026.md`)
— es una auditoría de calidad del propio manual, a partir de tres
evaluaciones independientes que el usuario aportó el mismo día. Se
verificó cada afirmación comprobable contra el archivo real (v70/v71)
antes de actuar, con la misma disciplina que el manual exige a cualquier
fuente externa.*

---

## Resultado de la verificación

Cinco arreglos se implementaron, verificados con alta confianza →
**v71**. Todo lo demás queda anotado aquí, sin tocar el manual, a la
espera de una decisión editorial del usuario.

### Implementado en v71

| # | Hallazgo | Fuente | Verificación | Fix |
|---|---|---|---|---|
| 1 | §13.10.2 citaba una tasa de vulnerabilidades ("2-3× más") sin fuente, con delegación explícita de la verificación al lector | Crítica 1 | Cita verbatim confirmada; viola el propio estándar de §4.6/v58 ("cifra sin fuente se retira") | Cifra retirada, sustituida por el mismo patrón de retractación que usa §4.6, con una alternativa verificable (SAST sobre código IA sin excepción) |
| 2 | §4.7b vive físicamente dentro del contenedor HTML del Cap. 5, antes de §5.0, pese a pertenecer al Cap. 4 según el índice | Crítica 1 | Confirmado por la posición del `<div class="chapter-tag">Capítulo 5 · Módulo 2</div>` respecto al `<h2 id="s47b">` | Bloque completo (22 líneas) movido a su lugar correcto en Cap. 4, junto a §4.7 |
| 3 | Tres encabezados numerados "2.5" en el documento; dos de ellos consecutivos dentro del mismo Cap. 2 | Crítica 3 (parcial — decía "duplicado", era triplicado) | Confirmado — "Elegir un modelo de embedding" y "Por qué fracasó la Web Semántica" son h2 consecutivos, ambos "2.5", en Cap. 2 | "Elegir un modelo de embedding" renombrado a **2.4b** (sin `id`, sin entrada de TOC, sin referencia cruzada por número — cambio de bajo riesgo, verificado sin colisión) |
| 4 | §5.7b, caja MoE: "Calidad ≈ 47B" presentado sin matiz, cuando el propio manual advierte unas líneas más abajo (línea ~8389) contra exactamente ese razonamiento | Crítica 3 | Cita verbatim confirmada; contradicción real con contenido cercano | Caja corregida: "Capacidad total accesible ≈ 47B" + matiz explícito sobre router/balanceo de carga |
| 5 | Tabla de dimensiones de calidad (~línea 4816): "Fidelidad" sin el término inglés, inconsistente con el resto del documento donde domina "Faithfulness" | Crítica 1 (sobreestimada como problema generalizado; ver más abajo) | De ~70 apariciones de "fidelidad"/"faithfulness" solo esta celda de tabla resultó ser una inconsistencia real del mismo concepto — el resto son conceptos distintos que comparten palabra (fidelidad matemática de un algoritmo, fidelidad visual en captioning) | Celda corregida a "Fidelidad (Faithfulness)", alineada con el patrón ya usado en la tabla de la línea ~16910 |

Detalle de verificación de etiquetas y tamaño: `Registro_manual_v70_a_v71.md`.

---

## Las tres críticas, calibradas entre sí

Se les llama aquí Crítica 1 (la más extensa, con tabla de puntuaciones y
"tres debilidades estructurales"), Crítica 2 (segunda tabla de
puntuaciones, comparación con Chip Huyen) y Crítica 3 (la más corta, con
cifras exactas de conteo — anglicismos, headings, TOC).

### Lo que las tres confirman de forma independiente (señal fuerte)

La densidad del Cap. 5 (taxonomía de 47 mecanismos de atención en §5.2b,
hardware en §5.7e, FlashAttention en §5.7d) es desproporcionada para el
perfil no investigador frente a lo que ese perfil configurará realmente en
producción. Las tres puntúan bajo "cobertura y equilibrio" por este mismo
motivo, de forma independiente. Es la señal más creíble de todo el
ejercicio precisamente porque converge sin que las fuentes se citen entre
sí.

### Dónde cada crítica acierta con precisión verificada

- **Crítica 1**: cita exacta de §4.6 (retractación del 60-90%), cuenta
  exacta de 29 secciones ★ (coincide con lo que el propio manual declara
  en el Índice de conceptos del autor), identifica correctamente que los
  enlaces de notebooks (`github.com/your-repo/...`) son placeholders — **pero
  esto ya estaba autodeclarado en el README** ("Notas de integridad"), así
  que no es un hallazgo nuevo, es una confirmación de algo ya transparente.
- **Crítica 3**: cita exacta del recuadro MoE, identifica correctamente
  la nota de numeración autoexplicativa de §1.6b (aunque la caracteriza
  como "rompe referencia cruzada" cuando en realidad es un hueco ya
  declarado por el propio texto, mismo patrón que los notebooks), y
  detecta la colisión de "2.5" — aunque subestima su alcance real
  (triplicado, no duplicado).

### Dónde una crítica se equivoca de forma comprobable

- **Crítica 2** afirma que "los interactivos son visualizaciones HTML,
  no notebooks" y que faltan "ejemplos de código ejecutable (Python)".
  **Falso, verificado**: hay 11 bloques marcados "✓ Ejecutable" con
  dependencias reales — pipeline RAG completo, fine-tuning LoRA con
  `transformers/peft/datasets/accelerate/bitsandbytes`, retrieval híbrido
  BM25+embeddings, diagnóstico RAGAS con las cuatro métricas, pipelines
  DSPy con CI. No están empaquetados como notebooks con datos, pero la
  afirmación de que no existen es incorrecta.
- **Crítica 3** dice "17 propuestas del autor marcadas con ★". El manual
  declara 29 explícitamente, cifra que la Crítica 1 confirmó por conteo
  independiente. Error de ~40% que resta fiabilidad al resto de cifras
  exactas de esa misma crítica (conteos de anglicismos, headings vs.
  TOC) — verificadas por separado y ninguna reprodujo con exactitud: mismo
  orden de magnitud, cifras distintas (`prompt` 366 real vs. 464
  declarado, `embedding` 169 vs. 248, `toc-item` 99 vs. 95, h2+h3 631 vs.
  669). Tratar el resto de cifras de esa crítica con la misma cautela que
  el manual pide aplicar a cualquier número sin método declarado (§20.6).

### Dónde disiento del criterio, no de un hecho

- **§6.13.6 (ERP/Boeing/EHR)** — la Crítica 1 la describe como
  "reflexión epistemológica que interrumpe el flujo práctico" y propone
  moverla al Cap. 20. Leída completa: es una extensión técnica directa del
  mecanismo que se acaba de explicar (§6.13.4, la puerta de promoción),
  con una propuesta arquitectónica concreta al final ("doble vía de
  promoción"), marcada desde el título como "★ Concepto del autor". Es el
  mismo patrón caso-real→propuesta que el manual usa en decenas de
  sitios. No se movió.
- **Módulo 4, "desconexión"** — las tres críticas la señalan. El manual ya
  es explícito al respecto: la corrección v53 en las rutas MVP dice
  textualmente que el Módulo 4 "no es parada obligatoria... salvo que
  también estés considerando ese cambio de rol". Es un módulo
  deliberadamente opcional y ya señalizado, no un descuido sin detectar.
  No se tocó.

---

## Pendiente — decisiones editoriales, no arreglos técnicos

Nada de esto se implementó. Son cambios de alcance o de tiempo de
producción real, no fixes de una tarde, y requieren una decisión tuya
sobre prioridad.

### Convergente entre las tres críticas

1. **Reequilibrar Cap. 5** — mover §5.2b (taxonomía de 47 mecanismos),
   §5.5c-e y §5.7d-e a un apéndice de referencia senior, dejando en el
   núcleo solo las tablas de decisión práctica que ya cierran cada una de
   esas secciones. Recupera foco para el perfil no investigador sin
   perder el contenido para quien lo necesite.
2. **"Edición Esencial" / Edición Ejecutiva** — extracto de 60-150
   páginas sin secciones ★ ni meta-comentario, para formadores y para el
   perfil manager/producto, cuya ruta actual de ~8h las tres críticas
   consideran demasiado larga sin ser realmente ejecutiva.
3. **Notebooks reales empaquetados con datos** — los 11 bloques
   ejecutables existen (contra lo que afirma la Crítica 2) pero no están
   empaquetados como notebooks Colab con dataset sintético incluido. Es
   una mejora de packaging, no de contenido.

### Específicas de una sola crítica, con mérito

4. **Caso transversal de punta a punta** (Crítica 1 y 2, formulaciones
   distintas, misma idea) — un capítulo o apéndice que desarrolle un caso
   único (o los 3 casos que propone la Crítica 2: RAG que funciona, RAG
   que falla con techo del oráculo, agente con circuit breaker) de
   principio a fin con costes y métricas reales, en vez de las paradas
   fragmentadas de Meridian.
5. **Glosario normativo ES/EN + verificación de consistencia
   terminológica** (Crítica 3) — el hallazgo puntual de "fidelidad" ya se
   corrigió (fix #5 arriba), pero una pasada sistemática con una
   herramienta (no manual, dado el tamaño del documento) sobre el resto
   de pares ES/EN citados (retrieval/recuperación, chunking/particionado)
   podría encontrar más casos reales entre el ruido de falsos positivos
   que esta sesión ya filtró.
6. **§12.3, "Apéndice de código" que no existe en el documento** (Crítica
   1) — confirmado, no corregido en esta tanda por priorización (se
   sustituyó por los hallazgos #3 y #4 de la tabla de arriba, más
   verificables y de alcance más acotado). Sigue abierto: o se retira la
   promesa de apéndice, o se construye el apéndice real.
7. **Checklist de salida estandarizado por capítulo** (Crítica 3) —
   unificar el "✅ Resultado de este capítulo" de cada capítulo en un
   formato de 3 preguntas (decisión / métrica / coste), hoy dispar entre
   capítulos.
8. **Reordenar LoRA/RAFT fuera del puente de Cap. 1** (Crítica 3) — mover
   la calculadora LoRA de §1.6b a Cap. 5, dejando en Cap. 1 solo la
   intuición de "hoja de cálculo de 4.000 millones de celdas", para
   evitar que el lector vea LoRA en detalle antes de que exista una
   definición formal de tensor (§5.0). Nota: esto crearía tensión con la
   adición de v70 (Multi-LoRA serving, insertada justo después de esa
   calculadora) — si se mueve, esa sección debería moverse con ella.

### Notas menores, no accionables sin más contexto

- **Cap. 0, "2.5 Distribuciones de probabilidad"** — bare-numbering
  local de Cap. 0, distinto namespace del "§2.5" de Cap. 2 (que si se
  corrigió, ver fix #3). No es la misma colisión que señalaban las
  críticas; se deja anotado por si en el futuro se decide dar numeración
  de capítulo explícita a las subsecciones de Cap. 0 también.
- **Notebooks con enlace a `github.com/your-repo`** — ya autodeclarado en
  el README como placeholder. No requiere anotación nueva, solo enlazar
  aquí para que quede junto al resto de hallazgos de esta ronda.
