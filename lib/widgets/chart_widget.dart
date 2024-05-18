import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> data = const [
      FlSpot(6, 6),
      FlSpot(5, 6),
      FlSpot(8, 10),
      FlSpot(14, 15),
      FlSpot(10, 10),
      FlSpot(15, 15),
      FlSpot(12, 11),
      FlSpot(18, 19),
      FlSpot(8, 9),
      FlSpot(12, 12),
      FlSpot(14, 14),
      FlSpot(10, 11),
      FlSpot(16, 16),
      FlSpot(5, 5),
      FlSpot(15, 16),
      FlSpot(13, 12),
      FlSpot(9, 8),
      FlSpot(16, 15),
      FlSpot(11, 11),
      FlSpot(11, 12),
      FlSpot(16, 17),
      FlSpot(10, 12),
      FlSpot(7, 6),
      FlSpot(16, 18),
      FlSpot(13, 13),
      FlSpot(18, 18),
      FlSpot(8, 11),
      FlSpot(10, 9),
      FlSpot(8, 6),
      FlSpot(19, 20),
      FlSpot(15, 14),
      FlSpot(7, 7),
      FlSpot(11, 10),
      FlSpot(9, 10),
      FlSpot(9, 9),
      FlSpot(6, 5),
      FlSpot(12, 14),
      FlSpot(6, 7),
      FlSpot(7, 8),
      FlSpot(17, 18),
      FlSpot(13, 14),
      FlSpot(7, 5),
      FlSpot(17, 17),
      FlSpot(8, 8),
      FlSpot(19, 19),
      FlSpot(14, 13),
      FlSpot(11, 13),
      FlSpot(4, 0),
      FlSpot(0, 0),
      FlSpot(9, 0),
      FlSpot(7, 0),
      FlSpot(6, 0),
      FlSpot(5, 0),
      FlSpot(12, 13),
      FlSpot(9, 7),
      FlSpot(8, 7),
      FlSpot(11, 9),
      FlSpot(13, 11),
      FlSpot(7, 9),
      FlSpot(6, 4),
      FlSpot(6, 8),
      FlSpot(10, 0),
      FlSpot(9, 11),
      FlSpot(13, 15),
      FlSpot(8, 0),
      FlSpot(15, 17),
      FlSpot(12, 10),
    ];
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          width: 300,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: ScatterChart(
                ScatterChartData(
                  scatterSpots: data.map((e) => ScatterSpot(e.x, e.y)).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
