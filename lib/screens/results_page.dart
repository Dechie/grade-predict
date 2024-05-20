import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mlbasic/widgets/blur_component.dart';

import '../utils.dart';
import '../widgets/text_widget.dart';
import 'secondpage.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({
    super.key,
    required this.prediction,
  });

  final double prediction;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/exam_main.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: 'Result',
                                //color: Colors.grey.shade300.withOpacity(0.75),
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                text: widget.prediction.toStringAsFixed(2),
                                //color: Colors.grey.shade300.withOpacity(0.75),
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .7,
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: TextButton(
                                    onPressed: () {
                                      navigateTo(context, const SecondPage());
                                    },
                                    child: Text(
                                      'Second Page',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Back',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}