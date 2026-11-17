# Registro v157 → v158 (AEPD, Strömberg, SASE)

## Qué cambió
- `index.html`: cuatro notas nuevas (`s109-aepd-2026-11`, `s215-aepd-2026-11`, `s203-stromberg-2026-11`, `s145-sase-2026-11`); frase de §20.3 sobre «sigue sin datos»; versión; regla de contraste ampliada. README, CHANGELOG, Triaje. Copia de la v157 en `archivo/`.

## Verificado
- AEPD: PDF original de 76 páginas leído entero con paginación impresa; páginas citadas comprobadas en el texto. «Regla de 2»: atribución de la propia guía (Chromium 2021; reformulación para agentes).
- Strömberg, Lei y Wu: columna de los autores en VoxEU y resumen del documento de trabajo, con cifras coincidentes entre ambos.
- SASE: comunicado de Palo Alto del 23/03/2026; documentación del plugin de Cisco AI Defense para ADK y paquete de middleware de LangChain en PyPI (modos, `fail_open`).

## Sin verificar
- PDF completo del DP 21577 (solo columna y resumen); robustez, controles y apéndices.
- Informe de Gartner: solo el resumen público; la frase de que los agentes son una clase de usuarios que SASE no estaba pensada para proteger la atribuye la prensa (Fierce Network); no se leyó el informe.
- Que ningún fabricante documente aprobación humana acción por acción: solo se dice que no aparece en lo leído.
- Descripción general de SASE: tomada de la entrada del Triaje, sin primario propio.
- Fecha de v157: la antigüedad de Palo Alto y Cisco puede haber cambiado desde el 17/11/2026.

## Decisiones
- La AEPD se cita como orientación, con sus propias salvedades; el decálogo para usuarios se separa.
- La guía de Meta citada por la AEPD para la «regla de 2» no se ha leído; se cita solo a través de la guía.
- Se matiza una frase de §20.3 que decía que la delegación temprana «sigue sin datos».
