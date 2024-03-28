import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CenteredText({
    required this.text,
    this.style,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
        style: style,
      ),
    );
  }
}
