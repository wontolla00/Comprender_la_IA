# Registro de cambios · v119 → v120

*15 de octubre de 2026.*

Origen: infografía y post «L'injection de prompt devient un ver» (veille del 14/10), contrastados con el informe primario de OpenAI.
Veredicto del triaje (`2026-10-14 (c)`): **Integrar, en pequeño**. Pendiente CI-WM-1, cerrado aquí. El autor pidió «haz el 5» y dejó a mi
criterio fila o Caso 5: se eligió **una fila y un recuadro breve**, porque el hallazgo es de laboratorio y un Caso entero lo sobredimensionaría.

## Cambio en el manual

- **§21.5.1**, tabla de canales de salida: fila nueva «La salida del agente, leída por otro agente» tras «Memoria persistente» (es el mismo
  patrón: lo que se escribe hoy lo lee otro después), con su mitigación (confirmación humana en lo que se escribe hacia fuera o en espacios
  compartidos, destinos en lista blanca fijada por código, tope de escrituras por ventana, tratar como no fiable lo leído de un espacio compartido).
- **§21.5**, tras el Caso 4 (EchoLeak): recuadro `nota` «Matiz (2026-10) · La inyección que se copia».
- Bibliografía del capítulo: OpenAI Alignment (2026) y Cohen, Bitton y Nassi (2024; Morris II, arXiv:2403.02817).
- Versión v119 → v120 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.

## Verificado en primario (15/10/2026)

- **OpenAI** (`alignment.openai.com/misalignment-reports/self-replicating-prompt-injections-exist/`): fecha de divulgación 25/09/2026;
  descubierto el 27/06/2026; atacante de tipo GPT-Red basado en GPT-5.4-mini con aprendizaje por refuerzo; víctima de los ejemplos de correo
  y sistema de archivos también basada en GPT-5.4-mini; ambos, puntos de control de investigación **internos**; el ejemplo de Slack, con
  GPT-5.5 (el informe no dice si es interno); **ningún impacto fuera de llamadas simuladas**, datos de ejemplo sintéticos, ejemplos
  escogidos, **sin tasas ni cifras**; la autorreplicación pasa a ser un objetivo del atacante en el entrenamiento. Rutas citadas en el texto:
  copia en la respuesta de correo, falso aviso de sistema con borrado de un directorio, cadena de lecturas con envío de una moneda interna
  y repost. El informe cita además otras (comentarios de código, falsa nota de compactación) que el texto no desarrolla.
- **Morris II** (arXiv:2403.02817): Cohen, Bitton y Nassi; v1 de 5/03/2024, v2 de 30/01/2025; gusano de laboratorio contra un ecosistema de
  asistentes de correo con RAG (según el resumen del artículo).
- **Limitación de la lectura:** ambas páginas se leyeron mediante un resumidor de página (el entorno no llega a esos sitios con `curl`), no el
  HTML crudo. El contenido coincide entre dos lecturas independientes y con la entrada del Triaje, pero no se comprobó palabra por palabra.
- **Una nota de prensa** (Daily Security Review) da fechas y modelo distintos (junio de 2026 con GPT-5.6, publicación el 29/09): contradice
  el primario y **no se usa**.

## Comprobaciones del HTML

- v119 archivado íntegro en `archivo/Comprender_la_IA_2026_v119.html` (md5 `f76a4b2c9d269c93d31ad608cf765dd6`, idéntico al `index.html` previo).
- Balance de etiquetas (aperturas = cierres): div 5290→5291, p 1590→1590, table 236→236, tr 1365→1366, td 3873→3876, li 728→729;
  32.752 → 32.760 líneas.
- Chromium (Playwright): la fila y el recuadro existen y se renderizan (captura revisada); título y barra superior en v120. El
  desborde horizontal a 380 px (`scrollWidth` 591) **ya estaba en v119** y es idéntico; los errores de consola son recursos externos que el
  entorno no alcanza, también presentes en v119. No se abrió en un navegador del autor.
- Dentro de los recuadros solo lleva `<strong>` el título; el resto del énfasis va con `<b>` (el CSS convierte `<strong>` en bloque).

## No hecho / a tener en cuenta

- Sin «Caso 5» propio: si aparece un incidente real o tasas medidas, esta fila y el recuadro son el sitio para actualizar.
- La cifra de «2.076 CVE relacionados con IA» (GTIG) que circuló con la noticia **no se usa** (no es de «la pila IA» y no es de este informe).
- La expectativa del informe («entrenar con este ataque mejorará la robustez») se cita como expectativa de los autores, sin medida.
