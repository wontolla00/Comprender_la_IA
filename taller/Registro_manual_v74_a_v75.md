# Registro de cambios · v74 → v75

*Agosto 2026.*

Mismo origen que v73→v74: un post externo (LinkedIn) discutido primero
fuera del manual, verificado contra fuentes primarias antes de
incorporar cualquier cosa. Esta vez el post trataba sobre Roman
Yampolskiy (investigador de seguridad de IA) — riesgo existencial,
inmortalidad vía IA/genómica, IA estrecha vs. general. La mayor parte del
post no aportaba nada verificable que el manual no tuviera ya cubierto
por otra vía (la distinción IA estrecha/general ya vive, con otro
vocabulario, en la distinción complicado/complejo de Cynefin del Cap. 4;
la pregunta sobre backups mentales y continuidad de identidad pertenece a
filosofía de la consciencia, fuera del alcance de este manual — se trató
en otro lugar del corpus, no aquí). Lo que sí aportaba algo verificable y
propio de este manual: las cifras de p(doom) del propio Yampolskiy.

Snapshot de v74 archivado **antes** de editar:
`archivo/Comprender_la_IA_2026_v74.html`, 2.440.060 bytes, copia exacta
del v74 en circulación.

---

## La inserción

### §20.6 — "El conteo sin método": extensión a probabilidad sin método

Insertada como dos párrafos nuevos (`<p>` de cuerpo + `<p>` de fuentes)
dentro del mismo `<div class="callout concept">` que ya contenía el caso
de los cinco evaluadores contando términos, justo después del párrafo
que cierra ese caso ("...Quien no pueda darlas está evaluando el
envoltorio.") y antes del `</div>` de cierre del callout. No se crea un
`<h4>` nuevo ni un patrón nuevo — es una extensión del mismo patrón ya
nombrado, no un cuarto caso.

**Por qué se eligió aquí y no como sección nueva:** el mecanismo que
§20.6 ya describe ("un conteo depende de dos decisiones que casi nunca se
declaran: el ámbito y el criterio de coincidencia... sin declararlas, la
cifra tiene la forma de un dato reproducible y la sustancia de una
impresión") es exactamente el defecto de un `p(doom)` sin metodología
expuesta, con las variables cambiadas (no ámbito+criterio de
coincidencia, sino modelo probabilístico+variables+agregación). Crear una
sección nueva habría duplicado el argumento; extender el párrafo existente
lo generaliza, que es lo que el propio texto ya invitaba a hacer ("al dar
un número... al leer un número ajeno").

**El caso.** Roman Yampolskiy ha dado, en apariciones públicas distintas,
al menos tres cifras diferentes para la misma estimación de probabilidad
de catástrofe existencial por IA: 99,9 %, 99,999 % y 99,999999 %. Ninguna
aparición consultada expone el modelo, las variables o el proceso de
agregación que produce esa precisión. Se cita también la literatura
académica sobre p(doom), que documenta la ausencia de metodología
estandarizada en todo el campo — no es un defecto de un autor, es una
propiedad del género.

**Fuentes:**
[Futurism](https://futurism.com/the-byte/researcher-99-percent-chance-ai-destroy-humankind)
(cobertura de la cifra 99,9 %); [The AI
Insider](https://theaiinsider.tech/2026/07/06/ai-safety-expert-roman-yampolskiy-believes-ai-has-a-99-9-chance-of-wiping-out-humanity/);
[debate público «50% vs. 99,999%
P(Doom)»](https://lironshapira.substack.com/p/debate-with-roman-yampolskiy-50-vs)
(cifra distinta en otra aparición, mismo autor, misma pregunta); [«Why do
Experts Disagree on Existential Risk and P(doom)? A Survey of AI
Experts»](https://arxiv.org/html/2502.14870v1) (arXiv 2502.14870, sobre la
ausencia de metodología estandarizada en el campo).

**Declarado explícitamente como fuera de alcance de esta edición:** la
cifra sobre automatización de la investigación en IA en "menos de 2 años"
atribuida a Yampolskiy en el post original no se pudo verificar contra
ninguna fuente primaria con esa formulación exacta — no se incorpora al
manual ni se cita como confirmada ni como refutada. Se encontraron
declaraciones relacionadas pero no idénticas (AGI para 2027, automatización
casi total del trabajo para 2028-2029), que tampoco se incorporan porque no
son la afirmación que el post atribuye. Misma disciplina que v67 con la
cita de "10 minutos" de Rundell: no rellenar con la fuente más parecida
cuando la exacta no aparece.

**No se toca la afirmación de fondo sobre riesgo existencial.** El
párrafo insertado es explícito en que la crítica es sobre la cifra, no
sobre la preocupación: "esto no invalida la preocupación de fondo... puede
ser legítima con cifra o sin ella". El manual no toma posición sobre
p(doom); toma posición sobre si un número con seis dígitos de precisión
sin método declarado cuenta como medición.

---

## Lo que se dejó fuera, deliberadamente

- **La cifra de "menos de 2 años"** (automatización completa de la
  investigación en IA): no verificable contra fuente primaria exacta, ver
  arriba.
- **La distinción IA estrecha/general y el caso AlphaFold:** no aporta
  nada verificable nuevo al manual — la distinción complicado/complejo ya
  cubre el mismo terreno con más precisión en el Cap. 4 (Cynefin), y
  AlphaFold ya se usa como ejemplo en otras partes del corpus (no de este
  manual). Insertarlo aquí habría sido decoración, no corrección.
- **La pregunta sobre backups mentales, continuidad de identidad y
  consciencia:** filosóficamente rica pero fuera del alcance de un manual
  de arquitectura/gobernanza técnica. Se trabajó por separado, en el lugar
  del corpus donde corresponde por género (filosofía de la consciencia,
  no ingeniería de sistemas) — no en este archivo.

## Verificación

- Balance de etiquetas verificado contra el snapshot pre-edición
  (`archivo/Comprender_la_IA_2026_v74.html`):

  | | v74 (archivado) | v75 | Δ | esperado |
  |---|---|---|---|---|
  | bytes | 2.440.060 | 2.442.611 | +2.551 | — |
  | `h2` | 254 | 254 | 0 | 0 |
  | `h3` | 397 | 397 | 0 | 0 |
  | `table` | 223 | 223 | 0 | 0 |
  | `tr` | 1.283 | 1.283 | 0 | 0 |
  | `div` (abre/cierra) | 4.838 / 4.838 | 4.838 / 4.838 | 0 / 0 | 0 (párrafos dentro de un div existente) |
  | `p` | 1.441 | 1.443 | +2 | +2 (párrafo de cuerpo + párrafo de fuentes) |
  | `span` | 1.538 | 1.539 | +1 | +1 (version-badge del encabezado) |
  | `strong` | 2.202 | 2.203 | +1 | +1 |
  | `em` | 507 | 509 | +2 | +2 |
  | `a` | 396 | 400 | +4 | +4 (cuatro fuentes enlazadas) |
  | `code` | 330 | 330 | 0 | 0 |

  Todas las cifras cuadran exactamente con lo insertado.
- Verificación en navegador (servidor estático local): el texto nuevo
  presente en el DOM renderizado, profundidad de `.container` = 1 en el
  párrafo insertado — sin fuga fuera de la columna de lectura.
- Carpeta principal: se elimina `Comprender_la_IA_2026_v74.html` del
  directorio raíz (queda solo en `archivo/`), permanece
  `Comprender_la_IA_2026_v75.html` como único archivo vivo.
- `<title>` y badge de la topbar actualizados de "v74" a "v75".

## Alcance

Una inserción puntual dentro de una sección ya existente (§20.6);
ninguna sección nueva, ninguna renumeración de patrones, ningún contenido
retirado. No se tocó ningún otro capítulo.
