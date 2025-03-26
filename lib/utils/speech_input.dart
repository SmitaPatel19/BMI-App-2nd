import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechInput {
  static final stt.SpeechToText _speech = stt.SpeechToText();

  static void listen(TextEditingController heightController, TextEditingController weightController) async {
    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(
        onResult: (result) {
          String spokenText = result.recognizedWords;
          if (spokenText.contains("height")) {
            heightController.text = spokenText.replaceAll(RegExp(r'[^0-9]'), '');
          } else {
            weightController.text = spokenText.replaceAll(RegExp(r'[^0-9]'), '');
          }
        },
      );
    }
  }
}
