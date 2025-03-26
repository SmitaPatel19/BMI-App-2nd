import 'dart:math';

class HealthTips {
  static final List<String> _tips = [
    "Drink plenty of water to stay hydrated. 💧",
    "Eat more fruits and vegetables for better nutrition. 🥦🍎",
    "Exercise at least 30 minutes a day to stay fit. 🏃‍♂️",
    "Get enough sleep (7-9 hours) for better health. 😴",
    "Reduce sugar intake to prevent weight gain and diabetes. 🚫🍬",
    "Maintain good posture to avoid back pain. 🪑",
    "Practice deep breathing for stress relief. 🌬️",
    "Stretch daily to improve flexibility and prevent injuries. 🤸‍♂️",
    "Limit screen time to protect your eyes. 👀",
    "Avoid processed foods and eat fresh meals. 🍽️",
  ];

  static String getRandomTip() {
    final random = Random();
    return _tips[random.nextInt(_tips.length)];
  }
}
