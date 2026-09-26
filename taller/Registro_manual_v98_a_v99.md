# Registro de cambios · v98 → v99

*21 de septiembre de 2026.*

Origen: revisión de un documento derivado — una "Fase 0 — Onboarding" generada por
otro asistente a partir del repo `sgevatschnaider/IA-Teoria-Practica`, que reutiliza
los componentes visuales del manual. Al comparar su CSS con el del manual aparecieron
cinco variables usadas y nunca definidas. La hipótesis inicial (el derivado copió
componentes sin los tokens) resultó ser la inversa: **los copió fielmente, incluido el
fallo, que estaba en el manual**.

## Verificación previa

- **Variables indefinidas en v98**: `--surface2`, `--border2`, `--accent2`, `--mono`,
  `--ff-mono`. Detectadas comparando el conjunto de `--x:` declaradas contra el de
  `var(--x)` usadas en los 24 bloques `<style>`.
- **Impacto real, medido uso por uso** — no todas duelen igual:
  - `--ff-mono`: 2 usos, **ambos con respaldo** (`var(--ff-mono,ui-monospace,monospace)`).
    Sin efecto visible. Se define igualmente por coherencia.
  - `--surface2`, `--border2`, `--mono`: 1 uso cada una, sin respaldo, todas en `.qa-box`.
  - `--accent2`: 3 usos sin respaldo (`.qa-box`, `.qa-label`, `.qa-coda`).
- **Alcance**: 3 instancias de `.qa-box` ("El arquitecto pregunta"). `.badge-propuesta`
  (45 instancias) **no** está afectado — usa colores literales; se descartó tras
  comprobar la regla.
- **Mecanismo**: una `var()` sin valor ni respaldo invalida la declaración entera en
  tiempo de cálculo. `background` cae a transparente; `border` y `border-left`
  pierden el estilo y no se pintan.
- **Solo en modo claro**: `body.dark .qa-box { background:#1a1a2e; border-color:#3a3a60 }`
  usa literales, así que en oscuro nunca se vio el fallo. Ahí estuvo escondido.
- **Antigüedad**: recorridas las 45 versiones de `archivo/`. Presente desde la **v53**;
  `--ff-mono` se suma en la **v58**.

## Cambios

1. **`:root`**, tras `--slate`: cinco tokens nuevos con comentario de origen.
   `--surface2:#f5f3ff`, `--border2:#ddd6fe`, `--accent2:#4f46e5`, `--mono` y
   `--ff-mono` con la pila `'IBM Plex Mono','Space Mono',ui-monospace,…`.
2. **`body.dark`**, tras `--pink-light`: `--surface2:#1a1a2e`, `--border2:#3a3a60`
   (los mismos literales que ya usaba la regla oscura, ahora como tokens) y
   `--accent2:#a5b4fc`, más claro para que la etiqueta se lea sobre fondo oscuro.
3. `<title>` y badge de la barra superior: v98 → v99.

Valores elegidos dentro de la paleta existente: `#4f46e5` es el mismo índigo que ya
usaba `.qa-box .qa-a table th`; `#f5f3ff` y `#ddd6fe` son su familia clara.

## Lo que no se cambió, a propósito

- Ni una línea de contenido. La comparación estructural da +11 líneas, todas de CSS.
- No se tocaron las reglas de `.qa-box`: el fallo era la ausencia de los tokens, no
  las reglas, que estaban bien escritas desde la v53.
- No se tocó `body.dark .qa-box`: el modo oscuro se veía correcto y sigue idéntico.

## Verificación

- **Proceso**: v99 generado desde v98 leyendo y escribiendo **en binario** para no
  alterar los finales de línea. Un primer intento con `read_text`/`write_text`
  convirtió 31.122 CRLF en LF y dejó el fichero 30 KB más pequeño; se descartó.
  CRLF confirmados: 31.122 → 31.133 (+11, las líneas añadidas).
- **Comparación estructural** (v98 archivado frente a v99 vigente):
  - bytes 2.902.642 → 2.903.364 (+722); líneas 31.122 → 31.133 (+11);
  - ids 946 → 946, sin duplicados; enlaces internos 724 → 724;
  - `<div>` 5.231 abiertos y 5.231 cerrados, sin cambio; `<p>` 1.530 → 1.530;
  - bloques `<style>` 24 → 24; instancias `.qa-box` 3 → 3.
  - El único "enlace roto" que reporta el script, `${lab.anchor}`, es una plantilla
    de JavaScript y está igual en ambas versiones: falso positivo, no regresión.
- **Variables indefinidas**: 5 → 0.
- **Comprobación visual, esta vez sí** (a diferencia de registros anteriores):
  ambas versiones renderizadas con Chromium headless y capturado el `.qa-box` de
  §5.2. Estilos calculados en **modo claro**:

  | propiedad | v98 | v99 |
  |---|---|---|
  | `background-color` | `rgba(0,0,0,0)` | `rgb(245,243,255)` |
  | `border-left` | `0px none` | `4px solid rgb(79,70,229)` |
  | `border-top` | `0px none` | `1px solid` |
  | color de `.qa-label` | `rgb(30,41,59)` (heredado) | `rgb(79,70,229)` |
  | fuente de `.qa-label` | IBM Plex **Sans** | IBM Plex **Mono** |

  En **modo oscuro**, fondo y bordes idénticos en ambas (`#1a1a2e` / `#3a3a60`);
  la etiqueta pasa de heredar `#e2e8f0` a su color propio `#a5b4fc`. Sin regresión.

## Alcance

Corrección de CSS únicamente. Restaura el fondo y el borde izquierdo de "El arquitecto
pregunta" en modo claro, perdidos desde la v53. Sin cambios de contenido, de estructura
ni de numeración.
