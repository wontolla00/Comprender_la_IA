# Registro de cambios · v117 → v118

*12 de octubre de 2026.*

Origen: tres piezas de veille del mismo día.

1. Infografía interactiva «How LLMs Actually Generate Text» (Pandey): **Descartar**. El manual ya cubre cada paso con más detalle.
   Errores: el modelo borrador «genera 4 tokens en ~1 forward pass» (los genera uno a uno; lo que va en una pasada es la verificación),
   d_model 4096 «en GPT-4» con «×96 capas en GPT-4» (4096 y vocabulario 128K corresponden a Llama 3 8B, con 32 capas; GPT-4 no es
   público), cuadrícula de atención sin normalizar ni máscara causal, etiqueta de la matriz de embeddings contradictoria, ID de token
   distinto para «grav» entre pasos, distribución con «gravity» como siguiente token más probable tras «What is gravity?», y
   controles de muestreo que no cambian nada.
2. Docx «How LLM Inference Works, Clearly Explained» (Chawla): **Descartar**. Todo está en §5.7d y §5.5c. Errores: V4 «abril de 2025»
   (fue abril de 2026), `softmax(scaled)` con variable inexistente, pseudocódigo que suma posiciones pese a decir que RoPE no lo hace,
   vocabulario «unos 50.000», 1 MB por token solo válido sin GQA, y cifras sin fuente (FP16→INT8 «a la mitad», 30 % de utilización).
   Los 9,62 y 83,9 GiB de V4 no figuran en el blog de Hugging Face (las cifras 27 % y 10 % sí).
3. Simulador HTML «KV Cache & Prefill vs Decode»: **Integrar, corregido**. Era la idea que se había propuesto, con defectos graves
   (ver abajo).

## Cambio en el manual

- **§5.7d**: párrafo de enlace y simulador nuevo, después del apartado «El techo cuantitativo: intensidad aritmética y el punto de
  equilibrio» y antes del recuadro «overhead-bound». Fuente editable en `taller/widget_kv_prefill_decode.html`. El `<iframe>` ajusta
  su altura al contenido (mismo origen) y arranca en 1250 px.

## Defectos del simulador original, corregidos

- Textos invertidos (decía «latencia por token alta» en prefill y «pequeña» en decode; sus cifras daban 0,4 ms y 70 ms).
- Gráfico «throughput frente a longitud de prompt» contaba los tokens del prompt como throughput: se sustituyó por TTFT frente al
  prompt e ITL frente al contexto.
- Capas y cabezas escaladas con una raíz cuadrada (el 7B salía con 12 capas y unos 60 KB por token, frente a las 32 capas y 512 KiB
  reales): ahora presets con las arquitecturas publicadas y un modo personalizado.
- Sin GQA: se añadió el número de cabezas K/V (Llama-3-8B: 128 KiB por token frente a 512 KiB con MHA).
- Configuración imposible por defecto (70B FP16 en una sola GPU de 80 GB) y memoria sin descontar los pesos: ahora hay número de
  GPU, aviso de «no cabe» y capacidad libre tras los pesos.
- Etiquetas de cuello de botella escritas a mano: ahora se calculan (máximo entre tiempo de cómputo y de memoria), junto con la
  intensidad aritmética y el punto de equilibrio.
- Prefill animado token a token: ahora aparece como un único bloque paralelo.
- GiB etiquetado como GB: ahora GB decimales (7B en FP16 = 14 GB, como en el resto del manual) y KiB explícitos para la caché por token.
- Eficiencias del 100 % del pico: ahora ajustables (por defecto 50 % de cómputo y 80 % de ancho de banda) y avisadas como supuestos.

## Verificado

- Arquitecturas contra los `config.json` publicados (mirrors de Hugging Face de NousResearch): Llama-2-7B 32 capas, 32 cabezas, 32 K/V,
  hidden 4096; Llama-3-8B 32/32/8, vocab 128.256; Llama-3-70B 80/64/8, hidden 8192. Parámetros recalculados desde la configuración:
  6,74B, 8,03B y 70,55B. No se obtuvo el config de Llama-3.1-405B y por eso no hay preset.
- Hardware contra NVIDIA: H100 SXM 80 GB, 3,35 TB/s y 1.979 TFLOPS con sparsity (989 densos); A100 80 GB, 2.039 GB/s (312 TFLOPS
  BF16 densos, tomados de la ficha PCIe de 80 GB al no figurar para SXM); RTX 4090, 24 GB, 1.008 GB/s y 165,2 TFLOPS FP16 densos
  (fuente secundaria, sin precisar si acumula en FP16 o FP32).
- Cálculo independiente en Node frente al DOM: caché por token, caché total, pesos, TTFT e ITL coinciden en tres configuraciones
  (Llama-3-8B en A100; Llama-3-70B en 4 A100; Llama-2-7B INT4 en RTX 4090 con batch 8 y prompt de 8.192). Sin errores de JavaScript.
- v117 archivado íntegro en `archivo/Comprender_la_IA_2026_v117.html` (md5 `9f6d27735355face970054b34c0a0c88`, idéntico al original).
- Balance de etiquetas: div 5283→5285, p 1581→1582, iframe 15→16; span y a sin desbalance; 31.711 → 32.096 líneas.

## No hecho / a tener en cuenta

- Modelo de primer orden: sin sobrecostes de kernels, comunicación entre GPU (paralelismo ideal), paginación ni FlashAttention.
- El contexto entrenado de los presets (4.096 y 8.192) solo genera un aviso; no limita el cálculo.
- Tema claro fijo, sin modo oscuro; en pantallas estrechas el contenido es largo (el marco crece al contenido).
- Las cifras de eficiencia por defecto (50 % y 80 %) son supuestos ilustrativos sin fuente; el simulador lo dice.
- Commit local; sin push.
