# Arquitectura — Estado técnico del proyecto

> Documento vivo. Claude lo actualiza cuando cambia algo técnico relevante.
> Si quieres saber cómo está construido el proyecto, lee esto.

**Última actualización:** 2026-06-10 — Profundización del boceto: propuesta de valor, sistema de avatar (30 fases), catálogo de datos y panel de clínica.
**Mantenedor:** Claude (con validación del dueño del proyecto)

---

## Visión general

Anti Frágil se compone de **tres piezas** que comparten un mismo cerebro (Supabase):

```
┌─────────────────────┐         ┌─────────────────────┐
│   APP MÓVIL          │         │   PANEL WEB          │
│   (paciente)         │         │   (clínica)          │
│   Flutter            │         │   Flutter Web        │
└──────────┬──────────┘         └──────────┬──────────┘
           │                                │
           └──────────────┬─────────────────┘
                          │
                ┌─────────▼─────────┐
                │   SUPABASE        │
                │  · Login/Auth     │
                │  · Base de datos  │  ← PostgreSQL (datos relacionados)
                │  · Almacenamiento │  ← imágenes de avatares, miniaturas
                │  · Reglas RLS     │  ← aislamiento por clínica
                └───────────────────┘
                          │
                ┌─────────▼─────────┐
                │  Vídeos de rutina │  ← Vimeo / AWS (enlaces, no se alojan aquí)
                └───────────────────┘
```

- **App móvil (paciente):** lo que usa el cliente final. Triaje diario, rutinas, avatar.
- **Panel web (clínica):** lo que usa el fisio/profesional. Alta de pacientes, prescripción, semáforos de alerta.
- **Supabase:** el backend "todo en uno". Ver [ADR-001](decisiones/ADR-001-stack-tecnologico.md).

> ⚠️ **Estado real hoy:** este repositorio contiene el **esqueleto y el plan**, no una
> app compilable. Flutter/Dart no están instalados en el equipo del dueño. El equipo de
> desarrollo que arranque el proyecto instalará las herramientas y dará vida a este boceto.

---

## Stack tecnológico

| Capa | Tecnología | Versión orientativa | Por qué |
|------|-----------|---------------------|---------|
| App móvil | Flutter (Dart) | 3.x | Un código para iPhone + Android. Ideal para avatar animado. Ver ADR-001. |
| Panel web | Flutter Web | 3.x | Reutiliza el mismo código que el móvil en el MVP. |
| Backend / BBDD | Supabase (PostgreSQL) | 15+ | Login, base de datos relacional, almacenamiento y permisos sin servidor propio. |
| Almacenamiento de vídeo | Vimeo / AWS S3 | — | Los vídeos no se alojan en la BBDD; se guardan enlaces. |
| Hosting panel web | Supabase Hosting / Vercel | — | Por decidir en fase de despliegue. |

---

## Estructura de carpetas

```
Human Potential/
├── app/                      ← App Flutter (móvil + web). La crea el equipo de desarrollo.
│   ├── lib/
│   │   ├── main.dart                 ← punto de entrada
│   │   ├── core/                     ← configuración, tema, constantes, cliente Supabase
│   │   │   ├── config/
│   │   │   ├── theme/
│   │   │   └── supabase/
│   │   ├── data/                     ← modelos de datos y acceso a Supabase
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── features/                 ← una carpeta por funcionalidad del flujo
│   │   │   ├── onboarding/           ← login + Código de Honor + Auditoría + Sombrero Seleccionador
│   │   │   ├── dashboard/            ← avatar central + XP + racha + motor de evolución
│   │   │   ├── triaje/               ← popup diario dolor/energía
│   │   │   ├── rutinas/              ← reproductor de vídeos + Packs
│   │   │   ├── feedback/             ← RPE post-sesión
│   │   │   ├── monedero/             ← Descuento Sudado + referidos
│   │   │   ├── tarjetas/             ← tarjetas épicas para compartir
│   │   │   ├── upselling/            ← banners hacia servicios de clínica
│   │   │   └── clinica/              ← panel web de la clínica (B1-B6)
│   │   └── shared/                   ← widgets reutilizables (botones, tarjetas...)
│   └── pubspec.yaml                  ← "libro de recetas" de dependencias Flutter
│
├── panel_web/                ← (opcional) si el panel se separa del móvil más adelante
│
├── supabase/                 ← Definición de la base de datos
│   ├── migrations/                   ← scripts SQL que crean las tablas
│   └── README.md
│
├── docs/                     ← Documentación (este archivo, roadmap, decisiones...)
└── .claude/                  ← Constitución del agente y herramientas internas
```

> En este boceto creamos `app/lib/` con pantallas vacías comentadas (el esqueleto del
> flujo) y `supabase/migrations/` con el esquema inicial de la base de datos.

---

## Base de datos

> Diseño **multi-clínica** (ver [ADR-002](decisiones/ADR-002-arquitectura-multi-tenant.md)).
> Casi todas las tablas llevan `clinica_id`: la "etiqueta" que aísla los datos de cada
> clínica. Nadie ve los datos de otra clínica.

### Mapa de relaciones (en lenguaje normal)

```
CLÍNICA  (la empresa que prescribe la app)
  │
  ├── PROFESIONALES   (los fisios/entrenadores de esa clínica)
  │
  └── PACIENTES       (los clientes finales, dados de alta con un Código de Honor)
        │
        ├── AUDITORÍA DE VITALIDAD   (la foto física inicial — puntuación 1-100)
        ├── AVATAR                   (el Guardián: arquetipo, nivel, fase, puntos)
        │     ├── ITEMS DESBLOQUEADOS  (armaduras, halos... algunos por pagar en clínica)
        │     └── RETOS MAESTROS       (los 10 hitos hacia el Nivel 100)
        ├── TRIAJES DIARIOS          (dolor 1-10 / energía 1-10 cada día)
        ├── PRESCRIPCIONES           (qué Packs/rutinas le asignó su profesional)
        │     └── SESIONES           (cada vez que hace una rutina)
        │           └── FEEDBACK RPE   (esfuerzo + molestia nueva tras la sesión)
        ├── MONEDERO                 (saldo de "Descuento Sudado" — visual, sin pago real)
        └── REFERIDOS                (códigos de invitación y quién trajo a quién)

CATÁLOGO (compartido o por clínica):
  ├── VÍDEOS        (enlaces a Vimeo/AWS, músculo/objetivo)
  └── PACKS         (agrupaciones de vídeos = un protocolo prescribible)
```

### Tablas principales

| Tabla | Para qué sirve | Campos clave |
|-------|----------------|--------------|
| `clinicas` | Cada clínica/tenant. Raíz de todo. | `id`, `nombre`, `marca` (config white-label), `activa` |
| `profesionales` | Fisios/entrenadores de una clínica. | `id`, `clinica_id`, `nombre`, `email`, `rol` |
| `pacientes` | Clientes finales. | `id`, `clinica_id`, `nombre`, `email`, `codigo_honor`, `fecha_alta` |
| `auditorias_vitalidad` | Foto física inicial (y revisiones). | `id`, `paciente_id`, `fuerza` (0-30), `aerobico` (0-30), `movilidad` (0-20), `constancia` (0-20), `total` (1-100), `fecha` |
| `avatares` | El Guardián de cada paciente. | `id`, `paciente_id`, `arquetipo` (tierra/agua/viento…), `nivel` (1-100), `fase_visual` (1-30), `puntos_vitalidad`, `racha_dias` |
| `fases_avatar` | Catálogo de las 30 fases (significado de cada forma). | `fase` (1-30), `nombre`, `etapa_mayor` (Huevo/Cría/Joven/Guardián/Alado/Deidad), `arco`, `nivel_min`, `puerta_clinica` |
| `arquetipos` | Catálogo configurable de familias. | `id`, `nombre`, `descripcion`, `activo` |
| `items_avatar` | Armaduras/halos/medallas desbloqueables. | `id`, `nombre`, `fase_minima`, `requiere_pago_clinica` (sí/no) |
| `avatar_items` | Qué items tiene cada avatar. | `avatar_id`, `item_id`, `fecha_desbloqueo`, `origen` (logro/pago) |
| `retos_maestros` | Los 10 hitos hacia el Nivel 100. | `id`, `nombre`, `descripcion` |
| `avatar_retos` | Retos superados por cada avatar. | `avatar_id`, `reto_id`, `fecha` |
| `triajes` | Reporte diario de dolor/energía. | `id`, `paciente_id`, `dolor` (1-10), `energia` (1-10), `fecha` |
| `videos` | Catálogo de vídeos de rutina. | `id`, `clinica_id`, `titulo`, `url` (Vimeo/AWS), `objetivo` |
| `packs` | Protocolos = grupos de vídeos. | `id`, `clinica_id`, `nombre`, `descripcion` |
| `pack_videos` | Qué vídeos lleva cada pack. | `pack_id`, `video_id`, `orden` |
| `prescripciones` | Qué pack asignó un profesional a un paciente. | `id`, `paciente_id`, `pack_id`, `profesional_id`, `fecha` |
| `sesiones` | Cada vez que el paciente hace una rutina. | `id`, `paciente_id`, `prescripcion_id`, `completada`, `fecha` |
| `feedback_rpe` | Esfuerzo y molestias tras la sesión. | `id`, `sesion_id`, `esfuerzo` (1-10), `molestia_nueva` (sí/no), `nota` |
| `monederos` | Saldo visual de Descuento Sudado. | `id`, `paciente_id`, `saldo_descuento` |
| `referidos` | Códigos de invitación. | `id`, `paciente_id`, `codigo`, `referido_por_id`, `fecha` |

> **Nota de seguridad:** todas las tablas con `clinica_id` (o ligadas a un paciente) van
> protegidas con reglas RLS de Supabase, de modo que un profesional solo ve a *sus*
> pacientes y un paciente solo ve *sus propios* datos. El detalle SQL está en
> `supabase/migrations/`.

---

## Flujos principales

### Flujo 1 — Alta y Auditoría (Onboarding)

```
1. La clínica da de alta al paciente desde el panel web → se genera un "Código de Honor".
2. El paciente descarga la app, mete su email + Código de Honor → queda vinculado a su clínica.
3. Hace la anamnesis + test físico interactivo (3-4 micro-vídeos: graba o marca Sí/No).
4. El sistema calcula la Auditoría de Vitalidad (1-100) y crea su avatar "Huevo Nivel 1".
5. El "Sombrero Seleccionador" asigna familia y le ofrece 3 guardianes → el paciente elige 1.
```

### Flujo 2 — Core Loop diario

```
1. El paciente abre la app → popup de Triaje (dolor 1-10 / energía 1-10).
2. Ve su dashboard: avatar al centro, barra de XP, contador de racha.
3. Reproduce el Pack de rutina que le prescribió su clínica (vídeo de Vimeo/AWS).
4. Al terminar: feedback RPE obligatorio (esfuerzo 1-10 + ¿molestia nueva?).
5. Gana Puntos de Vitalidad → sube XP → el avatar evoluciona si toca.
6. Si reporta dolor alto o molestia nueva → salta alerta al panel de la clínica (semáforo rojo).
```

### Flujo 3 — Motor viral y económico

```
- Monedero "Descuento Sudado": el saldo sube con rachas y referidos (solo visual; el pago es fuera).
- Referidos: cada paciente tiene un código único; quien lo usa baja la cuota de ambos.
- Tarjetas Épicas: la app genera una imagen vertical (avatar + nivel + frase) para Instagram/TikTok.
- Upselling: si hay estancamiento o dolor alto, banner → redirige a web/WhatsApp de la clínica.
```

---

## Decisiones técnicas

Ver `docs/decisiones/` para el historial de ADRs.
Ver `SYSTEM_VISION.md` sección 7 para las decisiones cerradas (D1–D6).

---

## Deuda técnica conocida

| Item | Impacto | Prioridad | Notas |
|------|---------|-----------|-------|
| Esqueleto sin compilar | El equipo debe instalar Flutter/Dart y dar vida al boceto | Alta | Es el siguiente paso natural; el boceto es el punto de partida. |
| Reglas RLS por escribir en detalle | Seguridad del aislamiento entre clínicas | Alta | El esquema SQL deja las tablas; las políticas finas se afinan al implementar. |
| Arte de avatares pendiente | Sin ilustraciones reales, solo placeholders | Media | Decisión D5: lo hace un ilustrador humano. |

---

## Cómo arrancar en local

> Pasos para el equipo de desarrollo cuando retome el boceto (no ejecutables hoy).

```bash
# 1. Instalar Flutter (incluye Dart): https://docs.flutter.dev/get-started/install
flutter --version          # comprobar instalación

# 2. Instalar dependencias de la app
cd app
flutter pub get

# 3. Configurar las variables de entorno (copiar y rellenar)
#    Ver .env.example en la raíz del proyecto.

# 4. Arrancar en un emulador o dispositivo
flutter run                # móvil
flutter run -d chrome      # panel web

# 5. Base de datos: aplicar las migraciones de supabase/migrations/ desde el panel de Supabase.
```

---

## Variables de entorno necesarias

```bash
# Conexión a Supabase (el backend). Valores reales en .env (NUNCA aquí ni en GitHub).
SUPABASE_URL=https://xxxx.supabase.co            # dirección del proyecto Supabase
SUPABASE_ANON_KEY=clave_publica_de_cliente       # clave pública para la app
# La SERVICE_ROLE_KEY solo se usa en el servidor/panel admin, nunca en la app móvil.

# Proveedor de vídeo (cuando se integre)
VIMEO_ACCESS_TOKEN=token_de_vimeo                # o credenciales de AWS S3
```
