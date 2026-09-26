# Registro de cambios · v100 → v101

*22 de septiembre de 2026.*

Origen: análisis del post de LinkedIn de Emmanuel Fabre sobre fatiga neurológica
en reuniones consecutivas y asistentes de IA como "cerebro externo". El post no
toca el AI Act, pero su cierre en herramientas comerciales (tl;dv, Jamie, Sally AI,
Granola, Copilot) llevó a revisar si el Cap. 16 explica *por qué* existe la
regulación, no solo qué exige.

## Verificación previa

- El Cap. 16 (`id="cap16"`) ya tenía un callout `.callout` de apertura ("🧵 Para
  qué te sirve esto") y un caso ancla, pero ningún párrafo situaba el AI Act en
  perspectiva histórica: por qué una tecnología con beneficios reales necesita
  instituciones que repartan esos beneficios, y no solo un mandato de cumplimiento.
- `.nota` está definida en el `<style>` principal (`--yellow` / `--yellow-light`,
  con variante `body.dark`) y en uso real en 15 instancias del manual — clase
  verificada, a diferencia de `.hilo` (definida en CSS pero sin ninguna instancia
  real, por lo que se descartó en v99/v100 y se sigue descartando aquí).
- Ancla localizada con la misma expresión regular usada en v99→v100:
  `<div class="callout">\r\n<strong>🧵\s*Para qué te sirve esto</strong>.*?</div>`
  filtrando por posición > inicio de `id="cap16"`.

## Cambios

1. **Nuevo callout `.nota`** insertado inmediatamente después del callout de
   apertura del Cap. 16 y antes del caso ancla ("🧭 Caso ancla de este
   capítulo"): **"🏛 Por qué existe esta regulación"**. Contenido: la Engels'
   Pause (1790–1840, Robert Allen) como precedente de una tecnología cuya
   productividad se disparó mientras los salarios reales quedaban atrás durante
   casi medio siglo por falta de instituciones que repartieran el beneficio;
   Acemoglu y Johnson (Nobel de Economía 2024, compartido con Robinson),
   *Power and Progress* (2023), como marco de que el reparto de beneficios de una
   tecnología depende de instituciones deliberadas, no de una tendencia
   automática. Cierra con "Cumplir y construir bien no son dos trabajos
   distintos" — la misma idea que ya defiende `11_Auditra/README.md`.
2. **`<title>` y badge de la barra superior**: `v100` → `v101`.
3. **`Fase_0_Onboarding.html`**: sus 11 menciones y enlaces de versión actual
   reapuntados a v101. Se conservó intacta la mención histórica "Añadidos en
   v100" del comentario sobre los bloques Q&A, que describe cuándo se incorporó
   esa función y sigue siendo cierta con independencia de la versión actual.

## Lo que no se cambió, a propósito

- Ni una línea del resto del capítulo 16, ni de ningún otro capítulo.
- No se usó `.hilo`: sin instancia real verificable en el manual, se prefirió la
  clase con 15 usos reales y comportamiento comprobado en claro y oscuro.
- No se tocó el caso ancla ni el bloque "al terminar este capítulo serás capaz
  de": el nuevo callout se coloca *antes* de ambos, como contexto de por qué
  existe la norma, no como parte del contenido técnico que sigue.
- No se corrigieron ni ampliaron las imprecisiones del post de origen dentro del
  manual (el post no se cita ni se referencia); esa corrección queda en la
  bitácora, no en el manual.

## Verificación

- **Proceso**: v101 generado desde v100 en binario. CRLF 31.133 → 31.137 (+4:
  el salto de línea antes del nuevo bloque y 3 saltos internos del callout).
- **Comparación estructural**: bytes 2.903.550 → 2.904.768 (+1.218); `<div>`
  abiertos y cerrados 5.231 → 5.232 (ambos, balanceados); `<p>` 1.530 → 1.530 sin
  cambio; `<style>` 24 → 24; `<h2>` 257 → 257; ids 946 → 946, sin duplicados;
  anclas internas rotas: 0 reales (el único hit es un literal `${lab.anchor}`
  dentro de una plantilla JS, no markup, presente también en v100).
- **`.nota` en el manual**: 15 → 16 instancias.
- `Comprender_la_IA_2026_v100.html` archivado en `archivo/`.

## Alcance

Una sección nueva de contexto histórico-regulatorio en el Cap. 16, más dos
metadatos de versión y la sincronización de enlaces del acompañante. Sin
cambios de contenido técnico, estructura ni numeración.
