import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.placeholder = 'Введите',
    this.suffix,
    this.controller,
  }) : super(key: key);

  final String placeholder;
  final Widget? suffix;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      suffix: suffix,
    );
  }
}
