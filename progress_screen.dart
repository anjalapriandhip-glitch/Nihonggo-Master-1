
import 'package:flutter/material.dart';
import '../services/progress_service.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Belajar'),
      ),
      body: FutureBuilder<Map<String, int>>(
        future: ProgressService.get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Card(
                child: ListTile(
                  title: Text(
                    'Progress Belajar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Lihat perkembangan belajar bahasa Jepang kamu.',
                  ),
                ),
              ),
              const SizedBox(height: 12),

              ...data.entries.map(
                (entry) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.check_circle),
                    title: Text(entry.key),
                    trailing: Text(
                      '${entry.value}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
