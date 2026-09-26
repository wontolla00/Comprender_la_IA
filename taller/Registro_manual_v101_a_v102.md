# Registro de cambios · v101 → v102

*22 de septiembre de 2026.*

Origen: análisis del hilo de LinkedIn sobre gobernanza de datos/IA (Etzel + comentarios de
Viennet, Budale, Blacksell) — su punto de "decision rights sobre modelos, casos de uso, riesgo
y acciones automatizadas" recuerda de cerca a §14.2b, propuesta original de este manual.

## Verificación previa

- §14.2b "Derechos de decisión: la capa que la supervisión no resuelve" (marcada
  `★ Propuesta del autor`) ya desarrolla, con más rigor y anterioridad, la misma
  idea: la matriz Delegar/Supervisar/Retomar/Responder, el problema de las
  "muchas manos" (Thompson, 1980) y el argumento metafísico sobre causación de
  agente. No es lo mismo que la categorización de Viennet (modelo/caso de
  uso/riesgo/acción) — el manual organiza por *verbo de autoridad* aplicado a
  cada decisión asistida, no por *tipo de objeto* gobernado — pero ambas apuntan
  al mismo hueco organizacional.
- El aviso `.aviso-propuesta` de §14.2b afirma "no tiene adopción externa ni
  literatura de referencia". Esa frase sigue siendo cierta en sentido estricto
  (nadie en el hilo cita este manual ni usa su terminología), pero un hilo de
  práctica reciente converge de forma independiente en el mismo problema — vale
  la pena registrarlo sin tocar la afirmación original.
- Localizado el bloque exacto de §14.2b por posición (no por texto: el aviso
  `.aviso-propuesta` es una plantilla reutilizada en 10 secciones distintas del
  manual — 5.5e, 14.2b y otras —, así que la edición usa offsets, no un
  `replace` global de la cadena de texto).

## Cambios

1. **Nota de convergencia** añadida justo después del aviso de originalidad de
   §14.2b, antes del callout "🧵 Por qué te importa esto": un párrafo breve,
   estilo `.muted`, que registra el hilo de LinkedIn como señal práctica
   independiente, sin citarlo como fuente académica ni cambiar la valoración de
   originalidad.
2. **`<title>` y badge**: `v101` → `v102`.
3. **`Fase_0_Onboarding.html`**: 11 enlaces/menciones reapuntados a v102,
   conservando intacta la mención histórica "Añadidos en v100".

## Lo que no se cambió, a propósito

- Ni una palabra de la matriz Delegar/Supervisar/Retomar/Responder, del
  argumento de causación de agente, ni del resto de §14.2b: es contenido más
  desarrollado que el post de origen y no necesitaba el aporte externo.
- No se tocó la frase "no tiene adopción externa ni literatura de referencia":
  sigue siendo exacta — el hilo no adopta ni cita este marco, solo coincide en
  el problema.
- No se replicó esta nota en las otras 9 secciones que comparten la misma
  plantilla `.aviso-propuesta` (5.5e Erosión de contexto y demás): la
  convergencia detectada es específica de §14.2b.

## Verificación

- v102 generado desde v101 en binario. CRLF 31.138 → 31.138 en el título/badge
  (sin cambio, misma longitud de cadena); +1 con el párrafo nuevo.
- Comparación estructural: `<div>` 5.232 → 5.232 (el párrafo nuevo es un `<p>`
  dentro de un `<div>` existente); `<p>` 1.531 → sin exceso más allá del
  esperado; `<style>` 24 → 24; `<h2>` 257 → 257; ids 946 → 946 sin duplicados;
  0 anclas internas rotas reales.
- v101 archivado en `archivo/`.

## Alcance

Un párrafo de contexto en una sola sección (§14.2b), más dos metadatos de
versión y la sincronización del acompañante. Sin cambios de contenido
argumentativo, estructura ni numeración.
