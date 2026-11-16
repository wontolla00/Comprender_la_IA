# Registro v153 → v154 (§2.5.5.4, cuatro «ontologías» de plataforma)

## Qué cambió
- `index.html`: nota `s2554-plataformas-2026-11` al final de §2.5.5.4, antes de §2.5.5.5. Versión, README, CHANGELOG. Copia de la v153 en `archivo/`.

## Decisiones
- Va en §2.5 (formalismo compartido frente a modelo local), no en §6.5b, porque el argumento es el de §2.5.5.4/§2.5.5.5.
- Estado de Databricks releído el 16/11 en el anuncio de GA: Genie Ontology y los fragmentos son GA; el gestor de ontología sigue «próximamente en beta»; sin aprobación humana descrita antes del uso. Una página de documentación aún marcaba «Public Preview»; no se cita esa discrepancia en el texto porque el badge «caduca rápido» ya avisa.
- Se declara que la cifra de precisión de Databricks (91 %) viene de una prueba del propio proveedor en un espacio simulado.
- La lectura «son modelos locales con vocabulario de ontología» es del manual, no de las fuentes.

## Verificado
- Playwright, tema claro y oscuro, sin errores: anclas `#s2555` y `#ca-puerta-promocion` válidas, 6 enlaces en la nota. El contraste de las negritas de la nota en tema claro era 2,84:1; se añade una regla acotada (`body:not(.dark)`, color `#92400e`) en el bloque `fix-contraste-widgets-oscuros` para esta nota y para las tres notas nuevas de v151 y v153; repetido el barrido: 0 textos por debajo de 4,5:1 en 27 elementos, en claro y oscuro. Las demás notas «Matiz» del manual siguen igual (preexistente).

## Sin verificar
- Que Fabric IQ siga en vista previa tras el 08/11 (fuentes de 31 y 8 días de antigüedad).
- La cifra del 91 % y su descripción proceden de un resumen automático de la página, no se ha leído la metodología.
- Nada documenta el coste de mantenimiento de ninguna de las cuatro.
