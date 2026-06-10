# Dossier de Desarrollo — Anti Frágil

> Documento para solicitar presupuesto a equipos de desarrollo (estudios o freelancers).
> Resume **qué es el producto, qué hay que construir, con qué tecnología, en qué orden
> y qué esperamos del equipo**. La visión completa está en
> [`PROPUESTA_DE_VALOR.md`](PROPUESTA_DE_VALOR.md) y el plan en [`ROADMAP.md`](ROADMAP.md).

---

## 1. Resumen del producto (en 60 segundos)

**Anti Frágil** es un ecosistema **app móvil + panel web de clínica** que resuelve el
mayor problema de la salud física: **la gente abandona**. En vez de castigar (rachas
rotas, culpa), convierte la recuperación en un juego con sentido clínico.

Cada paciente tiene un **Guardián digital (avatar)** que evoluciona con su progreso real
(constancia + mejora medible) y se apaga si lo abandona. Detrás, su fisioterapeuta le
prescribe rutinas, vigila su dolor en tiempo real y le acompaña.

- **Modelo de negocio:** B2B2C. Las clínicas pagan por usar la herramienta con sus
  pacientes; el avatar y los banners empujan a reservar sesiones presenciales.
- **Estado actual:** fase de cimientos completada (visión, decisiones de arquitectura,
  modelo de datos y esquema de base de datos inicial ya definidos en este repositorio).
- **Lo que pedimos presupuestar:** la construcción del **MVP v1.5** descrito abajo.

---

## 2. Alcance del MVP v1.5 (lo que entra en este presupuesto)

El MVP tiene **tres componentes**:

### A) App del paciente (móvil — iOS y Android)
- Onboarding con vinculación a la clínica mediante "Código de Honor".
- **Auditoría de Vitalidad** (test físico inicial 1-100), **configurable por el
  profesional** según su especialidad.
- "Sombrero Seleccionador": asignación de arquetipo y elección de 1 de 3 Guardianes.
- Avatar/Guardián evolutivo (**30 fases en 6 etapas**) ligado al progreso clínico real.
- Dashboard de gamificación (avatar + barra de experiencia + racha).
- Triaje diario (dolor 1-10 y energía 1-10).
- Reproductor de rutinas en vídeo (Packs prescritos por la clínica).
- Feedback de esfuerzo (RPE) tras cada sesión, con alerta a la clínica si hay molestia nueva.
- Monedero visual "Descuento Sudado" (sin pago dentro de la app).
- Sistema de referidos y "Tarjetas Épicas" compartibles en redes sociales.
- Banners de upselling hacia la web/WhatsApp de la clínica.

### B) Panel web de la clínica
- Login profesional.
- Alta de pacientes + generación de Código de Honor.
- Ficha del paciente (test inicial, histórico de dolor, feedback post-sesión).
- **Panel de semáforos** (alerta en rojo ante dolor alto o molestia nueva).
- Librería de vídeos de ejercicios + creación y prescripción de Packs.
- Gestión de **plantillas de Auditoría** propias del profesional.

### C) Backend y datos
- Base de datos **multi-clínica** con aislamiento de datos entre clínicas.
- Autenticación de pacientes y profesionales.
- Almacenamiento de imágenes (avatares, miniaturas).
- Motor de evolución del avatar (convierte progreso real en fases).

### Fuera de alcance del MVP (NO presupuestar)
Para controlar coste y tiempo se aplazan a propósito: pago dentro de la app, comunidad
social interna, integración con wearables, IA generativa y biomarcadores. Detalle y
motivos en [`ROADMAP.md`](ROADMAP.md) (Fases 2 y 3).

---

## 3. Stack tecnológico (ya decidido — no es negociable de partida)

> El stack está cerrado por decisiones de arquitectura propias. Buscamos un equipo que
> domine estas herramientas, no que proponga otras (salvo objeción técnica fundada).

| Capa | Tecnología | Por qué |
|------|------------|---------|
| **App móvil + panel web** | **Flutter** (Dart) | Un solo código para iOS, Android y web. |
| **Backend / base de datos** | **Supabase** (PostgreSQL) | Autenticación, base de datos, almacenamiento y reglas de seguridad por clínica (RLS). |
| **Vídeo** | **Vimeo / AWS** | Alojamiento y streaming de las rutinas de ejercicios. |
| **Repositorio** | **GitHub** | Fuente de verdad del código; ya contiene los cimientos. |

**Lo que el equipo recibe ya hecho:** visión documentada, decisiones de arquitectura,
modelo de datos completo, esquema de base de datos inicial multi-clínica y un esqueleto
del flujo principal en Flutter.

---

## 4. Entregables por sprint

> Sprints de ~2 semanas, pensados para un equipo pequeño (1-2 desarrolladores +
> 1 diseñador/ilustrador). El orden es nuestra recomendación; aceptamos ajustes razonados.

| Sprint | Entregable | Resultado verificable |
|--------|-----------|------------------------|
| **1 — Cimientos** | Proyecto Flutter + Supabase real, esquema y reglas de seguridad aplicados, login + vinculación paciente↔clínica. | Un usuario entra y queda ligado a su clínica. |
| **2 — Onboarding y Auditoría** | Anamnesis + test físico, cálculo de Vitalidad (1-100), creación del avatar y elección de Guardián. | El usuario nuevo termina con su Guardián asignado. |
| **3 — Core Loop diario** | Triaje diario, reproductor de rutinas, feedback RPE obligatorio. | El paciente completa su rutina diaria de principio a fin. |
| **4 — Gamificación** | Dashboard, motor de evolución (30 fases con puertas clínicas), medallas y desbloqueos, integración de placeholders de avatar. | El avatar evoluciona reflejando el progreso clínico real. |
| **5 — Panel de clínica** | Alta de pacientes, librería de vídeos, creación/prescripción de Packs, panel de semáforos. | La clínica opera de forma autónoma. |
| **6 — Motor viral y económico** | Monedero "Descuento Sudado", referidos, Tarjetas Épicas, banners de upselling. | La app crece sola y empuja al cross-selling. |
| **7 — Pulido y piloto** | Pruebas con una clínica real, corrección de errores, publicación en App Store y Google Play. | MVP en manos de pacientes reales. |

---

## 5. Qué esperamos del equipo

- **Metodología ágil** con entregas demostrables al final de cada sprint (no "todo al final").
- **Trabajo sobre nuestro GitHub**, con ramas y Pull Requests; nada se mezcla sin revisión.
- **Comunicación en lenguaje claro:** el dueño del producto no es técnico; necesitamos
  explicaciones de impacto, no jerga.
- **Código mantenible y documentado**, de modo que otro equipo pueda continuarlo.
- **Pruebas en dispositivos reales** (iOS y Android) antes de cada entrega.
- **Publicación en las tiendas** (gestión de cuentas de desarrollador, revisión y subida).
- **Estimación honesta** de tiempo y coste por sprint, con margen para imprevistos.
- **Garantía / soporte** de corrección de errores durante un periodo tras el lanzamiento.

---

## 6. Criterios de selección del equipo

1. **Experiencia demostrable en Flutter** (apps publicadas en las tiendas — pedir enlaces).
2. **Experiencia con Supabase o PostgreSQL** y con modelos de datos multi-cliente.
3. **Capacidad de diseño/UX** o colaboración fluida con nuestro diseñador.
4. **Referencias y portfolio** de proyectos similares (salud, fitness o gamificación, ideal).
5. **Claridad y rapidez de comunicación** durante la propia fase de presupuesto (es señal).
6. **Relación calidad/precio** y transparencia en el desglose, no solo el precio total.
7. **Disponibilidad y compromiso** con el calendario propuesto.

---

## 7. Preguntas clave que les haremos

**Sobre el equipo y la experiencia**
- ¿Cuántas apps en Flutter habéis publicado? ¿Podemos verlas en las tiendas?
- ¿Habéis trabajado antes con Supabase y con datos separados por cliente/empresa?
- ¿Quién formaría el equipo y con qué dedicación (completa o parcial)?

**Sobre el proceso**
- ¿Cómo organizáis el trabajo y cada cuánto entregáis algo que podamos probar?
- ¿Cómo gestionáis los cambios de alcance durante el proyecto?
- ¿Cómo nos comunicáis el avance si no somos técnicos?

**Sobre tiempo y dinero**
- ¿Cuál es vuestra estimación de tiempo y coste **por sprint** y total del MVP?
- ¿La estimación es cerrada o por horas? ¿Qué pasa si algo se complica?
- ¿Qué incluye exactamente el precio (diseño, publicación en tiendas, infraestructura)?

**Sobre el cierre y el después**
- ¿El código queda 100% en nuestro GitHub y es nuestro sin ataduras?
- ¿Qué garantía/soporte ofrecéis tras el lanzamiento y con qué coste?
- ¿Podríais continuar con las Fases 2 y 3, o dejarlo listo para otro equipo?

---

*Documento de captación de presupuesto. Para profundizar: visión y alcance completo en
[`PROPUESTA_DE_VALOR.md`](PROPUESTA_DE_VALOR.md); plan y fases en [`ROADMAP.md`](ROADMAP.md).*
