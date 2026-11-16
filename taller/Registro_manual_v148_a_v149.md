# Registro v148 → v149 (cotejo de ASI05 y ASI07 con el PDF de OWASP)

## Qué cambió
- `index.html`: §21.8, filas ASI05, ASI07 y ASI10 de la tabla; recuadro `s218-agentico-2026-11` reescrito; versión.
- Copia de la v148 en `archivo/`.

## Comprobado contra el PDF completo (aportado por David)
- ASI05: el documento cubre ejecución de código generado o inyectado (eval, deserialización, instalación de paquetes, escape de sandbox). El manual solo tiene el sandboxing de §10.4 → laguna.
- ASI07: el documento cubre autenticación, integridad, repetición, degradación de protocolo y descubrimiento de agentes. §10.10.1 solo distingue MCP de A2A; §10.6 trata trazabilidad → laguna.

## Sin cerrar
- Cotejar los otros ocho cruces línea a línea.
- Decidir si ASI05 y ASI07 merecen sección propia (candidatos: §10.4 y §10.10.1).
