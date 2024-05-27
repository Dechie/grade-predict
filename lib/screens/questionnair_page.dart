import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mlbasic/models/option.dart';
import 'package:mlbasic/screens/results_page.dart';
import 'package:mlbasic/widgets/options_one_row.dart';
import 'package:mlbasic/widgets/options_two_rows.dart';
import 'package:mlbasic/widgets/options_two_rows_numeric.dart';
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 80,
                                  width: 50,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  height: double.infinity,
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
                              ],
                            ),
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
                                            onChanged: _updateElement("school"),
                                          ),
                                          OptionsOneRow(
                                            question: 'What is you Gender?',
                                            options: const [
                                              Option(
                                                  text: "Female", value: "F"),
                                              Option(text: "Male", value: "M"),
                                            ],
                                            groupValue: _sex,
                                            onChanged: _updateElement("sex"),
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
                                            onChanged:
                                                _updateElement("address"),
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
                                            onChanged:
                                                _updateElement("famSize"),
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
                                            onChanged:
                                                _updateElement("pStatus"),
                                          ),
                                          OptionsTwoRowsNumeric(
                                            question:
                                                'What is your Mother\'s educational level?',
                                            optionsR1: const [
                                              Option(
                                                text: "None",
                                                value: "0",
                                              ),
                                              Option(
                                                  text: "4th Grade",
                                                  value: "1"),
                                            ],
                                            optionsR2: const [
                                              Option(
                                                text: "5-9th Grade",
                                                value: "2",
                                              ),
                                              Option(
                                                text: "Secondary",
                                                value: "3",
                                              )
                                            ],
                                            groupValue: _mEdu,
                                            onChanged: _updateElement("mEdu"),
                                          ),
                                          OptionsTwoRowsNumeric(
                                            question:
                                                'What is your Father\'s educational level?',
                                            optionsR1: const [
                                              Option(
                                                text: "None",
                                                value: "0",
                                              ),
                                              Option(
                                                  text: "4th Grade",
                                                  value: "1"),
                                            ],
                                            optionsR2: const [
                                              Option(
                                                text: "5-9th Grade",
                                                value: "2",
                                              ),
                                              Option(
                                                text: "Secondary",
                                                value: "3",
                                              )
                                            ],
                                            groupValue: _fEdu,
                                            onChanged: _updateElement("fEdu"),
                                          ),

                                          OptionsTwoRows(
                                            question:
                                                "What is your Mother's job?",
                                            optionsR1: const [
                                              Option(
                                                value: "at_home",
                                                text: "Stay-At-Home",
                                              ),
                                              Option(
                                                value: "health",
                                                text: "Health",
                                              ),
                                            ],
                                            optionsR2: const [
                                              Option(
                                                value: "services",
                                                text: "Services",
                                              ),
                                              Option(
                                                value: "teacher",
                                                text: "Teacher",
                                              ),
                                              Option(
                                                value: "other",
                                                text: "Other",
                                              ),
                                            ],
                                            groupValue: _mJob,
                                            onChanged: _updateElement("mJob"),
                                          ),

                                          OptionsTwoRows(
                                            question:
                                                "What is your Father's job?",
                                            optionsR1: const [
                                              Option(
                                                value: "at_home",
                                                text: "Stay-At-Home",
                                              ),
                                              Option(
                                                value: "health",
                                                text: "Health",
                                              ),
                                            ],
                                            optionsR2: const [
                                              Option(
                                                value: "services",
                                                text: "Services",
                                              ),
                                              Option(
                                                value: "teacher",
                                                text: "Teacher",
                                              ),
                                              Option(
                                                value: "other",
                                                text: "Other",
                                              ),
                                            ],
                                            groupValue: _fJob,
                                            onChanged: _updateElement("fJob"),
                                          ),
                                          OptionsTwoRows(
                                            question:
                                                'What is your reason to join this school?',
                                            optionsR1: const [
                                              Option(
                                                value: "course",
                                                text: "The Course",
                                              ),
                                              Option(
                                                value: "home",
                                                text: "Close To Home",
                                              ),
                                            ],
                                            optionsR2: const [
                                              Option(
                                                value: "reputation",
                                                text: "Reputation",
                                              ),
                                              Option(
                                                value: "other",
                                                text: "Other",
                                              ),
                                            ],
                                            groupValue: _reason,
                                            onChanged: _updateElement("reason"),
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
                                            groupValue: _guardian,
                                            onChanged:
                                                _updateElement("guardian"),
                                          ),
                                          OptionsTwoRowsNumeric(
                                            question:
                                                'How long does it take you to travel from home to school?',
                                            optionsR1: const [
                                              Option(
                                                text: "<15 min",
                                                value: "1",
                                              ),
                                              Option(
                                                  text: "15-30 min",
                                                  value: "2"),
                                            ],
                                            optionsR2: const [
                                              Option(
                                                text: "30 min - 1 hr",
                                                value: "3",
                                              ),
                                              Option(
                                                text: ">1hr",
                                                value: "4",
                                              )
                                            ],
                                            groupValue: _travelTime,
                                            onChanged:
                                                _updateElement("travelTime"),
                                          ),

                                          OptionsTwoRowsNumeric(
                                            question:
                                                'How many hours do you study per week?',
                                            optionsR1: const [
                                              Option(
                                                text: "< 2 hr",
                                                value: "1",
                                              ),
                                              Option(
                                                text: "2-5 hr",
                                                value: "2",
                                              ),
                                            ],
                                            optionsR2: const [
                                              Option(
                                                text: "5 - 10 hr",
                                                value: "3",
                                              ),
                                              Option(
                                                text: ">10hr",
                                                value: "4",
                                              )
                                            ],
                                            groupValue: _studyTime,
                                            onChanged:
                                                _updateElement("studyTime"),
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
                                            onChanged:
                                                _updateElement("schoolSup"),
                                          ),
                                          OptionsOneRow(
                                            question:
                                                'Does your family provide you educatonal support?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _famSup,
                                            onChanged: _updateElement("famSup"),
                                          ),

                                          OptionsOneRow(
                                            question:
                                                'Have You Attended Nursery?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _nursery,
                                            onChanged:
                                                _updateElement("nursery"),
                                          ),

                                          OptionsOneRow(
                                            question:
                                                'Do you want to take higher education?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _higher,
                                            onChanged: _updateElement("higher"),
                                          ),
                                          OptionsOneRow(
                                            question:
                                                'Do you have internet access?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _internet,
                                            onChanged:
                                                _updateElement("internet"),
                                          ),
                                          OptionsOneRow(
                                            question:
                                                'Are You Engaged in Romantic Relationship?',
                                            options: const [
                                              Option(text: "Yes", value: "yes"),
                                              Option(text: "No", value: "no"),
                                            ],
                                            groupValue: _romantic,
                                            onChanged:
                                                _updateElement("romantic"),
                                          ),

                                          OptionsTwoRowsNumeric(
                                            question:
                                                'How often do you go out with friends?',
                                            specialCase: true,
                                            optionsR1: const [
                                              Option(
                                                text: "Very Rarely",
                                                value: "1",
                                              ),
                                              Option(
                                                text: "Rarely",
                                                value: "2",
                                              ),
                                            ],
                                            optionsR2: const [
                                              Option(
                                                text: "Sometimes",
                                                value: "3",
                                              ),
                                              Option(
                                                text: "Often",
                                                value: "4",
                                              ),
                                              Option(
                                                text: "Very Often",
                                                value: "5",
                                              )
                                            ],
                                            groupValue: _goOut,
                                            onChanged: _updateElement("goOut"),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _saveData();
                                        },
                                        child: const Text('Submit'),
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
    print("saved vals: $_sex, $_address $_famSup");
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

  ValueChanged<String> _updateElement(String key) {
    return (String value) {
      setState(() {
        switch (key) {
          case "sex":
            _sex = value;
            break;
          case "address":
            _address = value;
            break;
          case "mJob":
            _mJob = value;
            break;
          case "fJob":
            _fJob = value;
            break;
          case "famSup":
            _famSup = value;
            break;
          case "school":
            _school = value;
            break;
          case "nursery":
            _nursery = value;
            break;
          case "pStatus":
            _pStatus = value;
            break;
          case "guardian":
            _guardian = value;
            break;
          case "famSize":
            _famSize = value;
            break;
          case "schoolSup":
            _schoolSup = value;
            break;
          case "reason":
            _reason = value;
            break;
          case "higher":
            _higher = value;
            break;
          case "internet":
            _internet = value;
            break;
          case "romantic":
            _romantic = value;
            break;
          case "mEdu":
            _mEdu = int.parse(value);
            break;
          case "fEdu":
            _fEdu = int.parse(value);
            break;
          case "travelTime":
            _travelTime = int.parse(value);
            break;
          case "studyTime":
            _studyTime = int.parse(value);
            break;
          case "goOut":
            _goOut = int.parse(value);
            break;
        }
      });
    };
  }
}
