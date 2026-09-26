# Registro de cambios · v106 → v107

*23 de septiembre de 2026.*

Origen: no un post externo nuevo, sino una auditoría cruzada del propio manual — un análisis de
ChatGPT sobre `Comprender_la_IA_2026_v106.html`, revisado por Claude contra el archivo real en dos
rondas (verificación de las citas de ChatGPT, después verificación de su autocorrección tras leer
la respuesta de Claude). De las dos retiradas y tres hallazgos nuevos que propuso ChatGPT en su
segunda ronda, solo uno sobrevivió la comprobación directa contra el HTML: el resto, o bien tenía
matiz inmediato ya presente en el texto (alucinaciones, Chain-of-Thought), o bien era una objeción
razonable pero menor sin acción clara (`>99% de consistencia`, "aprende el criterio").

## Cambio (único, pequeño)

**Hallazgo**: §8.4c ("Few-shot como técnica de calibración cultural y de dominio") presenta un
umbral operativo con tres cifras de precisión aparente — *"el fine-tuning pasa a ser pertinente
cuando el few-shot no supera el 85% de precisión... y se dispone de más de 1.000 ejemplos... —
típicamente entre 9 y 12 meses tras el lanzamiento"* — sin el mismo aviso de trazabilidad que el
manual sí aplica en un sitio hermano: §0.4.2/§0.4.6.3 retiraron explícitamente un rango de
mitigación de alucinaciones ("60-90%") por carecer de fuente, dejando por escrito la norma
("orden relativo declarado por el autor, no métrica empírica validada"). §8.4c no seguía esa
misma disciplina — el manual se la aplicaba a sí mismo en un lugar y no en el otro.

1. **Un párrafo nuevo** (`<p style="font-size:.85rem;color:var(--muted);font-style:italic;">`),
   insertado inmediatamente después de la frase del umbral, antes del `<h2>` de 8.4d — mismo
   patrón visual que el aviso de §0.4.2. Aclara que 85%/1.000/9-12 meses son un orden de magnitud
   ilustrativo, no un umbral validado, y que el punto de cruce real depende de criticidad, coste
   de error, calidad del corpus y capacidad del modelo base. Remite explícitamente a §0.4.2 como
   el mismo estándar ya aplicado allí.
2. **No se tocó la frase original** — la corrección es aditiva (aviso al lado), no una reescritura
   de la cifra. Las cifras siguen siendo un punto de partida razonable; lo que faltaba era la
   etiqueta de heurística, no borrarlas.
3. `<title>` y badge: `v106` → `v107`.
4. `Fase_0_Onboarding.html`: 10 referencias reapuntadas a v107.

## Lo que no se cambió, a propósito

- Los otros dos hallazgos nuevos de la segunda ronda de ChatGPT (`>99% de consistencia` en §8.5,
  "aprende el criterio, no solo la categoría" en §8.4c) — verificados como reales pero de menor
  peso: el primero es plausible técnicamente y solo le falta trazabilidad de fuente, no de fondo;
  el segundo es lenguaje dentro de una comparativa ilustrativa concreta, no una tesis mecanicista
  general sobre representación interna. No se consideraron huecos con acción clara.
- Las dos retiradas de ChatGPT (alucinaciones como afirmación absoluta, CoT como "regla que se
  corrige después") se confirmaron como objeciones sin fundamento tras comprobar el contexto
  inmediato del HTML — no había nada que corregir ahí, y no se tocó.

## Verificación

- v106 archivado íntegro en `archivo/`.
- Balance estructural: `<div>`/`</div>` 5259→5259 (sin cambio, no se añadió ningún div). `<p
  style=...>` (con atributos) 420→421 (+1), `</p>` 1551→1552 (+1), balanceados. `<h2>` sin cambio
  (258 — es un párrafo, no una sección). Sin ids duplicados (`s84c`/`s84d` verificados).
- 31.257 → 31.258 líneas (+1).

## Alcance

El cambio más pequeño de esta ronda de correcciones — una frase de aviso, no una reescritura ni
una sección nueva. Cierra una inconsistencia real de disciplina interna (el manual no se aplicaba
su propio estándar de no-sobreclaim en un punto concreto), detectada solo porque se comprobó la
crítica externa contra el archivo real en vez de aceptarla o descartarla de oído.
