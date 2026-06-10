# Propuesta de Valor — Anti Frágil

> El corazón del proyecto. Por qué existe, para quién, qué lo hace único y **todo lo que
> hay que crear** para que funcione. Documento vivo: si cambia la visión, se actualiza aquí.

---

## 1. El problema (lo que está roto hoy)

La industria de la salud física tiene un agujero que cuesta millones: **la gente abandona**.

- El paciente hace fisioterapia, mejora… y en cuanto deja de tener dolor, deja de ir.
- Las apps de fitness castigan ("has fallado tu racha", "vas retrasado") → generan culpa → más abandono.
- El conocimiento del fisio se queda en la consulta; el paciente, en casa, está solo.

Resultado: **lesiones que vuelven, clínicas que pierden clientes recurrentes, y personas
que no consiguen ser constantes con su salud.** El problema no es la falta de información.
Es la **falta de adherencia** (que la gente siga, día tras día).

---

## 2. La solución (qué es Anti Frágil)

Anti Frágil es un **ecosistema híbrido (app + clínica)** que convierte la recuperación
física en algo que **engancha sin castigar**. Sustituye la culpa por **empatía clínica**
y la fuerza de voluntad por **un juego con sentido**.

El paciente tiene un **Guardián digital (avatar)** que **es el espejo honesto de su
progreso real**: evoluciona cuando él mejora y cuida su cuerpo, y se apaga si lo abandona.
Detrás, su clínica le prescribe rutinas, vigila su dolor y le acompaña.

> **En una frase:** Anti Frágil hace que cuidarte sea tan adictivo como un videojuego,
> pero respaldado por la autoridad de tu fisioterapeuta.

---

## 3. El mecanismo único (por qué funciona y nadie más lo hace igual)

La mayoría de apps usan UNO de estos resortes. Anti Frágil combina los **tres**, y ahí
está la diferencia:

1. **Gamificación con verdad clínica.** El avatar no sube por hacer clic: sube por
   **constancia real + mejora medible** (ver el sistema de fases del avatar en
   [diseño/avatar-evolucion.md](diseño/avatar-evolucion.md)). Esto crea **aversión a la
   pérdida**: nadie quiere ver morir a un Guardián que le ha costado meses.
2. **Empatía en lugar de castigo.** Si vienes de dormir mal o con dolor, la app **adapta**
   en vez de regañar. El usuario siente que el sistema **está de su lado**.
3. **Respaldo profesional (no eres tú solo).** Cada rutina viene prescrita por un
   profesional real, y la clínica ve tu dolor en tiempo real. Es la diferencia entre
   "una app" y "tu equipo de salud en el bolsillo".

**El foso defensivo (lo que te protege de la competencia):**
- **Datos clínicos reales** acumulados (dolor, recuperación, adherencia) → cada día más valiosos.
- **Relación con las clínicas** (canal B2B2C): entran cientos de pacientes prescritos de golpe.
- **Vínculo emocional con el avatar**: el coste de irse no es económico, es emocional.

---

## 4. Para quién (y qué gana cada uno)

| Actor | Qué gana |
|-------|----------|
| **Paciente** | Recupera su salud sin sentirse culpable; un acompañante que le entiende; constancia que no dependía de su fuerza de voluntad. |
| **Clínica / Profesional** | Retiene pacientes (ingreso recurrente), detecta recaídas a tiempo (semáforos), vende más servicios presenciales (upselling), y se diferencia de la clínica de al lado. |
| **El negocio (Anti Frágil)** | Ingresos por las clínicas aliadas + cross-selling + crecimiento viral barato (las Tarjetas Épicas traen usuarios sin pagar publicidad). |

---

## 5. Cómo se gana dinero (modelo de negocio)

> Recomendación de Claude para el Año 1: **no perseguir suscripciones masivas**, sino
> apoyarse en el canal de clínicas (cientos de pacientes prescritos) y el cross-selling.

1. **Canal B2B2C (núcleo Año 1):** las clínicas pagan por usar Anti Frágil con sus pacientes.
2. **Cross-selling a servicios físicos:** el avatar y los banners empujan a reservar
   sesiones presenciales (donde está el margen real de la clínica).
3. **Suscripción del paciente (Descuento Sudado):** cuota que baja con constancia y
   referidos. **El pago se gestiona fuera de la app** (decisión D6).
4. **Futuro (Fase 3):** monetización ética de datos anónimos (Instituto Anti Frágil),
   eventos, partners. Ver [ROADMAP.md](ROADMAP.md).

---

## 6. TODO LO QUE HAY QUE CREAR (inventario completo)

> El mapa de piezas del producto. Marca el alcance total. Lo que entra en el MVP v1.5
> está señalado con 🟢; lo aplazado, con ❄️ (Nevera, Fase 2) o 🔮 (Visión Norte, Fase 3).
> El orden de construcción está en [ROADMAP.md](ROADMAP.md).

### A) App del paciente (móvil — Flutter)

| # | Pieza | Qué es | Fase |
|---|-------|--------|------|
| A1 | **Onboarding + Código de Honor** | Alta del paciente vinculado a su clínica. | 🟢 MVP |
| A2 | **Auditoría de Vitalidad (1-100)** | Test físico inicial (fuerza, aeróbico, movilidad, constancia) del que nace el avatar. Diseño en [diseño/auditoria-vitalidad.md](diseño/auditoria-vitalidad.md). | 🟢 MVP |
| A3 | **Sombrero Seleccionador** | Asigna familia/arquetipo y deja elegir 1 de 3 Guardianes. | 🟢 MVP |
| A4 | **Avatar / Guardián (20 fases)** | El espejo del progreso. Sistema de evolución con sentido clínico. | 🟢 MVP |
| A5 | **Dashboard de gamificación** | Avatar al centro + barra de XP + racha. | 🟢 MVP |
| A6 | **Triaje diario** | Reporte de dolor (1-10) y energía (1-10). | 🟢 MVP |
| A7 | **Reproductor de rutinas (Packs)** | Vídeos prescritos por la clínica (Vimeo/AWS). | 🟢 MVP |
| A8 | **Feedback RPE post-sesión** | Esfuerzo + ¿molestia nueva? → alerta a la clínica. | 🟢 MVP |
| A9 | **Monedero "Descuento Sudado"** | Saldo visual que baja con rachas y referidos (sin pago in-app). | 🟢 MVP |
| A10 | **Referidos** | Código único de invitación. | 🟢 MVP |
| A11 | **Tarjetas Épicas** | Imagen compartible (avatar + nivel + frase) para Instagram/TikTok. | 🟢 MVP |
| A12 | **Banners de upselling** | Invitación a sesión presencial → web/WhatsApp de la clínica. | 🟢 MVP |
| A13 | **Pago in-app** | Pasarela dentro de la app. | ❄️ Nevera |
| A14 | **Modos vitales** (embarazo, lesión, discapacidad) | Protocolos adaptados a cada biología. | 🔮 Fase 3 |
| A15 | **Avatar consciente (IA)** | El Guardián habla y razona con tus datos. | 🔮 Fase 3 |
| A16 | **Biomarcadores** | Integración de wearables/analíticas (glucosa, VO2). | 🔮 Fase 3 |

### B) Panel web de la clínica (Flutter Web)

| # | Pieza | Qué es | Fase |
|---|-------|--------|------|
| B1 | **Login profesional** | Acceso del fisio/clínica. | 🟢 MVP |
| B2 | **Alta de pacientes + Código de Honor** | Dar de alta y generar el código de vinculación. | 🟢 MVP |
| B3 | **Ficha maestra del paciente** | Test inicial, histórico de dolor, feedback post-sesión. | 🟢 MVP |
| B4 | **Panel de semáforos** | Alertas en rojo si dolor alto o molestia nueva. | 🟢 MVP |
| B5 | **Librería de vídeos** | Catálogo de ejercicios (enlaces Vimeo/AWS). | 🟢 MVP |
| B6 | **Creación y prescripción de Packs** | Agrupar vídeos y asignarlos a pacientes. | 🟢 MVP |
| B7 | **Métricas de adherencia** | Cuánto cumplen los pacientes (panel de negocio). | ❄️ Nevera |

### C) Backend y datos (Supabase)

| # | Pieza | Qué es | Fase |
|---|-------|--------|------|
| C1 | **Base de datos multi-clínica** | Tablas + aislamiento por clínica (RLS). | 🟢 MVP |
| C2 | **Login / autenticación** | Gestión de usuarios (pacientes y profesionales). | 🟢 MVP |
| C3 | **Almacenamiento** | Imágenes de avatares, miniaturas. | 🟢 MVP |
| C4 | **Motor de evolución del avatar** | Lógica que convierte progreso real en fases. | 🟢 MVP |
| C5 | **Datos anónimos para investigación** | Base del "Instituto Anti Frágil". | 🔮 Fase 3 |

### D) Contenido y diseño (no es código — lo hacen personas)

| # | Pieza | Quién | Fase |
|---|-------|-------|------|
| D1 | **Arte de avatares** (20 fases × arquetipo) | Ilustrador humano (decisión D5). | 🟢 MVP |
| D2 | **Biblioteca de vídeos de ejercicios** | Los profesionales de la clínica. | 🟢 MVP |
| D3 | **Identidad visual de marca** | Diseñador (paleta, logo, tono). | 🟢 MVP |
| D4 | **Textos con tono "empatía clínica"** | Copywriting (mensajes que no culpan). | 🟢 MVP |

---

## 7. El manifiesto (el alma del producto)

> No construimos una app de rutinas. Construimos un **compañero** que convierte el miedo
> a la fragilidad en el orgullo de volverse antifrágil. Cada fase del avatar es una
> victoria real del paciente sobre su propio cuerpo. La nostalgia del que creció con
> criaturas que evolucionaban, puesta al servicio de la salud.

**El arte lo hace un humano. La empatía la pone el diseño. La verdad la pone la clínica.**
