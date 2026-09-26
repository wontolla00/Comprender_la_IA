# Registro de cambios · v70 → v71

*Agosto 2026.*

Cinco correcciones, derivadas de tres revisiones editoriales
independientes del manual aportadas por el usuario el mismo día (no son
fuentes externas de contenido nuevo — son auditorías de calidad del
propio manual). Cada hallazgo se verificó contra el archivo real antes de
actuar. Análisis completo, incluidas las diferencias entre las tres
revisiones y todo lo que quedó anotado sin implementar, en
`Revision_editorial_agosto2026.md`, este mismo directorio.

Esta vez el snapshot de v70 se archivó **antes** de editar (segunda vez
seguida con el proceso correcto).

---

## §13.10.2 — retractación de la cifra de vulnerabilidades sin fuente (Cap. 13)

**Qué estaba mal.** El texto citaba "varios estudios de 2025" con una
tasa de vulnerabilidades "2-3 veces" superior en código generado por IA
sin revisión, seguido de "verifica el estudio... antes de usar una cifra
exacta" — exactamente el patrón que §4.6/v58 ya había retirado del propio
manual ("cifra sin fuente se retira").

**Corrección.** Cifra eliminada. Sustituida por una explicación de por
qué no se reproduce ningún número (metodologías dispersas entre
estudios, sin trazabilidad suficiente) y una alternativa operativa que no
depende de resolver ese debate: pasar el código generado por IA por el
mismo SAST/linter de seguridad que el código humano, sin excepción.

## §4.7b — reubicación al Cap. 4 (Cap. 4/5)

**Qué estaba mal.** El bloque completo de §4.7b ("Procedencia declarada")
vivía físicamente dentro del contenedor HTML del Cap. 5 —después del
`chapter-tag` que marca el inicio de ese capítulo y de su tabla de
navegación, antes de §5.0— pese a que el índice lo lista bajo el Cap. 4 y
su contenido es una extensión directa de §4.7.

**Corrección.** Bloque de 22 líneas movido a continuación de §4.7 en el
Cap. 4, antes del caso Claude añadido en v69. Badge `🔧 v71 · reubicada`
añadido junto al título para que quede trazable en el propio texto, sin
tocar el badge `🆕 v63` del índice (que sigue indicando correctamente
cuándo se escribió el contenido).

## §2.4b — resolución de la colisión de numeración "2.5" (Cap. 2)

**Qué estaba mal.** Tres encabezados distintos del documento usaban
"2.5" como número: uno en Cap. 0 (namespace distinto, no tocado), y dos
consecutivos dentro de Cap. 2 — "Elegir un modelo de embedding" y "Por
qué fracasó la Web Semántica" (este último con `id="s25"`, en TOC, con
subsecciones 2.5.1-2.5.5 y múltiples referencias cruzadas por número en
el resto del documento).

**Corrección.** Se renombró "Elegir un modelo de embedding" a **2.4b**
—el de menor riesgo de los dos: sin `id`, sin entrada de TOC, sin
ninguna referencia cruzada por número en el resto del documento
(verificado por búsqueda antes de tocarlo)— en vez de renumerar el árbol
completo de "Web Semántica" (2.5, 2.5.1-2.5.5), que sí está profundamente
cruzado y habría sido un cambio de alto riesgo para un beneficio
equivalente.

## §5.7b — matiz en la caja MoE "Calidad ≈ 47B" (Cap. 5)

**Qué estaba mal.** La caja resumen del ejemplo Mixtral 8×7B afirmaba
"Calidad ≈ 47B" sin matiz, contradiciendo la advertencia que el propio
manual hace más adelante en la misma sección contra comparar modelos MoE
por parámetros totales sin más contexto.

**Corrección.** "Calidad ≈ 47B" → "Capacidad total accesible ≈ 47B", con
la aclaración explícita de que la calidad real depende del router y del
balanceo de carga entre expertos, no solo del recuento de parámetros.

## Tabla de dimensiones de calidad — "Fidelidad (Faithfulness)" (Cap. 4)

**Qué estaba mal.** De las ~70 apariciones combinadas de "fidelidad" y
"faithfulness" en el documento, se verificó que la inmensa mayoría son
conceptos distintos que comparten palabra (fidelidad matemática de una
aproximación algorítmica, fidelidad visual en captioning de imágenes) —
no una inconsistencia de traducción real. Se encontró exactamente un
punto donde sí lo era: una celda de tabla que usaba "Fidelidad" a secas
para referirse a la métrica RAGAS, sin el término inglés que domina el
resto del documento.

**Corrección.** "Fidelidad" → "Fidelidad (Faithfulness)", alineado con el
patrón ya usado en otra tabla del documento (línea ~16910). No se tocó
ninguna otra aparición — el resto no son inconsistencias, son conceptos
distintos.

---

## Verificación

- Snapshot de v70 archivado **antes** de editar:
  `archivo/Comprender_la_IA_2026_v70.html`, 2.363.947 caracteres —
  coincide exactamente con el tamaño de v70 antes de tocarlo; grep de los
  marcadores nuevos ("reubicada", "2.4b Elegir", "Faithfulness)", "no
  leas esto como") devuelve cero coincidencias.
- v71: `div` 4703/4703, `table` 227/227, `h2` 249/249, `h3` 382/382 (sin
  cambio neto — se movió contenido, no se añadió ni quitó ningún
  encabezado), `tr`/`ul`/`style`/`script`/`p` y los contenedores
  estructurales (`main`/`section`/`aside`/`nav`/`details`) sin cambios.
- Verificado antes de renombrar "Elegir un modelo de embedding": cero
  referencias cruzadas por número en el resto del documento (sin `id`,
  sin entrada de TOC).
- Tamaño: 2.363.947 → 2.364.788 caracteres (+841 — el cambio neto más
  pequeño de toda la serie v67-v71, esperable tratándose de correcciones,
  no de contenido nuevo).
- Carpeta principal: solo `Comprender_la_IA_2026_v71.html`.

## Alcance

Las cinco correcciones son las de mayor confianza y menor riesgo de las
detectadas en las tres revisiones editoriales. El resto —reequilibrio de
Cap. 5, edición esencial, caso transversal de punta a punta, el
"Apéndice de código" de §12.3 que sigue sin existir, y varias más—
quedan anotadas sin implementar en `Revision_editorial_agosto2026.md`,
por ser decisiones de alcance editorial o proyectos de mayor envergadura,
no fixes puntuales.
