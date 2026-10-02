
import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static Future<void> addLearned() async {
    final p = await SharedPreferences.getInstance();
    await p.setInt('learned', (p.getInt('learned') ?? 0) + 1);
  }
  static Future<void> addQuizCorrect() async {
    final p = await SharedPreferences.getInstance();
    await p.setInt('correct', (p.getInt('correct') ?? 0) + 1);
  }
  static Future<Map<String,int>> get() async {
    final p = await SharedPreferences.getInstance();
    return {'learned': p.getInt('learned') ?? 0, 'correct': p.getInt('correct') ?? 0};
  }
}
