import 'package:flutter/material.dart';

import '../models/option.dart';

class OptionsOneRow extends StatefulWidget {
  String groupValue;

  final String question;
  final List<Option> options;
  OptionsOneRow({
    super.key,
    this.groupValue = '',
    required this.question,
    required this.options,
  });

  @override
  State<OptionsOneRow> createState() => _OptionsOneRowState();
}

class _OptionsOneRowState extends State<OptionsOneRow> {
  @override
  Widget build(BuildContext context) {
    List optionsList = widget.options
        .map(
          (option) => Radio(
            value: option.value,
            groupValue: widget.groupValue,
            onChanged: (String? value) {
              setState(() {
                widget.groupValue = value!;
              });
            },
          ),
        )
        .toList();

    List<Widget> finalList = [];
    for (int i = 0; i < widget.options.length; i++) {
      finalList.add(optionsList[i]);
      finalList.add(Text(widget.options[i].text));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.question,
          style: const TextStyle(fontSize: 18.0),
        ),
        Row(children: finalList),
      ],
    );
  }
}
