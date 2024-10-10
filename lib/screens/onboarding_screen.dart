// lib/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/progress.dart';
import '../providers/progress_provider.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  final _cigarettePackPriceController = TextEditingController();
  final _cigarettesPerDayController = TextEditingController();

  @override
  void dispose() {
    _cigarettePackPriceController.dispose();
    _cigarettesPerDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progressProvider =
        Provider.of<ProgressProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Начало пути'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Поля для ввода данных
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Дата отказа от курения',
                ),
                readOnly: true,
                onTap: () async {
                  DateTime initialDate = DateTime.now();
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: initialDate.subtract(Duration(days: 365)),
                    lastDate: initialDate,
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _startDate = pickedDate;
                    });
                  }
                },
                validator: (value) {
                  if (_startDate == null) {
                    return 'Пожалуйста, выберите дату';
                  }
                  return null;
                },
                controller: TextEditingController(
                  text: _startDate != null
                      ? '${_startDate!.day}.${_startDate!.month}.${_startDate!.year}'
                      : '',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Стоимость пачки сигарет (руб.)',
                ),
                keyboardType:
                    TextInputType.numberWithOptions(decimal: true),
                controller: _cigarettePackPriceController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.tryParse(value.replaceAll(',', '.')) == null) {
                    return 'Введите корректное число';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Количество сигарет в день',
                ),
                keyboardType: TextInputType.number,
                controller: _cigarettesPerDayController,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      int.tryParse(value) == null) {
                    return 'Введите корректное число';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Начать'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Progress progress = Progress(
                      startDate: _startDate!,
                      cigarettePackPrice: double.parse(
                          _cigarettePackPriceController.text
                              .replaceAll(',', '.')),
                      cigarettesPerDay:
                          int.parse(_cigarettesPerDayController.text),
                    );
                    await progressProvider.updateProgress(progress);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
