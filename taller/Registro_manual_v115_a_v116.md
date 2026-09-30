
# Registro de cambios · v115 → v116

*30 de septiembre de 2026.*

Origen: un post de LinkedIn sobre la arquitectura de Muse (Meta), presentada como obtenida preguntándole al
propio asistente. Cruce previo con el manual: bucle de agente (§10.1, §10.4b), human-in-the-loop (§10.7),
memoria persistente con `MEMORY.md` y `CLAUDE.md` (§10.9), skills con divulgación progresiva y subagentes
(§10.3–10.4) ya estaban cubiertos. Faltaba una cautela de método, aprobada por David antes de tocar el manual.

## Cambio en el manual

1. **§10.4** — recuadro nuevo «Quién describe la arquitectura de un asistente comercial, y con qué autoridad»,
   al final de la sección, antes del encabezado de §10.4b. Enlaces internos: §21.8 (LLM07), §10.5c, §10.6,
   §12.6. Sin `id` nuevo ni entrada de índice.

## Verificado y no verificado

- **Verificado:** el comunicado de Meta sobre Muse Spark (about.fb.com, abril de 2026) presenta Muse Spark como
  modelo de la serie Muse y confirma el lanzamiento de varios subagentes en paralelo. No menciona máquina
  Linux, terminal, navegador, tareas programadas, memoria en ficheros ni los conectores del esquema.
- **No verificado y no afirmado:** que la arquitectura del post sea la real, que sea «la misma de todos los
  asistentes» y que esté descrita en un prompt de sistema. Son conjeturas del autor del post; el texto del
  manual solo dice que el esquema no se apoya en la fuente oficial, no que sea falso.
- El autor del post no se cita en el manual.

## Verificación

- v115 archivado íntegro en `archivo/Comprender_la_IA_2026_v115.html` antes de editar (md5
  `9ddf11008daac205030d26a690fce675`, idéntico al original).
- Balance de etiquetas (aperturas y cierres): div 5280→5281, p 1577→1580, strong 2436→2437, a 800→804; em, ul,
  li y span sin cambio; sin desbalance. 31.444 → 31.450 líneas.
- Los cuatro enlaces internos (`#s218`, `#s105c`, `#s106`, `#s126`) apuntan a `id` existentes.
- `<title>` y badge de topbar actualizados a v116.

## Pendiente

- Sin commit: git solo desde el Windows de David.
