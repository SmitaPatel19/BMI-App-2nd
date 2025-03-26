import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BMIChart extends StatelessWidget {
  final List<String> history;

  const BMIChart({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    double interval = (history.length ~/ 5).toDouble();
    interval = interval == 0 ? 1 : interval; // Ensure interval is at least 1

    double minY = history.isNotEmpty
        ? history.map((e) => double.tryParse(e.split(' ')[2]) ?? 0.0).reduce((a, b) => a < b ? a : b) - 1
        : 0;
    double maxY = history.isNotEmpty
        ? history.map((e) => double.tryParse(e.split(' ')[2]) ?? 0.0).reduce((a, b) => a > b ? a : b) + 1
        : 50;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "BMI Trend Over Time",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: interval,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < history.length) {
                        return Transform.rotate(
                          angle: -0.5,
                          child: Text(history[index].split(' ')[0]), // Date
                        );
                      }
                      return const SizedBox();
                    },
                    reservedSize: 30,
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: history.asMap().entries.map((e) {
                    double bmiValue = double.tryParse(e.value.split(' ')[2]) ?? 0.0;
                    return FlSpot(e.key.toDouble(), bmiValue);
                  }).toList(),
                  isCurved: true,
                  color: Colors.purple,
                  barWidth: 4,
                  belowBarData: BarAreaData(show: true, color: Colors.purple.withOpacity(0.3)),
                  dotData: const FlDotData(show: true),
                ),
              ],
              minY: minY,
              maxY: maxY,
              borderData: FlBorderData(show: true),
              gridData: FlGridData(show: true),
            ),
          ),
        ),
      ],
    );
  }
}
