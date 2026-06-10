-- ============================================================================
-- Anti Frágil — Plantillas de Auditoría configurables por profesional (MVP v1.5)
-- Migración: 0003_plantillas_auditoria
-- Fecha: 2026-06-10
--
-- Decisión D7: la Auditoría y sus tests se ESPECIALIZAN por clínica/profesional.
-- Lo estable es el marco (4 bloques, escala 0-100); el contenido (ejercicios,
-- preguntas, umbrales) es configurable. Estas tablas permiten esa configuración.
--
-- También adaptamos `auditorias_vitalidad` para que sepa qué plantilla se usó.
-- Ver docs/diseño/auditoria-vitalidad.md. BOCETO editable.
-- ============================================================================

-- ─────────────────────────────────────────────────────────────────────────────
-- PLANTILLAS DE AUDITORÍA (cada clínica puede tener varias: hombro, suelo pélvico…)
-- ─────────────────────────────────────────────────────────────────────────────
create table plantillas_auditoria (
    id           uuid primary key default gen_random_uuid(),
    clinica_id   uuid not null references clinicas(id) on delete cascade,
    nombre       text not null,                 -- p.ej. "Auditoría general", "Suelo pélvico"
    especialidad text,                          -- traumatología, deportiva, geriatría…
    es_default   boolean not null default false,-- la que se usa si no se elige otra
    activa       boolean not null default true,
    creada_en    timestamptz not null default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- ÍTEMS DE LA PLANTILLA (cada ejercicio o pregunta, con su bloque y cómo puntúa)
--   bloque: 'fuerza' | 'aerobico' | 'movilidad' | 'constancia'
--   tipo_respuesta: 'numero' | 'segundos' | 'reps' | 'si_no' | 'escala' | 'opcion'
--   La forma de convertir la respuesta en puntos es configurable (reglas en JSON).
-- ─────────────────────────────────────────────────────────────────────────────
create table plantilla_items (
    id              uuid primary key default gen_random_uuid(),
    plantilla_id    uuid not null references plantillas_auditoria(id) on delete cascade,
    bloque          text not null check (bloque in ('fuerza','aerobico','movilidad','constancia')),
    enunciado       text not null,              -- "Sentadillas en 30 s", "¿Dolor de espalda?"
    instruccion_url text,                        -- vídeo explicativo del test (Vimeo/AWS)
    tipo_respuesta  text not null,
    puntos_max      smallint not null,           -- cuánto suma este ítem como máximo
    regla_puntos    jsonb not null default '{}'::jsonb, -- cómo se convierte respuesta→puntos
    orden           smallint not null default 1
);

-- Nota de diseño: la suma de `puntos_max` por bloque debería respetar los topes del marco
-- (fuerza 30, aerobico 30, movilidad 20, constancia 20). El panel de la clínica lo validará.

-- ─────────────────────────────────────────────────────────────────────────────
-- RESPUESTAS CONCRETAS de cada auditoría realizada (trazabilidad del resultado)
-- ─────────────────────────────────────────────────────────────────────────────
create table auditoria_respuestas (
    id            uuid primary key default gen_random_uuid(),
    auditoria_id  uuid not null references auditorias_vitalidad(id) on delete cascade,
    item_id       uuid references plantilla_items(id) on delete set null,
    respuesta     text,                          -- valor crudo introducido/grabado
    video_url     text,                          -- si grabó el intento
    puntos        smallint                       -- puntos que otorgó este ítem
);

-- ─────────────────────────────────────────────────────────────────────────────
-- Vincular cada auditoría con la plantilla usada (saber con qué test se midió)
-- ─────────────────────────────────────────────────────────────────────────────
alter table auditorias_vitalidad
    add column plantilla_id uuid references plantillas_auditoria(id);

-- Índices
create index idx_plantillas_clinica on plantillas_auditoria(clinica_id);
create index idx_items_plantilla     on plantilla_items(plantilla_id);
create index idx_respuestas_auditoria on auditoria_respuestas(auditoria_id);
