# Registro de cambios · v105 → v106

*22 de septiembre de 2026.*

Origen: tercer post de la ronda de revisión ("How a GPU Actually Works") — el mismo artículo que
`01_Ciclo_Covenant/taller/GPU_roofline_y_Apendice_E_nota_puente.md` ya citaba sin tener el texto
disponible (ahora actualizada esa nota con el texto completo). El post cubre dos mitades: el
roofline model (ya cubierto en el manual, §5.7d, con las mismas cifras exactas verificadas
independientemente contra el datasheet de NVIDIA) y microarquitectura del chip (warps, SIMT,
jerarquía de memoria por SM — sin cobertura en el manual).

**Decisión explícita, a petición del usuario ("¿hay interés real a escribirlo?")**: no se escribió
la mitad de microarquitectura como sección nueva. Criterio: ese nivel (warps residentes por SM,
jerarquía de registros/shared memory/L2/HBM) es el de quien escribe kernels CUDA, no el de quien
lee una ficha técnica o decide si activar expert parallelism — no cambia ninguna decisión que el
lector de este manual vaya a tomar, a diferencia de continuous batching o MoE serving (v103→v105,
mismo día), que sí aparecen en benchmarks y guías de despliegue que el lector se va a encontrar.

## Cambio (único, pequeño, a diferencia de los dos anteriores del día)

Un solo concepto del post sí pasó el filtro: **overhead-bound** como tercer diagnóstico de
rendimiento, distinto de memory-bound y compute-bound (que §5.7d ya cubre como los dos únicos
casos del punto de equilibrio). Es diagnóstico real y accionable — una GPU puede ir lenta sin que
ni el ancho de banda ni el cómputo estén cerca de su techo, por coste fijo de despacho de
operaciones pequeñas — y el arreglo (menos operaciones más grandes, captura de secuencia) es
distinto al de los otros dos casos.

1. **Un párrafo `callout concept` nuevo** en §5.7d, insertado tras el cierre de "El techo
   cuantitativo: intensidad aritmética y el punto de equilibrio" y antes de "FlashAttention" — no
   una sección `<h2>`/`<h3>` nueva, un aside corto.
2. **Una entrada nueva en el índice de búsqueda** del manual para "overhead-bound".
3. **`<title>` y badge**: `v105` → `v106`.
4. **`Fase_0_Onboarding.html`**: referencias reapuntadas a v106.

## Lo que no se cambió, a propósito

- Nada del resto de warps/SIMT/SM/coalescencia/divergencia de rama del post — evaluado y
  descartado explícitamente por altitud de audiencia, no olvidado.
- El Apéndice E de *The_Polyhedron* — la nota-puente de Covenant se actualizó con el texto del
  post, pero el Apéndice E en sí queda intacto, no lo necesita.

## Verificación

- v105 archivado íntegro en `archivo/`.
- Balance estructural: `<div>`/`</div>` 5258→5259 (+1), `<p>`/`</p>` 1550→1551 (+1) balanceados en
  ambos lados. `<h2>` sin cambio (258 — es un callout, no una sección). Sin ids duplicados.
- 31.252 → 31.256 líneas (+4).

## Alcance

El más pequeño de los tres cambios del día — un párrafo, no una sección. Cierra un hueco de
diagnóstico real sin inflar el manual con contenido de altitud equivocada para su audiencia.
