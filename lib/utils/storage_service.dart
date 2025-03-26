import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveBMI(String bmiResult) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('bmiHistory') ?? [];
    history.add(bmiResult);
    await prefs.setStringList('bmiHistory', history);
  }

  static Future<List<String>> getBMIHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('bmiHistory') ?? [];
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('bmiHistory');
  }
}
