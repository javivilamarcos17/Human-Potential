-- ============================================================================
-- Anti Frágil — Políticas RLS completas (Row Level Security)
-- Migración: 0006_rls_politicas
-- Fecha: 2026-06-11
--
-- Implementa el aislamiento OBLIGATORIO (ESPECIFICACION_MVP §C, PRIVACIDAD_RGPD §7):
--   · Un PACIENTE solo ve/edita SUS propios datos.
--   · Un PROFESIONAL solo ve/edita datos de pacientes de SU clínica.
--   · Nadie ve datos de otra clínica. Los catálogos globales son de solo lectura.
--   · Pacientes B2C (clinica_id NULL — D8) no son visibles para ninguna clínica.
--
-- ⚠️ El equipo de desarrollo DEBE ejecutar la batería de pruebas del final
--    (2 clínicas ficticias + 1 paciente B2C) antes de cualquier despliegue real.
-- ============================================================================

-- ─────────────────────────────────────────────────────────────────────────────
-- 0. FUNCIONES AUXILIARES (security definer para no recursar en las políticas)
-- ─────────────────────────────────────────────────────────────────────────────

create or replace function mi_clinica_id()
returns uuid language sql stable security definer set search_path = public as $$
    select clinica_id from profesionales where auth_uid = auth.uid() limit 1;
$$;

create or replace function mi_paciente_id()
returns uuid language sql stable security definer set search_path = public as $$
    select id from pacientes where auth_uid = auth.uid() limit 1;
$$;

create or replace function soy_profesional()
returns boolean language sql stable security definer set search_path = public as $$
    select exists (select 1 from profesionales where auth_uid = auth.uid());
$$;

-- ─────────────────────────────────────────────────────────────────────────────
-- 1. ACTIVAR RLS EN TODAS LAS TABLAS (sin excepción — denegar por defecto)
-- ─────────────────────────────────────────────────────────────────────────────

alter table clinicas              enable row level security;
alter table profesionales         enable row level security;
alter table pacientes             enable row level security;
alter table auditorias_vitalidad  enable row level security;
alter table arquetipos            enable row level security;
alter table avatares              enable row level security;
alter table items_avatar          enable row level security;
alter table avatar_items          enable row level security;
alter table retos_maestros        enable row level security;
alter table avatar_retos          enable row level security;
alter table triajes               enable row level security;
alter table videos                enable row level security;
alter table packs                 enable row level security;
alter table pack_videos           enable row level security;
alter table prescripciones        enable row level security;
alter table sesiones              enable row level security;
alter table feedback_rpe          enable row level security;
alter table monederos             enable row level security;
alter table referidos             enable row level security;
alter table fases_avatar          enable row level security;
alter table plantillas_auditoria  enable row level security;
alter table plantilla_items       enable row level security;
alter table auditoria_respuestas  enable row level security;
alter table seasons               enable row level security;
alter table vitrina_trofeos       enable row level security;
alter table asistencias           enable row level security;
alter table interes_funciones     enable row level security;
alter table servicios_centro      enable row level security;
alter table equivalencias_servicio enable row level security;

-- ─────────────────────────────────────────────────────────────────────────────
-- 2. CATÁLOGOS GLOBALES — lectura para cualquier usuario autenticado, sin escritura
--    (la escritura se hace por admin/service_role, que salta RLS)
-- ─────────────────────────────────────────────────────────────────────────────

create policy catalogo_lectura on arquetipos             for select to authenticated using (activo);
create policy catalogo_lectura on items_avatar           for select to authenticated using (true);
create policy catalogo_lectura on retos_maestros         for select to authenticated using (true);
create policy catalogo_lectura on fases_avatar           for select to authenticated using (true);
create policy catalogo_lectura on seasons                for select to authenticated using (true);
create policy catalogo_lectura on equivalencias_servicio for select to authenticated using (true);

-- ─────────────────────────────────────────────────────────────────────────────
-- 3. CLÍNICAS Y PROFESIONALES
-- ─────────────────────────────────────────────────────────────────────────────

-- El profesional ve su propia clínica; el paciente ve la clínica a la que pertenece.
create policy clinica_profesional on clinicas for select
    using (id = mi_clinica_id());
create policy clinica_paciente on clinicas for select
    using (id = (select clinica_id from pacientes where auth_uid = auth.uid()));

-- El profesional se ve a sí mismo y a los colegas de su clínica.
create policy profesional_su_clinica on profesionales for select
    using (clinica_id = mi_clinica_id());
-- Solo admin_clinica gestiona profesionales (alta/edición) de su clínica.
create policy profesional_gestion on profesionales for all
    using (clinica_id = mi_clinica_id()
           and exists (select 1 from profesionales p
                       where p.auth_uid = auth.uid() and p.rol = 'admin_clinica'));

-- ─────────────────────────────────────────────────────────────────────────────
-- 4. PACIENTES
-- ─────────────────────────────────────────────────────────────────────────────

-- El paciente ve y edita su propia ficha.
create policy paciente_propio on pacientes for select using (auth_uid = auth.uid());
create policy paciente_propio_upd on pacientes for update using (auth_uid = auth.uid());

-- El profesional ve y gestiona los pacientes de SU clínica.
-- Nota D8: pacientes B2C tienen clinica_id NULL → ninguna clínica los ve.
create policy paciente_de_mi_clinica on pacientes for select
    using (clinica_id is not null and clinica_id = mi_clinica_id());
create policy paciente_alta on pacientes for insert
    with check (clinica_id = mi_clinica_id());
create policy paciente_edicion_clinica on pacientes for update
    using (clinica_id is not null and clinica_id = mi_clinica_id());

-- ─────────────────────────────────────────────────────────────────────────────
-- 5. DATOS DE SALUD DEL PACIENTE (categoría especial RGPD — máximo cuidado)
--    Patrón: el paciente CRUD sobre lo suyo; el profesional SELECT de su clínica.
-- ─────────────────────────────────────────────────────────────────────────────

-- Triajes
create policy triaje_paciente on triajes for all
    using (paciente_id = mi_paciente_id()) with check (paciente_id = mi_paciente_id());
create policy triaje_profesional on triajes for select
    using (paciente_id in (select id from pacientes where clinica_id = mi_clinica_id()));

-- Auditorías de Vitalidad
create policy auditoria_paciente on auditorias_vitalidad for all
    using (paciente_id = mi_paciente_id()) with check (paciente_id = mi_paciente_id());
create policy auditoria_profesional on auditorias_vitalidad for select
    using (paciente_id in (select id from pacientes where clinica_id = mi_clinica_id()));

-- Respuestas de auditoría (hija de auditorias_vitalidad)
create policy aud_resp_paciente on auditoria_respuestas for all
    using (auditoria_id in (select id from auditorias_vitalidad where paciente_id = mi_paciente_id()))
    with check (auditoria_id in (select id from auditorias_vitalidad where paciente_id = mi_paciente_id()));
create policy aud_resp_profesional on auditoria_respuestas for select
    using (auditoria_id in (select a.id from auditorias_vitalidad a
                            join pacientes p on p.id = a.paciente_id
                            where p.clinica_id = mi_clinica_id()));

-- Sesiones
create policy sesion_paciente on sesiones for all
    using (paciente_id = mi_paciente_id()) with check (paciente_id = mi_paciente_id());
create policy sesion_profesional on sesiones for select
    using (paciente_id in (select id from pacientes where clinica_id = mi_clinica_id()));

-- Feedback RPE (hija de sesiones)
create policy rpe_paciente on feedback_rpe for all
    using (sesion_id in (select id from sesiones where paciente_id = mi_paciente_id()))
    with check (sesion_id in (select id from sesiones where paciente_id = mi_paciente_id()));
create policy rpe_profesional on feedback_rpe for select
    using (sesion_id in (select s.id from sesiones s
                         join pacientes p on p.id = s.paciente_id
                         where p.clinica_id = mi_clinica_id()));

-- Asistencias (presencial QR — D10)
create policy asistencia_paciente on asistencias for all
    using (paciente_id = mi_paciente_id()) with check (paciente_id = mi_paciente_id());
create policy asistencia_profesional on asistencias for select
    using (clinica_id = mi_clinica_id());

-- ─────────────────────────────────────────────────────────────────────────────
-- 6. GAMIFICACIÓN DEL PACIENTE
-- ─────────────────────────────────────────────────────────────────────────────

create policy avatar_paciente on avatares for all
    using (paciente_id = mi_paciente_id()) with check (paciente_id = mi_paciente_id());
create policy avatar_profesional on avatares for select
    using (paciente_id in (select id from pacientes where clinica_id = mi_clinica_id()));

create policy avatar_items_paciente on avatar_items for all
    using (avatar_id in (select id from avatares where paciente_id = mi_paciente_id()))
    with check (avatar_id in (select id from avatares where paciente_id = mi_paciente_id()));

create policy avatar_retos_paciente on avatar_retos for all
    using (avatar_id in (select id from avatares where paciente_id = mi_paciente_id()))
    with check (avatar_id in (select id from avatares where paciente_id = mi_paciente_id()));

create policy vitrina_paciente on vitrina_trofeos for all
    using (paciente_id = mi_paciente_id()) with check (paciente_id = mi_paciente_id());

create policy monedero_paciente on monederos for select
    using (paciente_id = mi_paciente_id());
create policy monedero_profesional on monederos for select
    using (paciente_id in (select id from pacientes where clinica_id = mi_clinica_id()));
-- El saldo lo actualiza la lógica de servidor (service_role) — sin política de escritura.

create policy referido_paciente on referidos for select
    using (paciente_id = mi_paciente_id() or referido_por_id = mi_paciente_id());
-- Altas de referidos: lógica de servidor (service_role).

create policy interes_paciente on interes_funciones for insert
    with check (paciente_id = mi_paciente_id() or paciente_id is null);
create policy interes_paciente_sel on interes_funciones for select
    using (paciente_id = mi_paciente_id());

-- ─────────────────────────────────────────────────────────────────────────────
-- 7. CONTENIDO DE LA CLÍNICA (vídeos, packs, prescripciones, plantillas, servicios)
-- ─────────────────────────────────────────────────────────────────────────────

-- Vídeos: el profesional CRUD en su clínica; el paciente ve los de packs prescritos a él.
create policy video_profesional on videos for all
    using (clinica_id = mi_clinica_id()) with check (clinica_id = mi_clinica_id());
create policy video_paciente on videos for select
    using (id in (select pv.video_id from pack_videos pv
                  join prescripciones pr on pr.pack_id = pv.pack_id
                  where pr.paciente_id = mi_paciente_id() and pr.activa));

-- Packs
create policy pack_profesional on packs for all
    using (clinica_id = mi_clinica_id()) with check (clinica_id = mi_clinica_id());
create policy pack_paciente on packs for select
    using (id in (select pack_id from prescripciones
                  where paciente_id = mi_paciente_id() and activa));

create policy pack_videos_profesional on pack_videos for all
    using (pack_id in (select id from packs where clinica_id = mi_clinica_id()))
    with check (pack_id in (select id from packs where clinica_id = mi_clinica_id()));
create policy pack_videos_paciente on pack_videos for select
    using (pack_id in (select pack_id from prescripciones
                       where paciente_id = mi_paciente_id() and activa));

-- Prescripciones: el profesional las gestiona; el paciente ve las suyas.
create policy prescripcion_profesional on prescripciones for all
    using (paciente_id in (select id from pacientes where clinica_id = mi_clinica_id()))
    with check (paciente_id in (select id from pacientes where clinica_id = mi_clinica_id()));
create policy prescripcion_paciente on prescripciones for select
    using (paciente_id = mi_paciente_id());

-- Plantillas de Auditoría (D7): CRUD del profesional en su clínica; lectura del paciente
-- (necesita la plantilla para hacer su test).
create policy plantilla_profesional on plantillas_auditoria for all
    using (clinica_id = mi_clinica_id()) with check (clinica_id = mi_clinica_id());
create policy plantilla_paciente on plantillas_auditoria for select
    using (clinica_id = (select clinica_id from pacientes where auth_uid = auth.uid()));

create policy plantilla_items_profesional on plantilla_items for all
    using (plantilla_id in (select id from plantillas_auditoria where clinica_id = mi_clinica_id()))
    with check (plantilla_id in (select id from plantillas_auditoria where clinica_id = mi_clinica_id()));
create policy plantilla_items_paciente on plantilla_items for select
    using (plantilla_id in (select id from plantillas_auditoria
                            where clinica_id = (select clinica_id from pacientes where auth_uid = auth.uid())));

-- Servicios del centro (D10 — Lidomare): el profesional CRUD; su paciente los ve.
create policy servicio_profesional on servicios_centro for all
    using (clinica_id = mi_clinica_id()) with check (clinica_id = mi_clinica_id());
create policy servicio_paciente on servicios_centro for select
    using (clinica_id = (select clinica_id from pacientes where auth_uid = auth.uid()));

-- ─────────────────────────────────────────────────────────────────────────────
-- 8. BATERÍA DE PRUEBAS OBLIGATORIA (ejecutar manualmente antes del despliegue)
-- ─────────────────────────────────────────────────────────────────────────────
-- Preparar: Clínica A y Clínica B con 1 profesional y 1 paciente cada una,
--           y 1 paciente B2C (clinica_id NULL). Verificar como mínimo:
--  [ ] Profesional A NO ve pacientes/triajes/sesiones/packs de Clínica B.
--  [ ] Paciente A1 NO ve triajes ni avatar de Paciente A2 (misma clínica).
--  [ ] Paciente B2C NO es visible para ningún profesional.
--  [ ] Paciente solo ve vídeos de packs que tiene prescritos y activos.
--  [ ] Usuario anónimo (sin login) no lee NINGUNA tabla.
--  [ ] El paciente no puede modificar su monedero ni sus referidos.
--  [ ] admin_clinica puede crear profesionales; rol 'fisio' no puede.
-- ============================================================================
