# ADR-002 — Arquitectura multi-clínica (multi-tenant) desde el día uno

**Fecha:** 2026-06-10
**Estado:** Aceptada

## Contexto

Anti Frágil es un negocio B2B2C: las **clínicas** son el canal que prescribe la app a
sus **pacientes**. El MVP arranca con una sola marca ("Anti Frágil"), pero la visión de
negocio contempla:

- Vender la app a **muchas clínicas** distintas.
- Posiblemente ofrecerla en modo **marca blanca** (white-label): cada clínica con su
  logo y colores.

La pregunta técnica era: ¿construimos ahora para una sola clínica y rehacemos todo
cuando lleguen más, o lo dejamos preparado desde el principio?

## Decisión

Diseñar la base de datos como **multi-clínica (multi-tenant) desde el día uno**, pero
**lanzar el MVP con una sola marca visible**.

En la práctica: cada tabla importante (pacientes, profesionales, rutinas, etc.) lleva
una "etiqueta" de a qué **clínica** pertenece (`clinica_id`). Los datos de una clínica
nunca se mezclan ni son visibles para otra, gracias a las reglas de seguridad de la base
de datos (Row Level Security de Supabase).

La marca blanca queda como un **interruptor de configuración** para el futuro, no como
una reescritura.

## Alternativas consideradas

- **Una sola clínica (single-tenant)** — descartada porque, en cuanto entrase la
  segunda clínica, habría que rehacer la base de datos y arriesgar los datos existentes.
  Es el error clásico que cuesta carísimo corregir tarde.
- **Una base de datos separada por cada clínica** — descartada por sobre-ingeniería para
  esta fase: multiplica el coste de mantenimiento y la complejidad sin aportar nada que
  no resuelva ya el modelo de "etiqueta por clínica" con buenas reglas de seguridad.

## Consecuencias

**Bueno:**
- Escalar a 1, 10 o 500 clínicas no requiere rehacer nada.
- La marca blanca pasa de ser "un proyecto nuevo" a ser "activar una opción".
- La separación estricta de datos entre clínicas es un argumento de venta y de
  cumplimiento legal (protección de datos sanitarios).

**A tener en cuenta:**
- Cada consulta a la base de datos debe respetar la etiqueta de clínica. Las reglas de
  seguridad (RLS) hay que escribirlas con cuidado desde el principio — es trabajo extra
  pequeño ahora que evita un desastre grande después.
- El primer registro de datos del sistema será siempre una clínica; ningún paciente o
  profesional puede existir "suelto" sin clínica.
