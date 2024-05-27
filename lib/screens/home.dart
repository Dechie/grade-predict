import 'package:flutter/material.dart';
import 'package:mlbasic/screens/secondpage.dart';
import 'package:mlbasic/widgets/blur_component.dart';

import '../api/api.dart';
import '../utils.dart';
import 'questionnair_page.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          child: SizedBox(
            width: size.width * .8,
            height: size.height * .8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  BlurComponent(
                    height: 60,
                    width: double.infinity,
                    widget: Center(
                      child: GestureDetector(
                        onTap: () {
                          navigateTo(context, const QuestionnairePage());
                        },
                        child: const Text(
                          'Predict With Model',
                          style: TextStyle(
                            //color: Colors.white.withOpacity(0.6),
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlurComponent(
                    height: 60,
                    width: double.infinity,
                    widget: Center(
                      child: GestureDetector(
                        onTap: () {
                          navigateTo(context, const SecondPage());
                        },
                        child: const Text(
                          'Visualize Data',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: BlurComponent(
                      height: 60,
                      width: double.infinity,
                      widget: Center(
                        child: GestureDetector(
                          onTap: () {
                            calll();
                          },
                          child: const Text(
                            'Predict With Model',
                            style: TextStyle(
                              //  color: Colors.white.withOpacity(0.6),
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
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

  void calll() async {
    var api = await Api.create();
    api.getCorrelations();
  }
}
