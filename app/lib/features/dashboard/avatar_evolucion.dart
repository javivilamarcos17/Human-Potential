// avatar_evolucion.dart — Motor de evolución del Guardián.
//
// BOCETO de la LÓGICA (no del arte). Traduce el progreso REAL del paciente en:
//   · nivel (1-100)      → sube con Puntos de Vitalidad (XP). Termómetro de actividad.
//   · fase_visual (1-30) → la forma del avatar. Saltos grandes con "puertas clínicas".
//
// Idea rectora: el avatar es el espejo HONESTO del progreso. No se "farmea": las fases
// altas exigen mejora clínica real (re-auditorías + retos), no solo actividad.
// Ver docs/diseño/avatar-evolucion.md. El equipo afinará valores con datos del piloto.

/// Resumen del progreso real del paciente, leído de la base de datos.
class ProgresoPaciente {
  final int puntosVitalidad; // XP acumulada
  final int rachaDias; // racha actual / acumulada
  final int sesionesCompletadas;
  final int retosMaestrosSuperados;
  final int reAuditoriasRealizadas;
  final int mejoraVsAuditoriaInicial; // puntos ganados respecto a la 1ª auditoría
  final int auditoriaActual; // 1-100
  final int diasActivos; // para la Trinidad del nivel 100

  const ProgresoPaciente({
    required this.puntosVitalidad,
    required this.rachaDias,
    required this.sesionesCompletadas,
    required this.retosMaestrosSuperados,
    required this.reAuditoriasRealizadas,
    required this.mejoraVsAuditoriaInicial,
    required this.auditoriaActual,
    required this.diasActivos,
  });
}

class MotorEvolucion {
  // ── 1. NIVEL (1-100) a partir de la XP ─────────────────────────────────────
  // Curva suave y editable. Cada nivel cuesta un poco más que el anterior.
  // (Valores de ejemplo; el equipo los calibra con datos reales.)
  static int nivelDesdeXp(int xp) {
    const xpBase = 100; // XP del nivel 1→2
    var nivel = 1;
    var coste = xpBase;
    var acumulado = 0;
    while (nivel < 100 && xp >= acumulado + coste) {
      acumulado += coste;
      nivel++;
      coste = (coste * 1.08).round(); // +8% por nivel
    }
    return nivel;
  }

  // ── 2. FASE VISUAL (1-30) con PUERTAS CLÍNICAS ─────────────────────────────
  // La fase es la MAYOR fase cuyo nivel mínimo Y puerta clínica se cumplen.
  // Así, aunque sobre nivel, no se avanza sin la mejora real exigida.
  static int faseDesdeProgreso(ProgresoPaciente p) {
    final nivel = nivelDesdeXp(p.puntosVitalidad);
    var faseAlcanzada = 1;
    for (final f in _fases) {
      if (nivel >= f.nivelMin && f.puertaSuperada(p)) {
        faseAlcanzada = f.fase;
      } else {
        // Las fases están ordenadas; en cuanto una no se cumple, paramos.
        break;
      }
    }
    return faseAlcanzada;
  }

  // ── 3. ESTADO LEGENDARIO ("Trinidad del Nivel 100") ────────────────────────
  static bool esLegendario(ProgresoPaciente p) {
    return nivelDesdeXp(p.puntosVitalidad) >= 100 &&
        p.diasActivos >= 365 &&
        p.retosMaestrosSuperados >= 10;
  }

  // ── Catálogo de puertas clínicas (espejo de fases_avatar en la BBDD) ────────
  // Solo se modelan los gates relevantes para el cálculo. El texto descriptivo
  // vive en la tabla fases_avatar; aquí va la condición ejecutable.
  static final List<_Fase> _fases = [
    _Fase(1, 1, (p) => true),
    _Fase(2, 2, (p) => p.sesionesCompletadas >= 1),
    _Fase(3, 4, (p) => p.rachaDias >= 3),
    _Fase(4, 6, (p) => p.sesionesCompletadas >= 5),
    _Fase(5, 8, (p) => p.rachaDias >= 7),
    _Fase(6, 11, (p) => p.reAuditoriasRealizadas >= 1),
    _Fase(7, 14, (p) => p.sesionesCompletadas >= 10),
    _Fase(8, 17, (p) => p.rachaDias >= 14),
    _Fase(9, 20, (p) => p.mejoraVsAuditoriaInicial >= 1),
    _Fase(10, 24, (p) => p.retosMaestrosSuperados >= 1),
    _Fase(11, 28, (p) => p.sesionesCompletadas >= 20),
    _Fase(12, 32, (p) => p.retosMaestrosSuperados >= 2),
    _Fase(13, 36, (p) => p.rachaDias >= 30),
    _Fase(14, 40, (p) => p.mejoraVsAuditoriaInicial >= 5),
    _Fase(15, 45, (p) => p.retosMaestrosSuperados >= 3),
    _Fase(16, 50, (p) => p.retosMaestrosSuperados >= 4),
    _Fase(17, 55, (p) => p.reAuditoriasRealizadas >= 2),
    _Fase(18, 60, (p) => p.rachaDias >= 60),
    _Fase(19, 65, (p) => p.retosMaestrosSuperados >= 5),
    _Fase(20, 70, (p) => p.mejoraVsAuditoriaInicial >= 10),
    _Fase(21, 73, (p) => p.retosMaestrosSuperados >= 6),
    _Fase(22, 76, (p) => p.rachaDias >= 90),
    _Fase(23, 80, (p) => p.retosMaestrosSuperados >= 7),
    _Fase(24, 84, (p) => p.auditoriaActual >= 70),
    _Fase(25, 88, (p) => p.retosMaestrosSuperados >= 8),
    _Fase(26, 92, (p) => p.auditoriaActual >= 80),
    _Fase(27, 96, (p) => p.auditoriaActual >= 85),
    _Fase(28, 98, (p) => p.retosMaestrosSuperados >= 9),
    _Fase(29, 99, (p) => p.auditoriaActual >= 90),
    _Fase(30, 100, (p) => nivelDesdeXp(p.puntosVitalidad) >= 100),
  ];
}

typedef _Gate = bool Function(ProgresoPaciente p);

class _Fase {
  final int fase;
  final int nivelMin;
  final _Gate puertaSuperada;
  const _Fase(this.fase, this.nivelMin, this.puertaSuperada);
}
