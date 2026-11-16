# Registro v151 → v152 (calculadora de dimensionado, §6.4b)

## Qué cambió
- `index.html`: §6.4b (id `s64b`) antes de §6.5, con la figura `#cal64`. Versión, README, CHANGELOG. Copia de la v151 en `archivo/`.

## Decisiones
- Solo aritmética exacta: bytes por vector = ceil(dimensión × bits / 8); total = chunks × bytes × sobrecarga × réplicas. Gigabytes decimales (1 GB = 10⁹ bytes), coherentes con los «~31 GB» del §6.4.
- Sin cifras de rendimiento (latencias p95, número de workers): las de la infografía de origen eran ilustrativas y no se usan.
- La sobrecarga del índice (grafo, metadatos) y las réplicas son datos que aporta el lector; por defecto, 1. No se afirma ningún factor típico.
- Se avisa de lo que no entra: pérdida de recall al comprimir, datos de los propios documentos y la condición Matryoshka para truncar la dimensión.
- La referencia a «reordenar los candidatos con los vectores completos» se presenta como práctica habitual, sin fuente ni medición.

## Verificado
- Playwright, tema claro y oscuro, sin errores: preset del §6.4 → 30,7 GB en float32 (10 M × 768 × 4 B); preset masivo → 819,2 GB, 204,8 GB en int8 y 25,6 GB en binario; error de validación con valores no positivos; sobrecarga y réplicas aplicadas.
- Contraste: el primer barrido automático dio 1.00 en todo (fallo del propio escáner con los fondos transparentes de la tabla); repetido leyendo el fondo real, 0 textos por debajo de 4.5:1 en 48 elementos, en tema claro y oscuro.

## Sin verificar
- No se ha comprobado cuántos bytes por vector usa en realidad cada motor en cada modo de cuantización de 2 o 4 bits; la figura supone empaquetado denso.
