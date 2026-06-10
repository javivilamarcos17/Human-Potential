-- ============================================================================
-- Anti Frágil — Datos de DEMO (para enseñar el MVP con datos realistas)
-- Migración: 0004_datos_demo
-- Fecha: 2026-06-10
--
-- Crea una clínica de ejemplo con un profesional y un paciente que ya lleva tiempo,
-- con su avatar a media evolución, triajes, una rutina y feedback. Sirve para la DEMO
-- y el prototipo. NO usar en producción real (son datos ficticios).
-- Requiere 0001, 0002 y 0003 aplicadas.
-- ============================================================================

-- Usamos identificadores fijos para poder referenciarlos fácilmente en la demo.
do $$
declare
  v_clinica   uuid := '11111111-1111-1111-1111-111111111111';
  v_profesion uuid := '22222222-2222-2222-2222-222222222222';
  v_paciente  uuid := '33333333-3333-3333-3333-333333333333';
  v_arq_agua  uuid;
  v_audit     uuid;
  v_pack      uuid := '44444444-4444-4444-4444-444444444444';
  v_video1    uuid := '55555555-5555-5555-5555-555555555555';
  v_video2    uuid := '66666666-6666-6666-6666-666666666666';
  v_presc     uuid := '77777777-7777-7777-7777-777777777777';
begin
  -- Clínica + profesional + paciente
  insert into clinicas (id, nombre) values (v_clinica, 'Clínica Demo Anti Frágil');
  insert into profesionales (id, clinica_id, nombre, email, rol)
    values (v_profesion, v_clinica, 'Dra. Demo', 'demo@clinica.test', 'fisio');
  insert into pacientes (id, clinica_id, nombre, email, codigo_honor)
    values (v_paciente, v_clinica, 'Javi Paciente', 'javi@paciente.test', 'HONOR-DEMO-001');

  -- Auditoría inicial (total ~58/100 → base media)
  insert into auditorias_vitalidad (id, paciente_id, fuerza, aerobico, movilidad, constancia)
    values (gen_random_uuid(), v_paciente, 18, 16, 12, 12) returning id into v_audit;

  -- Arquetipo Agua → avatar a media evolución (Guardián Pleno, fase 10, nivel 47)
  select id into v_arq_agua from arquetipos where nombre = 'agua';
  insert into avatares (paciente_id, arquetipo_id, nivel, fase_visual, puntos_vitalidad, racha_dias)
    values (v_paciente, v_arq_agua, 47, 10, 4620, 23);

  -- Monedero y referido
  insert into monederos (paciente_id, saldo_descuento) values (v_paciente, 10);
  insert into referidos (paciente_id, codigo) values (v_paciente, 'JAVI-AF-2026');

  -- Catálogo de vídeos + Pack + prescripción activa
  insert into videos (id, clinica_id, titulo, url, objetivo) values
    (v_video1, v_clinica, 'Movilidad lumbar suave', 'https://vimeo.com/demo1', 'lumbar/movilidad'),
    (v_video2, v_clinica, 'Core básico',            'https://vimeo.com/demo2', 'core/fuerza');
  insert into packs (id, clinica_id, nombre, descripcion)
    values (v_pack, v_clinica, 'Lumbares fase 1', 'Protocolo inicial para dolor lumbar.');
  insert into pack_videos (pack_id, video_id, orden) values
    (v_pack, v_video1, 1), (v_pack, v_video2, 2);
  insert into prescripciones (id, paciente_id, pack_id, profesional_id, activa)
    values (v_presc, v_paciente, v_pack, v_profesion, true);

  -- Algunos triajes recientes (tendencia de dolor a la baja: va mejorando)
  insert into triajes (paciente_id, dolor, energia, fecha) values
    (v_paciente, 7, 5, now() - interval '5 days'),
    (v_paciente, 6, 6, now() - interval '4 days'),
    (v_paciente, 5, 7, now() - interval '3 days'),
    (v_paciente, 4, 7, now() - interval '2 days'),
    (v_paciente, 3, 8, now() - interval '1 day');
end $$;
