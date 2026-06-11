# Copy de notificaciones push — Anti Frágil

> Las notificaciones push son el contenido más intrusivo de la app.
> Si no son perfectas, el usuario las silencia y ya no hay vuelta atrás.
> **Regla de oro:** cada notificación tiene que parecer que la envía alguien que
> te conoce, no un sistema automatizado.

---

## Principios de redacción

1. **El Guardián como voz.** Las notificaciones de reenganche las "envía" el avatar, no la app. Esto humaniza y elimina la sensación de culpa corporativa.
2. **Cero reproche.** Nunca mencionar días de ausencia como fallo. Foco en lo que el usuario *va a ganar*, no en lo que ha perdido.
3. **Brevedad real.** Título: máx. 45 caracteres. Cuerpo: máx. 90 caracteres. Si no cabe, se recorta por el sistema — hay que escribir como si el límite fuera estricto.
4. **Variantes rotativas.** Mínimo 3 variantes por categoría para evitar la fatiga de notificación. El sistema rota aleatoriamente o en secuencia.
5. **Variables disponibles en push.** Solo las que están en el perfil del usuario (precargadas): `{nombre}`, `{avatar_nombre}`, `{racha}`, `{nombre_fase}`, `{nivel}`. Las variables de triaje (`{dolor_ayer}`) NO están disponibles en el momento del envío.

---

## Formato de cada entrada

```
Título: [texto] (N chars)
Cuerpo:  [texto] (N chars)
Trigger: [cuándo se envía]
Deep link: [pantalla que abre]
```

---

## 1. Recordatorio diario

*Enviado a la hora configurada por el usuario (o la que el sistema detecta como su hora habitual). Solo se envía si NO ha completado el Core Loop ese día.*

**Variante A**
```
Título: {nombre}, hoy toca cuidarte. (31 chars + nombre)
Cuerpo:  {avatar_nombre} tiene tu rutina preparada. Solo unos minutos. (63 chars + avatar)
Trigger: Hora preferida del usuario. No completó rutina en el día.
Deep link: Dashboard
```

**Variante B**
```
Título: Tu programa de hoy está listo. (33 chars)
Cuerpo:  {fisio} lo ha preparado para ti. ¿Entramos? (45 chars + fisio)
Trigger: Hora preferida del usuario. No completó rutina en el día.
Deep link: Triaje
```

**Variante C**
```
Título: {nombre}. (nombre + punto)
Cuerpo:  {avatar_nombre} espera. Son solo {duracion_estimada} minutos. (variable + "minutos")
Trigger: Hora preferida del usuario. No completó rutina en el día.
Deep link: Triaje
```

**Variante D — racha activa (≥ 7 días)**
```
Título: {racha} días. No pares ahora. (28 chars + racha)
Cuerpo:  Tu racha sigue en pie. Haz tu rutina de hoy. (46 chars)
Trigger: Hora preferida. No completó rutina. Racha ≥ 7 días.
Deep link: Triaje
```

> ⚠️ **Nota de implementación:** La variante D solo se activa cuando `racha ≥ 7`.
> Por debajo de 7 días no es suficiente apego a la racha para usar este argumento.

---

## 2. Reenganche (usuario inactivo)

*El más delicado. Nunca mencionar "llevas X días sin entrenar". El Guardián es el mensajero.*

### 2.1 Día 2 sin actividad (recordatorio suave)

**Variante A**
```
Título: ¿Todo bien, {nombre}? (20 chars + nombre)
Cuerpo:  {avatar_nombre} tiene algo preparado para ti hoy. (50 chars + avatar)
Trigger: 48h sin completar el Core Loop.
Deep link: Dashboard
```

**Variante B**
```
Título: Hoy puede ser el día, {nombre}. (32 chars + nombre)
Cuerpo:  Tu rutina sigue aquí, esperándote. (35 chars)
Trigger: 48h sin completar el Core Loop.
Deep link: Triaje
```

---

### 2.2 Día 3 sin actividad ("tu Guardián te echa de menos")

*Mensaje más emocional. El avatar habla en primera persona. Nunca acusar.*

**Variante A**
```
Título: {avatar_nombre} te echa de menos. (34 chars + avatar)
Cuerpo:  Vuelve cuando puedas. Aquí estaremos. (38 chars)
Trigger: 72h sin completar el Core Loop.
Deep link: Dashboard
```

**Variante B**
```
Título: {nombre}, {avatar_nombre} pregunta por ti. (43 chars + nombre + avatar)
Cuerpo:  El brillo de tu Guardián espera que vuelvas. (45 chars)
Trigger: 72h sin completar el Core Loop.
Deep link: Dashboard
```

**Variante C**
```
Título: Tu Guardián no ha olvidado nada. (34 chars)
Cuerpo:  {avatar_nombre} guarda tu progreso. Cuando quieras, seguimos. (62 chars + avatar)
Trigger: 72h sin completar el Core Loop.
Deep link: Dashboard
```

> ⚠️ **Crítico:** ninguna variante dice "llevas 3 días sin entrenar", "has fallado"
> ni nada parecido. El tono es 100% de reencuentro, no de reproche.

---

### 2.3 Día 5+ sin actividad (reenganche cálido)

*A partir del día 5 el riesgo de abandono es alto. El mensaje debe ser cálido y quitarle peso al regreso.*

**Variante A**
```
Título: La racha puede esperar. Tú, no. (33 chars)
Cuerpo:  Volver es fácil: haz la rutina de hoy y {avatar_nombre} brilla de nuevo. (72 chars + avatar)
Trigger: 5 días sin completar el Core Loop.
Deep link: Dashboard
```

**Variante B**
```
Título: Hola de nuevo, {nombre}. (25 chars + nombre)
Cuerpo:  No importa cuánto tiempo haya pasado. {avatar_nombre} te espera donde lo dejaste. (82 chars + avatar)
Trigger: 5 días sin completar el Core Loop.
Deep link: Dashboard
```

**Variante C**
```
Título: El cuerpo no olvida lo que hiciste. (37 chars)
Cuerpo:  {nombre}, tu progreso sigue ahí. Hoy puede ser el primer día de la nueva racha. (81 chars + nombre)
Trigger: 5 días sin completar el Core Loop.
Deep link: Dashboard
```

> ⚠️ **Nota:** A partir del día 7+ sin actividad se puede considerar enviar una sola
> notificación semanal en lugar de diaria para no saturar. La frecuencia exacta la
> debe ajustar el equipo de producto con datos del piloto.

---

## 3. Celebración de hitos

*Enviadas justo después de que el sistema registra el hito. No esperar al día siguiente.*

### 3.1 Hito de racha (completar el día N)

**Racha 7 días**
```
Título: ¡Una semana, {nombre}! (22 chars + nombre)
Cuerpo:  7 días seguidos. Tu cuerpo ya lo nota. {avatar_nombre} ha ganado poder. (72 chars + avatar)
Trigger: Core Loop completado. racha == 7.
Deep link: Recompensa / pantalla de hito
```

**Racha 14 días**
```
Título: Dos semanas sin parar. Impresionante. (39 chars)
Cuerpo:  {nombre}, esto ya es un hábito. {avatar_nombre} te lo agradece. (63 chars + nombre + avatar)
Trigger: Core Loop completado. racha == 14.
Deep link: Recompensa / pantalla de hito
```

**Racha 21 días**
```
Título: 21 días, {nombre}. Ya forma parte de ti. (43 chars + nombre)
Cuerpo:  Lo que empezó como disciplina ya es parte de tu rutina. Sigue. (63 chars)
Trigger: Core Loop completado. racha == 21.
Deep link: Recompensa / pantalla de hito
```

**Racha 30 días**
```
Título: Un mes. Extraordinario, {nombre}. (35 chars + nombre)
Cuerpo:  30 días de constancia. {avatar_nombre} ha alcanzado un nuevo poder. En {clinica} lo saben.
Trigger: Core Loop completado. racha == 30.
Deep link: Recompensa / pantalla de hito
```

> ⚠️ **Nota:** El cuerpo de la notificación de racha 30 supera los 90 chars si todas
> las variables son largas. Alternativa más corta:
> *"30 días. {avatar_nombre} ha evolucionado. Abre para verlo."* (50 chars + avatar)

---

### 3.2 Subida de fase del avatar

*Solo para subidas de fase (no de nivel). Las de nivel se celebran dentro de la app.*

**Variante única (siempre se personaliza con nombre y fase)**
```
Título: {avatar_nombre} ha evolucionado. (34 chars + avatar)
Cuerpo:  {nombre}, ¡es hora de verlo! {nombre_fase} desbloqueado. (56 chars + nombre + fase)
Trigger: El avatar sube de fase (event-driven).
Deep link: Pantalla de recompensa / evolución
```

---

### 3.3 Re-Auditoría disponible

*Recordatorio de que han pasado las semanas programadas desde la última Auditoría.*

**Variante A**
```
Título: Tu próxima Auditoría está lista. (34 chars)
Cuerpo:  {nombre}, es hora de ver cuánto has mejorado. Los números no mienten. (70 chars + nombre)
Trigger: N semanas desde última Auditoría (configurable por clínica).
Deep link: Pantalla de Auditoría
```

**Variante B**
```
Título: Han pasado {semanas} semanas, {nombre}. (40 chars + semanas + nombre)
Cuerpo:  Tu Auditoría está lista. Veamos cómo está tu cuerpo hoy. (57 chars)
Trigger: N semanas desde última Auditoría.
Deep link: Pantalla de Auditoría
```

---

## 4. Notificación de respuesta del fisio (opcional — fase post-MVP)

*Cuando el fisio comenta o ajusta el programa. Refuerza la autoridad clínica.*

```
Título: {fisio} ha revisado tu progreso. (33 chars + fisio)
Cuerpo:  Tiene un mensaje para ti. (25 chars)
Trigger: El fisio registra una acción en el panel (ajuste de rutina, comentario).
Deep link: Pantalla de mensajes / perfil del paciente
```

> ⚠️ **Marcar como fase post-MVP.** Requiere sistema de mensajería entre fisio y
> paciente. No implementar en el MVP inicial.

---

## Checklist de calidad (aplicar a cada notificación antes de implementar)

- [ ] ¿El título es ≤ 45 caracteres con las variables en su valor más largo?
- [ ] ¿El cuerpo es ≤ 90 caracteres con las variables en su valor más largo?
- [ ] ¿Se menciona al avatar o al fisio (no es un mensaje genérico de la app)?
- [ ] ¿Si la lee alguien que lleva días sin entrenar, ¿se siente acogido o culpable?
- [ ] ¿Tiene sentido el deep link (abre la pantalla correcta para el contexto)?
- [ ] ¿Es coherente con el tono de `microcopy-app.md`?

---

## Frecuencias recomendadas (para el piloto)

| Tipo | Frecuencia máxima | Notas |
|------|------------------|-------|
| Recordatorio diario | 1×/día | Solo si no completó el Core Loop |
| Reenganche día 2 | 1 vez | No repetir hasta nuevo ciclo |
| Reenganche día 3 | 1 vez | Tono más emocional (Guardián) |
| Reenganche día 5+ | 1×/2 días | No saturar; reducir si sigue inactivo |
| Hito de racha | 1 vez por hito | Event-driven, inmediato |
| Subida de fase | 1 vez por fase | Event-driven, inmediato |
| Re-Auditoría | 1×/semana (hasta que la haga) | Máx. 3 recordatorios por ciclo |

> Estas frecuencias son orientativas. Hay que validarlas con datos del piloto:
> tasa de apertura, tasa de opt-out y tasa de conversión a Core Loop completado.
