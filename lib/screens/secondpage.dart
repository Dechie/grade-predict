import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';
import '../widgets/chart_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<List<FlSpot>> spotsData = [];
  List<String> titles = [
    "G3 vs G1",
    "G3 vs G2",
    "G3 vs Medu",
    "G3 vs age",
    "G3 vs failures",
    "G3 vs higher",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/exam_main.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 16,
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: List.generate(spotsData.length, (index) {
                      return ChartWidget(
                        data: spotsData[index],
                        title: titles[index],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchSpots() async {
    var api = await Api.create();
    spotsData = await api.getCorrelations();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchSpots();
  }
}
