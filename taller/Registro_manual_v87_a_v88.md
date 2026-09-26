# Registro de cambios · v87 → v88

*Septiembre 2026.*

Origen: el usuario señaló que el índice principal (no el índice de conceptos del autor arreglado en v87) seguía sin listar todas las subsecciones de cada capítulo — ejemplo dado: el Cap. 1 tiene 7 subsecciones (1.1-1.8) pero el índice solo mostraba 2 (1.6b, 1.8). Pidió el alcance completo: todos los niveles numerados (N.N y N.N.N) en todo el manual, no solo un subconjunto curado.

## Hallazgo previo al índice: colisión de numeración Cap. 0 vs. Caps. 1-4

Antes de poder construir el índice de forma fiable, se descubrió que el **Capítulo 0** ("Cómo funciona un LLM") numeraba sus propias subsecciones como **1.1–1.5, 2.1–2.7, 3.1–3.7, 4.1–4.6.6** — colisionando directamente con la numeración real de los Capítulos 1, 2, 3 y 4. Por ejemplo, "§1.1" podía significar tanto "1.1 La ilusión del conocimiento" (Cap. 0) como "1.1 El problema que RAG resuelve" (Cap. 1 real). Los propios widgets del Cap. 0 ya usaban internamente las etiquetas "Sección 0.1 · Cap. 0 — Módulo 1" para sus cuatro bloques, confirmando que esa era la numeración prevista y nunca se aplicó a los encabezados reales.

**Decisión del usuario: renumerar el Cap. 0 a 0.x** (no dejarlo ambiguo). Aplicado:
- Los 33 encabezados del Cap. 0 pasaron de `1.1–4.6.6` a `0.1.1–0.4.6.6` (prefijo "0." insertado, preservando la agrupación original en 4 bloques).
- 16 autorreferencias internas dentro del propio Cap. 0 (`§4.6.3`, `§2.2–2.3`, `§1.5`, etc.) corregidas al nuevo esquema.
- Verificado que ninguna cita en el **resto** del manual apuntaba realmente al contenido del Cap. 0 usando estos números — las ~28 coincidencias encontradas fuera del Cap. 0 se comprobaron una por una contra el contenido real de los capítulos 1-4 y son todas legítimas (o ejemplos genéricos sin relación, como "¿qué argumenta la sección 3.2?" en el contexto de PageIndex).

## Segundo hallazgo: numeración duplicada real dentro del Cap. 6

Al construir el índice se detectaron dos pares de encabezados con el **mismo número** dentro de §6.11 (Memoria compilada): dos secciones tituladas "6.11.4" y dos tituladas "6.11.5" — contenido genuinamente distinto en cada caso, no un artefacto de extracción. Sin ninguna cita externa a esos números en el resto del manual. Corregido renumerando las segundas apariciones: "6.11.4 Tres memorias distintas..." → **6.11.6**, "6.11.5 Dónde vive el grafo..." → **6.11.7**.

## Construcción del índice completo

Verificación mecánica y exhaustiva (no muestreo): 385 encabezados numerados en todo el manual, de los cuales solo 92 tenían entrada en el índice principal. **337 secciones y subsecciones añadidas**, repartidas en los 23 capítulos (incluido el Cap. 0, con sus 33 subsecciones ahora consistentes).

- **293 encabezados no tenían atributo `id`** — se les generó uno nuevo (`sNN`, con sufijo de desambiguación si había colisión) y se insertó en el propio `<h2>/<h3>/<h4>` del cuerpo del manual, no solo en el índice.
- Las entradas nuevas se insertan **en la posición correcta dentro de cada capítulo**, ordenadas por número junto a las que ya existían — no simplemente al final. Las notas de referencia cruzada que no pertenecen al propio capítulo (p. ej. "→ Ver también: GQA, SWA, MLA en sección 5.5c" dentro del Cap. 6) se dejaron ancladas en su posición original, sin reordenar.
- Los bloques de Apéndices, Laboratorios, Entregables, Glosario e Índice de conceptos del autor —que no son subsecciones numeradas de ningún capítulo— quedaron completamente intactos, sin mezclarse con el contenido de los capítulos que los preceden.
- Sangría por profundidad: 1.2rem para `N.N`, 1.8rem para `N.N.N`, 2.4rem para `N.N.N.N` (solo aplica al Cap. 0 renumerado).
- Las etiquetas ya presentes en el encabezado real (`★ Propuesta del autor`, `⚡ Alta caducidad`) se replican en la entrada nueva del índice cuando existen; no se inventaron niveles de dificultad (`✅ Obligatorio` / `📘 Recomendado` / `💡 Avanzado`) para las entradas nuevas, porque esa es una curación editorial que no puede derivarse del propio encabezado.

## Verificación

- Recuento de `<h2>`, `<h3>`, `<h4>` y `<p>` idéntico antes/después (ningún contenido del cuerpo se perdió ni se duplicó); balance de `<div>`/`</div>` sube exactamente en 337 pares, coincidiendo con las 337 entradas nuevas.
- Cero números de sección duplicados en todo el manual tras las dos correcciones (Cap. 0 y §6.11).
- Cero `id` duplicados tras generar los 293 nuevos.
- Cero enlaces rotos: los 432 `href="#..."` del índice resuelven todos a un `id` real.
- Todo el proceso se probó primero sobre una copia de trabajo, verificado punto por punto, y solo entonces se aplicó al archivo real.
- Snapshot de v87 archivado antes de editar: `archivo/Comprender_la_IA_2026_v87.html`.
- `<title>` y badge de la topbar actualizados de "v87" a "v88"; archivo renombrado de `Comprender_la_IA_2026_v87.html` a `Comprender_la_IA_2026_v88.html`.

## Alcance

Cambio grande en superficie (337 líneas de índice nuevas, 293 atributos `id` nuevos, 33 encabezados renumerados en el Cap. 0, 2 renumerados en el Cap. 6) pero mecánico y verificado paso a paso — ningún párrafo de contenido se reescribió. El único contenido de prosa tocado fueron las 16 autorreferencias internas del Cap. 0 y los dos números de encabezado del Cap. 6.
