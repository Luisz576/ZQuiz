import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zquiz/interactor/vo/value_object.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';

class TextInput extends StatelessWidget {
  final String label, hintText;
  final bool isDigit;
  final ValueObject valueObject;

  const TextInput({
    required this.valueObject,
    required this.label,
    required this.hintText,
    this.isDigit = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isDigit ? TextInputType.number : TextInputType.text,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      initialValue: valueObject.value.toString(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (v) => valueObject.validator(
        isDigit ? v as Int : v
      ),
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ZQuizColors.primaryColor
          )
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ZQuizColors.errorColor
          )
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ZQuizColors.blackColor
          )
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: ZQuizColors.blackColor.withAlpha(160)
        )
      ),
    );
  }
}
