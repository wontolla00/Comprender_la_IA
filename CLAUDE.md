# Comprender la IA (repo git del manual) — memoria de proyecto

Manual técnico autocontenido en **un único HTML** (`index.html`, ~2,9 MB), edición 2026, versión actual en `README.md` y `CHANGELOG.md` (v118 a 12/10/2026). Remoto: `github.com/wontolla00/Comprender_la_IA`. No es software: es el «tercer corpus» del conjunto literario; ver el `CLAUDE.md` de `Obra completa` para las convenciones generales.

## Leer primero
1. `CHANGELOG.md` (la entrada más reciente = estado).
2. `taller/Registro_manual_vNNN_a_vMMM.md` de la última versión (decisiones, verificaciones, qué quedó pendiente).
3. `README.md` (estructura de capítulos; las notas de proceso no van en el texto del alumno, van al CHANGELOG).

## Convenciones
- `index.html` es el vigente. Las versiones superadas van a `archivo/Comprender_la_IA_2026_vNNN.html`. Cada cambio de versión: copia la anterior a `archivo/`, sube la versión, añade entrada al `CHANGELOG.md` y un `taller/Registro_manual_vX_a_vY.md`.
- Las secciones **★ Propuesta del autor** son conceptos originales: no las presentes como estándar ni las mezcles con documentación de terceros.
- **No-sobreclaim**: toda cifra, cita o caso externo lleva fuente y fecha; si no se puede verificar, se retira o se marca como hipótesis (el manual documenta la taxonomía de «cita fabricada, cita invertida, conteo sin método»: no incurras en ella).
- El HTML es grande: edita por secciones con búsquedas exactas; no reescribas el archivo entero ni reconstruyas contenido desde una lectura truncada. Comprueba después que el HTML sigue abriendo y que el índice/enlaces internos siguen válidos.
- Nunca publiques (push) sin que el autor lo pida; comprueba antes que no hay material privado en el commit.

## Carpeta archivada
La copia antigua `06_Comprender_la_IA` (v113) se archivó el 2026-10-04 en `../_archivo/`. La referencia es esta carpeta. Solo esa copia conserva `taller/_insert_124b_cardinalidad.html`.

## Pendientes de veille abiertos
- **BitNet (12/10/2026)**: CI-BN-1..3 en la cabecera «Pendientes abiertos» de `taller/Triaje_fuentes_externas_2026.md`. Nada tocado en `index.html`.
- **Medición de agentes (12/10/2026)**: CI-DM-1 en la misma cabecera del Triaje (entrada `2026-10-12 (c)`).
- **Cómputo en inferencia (12/10/2026)**: CI-IT-1 en la misma cabecera del Triaje (entrada `2026-10-12 (d)`). Media.
- **Bucles y grafos de agentes (12/10/2026)**: CI-FO-1 en la misma cabecera del Triaje (entrada `2026-10-12 (e)`). Baja; comprobar §8.8b y §10.4b antes de tocar.
- **Metacognición y asistencia por IA (12/10/2026)**: CI-MC-1 en la misma cabecera del Triaje (entrada `2026-10-12 (f)`). Baja-media; estudio exploratorio, no citar como establecido.
- **Retropropagación, ejemplo interactivo (12/10/2026)**: CI-BP-1 HECHO en v117 (§0.1.3). Fuente editable en `taller/widget_retropropagacion.html`; detalle en `taller/Registro_manual_v116_a_v117.md`.
- **Caché KV y prefill/decode (12/10/2026)**: HECHO en v118 (§5.7d). Fuente editable en `taller/widget_kv_prefill_decode.html`; detalle en `taller/Registro_manual_v117_a_v118.md`.
