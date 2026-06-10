# Roadmap de Creación — Anti Frágil

> Cómo se construye Anti Frágil, paso a paso y en orden.
> El dueño del proyecto define las prioridades; Claude estima el esfuerzo.
> Las estimaciones son orientativas y para **un equipo pequeño** (1-2 devs + 1 diseñador/ilustrador).
>
> **Qué construir (alcance completo):** ver [`PROPUESTA_DE_VALOR.md`](PROPUESTA_DE_VALOR.md) §6.
> **Cómo evoluciona el avatar:** ver [`diseño/avatar-evolucion.md`](diseño/avatar-evolucion.md).

---

## Estado actual

| Fase | Descripción | Estado | Fecha objetivo |
|------|-------------|--------|----------------|
| **Fase 0** | Boceto / cimientos (este repo: visión, arquitectura, modelo de datos, esqueleto) | ✅ Completado | 2026-06-10 |
| **Fase 1** | MVP v1.5 funcional (app paciente + panel clínica) | ⬜ Pendiente | A definir con presupuesto |
| **Fase 2** | "La Nevera" (lo aplazado conscientemente del MVP) | ⬜ Pendiente | Post-validación |
| **Fase 3** | "Visión Norte" (las Piezas Maestras: IA, biomarcadores, Instituto) | ⬜ Pendiente | Largo plazo |

**Leyenda:** ✅ Completado · 🔄 En progreso · ⬜ Pendiente · ⏸️ En pausa · ❌ Cancelado

---

## FASE 0 — Cimientos (✅ hecho hoy)

Lo que ya está listo en este repositorio, para que un equipo pueda arrancar sin
ambigüedad:

- ✅ Visión y decisiones cerradas (`SYSTEM_VISION.md`, D1–D6).
- ✅ Stack elegido y justificado (`docs/decisiones/ADR-001`, `ADR-002`).
- ✅ Modelo de datos completo (`docs/ARQUITECTURA.md`).
- ✅ Esquema SQL inicial multi-clínica (`supabase/migrations/0001_esquema_inicial.sql`).
- ✅ Esqueleto Flutter del flujo principal (`app/lib/`).

**Siguiente paso del dueño:** usar este repo para **pedir presupuesto a equipos de
desarrollo** y, en paralelo, montar el Pitch Deck sobre esta misma base.

---

## FASE 1 — MVP v1.5 (lo que se construye primero)

> El objetivo: una app que un paciente real de una clínica pueda usar a diario, y un
> panel donde el fisio gestione. Nada más. Esto es lo que valida el negocio.

Sugerencia de orden de construcción en **sprints** (bloques de ~2 semanas):

### Sprint 1 — Cimientos técnicos
- [ ] Instalar Flutter + crear proyecto Supabase real.
- [ ] Aplicar el esquema SQL `0001` y activar las reglas de seguridad (RLS).
- [ ] Login (email + Código de Honor) y vinculación paciente ↔ clínica.
- **Resultado:** un usuario puede entrar y queda ligado a su clínica.

### Sprint 2 — Onboarding y Auditoría
- [ ] Anamnesis + test físico interactivo (3-4 micro-vídeos).
- [ ] Cálculo de la Auditoría de Vitalidad (1-100).
- [ ] Creación del avatar "Huevo Nivel 1" + "Sombrero Seleccionador" (elegir 1 de 3).
- **Resultado:** el usuario nuevo termina con su Guardián asignado.

### Sprint 3 — Core Loop diario
- [ ] Triaje diario (dolor/energía).
- [ ] Reproductor de rutinas (Packs con vídeos de Vimeo/AWS).
- [ ] Feedback RPE obligatorio post-sesión.
- **Resultado:** el paciente puede completar su rutina diaria de principio a fin.

### Sprint 4 — Gamificación (núcleo de retención)
- [ ] Dashboard con avatar, barra de XP y racha.
- [ ] Motor de evolución (XP→nivel→fase con puertas clínicas): **30 fases en 6 etapas mayores**. Base en `app/lib/features/dashboard/avatar_evolucion.dart`.
- [ ] Retos Maestros + estado Legendario (Trinidad del Nivel 100).
- [ ] Desbloqueo de items/medallas (incluido el desbloqueo por pago en clínica).
- [ ] Integración de los **placeholders de avatar** (6 bases × arquetipo; arte real lo entrega el ilustrador — D5).
- **Resultado:** el avatar evoluciona reflejando el progreso clínico real. Ver [`diseño/avatar-evolucion.md`](diseño/avatar-evolucion.md).

### Sprint 5 — Panel web de la clínica
- [ ] Alta de pacientes + generación de Código de Honor.
- [ ] Librería de vídeos + creación de Packs.
- [ ] Prescripción de Packs a pacientes.
- [ ] Panel de semáforos (rojo si dolor alto o molestia nueva).
- **Resultado:** la clínica puede operar de forma autónoma.

### Sprint 6 — Motor viral y económico
- [ ] Monedero "Descuento Sudado" (visual) + lógica de rachas.
- [ ] Referidos con código único.
- [ ] Tarjetas Épicas compartibles (Instagram/TikTok).
- [ ] Banners de upselling → redirección a web/WhatsApp de la clínica.
- **Resultado:** la app crece sola y empuja al cross-selling.

### Sprint 7 — Pulido y lanzamiento piloto
- [ ] Pruebas con una clínica real (piloto).
- [ ] Corrección de errores + ajuste de textos y diseño.
- [ ] Publicación en App Store / Google Play.
- **Resultado:** MVP en manos de pacientes reales.

---

## FASE 2 — "La Nevera" (aplazado conscientemente)

> Funcionalidades que el propio MVP v1.5 dejó fuera **a propósito** para controlar coste
> y tiempo. Se construyen tras validar el MVP, no antes.

- [ ] Pasarela de pago in-app (Stripe / IAP) — por ahora todo pago es externo (D6).
- [ ] Comunidad social interna (ligas de empresas, muros) — la viralidad vive fuera.
- [ ] Integración básica con wearables (Apple Health / Google Fit) para datos automáticos.

---

## FASE 3 — "Visión Norte" (las Piezas Maestras)

> La ambición que convierte la app en un cambio de industria. Inspira a inversores y al
> equipo, pero **no se programa ahora**: requiere una base de miles de usuarios y madurez
> del producto. Aquí queda registrada para no perderla.

- [ ] **Avatar Consciente (IA generativa):** el Guardián habla y razona con tus datos.
- [ ] **Inclusividad biológica:** modos Embarazo, Lesión Crónica, Discapacidad —
      protocolos adaptados a cada biología.
- [ ] **Instituto Anti Frágil:** estudios científicos con datos 100% anónimos;
      monetización ética de datos estadísticos (universidades, aseguradoras).
- [ ] **Biomarcadores de longevidad:** integración de analíticas/biosensores (glucosa,
      VO2 máx) → "Auras de Longevidad" para usuarios élite.

---

## Lo que NO vamos a hacer (y por qué)

> Tan importante como lo que sí haremos. Evita que se reabran debates ya cerrados.

- **IA generativa en el MVP** — coste y tiempo desproporcionados para validar el negocio. (→ Fase 3)
- **Wearables/biosensores en el MVP** — el feedback es 100% manual al principio. (→ Fase 2/3)
- **Pagos dentro de la app** — el cobro se gestiona fuera (web/recepción). (Decisión D6)
- **Red social interna** — la viralidad ocurre en redes externas (Instagram/TikTok).
- **Arte de avatares con IA** — lo hace un ilustrador humano (Decisión D5).
