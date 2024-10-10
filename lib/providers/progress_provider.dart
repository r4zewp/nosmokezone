// lib/providers/progress_provider.dart
import 'package:flutter/material.dart';
import '../models/progress.dart';
import '../services/data_service.dart';

class ProgressProvider with ChangeNotifier {
  Progress? _progress;
  final DataService _dataService = DataService();

  Progress? get progress => _progress;

  ProgressProvider() {
    loadProgress();
  }

  Future<void> loadProgress() async {
    _progress = await _dataService.loadProgress();
    notifyListeners();
  }

  Future<void> updateProgress(Progress progress) async {
    _progress = progress;
    await _dataService.saveProgress(progress);
    notifyListeners();
  }

  bool get hasProgressData => _progress != null;
}
