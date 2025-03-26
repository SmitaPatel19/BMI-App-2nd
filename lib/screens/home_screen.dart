import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../utils/bmi_calculator.dart';
import '../utils/storage_service.dart';
import '../widgets/bmi_input.dart';
import '../widgets/bmi_result.dart';
import '../screens/history_screen.dart';
import '../widgets/bmi_chart.dart';
import '../utils/health_tips.dart';
import '../utils/speech_input.dart';
import '../utils/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController hgtCon = TextEditingController();
  final TextEditingController wgtCon = TextEditingController();
  String result = "";
  Color bgColor = Colors.deepPurple.shade100;
  String animationPath = 'assets/healthy.json';
  List<String> bmiHistory = [];
  String healthTip = "";

  @override
  void initState() {
    super.initState();
    loadHistory();
    healthTip = HealthTips.getRandomTip();
  }

  void calculateBMI() async {
    var bmiData = BMICalculator.calculateBMI(hgtCon.text, wgtCon.text);
    if (bmiData['error'] != null) {
      setState(() {
        result = bmiData['error'];
        bgColor = Colors.red.shade100;
        animationPath = 'assets/error.json';
      });
      return;
    }

    setState(() {
      result = bmiData['message'];
      bgColor = bmiData['color'];
      animationPath = bmiData['animation'];
      healthTip = HealthTips.getRandomTip();
    });

    await StorageService.saveBMI(result);
    loadHistory();
  }

  void loadHistory() async {
    List<String> savedHistory = await StorageService.getBMIHistory();
    setState(() {
      bmiHistory = savedHistory;
    });
  }

  void clearHistory() async {
    await StorageService.clearHistory();
    setState(() {
      bmiHistory = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('BMI Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: clearHistory,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(animationPath, height: 200),
            const SizedBox(height: 10),
            BMIInput(hgtCon: hgtCon, wgtCon: wgtCon),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => SpeechInput.listen(hgtCon, wgtCon),
              child: const Text("Voice Input"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20),
            BMIResult(result: result),
            const SizedBox(height: 20),
            Text("💡 $healthTip", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen())),
              child: const Text("View History"),
            ),
            const SizedBox(height: 20),
            BMIChart(history: bmiHistory),
          ],
        ),
      ),
    );
  }
}
