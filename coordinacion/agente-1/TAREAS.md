# Cola de tareas — Agente 1 · TRACK MARCA & PROTOTIPO VISUAL

> Lo escribe SOLO el organizador. Tú (agente) solo LEES esto y haces la tarea ▶ EN CURSO.
> Al terminar, confirma en `ESTADO.md`, push, y dime "listo agente-1". No edites este archivo.
> ⚠️ GITHUB = javivilamarcos17, SIEMPRE. NO PREGUNTES NUNCA POR LA CUENTA.
> PRIORIDAD DEL DUEÑO: estética muy cuidada + algo demostrable y funcional, medido al milímetro.

## ▶ EN CURSO — PULIDO del prototipo (revisión crítica del organizador)
El prototipo `mockups/prototipo/index.html` está muy bien. Corrige estas incoherencias
detectadas (ver `docs/REVISION_CRITICA.md`), editando SOLO ese archivo:
- **C3 · Racha coherente:** el Dashboard muestra 7 días y la Recompensa 8; al volver al
  Dashboard sigue 7. Unifícalo: tras cerrar la sesión, el Dashboard debe reflejar la racha
  actualizada (usa JS para subir 7→8, o parte de un valor coherente en todo el flujo).
- **C4 · Persona canónica:** usa SIEMPRE la misma (ver REVISION_CRITICA): Paciente **Javi**,
  Código **AF-8823**, Clínica **MovePlus**, Fisio **Dra. Elena Ruiz**, Guardián **Kael (Agua)**.
  Hoy la rutina dice "Dr. Rodríguez". Cámbialo a Dra. Elena Ruiz · MovePlus.
- **C5 · Botones muertos:** "Mi progreso", "Tarjeta Épica" y "Compartir" no hacen nada.
  Conéctalos a algo simple (un aviso "Próximamente en el MVP") o márcalos como demo.
- (C6 XP/fase: déjalo como está, solo añade un comentario de que son ilustrativos.)

## ⬜ COLA (en orden; no empieces hasta que pase a EN CURSO)
1. **`mockups/prototipo/clinica.html`** — panel del fisio (semáforos rojo/ámbar/verde, ficha del
   paciente de **Javi**, fisio **Dra. Elena Ruiz · MovePlus**). Misma estética y persona canónica.
   Contexto: `docs/diseño/panel-clinica.md`.
2. **`docs/diseño/moodboard-avatares.md`** — guía de estilo para el ilustrador: las 6 etapas
   mayores × 3 arquetipos (Tierra/Agua/Viento) con paleta y referencias. Contexto: `avatar-evolucion.md`.

## ⬜ COLA (en orden; no empieces hasta que pase a EN CURSO)
1. **`mockups/prototipo/clinica.html`** — panel del fisio (semáforos rojo/ámbar/verde, ficha del
   paciente). Misma estética. Contexto: `docs/diseño/panel-clinica.md`.
2. **`docs/diseño/moodboard-avatares.md`** — guía de estilo para el ilustrador: las 6 etapas
   mayores × 3 arquetipos (Tierra/Agua/Viento) con paleta y referencias. Contexto: `avatar-evolucion.md`.

## Reglas
- Solo creas archivos NUEVOS de tu tarea + tu `ESTADO.md`. No toques CHANGELOG ni archivos de otros.
- Rama `feat/boceto-mvp`. Antes de push: `git pull --rebase`. Cuenta javivilamarcos17 (no preguntar).
