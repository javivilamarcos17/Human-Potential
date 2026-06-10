// auditoria_vitalidad.dart — Cálculo de la Auditoría de Vitalidad (0-100).
//
// BOCETO de la LÓGICA de puntuación. Traduce los resultados de los micro-tests + anamnesis
// en los 4 bloques y el total. Ver docs/diseño/auditoria-vitalidad.md.
//
// ⚠️ Los umbrales y fórmulas son una PROPUESTA editable: el equipo clínico los valida.
// El objetivo aquí es dejar el "molde" funcionando, no fijar valores médicos definitivos.

/// Resultados crudos que el paciente introduce/graba en los micro-tests.
class ResultadosTest {
  // Fuerza
  final int sentadillas30s; // reps
  final int planchaSegundos; // s
  final int flexiones30s; // reps
  // Aeróbico
  final int pulsacionesPostMarcha; // ppm tras 3 min (menos = mejor)
  final int facilidad3Pisos; // 0-10 (más = mejor)
  // Movilidad / dolor
  final int rangoFlexion; // 0=No, 5=Parcial, 10=Sí (toca pies / sentadilla profunda)
  final int dolorHabitual; // 0-10 (del triaje base; más dolor = menos puntos)
  // Constancia (de la anamnesis)
  final int diasActivosSemana; // 0-7
  final int calidadSueno; // 1-5
  final int horasSentadoDia; // h (más = peor)

  const ResultadosTest({
    required this.sentadillas30s,
    required this.planchaSegundos,
    required this.flexiones30s,
    required this.pulsacionesPostMarcha,
    required this.facilidad3Pisos,
    required this.rangoFlexion,
    required this.dolorHabitual,
    required this.diasActivosSemana,
    required this.calidadSueno,
    required this.horasSentadoDia,
  });
}

/// Puntuación desglosada por bloques + total (0-100).
class Auditoria {
  final int fuerza; // 0-30
  final int aerobico; // 0-30
  final int movilidad; // 0-20
  final int constancia; // 0-20
  int get total => fuerza + aerobico + movilidad + constancia;

  const Auditoria({
    required this.fuerza,
    required this.aerobico,
    required this.movilidad,
    required this.constancia,
  });
}

class CalculadoraAuditoria {
  static int _clamp(int v, int min, int max) =>
      v < min ? min : (v > max ? max : v);

  // ── Fuerza Base (0-30): 3 pruebas de 0-10 ──────────────────────────────────
  static int _fuerza(ResultadosTest r) {
    final sent = _clamp((r.sentadillas30s / 2).round(), 0, 10); // 20 reps → 10
    final plancha = _clamp((r.planchaSegundos / 12).round(), 0, 10); // 120 s → 10
    final flex = _clamp((r.flexiones30s / 2).round(), 0, 10); // 20 reps → 10
    return sent + plancha + flex; // 0-30
  }

  // ── Capacidad Aeróbica (0-30) ──────────────────────────────────────────────
  static int _aerobico(ResultadosTest r) {
    // Menos pulsaciones = mejor. 200→0 pts, 100→20 pts (lineal, recortado).
    final card = _clamp((((200 - r.pulsacionesPostMarcha) / 5)).round(), 0, 20);
    final pisos = _clamp(r.facilidad3Pisos, 0, 10);
    return card + pisos; // 0-30
  }

  // ── Movilidad / Ausencia de dolor (0-20): penaliza el dolor ────────────────
  static int _movilidad(ResultadosTest r) {
    final rango = _clamp(r.rangoFlexion, 0, 10);
    final sinDolor = _clamp(10 - r.dolorHabitual, 0, 10);
    return rango + sinDolor; // 0-20
  }

  // ── Constancia / Hábitos (0-20): de la anamnesis ───────────────────────────
  static int _constancia(ResultadosTest r) {
    final dias = _clamp((r.diasActivosSemana * 10 / 7).round(), 0, 10); // 7 días → 10
    final sueno = _clamp((r.calidadSueno - 1) * 5 ~/ 2, 0, 5); // 1-5 → 0-5
    final sedentarismo = _clamp(5 - (r.horasSentadoDia ~/ 3), 0, 5); // más horas → menos
    return dias + sueno + sedentarismo; // 0-20
  }

  /// Calcula la Auditoría completa a partir de los resultados crudos.
  static Auditoria calcular(ResultadosTest r) => Auditoria(
        fuerza: _fuerza(r),
        aerobico: _aerobico(r),
        movilidad: _movilidad(r),
        constancia: _constancia(r),
      );
}
