# Copy de emails — Anti Frágil

> Cuatro plantillas de email transaccional / relacional.
> **Tono:** el mismo que la app — cálido y profesional, nunca genérico.
> Cada email debe sentirse como si lo hubiera escrito {fisio} o {clinica}, no un sistema.
>
> Variables comunes: `{nombre}`, `{fisio}`, `{clinica}`, `{codigo}`, `{racha}`,
> `{score_inicial}`, `{score_actual}`, `{diferencia_score}`, `{avatar_nombre}`,
> `{nombre_fase}`, `{nivel}`, `{enlace}`.

---

## Email 1 — Invitación con Código de Honor

*Lo envía la clínica al paciente cuando lo da de alta en el panel.
Es el primer contacto del paciente con Anti Frágil. Crítico: si este email no convence, no descarga la app.*

---

**Asunto:** {clinica} te ha preparado algo, {nombre}.

**Cuerpo:**

```
Hola, {nombre}.

{fisio} de {clinica} te ha creado un programa personalizado en Anti Frágil,
la app que vas a usar para hacer seguimiento de tu evolución.

Tu Código de Honor es:

    AF-{codigo}

Con él puedes activar tu cuenta. Guárdalo: es tuyo.

¿Qué es Anti Frágil?
Una app que {fisio} usa para mandarte ejercicios, ver cómo evolucionas
y ajustar tu programa cuando lo necesitas. No es un gimnasio virtual:
es una herramienta clínica hecha para ti.

→ [Descargar Anti Frágil y activar mi cuenta]

Si tienes alguna duda, escríbenos a {email_clinica} o pregunta directamente
a {fisio} en tu próxima visita.

Un saludo,
{fisio}
{clinica}
```

**Notas de diseño:**
- El código AF-{codigo} debe estar en tipografía grande y destacada (caja o bloque).
- El CTA "Descargar Anti Frágil" abre la App Store o Google Play según el dispositivo.
- El remitente del email debe ser `{clinica} via Anti Frágil` — no un noreply genérico.

---

## Email 2 — Bienvenida tras el alta (post-primera sesión)

*Se envía cuando el paciente completa su primera sesión (Core Loop completo por primera vez).
Confirma que ha empezado y refuerza el vínculo con la clínica.*

---

**Asunto:** {nombre}, tu programa ha empezado.

**Cuerpo:**

```
Hola, {nombre}.

Has completado tu primera sesión en Anti Frágil. Es el primer paso,
y suele ser el más difícil.

Tu Guardián, {avatar_nombre}, ha nacido hoy. Está en Fase 1 y crecerá
contigo cada día que cuides tu cuerpo.

Recuerda que {fisio} puede ver tu progreso desde el primer día y
ajustará tu programa cuando lo necesite. No estás solo en esto.

Hasta mañana,
{fisio}
{clinica}

P.D. Si algo de la primera sesión te ha parecido muy fácil o muy difícil,
cuéntaselo a {fisio} en su próxima revisión.
```

**Notas de diseño:**
- Email breve — no sobrecargar. El paciente acaba de hacer algo. Solo confirmar y motivar.
- La P.D. es importante: cierra el círculo clínico y recuerda que hay un humano al otro lado.

---

## Email 3 — Resumen semanal al paciente

*Se envía cada lunes por la mañana con el resumen de la semana anterior.
Solo si el paciente ha tenido al menos 1 sesión en la semana.*

---

**Asunto (con actividad):** Tu semana en Anti Frágil, {nombre}.
**Asunto (sin actividad esa semana):** {avatar_nombre} te espera, {nombre}.

**Cuerpo — variante con actividad:**

```
Hola, {nombre}.

Aquí va tu resumen de la semana:

  Sesiones completadas:   {sesiones_semana} / 7
  Racha actual:           {racha} días
  XP ganada:              {xp_semana} XP
  {avatar_nombre}:        Nivel {nivel} · {nombre_fase}

[Imagen o chip del avatar]

{fisio} ha visto tu evolución esta semana.
Sigue así — cada día cuenta.

→ [Ver mi progreso en la app]

Hasta la semana que viene,
{clinica} · Anti Frágil
```

**Cuerpo — variante sin actividad esa semana:**

```
Hola, {nombre}.

Esta semana no hemos visto actividad tuya en Anti Frágil.
Pasa, no pasa nada.

{avatar_nombre} sigue aquí, guardando tu progreso.
Cuando quieras retomar, la app estará lista.

{fisio} también está al tanto. Si necesitas ajustar algo del programa,
es el momento de decírselo.

→ [Abrir Anti Frágil]

{clinica} · Anti Frágil
```

**Notas de diseño:**
- La variante sin actividad no menciona días de ausencia ni usa lenguaje de reproche.
- Los datos numéricos deben formatearse con claridad (tipografía más grande o en tabla).
- Si la racha es 0 esta semana, no mostrar el dato de racha en el resumen.

---

## Email 4 — Resumen semanal a la clínica

*Se envía cada lunes al fisio con el resumen de actividad de sus pacientes.
Tono: profesional y orientado a la acción. El fisio es un sanitario, no un paciente.*

---

**Asunto:** Resumen semanal de {clinica} — {fecha_semana}

**Cuerpo:**

```
Hola, {fisio}.

Aquí tienes el resumen de la semana del {fecha_inicio} al {fecha_fin}:

──────────────────────────────
PACIENTES ACTIVOS ESTA SEMANA
──────────────────────────────
  Pacientes con al menos 1 sesión:   {n_activos} / {n_total}
  Sesiones completadas en total:     {total_sesiones}
  Media de adherencia:               {media_adherencia}%

──────────────────────────────
ALERTAS DE LA SEMANA
──────────────────────────────
  🔴 Requieren atención hoy:         {n_rojos} pacientes
  🟡 En seguimiento:                 {n_ambar} pacientes

  Pacientes inactivos (≥ 5 días):
  {lista_inactivos}  (Nombre · Días sin actividad)

  Dolor alto reportado esta semana:
  {lista_dolor_alto}  (Nombre · Zona · Puntuación)

──────────────────────────────
EVOLUCIÓN DESTACADA
──────────────────────────────
  {lista_mejoras}  (Nombre · Mejora en re-Auditoría o hito de racha)

──────────────────────────────

→ [Abrir el panel de {clinica}]

Si tienes preguntas sobre este resumen, escríbenos a soporte@antifragil.app.

Anti Frágil
```

**Notas de diseño:**
- Si no hay alertas esa semana, la sección de alertas muestra: *"Sin alertas esta semana. ✅"*
- Si no hay mejoras destacadas, omitir esa sección.
- `{lista_inactivos}` y `{lista_dolor_alto}` son listas dinámicas con salto de línea por paciente.
- El remitente es `Anti Frágil <noreply@antifragil.app>` — en este email sí es el sistema, no el fisio.
- Solo se envía si hay al menos 1 paciente activo en la clínica.

---

## Checklist de calidad (aplicar a todos los emails)

- [ ] ¿El asunto da ganas de abrirlo sin ser clickbait?
- [ ] ¿El cuerpo puede leerse en < 30 segundos?
- [ ] ¿{fisio} y {clinica} están presentes donde corresponde?
- [ ] ¿Ningún email con datos de paciente puede llegar al destinatario equivocado? *(seguridad)*
- [ ] ¿La variante "sin actividad" evita cualquier lenguaje de reproche?
- [ ] ¿El email de la clínica es accionable (puede saber qué hacer al leerlo sin abrir la app)?
