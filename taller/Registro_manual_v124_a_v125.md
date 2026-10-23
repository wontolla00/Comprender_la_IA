# Registro v124 → v125 (23/10/2026)

## Qué se corrigió
Dos pendientes del registro v123→v124: la explicación de la atención (Cap. 0, glosario) y la frase de §5.2b.2 sobre cross-attention.

## Criterio técnico
- En un decoder causal (GPT, Llama, Claude) la posición *i* solo atiende a posiciones ≤ *i* (máscara −∞ para j > i; Vaswani et al., 2017, y la propia fila «Causal/Masked» de la enciclopedia del manual). En un encoder (BERT) la atención es bidireccional. Ambas son «self-attention»; la diferencia es la máscara.
- «La cabeza de atención lee el contexto completo antes de generar cada token» es correcto si «contexto» = prompt + lo ya generado; se aclaró para evitar leerlo como «incluye tokens futuros».
- Cross-attention (Q del decoder; K y V del encoder): T5/BART, Whisper, condición por texto en Stable Diffusion, Flamingo (gated cross-attention, Alayrac et al., 2022). No usan cross-attention: CLIP (dos codificadores, pérdida contrastiva), LLaVA (proyección + concatenación de tokens visuales), modelos decoder-only en general. GPT-4V: arquitectura no publicada. RAFT: receta de fine-tuning (documentos relevantes + distractores), sin relación con el mecanismo de atención.

## Verificación
- ids sin duplicados (968; +1 por el botón de la demo), enlaces internos sin roturas, JavaScript con sintaxis válida, etiquetas balanceadas.
- Demo simulada en Node con lienzo ficticio: modo bidireccional «gato» → hambriento 50 %, come 20 %, El 12 %; modo causal «gato» → El 71 %, gato 29 %; último token en modo causal conserva todas sus conexiones. No se ha abierto en un navegador real.

## Pendientes tras v125
- Cap. 22 y Apéndice A (modelos, precios, fechas) con fuentes primarias.
- IDs OWASP LLM04–10 cuando la lista oficial esté completa.
- Notebooks 05 y 06: crearlos con ejecución real o dejar el código en línea.
- Experimento de convergencia multi-sistema (§20.1): documentar protocolo o rotularlo «observación exploratoria del autor».
- «70 %» del resumen del Cap. 15.
- Revisión jurídica externa de §16.2–§16.4.
