# Revisión jurídica — AI Act en «Comprender la IA» (§16.2–16.4)

Fecha: 23/10/2026 · Versión del manual: v129

Se pide a un jurista que marque como correcta, matizable o incorrecta cada una de las 24 afirmaciones sobre el Reglamento (UE) 2024/1689 de la tabla, y que cite el artículo o la fuente que lo respalda.

## Contexto

«Comprender la IA» es un manual de formación técnica sobre IA, de un autor individual, publicado como un único documento HTML (edición 2026). Su capítulo 16 resume el AI Act para equipos técnicos. En octubre de 2026 el autor reescribió §16.2–16.4 a partir del texto del Reglamento (arts. 2, 3 y 25), porque la versión anterior decía que quien construye sobre una API de un modelo ajeno es «el deployer» y que los laboratorios son «proveedores de la capa base». Esa reescritura **no ha sido revisada por ningún jurista**; el manual la presenta como orientación y remite a asesoría legal.

Lo que se busca no es un dictamen sobre un caso, sino saber si el texto, tal como lo leerá un ingeniero o un jefe de proyecto, induce a error.

## Cómo responder

1. En «Veredicto» elige: Correcto, Matizar, Incorrecto o No puedo valorarlo.
2. En «Comentario» escribe la corrección o el matiz, con el artículo, considerando o directriz que lo respalda.
3. Si una afirmación depende de un acto delegado, una directriz o una norma nacional, indícalo.
4. Al final hay seis preguntas abiertas que pesan más que las filas individuales.

Si el tiempo es limitado, las filas 1, 2, 6, 8, 11 y 22 son las de mayor riesgo de error.

## Afirmaciones a revisar

| # | § | Afirmación del manual | Base que cita | Veredicto | Comentario |
| --- | --- | --- | --- | --- | --- |
| 1 | 16.2 | Quien construye una aplicación sobre la API de OpenAI, Anthropic o Google y la pone en marcha con su marca es, en principio, proveedor de esa aplicación, aunque no haya entrenado el modelo. | art. 3.3 |  |  |
| 2 | 16.2 | «Poner en servicio» incluye el uso propio: una empresa que construye un sistema solo para uso interno también es proveedora. | arts. 3.3, 3.11 |  |  |
| 3 | 16.2 | Deployer es quien usa, bajo su autoridad y en contexto profesional, un sistema desarrollado por otro; sus obligaciones son las de uso. | arts. 3.4, 26 |  |  |
| 4 | 16.2 | Quien construye el sistema y además lo usa es proveedor y deployer a la vez. | arts. 3.3, 3.4 |  |  |
| 5 | 16.2 | El proveedor del modelo de propósito general (OpenAI, Anthropic, Google) tiene obligaciones propias, debe dar información al integrador y no asume las del sistema que construye otro. | arts. 53–55 |  |  |
| 6 | 16.2 | Cambio de rol: poner nombre o marca a un sistema de alto riesgo ya en el mercado, modificarlo sustancialmente o cambiar su finalidad hasta hacerlo de alto riesgo convierte en proveedor, y el proveedor original debe cooperar. | art. 25.1 |  |  |
| 7 | 16.2 | La persona afectada por un sistema de alto riesgo tiene derecho a ser informada y a pedir una explicación de la decisión. | El manual no cita artículo (¿art. 86?) |  |  |
| 8 | 16.2 | Quien usa un modelo vía API para un sistema que decide sobre personas (selección, scoring, moderación) suele ser proveedor de ese sistema; las obligaciones de alto riesgo recaen sobre él y no sobre el proveedor del modelo. | arts. 3.3, 16, 25 |  |  |
| 9 | 16.2 | Test rápido: desarrollo propio con marca propia → proveedor; uso profesional bajo tu autoridad → deployer; marca ajena, modificación sustancial o cambio de finalidad → proveedor. | arts. 3, 25 |  |  |
| 10 | 16.3 | Diseño y conformidad (riesgos, documentación técnica, evaluación de conformidad, registro) corresponden al proveedor; uso (supervisión humana en la operación, logs, información a afectados) al deployer. | arts. 16, 26 |  |  |
| 11 | 16.3 | Las obligaciones completas del Anexo III se aplican desde el 2/12/2027 según el Digital Omnibus (Reglamento 2026/1744); las del Anexo I, desde el 2/8/2028. | Reglamento 2026/1744 |  |  |
| 12 | 16.3 | Los logs se conservan al menos 6 meses e incluyen inputs, outputs y metadatos de sistema. | arts. 12, 19, 26.6 |  |  |
| 13 | 16.3 | Para la mayoría de sistemas de alto riesgo basta la autoevaluación de conformidad y el registro en la base de datos de la UE antes del despliegue. | arts. 43, 49, Anexo VI |  |  |
| 14 | 16.3 | La alfabetización en IA es obligatoria desde febrero de 2025. | art. 4 |  |  |
| 15 | 16.3 | La documentación técnica incluye descripción del sistema, datos de entrenamiento (si aplica), arquitectura, capacidades y limitaciones, y métricas. | art. 11, Anexo IV |  |  |
| 16 | 16.3 | El sistema de gestión de riesgos debe actualizarse durante toda la vida útil del sistema. | art. 9 |  |  |
| 17 | 16.3 | La supervisión humana no basta con que exista: debe ser efectiva y estar documentada. | art. 14 |  |  |
| 18 | 16.3 | Hay que informar a los afectados de que un sistema de IA ha intervenido en la decisión y de su derecho a solicitar revisión humana. | arts. 26.11, 86 (¿RGPD art. 22?) |  |  |
| 19 | 16.4 | Modelos como GPT-4, Claude o Gemini son GPAI; sus obligaciones (documentación e información a integradores, política de copyright, resumen público de datos de entrenamiento) entraron en vigor en agosto de 2025. | arts. 51, 53, 113 |  |  |
| 20 | 16.4 | Quien construye sobre un modelo base no hereda las obligaciones de los arts. 53–55, pero sí las del sistema del que es proveedor (y deployer, si lo usa). | arts. 53–55, 16 |  |  |
| 21 | 16.4 | El proveedor del modelo debe dar la información necesaria (art. 53.1.b); conviene pedirla por contrato, y el art. 25.4 exige acuerdo escrito con quien suministre componentes de un sistema de alto riesgo. | arts. 53.1.b, 25.4 |  |  |
| 22 | 16.4 | Con un fine-tuning significativo hay que consultar si se pasa a ser proveedor del modelo modificado. | art. 3.3; directrices GPAI de la Comisión |  |  |
| 23 | §4 y §16 (v124) | El ámbito territorial se rige por el art. 2 (sistema en la UE o resultado usado en la UE), con criterio distinto al del RGPD. | art. 2 |  |  |
| 24 | §4 y §16 (v124) | En datos y sesgo: el proveedor tiene deberes sobre los datos de entrenamiento y el deployer sobre los datos de entrada que controla. | arts. 10, 26.4 |  |  |

## Preguntas abiertas

1. Una empresa construye un asistente sobre una API y lo usa solo con sus empleados. ¿Es proveedora, deployer o ambas? ¿Cambia algo si es un piloto?
2. ¿Dónde pondrías la frontera entre uso interno de una herramienta de terceros (deployer) y «puesta en servicio» de un sistema propio?
3. ¿Están vigentes y sin cambios las fechas del Digital Omnibus que cita el manual?
4. ¿Qué umbral de fine-tuning convierte a quien adapta un modelo en proveedor de modelo GPAI?
5. ¿Debería el manual mencionar la vía de exclusión del art. 6.3 para sistemas del Anexo III que no sean de alto riesgo?
6. ¿El aviso «valida con asesoría legal» es suficiente, o algún punto necesita un texto más prudente?
