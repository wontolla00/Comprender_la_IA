# Registro v122 → v123 (23/10/2026)

## Origen
Pre-mortem y auditoría factual de la v122 hechos por un asistente externo (informe `Auditoria_factual_tecnica_Comprender_la_IA_v122.docx`). Se contrastó cada hallazgo con el texto real del `index.html` antes de actuar. Resultado del contraste, no del informe.

## Hecho en v123 (7 puntos)
| # | Punto | Dónde | Cambio |
|---|---|---|---|
| 1 | Enlaces `your-repo` | 3 avisos de alta caducidad (Cap. 15, 16, 22); 2 bloques de notebook (§5.7 LoRA, §6 híbrida) | CHANGELOG → `wontolla00/Comprender_la_IA`; botones a notebooks inexistentes sustituidos por nota |
| 2 | Delta ASR > 40 | §21.1, §21.10 (2 sitios), tabla de verificación, quiz Cap. 9 | Heurística del autor; ya no se atribuye a Shida; prueba de 10 prompts = screening exploratorio (p ≈ 0,14 para 1/10 vs 5/10) |
| 3 | Umbrales de criticidad | §11.3, mapa del Cap. 3, cabecera Cap. 16 | Recuadro «Matiz (2026-10)»; «Obligatorio» = lo exige este marco; golden dataset ≥20 = mínimo para arrancar; se retira «el AI Act codifica los niveles» |
| 4 | «Causa principal» | aviso inicial del Cap. 10 | → «un riesgo central» |
| 5 | ARC-AGI-3 | §9.1 y §20.1 | Datos fechados, causa y «de tipo» = hipótesis del autor; título «evidencia» → «indicio» |
| 6 | Prevalencia multimodal | intro Cap. 22 | Sin «la mayoría»; modelos = ejemplos 2023–2024 |
| 7 | OWASP 2026 | §21.8, bibliografía Cap. 21, referencia a LLM07 | Mapa a 2026; IDs solo LLM01–03 (las fuentes secundarias discrepan en LLM04–10) |

## Fuentes OWASP 2026 (consultadas 23/10/2026)
- Anuncio oficial OWASP GenAI Security Project, 1/09/2026 (confirma edición 2026, Excessive Agency en el puesto 3, Agent Control Standard). No lista las diez categorías.
- Lista completa solo en secundarias: nota de investigación de la Cloud Security Alliance, Akamai, Cyber Security News. Coinciden en LLM01 Prompt Injection, LLM02 Sensitive Information Disclosure, LLM03 Excessive Agency y en que Hidden Context Exposure sustituye a System Prompt Leakage; **discrepan en la numeración de LLM04–LLM10**. La página `genai.owasp.org/llm-top-10/` aún mostraba 2025 en la caché leída.
- Pendiente: cuando la lista oficial esté completa en genai.owasp.org, fijar los IDs y el orden en §21.8.

## Pendientes (no tocados en v123)
1. **Proveedor / deployer (AI Act)**: el manual dice en el §4 (intro), §16.2, caso de RRHH, quiz F3.2 y cierre del Cap. 16 que quien construye sobre una API es «el deployer» y que «los proveedores son la capa base». Según arts. 3 y 25 del AI Act, quien desarrolla el sistema y lo pone en servicio con su nombre es proveedor de ese sistema (y deployer si además lo usa). Contradice la tabla del §4.5, que ya distingue ambos roles. Requiere revisión jurídica.
2. **§16.3**: «obligaciones que debes cumplir antes de agosto de 2026» contradice la tabla del Omnibus (2 dic 2027 para Anexo III).
3. **§5.2b**: «cross-attention… es el fundamento de… CLIP, GPT-4V y RAFT» es incorrecto (RAFT es una receta de fine-tuning; CLIP no usa cross-attention; la arquitectura de GPT-4V no es pública).
4. **Cap. 0 / glosario**: «cada token mira a todos los demás» → precisar atención causal.
5. **Cap. 22 y Apéndice A**: repaso completo con fuentes primarias (modelos, precios, fechas).
6. **Notebooks 05 y 06**: decidir si se crean (con ejecución real) o si el código en línea basta.
7. **§20.1, experimento de convergencia multi-sistema**: documentar protocolo, prompts, versiones y salidas, o rotularlo «observación exploratoria del autor».
8. **«MLOps para RAG es en un 70 % datos»**: el resumen del Cap. 15 lo repite sin el matiz que sí lleva la apertura del capítulo.
9. Lo que el informe externo señalaba y **ya estaba resuelto**: calendario del Omnibus (§4 lo incluye con 2 dic 2027 y 2 ago 2028), atención causal (§5.2b tiene la máscara y la tabla causal/bidireccional), rutas MVP, entregables y autoevaluaciones.
