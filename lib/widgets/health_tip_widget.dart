// lib/widgets/health_tip_widget.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class HealthTipWidget extends StatelessWidget {
  final int daysWithoutSmoking;

  HealthTipWidget({required this.daysWithoutSmoking});

  @override
  Widget build(BuildContext context) {
    final healthTip = Constants.getHealthTip(daysWithoutSmoking);

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Совет по здоровью',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            healthTip,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
