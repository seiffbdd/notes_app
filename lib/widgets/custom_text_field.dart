import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText = '',
    required this.controller,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
  });
  final String hintText;
  final TextEditingController controller;
  final int maxLines;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      textInputAction: textInputAction,
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 247, 255),
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 247, 255),
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
