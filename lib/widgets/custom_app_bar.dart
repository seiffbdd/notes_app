import 'package:flutter/material.dart';
import 'package:notes_app2/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Notes',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        InkWell(
          onTap: () {},
          child: const CustomSearchIcon(),
        )
      ],
    );
  }
}
