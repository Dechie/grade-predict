import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mlbasic/screens/secondpage.dart';
import 'package:mlbasic/widgets/text_widget.dart';

import '../api/api.dart';
import '../utils.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final _formKey = GlobalKey<FormState>();

  String _age = '', _famSup = '', _address = '', _sex = '';
  String _mJob = '', _fJob = '', _school = '', _nursery = '';
  String _pStatus = '', _guardian = '', _famSize = '', _schoolSup = '';
  String _reason = '', _higher = '', _internet = '', _romantic = '';

  int _mEdu = 0, _fEdu = 0, _travelTime = 0, _studyTime = 0, _failures = 4;
  int _g1 = 0, _g2 = 0, _goOut = 0;

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
                                text: 'Hello Student',
                                //color: Colors.grey.shade300.withOpacity(0.75),
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                text: 'Help Us Fill This Form',
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
                                  flex: 17,
                                  child: SingleChildScrollView(
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          // Sex
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Which School Do You Go To?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'GP',
                                                    groupValue: _school,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _school = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('GP'),
                                                  Radio(
                                                    value: 'MS',
                                                    groupValue: _school,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _school = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('MS'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is you Gender?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'F',
                                                    groupValue: _sex,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _sex = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Female'),
                                                  Radio(
                                                    value: 'M',
                                                    groupValue: _sex,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _sex = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Male'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is Your Age?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '(15-22)',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return 'Age is required';
                                                  }
                                                  // You can add more complex validation for Age format if needed
                                                  return null;
                                                },
                                                onSaved: (String? value) {
                                                  _age = value!;
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          // Address
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Where do you live?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'U',
                                                    groupValue: _address,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _address = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Urban'),
                                                  Radio(
                                                    value: 'R',
                                                    groupValue: _address,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _address = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Rural'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'What is the size of your Family?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'LE3',
                                                    groupValue: _famSize,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _famSize = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('3 and below'),
                                                  Radio(
                                                    value: 'GT3',
                                                    groupValue: _famSize,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _famSize = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('More than 3'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          // FamSup

                                          // FamSup
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Do you live with your parents or away from them?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'A',
                                                    groupValue: _pStatus,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _pStatus = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Away'),
                                                  Radio(
                                                    value: 'T',
                                                    groupValue: _pStatus,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _pStatus = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Together'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is your mother\'s educational level?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '0',
                                                    groupValue:
                                                        _mEdu.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mEdu =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('None'),
                                                  Radio(
                                                    value: '1',
                                                    groupValue:
                                                        _mEdu.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mEdu =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('4th grade'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '2',
                                                    groupValue:
                                                        _mEdu.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mEdu =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('5-9th Grade'),
                                                  Radio(
                                                    value: '3',
                                                    groupValue:
                                                        _mEdu.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mEdu =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('Secondary'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is your father\'s educational level?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '0',
                                                    groupValue:
                                                        _fEdu.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fEdu =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('None'),
                                                  Radio(
                                                    value: '1',
                                                    groupValue:
                                                        _fEdu.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fEdu =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('4th grade'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '2',
                                                    groupValue:
                                                        _fEdu.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fEdu =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('5-9th Grade'),
                                                  Radio(
                                                    value: '3',
                                                    groupValue:
                                                        _fEdu.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fEdu =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('Secondary'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is your mother\'s job?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'at_home',
                                                    groupValue: _mJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('housewife'),
                                                  Radio(
                                                    value: 'health',
                                                    groupValue: _mJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('health'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'services',
                                                    groupValue: _mJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Services'),
                                                  Radio(
                                                    value: 'teacher',
                                                    groupValue: _mJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Teacher'),
                                                  Radio(
                                                    value: 'other',
                                                    groupValue: _mJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Other'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is your Father\'s job?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'at_home',
                                                    groupValue: _fJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Stay-at-home'),
                                                  Radio(
                                                    value: 'health',
                                                    groupValue: _fJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Health'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'services',
                                                    groupValue: _fJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Services'),
                                                  Radio(
                                                    value: 'teacher',
                                                    groupValue: _fJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Teacher'),
                                                  Radio(
                                                    value: 'other',
                                                    groupValue: _fJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Other'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is your reason to join this school?',
                                                style:
                                                    TextStyle(fontSize: 17.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'course',
                                                    groupValue: _reason,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _reason = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('The Course'),
                                                  Radio(
                                                    value: 'home',
                                                    groupValue: _reason,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _reason = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Close to Home'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'reputation',
                                                    groupValue: _reason,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _reason = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Reputation'),
                                                  Radio(
                                                    value: 'other',
                                                    groupValue: _reason,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _reason = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Other'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Who is Your Guardian?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'mother',
                                                    groupValue: _guardian,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _guardian = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Mother'),
                                                  Radio(
                                                    value: 'father',
                                                    groupValue: _guardian,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _guardian = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Father'),
                                                  Radio(
                                                    value: 'other',
                                                    groupValue: _guardian,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _guardian = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Other'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'How long does it take you to travel from home to school?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '1',
                                                    groupValue:
                                                        _travelTime.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _travelTime =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('<15 min'),
                                                  Radio(
                                                    value: '2',
                                                    groupValue:
                                                        _travelTime.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _travelTime =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('15 - 30 min'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '3',
                                                    groupValue:
                                                        _travelTime.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _travelTime =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('30min to 1hr'),
                                                  Radio(
                                                    value: '4',
                                                    groupValue:
                                                        _travelTime.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _travelTime =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('>1hr'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'How many hours do you study per week?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '1',
                                                    groupValue:
                                                        _studyTime.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _studyTime =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('<2 hr'),
                                                  Radio(
                                                    value: '2',
                                                    groupValue:
                                                        _studyTime.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _studyTime =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('2-5 hr'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '3',
                                                    groupValue:
                                                        _studyTime.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _studyTime =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('5-10 hr'),
                                                  Radio(
                                                    value: '4',
                                                    groupValue:
                                                        _studyTime.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _studyTime =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('>10 hr'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'How many classes have you failed previously?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return 'Age is required';
                                                  }
                                                  // You can add more complex validation for Age format if needed
                                                  return null;
                                                },
                                                onSaved: (String? value) {
                                                  var intVal =
                                                      int.parse(value!);
                                                  if (1 <= intVal &&
                                                      intVal > 3) {
                                                    _failures = intVal;
                                                  } else {
                                                    _failures = 4;
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Do you get extra educational support?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'yes',
                                                    groupValue: _schoolSup,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _schoolSup = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Yes'),
                                                  Radio(
                                                    value: 'no',
                                                    groupValue: _schoolSup,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _schoolSup = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('No'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Does your family provide you educatonal support?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'yes',
                                                    groupValue: _famSup,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _famSup = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Yes'),
                                                  Radio(
                                                    value: 'no',
                                                    groupValue: _famSup,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _famSup = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('No'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Have You Attended Nursery?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'yes',
                                                    groupValue: _nursery,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _nursery = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Yes'),
                                                  Radio(
                                                    value: 'no',
                                                    groupValue: _nursery,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _nursery = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('No'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Do you want to take higher education?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'yes',
                                                    groupValue: _higher,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _higher = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Yes'),
                                                  Radio(
                                                    value: 'no',
                                                    groupValue: _higher,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _higher = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('No'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Do You have Internet Access?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'yes',
                                                    groupValue: _internet,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _internet = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Yes'),
                                                  Radio(
                                                    value: 'no',
                                                    groupValue: _internet,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _internet = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('No'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'Are You Engaged in Romantic Relationship?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: 'yes',
                                                    groupValue: _romantic,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _romantic = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('Yes'),
                                                  Radio(
                                                    value: 'no',
                                                    groupValue: _romantic,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _romantic = value!;
                                                      });
                                                    },
                                                  ),
                                                  Text('No'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'How often do you go out with friends?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '1',
                                                    groupValue:
                                                        _goOut.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _goOut =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('Very Rarely'),
                                                  Radio(
                                                    value: '2',
                                                    groupValue:
                                                        _goOut.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _goOut =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('Rarely'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '3',
                                                    groupValue:
                                                        _goOut.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _goOut =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('Sometimes'),
                                                  Radio(
                                                    value: '4',
                                                    groupValue:
                                                        _goOut.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _goOut =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('Often'),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Radio(
                                                    value: '5',
                                                    groupValue:
                                                        _goOut.toString(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _goOut =
                                                            int.parse(value!);
                                                      });
                                                    },
                                                  ),
                                                  Text('Very Often'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is your G1 grade?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '(0-20)',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return 'Age is required';
                                                  }
                                                  // You can add more complex validation for Age format if needed
                                                  return null;
                                                },
                                                onSaved: (String? value) {
                                                  _g1 = int.parse(value!);
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const Text(
                                                'What is your G2 grade?',
                                                style:
                                                    TextStyle(fontSize: 18.0),
                                              ),
                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '(0-20)',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return 'Age is required';
                                                  }
                                                  // You can add more complex validation for Age format if needed
                                                  return null;
                                                },
                                                onSaved: (String? value) {
                                                  _g2 = int.parse(value!);
                                                },
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          ElevatedButton(
                                            onPressed: () {
                                              _saveData();
                                            },
                                            child: Text('Submit'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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

  void _saveData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    Map<String, dynamic> nonNumericData = {
      "sex": _sex,
      "address": _address,
      "famsup": _famSup,
      "Mjob": _mJob,
      "Fjob": _fJob,
      "school": _school,
      "nursery": _nursery,
      "Pstatus": _pStatus,
      "guardian": _guardian,
      "famsize": _famSize,
      "schoolsup": _schoolSup,
      "reason": _reason,
      "higher": _higher,
      "internet": _internet,
      "romantic": _romantic
    };

    Map<String, dynamic> dataDecode =
        await encodeNonNumericData(nonNumericData);
    Map<String, dynamic> theRestOfData = {
      "age": _age,
      "Medu": _mEdu,
      "Fedu": _fEdu,
      "traveltime": _travelTime,
      "studytime": _studyTime,
      "failures": _failures,
      "goout": _goOut,
      "G1": _g1,
      "G2": _g2,
    };
    //theRestOfData.addEntries(dataDecode.entries);
    dataDecode.addEntries(theRestOfData.entries);
    print("dataDecode:");
    print(dataDecode);

    var api = await Api.create();
    await api.sendRequest(dataDecode);
  }

  Future<Map<String, dynamic>> encodeNonNumericData(
      Map<String, dynamic> inputMap) async {
    var api = await Api.create();

    var encodedVals = api.reverseEnc;
    //print("endcodedVals");
    //print(encodedVals);
    Map<String, dynamic> dataDecode = {};
    for (var dataVal in inputMap.entries) {
      var key = dataVal.key;
      var value = dataVal.value;
      var valueDecoded = encodedVals[key]![value];
      dataDecode[key] = valueDecoded;

      print("${key}: $valueDecoded");
    }
    return dataDecode;
  }
}
