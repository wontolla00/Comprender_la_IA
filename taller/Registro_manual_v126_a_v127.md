# Registro v126 → v127 (23/10/2026)

Apéndice A (costes y latencia) y Cap. 22 (multimodalidad) revisados contra fuentes primarias.

## Fuentes consultadas el 23/10/2026
- Anthropic: https://platform.claude.com/docs/en/about-claude/pricing (Fable/Mythos 5.1 10/50; Opus 5.5 4/20; Sonnet 5.5 y Sonnet 5 2/10; Haiku 5.5 0,10/0,50 hasta 100k; Sonnet 4.6 3/15; Haiku 4.5 1/5; batch −50 %; lectura de caché 0,1× (0,05× Opus/Sonnet 5.5; 0,025× Fable/Mythos); US residency ×1,1; tokenizador 4.7+ ≈ +30 % de tokens).
- Google: https://ai.google.dev/gemini-api/docs/pricing (gemini-4-argon 2/10 → 4/20 desde 1/12/2026; gemini-3.8-flash 0,75/3,75 → 1,5/7,5 desde 1/1/2027; 3.5-flash-lite 0,30/2,50). Se leyó la página sin los últimos ~35k caracteres.
- DeepSeek: https://api-docs.deepseek.com/quick_start/pricing (V4-Flash 0,30/1,20; V4-Pro 1,32/3,96; valle = mitad).
- OpenAI: https://developers.openai.com/api/docs/pricing (gpt-6-astra 10/50; gpt-6.1-sol 2/10; gpt-6-luna 0,10/0,50). **Las columnas se perdieron al extraer; la asignación estándar/batch/fast se dedujo del orden y los valores.** Contrastar a mano.

## Cambios
Ver CHANGELOG v127.

## Pendientes
- Cap. 22: la mayor parte del contenido de modelos (Stable Diffusion/FLUX, Qwen2-VL, LLaVA-1.6, Sora, Kling…) sigue siendo de 2024–2025; solo se marcó. Revisión con fuentes pendiente.
- Cifras del autor sin fuente (latencias, costes de GraphRAG, 20–50 % neurosimbólico) declaradas estimaciones; la fuente «Escudero 2026» no se ha contrastado.
- Verificar la fila OpenAI a mano; embeddings y Llama alojado sin precio.
- Heredados: IDs OWASP LLM04–10; decisión sobre notebooks 05/06; revisión legal §16.2–16.4; F-16 (búsqueda híbrida «recomendada en producción») y F-17 (byte-level «cero desconocidos»).
