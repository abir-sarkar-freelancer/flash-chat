import 'package:flutter/material.dart';
import '../constants.dart';

typedef CallBackFunc = void Function(String value);

class CommonTextField extends StatelessWidget {
  final CallBackFunc callBack;
  final String fieldHint;
  final TextInputType inputType;
  final bool isObscure;
  const CommonTextField({
    Key? key,
    required this.callBack,
    required this.fieldHint,
    required this.inputType,
    required this.isObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      keyboardType: inputType,
      style: const TextStyle(color: Colors.black),
      onChanged: callBack,
      decoration: kTextFieldInputStyle.copyWith(hintText: fieldHint),
    );
  }
}
