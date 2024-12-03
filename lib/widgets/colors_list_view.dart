import 'package:flutter/material.dart';
import 'package:notes_app2/cubits/add_notes_cubit/cubit/add_note_cubit.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});
  static const List<Color> colors = [
    Color(0xff003049),
    Color(0xffD62828),
    Color(0xffF77F00),
    Color(0xffFCBF49)
  ];

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int pickedIndex = 0;
  @override
  Widget build(BuildContext context) {
    AddNoteCubit.get(context).color = ColorsListView.colors[pickedIndex];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ColorsListView.colors.length,
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
                  isPicked: pickedIndex == index,
                  color: ColorsListView.colors[index]),
            ));
      },
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {super.key, required this.isPicked, required this.color});
  final bool isPicked;
  final Color color;
  @override
  Widget build(BuildContext context) {
    if (isPicked) {
      return CircleAvatar(
        radius: 38,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: color,
        ),
      );
    } else {
      return CircleAvatar(
        radius: 34,
        backgroundColor: color,
      );
    }
  }
}
