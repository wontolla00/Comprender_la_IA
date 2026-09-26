# Registro de cambios · v99 → v100

*21 de septiembre de 2026.*

Origen: hallazgo lateral al construir `Fase_0_Onboarding.html`. Al renderizar el
acompañante se vio que la primera columna de las tablas alternaba entre el azul de
acento y el color de texto normal, fila sí fila no. No era del acompañante: es del
CSS del manual, y afecta a sus 257 tablas.

## Verificación previa

- **Reglas implicadas**, las tres contiguas en el bloque `<style>` principal:

  ```
  tr:nth-child(even) td { background: var(--bg); color: var(--text); }
  td:first-child        { font-weight: 600; color: var(--accent); }
  body.dark td:first-child { color: #93c5fd; }
  ```

- **Mecanismo**: `tr:nth-child(even) td` tiene especificidad (0,1,2);
  `td:first-child`, (0,1,1). La primera gana, así que en las filas pares la
  primera celda recibía `--text` en vez de `--accent`. El orden en el fichero no
  ayudaba: la especificidad manda sobre el orden.
- **Solo en modo claro.** `body.dark td:first-child` es (0,2,2) y gana a las dos,
  así que en oscuro nunca se vio. Medido antes de tocar nada, sobre v99:
  - claro: `#2563eb`, `#1e293b`, `#2563eb`, `#1e293b` → **alterna**;
  - oscuro: `#93c5fd` en las cuatro filas → **uniforme**.
- **Descartado como causa**: `body.dark td { color: var(--text) }`, más abajo en el
  fichero, parecía poder pisar la regla oscura. No lo hace: es (0,1,2) frente a
  (0,2,2). La medición lo confirma.

## Cambios

1. **Selector**: `td:first-child` → `tr td:first-child`, con comentario explicando
   por qué. Pasa a (0,1,2): empata con `tr:nth-child(even) td` y gana por orden,
   al estar después. Sigue por debajo de `body.dark td:first-child` (0,2,2), de modo
   que el modo oscuro queda exactamente igual.
2. **`<title>` y badge de la barra superior**: decían `v98`. Se pasan a `v100`.
   Es una corrección arrastrada: la v99 cambió el nombre del fichero pero no estos
   dos metadatos, que llevaban desde entonces desfasados.
3. **`Fase_0_Onboarding.html`**: sus dos enlaces al manual reapuntados de v99 a
   v100, y las menciones de versión actualizadas.

## Lo que no se cambió, a propósito

- Ni una línea de contenido; el texto visible crece 2 caracteres, de "v98" a "v100"
  en el título.
- No se tocó `tr:nth-child(even) td`. Quitarle el `color` habría sido la otra vía,
  pero esa regla existe para romper la herencia de padres con texto blanco: el
  comentario del autor en la regla `td` lo dice. Se prefirió subir la especificidad
  de la regla afectada antes que retirar una defensa deliberada.
- No se tocó `body.dark td:first-child`, que funcionaba.

## Verificación

- **Proceso**: v100 generado desde v99 en binario. CRLF 31.133 → 31.133, sin cambio.
- **Comparación estructural**: bytes 2.903.364 → 2.903.550 (+186); ids 946 → 946 sin
  duplicados; anclas internas rotas 0 → 0; `<div>` 5.231 abiertos y cerrados, igual;
  `<p>` 1.530 → 1.530; `<style>` 24 → 24; `<h2>` 257 → 257; variables CSS
  indefinidas 0 → 0; texto visible +2 caracteres.
- **Comprobación visual** con Chromium, color calculado de la primera celda en las
  cuatro primeras filas de una tabla larga:

  | | claro | oscuro |
  |---|---|---|
  | v99 | `#2563eb` / `#1e293b` alternando | `#93c5fd` uniforme |
  | v100 | **`#2563eb` uniforme** | `#93c5fd` uniforme |

  Captura de una tabla en modo claro: primera columna homogénea y badge `v100`.

## Alcance

Corrección de CSS de una línea, más dos metadatos de versión. Afecta a las 257
tablas del manual en modo claro. Sin cambios de contenido, estructura ni numeración.
