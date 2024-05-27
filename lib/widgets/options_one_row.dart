import 'package:flutter/material.dart';

import '../models/option.dart';

class OptionsOneRow extends StatefulWidget {
  String groupValue;

  final String question;
  final List<Option> options;
  final ValueChanged<String> onChanged;

  OptionsOneRow({
    super.key,
    required this.groupValue,
    required this.question,
    required this.options,
    required this.onChanged,
  });

  @override
  State<OptionsOneRow> createState() => _OptionsOneRowState();
}

class _OptionsOneRowState extends State<OptionsOneRow> {
  @override
  Widget build(BuildContext context) {
    List<Widget> finalList = [];
    List optionsList = widget.options
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
