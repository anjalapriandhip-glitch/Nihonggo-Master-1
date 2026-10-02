import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/kotoba_screen.dart';
import 'screens/bunpo_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/progress_screen.dart';

void main() {
  runApp(const NihongoMasterApp());
}

class NihongoMasterApp extends StatelessWidget {
  const NihongoMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nihongo Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
        cardTheme: const CardThemeData(
          elevation: 0,
          margin: EdgeInsets.symmetric(vertical: 6),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreen(),
        '/kotoba': (_) => const KotobaScreen(),
        '/bunpo': (_) => const BunpoScreen(),
        '/quiz': (_) => const QuizScreen(),
        '/progress': (_) => const ProgressScreen(),
      },
    );
  }
}
