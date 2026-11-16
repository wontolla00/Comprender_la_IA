# Registro v152 → v153 (§6.3, dos etapas y calibración)

## Qué cambió
- `index.html`, §6.3: aviso bajo la tabla de «ganancia típica» y nota `s63-mecanismo-2026-11` (por qué hay dos etapas, coste lineal con los candidatos, sigmoide no es calibración, enlace a §3.1b). Versión, README, CHANGELOG. Copia de la v152 en `archivo/`.

## Decisiones
- Tabla de «ganancia típica»: se etiqueta como orden de magnitud orientativo en vez de buscar un primario por cifra. Sigue sin saberse de dónde salieron esos rangos; si se quiere respaldarlos, hay que buscar fuente fila a fila.
- La extrapolación (100 candidatos ≈ 2,5 s en CPU) sale de la cifra propia del manual (~500 ms por 20 documentos) y se declara como lineal y no medida.
- No se portan las cifras de la infografía (MS MARCO, +85 ms en A100), ni ONNX+int8, ni las pérdidas listwise, ni la regla de saltarse el rerank en consultas cortas: no tienen fuente.

## Verificado
- Playwright, tema claro y oscuro, sin errores de página: título v153, enlace a `#s31b` válido. Contraste de la nota: cuerpo 14,1:1 (claro) y 11,8:1 (oscuro), enlace 9,1:1 y 8,0:1; solo la cabecera en negrita en tema claro queda en 2,84:1, igual que el resto de notas «Matiz» (preexistente).

## Sin verificar
- Que el coste del cross-encoder sea lineal en el número de candidatos en todas las configuraciones (con lotes y GPU puede dejar de serlo en tramos pequeños).
- El origen de los rangos de «ganancia típica» de la tabla.
