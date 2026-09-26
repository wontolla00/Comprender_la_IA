# Nota de taller · Fase 0 como fichero acompañante

*21 de septiembre de 2026.*

Origen: una propuesta externa fusionaba una "Fase 0 — Onboarding (2 semanas)"
dentro del manual y la entregaba como `V99-CON-Fase0`. Se descartó la fusión y se
adoptó un **acompañante independiente**: `Fase_0_Onboarding.html`, junto al manual.

## Por qué no fusionarla

- **Colisión de versiones.** El fichero se llamaba V99 pero por dentro decía
  v98.1: trece menciones a v98, ninguna a v99. La v99 real ya existía.
- **Deshacía el parche de la v99.** Estaba construido sobre v98, así que las cinco
  variables CSS volvían a estar indefinidas y `.qa-box` perdía otra vez fondo y
  borde en modo claro.
- **CRLF → LF en los 2,9 MB.** Los 31.122 saltos de línea convertidos.
- **`id="indice"` duplicado**: el del manual y el de la Fase 0. Los dos
  `href="#indice"` saltaban al primero.
- **Razón editorial, la de fondo**: el manual declara que asume Python. Incrustar
  dentro un onboarding que depende de un repositorio de terceros no auditado
  cambia lo que el manual es y ata su numeración de versiones a material ajeno.
  Como acompañante, la Fase 0 puede actualizarse o retirarse sin tocar el manual,
  y si el repositorio se pudre solo se rompe el acompañante.

Lo que la propuesta **sí** hacía bien y se conserva: reescribir la Fase 0 con los
componentes del manual (15 clases, todas ya definidas, sin CSS nuevo) y usar
`var(--token)` en 435 de los 516 estilos en línea que fijan color, de modo que el
modo oscuro funciona.

## Qué se construyó

`Fase_0_Onboarding.html`, 92.315 bytes, autónomo:

- Bloque de la Fase 0 extraído del fusionado (20.868 caracteres, 18 ids).
- CSS: el bloque principal de la v99 **con los tokens ya corregidos**.
- Barra superior propia con conmutador de modo noche, barra de progreso y enlace
  de vuelta al manual; al final, tarjeta de navegación hacia el Cap. 0.
- Las 8 menciones a "v98" heredadas, actualizadas a v99.
- **Sección nueva "Verificación del repositorio"**, escrita para esta edición:
  estado del repo (último commit 22/02/2026), estructura real frente a la que
  describe su README, 13 enlaces rotos propios, densidad de los notebooks, y el
  aviso de las cinco páginas con la instrucción de generación sin revisar dentro
  del CSS. Reencuadra el material como **guion de clase, no autoestudio**.

## Verificación

- Variables CSS indefinidas: **0**. Clases sin definir: **0**.
- 20 ids, sin duplicados. 19 anclas internas, **0 rotas**.
- 19 enlaces externos, comprobados uno a uno contra un clon del repositorio:
  **0 rotos**. Ninguno apunta a `notebooks/es/`, que es donde están los 13 rotos
  del README original.
- Menciones a v98: 0. A v99: 10.
- Renderizado con Chromium en **modo claro y oscuro**: sin desbordamiento
  horizontal (ancho 1000 = ventana 1000), alto 10.619 px.
- Finales de línea **CRLF**, como el resto del corpus: 1.417, ningún LF suelto.

## Pendiente

- El manual **no** enlaza todavía al acompañante. Añadir ese puntero obliga a
  una v100 con su propio registro; decisión abierta.
- Hallazgo lateral, no corregido: en el CSS del manual, `tr:nth-child(even) td`
  (especificidad 0,2,2) gana a `td:first-child` (0,1,1), así que la primera
  columna alterna entre azul de acento y color de texto en todas las tablas.
  Es cosmético y afecta al manual entero, no solo a este fichero.
