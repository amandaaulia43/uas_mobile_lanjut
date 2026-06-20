import 'package:flutter/material.dart';
import '../../../../core/config/env_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UAS App [${EnvConfig.environment}]'),
        // Jika Production warnanya Hijau, jika Dev warnanya BlueGrey (Abu-abu biru)
        backgroundColor: EnvConfig.isProduction ? Colors.green : Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.rocket_launch, size: 100, color: Colors.blueAccent),
            const SizedBox(height: 20),
            const Text('Skeleton Project Siap!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Base URL: ${EnvConfig.baseUrl}', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}