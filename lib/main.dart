// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/telegram_service.dart';
import 'providers/progress_provider.dart';
import 'providers/achievment_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализируем сервис Telegram
  TelegramService telegramService = TelegramService();
  await telegramService.init();

  runApp(
    MultiProvider(
      providers: [
        Provider<TelegramService>.value(value: telegramService),
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
        ChangeNotifierProvider(create: (_) => AchievementProvider()),
      ],
      child: QuitSmokingApp(),
    ),
  );
}

class QuitSmokingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Получаем информацию о цветовой схеме из Telegram Web App
    final telegramService = Provider.of<TelegramService>(context, listen: false);
    final theme = telegramService.getThemeData();

    return MaterialApp(
      title: 'Помощник для бросающих курить',
      theme: theme,
      home: HomeScreen(),
    );
  }
}
