// lib/services/telegram_service.dart
import 'dart:js' as js;
import 'package:flutter/material.dart';
import '../js/telegram_web_app.dart';
import '../models/user.dart';

class TelegramService {
  static final TelegramService _instance = TelegramService._internal();
  factory TelegramService() => _instance;
  TelegramService._internal();

  late User currentUser;
  late String initData;
  late dynamic initDataUnsafe;
  late String colorScheme;
  late Map<String, dynamic> themeParams;

  Future<void> init() async {
    // Получаем данные из JavaScript API
    initData = js.context['Telegram']['WebApp']['initData'];
    initDataUnsafe = js.context['Telegram']['WebApp']['initDataUnsafe'];

    // Извлекаем данные пользователя
    currentUser = User.fromJson(Map<String, dynamic>.from(initDataUnsafe['user']));

    // Получаем параметры темы
    colorScheme = js.context['Telegram']['WebApp']['colorScheme'];
    themeParams = Map<String, dynamic>.from(js.context['Telegram']['WebApp']['themeParams']);
  }

  String get userName => currentUser.firstName;

  ThemeData getThemeData() {
    // Создаем тему на основе параметров Telegram
    Color primaryColor = _hexToColor(themeParams['button_color'] ?? '#0088cc');
    Color backgroundColor = _hexToColor(themeParams['bg_color'] ?? '#ffffff');

    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
      ),
    );
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF' + hex; // Добавляем прозрачность
    }
    return Color(int.parse('0x$hex'));
  }

  void closeWebApp() {
    js.context.callMethod('close');
  }
}
