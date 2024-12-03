import 'package:flutter/material.dart';
import 'package:notes_app2/constants.dart';
import 'package:notes_app2/cubits/add_notes_cubit/cubit/add_note_cubit.dart';
import 'package:notes_app2/widgets/custom_circle_avatar.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int pickedIndex = 0;
  @override
  Widget build(BuildContext context) {
    AddNoteCubit.get(context).color = colors[pickedIndex];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pickedIndex = index;
                });
              },
              child: CustomCircleAvatar(
                  isPicked: pickedIndex == index, color: colors[index]),
            ));
      },
    );
  }
}
