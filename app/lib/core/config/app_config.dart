// app_config.dart — Lectura de configuración/variables de entorno.
//
// BOCETO: las claves NO se escriben aquí. Se leen del entorno (.env) en tiempo de
// ejecución o de compilación. Nunca se commitean valores reales (ver .env.example).

class AppConfig {
  // El equipo cargará estos valores desde el entorno (ej. con --dart-define o un .env).
  static const String supabaseUrl =
      String.fromEnvironment('SUPABASE_URL', defaultValue: '');
  static const String supabaseAnonKey =
      String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');
}
