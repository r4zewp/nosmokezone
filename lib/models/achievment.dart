// lib/models/achievement.dart
class Achievement {
  final String id;
  final String title;
  final String description;
  final int daysRequired;
  bool isUnlocked;
  DateTime? unlockDate;

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.daysRequired,
    this.isUnlocked = false,
    this.unlockDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'daysRequired': daysRequired,
      'isUnlocked': isUnlocked,
      'unlockDate': unlockDate?.toIso8601String(),
    };
  }

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      daysRequired: json['daysRequired'],
      isUnlocked: json['isUnlocked'],
      unlockDate: json['unlockDate'] != null
          ? DateTime.parse(json['unlockDate'])
          : null,
    );
  }
}
