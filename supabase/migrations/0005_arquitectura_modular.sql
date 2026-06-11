-- ============================================================================
-- Anti Frágil — Arquitectura modular: registro dual, Temporadas, asistencias
-- Migración: 0005_arquitectura_modular · Fecha: 2026-06-11
-- Soporta las decisiones D8-D11 (ver SYSTEM_VISION §7 y docs/diseño/arquitectura-modular.md).
-- BOCETO editable. Requiere 0001-0004.
-- ============================================================================

-- ── D8 · Registro dual: el B2C no tiene centro; el partner entra por Código de Centro ──
alter table pacientes alter column clinica_id drop not null;
alter table pacientes add column origen text not null default 'partner'
    check (origen in ('b2c','partner'));
alter table clinicas add column codigo_centro text unique;        -- ej. 'LIDOMARE26'

-- ── D9 · Temporadas (Seasons) y Vitrina de Trofeos ──
create table seasons (
    id            uuid primary key default gen_random_uuid(),
    nombre        text not null,                  -- 'Season 0', 'Season 1'...
    activa        boolean not null default false,
    fecha_inicio  date,
    fecha_fin     date
);

alter table avatares add column season_id uuid references seasons(id);
alter table avatares add column skin_partner text;                -- ej. 'lidomare' (D8)

-- Vitrina: el avatar de una temporada pasada se archiva, nunca se pierde (retención).
create table vitrina_trofeos (
    id           uuid primary key default gen_random_uuid(),
    paciente_id  uuid not null references pacientes(id) on delete cascade,
    season_id    uuid not null references seasons(id),
    snapshot     jsonb not null,        -- estado final del avatar (arquetipo, fase, items...)
    archivado_en timestamptz not null default now()
);

-- Las fases pueden variar por temporada: Season 0 usa un subconjunto (3-4 formas).
alter table fases_avatar add column season_id uuid references seasons(id); -- null = catálogo maestro

-- ── D10 · Bifurcación presencial/casa + verificación QR ──
alter table sesiones add column modalidad text not null default 'casa'
    check (modalidad in ('casa','presencial'));

create table asistencias (
    id           uuid primary key default gen_random_uuid(),
    paciente_id  uuid not null references pacientes(id) on delete cascade,
    clinica_id   uuid not null references clinicas(id),
    metodo       text not null default 'qr' check (metodo in ('qr','honor')), -- honor = no verificado
    fecha        timestamptz not null default now()
);
create index idx_asistencias_paciente on asistencias(paciente_id, fecha desc);

-- El QR de recepción es estático por centro: codifica clinicas.codigo_centro + un token.
alter table clinicas add column qr_token text;    -- regenerable por la clínica

-- ── D11 · Placeholders medibles ("Próximamente") ──
create table interes_funciones (
    id           uuid primary key default gen_random_uuid(),
    paciente_id  uuid references pacientes(id) on delete set null,
    funcion      text not null,         -- 'escaneo_platos_ia', 'algoritmo_lesiones'...
    fecha        timestamptz not null default now()
);

-- ── D8b · Catálogo de servicios del centro (para recomendar SUS actividades) ──
-- La app conoce qué ofrece el centro (clases, fisio, entrenos) y las rutinas pueden
-- recomendar: "hoy te toca movilidad → en Lidomare: clase de pilates 19h" o su
-- equivalente en casa si no puede ir (sustitución sesión ↔ rutina remota).
create table servicios_centro (
    id           uuid primary key default gen_random_uuid(),
    clinica_id   uuid not null references clinicas(id) on delete cascade,
    nombre       text not null,            -- 'Pilates', 'Fisioterapia', 'Entreno funcional'...
    descripcion  text,
    objetivo     text,                     -- movilidad / fuerza / aerobico / recuperacion
    horario      text,                     -- texto libre en MVP (low-tech)
    activo       boolean not null default true
);
-- Equivalencias: qué pack casero sustituye a qué servicio presencial (y viceversa).
create table equivalencias_servicio (
    servicio_id  uuid not null references servicios_centro(id) on delete cascade,
    pack_id      uuid not null references packs(id) on delete cascade,
    primary key (servicio_id, pack_id)
);

-- ── Datos de arranque: Season 0 y el centro sandbox ──
insert into seasons (nombre, activa, fecha_inicio) values ('Season 0', true, current_date);
-- El centro real (Lidomare) se dará de alta con su código al configurar el piloto:
-- update clinicas set codigo_centro = 'LIDOMARE26' where id = '...';
