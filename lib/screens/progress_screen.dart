// lib/screens/progress_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/progress_provider.dart';
import '../providers/achievment_provider.dart';
import '../widgets/progress_widget.dart';
import '../widgets/quote_widget.dart';
import '../widgets/health_tip_widget.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<ProgressProvider>(context);
    final achievementProvider = Provider.of<AchievementProvider>(context);

    final progress = progressProvider.progress!;

    // Обновляем достижения на основе текущего прогресса
    achievementProvider.updateAchievements(progress.daysWithoutSmoking);

    return SingleChildScrollView(
      child: Column(
        children: [
          ProgressWidget(progress: progress),
          QuoteWidget(),
          HealthTipWidget(daysWithoutSmoking: progress.daysWithoutSmoking),
        ],
      ),
    );
  }
}
