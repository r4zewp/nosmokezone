// lib/utils/helpers.dart
import 'package:intl/intl.dart';

class Helpers {
  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }

  static String formatCurrency(double amount) {
    return amount.toStringAsFixed(2) + ' руб.';
  }

  // Добавьте другие вспомогательные функции при необходимости
}
