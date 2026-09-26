# OKF, §4.7/§2.5 de *Comprender la IA* y el monólogo de Damian — nota puente

*(añadida por Claude en diálogo con el autor, sep. 2026)*

## Fuente y cautela epistémica

El post de Gorka Urdampilleta sobre Open Knowledge Format (OKF) / Augury OKF Industrial Profile, ya trabajado en `03_El_Restaurador_de_Huellas/taller/Agota_y_OKF_nota_puente.md` (fuente de segunda mano, no la documentación oficial de Google Cloud/Augury). Esta nota completa esa conexión contra el manual real — §4.7 y §2.5 de `Comprender_la_IA_2026_v103.html`, verificados palabra por palabra, no contra el resumen de la skill.

## La conexión de tres vías

El índice del corpus (`INDICE.md`, 06_Comprender_la_IA) ya señalaba que §4.7 ("el linaje que los pipelines destruyen por higiene") "es el monólogo de Damian en registro de manual" — incluso el título coincide literalmente. Con OKF sumado, la conexión es de tres registros distintos sobre la misma tesis:

- **Novela** (`03_El_Restaurador_de_Huellas`, cap. 2): Damian narra cómo la procedencia se pierde sin que nadie decida borrarla — se "limpia".
- **Manual técnico** (§4.7, "La destrucción por higiene"): *"El riesgo principal para la procedencia no es el borrado malicioso: es tu propio pipeline funcionando correctamente [...] Cada paso es correcto, tiene documentación y pasa la auditoría. La procedencia no se destruye en ningún punto identificable del proceso: simplemente deja de haber un campo donde guardarla. Es el mismo patrón que el borrado por despriorización en recomendación — nadie decide eliminar; la eliminación se acumula en decisiones locales correctas."*
- **Producto real, 2026** (OKF Industrial Profile de Augury): intenta resolver exactamente este problema — convertir conocimiento operativo tácito, que nunca estuvo en ninguna base de datos, en algo explícito, versionado y auditable.

Tres registros — ficción de 2044, manual técnico de 2026, producto comercial de 2026 — describiendo el mismo mecanismo: la desaparición de procedencia no por malicia sino por higiene correctamente ejecutada.

## Un punto donde el manual va más lejos que OKF

§4.7 hace una distinción que la caracterización del post sobre OKF no hace con la misma precisión — el concepto propio del autor, marcado explícitamente como tal:

> *"La procedencia certifica responsabilidad, no veracidad [...] C2PA certifica que un dispositivo determinado firmó un archivo determinado en un momento determinado. Lo que no puede certificar — nunca, por diseño, no por inmadurez del estándar — es que la cámara apuntara a lo que el pie de foto dice [...] Lo que la procedencia entrega [...] es un nombre pegado a una afirmación. Alguien a quien reclamar, auditar o desmentir. Es una infraestructura de responsabilidad, no de verificación."*

OKF, tal como lo describe el post, promete procedencia, verificación, vigencia y atestación como un paquete de "contexto de confianza". El manual separa con bisturí dos cosas que ese paquete tiende a fundir: *quién responde* (procedencia/responsabilidad) y *qué es cierto* (veracidad/verificación). La advertencia explícita del manual — *"los equipos justifican saltarse la validación de contenido porque 'viene con credencial'"* — es precisamente el riesgo que corre cualquier sistema tipo OKF si presenta sus cuatro señales de confianza como un bloque homogéneo en vez de como categorías con garantías distintas.

## §2.5, como contexto de por qué OKF puede funcionar donde la Web Semántica no

§2.5 explica por qué la Web Semántica fracasó y qué cambió: *"La Web Semántica pedía que los humanos subieran al formalismo [...] Lo que ocurrió con los LLM es que la máquina bajó al lenguaje natural."* Esto importa para evaluar OKF con más precisión de la que tenía la nota anterior: OKF no repite el error de la Web Semántica (pedir que el operador humano escriba en RDF/OWL su heurística sobre el sensor a 82°) — su promesa implícita, si sigue el patrón que §2.5 describe, es que un LLM extraiga la estructura (procedencia, condición, vigencia) desde el lenguaje natural del operador, no que el operador suba al formalismo. Si es así, OKF es un caso de aplicación del giro que describe §2.5, no una repetición del proyecto que §2.5 documenta como fracasado — pero esto es inferencia sobre cómo *probablemente* funciona OKF, no algo confirmado contra su documentación técnica real (la cautela ya señalada en la nota original sigue vigente).

## Qué esta nota NO hace

No verifica la documentación técnica real de OKF/Augury — sigue pendiente, como ya advertía la nota anterior. No propone ningún cambio a §4.7 o §2.5, que quedan intactos. No cambia la valoración de `Agota_y_OKF_nota_puente.md` sobre Los Principios de Agota — la complementa desde el ángulo técnico del manual, no la sustituye. No afirma que el equipo de OKF haya leído o conocido `Comprender la IA` ni la novela — es convergencia independiente, no influencia, exactamente como se trató la conexión con Agota.
