# Personalización y detalles — el alma del producto

> Principio rector del producto. Anti Frágil lo hacen **profesionales de la salud**, y el
> cliente debe sentir que **todo está hecho para él**. La diferencia no está en una función
> grande: está en **mil detalles** que, juntos, hacen sentir "esto me entiende y me cuida".
> Este documento guía TODAS las decisiones de diseño. Si una pantalla se siente genérica,
> está mal hecha.

---

## 1. Las dos columnas que sostienen el producto

1. **Autoridad clínica (somos sanitarios).** No es una app de fitness: detrás hay un
   profesional real que prescribe, vigila y responde. Eso debe **notarse** en cada pantalla.
2. **Personalización máxima.** Nada es genérico. El contenido, el tono, el avatar y los
   mensajes se adaptan a **esta** persona concreta y a **su** momento.

> La magia surge cuando se combinan: *"mi fisioterapeuta, a través de esta app, me conoce
> y me acompaña a mí."*

---

## 2. Las 4 capas de personalización

| Capa | Qué personaliza | De qué dato sale |
|------|-----------------|------------------|
| **Identidad** | Nombre del paciente, marca de su clínica, su fisio. | `pacientes`, `clinicas.marca`, `profesionales` |
| **Clínica** | Su Auditoría, su arquetipo, su rutina prescrita, su dolor. | `auditorias`, `avatares.arquetipo`, `prescripciones`, `triajes` |
| **Progreso** | Su avatar, su nivel/fase, su racha, sus retos. | `avatares`, `avatar_retos` |
| **Emocional** | El tono del mensaje según cómo está hoy. | `triajes` (dolor/energía), `feedback_rpe` |

---

## 3. Detalles concretos, pantalla por pantalla

> Ejemplos de "el detalle que marca la diferencia". Editable y ampliable.

**Onboarding**
- Saluda por su nombre y nombra su clínica: *"Bienvenido, Javi. La Clínica X te acompaña."*
- El avatar **nace de SU Auditoría**, no de un catálogo. Se le dice: *"Tu Guardián ha nacido de tu test de hoy."*
- El arquetipo se le explica en su lenguaje: *"Por tu perfil, eres del agua: movilidad y fluidez."*

**Dashboard**
- El avatar reacciona a su realidad: si ayer durmió/reportó mal, hoy tiene gesto de cansancio (sin IA: por lógica del triaje).
- Mensaje del día personalizado por su racha: *"23 días seguidos, Javi. Tu zona lumbar lo nota."*

**Triaje**
- Recuerda lo último: *"Ayer el dolor bajó a 4. ¿Cómo amanece hoy?"*
- Si reporta dolor alto: tono de cuidado, no de exigencia, y **avisa a su fisio** (se le dice que se le avisó).

**Rutina**
- Se muestra **quién** la prescribió: *"Tu fisio, la Dra. X, te ha preparado esta rutina."* (autoridad clínica).
- Adaptación: si hoy hay dolor, propone la versión suave del Pack.

**Feedback**
- Cierra el círculo humano: *"Gracias. La Dra. X verá esto y ajustará si hace falta."*

**Re-Auditoría (el momento "wow")**
- Le enseña SUS números mejorando: *"Hace 6 semanas: 58. Hoy: 67. +9 de vitalidad."* Con su avatar evolucionando.

**Tarjetas Épicas**
- Llevan su nombre, su nivel y un logro **suyo** concreto, no una frase genérica.

---

## 4. Tono y lenguaje (guía rápida)

- **Cálido y profesional**, nunca infantil ni frío. Somos sanitarios, no un juego tonto.
- **Nunca culpar.** "Hoy toca cuidarse" en lugar de "has fallado".
- **Hablar de SU cuerpo y SU objetivo**, con los datos que él mismo dio.
- **El profesional, presente**: nombrarlo, mostrar que revisa, que está al otro lado.

> Detalle clave: cada texto debería poder leerse y que el paciente piense *"esto está
> escrito para mí"*. Si suena a plantilla, reescribir.

---

## 5. Cómo lo soporta el sistema (sin sobre-coste)

- La personalización del MVP es por **lógica condicional + datos**, no IA (la IA es Visión Norte).
- La configurabilidad por profesional (D7) es parte de la personalización: cada clínica
  adapta tests y rutinas → el paciente recibe algo hecho a su medida real.
- Recomendación: tener una **capa de "mensajes" centralizada** (plantillas con variables:
  nombre, racha, dolor, nombre del fisio…) para que personalizar sea fácil y consistente.

---

## 6. Regla de oro para el equipo

> Antes de dar por buena una pantalla, preguntarse: **¿esto se siente hecho para ESTA
> persona, por un profesional que la conoce? ¿O se siente genérico?** Si es genérico, no
> está terminado. El producto se gana en los detalles.
