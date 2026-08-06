# Comprender la Inteligencia Artificial — Edición 2026

**Arquitectura, Límites y Gobernanza de los Sistemas Generativos**
Manual de formación técnica y conceptual · versión actual: **v61** (agosto 2026)

---

## ¿Qué es este manual?

Un manual autocontenido en un único archivo HTML (~2,2 MB) que cubre el ciclo completo de los sistemas de IA generativa en producción: desde el funcionamiento interno de un LLM hasta la gobernanza organizacional, pasando por RAG, agentes, evaluación, MLOps, regulación europea y ciberseguridad.

No es una colección de tutoriales. Es un manual de **criterio**: cada capítulo está construido para que el lector sepa no solo cómo funciona una técnica, sino cuándo falla, qué no mide, y qué decisión de diseño implica.

**Rasgo distintivo:** una treintena de secciones marcadas **★ Propuesta del autor** contienen conceptos y protocolos originales que no encontrarás en la documentación estándar — entre ellos el Patrón Sándwich como evidencia auditable, el DecisionRecord, la erosión de contexto, el *silence rate*, la crítica multi-modelo con intersección verificada, la matriz de derechos de decisión con la regla del rechazo cero, y (desde v57) la taxonomía de fallos de la investigación asistida por IA: cita fabricada, cita invertida y conteo sin método.

---

## ¿Para quién es?

| Perfil | Qué obtiene |
|---|---|
| **Ingenieros y arquitectos de sistemas IA** | Fundamentos técnicos completos (Cap. 5–10), arquitectura de producción segura (Cap. 12), diagnóstico RAG (Cap. 7) |
| **Directores de gobernanza y compliance** | Criticidad, supervisión humana, AI Act aplicado, infraestructura de gobernanza (Cap. 11, 14, 16) |
| **Dirigentes y sponsors ejecutivos** | Ruta específica sin prerrequisito técnico: quién decide realmente y cómo demostrarlo (Cap. 11.1 → 14.1–14.2b → 16.2 → 14.5) |
| **Profesionales de QA y validación** | Golden datasets, RAGAS y sus límites, taxonomía de errores, red teaming, crítica multi-modelo (Cap. 13) |
| **Perfiles en transición (BI/datos → IA)** | Los capítulos 1–4 son puentes explícitos desde el mundo ETL/BI; el Cap. 18 ofrece un plan de transición de 6 meses |

---

## Estructura

### Módulos de contenido (23 capítulos, 0–22)

**Módulo 0 — Mapa de viaje**
Perfiles de lectura, rutas MVP, leyenda de marcas, hilo conductor del caso Meridian Energy Group.

**Módulo 1 — Fundamentos y puente desde datos**
- Cap. 0 · Cómo funciona un LLM (fundamentos)
- Cap. 1 · Tu pipeline ETL, pero semántico (incl. LoRA/RAFT)
- Cap. 2 · De esquemas a espacios vectoriales
- Cap. 3 · De la calidad del dato a la evaluación probabilística
- Cap. 4 · De la trazabilidad de datos a la trazabilidad en IA

**Módulo 2 — Arquitectura técnica en profundidad**
- Cap. 5 · Cómo funciona un LLM por dentro (fine-tuning, MoE, GQA, RoPE/YaRN, cuantización, erosión de contexto ★)
- Cap. 6 · Búsqueda vectorial avanzada (GraphRAG, LightRAG, PageIndex, memoria compilada ★, DocLang ★)
- Cap. 7 · Diagnóstico y optimización RAG
- Cap. 8 · Prompt engineering (DSPy, evaluación, CI/CD, orquestación en grafo)
- Cap. 9 · Modelos de razonamiento nativo (incl. IA neurosimbólica ★)
- Cap. 10 · Agentes IA: poder, complejidad y límites reales (entropía acumulada ★, MCP/A2A, memoria persistente)

**Módulo 3 — Producción, calidad y gobernanza**
- Cap. 11 · Sistemas críticos: clasificar antes de diseñar
- Cap. 12 · Arquitectura híbrida en producción ★ (Patrón Sándwich, DecisionRecord, observabilidad agentic ★)
- Cap. 13 · Validación y QA (RAGAS en profundidad ★, ground truth ★, red teaming, crítica multi-modelo ★)
- Cap. 14 · Supervisión humana y gobernanza operativa (supervisión decorativa, sesgo de automatización, derechos de decisión ★)
- Cap. 15 · MLOps para sistemas RAG
- Cap. 16 · AI Act en la práctica (incl. Data Act)

**Módulo 4 — Rol y carrera**
- Cap. 17 · Los roles que emergen en los equipos de IA
- Cap. 18 · La transición: plan de 6 meses
- Cap. 19 · Cómo demostrar competencia real

**Módulo 5 — Referencia y profundidad**
- Cap. 20 · Las consecuencias epistemológicas de la IA (incl. §20.6, protocolo de lectura crítica y los tres patrones de cifra no fiable ★)
- Cap. 22 · Sistemas multimodales: visión, audio e imagen en producción (incl. Physical AI)

**Módulo 6 — Ciberseguridad de LLM**
- Cap. 21 · Atacar, medir y defender (ASR/FRR, ataques multimodales, protocolo de 5 pasos, CNIL)

### Material complementario

- **Apéndice R** · Referencia rápida para equipos senior (árboles de decisión, anti-patrones)
- **Apéndice A** · Guía de costes y latencia de inferencia
- **Apéndice B** · Autoevaluación por módulo
- **Apéndice C** · Referencias técnicas comentadas
- **Apéndice D** · Notas de campo — facturación de razonamiento, identidad de agente, fallback silencioso
- **Glosario extendido** · 110+ términos, con buscador
- **Índice de conceptos del autor** · todas las secciones ★ en un solo lugar, con su equivalencia estándar
- **Tabla de equivalencias** · conceptos del autor ↔ terminología del sector
- **Laboratorios** · 5 módulos de casos prácticos con fallos reales (chunking, prompt injection, sándwich roto, benchmarks engañosos…)
- **Entregables** · 3 ejercicios evaluables de arquitectura, diagnóstico y gobernanza
- **Widgets interactivos** · 7 simuladores embebidos: auto-atención, tokenización, paradigmas de atención, enciclopedia de mecanismos, árbol de diagnóstico RAG, calculadora de TCO

---

## Cómo usarlo

1. **No lo leas linealmente.** El Módulo 0 (inicio del documento) contiene los perfiles de lectura y las rutas MVP. Elige tu ruta y usa el índice filtrable como punto de retorno.

2. **Cada capítulo abre con "por qué te importa" y cierra con un resultado verificable.** Si no puedes formular el resultado, relee la sección clave antes de avanzar.

3. **Sistema de señalización** (revisado en v58–v61):
   - ✅ Obligatorio · 📘 Recomendado · 💡 Avanzado/Referencia
   - **★ Propuesta del autor** — concepto o protocolo original, con aviso desplegado bajo el título: *marco propio del manual, no terminología del sector*. Tradúcelo con la tabla de equivalencias antes de citarlo en una licitación, auditoría o entrevista.
   - **⚡ Frontera de investigación** — tendencia emergente, no consolidada; no bases arquitectura solo en ella.
   - **Sello de fecha** (`2026-08`) — última revisión de la sección. El sello naranja (`2026-08 · caduca rápido`) marca contenido perecedero: precios, *leaderboards*, calendario regulatorio, nombres de modelo. **La ausencia de sello significa que la sección no depende de datos con fecha**, no que esté sin revisar.

4. **Modo oscuro** disponible (🌙 en la barra de navegación). Los elementos interactivos (calculadoras, tabs, laboratorios, simuladores) requieren JavaScript habilitado.

### Rutas MVP (si solo tienes tiempo para lo esencial)

- **Ingeniero/Datos:** Cap. 1–3 → 5–7 → 12 → 13 → 15 → Apéndice A
- **Gobernanza/Compliance:** Cap. 4 → 11 → 14 → 16 → Apéndice B
- **Dirigente/Sponsor ejecutivo:** Cap. 11.1 → 14.1–14.2b → 16.2 → 14.5
- **Arquitecto/Producción:** Cap. 5–10 → 12–13 → 15 → Apéndice A → 16 si alto riesgo

---

## Novedades recientes

| Versión | Contenido principal |
|---|---|
| **v61** | Unificación del sistema de caducidad bajo un único sello de fecha (62 secciones fechadas, 18 marcadas como perecederas); retirada del número de versión de los sellos, que duplicaba la fecha; deduplicación de las notas de frontera (11 → 4) y reescritura sin referencia temporal; nueva fila en la leyenda que define el sello y el significado de su ausencia |
| v60 | Versionado por sección con formato `[vNN-AAAA-MM]` y CSS propio |
| v59 | Notas de frontera en Wiki Memory, DocLang, ARC-AGI-3 y Grey Alignment; diagnóstico RAGAS con umbrales accionables (`faithfulness`, `context_recall`) y acciones correctivas |
| v58 | Dos niveles de autoridad para ★ (badge lila + aviso bajo el título: *no citar como estándar*); retirada de las 90 etiquetas 🆕 vNN; retirada de la cifra «60–90 % de reducción de alucinaciones» por carecer de fuente, sustituida por el procedimiento de línea base propia; §20.6 tercer patrón: el conteo sin método |
| v57 | §20.6 el patrón de la cita invertida ★; §13.14.6 generación multi-modelo: cuando la convergencia no es señal ★; §20.6 condiciones de falsación; refuerzo del bloque anti-antropomorfización con el hallazgo del J-space (Anthropic, Transformer Circuits, julio 2026); condicionalización del veredicto del Cap. 4 y de la columna de referencia cortical |
| v53 | §8.8b Orquestación de agentes en grafo |
| v52 | §5.7e Arquitecturas de hardware |
| v51 | Notas de campo y trazabilidad del fallback silencioso |

*Historial completo anterior a v51 en el propio manual.*

---

## Filosofía del manual

Tres principios atraviesan todo el documento:

1. **La coherencia no es corrección.** Un sistema que produce outputs plausibles sin traza verificable no es un sistema medido: es un sistema estimado. Todo el aparato de trazabilidad (DecisionRecord, `evidence_type`, *silence rate*) existe para hacer visible esa diferencia.

2. **La supervisión que no deja huella es decorativa.** Del Patrón Sándwich al sesgo de automatización: la responsabilidad solo es real si es verificable contra la traza.

3. **Toda métrica tiene una epistemología.** RAGAS, ground truth, benchmarks, conteos: el manual dedica secciones enteras a qué miden realmente las métricas estándar — y qué dejan sistemáticamente fuera. Desde v58 esa exigencia se aplica también al propio manual: una cifra sin fuente se retira, y un conteo sin método declarado no cuenta como medición.

---

## Ficha técnica

- **Formato:** HTML de un solo archivo, ~2,2 MB
- **Idioma:** español
- **Extensión:** ~175.000 palabras (≈ 390 páginas a 450 palabras/página) · 23 capítulos · 5 apéndices · 5 laboratorios · 7 simuladores · glosario de 110+ términos
- **Estructura interna:** 240 secciones de nivel 2, 341 de nivel 3, 213 tablas, 25 bloques de código
- **Licencia y uso:** material de formación de autor. Los conceptos ★ son propuestas originales: quien los adopte asume la responsabilidad de validarlos en su contexto (véase §13.12 sobre adopción de métricas de autor)
- **Autor:** Wontolla00 — Senior Data & BI Project Manager · R&D en observabilidad y gobernanza de LLM (proyecto Empreinte)

### Notas de integridad

Dos salvedades sobre la autonomía del archivo, para no prometer más de lo que cumple:

- **No es totalmente offline.** El documento carga tipografías desde `fonts.googleapis.com`. Si necesitas cero llamadas de red —entorno aislado, requisito de privacidad—, incrusta las fuentes o sustitúyelas por la pila del sistema. El resto del contenido, incluidos los siete simuladores, es local.
- **Enlaces de notebooks pendientes.** Las referencias a `github.com/your-repo/…` y sus equivalentes en Colab son marcadores de posición, no destinos válidos. Sustitúyelos por el repositorio real o retíralos antes de distribuir.

---

*"La diferencia entre gobernanza aspiracional y gobernanza instrumentada: responsabilidades que dejan huella verificable en cada decisión."* — §14.2b
