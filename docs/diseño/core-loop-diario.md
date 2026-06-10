# El Core Loop Diario — Anti Frágil

> El ciclo que el paciente repite **cada día**. Es el corazón del producto: si este bucle
> engancha y es amable, hay adherencia; si frustra, hay abandono. Aquí se define paso a
> paso, cómo se reparten los Puntos de Vitalidad y cuándo se avisa a la clínica.
>
> Diseño editable. Los valores de puntos y umbrales los afina el equipo con datos del piloto.

---

## 1. El bucle de un vistazo

```
   Abre la app
        │
        ▼
  ① TRIAJE  ──►  ② DASHBOARD  ──►  ③ RUTINA  ──►  ④ FEEDBACK RPE  ──►  ⑤ RECOMPENSA
  dolor/energía   avatar+XP+racha   vídeos Pack    esfuerzo+molestia    XP, racha, ¿evoluciona?
        │                                              │
        └───────────► (si dolor alto) ────────────────┴──► 🚨 SEMÁFORO a la clínica
```

Todo el ciclo está pensado para durar **pocos minutos** y dejar al paciente con una
sensación de logro, no de deber cumplido a regañadientes.

---

## 2. Paso a paso

### ① Triaje diario (al abrir)
- Popup corto: **Dolor (1-10)** y **Energía (1-10)**. Un toque cada uno.
- Se guarda en `triajes`. Es la primera microvictoria del día (ya suma algo de XP).
- **Adaptación empática:** si reporta dolor alto o energía muy baja, la app **suaviza** el
  día (sugiere una rutina más ligera o de movilidad) en vez de exigir. *No culpa.*

### ② Dashboard
- El avatar al centro (su fase actual), barra de XP hacia el siguiente nivel, contador de racha.
- Acceso claro a "tu rutina de hoy".

### ③ Rutina (Pack prescrito)
- Reproduce los vídeos del Pack que le asignó su profesional (Vimeo/AWS), en orden.
- Puede marcar cada ejercicio como hecho. La sesión se registra en `sesiones`.

### ④ Feedback RPE (obligatorio al terminar)
- **Esfuerzo percibido (RPE 1-10)** + **¿molestia nueva? (sí/no)** + nota opcional.
- Se guarda en `feedback_rpe`. Cierra el ciclo y **alimenta a la clínica**.

### ⑤ Recompensa
- Suma de **Puntos de Vitalidad**, actualización de **racha**, y comprobación de si el
  avatar **evoluciona** (motor en `avatar_evolucion.dart`).
- Si desbloquea fase/ítem → momento de celebración visual (lo que engancha).

---

## 3. Economía de Puntos de Vitalidad (XP) — borrador editable

> Regla de oro (coherente con el avatar): **la mejora real vale más que la mera actividad.**

| Acción | XP orientativo | Frecuencia |
|--------|----------------|-----------|
| Completar el triaje | 5 | 1×/día |
| Completar la rutina prescrita | 20 | según prescripción |
| Dar el feedback RPE | 5 | por sesión |
| Bonus de racha | +2 por día de racha (tope +20) | diario |
| Superar un Reto Maestro | 150 | puntual |
| Mejorar en una re-Auditoría | 100 + 10 por punto ganado | cada 4-6 sem |

**Por qué estos pesos:** las acciones diarias dan poco (presentarse es lo mínimo); los
hitos de **mejora real** (retos, re-auditorías) dan mucho. Así el nivel sube sobre todo
cuando el paciente progresa de verdad, no por repetir clics.

---

## 4. Las rachas (constancia sin tiranía)

- La racha cuenta **días con al menos triaje + algo de actividad**.
- **Día de descanso prescrito** o **dolor alto reportado** → la racha **se protege** (no se
  rompe por descansar cuando toca). Esto es clave: premiamos constancia inteligente, no
  machaque.
- Si falla un día sin justificación, la racha se **pausa y reinicia** suavemente, sin drama.

---

## 5. Semáforos: cuándo se avisa a la clínica 🚦

El profesional no vigila a mano: el sistema **levanta una bandera** cuando algo lo merece.
Reglas de ejemplo (editables por la clínica):

| Color | Se dispara cuando… | Acción |
|-------|--------------------|--------|
| 🔴 Rojo | Dolor ≥ 8 en el triaje **o** "molestia nueva" en el feedback. | Aparece arriba en el panel; la clínica contacta. |
| 🟡 Ámbar | Dolor 5-7 varios días **o** 3+ días sin actividad (riesgo de abandono). | Revisar; posible ajuste de Pack o mensaje. |
| 🟢 Verde | Constancia y dolor bajo. | Todo en orden. |

> Esto convierte la app en un **sistema de alerta temprana**: la clínica detecta recaídas y
> abandonos *antes* de perder al paciente. Es uno de los grandes argumentos de venta B2B.

---

## 6. Si abandona: reenganche amable (sin castigo)

Coherente con la "empatía clínica" y con el diseño del avatar:

- A los **3 días** sin actividad → notificación cálida ("Tu Guardián te echa de menos").
- El avatar entra en estado **aletargado** (pierde brillo), no muere.
- Al volver: bienvenida y un camino fácil para recuperar el brillo. **Nunca** una regañina.
- La clínica lo ve en ámbar y puede dar un empujón humano (llamada, mensaje).

---

## 7. Dónde vive esto en el proyecto

- Pantallas: `app/lib/features/triaje/`, `rutinas/`, `feedback/`, `dashboard/`.
- Economía de puntos y rachas: `app/lib/features/dashboard/economia_puntos.dart`.
- Lógica de alertas/semáforos: `app/lib/features/clinica/alertas_semaforo.dart`.
- Evolución del avatar tras la recompensa: `app/lib/features/dashboard/avatar_evolucion.dart`.
- Datos: tablas `triajes`, `sesiones`, `feedback_rpe`, `avatares` (`supabase/migrations/0001…`).
