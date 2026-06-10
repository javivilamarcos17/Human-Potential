# Supabase — Base de datos de Anti Frágil

> Aquí vive la definición de la base de datos: las tablas, sus relaciones y las reglas
> de seguridad. Es el "cerebro de datos" del proyecto.

## ¿Qué hay aquí?

- `migrations/` — Scripts SQL que crean la base de datos paso a paso. Cada archivo es un
  cambio numerado. Se aplican en orden.

## Cómo se aplica (para el equipo de desarrollo)

1. Crear un proyecto en [supabase.com](https://supabase.com) (gratis para empezar).
2. Copiar la `SUPABASE_URL` y las claves al archivo `.env` (ver `.env.example`).
3. Aplicar las migraciones de `migrations/` en orden, desde el editor SQL de Supabase o
   con la CLI de Supabase (`supabase db push`).

## Estado actual

- `0001_esquema_inicial.sql` — **Boceto**. Crea todas las tablas del MVP v1.5 con sus
  relaciones y la columna `clinica_id` para el aislamiento multi-clínica. Las reglas de
  seguridad (RLS) están esbozadas y comentadas; el equipo las afinará al implementar.

> ⚠️ Este esquema es un punto de partida editable, no la versión final. Está pensado
> para que un equipo lo revise, lo ajuste y lo haga crecer.
