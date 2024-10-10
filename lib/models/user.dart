// lib/models/user.dart
class User {
  final int id;
  final bool isBot;
  final String firstName;
  final String? lastName;
  final String? username;
  final String? languageCode;

  User({
    required this.id,
    required this.isBot,
    required this.firstName,
    this.lastName,
    this.username,
    this.languageCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      isBot: json['is_bot'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      languageCode: json['language_code'],
    );
  }
}
