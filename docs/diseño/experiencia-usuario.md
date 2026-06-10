# Experiencia de usuario (UX) — la prioridad #1 del MVP

> **Decisión del dueño:** lo principal del MVP es la **experiencia de usuario, lo visual y
> la personalización.** Un MVP con menos funciones pero una experiencia impecable vale más
> que uno completo y mediocre. Este documento manda en cualquier disyuntiva de producto.
> Complementa `personalizacion-y-detalles.md` (el qué) con el **cómo se siente**.

---

## 1. La sensación objetivo

Cuando alguien usa Anti Frágil, debe sentir tres cosas, en este orden:

1. **"Esto me entiende"** (personalización + empatía clínica).
2. **"Esto es bonito y cuidado"** (visual premium, no una app médica fría).
3. **"Quiero volver mañana"** (gamificación con sentido + aversión a la pérdida).

> Si una pantalla no aporta a una de las tres, sobra o está mal resuelta.

---

## 2. Principios de UX (innegociables en el MVP)

- **Rapidez:** el Core Loop diario (triaje→rutina→feedback) en **el mínimo de toques**. Nada
  de formularios largos en el día a día.
- **Una cosa por pantalla:** foco claro, una acción principal evidente (un botón que destaca).
- **Cero culpa:** copys y estados que acompañan, nunca regañan. Incluso al fallar.
- **Feedback inmediato:** cada toque responde (animación, cambio visual). El usuario nunca
  duda de si "funcionó".
- **Continuidad:** el avatar, la racha y el tono viajan con el usuario por toda la app
  (coherencia emocional).
- **Accesible:** texto legible, contraste suficiente, objetivos táctiles grandes, no depender
  solo del color (los semáforos llevan también texto/icono).

---

## 3. Momentos clave (donde se gana o se pierde al usuario)

| Momento | Por qué es crítico | Qué debe pasar |
|---------|--------------------|----------------|
| **Primer arranque** | Decide si sigue o abandona. | Onboarding corto + "nace tu Guardián de TU test" = enganche inmediato. |
| **El avatar evoluciona** | Es la recompensa que retiene. | Celebración visual clara (animación, brillo), nunca pasar desapercibida. |
| **Re-Auditoría (el "wow")** | Prueba tangible de mejora. | Mostrar SUS números subiendo + avatar cambiando. Momento emocional. |
| **Día con dolor** | Riesgo de abandono. | Empatía: adaptar la rutina, no exigir. Sentirse cuidado. |
| **Volver tras fallar** | Recuperar al que se fue. | Bienvenida cálida, recuperar brillo fácil. Sin reproche. |

---

## 4. Microinteracciones y detalles visuales (el acabado "premium")

- Transiciones suaves entre pantallas (no cortes secos).
- Botón principal con peso visual claro; secundarios discretos.
- Estados de los elementos: normal / pulsado / hecho (ej. el ejercicio marcado se atenúa).
- El avatar **siempre vivo**: leve animación de "respira", brillo según su estado.
- Celebraciones proporcionadas: subir de sub-fase = pequeño; subir de etapa mayor = grande.
- Tipografía cálida para títulos, legible para cuerpo (ver `IDENTIDAD_VISUAL.md`).

---

## 5. Personalización visible en cada pantalla

Resumen operativo (detalle en `personalizacion-y-detalles.md`):
- Nombre del paciente, su clínica y su fisio presentes y reales.
- Contenido = SU rutina, SU dolor, SU progreso. Nunca datos genéricos.
- Tono adaptado a su estado de hoy (triaje).

> Regla de oro: si una pantalla se podría copiar tal cual a otro usuario sin cambiar nada,
> **no está personalizada.**

---

## 6. Cómo lo verificamos (no es opinable)

Antes de dar una pantalla por terminada, pasa este checklist:
- [ ] ¿Se entiende la acción principal en < 2 segundos?
- [ ] ¿Responde a cada toque con feedback visual?
- [ ] ¿Usa los datos reales del usuario (nombre, fisio, progreso)?
- [ ] ¿El tono acompaña (cero culpa)?
- [ ] ¿Es coherente visualmente con el resto (paleta, tipografía, espaciados)?
- [ ] ¿Funciona bien en una pantalla de móvil real (táctil, legible)?

> El prototipo navegable (`mockups/prototipo/`) es el campo de pruebas de todo esto.
