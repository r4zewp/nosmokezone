// lib/screens/community_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityScreen extends StatelessWidget {
  final String telegramGroupUrl = 'https://t.me/your_group_link';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сообщество'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Присоединиться к сообществу'),
          onPressed: () async {
            if (await canLaunch(telegramGroupUrl)) {
              await launch(telegramGroupUrl);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Не удалось открыть ссылку')),
              );
            }
          },
        ),
      ),
    );
  }
}
