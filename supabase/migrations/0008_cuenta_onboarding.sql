-- ============================================================================
-- Anti Frágil — Datos de cuenta y onboarding del paciente (registro real)
-- 2026-06-16. Extiende `pacientes` con los datos del alta (sin DNI ni documentos)
-- y guarda la anamnesis completa del asistente de onboarding.
-- ============================================================================

alter table pacientes
  add column if not exists apellidos        text,
  add column if not exists telefono         text,
  add column if not exists domicilio        text,
  add column if not exists anio_nacimiento  int,
  add column if not exists elemento         text,   -- agua | fuego | rayo | hierba | roca
  add column if not exists linea            text,   -- mistica | guerrera | heroica
  add column if not exists vitalidad        int,    -- 0-100 (provisional, la afinan las pruebas)
  add column if not exists onboarding        jsonb default '{}'::jsonb;

comment on column pacientes.onboarding is
  'Anamnesis completa del asistente: historia/experiencia, frecuencia, lesiones, '
  'cribado PAR-Q de seguridad, gustos (modalidades/lugar/tiempo/intensidad/odiados) y meta.';

-- El email sirve de identificador para el login (Supabase Auth). En altas B2C
-- directas (sin centro) clinica_id es NULL — ver D8 (registro dual).
-- Nota: el alta de la app envia HOY estos datos como evento ('alta') a piloto_eventos.
-- El siguiente paso (cuando se conecte Supabase Auth) es hacer UPSERT en `pacientes`
-- con el email como clave, y leer/escribir el estado del paciente desde aqui.
