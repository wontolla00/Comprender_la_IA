# Registro v141 → v142 (§12.x y §14.y)

## Qué cambió
- `index.html`: versión (título, insignia de la barra superior y nota del Cap. 22) y correcciones de vocabulario y de afirmaciones:
  1. §12.x: recuadro `nota` «Matiz (2026-10) · Enmascarar no es anonimizar» (`id="s12x-terminos-2026-10"`) tras el aviso del error de diseño y antes de «El patrón de implementación».
  2. §12.x: tooltip de «capa de anonimización», dos pasos del diagrama («Recibe el texto ya enmascarado», «Texto enmascarado»), frase «Esto garantiza que el log está limpio», y las dos listas pre-API/post-API (garantías absolutas, cifra de 5-20 ms, NER, nombres en respuestas).
  3. §14.y: dos frases sobre la extensión («anonimización en el cliente, antes de que ningún dato salga del navegador») y «prompts anonimizados».
  4. §4.2: «user_id anonimizado» → «seudonimizado».
  5. Glosario «Anonimización pre-API» y una entrada nueva del buscador que apunta al recuadro.
- Copia de la v141 en `archivo/Comprender_la_IA_2026_v141.html`.
- Origen: entrada `2026-10-30 (f)` del Triaje.

## Comprobaciones hechas
- Antes de editar, contra el código de Empreinte: el chat usa `anonymize_prompt_fast` (sin NER) antes de la API y es fail-closed solo para proveedores externos; la extensión no pre-anonimiza (delega en `log_receiver` → `pii_detector`) y su interruptor `anon_pii` no lo leía ningún código; Presidio solo corre en diferido (`presidio_pii_scan.py`); `anonymize_response` no toca nombres; el informe de Empreinte ya decía que las capturas de la extensión se observan tras el envío.
- Primarios: considerando 26 del RGPD (texto leído en gdpr-info.eu); dictamen 05/2014 del WP29 (leído entero con una herramienta de lectura web que resume; citas literales de §§2.2.2, 3, 4 y 4.1 comprobadas el 30/10/2026); sentencia EDPS contra SRB (texto de EUR-Lex, también con herramienta que resume; el número es C-413/23 P, un despacho escribía T-413/23 P); directrices 01/2025 del EDPB: portada «adopted, version for public consultation» (16/1/2025); no se halló versión final.
- HTML: 971 `id` sin duplicados (uno más que en la v141), `<div>` y `<p>` balanceados en todo el documento, sin «v141» residual, LF sin CRLF, sintaxis del script del buscador comprobada con `node --check`.

## Decisiones
- Se conserva el nombre «anonimización pre-API» (aparece en glosario, tablas y buscador) y se explica en el recuadro que es enmascarado; renombrarlo en todo el manual era más cambio que beneficio.
- No se afirma que la STJUE SRB dé un test de anonimización: no lo da. Corrección posterior (misma v142, tras leer el texto): se añade que aplica el Reglamento 2018/1725 y que anuló la sentencia del Tribunal General devolviéndole el asunto; la frase sobre el que envía se acota al deber de información (apreciación desde el responsable en la recogida, apartados 111-114) y sigue marcada como lectura prudente.
- La cifra de «5-20 ms» se quitó en lugar de sustituirla: no hay medida propia; el README de Empreinte dice que la latencia del NER es incompatible con la ruta en tiempo real.

## Sin cerrar
- Hecho el 30/10/2026 (lectura con herramienta que resume, no el PDF íntegro a la vista): sentencia SRB y dictamen 05/2014. Pendiente solo la versión final de las directrices 01/2025 del EDPB, que no existía en esa fecha.
- Si se quiere, repasar el resto del manual en busca de «anonimiza*» usado como sinónimo de enmascarado (hay ~30 apariciones; solo se tocaron las que afirmaban garantías o describían la extensión).
- EM-AN-2 (NER en la ruta previa a la API del chat de Empreinte) sin decidir.
