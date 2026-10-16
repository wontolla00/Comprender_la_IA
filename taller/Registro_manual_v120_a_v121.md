# Registro de cambios · v120 → v121

*16 de octubre de 2026.*

Origen: artículo «Faites-vous trop confiance à ChatGPT ?» (Rottembourg y Prunkl, Inria, 16/10) y el preprint «Invisible to the Machine»
(Pitenin, arXiv:2608.07069, 07/08/2026), que el autor adjuntó en PDF. Veredicto del triaje (`2026-10-16 (a)`): **Integrar, en pequeño**.
Pendiente CI-AV-1, cerrado aquí. Decisión del autor tras la revisión del manual: una sola adición, el párrafo de §4.3 y la entrada del Triaje.

## Cambio en el manual

- **§4.3**, tras el párrafo de implicaciones normativas: recuadro `nota` «Matiz (2026-10) · Medir también tiene que ser reproducible».
  Distingue la reproducibilidad de la salida (lo que ya decía §4.3) de la de la medición, con cuatro controles: repetir, reformular, comparar
  entre sistemas y validar el instrumento de extracción. Ilustra con el preprint y lista sus límites; termina con el hábito para el
  *golden dataset* (dar la dispersión entre repeticiones junto a la media; no atribuir a deriva lo que cabe en esa dispersión).
- Versión v120 → v121 en `<title>`, barra superior, `README.md`, `CHANGELOG.md` y `CLAUDE.md`.
- Sin bibliografía de capítulo nueva: el capítulo 4 no tiene lista de referencias; la fuente va citada en línea (arXiv:2608.07069).

## Verificado en el PDF completo (31 páginas, leído el 16/10/2026)

- Autor y filiación: Vladimir Pitenin, Norly Research; fecha de arXiv 07/08/2026 (portada). Financiación y conflicto de intereses declarados
  en §8 (Norly vende herramientas de reseñas y visibilidad en IA); preinscripción y resultados nulos señalados.
- 96 consultas, 4 sistemas, 2.208 ejecuciones, 7 días, 12.439 menciones válidas (§3 y §5.1).
- Jaccard entre repeticiones: Gemini 0,45; Perplexity 0,40; OpenAI 0,29; Claude 0,22 (§5.5), de ahí «0,22 a 0,45». Entre motores: 0,33 a 0,54
  (§5.6). Paráfrasis por debajo de la repetición en los cuatro (Fig. 5). Retest a las dos semanas comparable al reintento del mismo día
  (Apéndice A, §6.3).
- Foursquare: OR 1,70 con el emparejamiento anterior, OR 0,84 tras la corrección (§4.2 y §6.5).
- Claude: presupuesto de búsqueda limitado a dos por ejecución por decisión de los autores, vinculante en el 97,6 % de las ejecuciones (§3.3).
- Descripción de Jaccard en el texto: «locales comunes entre locales totales de dos listas» (intersección sobre unión).

## Verificado en otras fuentes (no en este PDF)

- Nada más entra en el manual. Las cifras de Strömberg, Lei y Wu y de OptimismBench del artículo divulgativo se comprobaron en sus
  páginas el mismo día, pero **no** se usan aquí.

## Comprobaciones del HTML

- v120 archivado íntegro en `archivo/Comprender_la_IA_2026_v120.html` (md5 `792c27fcf769e168af31daeae8d7395b`, idéntico al `index.html` previo).
- Balance de etiquetas (aperturas = cierres): div 5291→5292, p 1590→1590, table 236→236, tr 1366→1366, td 3876→3876, li 729→729,
  ul 169→169, h2 264→264; 32.760 → 32.766 líneas.
- Dentro del recuadro solo lleva `<strong>` el título; el resto del énfasis va con `<b>` o `<i>` (el CSS convierte `<strong>` en bloque).

## No hecho / a tener en cuenta

- Sin GEO, sin las cifras de visibilidad de locales ni el relato de concentración del artículo divulgativo (el paper mide cola larga y poco
  acuerdo, no concentración).
- La fila «si retrieval trae doc obsoleto, alucina con fuente» (tabla de técnicas) no se toca: el paper observa fidelidad a fuentes caducadas,
  pero en locales, no en documentos; un solo estudio.
- El efecto de la medición en Empreinte (si ya repite y reformula) se revisa aparte; no es cambio del manual.
