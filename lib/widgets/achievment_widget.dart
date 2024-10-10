// lib/widgets/achievement_widget.dart
import 'package:flutter/material.dart';
import '../models/achievment.dart';

class AchievementWidget extends StatelessWidget {
  final Achievement achievement;

  AchievementWidget({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: achievement.isUnlocked ? Colors.white : Colors.grey[300],
      child: ListTile(
        leading: Icon(
          achievement.isUnlocked ? Icons.star : Icons.star_border,
          color: achievement.isUnlocked ? Colors.amber : Colors.grey,
        ),
        title: Text(achievement.title),
        subtitle: Text(achievement.description),
        trailing: achievement.isUnlocked
            ? Text(
                'Получено',
                style: TextStyle(color: Colors.green),
              )
            : Text('Не получено'),
      ),
    );
  }
}
