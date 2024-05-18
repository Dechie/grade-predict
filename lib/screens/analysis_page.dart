import 'package:flutter/material.dart';
import 'package:mlbasic/widgets/blur_component.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
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
              const Expanded(
                flex: 16,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            BlurComponent(
                              height: 50,
                              width: 80,
                              widget: Text('Accuracy: 90%'),
                            ),
                            SizedBox(width: 10),
                            BlurComponent(
                              height: 50,
                              width: 80,
                              widget: Text('Accuracy: 90%'),
                            ),
                            SizedBox(width: 10),
                            BlurComponent(
                              height: 50,
                              width: 80,
                              widget: Text('Accuracy: 90%'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            BlurComponent(
                              height: 30,
                              width: 30,
                              widget: Text('Accuracy: 90%'),
                            ),
                            SizedBox(width: 10),
                            BlurComponent(
                              height: 30,
                              width: 30,
                              widget: Text('Accuracy: 90%'),
                            ),
                            SizedBox(width: 10),
                            BlurComponent(
                              height: 30,
                              width: 30,
                              widget: Text('Accuracy: 90%'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            BlurComponent(
                              height: 30,
                              width: 30,
                              widget: Text('Accuracy: 90%'),
                            ),
                            SizedBox(width: 10),
                            BlurComponent(
                              height: 30,
                              width: 30,
                              widget: Text('Accuracy: 90%'),
                            ),
                            SizedBox(width: 10),
                            BlurComponent(
                              height: 30,
                              width: 30,
                              widget: Text('Accuracy: 90%'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
