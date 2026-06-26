import 'package:flutter/material.dart';
import '../../../../core/config/env_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menangkap apakah aplikasi berjalan di mode PROD
    final isProd = EnvConfig.isProduction;

    return Scaffold(
      appBar: AppBar(
        // Menampilkan judul dinamis sesuai environment dan data personal kamu
        title: Text(isProd ? 'UTD - 20123043' : 'DEV - Amanda'),
        // Jika PROD wajib Biru Gelap (Indigo/Blue Dark), jika DEV abu-abu-biru bebas
        backgroundColor: isProd ? const Color(0xFF0D47A1) : Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.newspaper, 
              size: 100, 
              color: isProd ? const Color(0xFF0D47A1) : Colors.blueAccent
            ),
            const SizedBox(height: 20),
            Text(
              isProd ? 'Production Mode' : 'Development Mode', 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 10),
            const Text(
              'Tema: DigiNews Offline-First', 
              style: TextStyle(color: Colors.grey)
            ),
          ],
        ),
      ),
    );
  }
}