-- ============================================================================
-- Anti Frágil — Catálogo y datos de ejemplo del sistema de avatar (MVP v1.5)
-- Migración: 0002_catalogo_avatar
-- Fecha: 2026-06-10
--
-- Añade el CATÁLOGO de las 30 fases (en 6 etapas mayores) y siembra los datos de
-- referencia: 30 fases con su puerta clínica, 3 arquetipos y 10 retos maestros.
-- Ver docs/diseño/avatar-evolucion.md para el significado de cada cosa.
--
-- Modelo en dos capas (para muchas fases sin disparar el coste de arte):
--   · etapa_mayor = pieza de arte base (Huevo, Cría, Joven, Guardián, Alado, Deidad)
--   · fase        = sub-fase: la misma base con mejoras visuales baratas
-- BOCETO editable: nombres, niveles y gates son ajustables por el equipo.
-- ============================================================================

-- ─────────────────────────────────────────────────────────────────────────────
-- CATÁLOGO DE LAS 30 FASES
--   arco: 1=Semilla, 2=Forja, 3=Ascenso, 4=Olimpo
--   etapa_mayor: nombre de la pieza de arte base que comparten varias fases
--   nivel_min: nivel orientativo de entrada
--   puerta_clinica: requisito real (texto legible) que bloquea el salto (null = sin gate)
-- ─────────────────────────────────────────────────────────────────────────────
create table fases_avatar (
    fase            smallint primary key check (fase between 1 and 30),
    nombre          text not null,
    etapa_mayor     text not null,        -- Huevo | Cría | Joven | Guardián | Alado | Deidad
    arco            smallint not null check (arco between 1 and 4),
    nivel_min       smallint not null,
    puerta_clinica  text,
    significado     text
);

insert into fases_avatar (fase, nombre, etapa_mayor, arco, nivel_min, puerta_clinica, significado) values
  -- Etapa Mayor 1 — HUEVO (arco I)
  (1,  'Huevo Latente',        'Huevo',    1, 1,   null,                            'La vida, dormida. Acaba de empezar.'),
  (2,  'Huevo Vibrante',       'Huevo',    1, 2,   '1ª sesión completa',            'Primer paso real; empieza a brillar.'),
  (3,  'Huevo Palpitante',     'Huevo',    1, 4,   'Racha de 3 días',               'Algo se mueve dentro.'),
  (4,  'Huevo Agrietado',      'Huevo',    1, 6,   '5 sesiones',                    'El cascarón empieza a ceder.'),
  -- Etapa Mayor 2 — CRÍA (arco I)
  (5,  'Eclosión',             'Cría',     1, 8,   'Racha de 7 días',               'Rompe el cascarón: la constancia se sostiene.'),
  (6,  'Recién Nacido',        'Cría',     1, 11,  '1ª re-Auditoría hecha',         'Mira su cuerpo con datos por primera vez.'),
  (7,  'Cría Curiosa',         'Cría',     1, 14,  '10 sesiones',                   'Explora, se mueve.'),
  (8,  'Cría Inquieta',        'Cría',     1, 17,  'Racha de 14 días',              'Gana energía y confianza.'),
  (9,  'Cría Firme',           'Cría',     1, 20,  'Mejora en re-Auditoría (+)',    'Ya no es frágil: se sostiene sola.'),
  -- Etapa Mayor 3 — JOVEN (arco II)
  (10, 'Forma Incipiente',     'Joven',    2, 24,  '1 Reto Maestro',                'Se revela la silueta del arquetipo.'),
  (11, 'Joven I',              'Joven',    2, 28,  '+20 sesiones',                  'Entrena con propósito.'),
  (12, 'Joven II',             'Joven',    2, 32,  '2 Retos Maestros',              'Su identidad se consolida.'),
  (13, 'Joven Consolidado',    'Joven',    2, 36,  'Racha de 30 días',              'Listo para portar armadura.'),
  -- Etapa Mayor 4 — GUARDIÁN (arco II)
  (14, 'Guardián Iniciado',    'Guardián', 2, 40,  'Mejora +5 en Auditoría',        'Primera armadura: el cuerpo responde.'),
  (15, 'Guardián en Forja',    'Guardián', 2, 45,  '3 Retos Maestros',              'Se templa.'),
  (16, 'Guardián Pleno',       'Guardián', 2, 50,  '4 Retos Maestros',              'Armadura completa.'),
  (17, 'Guardián Reforzado',   'Guardián', 2, 55,  '2 re-Auditorías al alza',       'La mejora es tendencia, no casualidad.'),
  (18, 'Guardián Veterano',    'Guardián', 2, 60,  'Racha de 60 días',              'Veteranía y dominio.'),
  (19, 'Guardián Mayor',       'Guardián', 2, 65,  '5 Retos Maestros',              'Maestría del arquetipo.'),
  (20, 'Guardián de Élite',    'Guardián', 2, 70,  'Auditoría >= +10 pts vs inicio','Cambio físico innegable.'),
  -- Etapa Mayor 5 — ALADO (arco III)
  (21, 'Despertar Alado',      'Alado',    3, 73,  '6 Retos Maestros',              'El salto: de recuperarse a prosperar.'),
  (22, 'Ascendente',           'Alado',    3, 76,  'Racha de 90 días',              'La salud ya es su forma de vida.'),
  (23, 'Luminoso I',           'Alado',    3, 80,  '7 Retos Maestros',              'Empieza a inspirar.'),
  (24, 'Luminoso II',          'Alado',    3, 84,  'Auditoría >= 70/100',           'Vitalidad alta.'),
  (25, 'Radiante',             'Alado',    3, 88,  '8 Retos Maestros',              'Referente para otros.'),
  (26, 'Celeste',              'Alado',    3, 92,  'Auditoría >= 80/100',           'A las puertas de la maestría.'),
  (27, 'Pre-Deidad',           'Alado',    3, 96,  'Auditoría >= 85/100',           'Casi antifrágil del todo.'),
  -- Etapa Mayor 6 — DEIDAD (arco IV)
  (28, 'Deidad Naciente',      'Deidad',   4, 98,  '9 Retos Maestros',              'Asciende al Olimpo.'),
  (29, 'Deidad Plena',         'Deidad',   4, 99,  'Auditoría >= 90/100',           'Forma divina estable.'),
  (30, 'Deidad del Arquetipo', 'Deidad',   4, 100, 'Nivel 100',                     'Forma cumbre base. La transformación, lograda.');

-- ─────────────────────────────────────────────────────────────────────────────
-- ARQUETIPOS (familias del Sombrero Seleccionador — MVP arranca con 3, D4)
-- ─────────────────────────────────────────────────────────────────────────────
insert into arquetipos (nombre, descripcion, activo) values
  ('tierra', 'Fuerza y base. Perfil sedentario o con rigidez. Sensación: sólido, imparable.', true),
  ('agua',   'Movilidad y recuperación. Dolor de espalda, yoga/natación. Sensación: fluido, adaptable.', true),
  ('viento', 'Energía y cardio. Perfil activo, runner. Sensación: rápido, explosivo.', true);
  -- ('fuego', '...', false), ('metal', '...', false)  -- reservados para Fase 2/3

-- ─────────────────────────────────────────────────────────────────────────────
-- RETOS MAESTROS (los 10 hitos hacia la Trinidad del Nivel 100)
-- BOCETO: la clínica/dueño ajustará los criterios reales de cada reto.
-- ─────────────────────────────────────────────────────────────────────────────
insert into retos_maestros (nombre, descripcion) values
  ('Primer Aliento',      'Completar la primera semana sin fallar ningún día.'),
  ('Sin Dolor',           'Reportar 7 días seguidos con dolor <= 3 en el triaje.'),
  ('Constancia de Hierro','Alcanzar una racha de 30 días.'),
  ('Salto de Vitalidad',  'Mejorar +5 puntos en una re-Auditoría de Vitalidad.'),
  ('Movilidad Plena',     'Superar el objetivo de movilidad del protocolo asignado.'),
  ('Fuerza Forjada',      'Completar un Pack de fuerza al 100%.'),
  ('Corazón Fuerte',      'Completar un Pack aeróbico al 100%.'),
  ('Maratón de Hábito',   'Alcanzar una racha de 90 días.'),
  ('Renacido',            'Mejorar +10 puntos de Vitalidad respecto a la Auditoría inicial.'),
  ('Antifrágil',          'Mantener Auditoría >= 85/100 durante 60 días.');
