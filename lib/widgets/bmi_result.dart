import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  final String result;

  const BMIResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Text(
      result,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.blue, // Text color
      ),
      textAlign: TextAlign.center,
    );
  }
}
