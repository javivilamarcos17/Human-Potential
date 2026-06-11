// main.dart — Punto de entrada de Anti Frágil.
//
// BOCETO: marca el arranque de la app y el orden del flujo. El equipo de desarrollo
// completará la inicialización de Supabase y la navegación real (go_router).

import 'package:flutter/material.dart';

// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO(equipo): inicializar Supabase con las variables de entorno (.env)
  // await Supabase.initialize(
  //   url: AppConfig.supabaseUrl,
  //   anonKey: AppConfig.supabaseAnonKey,
  // );

  runApp(const AntiFragilApp());
}

class AntiFragilApp extends StatelessWidget {
  const AntiFragilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anti Frágil',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      // Flujo de arranque: Onboarding → (Auditoría) → Dashboard.
      // El equipo lo sustituirá por go_router con rutas reales.
      home: const OnboardingScreen(),
    );
  }
}
