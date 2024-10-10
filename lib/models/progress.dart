// lib/models/progress.dart
import 'package:intl/intl.dart';

class Progress {
  DateTime startDate;
  double cigarettePackPrice;
  int cigarettesPerDay;

  Progress({
    required this.startDate,
    required this.cigarettePackPrice,
    required this.cigarettesPerDay,
  });

  int get daysWithoutSmoking {
    return DateTime.now().difference(startDate).inDays;
  }

  double get moneySaved {
    double dailyExpense = (cigarettesPerDay / 20) * cigarettePackPrice;
    return daysWithoutSmoking * dailyExpense;
  }

  String get formattedStartDate {
    final formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(startDate);
  }

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate.toIso8601String(),
      'cigarettePackPrice': cigarettePackPrice,
      'carettesPerDay': cigarettesPerDay,
    };
  }

  factory Progress.fromJson(Map<String, dynamic> json) {
    return Progress(
      startDate: DateTime.parse(json['startDate']),
      cigarettePackPrice: json['cigarettePackPrice'],
      cigarettesPerDay: json['carettesPerDay'],
    );
  }
}
