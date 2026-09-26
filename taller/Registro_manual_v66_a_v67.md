# Registro de cambios · v66 → v67

*Agosto 2026.*

Un cambio, en §20.3 (Cap. 20, delegación cognitiva). Procede del triaje de
fuentes externas (`taller/Triaje_fuentes_externas_2026.md`, entrada
2026-08-19, "I hate what AI is doing to the minds and happiness of the
young", Katherine Rundell, *The Guardian*) y de un cruce con el corpus
literario del proyecto (`Trilogia/Obra completa/10_epigenetica`,
*Tres domesticaciones*), documentado en la nota-puente
`10_epigenetica/Rundell_y_las_tres_domesticaciones_nota_puente.md`.

---

## §20.3b — Un ejemplo con fecha, y el filo irregular del que el ejemplo no habla (nuevo, Cap. 20)

**Qué faltaba.** El recuadro de advertencia de §20.3 sobre el estudio
Kosmyna et al. (preprint, n=54, sin réplica) es una cautela sobre cómo se
cita mal ese estudio. No tenía un ejemplo real y fechado de esa mala
cita ocurriendo — y sin él, la advertencia se lee como precaución
abstracta.

**Qué añade.**

- Un ejemplo verificable: Rundell (*The Guardian*, 8 ago. 2026) cita el
  mismo estudio como hallazgo asentado, sin mencionar tamaño de muestra ni
  estatuto de preprint — exactamente el patrón que §20.3 advierte que no
  se haga. Fuente de calidad, autora con autoridad real, publicada 18 días
  antes de esta revisión: no es un caso marginal elegido para ganar el
  argumento.
- Una complicación real a un argumento del mismo ensayo: Rundell sostiene
  que restringir el acceso a la IA protege sobre todo a quien menos tiene.
  Dell'Acqua et al. (HBS WP 24-013, 2023) — 758 consultores de BCG, con y
  sin GPT-4, dieciocho tareas — encuentran el «filo irregular»: dentro del
  rango de competencia del modelo la mejora es mayor para quien partía
  peor; fuera de ese rango, los usuarios de IA rinden un 19% peor que sin
  ella. La dirección del efecto depende de un límite que el usuario no ve,
  no de cuánta protección regulatoria recibe.
- Una advertencia reflexiva: cualquier defensa de la fricción cognitiva o
  la diversidad epistémica —incluida la de este mismo capítulo— la hace
  casi siempre alguien que ya tiene voz para hacerlo. Se nombra en vez de
  ignorarse.
- Puntero de salida: `Tres domesticaciones` (agosto 2026, corpus literario
  del proyecto, fuera del manual) desarrolla el contraste completo,
  incluida la identificación probable del estudio de "10 minutos" que
  Rundell cita sin referencia completa (candidato: *Cognitive Offloading
  and the Speedup Illusion in Human–AI Interaction*, 2026, arXiv:2605.23177
  — identificación no confirmada por el autor original, señalada como
  probable en la nota-puente).

**Por qué en §20.3 y no en un capítulo nuevo.** El hallazgo no es una
proposición nueva: es refuerzo de una advertencia que el capítulo ya hacía,
más una complicación empírica (Dell'Acqua et al.) que faltaba en la
discusión de a quién beneficia o perjudica la delegación. Ninguna cifra
propia del laboratorio HyperRAG interviene aquí — a diferencia de v66, este
cambio no depende de `docs/ARRANQUE.md` ni de ninguna medición de ese
proyecto.

---

## Verificación

- Tamaño: 2.298.688 → 2.302.026 caracteres (+3.338).
- Balance de `div`: 4672/4672 → 4673/4673 (+1, el callout nuevo).
- Título y barra superior actualizados a v67 en el fichero vivo; snapshot
  de v66 archivado en `archivo/Comprender_la_IA_2026_v66.html`,
  verificado byte a byte idéntico al v66 original antes de revertir en él
  los tres cambios de esta edición (título, barra superior, bloque
  §20.3b) — no es una copia del v67, es el v66 real reconstruido.
- Sin verificación de enlaces internos rotos ni de `id` duplicados con
  herramienta (`lxml`) por no disponer de ella en este entorno de edición;
  el `id="s203b"` introducido no colisiona con ningún otro `id` visible en
  una búsqueda de texto sobre el fichero.

## Alcance

La cifra del 19% (Dell'Acqua et al.) y la del 25% son del estudio citado,
no medidas por este proyecto. El texto las presenta como tales. La
identificación del estudio de "10 minutos" de Rundell con
arXiv:2605.23177 es una hipótesis razonable de la nota-puente, no una
confirmación — así se declara en el propio texto insertado.
