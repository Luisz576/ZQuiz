import 'package:flutter/material.dart';
import 'package:zquiz/interactor/vo/value_object.dart';

class NumberInput extends StatelessWidget {
  final String label, hintText;
  final ValueObject<int> valueObject;
  const NumberInput({
     required this.valueObject,
      required this.label,
      required this.hintText,
      super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
