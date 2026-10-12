# Registro de cambios · v116 → v117

*12 de octubre de 2026.*

Origen: infografía y post «How Backpropagation Works» (Tech with Mak) y su versión HTML interactiva. Primera lectura:
«Descartar» (ejemplo introductorio correcto, sin afirmaciones nuevas). El autor pidió incluirlo como referencia visual
(entrada `2026-10-12 (g)` del Triaje, pendiente CI-BP-1, ahora cerrado). Cruce previo con el manual: «backpropagation»
solo de pasada (caja «Entrenamiento» del simulador de neurona y una frase del capítulo 5); «regla de la cadena», 0 apariciones.

## Cambio en el manual

1. **§0.1.3** — párrafo de enlace y simulador nuevo, después del simulador de la neurona y antes del encabezado de §0.1.4.
   Sin `id` nuevo ni entrada de índice. Glosario emergente para «retropropagación» y «descenso del gradiente».
2. Fuente editable del simulador: `taller/widget_retropropagacion.html` (se incrusta como `<iframe srcdoc>`, como los otros 14).
3. `<title>`, badge de topbar y README a v117.

## Defectos de la versión HTML original, corregidos

- Notación: `L/∂w₁` sin ∂ (dos veces), `∂L/ŷ` por `∂L/∂ŷ`, `∂/∂h₁` por `∂ŷ/∂h₁`.
- La red no se dibujaba (`drawConnections()` vacío) y «blue path» no apuntaba a nada: ahora hay SVG con aristas, pesos,
  gradientes y el camino de w₁ resaltado en grueso.
- El paso 4 llevaba texto fijo y una caja «Success!» fija: con η = 0,5 daba pérdida 12,5 («reducción» −2400 % en verde).
  Ahora todo se calcula desde η y el mensaje cambia según suba o baje la pérdida.
- La tabla usaba `toFixed(1)`: se perdía precisión con otros η. Ahora formato con coma decimal y sin ceros sobrantes.
- Estaba en inglés con `lang="es"`: traducido.

## Verificado

- Cálculo independiente en forma cerrada (sin código del simulador) frente al valor leído del DOM del manual real con
  Chromium sin interfaz: η = 0,1 → L = 0,12005; η = 0,15 → 0,75338 (sube); η = 0,5 → 12,5 (sube, h₁ queda a 0);
  η = 0,01 → 0,36134. Gradientes 3, −1, 1, 2. Coinciden en los cuatro casos. Sin errores de JavaScript; las únicas
  incidencias de consola son las tipografías externas bloqueadas en el entorno de prueba.
- `index.html` abre con v117 en el título, 15 `<iframe>`, sin `id` duplicados y sin enlaces internos nuevos rotos
  (el único «roto», `${lab.anchor}`, es una plantilla de JavaScript que ya estaba en v116).
- v116 archivado íntegro en `archivo/Comprender_la_IA_2026_v116.html` antes de editar (md5
  `3c1614a383d0a156775ba83481e2d6c1`, idéntico al original).
- Balance de etiquetas: div 5281→5283, p 1580→1581, iframe 14→15, span y a sin desbalance; 31.449 → 31.711 líneas.

## No hecho / a tener en cuenta

- El simulador tiene tema claro fijo; no sigue el modo oscuro del manual (el de la neurona tampoco).
- Altura del `<iframe>` fija en 1100 px: en pantalla estrecha (≈420 px) el contenido llega a ≈1320 px y se desplaza dentro del marco.
- Atribución: se cita a Tech with Mak como origen del ejemplo («adaptado de»). Si el autor prefiere cifras propias, hay que
  cambiar `P0`, `X` e `Y` en el simulador y el pie.
- El README dice «7 simuladores» (desfasado: hay 15 `<iframe>` interactivos); no se tocó.
- Commit local; sin push.
