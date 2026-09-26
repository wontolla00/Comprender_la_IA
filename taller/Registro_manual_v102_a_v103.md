# Registro de cambios · v102 → v103

*22 de septiembre de 2026.*

Origen: antes de publicar un comentario de LinkedIn basado en §14.2b, se pidió una lectura
imparcial del borrador. La cita a Skitka et al. (1999) que sostenía el argumento —y que ya
estaba en el manual desde antes de v102— resultó ser una inversión del hallazgo real. Corrección
de una afirmación empírica incorrecta, no un ajuste editorial.

## Verificación previa

- Afirmación original en el manual: *"En los experimentos de Skitka et al. (1999), decir a los
  operadores 'tú eres el responsable final' no redujo los errores de omisión."*
- Contrastada contra tres fuentes independientes:
  - Resumen de ScienceDirect de **Skitka & Mosier, "Accountability and automation bias"**
    (*International Journal of Human-Computer Studies*, 1999): *"Making participants accountable
    for either overall performance or decision accuracy successfully lowered automation bias
    rates."*
  - Síntesis de Wikipedia (artículo *Automation bias*): *"making individuals accountable for
    their performance or the accuracy of their decisions reduced automation bias"*.
  - Cummings, *"Automation and Accountability in Decision Support System Interface Design"*
    (*Journal of Technology Studies*, v32n1), que revisa **Skitka, Mosier y Burdick (2000)**
    directamente: *"increased social accountability lead to fewer instances of automation bias
    through decreased errors of omission and commission"* — y precisa cómo se operacionalizó: no
    una declaración verbal, sino exigir a los participantes **justificar su estrategia y su
    resultado** en la tarea de simulación de vuelo.
- Las tres fuentes coinciden: la responsabilidad (accountability) manipulada por Skitka et al.
  **sí redujo** los errores de omisión y comisión. La afirmación del manual decía exactamente lo
  contrario.
- No se pudo acceder al paper primario completo (ScienceDirect/ACM bloquean el texto completo sin
  suscripción; ResearchGate devolvió error 429; Academia.edu bloqueado por robots.txt) — la
  verificación se apoya en tres resúmenes secundarios independientes y convergentes, no en el
  texto original. Queda como límite declarado de esta corrección.

## Cambios

1. **Recuadro "📐 El mecanismo con nombre: sesgo de automatización"** (antes de §14.2b): la
   segunda viñeta reescrita. Ya no afirma que declarar responsabilidad no tuvo efecto; afirma lo
   que las fuentes sostienen — que Skitka, Mosier y Burdick (2000) sí encontraron reducción de
   errores, y que la manipulación fue exigir justificación del proceso, no una etiqueta verbal de
   responsable. La conclusión de diseño (que importa la responsabilidad *verificable*, no solo
   declarada) se mantiene, porque sigue siendo lo que distingue "declarar sin exigir justificación"
   de "declarar exigiendo justificación" — pero ya no se apoya en un hallazgo inventado de "cero
   efecto".
2. **`<title>` y badge**: `v102` → `v103`.
3. **`Fase_0_Onboarding.html`**: 11 enlaces/menciones reapuntados a v103.

## Lo que no se cambió, a propósito

- El recuadro de advertencia posterior ("⚠️ Por qué 'clarificar responsabilidades' no basta"), que
  habla de una *política* que declara un responsable sin verificación — eso sigue siendo
  consistente con el hallazgo corregido: una etiqueta sin exigencia de justificación real es
  precisamente la condición que las fuentes no muestran que funcione. No necesitaba tocarse.
- La matriz Delegar/Supervisar/Retomar/Responder y el argumento de causación de agente: no
  dependían de esta cita.
- La nota de convergencia con el hilo de LinkedIn añadida en v102: sigue siendo válida, es
  independiente de esta corrección.

## Verificación

- v103 generado desde v102 en binario. CRLF sin cambio (31.138 → 31.138): la sustitución de texto
  no añade saltos de línea nuevos.
- Comparación estructural: `<div>` 5.232 → 5.232; `<em>` 571 → 571 (incluso número de etiquetas
  `<em>` igual, pese a reescribir el párrafo); `<style>` 24 → 24; `<h2>` 257 → 257; ids 946 → 946
  sin duplicados.
- v102 archivado en `archivo/`.

## Alcance

Corrección de una cita empírica invertida en un párrafo de §14.2b. Es la primera vez en el
historial de este manual que una revisión detecta y corrige una afirmación empírica incorrecta,
no una mejora de redacción o de accesibilidad — se registra con ese peso.
