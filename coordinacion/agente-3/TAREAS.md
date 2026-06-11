# Cola de tareas — Agente 3 · TRACK CONTENIDO & VOZ (copy)

> Lo escribe SOLO el organizador. Tú (agente) solo LEES esto y haces la tarea ▶ EN CURSO.
> 🔁 MODO RÁFAGA: cuando termines una tarea, NO pares — haz git pull y encadena la siguiente
> de la COLA (en orden) hasta vaciarla. Confirma CADA tarea en ESTADO.md + push antes de seguir.
> ⚠️ GITHUB = javivilamarcos17, SIEMPRE. NO PREGUNTES NUNCA POR LA CUENTA.
> Tono siempre: empatía clínica, cero culpa, variables {nombre} {fisio} {clinica} {racha}.
> Persona canónica: Javi · MovePlus · Dra. Elena Ruiz · Kael (Agua).

## ▶ EN CURSO
- **Crea `docs/diseño/copy-panel-clinica.md`** — los textos del panel del fisio (lado B2B):
  etiquetas y descripciones de los semáforos (rojo/ámbar/verde), textos de la ficha del
  paciente, avisos de alerta ("Javi reportó una molestia nueva tras la sesión de hoy"),
  estados vacíos del panel y tooltips. Profesional y claro (el lector es un sanitario, no
  un paciente). Contexto: `docs/diseño/panel-clinica.md`. SOLO ese archivo.

## ⬜ COLA (en orden)
1. **`docs/diseño/copy-anamnesis.md`** — las preguntas del cuestionario inicial (anamnesis)
   redactadas con calidez y sencillez (nada de jerga médica), agrupadas como en
   `docs/diseño/auditoria-vitalidad.md` §2, con las opciones de respuesta. Incluye los textos
   de bandera roja ("avisaremos a tu clínica para que lo revise contigo").
2. **`docs/diseño/copy-emails.md`** — plantillas de email: invitación con Código de Honor
   (la envía la clínica), bienvenida tras el alta, resumen semanal de progreso al paciente,
   y resumen semanal de actividad a la clínica. Con variables.
3. **`docs/diseño/copy-tiendas.md`** — ficha para App Store / Google Play: nombre, subtítulo,
   descripción corta y larga, y 5 bullets de beneficios. Orientada al paciente (B2C) pero
   mencionando la prescripción clínica.

## ✅ Hecho: microcopy-app · copy-notificaciones · copy-estados · copy-tarjetas-epicas

## Reglas
- Solo creas el archivo asignado + tu `ESTADO.md`. No toques CHANGELOG ni archivos de otros.
- Rama `feat/boceto-mvp`. Antes de push: `git pull --rebase`. Calidad: filtro de `docs/REVISION_CRITICA.md`.
