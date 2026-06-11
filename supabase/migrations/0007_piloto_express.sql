-- ============================================================================
-- Anti Frágil — Piloto Exprés: recogida de eventos sin login (2026-06-12)
-- La app funcional (HTML) envía eventos anónimos con la anon key.
-- Seguridad: cualquiera puede INSERTAR (es un buzón), NADIE puede leer sin
-- service_role. Sin datos identificativos sensibles más allá del nombre de pila.
-- ============================================================================
create table piloto_eventos (
    id             uuid primary key default gen_random_uuid(),
    dispositivo_id text not null,            -- uuid generado en el móvil del paciente
    nombre         text,                     -- nombre de pila (el paciente lo escribe)
    centro         text,                     -- código de centro si lo usó (ej. LIDOMARE26)
    tipo           text not null,            -- alta | jornada | prueba_eclosion | alerta_dolor
    payload        jsonb not null default '{}'::jsonb,
    creado_en      timestamptz not null default now()
);
create index idx_piloto_disp on piloto_eventos(dispositivo_id, creado_en desc);
alter table piloto_eventos enable row level security;
create policy piloto_buzon_insert on piloto_eventos for insert to anon with check (true);
-- (sin política de select: solo service_role/dashboard pueden leer)
