// lib/screens/achievements_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/achievment_provider.dart';
import '../widgets/achievment_widget.dart';

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final achievementProvider = Provider.of<AchievementProvider>(context);
    final achievements = achievementProvider.achievements;

    return Scaffold(
      appBar: AppBar(
        title: Text('Достижения'),
      ),
      body: ListView.builder(
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final achievement = achievements[index];
          return AchievementWidget(achievement: achievement);
        },
      ),
    );
  }
}
