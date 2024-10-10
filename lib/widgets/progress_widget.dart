// lib/widgets/progress_widget.dart
import 'package:flutter/material.dart';
import '../models/progress.dart';

class ProgressWidget extends StatelessWidget {
  final Progress progress;

  ProgressWidget({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Дата отказа от курения'),
            trailing: Text(progress.formattedStartDate),
          ),
          ListTile(
            leading: Icon(Icons.smoke_free),
            title: Text('Дней без курения'),
            trailing: Text('${progress.daysWithoutSmoking}'),
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Сэкономлено денег'),
            trailing:
                Text('${progress.moneySaved.toStringAsFixed(2)} руб.'),
          ),
        ],
      ),
    );
  }
}
