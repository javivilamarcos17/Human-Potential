# Changelog — Historial de cambios

> Registro de todos los cambios significativos del proyecto.
> El más reciente siempre arriba.
> Formato: [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/)

---

## [Sin publicar]

> Los cambios en desarrollo van aquí hasta que se publican.

### Añadido — Maqueta visual navegable (2026-06-10)
- **`mockups/anti-fragil.html`**: boceto visual que se abre en el navegador (sin instalar nada) con las pantallas clave (Dashboard/avatar, Triaje, Feedback, Panel clínica con semáforos) y el visor de evolución del avatar (6 etapas mayores → 30 fases). Placeholders editables; arte final por ilustrador humano (D5).

### Añadido — Diseño del Core Loop diario (2026-06-10)
- **`docs/diseño/core-loop-diario.md`**: el ciclo diario paso a paso (triaje → dashboard → rutina → feedback RPE → recompensa), economía de Puntos de Vitalidad, reglas de racha "sin tiranía", semáforos de alerta a la clínica y reenganche amable del abandono.
- **`app/lib/features/dashboard/economia_puntos.dart`**: lógica de XP por acción + bonus de racha + XP por re-Auditoría + actualización de racha (con descanso protegido).
- **`app/lib/features/clinica/alertas_semaforo.dart`**: lógica de semáforo (rojo/ámbar/verde) como sistema de alerta temprana para el profesional.

### Cambiado — Auditoría configurable por profesional (D7) (2026-06-10)
- **Decisión D7** en `SYSTEM_VISION.md`: la Auditoría y sus tests se especializan por clínica/profesional. Lo estable es el marco (4 bloques, 0-100); el contenido es configurable vía plantillas.
- **`supabase/migrations/0003_plantillas_auditoria.sql`**: tablas `plantillas_auditoria`, `plantilla_items`, `auditoria_respuestas` + columna `plantilla_id` en `auditorias_vitalidad`.
- `docs/diseño/auditoria-vitalidad.md` reescrito: separa el marco estable del contenido configurable; los micro-tests pasan a ser una "plantilla de ejemplo".
- Inventario (PROPUESTA_DE_VALOR §6): A2 marcado como configurable + nueva pieza B6b (gestión de plantillas en el panel de la clínica).
- Lección registrada en `lessons-learned/log.md`.

### Añadido — Diseño de la Auditoría de Vitalidad (2026-06-10)
- **`docs/diseño/auditoria-vitalidad.md`** — diseño completo del test de entrada: anamnesis, 3-4 micro-tests (fuerza, aeróbico, movilidad/dolor), rúbrica de puntuación de los 4 bloques (0-100), interpretación por rangos, re-Auditorías y conexión con avatar/arquetipo. Marcado como borrador a validar por el equipo clínico.
- **`app/lib/features/onboarding/auditoria_vitalidad.dart`** — lógica de cálculo de la puntuación (resultados crudos → 4 bloques → total), con umbrales editables.

### Añadido — Profundización del boceto (2026-06-10)
- **`docs/PROPUESTA_DE_VALOR.md`** — propuesta de valor completa (problema, solución, mecanismo único, fosos defensivos, modelo de negocio) + **inventario completo de todo lo que hay que crear** (app paciente, panel clínica, backend, contenido) marcado por fase (MVP/Nevera/Visión Norte).
- **`docs/diseño/avatar-evolucion.md`** — sistema de evolución del avatar con sentido clínico: doble eje (constancia + mejora real), **30 fases en 6 etapas mayores** (modelo de dos capas para muchas fases sin disparar el coste de arte), puertas clínicas, estado Legendario (Trinidad del Nivel 100) y asignación por test/valoraciones (Sombrero Seleccionador).
- **`supabase/migrations/0002_catalogo_avatar.sql`** — tabla catálogo `fases_avatar` (30 fases) + datos de ejemplo: 3 arquetipos y 10 retos maestros.
- **Motor de evolución en Dart** (`app/lib/features/dashboard/avatar_evolucion.dart`): cálculo XP→nivel→fase con puertas clínicas y estado Legendario.
- **Sombrero Seleccionador en Dart** (`app/lib/features/onboarding/sombrero_seleccionador.dart`): asignación de arquetipo por valoración + XP de partida.
- **Esqueleto del panel web de la clínica** (`app/lib/features/clinica/panel_clinica_screen.dart`, B1-B6).
- Ampliado `avatares.fase_visual` de 1-20 a 1-30.

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
