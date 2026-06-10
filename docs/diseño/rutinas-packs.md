# Rutinas y Packs (prescripción) — Anti Frágil

> Cómo el profesional crea ejercicios, los agrupa en "Packs" (protocolos) y se los prescribe
> al paciente, que los hace en el Core Loop diario. Pieza MVP (A7 · B5 · B6).
> Igual que la Auditoría (D7), el **contenido lo configura cada profesional**; el producto
> solo pone el marco. Diseño editable.

---

## 1. Las tres piezas

| Pieza | Qué es | Quién la crea |
|-------|--------|---------------|
| **Vídeo** | Un ejercicio grabado (enlace a Vimeo/AWS) con su objetivo. | El profesional / clínica. |
| **Pack** | Un protocolo = varios vídeos en orden (ej. "Lumbares fase 1"). | El profesional. |
| **Prescripción** | Asignar un Pack a un paciente concreto, con vigencia. | El profesional. |

> El paciente nunca elige el tratamiento: **lo prescribe su profesional**. Eso es lo que
> separa Anti Frágil de una app de fitness genérica (autoridad clínica).

---

## 2. Flujo del profesional (panel web)

```
1. Sube/registra vídeos en su Librería (título, enlace, objetivo: zona/músculo/propósito).
2. Crea un Pack y mete vídeos en orden (con series/repes o duración por ejercicio).
3. Prescribe el Pack a un paciente → aparece como "tu rutina de hoy" en la app.
4. Ajusta o cambia el Pack según el feedback RPE y los semáforos que va viendo.
```

## 3. Flujo del paciente (app)

```
Dashboard → "Tu rutina de hoy" → reproduce los vídeos del Pack en orden →
marca cada ejercicio como hecho → al acabar, Feedback RPE → suma XP.
```

---

## 4. Configurable por profesional (D7)

- Cada clínica tiene **su propia librería** de vídeos y **sus propios Packs** (no se mezclan
  entre clínicas — aislamiento multi-tenant).
- Un Pack puede marcarse como **plantilla reutilizable** (ej. "Cervicalgia básica") y
  prescribirse a muchos pacientes, o crearse **a medida** para uno.
- Parámetros por ejercicio (series, repeticiones, duración, descanso) son campos editables.

---

## 5. Cómo se guarda (ya en el modelo de datos)

- `videos` — catálogo por clínica (enlace + objetivo).
- `packs` + `pack_videos` — el protocolo y su orden.
- `prescripciones` — qué Pack tiene asignado cada paciente y su vigencia.
- `sesiones` + `feedback_rpe` — cada vez que lo hace y cómo le fue.

Ver `supabase/migrations/0001_esquema_inicial.sql`. El reproductor vive en
`app/lib/features/rutinas/` y la gestión en `app/lib/features/clinica/`.

---

## 6. Nota MVP (mantener el alcance controlado)

- El MVP reproduce vídeos en orden y registra lo hecho. **Sin** ejercicios interactivos con
  visión artificial ni conteo automático de repeticiones (eso es Visión Norte — Fase 3).
- Los parámetros avanzados (progresión automática de cargas, periodización) se dejan para
  después: el MVP valida primero que el bucle prescribir → hacer → feedback funciona.
