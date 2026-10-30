# Registro v139 → v140 (§12.4c)

## Qué cambió
- `index.html`: versión (título, insignia de la barra superior y nota del Cap. 22) y un recuadro `nota` «Matiz (2026-10) · El precio de lista no es el coste de enrutar» al final de §12.4c, justo antes de §12.5. Nada más: el diff contra la v139 son las tres marcas de versión y el recuadro (+12 líneas netas).
- Copia de la v139 en `archivo/Comprender_la_IA_2026_v139.html`.
- Origen: entrada `2026-10-30 (a)` del Triaje (Walker, OpenRouter, 22/10/2026). Cierra CI-RT-1.

## Comprobaciones hechas
- §12.4c no mencionaba caché, reintentos, failover ni latencia (comprobado antes de editar).
- Documentación de Anthropic sobre caché de prompt, leída el 30/10/2026 con una herramienta de lectura web que resume: escritura 1,25× (5 min) y 2× (1 h) del precio base de entrada; lectura 0,1× con excepciones por modelo; aciertos solo con segmentos idénticos; caché aislada por organización y por espacio de trabajo. La página no dice si una caché se reutiliza entre modelos distintos; por eso el recuadro lo deja como cosa que medir y no lo afirma. La página no muestra fecha ni versión.
- Aritmética del reintento recalculada: 1,00 / 0,80 = 1,25.
- HTML: los `<div>` de §12.4c cuadran (6 abiertos, 6 cerrados), 962 `id` sin duplicados, ninguna «v139» residual en `index.html`.

## Decisiones
- No se reproducen cifras de OpenRouter (tokens, precios medios, cuotas, disponibilidad): proceden de una sola plataforma con interés comercial y no están contrastadas con un primario. Solo se toma el concepto y la aritmética del reintento.
- Los multiplicadores de caché llevan fecha de consulta porque cambian por modelo.

## Sin cerrar
- Verificar las cifras de OpenRouter contra su propia documentación o datos públicos antes de citar ninguna.
- Los multiplicadores por modelo (0,05× y 0,025× en algunos modelos de Anthropic) no se citan en el texto; si se quiere precisión por modelo, hay que fijarla con fecha.
- Si el Apéndice A tiene aritmética de coste de enrutado, valorar si debe incluir caché y reintentos (no revisado).
