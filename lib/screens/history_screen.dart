import 'package:flutter/material.dart';
import '../utils/storage_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> bmiHistory = [];

  @override
  void initState() {
    super.initState();
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
      bmiHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI History', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: clearHistory,
          ),
        ],
      ),
      body: bmiHistory.isEmpty
          ? const Center(child: Text("No history available"))
          : ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: bmiHistory.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(bmiHistory[index]),
            ),
          );
        },
      ),
    );
  }
}
