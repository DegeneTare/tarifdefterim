import 'package:flutter/material.dart';

class textWidget extends StatelessWidget {
  final String text;
  final double textFontSize;
  final Color? textCalor;

  const textWidget({
    Key? key,
    required this.textFontSize,
    this.textCalor,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            fontSize: textFontSize,
            color: textCalor,
          ),
    );
  }
}
