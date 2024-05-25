import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mlbasic/models/option.dart';
import 'package:mlbasic/screens/options_one_row.dart';
import 'package:mlbasic/screens/results_page.dart';
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
                                          OptionsOneRow(
                                            question:
                                                "Which School Do you Go To?",
                                            options: const [
                                              Option(text: "GP", value: "GP"),
                                              Option(text: "MS", value: "MS"),
                                            ],
                                            groupValue: _school,
                                          ),
                                          OptionsOneRow(
                                            question: 'What is you Gender?',
                                            options: const [
                                              Option(
                                                  text: "Female", value: "F"),
                                              Option(text: "Male", value: "M"),
                                            ],
                                            groupValue: _sex,
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
                                          OptionsOneRow(
                                            question: "Where do you live",
                                            options: const [
                                              Option(text: "City", value: "U"),
                                              Option(
                                                  text: "CountrySide",
                                                  value: "R"),
                                            ],
                                            groupValue: _address,
                                          ),
                                          OptionsOneRow(
                                            question:
                                                'What is the size of your Family?',
                                            options: const [
                                              Option(
                                                text: '3 and below',
                                                value: 'LE3',
                                              ),
                                              Option(
                                                  text: 'More than 3',
                                                  value: "GT3"),
                                            ],
                                            groupValue: _famSize,
                                          ),

                                          OptionsOneRow(
                                            question:
                                                'Do you live with your parents or away from them?',
                                            options: const [
                                              Option(
                                                text: 'Away',
                                                value: 'A',
                                              ),
                                              Option(
                                                  text: 'Together', value: "T"),
                                            ],
                                            groupValue: _pStatus,
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
                                                  const Text('None'),
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
                                                  const Text('4th grade'),
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
                                                  const Text('5-9th Grade'),
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
                                                  const Text('Secondary'),
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
                                                  const Text('None'),
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
                                                  const Text('4th grade'),
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
                                                  const Text('5-9th Grade'),
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
                                                  const Text('Secondary'),
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
                                                  const Text('housewife'),
                                                  Radio(
                                                    value: 'health',
                                                    groupValue: _mJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('health'),
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
                                                  const Text('Services'),
                                                  Radio(
                                                    value: 'teacher',
                                                    groupValue: _mJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Teacher'),
                                                  Radio(
                                                    value: 'other',
                                                    groupValue: _mJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _mJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Other'),
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
                                                  const Text('Stay-at-home'),
                                                  Radio(
                                                    value: 'health',
                                                    groupValue: _fJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Health'),
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
                                                  const Text('Services'),
                                                  Radio(
                                                    value: 'teacher',
                                                    groupValue: _fJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Teacher'),
                                                  Radio(
                                                    value: 'other',
                                                    groupValue: _fJob,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _fJob = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Other'),
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
                                                  const Text('The Course'),
                                                  Radio(
                                                    value: 'home',
                                                    groupValue: _reason,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _reason = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Close to Home'),
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
                                                  const Text('Reputation'),
                                                  Radio(
                                                    value: 'other',
                                                    groupValue: _reason,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _reason = value!;
                                                      });
                                                    },
                                                  ),
                                                  const Text('Other'),
                                                ],
                                              ),
                                            ],
                                          ),

                                          OptionsOneRow(
                                            question: "Who is your Guardian?",
                                            options: const [
                                              Option(
                                                  text: "Mother",
                                                  value: "mother"),
                                              Option(
                                                  text: "Father",
                                                  value: "father"),
                                              Option(
                                                  text: "Other",
                                                  value: "other"),
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
                                                  const Text('<15 min'),
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
                                                  const Text('15 - 30 min'),
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
                                                  const Text('30min to 1hr'),
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
                                                  const Text('>1hr'),
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
                                                  const Text('<2 hr'),
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
                                                  const Text('2-5 hr'),
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
                                                  const Text('5-10 hr'),
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
                                                  const Text('>10 hr'),
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
                                          OptionsOneRow(
                                            question:
                                                "Do you get extra educational support",
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _schoolSup,
                                          ),
                                          OptionsOneRow(
                                            question:
                                                'Does your family provide you educatonal support?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _famSup,
                                          ),

                                          OptionsOneRow(
                                            question:
                                                'Have You Attended Nursery?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _nursery,
                                          ),

                                          OptionsOneRow(
                                            question:
                                                'Do you want to take higher education?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _higher,
                                          ),
                                          OptionsOneRow(
                                            question:
                                                'Are You Engaged in Romantic Relationship?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _romantic,
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
                                                  const Text('Very Rarely'),
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
                                                  const Text('Rarely'),
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
                                                  const Text('Sometimes'),
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
                                                  const Text('Often'),
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
                                                  const Text('Very Often'),
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
                                            child: const Text('Submit'),
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

      print("$key: $valueDecoded");
    }
    return dataDecode;
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
      "age": int.parse(_age),
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
    double pred = await api.sendRequest(dataDecode);

    if (mounted) {
      navigateTo(context, ResultsPage(prediction: pred));
    }
  }
}
