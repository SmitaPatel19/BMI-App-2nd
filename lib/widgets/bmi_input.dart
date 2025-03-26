import 'package:flutter/material.dart';

class BMIInput extends StatelessWidget {
  final TextEditingController hgtCon;
  final TextEditingController wgtCon;

  const BMIInput({super.key, required this.hgtCon, required this.wgtCon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: hgtCon,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter Height (cm)',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: const Icon(Icons.height_outlined, color: Colors.deepPurple),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: wgtCon,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter Weight (kg)',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: const Icon(Icons.line_weight, color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}
