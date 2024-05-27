import 'package:flutter/material.dart';

import '../models/option.dart';

class OptionsTwoRowsNumeric extends StatefulWidget {
  int groupValue;

  final String question;
  bool specialCase;
  final List<Option> optionsR1;
  final List<Option> optionsR2;
  final ValueChanged<String> onChanged;

  OptionsTwoRowsNumeric({
    super.key,
    required this.groupValue,
    this.specialCase = false,
    required this.question,
    required this.optionsR1,
    required this.optionsR2,
    required this.onChanged,
  });

  @override
  State<OptionsTwoRowsNumeric> createState() => _OptionsTwoRowsNumericState();
}

class _OptionsTwoRowsNumericState extends State<OptionsTwoRowsNumeric> {
  @override
  Widget build(BuildContext context) {
    List<Widget> finalList1 = [];
    List<Widget> finalList2 = [];

    List optionsList1 = widget.optionsR1
        .map(
          (option) => Radio(
            value: option.value,
            groupValue: widget.groupValue.toString(),
            onChanged: (String? value) {
              setState(() {
                widget.groupValue = int.parse(value!);
                widget.onChanged(value);
              });
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
            groupValue: widget.groupValue.toString(),
            onChanged: (String? value) {
              setState(() {
                widget.groupValue = int.parse(value!);
                widget.onChanged(value);
              });
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
        Row(
          children: widget.specialCase
              ? [
                  finalList2[0],
                  finalList2[1],
                  finalList2[2],
                  finalList2[3],
                ]
              : finalList2,
        ),
        if (widget.specialCase)
          Row(
            children: [
              finalList2[4],
              finalList2.last,
            ],
          ),
      ],
    );
  }
}
