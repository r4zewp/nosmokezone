// lib/utils/constants.dart
class Constants {
  static const List<String> motivationalQuotes = [
    'Каждый день без сигарет приближает вас к здоровью.',
    'Вы сильнее своих привычек.',
    'Ваше будущее зависит от того, что вы делаете сегодня.',
    'Отказ от курения — лучший подарок себе.',
    'Дышите свободно, живите полноценно.',
  ];

  static const List<Map<String, dynamic>> healthTips = [
    {
      'days': 1,
      'message': 'Через 24 часа после отказа от курения снижается риск сердечного приступа.',
    },
    {
      'days': 3,
      'message': 'Через 72 часа дыхание становится легче, увеличивается объем легких.',
    },
    {
      'days': 7,
      'message': 'Через неделю повышается уровень энергии, улучшается обоняние и вкус.',
    },
    // Добавьте больше советов
  ];

  static String getHealthTip(int daysWithoutSmoking) {
    String defaultTip = 'Продолжайте в том же духе! Ваше здоровье улучшается с каждым днем.';
    for (var tip in healthTips.reversed) {
      if (daysWithoutSmoking >= tip['days']) {
        return tip['message'];
      }
    }
    return defaultTip;
  }
}
