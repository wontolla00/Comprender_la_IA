# Registro v150 → v151 (§6.13.7, lo promovido caduca)

## Qué cambió
- `index.html`: sección nueva §6.13.7 (id `s6137`) antes del Cap. 7, con nota de atribución, tabla de cuatro estados y figura interactiva `#obs67`.
- Puentes en §6.11.2 (límite «requiere recompilación») y §6.13.4 (`superseded_by`).
- Nota «Fundamentado no es vigente» en §3.2 tras la tabla de dimensiones (id `s32-obsoleta-2026-11`).
- Versión y README/CHANGELOG. Copia de la v150 en `archivo/`.

## Decisiones
- Se trata como diseño transferible, no como resultado: la fuente es un blog de un proveedor, el repositorio no se nombra y no hay tamaño de muestra.
- «Obsoleta» no se presenta como «falsa»; los nombres de los estados son los del manual.
- Se añade, de cosecha propia, el efecto de la granularidad del recibo (documento entero frente a fragmento); se señala como consideración de diseño y la figura lo muestra.
- La figura usa contenido propio y ficticio; no reproduce la infografía de origen. Sin entrada de Triaje para el post (decisión del autor); CI-AR-1 cerrado.

## Verificado
- Playwright, tema claro y oscuro, sin errores de página: estados iniciales, comprobación, verificación y reescritura, y modo por documento. Contraste de la figura sin fallos; las cabeceras de nota en tema claro siguen en 2.84 (preexistente en todas las «Matiz»).

## Sin verificar
- Afirmaciones y cifras del post original (no se usan).
- Si la referencia cruzada al §15.3 (identificadores por hash de contenido) sigue vigente tras la reestructuración: no se ha releído esa sección en esta versión.
