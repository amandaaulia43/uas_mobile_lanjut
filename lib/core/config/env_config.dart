class EnvConfig {
  EnvConfig._();

  // Menangkap variabel environment saat build aplikasi
  static const String environment = String.fromEnvironment('ENV_NAME', defaultValue: 'DEV');
  static const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: 'https://api.publicapis.org/');

  // Getter untuk mengecek apakah aplikasi berjalan di mode Production
  static bool get isProduction => environment == 'PROD';
}