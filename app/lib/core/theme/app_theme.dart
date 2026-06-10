// app_theme.dart — Tema visual base de Anti Frágil.
//
// BOCETO: colores y estilo de partida. El diseño visual final lo define el dueño +
// diseñador. Pensado para ser editable: cambiar la paleta aquí cambia toda la app.
// (La marca blanca futura sobrescribirá estos valores por clínica — ver ADR-002.)

import 'package:flutter/material.dart';

class AppTheme {
  // Paleta provisional — limpia y clínica con acento vital.
  static const Color azulVital = Color(0xFF2D9CDB);
  static const Color verdeEnergia = Color(0xFF27AE60);
  static const Color fondoClaro = Color(0xFFF5F7FA);

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: azulVital,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: fondoClaro,
      );
}
