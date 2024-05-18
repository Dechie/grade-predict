import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mlbasic/screens/secondpage.dart';
import 'package:mlbasic/widgets/text_widget.dart';

import '../utils.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '', _email = '', _gender = '';
  String _famSup = '', _address = '', _sex = '';
  String _mJob = '', _fJob = '', _school = '', _nursery = '';
  String _pStatus = '', _guardian = '', _famSize = '', _schoolSup = '';
  String _reason = '', _higher = '', _internet = '', _romantic = '';
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
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Name'),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Name is required';
                                            }
                                            return null;
                                          },
                                          onSaved: (String? value) {
                                            _name = value!;
                                          },
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Email'),
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Email is required';
                                            }
                                            // You can add more complex validation for email format if needed
                                            return null;
                                          },
                                          onSaved: (String? value) {
                                            _email = value!;
                                          },
                                        ),
                                        const SizedBox(height: 10),
                                        // Sex
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text(
                                              'Sex',
                                              style: TextStyle(fontSize: 18.0),
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

// Address
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text(
                                              'Address',
                                              style: TextStyle(fontSize: 18.0),
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

// FamSup
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Family Support',
                                              style: TextStyle(fontSize: 18.0),
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

// FamSup

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text(
                                              'What is your mother\'s job?',
                                              style: TextStyle(fontSize: 18.0),
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
                                            const SizedBox(height: 10),
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
                                              style: TextStyle(fontSize: 18.0),
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
                                            const SizedBox(height: 10),
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

// Repeat the structure
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Which School Do You Go To?',
                                              style: TextStyle(fontSize: 18.0),
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
                                            Text(
                                              'Have You Attended Nursery?',
                                              style: TextStyle(fontSize: 18.0),
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

// Address
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'What is your parents\' status? (Pstatus)',
                                              style: TextStyle(fontSize: 18.0),
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
                                                Text('A'),
                                                Radio(
                                                  value: 'T',
                                                  groupValue: _pStatus,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      _pStatus = value!;
                                                    });
                                                  },
                                                ),
                                                Text('T'),
                                              ],
                                            ),
                                          ],
                                        ),

// FamSup

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Who is Your Guardian?',
                                              style: TextStyle(fontSize: 18.0),
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
                                            Text(
                                              'What is the size of your Family?',
                                              style: TextStyle(fontSize: 18.0),
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const Text(
                                              'Does Your School Support You?',
                                              style: TextStyle(fontSize: 18.0),
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
                                            const Text(
                                              'What is your reason to join this school?',
                                              style: TextStyle(fontSize: 18.0),
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
                                                Text('Home?'),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
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
                                            const Text(
                                              'Higher?',
                                              style: TextStyle(fontSize: 18.0),
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
                                              style: TextStyle(fontSize: 18.0),
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
                                              style: TextStyle(fontSize: 18.0),
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
                                        const SizedBox(height: 15),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (!_formKey.currentState!
                                                .validate()) {
                                              return;
                                            }
                                            _formKey.currentState!.save();

                                            // Here you can process the form data
                                            print('Name: $_name');
                                            print('Email: $_email');
                                            print('Gender: $_gender');
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
    );
  }
}
