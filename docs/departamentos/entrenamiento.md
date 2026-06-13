# 🏋️ Entrenamiento — panel de mandos

> Todo lo que decide qué ejercicios hace el paciente, cómo se adapta y cómo progresa.
> Dile a Claude "en entrenamiento, …" y abre el dial correspondiente.

## 1. Las rutinas (packs)
**Qué controlas:** los ejercicios de cada nivel, sus series/repeticiones y el vídeo.
**Diales actuales** (en `CONFIG` de `app-funcional.html`):
- `pack` — rutina base (ej. Pack Lumbar: Gato-camello, Puente de glúteo, Bird-dog).
- `packSuave` — rutina de recuperación (días de dolor/cansancio).
- `packAvanzado` — progresión (4 ejercicios más exigentes).
- Cada ejercicio: `{nombre, detalle, video}`. El `video` es opcional (Vimeo/YouTube).
**Cómo pedírmelo:** *"añade [ejercicio] al pack lumbar con 3 series de 10"* · *"pon este vídeo a Bird-dog"* · *"crea un pack cervical"*.

## 2. Cómo la app elige la rutina cada día (motor adaptativo)
**Qué controlas:** las reglas que deciden qué rutina toca hoy según cómo está el paciente.
**Reglas actuales** (función `decidirRutina`):
| Situación | Rutina | 
|-----------|--------|
| Mal sueño / estrés alto (micro-pregunta) | Suave + mensaje de regeneración |
| Dolor ≥8 hoy | Suave + invita a presencial |
| Molestia nueva ayer | Suave: "consolidar" + presencial |
| Dolor 5-7 o energía ≤3 | Intensidad rebajada |
| Esfuerzo (RPE) ≥8 últimos 3 días | Día de descarga |
| 5 días dolor bajo + esfuerzo cómodo | **Sube a packAvanzado** |
| Dolor estancado 14 días | Sigue + sugiere presencial |
**Cómo pedírmelo:** *"si duerme mal 2 días seguidos, que descanse"* · *"sube a avanzado con 7 días buenos en vez de 5"*.

## 3. Tiempo disponible
**Dial:** botones 5/15/30 min → la app recorta la rutina (2 / 3 / todos los ejercicios).
**Cómo pedírmelo:** *"que la versión de 5 min tenga solo 1 ejercicio"*.

## 4. Puntos y progresión (gamificación del esfuerzo)
**Diales** (objeto `XP` y curva de nivel):
- XP por jornada: triaje **+5**, rutina **+20**, feedback **+5**, bonus racha **+2/día** (tope **+20**).
- Reto Maestro: **+150**. Curva de nivel: cada nivel cuesta **+8%** que el anterior.
- 30 fases con "puertas" (racha, sesiones, mejora real…) — tabla `FASES`.
**Cómo pedírmelo:** *"sube la XP de completar rutina a 30"* · *"que la fase 5 llegue antes"*.

## 5. Retos Maestros (logros)
**Dial:** tabla `RETOS` (10 hitos: rachas 7/14/30, 25/50/100 sesiones, semana sin dolor, +5 vitalidad, "el que vuelve"…).
**Cómo pedírmelo:** *"añade un reto por hacer 10 rutinas avanzadas"*.

---
**Reproductor guiado:** trabajo 40s / descanso 20s por ejercicio (`plPintar`). Pídeme cambiar los tiempos.
**Dónde vive todo:** `mockups/prototipo/app-funcional.html`. Validación: `tests/sim-paciente.js`.
