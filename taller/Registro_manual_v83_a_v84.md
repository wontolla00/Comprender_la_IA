# Registro de cambios · v83 → v84

*Septiembre 2026.*

Origen: el usuario sometió el manual a un análisis externo (Qwen). De las críticas recibidas, una señalaba una imprecisión técnica real; el resto se verificaron contra el texto del manual y contra fuentes externas (búsqueda web) antes de decidir si ameritaban cambio — la mayoría no lo ameritaban, por estar ya cubiertas o por ser el propio análisis externo el que estaba equivocado (ver detalle en la sesión, no reproducido aquí). Este registro documenta la única corrección aplicada.

## Corrección: DeepSeek-V3 y VRAM en 5.5c (MLA)

**El error.** En la sección de Multi-head Latent Attention (5.5c), el recuadro "Ventaja principal" decía: *"permite que DeepSeek-V3 (671B parámetros MoE) quepa en hardware que un modelo denso de 70B no podría usar con contextos largos"*. La formulación mezclaba dos cosas distintas: MLA comprime la KV cache (memoria de contexto), no reduce los pesos del modelo que hay que cargar. Cargar los 671B parámetros totales de DeepSeek-V3 (aunque solo ~37B se activen por token) exige más VRAM base que un denso de 70B — el ahorro de MLA es real, pero es sobre la caché de contexto, no sobre el tamaño del modelo cargado.

**Por qué es una inconsistencia interna, no solo una imprecisión externa.** La sección 5.7b, a 700 líneas de distancia en el mismo manual, ya tiene un recuadro ("⚠ La trampa del titular") que hace correctamente esta misma distinción entre parámetros totales y activos. El manual se contradecía a sí mismo entre dos secciones vecinas sobre el mismo modelo.

**La corrección.** Reformulada la frase para atribuir el ahorro de MLA específicamente al escalado de la KV cache con contexto largo, aclarar explícitamente que la carga de pesos no se beneficia de esto, y cruzar con la referencia a 5.7b para quien quiera la distinción completa entre parámetros totales y activos. Texto nuevo en el recuadro "Ventaja principal" de 5.5c (línea ~11871).

**Verificación.** Cambio quirúrgico dentro de un `<strong>` y un `<div>` ya existentes — sin tocar estructura HTML alrededor. Confirmado por lectura directa del fragmento tras la edición: tags balanceados, sin huérfanos.

## Descartado tras verificación: el resto del análisis de Qwen

Por transparencia del proceso de descarte (mismo criterio que en registros anteriores: declarar por qué algo *no* se cambia, no solo qué se cambia):

- **Incidente de Hugging Face (§10.10.4):** Qwen lo marcó como "alerta roja", sospechando distorsión sensacionalista de un incidente menor. Verificado por búsqueda web contra OpenAI, METR, Redwood Research, The Hacker News, SecurityWeek: el incidente ocurrió tal como lo describe el manual, con las mismas cifras (~1.200 agentes, +70.000 mensajes, ~700 en el acceso a Hugging Face) confirmadas por la investigación independiente de METR/Redwood. No se cambia nada.
- **Cita del Lattice Deduction Transformer (arXiv:2605.08605, §9.10.5):** Qwen sospechó que podía ser una extrapolación sintética. Verificado: el paper es real (Davis, Haller, Alfarano, Santolucito; Amherst; mayo 2026), con los resultados exactos que cita el manual. La sección ya tenía, además, el tratamiento más cauteloso del manual (etiqueta "Frontera de investigación", recuadro de límites del resultado). No se cambia nada.
- **Fórmula de entropía acumulada P=r^n (§10.3):** Qwen pedía que se advirtiera que los errores reales están correlacionados, no son independientes. El manual ya lo dice explícitamente en dos sitios de esa misma sección ("intuición pedagógica, no un modelo empírico validado"; "los errores reales se correlacionan y amplifican de forma no lineal"). No se cambia nada.
- **Terminología "simbólico" para el LDT (§9.10.5):** objeción terminológica más que error técnico — el manual ya funda el término en interpretación abstracta (Cousot & Cousot 1977) y distingue explícitamente esta arquitectura de la IA neuro-simbólica clásica. No se cambia nada.
- **"Dogmatismo" en los Conceptos del autor:** el manual ya tiene un sistema de etiquetado consistente ("📐 Concepto del autor") y lenguaje de alcance explícito en las secciones revisadas. Riesgo residual real pero menor; no amerita cambio estructural.

## Alcance

Una corrección puntual de una frase en 5.5c. Ningún otro capítulo se tocó. Snapshot de v83 archivado antes de editar: `archivo/Comprender_la_IA_2026_v83.html`. `<title>` y badge de la topbar actualizados de "v83" a "v84"; archivo renombrado de `Comprender_la_IA_2026_v83.html` a `Comprender_la_IA_2026_v84.html`.
