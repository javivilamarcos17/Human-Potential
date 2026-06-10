// descuento_sudado.dart — Cálculo del Descuento Sudado (saldo VISUAL, no pago real).
//
// BOCETO de la LÓGICA. Suma el descuento por constancia + referidos + hitos, sin bajar de
// un mínimo que protege el margen de la clínica. Ver docs/diseño/motor-viral-economico.md.
// D6: la app NO cobra; este saldo es informativo y la clínica lo aplica al cobrar fuera.

class ReglasDescuento {
  final double porRachaMensual; // € si mantuvo racha el mes
  final double porReferido; // € por cada amigo activo (la clínica puede topar el nº)
  final double porHito; // € por reto maestro / subida de etapa (bono puntual)
  final double cuotaBase; // cuota mensual de referencia
  final double cuotaMinima; // suelo: la cuota nunca baja de aquí

  // Valores por defecto alineados con docs/MODELO_PRECIOS.md (editables por clínica).
  const ReglasDescuento({
    this.porRachaMensual = 2,
    this.porReferido = 1,
    this.porHito = 1,
    this.cuotaBase = 12,
    this.cuotaMinima = 4,
  });
}

class DescuentoSudado {
  /// Descuento total acumulado (€), según las acciones del paciente.
  static double calcular({
    required bool mantuvoRachaMes,
    required int referidosAltaConfirmada,
    required int hitosLogrados,
    ReglasDescuento reglas = const ReglasDescuento(),
  }) {
    final bruto = (mantuvoRachaMes ? reglas.porRachaMensual : 0) +
        referidosAltaConfirmada * reglas.porReferido +
        hitosLogrados * reglas.porHito;
    // El descuento no puede superar (cuotaBase - cuotaMinima): protege el margen.
    final tope = reglas.cuotaBase - reglas.cuotaMinima;
    return bruto > tope ? tope : bruto;
  }

  /// Cuota que vería el paciente tras aplicar su descuento (informativa).
  static double cuotaConDescuento(double descuento,
      {ReglasDescuento reglas = const ReglasDescuento()}) {
    final cuota = reglas.cuotaBase - descuento;
    return cuota < reglas.cuotaMinima ? reglas.cuotaMinima : cuota;
  }
}
