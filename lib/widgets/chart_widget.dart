import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final List<FlSpot> data;

  final String title;
  const ChartWidget({
    super.key,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .35,
          width: MediaQuery.of(context).size.width * .6,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ScatterChart(
                    ScatterChartData(
                      scatterSpots: data
                          .map(
                            (e) => ScatterSpot(
                              e.x,
                              e.y,
                              dotPainter:
                                  FlDotCirclePainter(color: Colors.blueAccent),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
