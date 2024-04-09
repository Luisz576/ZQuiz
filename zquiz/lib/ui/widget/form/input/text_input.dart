import 'package:flutter/material.dart';
import 'package:zquiz/interactor/vo/value_object.dart';
import 'package:zquiz/ui/theme/zquiz_colors.dart';

class TextInput extends StatelessWidget {
  final String label, hintText;
  final ValueObject<String> valueObject;

  const TextInput({
    required this.valueObject,
    required this.label,
    required this.hintText,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: valueObject.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: valueObject.validator,
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
