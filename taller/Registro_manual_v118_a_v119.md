# Registro de cambios · v118 → v119

*14 de octubre de 2026.*

Origen: infografía y post «MCP in One Request» (Greg Coquillo), contrastados con la especificación MCP en primario.
Veredicto del triaje (`2026-10-14 (b)`): **Integrar, rehecho**. El esquema no entra como contenido; sí la idea de un recorrido de punta a punta.

## Cambio en el manual

- **§10.10.1b** (nuevo, `id="s10101b"`, con entrada de índice), entre §10.10.1 y §10.10.2: actores, la petición en ocho pasos, tabla de
  primitivas, recuadro de tres correcciones, simulador de cuatro pestañas y recuadro de revisión con insignia «caduca rápido». Fuente
  editable: `taller/widget_mcp_peticion.html` (marco de 1300 px que se ajusta al contenido; modo claro y oscuro, este último sincronizado con `body.dark` del manual).
- **§10.9.4**, «Matiz (2026-09)»: una línea con el segundo caso (Zhang et al., arXiv:2609.35738), sin cifras (CI-HL-1).
- Versión v118 → v119 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## Errores del esquema original (corregidos en el texto)

Cliente que «descubre servidores»; cliente como enrutador (el modelo elige); flujo con estado previo a 2026; servidor que «ejecuta de forma
segura»; resultado como evidencia anclada; omisión de prompts, recursos, transportes, autorización y seguridad; errata «MCP Clinet».

## Verificado contra el spec (leído el 14/10/2026)

- 2026-07-28: arquitectura (host, cliente 1:1, servidor, principios), `server/tools` (modelo; DEBERÍA persona en el bucle; anotaciones no
  confiables; obligaciones del servidor y recomendaciones al cliente; `resultType`, `isError`, `ttlMs`/`cacheScope`), `server/resources`
  (dirigidos por la aplicación; validar URI), `server/prompts` (controlados por la persona), `basic/transports` y `streamable-http`
  (`MCP-Protocol-Version`, `Mcp-Method`, `Mcp-Name`, 400 `HeaderMismatch` −32020, sin GET ni sesión, cancelación por cierre del flujo,
  HTTP+SSE obsoleto), `basic/versioning` (sin handshake, `UnsupportedProtocolVersionError` −32022, matriz de compatibilidad),
  `server/discover`, `basic/patterns` y `mrtr` (`input_required`, `inputResponses`, `requestState`, id distinto en el reintento).
- 2025-11-25: `initialize` / `notifications/initialized`, `MCP-Session-Id`, GET para flujos del servidor, `Last-Event-ID`, desconexión que no cancela.
- Las páginas de autorización se leyeron antes (opcional, solo HTTP, OAuth 2.1); en el texto solo se afirma eso.
- Comprobación en Chromium (Playwright): 4 pestañas, 2 revisiones × 2 transportes × 3 escenarios × MRTR × capa de confianza en cada paso,
  matriz de 9 casillas, 32 combinaciones de controles × 2 ataques, test completo; sin errores de consola; sin desbordamiento horizontal a 380 px.
- v118 archivado íntegro en `archivo/Comprender_la_IA_2026_v118.html` (md5 `07eb5175ab7b42c51a85f194bfe07e42`, idéntico al `index.html` previo).
- Balance de etiquetas: div 5285→5290, p 1582→1590, ol 18→19, li 720→728, table 235→236, iframe 16→17 (todas con apertura = cierre); 32.097 → 32.752 líneas. El `srcdoc` del marco es, al desescapar, idéntico a `taller/widget_mcp_peticion.html`.
- Modo oscuro del simulador: sigue `body.dark` del manual (comprobado al alternarlo) y, suelto, `prefers-color-scheme`; el botón 🌓 lo fuerza. Idea tomada de una versión alternativa del widget, que tenía además errores de contenido (transporte, matriz, JSON de `_meta`) que no se importaron.
- Dentro de los recuadros (`callout`, `warning`, `nota`) el CSS convierte `<strong>` en etiqueta de bloque: en el texto nuevo solo lleva `<strong>` el título de cada recuadro y el resto del énfasis va con `<b>`.

## No hecho / a tener en cuenta

- Los mensajes del simulador son ilustrativos (valores inventados); lo que sigue el spec es la estructura. Las casillas «Moderno–Dual» y
  «Dual–Dual» de la matriz no figuran en la tabla del spec; el widget las marca como deducción.
- «Capa de confianza»: es una simulación didáctica de qué control puede cortar qué, no una medición. Menor privilegio y puerta de
  política son patrones de diseño, no requisitos del spec (el widget lo dice).
- El método de Zhang et al. se describe según la extracción del PDF, no una lectura directa; por eso la línea del Matiz no lleva cifras.
- Tema claro fijo; en pantallas estrechas el marco crece (la pestaña de recorrido es larga).
- Sampling, roots y logging no se tratan: el texto se limita a lo verificado en esta pasada.
- **Defecto previo detectado, sin tocar:** el `<div class="callout">` de «La matemática de la entropía acumulada» (línea 20299 de v118, sin cierre antes del simulador `entw72`) envuelve en un único recuadro azul desde allí hasta la línea 21422, es decir, buena parte del Cap. 10 incluida §10.10 (el `</div>` de 21422 lo cierra). Explica que en esa zona los `<strong>` se vean como etiquetas de bloque. Corregirlo exige cerrar el recuadro tras el simulador y quitar el cierre sobrante; queda propuesto como aparte.
