-- ============================================================================
-- Anti Frágil — Esquema inicial de base de datos (MVP v1.5)
-- Migración: 0001_esquema_inicial
-- Fecha: 2026-06-10
--
-- BOCETO / PUNTO DE PARTIDA. Diseñado para ser editable por el equipo de desarrollo.
-- Arquitectura multi-clínica (multi-tenant): casi todas las tablas llevan clinica_id.
-- Ver docs/ARQUITECTURA.md y docs/decisiones/ADR-002.
-- ============================================================================

-- PostgreSQL genera UUIDs con gen_random_uuid() (extensión pgcrypto, activa en Supabase).

-- ─────────────────────────────────────────────────────────────────────────────
-- 1. CLÍNICAS (la raíz de todo — cada clínica es un "tenant")
-- ─────────────────────────────────────────────────────────────────────────────
create table clinicas (
    id          uuid primary key default gen_random_uuid(),
    nombre      text not null,
    marca       jsonb default '{}'::jsonb,   -- config white-label (logo, colores). Vacío = marca "Anti Frágil".
    activa      boolean not null default true,
    creada_en   timestamptz not null default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 2. PROFESIONALES (fisios/entrenadores de una clínica)
-- ─────────────────────────────────────────────────────────────────────────────
create table profesionales (
    id          uuid primary key default gen_random_uuid(),
    clinica_id  uuid not null references clinicas(id) on delete cascade,
    auth_uid    uuid,                         -- enlace al usuario de login de Supabase Auth
    nombre      text not null,
    email       text not null,
    rol         text not null default 'fisio', -- fisio | admin_clinica
    creado_en   timestamptz not null default now(),
    unique (clinica_id, email)
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 3. PACIENTES (clientes finales, dados de alta con un Código de Honor)
-- ─────────────────────────────────────────────────────────────────────────────
create table pacientes (
    id            uuid primary key default gen_random_uuid(),
    clinica_id    uuid not null references clinicas(id) on delete cascade,
    auth_uid      uuid,                       -- enlace al login de Supabase Auth
    nombre        text not null,
    email         text not null,
    codigo_honor  text not null,              -- código que da la clínica para vincularse
    fecha_alta    timestamptz not null default now(),
    unique (clinica_id, email),
    unique (codigo_honor)
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 4. AUDITORÍA DE VITALIDAD (foto física inicial y revisiones — total 1-100)
-- ─────────────────────────────────────────────────────────────────────────────
create table auditorias_vitalidad (
    id           uuid primary key default gen_random_uuid(),
    paciente_id  uuid not null references pacientes(id) on delete cascade,
    fuerza       smallint not null check (fuerza between 0 and 30),
    aerobico     smallint not null check (aerobico between 0 and 30),
    movilidad    smallint not null check (movilidad between 0 and 20),
    constancia   smallint not null check (constancia between 0 and 20),
    total        smallint generated always as (fuerza + aerobico + movilidad + constancia) stored,
    fecha        timestamptz not null default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 5. ARQUETIPOS (catálogo configurable de familias — Tierra, Agua, Viento...)
--    D4: el número de arquetipos es editable, no fijo en código.
-- ─────────────────────────────────────────────────────────────────────────────
create table arquetipos (
    id           uuid primary key default gen_random_uuid(),
    nombre       text not null unique,        -- 'tierra', 'agua', 'viento', ('fuego', 'metal'...)
    descripcion  text,
    activo       boolean not null default true
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 6. AVATARES (el Guardián de cada paciente — nace de la Auditoría)
-- ─────────────────────────────────────────────────────────────────────────────
create table avatares (
    id                uuid primary key default gen_random_uuid(),
    paciente_id       uuid not null references pacientes(id) on delete cascade,
    arquetipo_id      uuid references arquetipos(id),
    nivel             smallint not null default 1 check (nivel between 1 and 100),
    fase_visual       smallint not null default 1 check (fase_visual between 1 and 30),
    puntos_vitalidad  integer not null default 0,   -- XP acumulada
    racha_dias        integer not null default 0,
    actualizado_en    timestamptz not null default now(),
    unique (paciente_id)
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 7. ITEMS DEL AVATAR (armaduras, halos, medallas — algunos por pagar en clínica)
-- ─────────────────────────────────────────────────────────────────────────────
create table items_avatar (
    id                     uuid primary key default gen_random_uuid(),
    nombre                 text not null,
    descripcion            text,
    fase_minima            smallint check (fase_minima between 1 and 20),
    requiere_pago_clinica  boolean not null default false  -- engancha gamificación con caja
);

create table avatar_items (
    avatar_id         uuid not null references avatares(id) on delete cascade,
    item_id           uuid not null references items_avatar(id) on delete cascade,
    origen            text not null default 'logro',  -- logro | pago_clinica
    fecha_desbloqueo  timestamptz not null default now(),
    primary key (avatar_id, item_id)
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 8. RETOS MAESTROS (los 10 hitos hacia la "Trinidad" del Nivel 100)
-- ─────────────────────────────────────────────────────────────────────────────
create table retos_maestros (
    id           uuid primary key default gen_random_uuid(),
    nombre       text not null,
    descripcion  text
);

create table avatar_retos (
    avatar_id  uuid not null references avatares(id) on delete cascade,
    reto_id    uuid not null references retos_maestros(id) on delete cascade,
    fecha      timestamptz not null default now(),
    primary key (avatar_id, reto_id)
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 9. TRIAJES DIARIOS (dolor 1-10 / energía 1-10)
-- ─────────────────────────────────────────────────────────────────────────────
create table triajes (
    id           uuid primary key default gen_random_uuid(),
    paciente_id  uuid not null references pacientes(id) on delete cascade,
    dolor        smallint not null check (dolor between 1 and 10),
    energia      smallint not null check (energia between 1 and 10),
    fecha        timestamptz not null default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 10. CATÁLOGO DE VÍDEOS Y PACKS (protocolos prescribibles)
-- ─────────────────────────────────────────────────────────────────────────────
create table videos (
    id          uuid primary key default gen_random_uuid(),
    clinica_id  uuid not null references clinicas(id) on delete cascade,
    titulo      text not null,
    url         text not null,                -- enlace a Vimeo / AWS
    objetivo    text,                         -- músculo / zona / propósito
    creado_en   timestamptz not null default now()
);

create table packs (
    id           uuid primary key default gen_random_uuid(),
    clinica_id   uuid not null references clinicas(id) on delete cascade,
    nombre       text not null,
    descripcion  text,
    creado_en    timestamptz not null default now()
);

create table pack_videos (
    pack_id   uuid not null references packs(id) on delete cascade,
    video_id  uuid not null references videos(id) on delete cascade,
    orden     smallint not null default 1,
    primary key (pack_id, video_id)
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 11. PRESCRIPCIONES Y SESIONES (qué pack hace cada paciente y cuándo)
-- ─────────────────────────────────────────────────────────────────────────────
create table prescripciones (
    id              uuid primary key default gen_random_uuid(),
    paciente_id     uuid not null references pacientes(id) on delete cascade,
    pack_id         uuid not null references packs(id),
    profesional_id  uuid references profesionales(id),
    fecha           timestamptz not null default now(),
    activa          boolean not null default true
);

create table sesiones (
    id               uuid primary key default gen_random_uuid(),
    paciente_id      uuid not null references pacientes(id) on delete cascade,
    prescripcion_id  uuid references prescripciones(id) on delete set null,
    completada       boolean not null default false,
    fecha            timestamptz not null default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 12. FEEDBACK RPE (esfuerzo + molestia nueva tras la sesión)
-- ─────────────────────────────────────────────────────────────────────────────
create table feedback_rpe (
    id              uuid primary key default gen_random_uuid(),
    sesion_id       uuid not null references sesiones(id) on delete cascade,
    esfuerzo        smallint not null check (esfuerzo between 1 and 10),
    molestia_nueva  boolean not null default false,   -- si true → alerta al panel de la clínica
    nota            text,
    fecha           timestamptz not null default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- 13. MONEDERO Y REFERIDOS (Descuento Sudado — solo visual, sin pago in-app: D6)
-- ─────────────────────────────────────────────────────────────────────────────
create table monederos (
    id               uuid primary key default gen_random_uuid(),
    paciente_id      uuid not null references pacientes(id) on delete cascade,
    saldo_descuento  numeric(10,2) not null default 0,   -- € de descuento acumulado (informativo)
    unique (paciente_id)
);

create table referidos (
    id               uuid primary key default gen_random_uuid(),
    paciente_id      uuid not null references pacientes(id) on delete cascade,  -- dueño del código
    codigo           text not null unique,
    referido_por_id  uuid references pacientes(id),    -- quién lo invitó (si aplica)
    fecha            timestamptz not null default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- ÍNDICES útiles para las consultas más frecuentes
-- ─────────────────────────────────────────────────────────────────────────────
create index idx_pacientes_clinica       on pacientes(clinica_id);
create index idx_profesionales_clinica   on profesionales(clinica_id);
create index idx_triajes_paciente_fecha  on triajes(paciente_id, fecha desc);
create index idx_sesiones_paciente        on sesiones(paciente_id);
create index idx_auditorias_paciente      on auditorias_vitalidad(paciente_id, fecha desc);

-- ─────────────────────────────────────────────────────────────────────────────
-- SEGURIDAD (Row Level Security) — ESBOZO. El equipo afina las políticas finas.
--
-- Idea rectora:
--   · Un PROFESIONAL solo puede ver/editar datos de pacientes de SU clinica_id.
--   · Un PACIENTE solo puede ver/editar SUS propios datos.
--   · Nadie ve datos de otra clínica.
--
-- Se activa RLS en todas las tablas y se crearán políticas basadas en auth.uid()
-- y en la pertenencia a la clínica. Ejemplo orientativo (a completar):
--
--   alter table pacientes enable row level security;
--   create policy paciente_ve_lo_suyo on pacientes
--       for select using (auth_uid = auth.uid());
--   create policy profesional_ve_su_clinica on pacientes
--       for select using (
--           clinica_id in (select clinica_id from profesionales where auth_uid = auth.uid())
--       );
--
-- TODO (equipo de desarrollo): activar RLS y escribir políticas para TODAS las tablas
-- con datos sensibles antes de cualquier despliegue real.
-- ─────────────────────────────────────────────────────────────────────────────
