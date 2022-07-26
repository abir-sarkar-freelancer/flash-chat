import 'package:flutter/material.dart';

class CommonMaterialButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final VoidCallback btnCallBack;
  const CommonMaterialButton({
    Key? key,
    required this.btnText,
    required this.btnCallBack,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: btnColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(
          30.0,
        ),
      ),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: btnCallBack,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          btnText,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
