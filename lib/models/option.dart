class Option {
  const Option({
    required this.text,
    required this.value,
  });

  final String text, value;

  factory Option.fromMap(Map<String, dynamic> json) {
    return Option(
      text: json['text'],
      value: json['value'],
    );
  }
}
