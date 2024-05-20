import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mlbasic/api/api.dart';
import 'package:mlbasic/screens/analysis_page.dart';
import 'package:mlbasic/screens/questionnair_page.dart';
import 'package:mlbasic/screens/secondpage.dart';
import 'package:mlbasic/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiInst();
  }

  Future<void> apiInst() async {
    var api = await Api.create();
  }

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
        child: ClipRRect(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      const CustomTextField(),
                      const SizedBox(height: 20),
                      const CustomTextField(),
                      const SizedBox(height: 20),
                      const CustomTextField(),
                      const SizedBox(height: 20),
                      const CustomTextField(),
                      const SizedBox(height: 20),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, const QuestionnairePage());
                        },
                        child: Text(
                          'Second Page',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, const AnalysisPage());
                        },
                        child: Text(
                          'Analysis Page',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w700,
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
      )),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          focusColor: Colors.white.withOpacity(0.4),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.4),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
