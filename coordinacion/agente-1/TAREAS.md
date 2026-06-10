# Cola de tareas — Agente 1 · TRACK MARCA & PROTOTIPO VISUAL

> Lo escribe SOLO el organizador. Tú (agente) solo LEES esto y haces la tarea ▶ EN CURSO.
> Al terminar, confirma en `ESTADO.md`, push, y dime "listo agente-1". No edites este archivo.
> ⚠️ GITHUB = javivilamarcos17, SIEMPRE. NO PREGUNTES NUNCA POR LA CUENTA.
> PRIORIDAD DEL DUEÑO: estética muy cuidada + algo demostrable y funcional, medido al milímetro.

## ▶ EN CURSO
- **Crea un PROTOTIPO NAVEGABLE en `mockups/prototipo/`** (archivos NUEVOS; NO toques
  `mockups/anti-fragil.html`). Un `index.html` (+ css/js dentro de esa carpeta si quieres) que
  se abra en el navegador y permita **hacer clic para moverse entre pantallas** del flujo:
  Onboarding (Código de Honor) → Auditoría → Sombrero Seleccionador (elige 1 de 3) →
  Dashboard (avatar+XP+racha) → Triaje → Rutina → Feedback RPE → recompensa.
  - Aplica paleta y tono de `docs/IDENTIDAD_VISUAL.md`. Estética cuidada, limpia, "empatía clínica".
  - Avatares = placeholders (emoji/formas) marcados; arte final humano (D5).
  - Que se sienta una app real: botones que navegan, transiciones simples. Sin backend.
  - Contexto: `docs/diseño/core-loop-diario.md`, `docs/diseño/avatar-evolucion.md` y
    `docs/diseño/personalizacion-y-detalles.md` (lee este último: aplica MÁXIMA personalización
    — nombre del paciente "Javi", su fisio "Dra. Demo", su clínica — que NO se sienta genérico).
    Puedes usar los datos de `supabase/migrations/0004_datos_demo.sql` como ejemplo realista.

## ⬜ COLA (en orden; no empieces hasta que pase a EN CURSO)
1. **`mockups/prototipo/clinica.html`** — panel del fisio (semáforos rojo/ámbar/verde, ficha del
   paciente). Misma estética. Contexto: `docs/diseño/panel-clinica.md`.
2. **`docs/diseño/moodboard-avatares.md`** — guía de estilo para el ilustrador: las 6 etapas
   mayores × 3 arquetipos (Tierra/Agua/Viento) con paleta y referencias. Contexto: `avatar-evolucion.md`.

## Reglas
- Solo creas archivos NUEVOS de tu tarea + tu `ESTADO.md`. No toques CHANGELOG ni archivos de otros.
- Rama `feat/boceto-mvp`. Antes de push: `git pull --rebase`. Cuenta javivilamarcos17 (no preguntar).
