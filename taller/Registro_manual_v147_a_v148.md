# Registro v147 → v148 (OWASP agéntico en §21.8 y campos de registro en §14.5)

## Qué cambió
- `index.html`: en §21.8, subapartado `s218-agentico` (tabla ASI01–ASI10 → secciones) y recuadro `s218-agentico-2026-11`; en §14.5, recuadro `s145-registro-agentes-2026-11` antes de «Dos reglas de gobernanza…»; versión (título, insignia, nota del Cap. 22).
- Copia de la v147 en `archivo/`.

## Comprobaciones hechas
- Los diez nombres ASI01–ASI10 se leyeron en el blog de lanzamiento de OWASP (genai.owasp.org, 9/12/2025). La página del recurso confirma la fecha pero remite a una descarga; el documento completo no se leyó.
- Los 20 enlaces internos nuevos apuntan a ids existentes; ids nuevos únicos; `div` y tabla equilibrados.
- La columna «Dónde en el manual» se hizo por título y tema de sección, sin releer cada sección frente a la descripción de OWASP.

## Sin cerrar
- Leer el documento completo de OWASP (descarga) antes de añadir correspondencias con la lista LLM o medidas de mitigación.
- Comprobar si §10.10.1 y §10.6 abordan la suplantación de mensajes entre agentes (ASI07) y si hace falta una caja sobre ejecución inesperada de código (ASI05).
- La tabla coloreada «bloquear / vigilar» de diez filas, solo con fuente primaria.
