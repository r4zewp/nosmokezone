// lib/services/data_service.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/progress.dart';
import '../models/achievment.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  static const String progressKey = 'user_progress';
  static const String achievementsKey = 'user_achievements';

  Future<void> saveProgress(Progress progress) async {
    final prefs = await SharedPreferences.getInstance();
    String progressJson = jsonEncode(progress.toJson());
    prefs.setString(progressKey, progressJson);
  }

  Future<Progress?> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    String? progressString = prefs.getString(progressKey);
    if (progressString != null) {
      Map<String, dynamic> json = jsonDecode(progressString);
      return Progress.fromJson(json);
    }
    return null;
  }

  Future<void> saveAchievements(List<Achievement> achievements) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> achievementsJson =
        achievements.map((a) => jsonEncode(a.toJson())).toList();
    prefs.setStringList(achievementsKey, achievementsJson);
  }

  Future<List<Achievement>> loadAchievements() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? achievementsJson = prefs.getStringList(achievementsKey);
    if (achievementsJson != null) {
      return achievementsJson
          .map((jsonString) => Achievement.fromJson(jsonDecode(jsonString)))
          .toList();
    }
    // Если данных нет, возвращаем список достижений по умолчанию
    return defaultAchievements;
  }

  List<Achievement> get defaultAchievements => [
        Achievement(
          id: 'achv_1day',
          title: 'Первый день',
          description: 'Вы прожили 1 день без курения!',
          daysRequired: 1,
        ),
        Achievement(
          id: 'achv_7days',
          title: 'Неделя без сигарет',
          description: 'Целая неделя без курения!',
          daysRequired: 7,
        ),
        Achievement(
          id: 'achv_30days',
          title: 'Месяц победы',
          description: '30 дней без сигарет!',
          daysRequired: 30,
        ),
        // Добавьте другие достижения
      ];
}
