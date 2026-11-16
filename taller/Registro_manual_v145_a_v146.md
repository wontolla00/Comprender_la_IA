# Registro v145 → v146 (contraste en tema claro)

## Qué cambió
- `index.html`: bloque `<style id="fix-contraste-widgets-oscuros">` antes de `</body>`; versión (título, insignia, nota del Cap. 22).
- Copia de la v145 en `archivo/`.

## Comprobaciones hechas
- Escaneo WCAG en tema claro con el manual en modo Completo: texto oscuro sobre fondo oscuro localizado en §1.2, §3.4, §6.13.2, tabla de herramientas (§12) y widgets de tarjeta oscura; parche probado en la página viva antes de aplicarlo.
- Falsos positivos descartados: contenedores con fondo translúcido sobre blanco, botones con degradado (`tsr68q`).

## Sin cerrar
- Verificar a ojo, tras publicar, §22.1 (nota amarilla de la calculadora) y las pestañas `tsr68q`.
- Figura de RAG agéntico con bucle (paso 2): la prepara David con otro LLM.
