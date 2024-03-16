import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/message.dart';
import 'providers/messages_provider.dart';

class DayOfWeek extends ConsumerWidget {
  const DayOfWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Message> messages = ref.watch(fetchMessagesProvider);

    // Count the number of messages sent on each day of the week
    Map<int, int> messageCountByDay = {};
    for (Message message in messages) {
      DateTime timestamp = message.timestamp;
      int dayOfWeek = timestamp.weekday;
      messageCountByDay[dayOfWeek] = (messageCountByDay[dayOfWeek] ?? 0) + 1;
    }

    // Prepare data for the bar chart
    List<BarChartGroupData> barChartData = [];
    for (int dayOfWeek = 1; dayOfWeek <= 7; dayOfWeek++) {
      int messageCount = messageCountByDay[dayOfWeek] ?? 0;
      barChartData.add(
        BarChartGroupData(
          x: dayOfWeek,
          barRods: [
            BarChartRodData(
              fromY: 0,
              toY: messageCount.toDouble(),
              color: Colors.blue,
            ),
          ],
        ),
      );
    }

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: messageCountByDay.entries
            .map((entry) => entry.value)
            .reduce((a, b) => a > b ? a : b)
            .toDouble(),
        titlesData: const FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(),
        ),
        borderData: FlBorderData(show: false),
        barGroups: barChartData,
      ),
    );
  }
}
