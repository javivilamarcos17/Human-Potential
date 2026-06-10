# data/ — Modelos y acceso a datos

Aquí vive la conexión entre la app y la base de datos (Supabase).

- `models/` — Clases Dart que representan las tablas (Paciente, Avatar, Triaje...).
  Espejo del esquema de `supabase/migrations/`.
- `repositories/` — Clases que leen y escriben en Supabase (ej. `TriajeRepository`
  guarda el triaje del día). La pantalla nunca habla con Supabase directamente: pasa
  por un repositorio. Así, si cambia el backend, solo se toca esta capa.

> BOCETO: el equipo creará aquí los modelos y repositorios reales. Patrón recomendado:
> una clase modelo + un repositorio por entidad principal.
