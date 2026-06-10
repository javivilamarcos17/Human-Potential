# Changelog — Historial de cambios

> Registro de todos los cambios significativos del proyecto.
> El más reciente siempre arriba.
> Formato: [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/)

---

## [Sin publicar]

> Los cambios en desarrollo van aquí hasta que se publican.

### Añadido — Boceto inicial del MVP v1.5 (2026-06-10)
- **Decisiones cerradas D1–D6** en `SYSTEM_VISION.md` (stack, multi-clínica, avatar, arquetipos, arte, pagos fuera).
- **ADR-001** — Stack Flutter + Supabase.
- **ADR-002** — Arquitectura multi-clínica (multi-tenant) desde el día uno.
- **Modelo de datos completo** documentado en `docs/ARQUITECTURA.md` (clínica, profesional, paciente, auditoría, avatar/items/retos, triaje, vídeos/packs, prescripciones/sesiones, feedback RPE, monedero, referidos).
- **Esquema SQL inicial** en `supabase/migrations/0001_esquema_inicial.sql`.
- **Esqueleto Flutter** del flujo principal en `app/` (onboarding, dashboard, triaje, rutinas, feedback, monedero, tarjetas, upselling) + tema y configuración.
- **Roadmap de creación** por fases (Fase 0 cimientos → Fase 1 MVP en 7 sprints → Fase 2 "Nevera" → Fase 3 "Visión Norte").

---

<!-- Claude añade entradas aquí siguiendo este formato:

## [1.0.0] — YYYY-MM-DD

### Añadido
- Nueva funcionalidad X que permite Y

### Cambiado
- El flujo de Z ahora funciona así en lugar de asá

### Corregido
- El error que ocurría cuando...

### Eliminado
- Se eliminó la funcionalidad X porque...

-->
