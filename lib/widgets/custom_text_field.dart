import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText = '',
    required this.controller,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.autoFocus = false,
    this.validator,
  });
  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      textInputAction: textInputAction,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 247, 255),
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 2, 139, 144),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white.withOpacity(.8))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white.withOpacity(.8)))),
    );
  }
}
