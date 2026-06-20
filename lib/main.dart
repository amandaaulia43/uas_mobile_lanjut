import 'package:flutter/material.dart';
import 'core/di/injection.dart';
import 'core/routing/app_router.dart';
import 'core/config/env_config.dart';

void main() {
  // Wajib dipanggil jika menggunakan fungsi async sebelum runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Menjalankan Dependency Injection dasar (Dio dll)
  setupLocator();

  runApp(const FinalProjectApp());
}

class FinalProjectApp extends StatelessWidget {
  const FinalProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Menyembunyikan banner debug jika aplikasi berada di mode Production
      debugShowCheckedModeBanner: !EnvConfig.isProduction,
      title: 'UAS Mobile Lanjut',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      // Menghubungkan konfigurasi GoRouter kita ke aplikasi
      routerConfig: AppRouter.router,
    );
  }
}