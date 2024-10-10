// lib/providers/achievement_provider.dart
import 'package:flutter/material.dart';
import 'package:stop_smoking/models/achievment.dart';
import '../services/data_service.dart';

class AchievementProvider with ChangeNotifier {
  List<Achievement> _achievements = [];
  final DataService _dataService = DataService();

  List<Achievement> get achievements => _achievements;

  AchievementProvider() {
    loadAchievements();
  }

  Future<void> loadAchievements() async {
    _achievements = await _dataService.loadAchievements();
    notifyListeners();
  }

  Future<void> updateAchievements(int daysWithoutSmoking) async {
    for (var achievement in _achievements) {
      if (!achievement.isUnlocked &&
          daysWithoutSmoking >= achievement.daysRequired) {
        achievement.isUnlocked = true;
        achievement.unlockDate = DateTime.now();
        // Можно добавить уведомление о новом достижении
      }
    }
    await _dataService.saveAchievements(_achievements);
    notifyListeners();
  }
}
