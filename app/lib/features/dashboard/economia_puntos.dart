// economia_puntos.dart — Reparto de Puntos de Vitalidad (XP) y rachas.
//
// BOCETO de la LÓGICA. Decide cuánta XP gana el paciente por sus acciones del Core Loop
// y cómo evoluciona la racha. Ver docs/diseño/core-loop-diario.md.
//
// Regla de oro: la MEJORA REAL (retos, re-auditorías) vale mucho más que la mera actividad.
// Valores editables; el equipo los calibra con datos del piloto.

class Xp {
  // Acciones diarias (poco peso: presentarse es lo mínimo)
  static const triaje = 5;
  static const rutinaCompletada = 20;
  static const feedbackRpe = 5;

  // Bonus de racha
  static const porDiaDeRacha = 2;
  static const topeBonusRacha = 20;

  // Hitos de mejora real (mucho peso)
  static const retoMaestro = 150;
  static const reAuditoriaBase = 100;
  static const reAuditoriaPorPunto = 10; // + por cada punto ganado vs la anterior
}

class EconomiaPuntos {
  /// XP de una jornada completa de Core Loop (triaje + rutina + feedback + bonus racha).
  static int xpDeJornada({
    required bool hizoTriaje,
    required bool completoRutina,
    required bool dioFeedback,
    required int rachaDias,
  }) {
    var xp = 0;
    if (hizoTriaje) xp += Xp.triaje;
    if (completoRutina) xp += Xp.rutinaCompletada;
    if (dioFeedback) xp += Xp.feedbackRpe;
    xp += _bonusRacha(rachaDias);
    return xp;
  }

  static int _bonusRacha(int rachaDias) {
    final bonus = rachaDias * Xp.porDiaDeRacha;
    return bonus > Xp.topeBonusRacha ? Xp.topeBonusRacha : bonus;
  }

  /// XP por mejorar en una re-Auditoría respecto a la anterior.
  static int xpReAuditoria(int puntosGanados) {
    if (puntosGanados <= 0) return 0;
    return Xp.reAuditoriaBase + puntosGanados * Xp.reAuditoriaPorPunto;
  }

  // ── Rachas (constancia sin tiranía) ─────────────────────────────────────────
  /// Calcula la nueva racha. Un día de descanso prescrito o con dolor alto NO la rompe.
  static int actualizarRacha({
    required int rachaActual,
    required bool huboActividadHoy,
    required bool descansoProtegido, // descanso prescrito o dolor alto reportado
  }) {
    if (huboActividadHoy) return rachaActual + 1;
    if (descansoProtegido) return rachaActual; // se protege, no se rompe
    return 0; // falló sin justificación → reinicia (suave, sin penalización extra)
  }
}
