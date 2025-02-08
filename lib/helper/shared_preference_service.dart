import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static const String modeKey = "isPdfMode";

  // Save Mode to SharedPreferences
  static Future<void> saveMode(bool isPdfMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(modeKey, isPdfMode);
  }

  // Read Mode from SharedPreferences (default: true)
  static Future<bool> getMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(modeKey) ?? true;
  }

  // Remove Mode from SharedPreferences
  static Future<void> removeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(modeKey);
  }
}
