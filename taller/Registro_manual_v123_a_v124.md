# Registro v123 → v124 (23/10/2026)

## Qué se corrigió
Proveedor / deployer del AI Act, punto 1 de los pendientes de `Registro_manual_v122_a_v123.md`, más dos arrastres del mismo capítulo (frase «antes de agosto de 2026» en §16.3 y alcance territorial).

## Base legal consultada (texto del Reglamento (UE) 2024/1689, 23/10/2026)
- Art. 3.3 **proveedor**: desarrolla un sistema de IA o un modelo GPAI, o lo hace desarrollar, y lo comercializa o **pone en servicio con su nombre o marca**, de pago o gratuito.
- Art. 3.11 **puesta en servicio**: suministro de un sistema de IA para primer uso al deployer **o para uso propio** en la Unión, para su finalidad prevista.
- Art. 3.4 **deployer**: usa un sistema de IA **bajo su autoridad** (salvo uso personal no profesional).
- Art. 25.1: un deployer o tercero pasa a ser proveedor de un sistema de alto riesgo si le pone su nombre o marca, lo modifica sustancialmente o cambia su propósito previsto hasta hacerlo de alto riesgo (incluido modificar un sistema GPAI no clasificado de alto riesgo). 25.2: el proveedor original deja de serlo de ese sistema pero debe cooperar. 25.4: acuerdo escrito con quien suministre herramientas, componentes o procesos de un sistema de alto riesgo.
- Art. 2.1: ámbito (proveedores que comercializan o ponen en servicio en la UE, aunque estén fuera; deployers establecidos en la UE; proveedores y deployers de terceros países cuando el resultado se usa en la UE; importadores, distribuidores, fabricantes de producto, representantes autorizados, personas afectadas en la UE). 2.7: el RGPD no se ve afectado.
- Arts. 26 (obligaciones del deployer; 26.4 datos de entrada; 26.6 logs ≥ 6 meses), 27 (evaluación de impacto en derechos fundamentales, en algunos casos), 53–55 (proveedores de modelos GPAI).
- Fuente: texto del Reglamento en artificialintelligenceact.eu (art. 2, 3 y 25), leído el 23/10/2026. El texto consolidado con el Omnibus (Reglamento 2026/1744) no se cotejó artículo por artículo; la nota de esa página sobre la aplicación de los arts. de alto riesgo desde el 2/12/2027 (Anexo III) y el 2/08/2028 (Anexo I) coincide con la tabla del §4.

## Criterio aplicado
- El rol se decide por sistema y por lo que se hace con él, no por usar una API.
- Quien construye una aplicación con un LLM y la pone en marcha con su nombre → proveedor de esa aplicación (y deployer si la usa). Quien usa una herramienta ya hecha sin cambiarla → deployer.
- Los labs responden de su modelo (arts. 53–55) y deben dar información al proveedor del sistema; no asumen las obligaciones del sistema.
- «Co-proveedor» no es una figura del AI Act: se sustituye por «cambio de rol (art. 25)».
- El manual conserva el aviso «calificación dependiente del caso; revisión jurídica». Sigue siendo recomendable que un jurista valide §16.2 antes de distribuir.

## Pendientes tras v124
- Revisión jurídica externa de §16.2–§16.4 y del clasificador.
- RAFT/CLIP/GPT-4V en §5.2b; atención causal en glosario y Cap. 0; Cap. 22 y Apéndice A (fuentes primarias); IDs OWASP LLM04–10; notebooks 05 y 06; experimento de convergencia multi-sistema (§20.1); «70 %» del resumen del Cap. 15.
