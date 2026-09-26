# Registro de cambios · v95 → v96

*Septiembre 2026.*

Origen: ensayo de Dario Amodei, "We Must Pace the Frontier" (darioamodei.com, 12 sep. 2026), cruzado con el incidente OpenAI/Hugging Face ya documentado en §10.10.4.

## Verificación previa

- **Ensayo verificado como real**: publicado el 12 sep. 2026 en la web personal de Amodei. Confirmado el compromiso unilateral de Anthropic de dar a un equipo evaluador externo (p. ej. METR) acceso permanente de tipo empleado, con derecho a publicar hallazgos sin control editorial de la empresa (salvo redacciones acotadas por ley/contrato/confidencialidad de terceros). Confirmado que Sam Altman (OpenAI) respaldó la propuesta públicamente horas después.
- **Nada nuevo sobre el incidente en sí**: §10.10.4 ya documentaba el caso OAI-HF con más precisión que el propio ensayo (1.200 agentes, 70.000 mensajes, ~700 en el ataque, tres fuentes cruzadas). Lo único genuinamente nuevo es la respuesta institucional posterior al incidente, no el incidente.
- Sin conexión con HyperRAG/Empreinte a nivel de código — es gobernanza de laboratorios de frontera, no ingeniería propia.

## Cambio

**Añadido un `callout` al final de §10.10.4**, justo después de la nota de alcance existente ("el incidente tiene semanas, no años..."). No se tocó la explicación técnica del incidente, ya completa — se añadió el desarrollo posterior: el ensayo de Amodei, el compromiso unilateral de Anthropic con evaluadores embebidos, y el respaldo público de Altman. Marcado explícitamente como "desarrollo a vigilar, no estándar ya vigente" — sigue sin implementarse fuera de Anthropic a fecha de esta edición.

## Verificación

- Falta de proceso corregida en vivo: la edición se hizo primero sobre v95 sin archivar antes (mismo tipo de fallo ya documentado una vez en `Registro_manual_v77_a_v78.md`) — corregido reconstruyendo `archivo/Comprender_la_IA_2026_v95.html` (revirtiendo el bloque añadido) antes de fijar v96 como vigente.
- Comparación `archivo/Comprender_la_IA_2026_v95.html` vs. `Comprender_la_IA_2026_v96.html`: 0 avisos de `html.parser` en ambas, `id` 946 → 946 (sin cambio, el callout no lleva ancla propia), enlaces internos 724 → 724 (sin cambio), 1 enlace roto preexistente en ambas versiones (no introducido por este cambio), líneas 31.098 → 31.102 (+4).
- `<title>` y badge de topbar actualizados a v96.

## Alcance

Cambio mínimo: un párrafo de seguimiento sobre un desarrollo posterior al incidente ya documentado, sin id nuevo, sin renumeración, sin alterar la explicación técnica existente.
