// alertas_semaforo.dart — Sistema de alerta temprana para la clínica.
//
// BOCETO de la LÓGICA. Convierte la actividad del paciente en un "semáforo" para que el
// profesional detecte recaídas y abandonos ANTES de perder al paciente.
// Ver docs/diseño/core-loop-diario.md sección 5. Umbrales editables por la clínica.

enum Semaforo { rojo, ambar, verde }

/// Señales recientes del paciente que alimentan el semáforo.
class SenalesPaciente {
  final int? dolorUltimoTriaje; // 1-10
  final bool molestiaNuevaUltimoFeedback;
  final int diasDolorMedioSeguidos; // días con dolor 5-7
  final int diasSinActividad;

  const SenalesPaciente({
    this.dolorUltimoTriaje,
    this.molestiaNuevaUltimoFeedback = false,
    this.diasDolorMedioSeguidos = 0,
    this.diasSinActividad = 0,
  });
}

class AlertasSemaforo {
  // Umbrales (editables por la clínica)
  static const dolorAlto = 8;
  static const diasMediosParaAmbar = 3;
  static const diasInactivoParaAmbar = 3;

  static Semaforo evaluar(SenalesPaciente s) {
    // 🔴 Rojo: dolor alto o molestia nueva → atención prioritaria.
    if ((s.dolorUltimoTriaje ?? 0) >= dolorAlto || s.molestiaNuevaUltimoFeedback) {
      return Semaforo.rojo;
    }
    // 🟡 Ámbar: dolor medio sostenido o riesgo de abandono.
    if (s.diasDolorMedioSeguidos >= diasMediosParaAmbar ||
        s.diasSinActividad >= diasInactivoParaAmbar) {
      return Semaforo.ambar;
    }
    // 🟢 Verde: todo en orden.
    return Semaforo.verde;
  }

  /// Texto orientativo para el panel de la clínica.
  static String motivo(SenalesPaciente s) {
    switch (evaluar(s)) {
      case Semaforo.rojo:
        return s.molestiaNuevaUltimoFeedback
            ? 'Molestia nueva reportada tras la sesión.'
            : 'Dolor alto en el último triaje.';
      case Semaforo.ambar:
        return s.diasSinActividad >= diasInactivoParaAmbar
            ? 'Riesgo de abandono: ${s.diasSinActividad} días sin actividad.'
            : 'Dolor medio sostenido varios días.';
      case Semaforo.verde:
        return 'Constancia y dolor bajo. Todo en orden.';
    }
  }
}
