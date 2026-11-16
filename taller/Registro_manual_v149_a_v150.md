# Registro v149 → v150 (especialización de expertos en §5.7b.3)

## Qué cambió
- `index.html`, §5.7b.3: se quita «Especialización emergente» de Ventajas; se añade «Los «expertos» no son especialistas por tema» a Limitaciones; se reformula el punto de fine-tuning; versión.
- Copia de la v149 en `archivo/`.

## Decisión: suavizar y trasladar, no solo borrar
- La frase original no tenía fuente y el primario (Mixtral, §5, leído) la contradice en lo esencial: sin patrones evidentes por tema; patrones sintácticos sí.
- No se niega toda especialización: trabajos posteriores discrepan según modelo y tipo de enrutamiento (resúmenes leídos, no los textos completos). Por eso la cautela dice «mídelo» en vez de «no existe».

## Sin verificar
- La afirmación del punto de fine-tuning («el aprendizaje es menos eficiente si no llega a los expertos que más trabajan con tus datos») no tiene fuente; se dejó sin el presupuesto de dominios, pero sigue sin verificar.
- La infografía de JoinAI etiqueta tokens («database», «poem», «Python») con expertos distintos: ilustra «caminos distintos por token» pero refuerza la idea de expertos por tema. No se porta.
- Mixtral aplica softmax sobre los k logits mayores (reseña secundaria); no se ha contrastado con el primario ni se toca el manual por ello.
