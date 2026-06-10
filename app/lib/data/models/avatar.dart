// avatar.dart — Modelo del Guardián (espejo de la tabla `avatares`).
//
// BOCETO de ejemplo del patrón "modelo". El equipo creará el resto de modelos
// (Paciente, Triaje, Auditoria...) siguiendo este mismo molde.

class Avatar {
  final String id;
  final String pacienteId;
  final String? arquetipoId; // tierra / agua / viento... (configurable, D4)
  final int nivel; // 1-100
  final int faseVisual; // 1-20 (Huevo → Forja → Olimpo)
  final int puntosVitalidad; // XP
  final int rachaDias;

  const Avatar({
    required this.id,
    required this.pacienteId,
    this.arquetipoId,
    required this.nivel,
    required this.faseVisual,
    required this.puntosVitalidad,
    required this.rachaDias,
  });

  factory Avatar.fromMap(Map<String, dynamic> map) => Avatar(
        id: map['id'] as String,
        pacienteId: map['paciente_id'] as String,
        arquetipoId: map['arquetipo_id'] as String?,
        nivel: map['nivel'] as int,
        faseVisual: map['fase_visual'] as int,
        puntosVitalidad: map['puntos_vitalidad'] as int,
        rachaDias: map['racha_dias'] as int,
      );
}
