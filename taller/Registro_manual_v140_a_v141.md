# Registro v140 → v141 (§5.7d)

## Qué cambió
- `index.html`: versión (título, insignia de la barra superior y nota del Cap. 22) y dos añadidos en §5.7d:
  1. Al final del bloque «Un tercer diagnóstico: overhead-bound», una frase que nombra CUDA Graphs y su coste (CI-CG-1).
  2. Un recuadro `nota` «Matiz (2026-10)» (`id="s57d-matiz-2026-10"`) entre el párrafo sobre continuous batching y el término del glosario: TPOT, goodput, chunked prefill y caché KV en FP8 (CI-IE-1).
  3. Palabras clave nuevas en la entrada overhead-bound del buscador y una entrada nueva que apunta al recuadro.
- Copia de la v140 en `archivo/Comprender_la_IA_2026_v140.html`.
- Origen: entradas `2026-10-30 (b)` (Inference Engineering, Tech with Mak) y `(c)` (CUDA Graphs) del Triaje.

## Comprobaciones hechas
- Antes de editar: «goodput», «TPOT» y «chunked prefill» tenían 0 apariciones en el manual; «CUDA Graph» también; §5.7d ya definía TTFT e ITL y tenía el bloque overhead-bound sin nombrar la técnica.
- Primarios, leídos el 30/10/2026 con una herramienta de lectura web que resume (no los PDF completos): DistServe (arXiv 2401.09670, definición de goodput y de TTFT/TPOT), Sarathi-Serve (OSDI 2024, chunked prefill con planificación sin parones), documentación de vLLM (`kv_cache_dtype` fp8 / fp8_e4m3 / fp8_e5m2; escalas 1,0 sin calibración), diseño de CUDA Graphs de vLLM (varios tamaños capturados, vuelta a eager, modo por defecto) y tutorial de CUDA Graphs (grafos estáticos tras instanciarse).
- HTML: 970 `id` sin duplicados (uno más que en la v140, el del recuadro), `<div>` de §5.7d balanceados (55 y 55), `<p>` balanceados, sin «v140» residual, LF sin CRLF, sintaxis del script del buscador comprobada con `node --check`. El diff contra la v140 son las marcas de versión, la frase, el recuadro y las dos entradas del buscador.

## Decisiones
- No se reproduce ninguna cifra de aceleración de los papers (7,4×, 2,6×, 3,7×, 5,6×): son de sus montajes.
- ITL y TPOT no se presentan como sinónimos: se dice que las definiciones varían y que hay que comprobar la de la herramienta. Esa distinción de uso común no se ha contrastado con un primario.
- No se afirma que las direcciones de memoria deban coincidir en cada repetición de un grafo: no apareció en las fuentes leídas.
- «Cuánto se gana depende de cuánto pese el hueco» es razonamiento propio, sin medida; el texto lo dice sin cifra.
- PP y DP (paralelismo en pipeline y de datos) quedaron fuera.

## Sin cerrar
- Releer DistServe y Sarathi-Serve completos antes de añadir cifras.
- Contrastar con un primario la distinción de uso entre ITL y TPOT.
- EM-IE-1 (Empreinte: TTFT opcional y porcentaje que cumple un objetivo de latencia) sigue sin decidir.
