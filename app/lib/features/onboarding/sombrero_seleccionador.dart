// sombrero_seleccionador.dart — Asignación de arquetipo por TEST y VALORACIONES.
//
// BOCETO de la lógica. El avatar NO se elige de catálogo libre: se asigna a partir de la
// Auditoría de Vitalidad + preguntas de estilo de vida. Luego el paciente elige 1 de 3
// Guardianes DE LA FAMILIA asignada (compromiso psicológico sin perder rigor).
// Ver docs/diseño/avatar-evolucion.md sección 7.

/// Datos de la valoración inicial que alimentan la asignación.
class ValoracionInicial {
  final int fuerza; // 0-30  (de la Auditoría de Vitalidad)
  final int aerobico; // 0-30
  final int movilidad; // 0-20
  final int constancia; // 0-20
  final bool dolorEspalda; // de la anamnesis
  final String? hobbyPrincipal; // 'fuerza' | 'cardio' | 'yoga' | 'natacion' | ...

  const ValoracionInicial({
    required this.fuerza,
    required this.aerobico,
    required this.movilidad,
    required this.constancia,
    required this.dolorEspalda,
    this.hobbyPrincipal,
  });
}

class SombreroSeleccionador {
  /// Devuelve el arquetipo asignado: 'tierra' | 'agua' | 'viento'.
  /// Reglas de ejemplo, editables por el equipo con criterio clínico:
  ///   · Agua  → dolor de espalda / baja movilidad / hobbies de movilidad.
  ///   · Viento→ buena base aeróbica / perfil activo / cardio.
  ///   · Tierra→ por defecto: busca fuerza / base / perfil rígido o sedentario.
  static String asignarArquetipo(ValoracionInicial v) {
    final perfilMovilidad = v.dolorEspalda ||
        v.movilidad <= 8 ||
        v.hobbyPrincipal == 'yoga' ||
        v.hobbyPrincipal == 'natacion';
    if (perfilMovilidad) return 'agua';

    final perfilActivo = v.aerobico >= 20 || v.hobbyPrincipal == 'cardio';
    if (perfilActivo) return 'viento';

    return 'tierra';
  }

  /// Nivel de partida: todos nacen en Huevo (fase 1), pero quien llega más en forma
  /// arranca con algo de XP de ventaja. El viaje sigue siendo de cada uno.
  static int xpDePartida(ValoracionInicial v) {
    final total = v.fuerza + v.aerobico + v.movilidad + v.constancia; // 0-100
    return total * 2; // ejemplo: 0-200 XP de salida. Editable.
  }
}
