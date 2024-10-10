// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import '../services/telegram_service.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final telegramService = Provider.of<TelegramService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Пользователь'),
            subtitle: Text(telegramService.userName),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Закрыть приложение'),
            onTap: () {
              telegramService.closeWebApp();
            },
          ),
          // Добавьте другие настройки
        ],
      ),
    );
  }
}
