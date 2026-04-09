# Comprender la Inteligencia Artificial — Edición 2026

**Arquitectura, límites y gobernanza de los sistemas generativos**

Manual de formación técnica y conceptual para profesionales de datos que quieren entender, construir y auditar sistemas de IA generativa en producción.

## 🔗 Acceso al manual

El manual está disponible como página web interactiva en la siguiente dirección:

👉 **[Comprender la IA - Edición 2026](https://wontolla00.github.io/Comprender_la_IA/)**

Puedes leerlo directamente en el navegador, sin necesidad de descargar nada.

## 📖 ¿Para quién es este manual?

- Ingenieros y arquitectos de sistemas IA
- Directores de gobernanza y responsables de cumplimiento normativo
- Formadores, docentes y responsables de capacitación
- Profesionales de QA y validación de sistemas IA
- Profesionales de datos (analistas, ingenieros de datos, arquitectos de datos) que quieren transicionar a IA

**No es un manual para principiantes absolutos en tecnología.** Se asume experiencia previa con datos (SQL, Python, pipelines, calidad del dato, gobernanza).

## 📚 Estructura del manual

El manual está organizado en **6 módulos** (0, F, 1, 2, 3, 4, 5) más un glosario extendido:

| Módulo | Contenido |
|--------|-----------|
| **Módulo 0** | Orientación y mapa de viaje |
| **Módulo F** | Fundamentos conceptuales: tokens, probabilidad, alucinaciones, embeddings, trazabilidad |
| **Módulo 1** | El puente: de datos a IA (pipeline ETL → RAG, esquemas → embeddings, calidad del dato → evaluación probabilística) |
| **Módulo 2** | Fundamentos propios de la IA: LLMs, búsqueda vectorial, diagnóstico RAG, prompt engineering, modelos de razonamiento, agentes |
| **Módulo 3** | Construir en producción: sistemas críticos, arquitectura híbrida (patrón sándwich), validación y QA, supervisión humana, MLOps, AI Act |
| **Módulo 4** | Rol y carrera: roles emergentes, plan de transición de 6 meses, cómo demostrar competencia real |
| **Módulo 5** | Referencia y profundidad: consecuencias epistemológicas, conceptos propios del autor |
| **Glosario** | 60+ términos del ecosistema IA con referencias cruzadas |

Además, cada módulo incluye:

- 🔴 **Laboratorios de errores** — casos reales de sistemas que fallaron en producción, con diagnóstico y corrección
- 📄 **Entregables** — ejercicios prácticos para demostrar competencia
- ⚖️ **Dilemas sin respuesta correcta** — escenarios abiertos que entrenan el criterio

## ✨ Características destacadas

- **Enfoque práctico**: traduce conceptos de datos (ETL, calidad, trazabilidad) a su equivalente en IA (RAG, evaluación probabilística, gobernanza).
- **Honestidad técnica**: advierte explícitamente sobre caducidad de modelos, umbrales orientativos, y limitaciones de los benchmarks.
- **Casos reales de error**: más de 15 laboratorios con diagnósticos detallados (alucinaciones, chunking incorrecto, degradación silenciosa, prompt injection, etc.).
- **Arquitecturas de producción**: patrón sándwich (LLM propone, código decide), circuit breaker, estrategias de versionado de índices.
- **Plan de transición profesional**: 6 meses con hitos concretos y opciones de modelo gratuitas (Ollama, Groq, HuggingFace).

## 🛠️ Tecnologías y conceptos cubiertos

- RAG (Retrieval Augmented Generation)
- Embeddings y bases de datos vectoriales (FAISS, Pinecone, Weaviate, pgvector)
- Búsqueda híbrida (BM25 + vectorial) y RRF
- Prompt engineering (few-shot, CoT, structured output)
- Modelos de razonamiento nativo (o1, o3, Gemini 2.0 Flash Thinking, Claude 3.7)
- Agentes IA (entropía acumulada, frameworks vs custom, human-in-the-loop)
- Validación continua con RAGAS y golden dataset
- AI Act europeo: clasificación de riesgo, obligaciones de deployer, plazos
- MLOps para sistemas RAG (versiones de corpus, modelos, evaluación)

## 📝 Cómo usar este manual

1. **Empieza por el Módulo 0** — define tu perfil y la ruta de lectura.
2. **No lo leas linealmente** — salta al módulo que necesites según tu objetivo.
3. **Haz los entregables** — la comprensión real viene de producir documentos, no solo de leer.
4. **Revisa los laboratorios de errores** — son la mejor preparación para problemas reales en producción.

## 🧪 Requisitos para seguir los ejemplos prácticos

- Conocimientos básicos de Python y SQL
- Opcional: Ollama, Groq free tier, o API key de OpenAI/Anthropic para los ejercicios del plan de 6 meses

## 📄 Licencia y uso

Este manual es de libre acceso para formación, revisión y mejora continua.  
Los conceptos marcados con ★ son propuestas originales del autor y no forman parte de la terminología estándar del sector.

**Autor:** David Escudero de Félix  
**Versión:** 2026

## 🔗 Enlaces

- [Leer el manual en línea](https://wontolla00.github.io/Comprender_la_IA/)
- [Repositorio GitHub](https://github.com/wontolla00/Comprender_la_IA)

---

*Si encuentras errores o mejoras, por favor abre un issue o envía un pull request.*
