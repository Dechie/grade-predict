import 'package:flutter/material.dart';

import '../models/option.dart';

class OptionsTwoRows extends StatefulWidget {
  String groupValue;

  final String question;
  final List<Option> optionsR1;
  final List<Option> optionsR2;
  final ValueChanged<String> onChanged;
  OptionsTwoRows({
    super.key,
    required this.groupValue,
    required this.question,
    required this.optionsR1,
    required this.optionsR2,
    required this.onChanged,
  });

  @override
  State<OptionsTwoRows> createState() => _OptionsTwoRowsState();
}

class _OptionsTwoRowsState extends State<OptionsTwoRows> {
  @override
  Widget build(BuildContext context) {
    List<Widget> finalList1 = [];
    List<Widget> finalList2 = [];
    List optionsList1 = widget.optionsR1
        .map(
          (option) => Radio(
            value: option.value,
            groupValue: widget.groupValue,
            onChanged: (String? value) {
              // setState(() {
              //   widget.groupValue = value!;
              // });
              widget.onChanged(value!);
            },
          ),
        )
        .toList();

    for (int i = 0; i < widget.optionsR1.length; i++) {
      finalList1.add(optionsList1[i]);
      finalList1.add(Text(widget.optionsR1[i].text));
    }
    List optionsList2 = widget.optionsR2
        .map(
          (option) => Radio(
            value: option.value,
            groupValue: widget.groupValue,
            onChanged: (String? value) {
              // setState(() {
              //   widget.groupValue = value!;
              // });
              widget.onChanged(value!);
            },
          ),
        )
        .toList();

    for (int i = 0; i < widget.optionsR2.length; i++) {
      finalList2.add(optionsList2[i]);
      finalList2.add(Text(widget.optionsR2[i].text));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.question,
          style: const TextStyle(fontSize: 18.0),
        ),
        Row(children: finalList1),
        Row(children: finalList2),
      ],
    );
  }
}
