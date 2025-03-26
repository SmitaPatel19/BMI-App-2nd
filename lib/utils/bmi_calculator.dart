import 'package:flutter/material.dart';

class BMICalculator {
  static Map<String, dynamic> calculateBMI(String heightText, String weightText) {
    if (heightText.isEmpty || weightText.isEmpty) {
      return {'error': "Please enter both height and weight"};
    }

    double height = double.tryParse(heightText) ?? 0;
    double weight = double.tryParse(weightText) ?? 0;
    if (height <= 0 || weight <= 0) {
      return {'error': "Invalid values. Please enter valid numbers"};
    }

    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);
    String msg;
    Color bgColor;
    String animationPath;

    if (bmi < 18.5) {
      msg = "Underweight - BMI: ${bmi.toStringAsFixed(2)}";
      bgColor = Colors.blue.shade200;
      animationPath = 'assets/underweight.json';
    } else if (bmi >= 25) {
      msg = "Overweight - BMI: ${bmi.toStringAsFixed(2)}";
      bgColor = Colors.orange.shade200;
      animationPath = 'assets/overweight.json';
    } else {
      msg = "Healthy - BMI: ${bmi.toStringAsFixed(2)}";
      bgColor = Colors.green.shade200;
      animationPath = 'assets/healthy.json';
    }

    return {
      'message': msg,
      'color': bgColor,
      'animation': animationPath,
    };
  }
}
