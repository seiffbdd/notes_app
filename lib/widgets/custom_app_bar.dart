import 'package:flutter/material.dart';
import 'package:notes_app2/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        InkWell(
          onTap: () {},
          child: CustomIcon(
            icon: icon,
          ),
        )
      ],
    );
  }
}
