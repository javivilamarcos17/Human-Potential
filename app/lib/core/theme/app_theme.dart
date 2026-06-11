// app_theme.dart — Tema visual de Anti Frágil (ESPEJO de los design tokens).
//
// Fuente de verdad estética: docs/diseño/sistema-diseno.md (+ mockups/prototipo/tokens.css).
// Cambiar la estética = cambiar los tokens allí y reflejarlos aquí. Nada de colores sueltos
// por las pantallas: siempre AppTokens. La marca blanca (D2) sobreescribirá estos valores
// por clínica desde `clinicas.marca` (JSON).

import 'package:flutter/material.dart';

/// Tokens de diseño — espejo 1:1 de tokens.css.
class AppTokens {
  // Base (modo oscuro premium)
  static const Color bg = Color(0xFF0A1626);
  static const Color texto = Color(0xFFF2F6FA);
  static const Color textoSuave = Color(0xFF8DA2B8);
  static const Color panel = Color(0x0EFFFFFF); // blanco al 5.5%
  static const Color linea = Color(0x17FFFFFF); // blanco al 9%

  // Marca y acción
  static const Color primario = Color(0xFF2ECC8F);
  static const Color primarioOsc = Color(0xFF1AA870);
  static const Color dorado = Color(0xFFF4C430);

  // Arquetipos
  static const Color agua = Color(0xFF5BD0E8);
  static const Color aguaOsc = Color(0xFF2E86C1);
  static const Color tierra = Color(0xFFC9A36B);
  static const Color tierraOsc = Color(0xFF8A6B3F);
  static const Color viento = Color(0xFFB8C6F2);
  static const Color vientoOsc = Color(0xFF5C6BC0);

  // Estados clínicos (semáforos — siempre acompañados de icono/texto)
  static const Color rojo = Color(0xFFE53935);
  static const Color ambar = Color(0xFFFFA726);
  static const Color verdeOk = Color(0xFF2ECC8F);

  // Radios
  static const double radioS = 12, radioM = 16, radioL = 22, radioXl = 36;

  // Movimiento
  static const Duration tRapida = Duration(milliseconds: 170);
  static const Duration tMedia = Duration(milliseconds: 320);
}

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppTokens.bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTokens.primario,
          brightness: Brightness.dark,
          surface: AppTokens.bg,
        ),
        // Tipografía: Nunito (display) + Inter (texto). El equipo añadirá las fuentes
        // (google_fonts o assets) respetando la escala 11·13·15·17·22·28·44.
        cardTheme: CardThemeData(
          color: AppTokens.panel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTokens.radioL),
            side: const BorderSide(color: AppTokens.linea),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppTokens.primario,
            foregroundColor: const Color(0xFF06281C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTokens.radioM),
            ),
          ),
        ),
      );
}
