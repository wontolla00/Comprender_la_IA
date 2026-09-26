# Registro de cambios · v93 → v94

*Septiembre 2026.*

Origen: "Cuatro meses midiendo un SDLC gobernado por IA: cuatro cosas que creía saber y no eran" (LinkedIn, autor de un framework propietario de un solo desarrollador, "Myrmion AI Factory", sep. 2026).

## Verificación previa

- **"Myrmion AI Factory" no es un proyecto público verificable** — sin repositorio, sin cobertura independiente, búsqueda web sin resultados relacionados. Tratado con el mismo criterio que el caso del robot VLA (§10.4c, ronda anterior de revisión): se recoge el **patrón de fallo**, no las cifras (2.088 ejecuciones, 8M de caracteres, ratio 1,8→11,1) como confirmadas. Marcado explícitamente así en el texto (`callout-normativo`).
- **El patrón de fondo sí es real y ya vive en el manual**: §13.15 "El arnés que miente" documenta la misma forma —"el número sobrevive; la condición que lo produjo, no"— en tres dominios (caché de evaluación, componente no declarado, `assert` que valida su propia declaración), ya extendida una vez a un cuarto dominio ajeno a RAG (§13.15.1, ingesta OCR de Die Zeit). El post aporta un **quinto dominio genuino**: gobernanza de un pipeline agéntico de codificación, donde lo que sobrevive sin su condición no es una métrica sino un *reporte de éxito*.
- **Hueco real en contenido ya escrito esta misma ronda**: §10.9.8 (Skills, sección nueva de v92→v93) describe la divulgación progresiva (índice siempre cargado, contenido completo bajo demanda) sin señalar que el paso de carga puede fallar en silencio — exactamente el fallo que este post describe ("el índice llegaba, lo que el índice referenciaba no").

## Cambios

1. **§13.15.4 nueva** ("Un quinto lugar: el hook de gobernanza que informa de éxito sin entregar nada"), tras §13.15.3, antes de §13.16. Describe el patrón (informe de éxito sin verificar entrega real) como variante del Caso 3 de la misma sección (validación decorativa), conecta explícitamente con §10.9.8 (divulgación progresiva) y con §10.10.2/§10.10.3 (tinta y cemento) para la generalización "ata el control a la ruta de escritura, no a la identidad de la herramienta". TOC actualizado.
2. **Aviso nuevo en §10.9.8**: un párrafo (`warning`) señalando que el paso "se carga cuando se activa" de la divulgación progresiva puede fallar sin señal visible, con referencia cruzada a §13.15.4.

## Verificación

- Parseo HTML completo (`html.parser` contra `archivo/Comprender_la_IA_2026_v93.html`): 0 avisos de anidamiento, 0 etiquetas sin cerrar, en ambas versiones.
- `id`: 945 → 946 (+1, `s13154`). Sin duplicados.
- Enlaces internos: 723 → 724 (+1, la entrada de TOC nueva). Cero rotos nuevos.
- Líneas: 31.076 → 31.094 (+18).
- Snapshot de v93 archivado antes de editar: `archivo/Comprender_la_IA_2026_v93.html`.
- `<title>` y badge actualizados a v94; archivo renombrado a `Comprender_la_IA_2026_v94.html`.

## Alcance

Cambio pequeño y localizado: una subsección nueva de prosa (sin pseudocódigo) sobre un patrón ya establecido en el capítulo, más un aviso de dos frases en contenido de la ronda anterior. Sin renumeración de secciones existentes. Sin cambios en HyperRAG ni Empreinte — el origen no tenía pieza de código propia verificable.
