# Comprender la Inteligencia Artificial — Edición 2026

**Arquitectura, Límites y Gobernanza de los Sistemas Generativos**
Manual de formación técnica y conceptual · versión actual: **v32** (julio 2026)

---

## ¿Qué es este manual?

Un manual autocontenido en un único archivo HTML (~1,8 MB, sin dependencias externas) que cubre el ciclo completo de los sistemas de IA generativa en producción: desde el funcionamiento interno de un LLM hasta la gobernanza organizacional, pasando por RAG, agentes, evaluación, MLOps, regulación europea y ciberseguridad.

No es una colección de tutoriales. Es un manual de **criterio**: cada capítulo está construido para que el lector sepa no solo cómo funciona una técnica, sino cuándo falla, qué no mide, y qué decisión de diseño implica.

**Rasgo distintivo:** 23 secciones marcadas **★ autor** contienen conceptos y protocolos originales que no encontrarás en la documentación estándar — entre ellos el Patrón Sándwich como evidencia auditable, el DecisionRecord, la erosión de contexto, el silence rate, la crítica multi-modelo con intersección verificada, la deuda de comprensión del vibe coding, y (desde v31) la matriz de derechos de decisión con la regla del rechazo cero.

---

## ¿Para quién es?

| Perfil | Qué obtiene |
|---|---|
| **Ingenieros y arquitectos de sistemas IA** | Fundamentos técnicos completos (Cap. 5–10), arquitectura de producción segura (Cap. 12), diagnóstico RAG (Cap. 7) |
| **Directores de gobernanza y compliance** | Criticidad, supervisión humana, AI Act aplicado, infraestructura de gobernanza (Cap. 11, 14, 16) |
| **Dirigentes y sponsors ejecutivos** | Ruta específica sin prerrequisito técnico: quién decide realmente y cómo demostrarlo (Cap. 11.1 → 14.1–14.2b → 16.2 → 14.5) |
| **Profesionales de QA y validación** | Golden datasets, RAGAS y sus límites, taxonomía de errores, red teaming (Cap. 13) |
| **Perfiles en transición (BI/datos → IA)** | Los capítulos 1–4 son puentes explícitos desde el mundo ETL/BI; el Cap. 18 ofrece un plan de transición de 6 meses |

---

## Estructura

### Módulos de contenido (23 capítulos)

**Módulo 1 — Fundamentos y puente desde datos**
- Cap. 0 · Cómo funciona un LLM (fundamentos)
- Cap. 1 · Tu pipeline ETL, pero semántico (incl. LoRA/RAFT)
- Cap. 2 · De esquemas a espacios vectoriales
- Cap. 3 · De la calidad del dato a la evaluación probabilística
- Cap. 4 · De la trazabilidad de datos a la trazabilidad en IA

**Módulo 2 — Arquitectura técnica en profundidad**
- Cap. 5 · Cómo funciona un LLM por dentro (fine-tuning, MoE, GQA, YaRN, cuantización, erosión de contexto ★)
- Cap. 6 · Búsqueda vectorial avanzada (GraphRAG, LightRAG, memoria compilada ★, DocLang ★)
- Cap. 7 · Diagnóstico y optimización RAG
- Cap. 8 · Prompt engineering (DSPy, evaluación, CI/CD)
- Cap. 9 · Modelos de razonamiento nativo (incl. IA neurosimbólica ★)
- Cap. 10 · Agentes IA: poder, complejidad y límites reales (entropía acumulada, MCP/A2A, memoria persistente)

**Módulo 3 — Producción, calidad y gobernanza**
- Cap. 11 · Sistemas críticos: clasificar antes de diseñar
- Cap. 12 · Arquitectura híbrida en producción ★ (Patrón Sándwich, DecisionRecord, observabilidad agentic)
- Cap. 13 · Validación y QA (RAGAS en profundidad ★, ground truth ★, red teaming, crítica multi-modelo ★)
- Cap. 14 · Supervisión humana y gobernanza operativa (supervisión decorativa, sesgo de automatización, derechos de decisión ★ 🆕 v31)
- Cap. 15 · MLOps para sistemas RAG

**Módulo 4 — Regulación, roles y transición profesional**
- Cap. 16 · AI Act en la práctica (incl. Data Act)
- Cap. 17 · Los roles que emergen en los equipos de IA
- Cap. 18 · La transición: plan de 6 meses
- Cap. 19 · Cómo demostrar competencia real

**Módulo 5 — Límites, seguridad y frontera**
- Cap. 20 · Las consecuencias epistemológicas de la IA
- Cap. 21 · Ciberseguridad de LLM (ASR/FRR, ataques, medición, defensa)
- Cap. 22 · Sistemas multimodales: visión, audio e imagen en producción (incl. Physical AI)

### Material complementario

- **Apéndice R** · Referencia rápida para equipos senior (árboles de decisión, anti-patrones)
- **Apéndice A** · Guía de costes y latencia de inferencia
- **Apéndice B** · Autoevaluación por módulo
- **Apéndice C** · Referencias técnicas comentadas
- **Apéndice D** · Notas de campo (junio 2026) — ⚡ alta caducidad
- **Glosario extendido** · 79+ términos
- **Laboratorios** · 5 módulos de casos prácticos con fallos reales (chunking, prompt injection, sándwich roto, benchmarks engañosos…)
- **Entregables** · 3 ejercicios evaluables de arquitectura, diagnóstico y gobernanza

---

## Cómo usarlo

1. **No lo leas linealmente.** El Módulo 0 (inicio del documento) contiene los perfiles de lectura y las rutas MVP. Elige tu ruta y usa el índice como punto de retorno.
2. **Cada capítulo abre con "por qué te importa" y cierra con un resultado verificable.** Si no puedes formular el resultado, relee la sección clave antes de avanzar.
3. **Sistema de señalización:**
   - ✅ Obligatorio · 📘 Recomendado · 💡 Avanzado/Referencia
   - 🆕 vNN — sección añadida en esa versión
   - ★ autor — concepto o protocolo original del autor (validar internamente antes de adoptar como estándar)
   - ⚡ Alta caducidad — contenido sensible a la evolución del ecosistema; verificar vigencia
4. **Modo oscuro** disponible (🌙 en la barra de navegación). Los elementos interactivos (calculadoras, tabs, laboratorios) requieren JavaScript habilitado; no hay llamadas de red.

### Rutas MVP (si solo tienes tiempo para lo esencial)

- **Ingeniero/Datos:** Cap. 1–3 → 5–7 → 12 → 13 → 15 → Apéndice A
- **Gobernanza/Compliance:** Cap. 4 → 11 → 14 → 16 → Apéndice B
- **Dirigente/Sponsor ejecutivo 🆕:** Cap. 11.1 → 14.1–14.2b → 16.2 → 14.5
- **Arquitecto/Producción:** Cap. 5–10 → 12–13 → 15 → Apéndice A → 16 si alto riesgo

---

## Novedades recientes

| Versión | Contenido principal |
|---|---|
| **v32** | §14.2b Derechos de decisión ★ (matriz Delegar/Supervisar/Retomar/Responder, regla del rechazo cero, extensión del DecisionRecord con `decision_rights_holder` y `override_rate_at_decision`); recuadro sobre sesgo de automatización con anclas verificadas (Skitka 1999, Parasuraman & Manzey 2010); nuevo perfil de lectura Dirigente/Sponsor |
| v30 | §5.5e Erosión de contexto ★; extensión del DecisionRecord con campos de posición de sesión |
| v29 | §9.10 IA neurosimbólica ★ |
| v28 | §13.14 Crítica multi-modelo: protocolo de intersección verificada ★ |
| v27 | §13.11 RAGAS en profundidad ★; §13.12 epistemología del ground truth ★; §13.13 red teaming |
| v25 | §12.6 Observabilidad agentic ★; Apéndice D notas de campo |
| v24 | §10.10 MCP/A2A e identidad de agente; §13.10 vibe coding; §16.6b Data Act; §22.10 Physical AI |
| v22 | Cap. 22 completo (multimodalidad); DocLang ★ |

---

## Filosofía del manual

Tres principios atraviesan todo el documento:

1. **La coherencia no es corrección.** Un sistema que produce outputs plausibles sin traza verificable no es un sistema medido: es un sistema estimado. Todo el aparato de trazabilidad (DecisionRecord, `evidence_type`, silence rate) existe para hacer visible esa diferencia.
2. **La supervisión que no deja huella es decorativa.** Del Patrón Sándwich al sesgo de automatización: la responsabilidad solo es real si es verificable contra la traza.
3. **Toda métrica tiene una epistemología.** RAGAS, ground truth, benchmarks: el manual dedica secciones enteras a qué miden realmente las métricas estándar — y qué dejan sistemáticamente fuera.

---

## Ficha técnica

- **Formato:** HTML autocontenido, un solo archivo, sin dependencias de red
- **Idioma:** español
- **Extensión:** ~700 páginas equivalentes · 23 capítulos · 5 apéndices · 5 laboratorios · glosario
- **Licencia y uso:** material de formación de autor. Los conceptos ★ autor son propuestas originales: quien los adopte asume la responsabilidad de validarlos en su contexto (véase §13.12 sobre adopción de métricas de autor)
- **Autor:** Wontolla00 — Senior Data & BI Project Manager · R&D en observabilidad y gobernanza de LLM (proyecto Empreinte)

---

*"La diferencia entre gobernanza aspiracional y gobernanza instrumentada: responsabilidades que dejan huella verificable en cada decisión."* — §14.2b
