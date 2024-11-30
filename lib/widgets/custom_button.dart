import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: const Color.fromARGB(255, 0, 247, 255),
      minWidth: MediaQuery.of(context).size.width,
      onPressed: onPressed ?? () {},
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.black, fontSize: 25),
      ),
    );
  }
}
